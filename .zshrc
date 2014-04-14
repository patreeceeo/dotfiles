
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/usr/local/share/npm/bin
export JAVA_HOME=$(/usr/libexec/java_home)

PYTHONSTARTUP=~/.pythonrc.py
export PYTHONSTARTUP

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# local settings for this machine
source "$HOME/aliases.zsh"
[[ -s "$HOME/.zshrc_local" ]] && source "$HOME/.zshrc_local"

galileo-serve-component () {
	cd ~/codez/galileo-$1
	telescope serve -p $2
}

# Menu completion for kill command!
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

source ~/git-prompt.zsh
