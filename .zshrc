#
# Executes commands at the start of an interactive session.
#


# auto_activate_venv

export PATH="$HOME/.yarn/bin:$PATH"

# if [ -d "$HOME/Library/Python/3.7/bin" ]; then
#   PATH="$HOME/Library/Python/3.7/bin:$PATH"
# fi

if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
  mkdir $HOME/.zsh
  git clone git@github.com:zsh-users/zsh-autosuggestions.git $HOME/.zsh/zsh-autosuggestions
fi
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# nvm use --lts

# # place this after nvm initialization!
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# add_node_bin_to_path

# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

if [ -f "$HOME/prompt.zsh" ]; then
  source "$HOME/prompt.zsh"
fi

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

# source $HOME/.asdf/completions/asdf.bash

function set_random_wallpaper () {
  random_wallpaper=$(find ~/Pictures/Wallpapers -type f | shuf -n 1)
  hsetroot -full $random_wallpaper
}
