#!/bin/bash

OS=$(lsb_release -si)
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
VER=$(lsb_release -sr)

if [ $OS == "Fedora" ]; then
    PKGM="yum"
    sudo $PKGM update vim-minimal
else
    PKGM="apt-get"
fi

#TODO: Make sure the computer has an online connection before starting the
# script

printf "> Initial Setup:\n"
while : ; do
    printf ">> Please enter the desired ssh key password\n:"
    read SSHPASS
    printf ">>> Your password is $SSHPASS , Is this correct?(y/n)\n:"
    read ANS
    [[ $ANS != "y" ]] || break
done

while : ; do
    printf "\n>> Please enter the desired ssh key email\n:"
    read SSHEMAIL
    if [[ $SSHEMAIL != *"@"* ]]; then
        printf ">>> Not a valid email!\n:"
        continue
    fi
    printf ">>> Your email is $SSHEMAIL , Is this correct?(y/n)\n:"
    read ANS
    [[ $ANS != "y" ]] || break
done



printf "\n> Beginning Installation Process!\n"
# Install all required packages
printf "\n>> Installing packages...\n"
sudo $PKGM -y install git vim brasero flash flash-plugin xclip gnome-tweak-tool\
    gtk-unico-engine gtk-murrine-engine google-chrome wget R

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
# TODO: setup fonts for vim airline

printf "\n>> Setting up ssh...\n"
if [ ! -f ~/.ssh/id_rsa ]; then
    printf ">>> Creating ssh keys...\n"
    ssh-keygen -t rsa -b 4096 -N "$SSHPASS" -f "~/.ssh/id_rsa" -q\
        -C "$SSHEMAIL"
    printf ">> Starting ssh-agent...\n"
    eval "$(ssh-agent -s)"
    printf ">>> Adding ssh-key to ssh-agent to manage...\n"
    ssh-add ~/.ssh/id_rsa
fi

printf "\n>> Grabbing repos from github...\n"
mkdir -p ~/Projects/
cd !$
cd

printf "\n>> Setting up jetbrains apps...\n"
printf "\n>> Setting up sublime...\n"
