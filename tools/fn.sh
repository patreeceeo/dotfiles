add_vim_sm () {
	git submodule add http://github.com/$1/$2.git .vim/bundle/$2
}
dotfile () {
	mv $1 dotfiles
	ln -s dotfiles/$1 $1
}
