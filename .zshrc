#
# Executes commands at the start of an interactive session.
#

source "$HOME/aliases.zsh"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  zstyle ':prezto:module:git:info' verbose 'yes'
fi


auto_activate_venv

export PATH="$HOME/.yarn/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

add_node_bin_to_path

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

style_white_on_magenta="\e[48;5;57m\e[97m"
style_black_on_aqua="\e[48;5;42m\e[30m"
style_reset="\e[0m"

echo $style_white_on_magenta
echo "                   "
echo " Ego is the enemy. "
echo "                   "
echo $style_reset
echo $style_black_on_aqua
echo "                          "
echo " The obstacle is the way. "
echo "                          "
echo $style_reset


source ~/dotfiles/git-prompt.zsh


### SSH Stuff ###

SSH_ENV="$HOME/.ssh/environment"

function start_ssh_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_ssh_agent;
     }
else
     start_ssh_agent;
fi
