# Adapted from code found at <https://gist.github.com/1712320>.

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# GROUP_OPEN="%{$fg[blue]%}{%{$reset_color%}"
# GROUP_CLOSE="%{$fg[blue]%}}%{$reset_color%}"
GROUP_OPEN=""
GROUP_CLOSE=""

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±git%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ꜛNUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}ꜜNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"

NODE_PROMPT_SYMBOL="%{$fg_bold[green]%}⬢ node%{$reset_color%}"


# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$GROUP_OPEN$GIT_PROMPT_SYMBOL$(parse_git_state) %{$fg[yellow]%}[$(truncate_string ${git_where#(refs/heads/|tags/)} 8)]%{$reset_color%}$GROUP_CLOSE"
}

nvm_prompt_string() {
  if which nvm &> /dev/null; then
    echo "$GROUP_OPEN$NODE_PROMPT_SYMBOL $(nvm current)$GROUP_CLOSE"
  fi
}

# Set the right-hand prompt
RPS1='$(nvm_prompt_string) $(git_prompt_string)'
