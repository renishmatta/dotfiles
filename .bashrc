# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Displays a fortune in cowsay using a random cow
# $HOME/randomcow

# Change the PS1
if [ $(id -u) -eq 0 ];
then
    export PS1="[[\@]:\u@\h \w]# "
else
    export PS1="[[\@]:\u@\h \w]$ "
fi

#run razor mouse configurations:
$HOME/.mouse-options
