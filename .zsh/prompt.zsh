git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " %{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}"
  fi
}
setopt promptsubst

if [ $PS1 ]; then
	_PS1_OLD_=$PS1
fi

# override default prompt
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[yellow]%}%c%{$reset_color%}$(git_prompt_info) '
