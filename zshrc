# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

_load_settings() {
	_dir="$1"
	if [ -d "$_dir" ]; then
		for config in "$_dir"/**/*(N-.); do
			. $config
		done
	fi
}
_load_settings "$HOME/.dotfiles/.zsh"
