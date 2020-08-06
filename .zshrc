#
# Executes commands at the start of an interactive session.
#

source "$HOME/aliases.zsh"

auto_activate_venv

export PATH="$HOME/.yarn/bin:$PATH"

if [ -d "$HOME/Library/Python/3.7/bin" ]; then
  PATH="$HOME/Library/Python/3.7/bin:$PATH"
fi

if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
  mkdir $HOME/.zsh
  git clone git@github.com:zsh-users/zsh-autosuggestions.git $HOME/.zsh/zsh-autosuggestions
fi
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm use --lts

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

add_node_bin_to_path

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source ~/dotfiles/prompt.zsh


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
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_ssh_agent;
     }
else
     start_ssh_agent;
fi

export PATH="/usr/local/opt/sbt@0.13/bin:$PATH"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
