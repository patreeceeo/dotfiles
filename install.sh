#!/bin/sh

dotfiles='
.config
.eslintrc.js
.gitconfig
.gitignore_global
.macos
.profile
.pythonrc.py
.rvmrc
.slate
.tmux.conf
.vim
.vimrc
.zpreztorc
.zprofile
.zshenv
.zshrc
'

function link_dotfile() { ln -s $1 $HOME/$(basename $1); }

for file in $dotfiles; do
  echo installing $file
  link_dotfile $file
done



