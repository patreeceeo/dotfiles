#!/bin/sh

source list_files.sh

dotfiles=$(list_files)

for file in $dotfiles; do
  echo uninstalling $file
  rm -rf $HOME/$file
done



