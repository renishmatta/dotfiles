# .bashrc

# Source global definitions
export TERM="xterm-256color"

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors when using ls
alias ls='ls --color=auto'

# Displays a fortune in cowsay using a random cow
# $HOME/randomcow

# Change the PS1
export PS1='[\u@\h \w]\n\$ '

#run razor mouse configurations:
$HOME/.mouse-options

#cd ../
alias up='cd ../'

#setup external monitor
#xrandr -q | grep "VGA1 connected" > /dev/null
#if [$? -eq 0]; then
    xrandr --output LVDS1 --mode 1366x768
    xrandr --output VGA1 --mode 1280x1024 --right-of LVDS1
    #tmux new -s home
#fi

mesg y

#Make it so that we can use ctrl+s in vim
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
    # osx users, use stty -g
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}
