#!/bin/sh

if [ -d ~/.vim ] || [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    echo "Previous vim config found at ~/.vim/ or ~/.vimrc! Bailing..." >&2
    exit
fi

echo "Cloning repo..."
/usr/bin/env git clone --recursive https://github.com/wrboyce/vimrc.git ~/.vim

echo "Installing config..."
ln -s ~/.vim/vimrc ~/.vimrc
