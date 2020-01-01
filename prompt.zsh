# Adapted from code found at <https://gist.github.com/1712320>.

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

NODE_ICON=$'\uf898'

node_bin_id() {
  path=$(npm bin)
  parts=($(echo $path | /usr/bin/sed 's/\// /g'))
  length=${#a[@]}
  echo $parts[-3]
}

node_prompt_string() {
  if which node &> /dev/null; then
    echo "%{$fg_bold[green]%}$NODE_ICON $(node --version)($(node_bin_id))%{$reset_color%}"
  fi
}

PYTHON_ICON=$'\ue235'

python_prompt_string() {
  if which python &> /dev/null; then
    python_script='import sys;print(sys.version)'
    version_string_array=($(python -c $python_script))
    echo "%{$fg_bold[blue]%}$PYTHON_ICON v$version_string_array[1]%{$reset_color%}"
  fi
}

# Set the right-hand prompt
ROUND_END=$'\uE0B4'
FLAME_END=$'\uE0C0'
CARET_RIGHT=$'\uE0B1'
NEW_LINE=$'\n'

function exit_code() {
  if [[ $? == 0 ]]; then
    echo "%{$bg[green]%}%{$fg[black]%}  ok  %{$reset_color%}%{$fg[green]%}$ROUND_END%{$reset_color%}"
  else
    echo "%{$bg[red]%}%{$fg[black]%}  $?  %{$reset_color%}%{$fg[red]%}$FLAME_END%{$reset_color%}"
  fi
}

PS1='$NEW_LINE$(exit_code) $(node_prompt_string) $(python_prompt_string) $NEW_LINE$CARET_RIGHT '

RPS1=''
