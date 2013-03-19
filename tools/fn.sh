add_vim_sm () {
	git submodule add http://github.com/$1/$2.git .vim/bundle/$2
}

dotfiles_push () {
	mv -iv $1 ~/dotfiles
	ln -siv ~/dotfiles/$1 ~/$1
}

dotfiles_pull () {
	ln -siv ~/dotfiles/$1 ~/$1
}

#dotfiles_install () {
#  for f in ~/dotfiles/\.* {
#    if [[ $f != '.git' && $f != '.gitignore' && $f != 'gitmodules' ]]; then
#      dotfiles_pull $f
#    fi
#  }
#}
