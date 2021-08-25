# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#


export PATH="$HOME/.yarn/bin:$PATH"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HIST_SAVE_NO_DUPS=true
setopt appendhistory

if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
  mkdir $HOME/.zsh
  git clone git@github.com:zsh-users/zsh-autosuggestions.git $HOME/.zsh/zsh-autosuggestions
fi
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ -f "$HOME/aliases.zsh" ]; then
  source "$HOME/aliases.zsh"
fi

export EDITOR="nvim"

### One version manager for many programming languages!
source $HOME/.asdf/asdf.sh

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

export PATH=$PATH:$HOME/bin

source ~/.zplug/init.zsh
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
