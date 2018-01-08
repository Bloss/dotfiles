#! /bin/zsh

_zshrc_=~/.dotfiles/zshrc
_vimrc_=~/.dotfiles/vimrc

__srczsh__() {
	mv $_zshrc_ ~/.zshrc
	source ~/.zshrc
}

__srcvimrc__() {
	mv $_vimrc_ ~/.vimrc
	source ~/.vimrc
}

__src__() {
	__srczsh__
	__srcvimrc__
}

if [ -d "$HOME/.dotfiles" ]; then
	__src__
fi