#!/bin/bash

OS=$(lsb_release -si)
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
VER=$(lsb_release -sr)

if [ OS == "Fedora" ]; then
    PKGM="yum"
    sudo $PKGM update vim-minimal
else
    PKGM="apt-get"
fi

# Install all required packages
printf "-->Installing packages...\n"
sudo $PKGM -y install git vim brasero flash flash-plugin xclip gnome-tweak-tool\
    gtk-unico-tool gtk-murrine-engine google-chrome wget R

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/view
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/temp
mkdir -p ~/.vim/skeleton
