#!/bin/bash

OS=$(lsb_release -si)
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
VER=$(lsb_release -sr)

if [ "$OS" == "Fedora" ]; then
    PKGM="yum"
    sudo $PKGM update vim-minimal
else
    PKGM="apt-get"
fi

printf "> Checking if we are online...\n"
wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
    echo "We're Online!"
else
    echo "We're Offline :(.  Stopping script"
    exit 1
fi

printf "\n> Initial Setup:\n"
while : ; do
    printf ">> Please enter the desired ssh key password\n:"
    read SSHPASS
    printf ">>> Your password is $SSHPASS , Is this correct?(y/n)\n:"
    read ANS
    [[ "$ANS" == "y" ]] || break
done

while : ; do
    printf "\n>> Please enter the desired ssh key email\n:"
    read SSHEMAIL
    if [[ "$SSHEMAIL" != *"@"* || "$SSHEMAIL" == "" ]]; then
        printf ">>> Not a valid email!\n"
        continue
    fi
    printf ">>> Your email is $SSHEMAIL , Is this correct?(y/n)\n:"
    read ANS
    [[ "$ANS" == "y" ]] || break
done

while : ; do
    printf ">> Please enter the your github username\n:"
    read GITNAME
    if [[ "$GITNAME" == "" ]]; then
        printf ">>> Not a valid github username!\n"
        continue
    fi
    printf ">>> Your github username is $GITNAME , Is this correct?(y/n)\n:"
    read ANS
    [[ "$ANS" == "y" ]] || break
done

while : ; do
    printf ">> Please enter the your github password\n:"
    read GITPASS
    if [[ "$GITPASS" == "" ]]; then
        printf ">>> Not a valid github password!\n"
        continue
    fi
    printf ">>> Your github password is $GITPASS , Is this correct?(y/n)\n:"
    read ANS
    [[ "$ANS" == "y" ]] || break
done

while : ; do
    printf "\n>> Please enter the your github email\n:"
    read GITEMAIL
    if [[ "$GITEMAIL" != *"@"* ]]; then
        printf ">>> Not a valid email!\n:"
        continue
    fi
    printf ">>> Your email is $GITEMAIL , Is this correct?(y/n)\n:"
    read ANS
    [[ "$ANS" == "y" ]] || break
done



printf "\n> Beginning Installation Process!\n"
printf "\n>> Creating symlinks for configs...\n"
if [ -f ~/.vimrc ]; then
    mkdir -p ~/backup-configs
    cp ~/.vimrc ~/backup-configs/
fi
if [-f ~/.bashrc ]; then
    mkdir -p ~/backup-configs
    cp ~/.bashrc ~/backup-configs/
fi
if [-f ~/.tmux.conf ]; then
    mkdir -p ~/backup-configs
    cp ~/.tmux.conf ~/backup-configs/
fi
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
printf ">>> Backup configs are stored in ~/backup-configs\n"

# Install all required packages
printf "\n>> Installing packages...\n"
sudo $PKGM -y install git vim brasero flash flash-plugin xclip google-chrome \
    wget R
if [ "$DESKTOP_SESSION" == "gnome" ]; then
    sudo $PKGM -y install gnome-tweak-tool gtk-unico-engine gtk-murrine-engine
fi

printf ">> Creating vim directories...\n"
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/view
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/temp
mkdir -p ~/.vim/skeleton

printf "\n>> Setting up vim plugins...\n"
vim +PluginInstall +qall
mv ~/.vim/bundle/ir_black/colors/* ~/.vim/colors/

printf "\n>> Setting up vim airline fonts...\n"
source ~/.vim/bundle/powerline-fonts/install.sh

printf "\n>> Setting up ssh...\n"
#mkdir -p ~/.ssh/key_backup && mv ~/.ssh/id_rsa* ~/.ssh/key_backup
if [ ! -f ~/.ssh/id_rsa ]; then
    printf ">>> Creating ssh keys...\n"
    echo -e "\n\n\n" | ssh-keygen -t rsa -b 4096 -N "$SSHPASS" \
        -f "~/.ssh/id_rsa" -q -C "$SSHEMAIL"
    printf ">>> Starting ssh-agent...\n"
    eval "$(ssh-agent -s)"
    printf ">>> Adding ssh-key to ssh-agent to manage...\n"
    ssh-add ~/.ssh/id_rsa
fi

printf "\n>> Adding ssh key to github account...\n"
#source: https://gist.github.com/ccashwell/4042214
TOKEN=$(curl -u $GITNAME:$GITPASS --silent -d '{"scopes":["user"]}'\
    "https://api.github.com/authorizations" | grep -o '[0-9A-Fa-f]\{40\}')
SSHKEY=`cat ~/.ssh/id_rsa.pub`
curl -X POST -H "Content-type: application/json" \
    -d "{\"title\": \"$GITEMAIL\",\"key\": \"$SSHKEY\"}" \
    "https://api.github.com/user/keys?access_token=$TOKEN"

printf "\n>> Setting up gitconfig...\n"
git config --global user.name "$GITNAME"
git config --global user.email $GITEMAIL

printf "\n>> Grabbing repos from github...\n"
mkdir -p ~/Projects/
cd !$
    git clone git@github.com:rematta/Rutgers.git
cd

printf "\n> Turning off selinux...(you will need to enter sudo password)\n"
sudo echo 0 >/selinux/enforce

#printf "\n>> Setting up jetbrains apps...\n"
#printf "\n>> Setting up sublime...\n"

printf "\nDONE!  Now, get to work champ"
printf "\nBackup configs are stored in ~/backup-configs\n"
printf "\nMake sure to reboot the machine for the powerline-fonts to work in vim as well as change your font to a powerline font in the terminal"

