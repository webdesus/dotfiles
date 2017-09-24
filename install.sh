#!/bin/sh

rsync -rtv ~/dotfiles/root/ ~/

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim    
    vim +PlugInstall
fi




