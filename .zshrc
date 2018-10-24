#
# Executes commands at the start of an interactive session.
#

source "$HOME/aliases.zsh"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

auto_activate_venv

export PATH="$HOME/.yarn/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

style_white_on_magenta="\e[48;5;57m\e[97m"
style_black_on_aqua="\e[48;5;42m\e[30m"
style_reset="\e[0m"

echo $style_white_on_magenta
echo ""
echo " >>> Ego is the enemy."
echo $style_reset
echo ""
echo $style_black_on_aqua
echo ""
echo " >>> The obstacle is the way."
echo $style_reset
echo ""

