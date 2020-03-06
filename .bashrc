# .bashrc

HOSTNAME=$(hostname)
# Source global definitions
export TERM="xterm-256color"
#export PATH="$HOME/.linuxbrew/bin:$PATH"
#export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
#export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors when using ls
alias ls='ls --color=auto'

# Displays a fortune in cowsay using a random cow
# $HOME/randomcow

# Get git completion to work:
. $HOME/dotfiles/git-completion.bash
. $HOME/dotfiles/git-prompt.sh

# Change the PS1
#export PS1='\n[\u@\h \w]\n\$ '
#export PS1='\n[\u@\h \w\e[0;35m$(__git_ps1 " (%s)")\e[m]\n\$ '
#export PS1='\n\[\e[37;40m\][\[\e[m\]\[\e[35m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\] \[\e[33m\]\w\[\e[m\]\e[0;35m$(__git_ps1 " (%s)")\e[m]\n\$ '
# reference: https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
export PS1='\n[\[\e[92m\]\u\[\e[m\]@\[\e[94m\]\h\[\e[m\] \[\e[97m\]\w\[\e[m\]\e[0;93m$(__git_ps1 " (%s)")\e[m]\n\$ '

#run razor mouse configurations:
#$HOME/.mouse-options
#currently using razercfg


#setup external monitor
#xrandr -q | grep "VGA1 connected" > /dev/null
#if [$? -eq 0]; then
#    xrandr --output LVDS1 --mode 1366x768
#    xrandr --output VGA1 --mode 1280x1024 --right-of LVDS1
#    #tmux new -s home
#fi
#fi

#mesg y

#Make it so that we can use ctrl+s in vim
# No ttyctl, so we need to save and then restore terminal settings
#vim()
#{
#    # osx users, use stty -g
#    local STTYOPTS="$(stty --save)"
#    stty stop '' -ixoff
#    command vim "$@"
#    stty "$STTYOPTS"
#}

#alias vim="vim --servername VIM"

#git aliases
alias ga="git add"
alias gr="git remove"
alias gs="git status"
alias gc="git commit"
alias gb="git branch"
alias gpu="git push"
alias gpl="git pull"
alias gpuom="git push origin master"
alias gplom="git pull origin master"
alias sl="ls"
alias up='cd ../'
alias d="ls -halt"
alias pythone='python'
alias pythone3='python3'
alias p3="python3"

source /opt/ros/melodic/setup.bash
#source ~/Documents/Gatech/MM/catkin_ws/devel/setup.bash
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH


# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/rematta/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    \eval "$__conda_setup"
#else
#    if [ -f "/home/rematta/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/rematta/anaconda3/etc/profile.d/conda.sh"
#        CONDA_CHANGEPS1=false conda activate base
#    else
#        #\export PATH="/home/rematta/anaconda3/bin:$PATH"
#        \export PATH="$PATH:/home/rematta/anaconda3/bin"
#    fi
#fi
#unset __conda_setup
# <<< conda init <<<

export HISTTIMEFORMAT='%d/%m/%y %T :'


# Disables Software Flow Control feature which freezes vim when pressing ctrl+s
# refs: https://unix.stackexchange.com/questions/72086/ctrl-s-hang-terminal-emulator
#       https://superuser.com/questions/721544/vim-crashing-when-pressing-ctrl-s-in-terminal/721548
stty -ixon

