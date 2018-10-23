#!/bin/sh

source list_files.sh

dotfiles=$(list_files)

function link_dotfile() { ln -s $HOME/dotfiles/$1 $HOME/$1; }

for file in $dotfiles; do
  echo installing $file
  link_dotfile $file
done



