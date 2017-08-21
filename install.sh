#!/bin/sh
awesome=$(dpkg -s "awesome"|grep "installed")
vim=$(vim -h|grep "IMproved 8.0")
xbindkeys=$(dpkg -s "xbindkeys"|grep "installed")
xdotool=$(dpkg -s "xdotool"|grep "installed")
doublecmd=$(dpkg -s "doublecmd-gtk"|grep "installed")
chrome=$(google-chrome --version|grep "Google Chrome")
virtualbox=$(virtualbox --help|grep "Oracle VM VirtualBox Manager 5.1")

if [ "$awesome" = "" ]; then
    add-apt-repository ppa:klaus-vormweg/awesome
    apt- get update
    apt-get install awesome
fi


if [ "$vim" = "" ]; then
    add-apt-repository ppa:jonathonf/vim
    apt update
    apt install vim
fi

if [ "$chrome" = "" ]; then
    sudo apt-get install libxss1 libappindicator1 libindicator7
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome*.deb
fi

if [ "$doublecmd" = "" ]; then
    sudo add-apt-repository ppa:alexx2000/doublecmd
    sudo apt-get update
    sudo apt-get install doublecmd-gtk
fi

if [ "$virtualbox" = "" ]; then
    echo "deb http://download.virtualbox.org/virtualbox/debian xenial contrib" | sudo tee -a /etc/apt/sources.list
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install virtualbox-5.1
fi


gsettings set org.mate.terminal.global use-mnemonics false

xkbcomp -w 0 -I$HOME/dotfiles/xkb -R$HOME/dotfiles/xkb $HOME/dotfiles/xkb/xkbrc $DISPLAY




