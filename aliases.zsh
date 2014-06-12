ALIAS_SCORE=0
function alias_win() {
((ALIAS_SCORE = ALIAS_SCORE + 1))
}

CODE_HOME=$HOME/codez

function _alias() {
  echo "$1 \t\t=> $2"
  alias $1=$2
}

echo "Remember to use your aliases!"

_alias valias 'vim ~/aliases.zsh'
_alias 'hs'    'history-stat'
_alias 'rc'    "source $HOME/.zshrc"

_alias Vim 'mvim -v'

function vim () {
  nohup mvim $1 > /dev/null
}

_alias g     'git status --verbose'
_alias ga    'git add -A .'
_alias gc    'git commit'
_alias gcre  'git commit -c HEAD --res'
_alias gco   'git checkout'
_alias gps   'git push'
_alias gpl   'git pull'
_alias gdf   'git diff'
_alias gdfc  'git diff --cached'
_alias glg   'git log --graph --format=oneline'
_alias gl    'git log'
_alias gy    'git clone'
_alias gs    'git status -v | less'
_alias gb    'git branch'
_alias grm   'git rm'
_alias gr    'git remote -v'
_alias gx    'git reset --hard'

function gygh () {
  git clone "git://github.com/$1.git"
}

_alias bi   'bundle install'
_alias be   'bundle exec'
_alias bake 'bundle exec rake'
_alias beg  'bundle exec guard'

_alias code   "cd $CODE_HOME"

_alias meteor 'noglob meteor'

function f. () {
  find . -name $1 2>/dev/null
  alias_win
}

function gr. () {
  grep -r $1 .
  alias_win
}

function gr () {
  grep -r $1 $2
  alias_win
}

function gimme_port () {
  kill -9 $(lsof -i :$1 -Fp | sed -E 's/.([0-9]+)/\1/')
}
