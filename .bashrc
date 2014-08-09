# .bashrc

# Source global definitions
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
if [ $(id -u) -eq 0 ];
then
    export PS1='\[\e[0;32m\][\[\e[m\][\@]:\[\e[0;31m\]\u\[\e[m\]@\h \[\e[1;34m\]\w\[\e[m\]\[\e[0;32m\]]\[\e[m\]\$ \[\e[0;31m\]'
else
    export PS1='\[\e[0;32m\][\[\e[m\][\@]:\u@\h \[\e[1;34m\]\w\[\e[m\]\[\e[0;32m\]]\[\e[m\]\$ '
fi

#run razor mouse configurations:
$HOME/.mouse-options
