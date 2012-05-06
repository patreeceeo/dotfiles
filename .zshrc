# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wedisagree"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*

# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow github bundler command-not-found compleat gem heroku lol python ruby rvm vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/.rvm/gems/ruby-1.8.7-p330@wxWindows/bin:$HOME/.rvm/gems/ruby-1.8.7-p330@global/bin:$HOME/.rvm/rubies/ruby-1.8.7-p330/bin:$HOME/.rvm/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

pyproj() {
    echo "Lets hack on some $1!"
    cd ~/.virtualenvs/couchstartup/
    source ~/.virtualenvs/$1/bin/activate
    cd ~/Projects/$1
}
alias ppcs="pyproj couchstartup"
alias ppeq="pyproj eventq.net"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*

PYTHONSTARTUP=~/.pythonrc.py
export PYTHONSTARTUP

# begin code thats only for my macbook
if [[ $(hostname) == "steve" ]] {
  alias vim="mvim -v"
}
