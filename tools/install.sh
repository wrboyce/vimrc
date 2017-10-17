#!/bin/sh

if [ -d ~/.vim ] || [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    echo "Previous vim config found at ~/.vim/ or ~/.vimrc! Bailing..." >&2
    exit 1
fi

echo "Cloning repo..."
git clone --recursive https://github.com/wrboyce/vimrc.git ~/.vim

echo "Installing config..."
ln -s ~/.vim/vimrc ~/.vimrc

echo "Done"
exit 0
