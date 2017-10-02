ALIAS_SCORE=0
function alias_win() {
((ALIAS_SCORE = ALIAS_SCORE + 1))
}

CODE_HOME=$HOME/codez

function _alias() {
  echo "$1 \t\t=> $2"
  alias $1=$2
}

function _function() {
  echo "$(which $1)"
}

echo "Remember to use your aliases and functions!"

_alias valias 'vim ~/aliases.zsh'
_alias 'hs'    'history-stat'
_alias 'rc'    "source $HOME/.zshrc"

_alias Vim 'mvim -v'

function vim () {
  nohup mvim $1 $2 $3 > /dev/null
}
_function vim

_alias ll    'ls -la'
_alias g     'git status --verbose'
_alias ga    'git add -A .'
_alias gc    'git commit'
_alias gcre  'git commit -c HEAD --res'
_alias gco   'git checkout'
_alias gps   'git push'
_alias gpsu  'git push -u'
_alias gpl   'git pull --ff-only'
_alias gdf   'git diff'
_alias gdfc  'git diff --cached'
_alias glg   'git log --graph --format=oneline'
_alias gl    'git log'
_alias gy    'git clone'
_alias gs    'git status -v | less'
_alias gb    'git branch'
_alias grm   'git rm'
_alias gr    'git remote -v'
_alias grb   'git rebase'
_alias grbc  'git add -A && git rebase --continue'
_alias gbe   'git branch --edit-description'

function gnf () {
  git checkout development
  git pull --ff-only
  git checkout -b $1
  git branch --edit-description
  git push --set-upstream origin $1
}
_function gnf

function gcoo () {
  git checkout $1
  vim -S ~/Dropbox/$1.vim
}
_function gcoo


_alias bi   'bundle install'
_alias be   'bundle exec'
_alias bake 'bundle exec rake'
_alias beg  'bundle exec guard'

function r () {
  if [[ -e bin/rails ]]; then
    bin/rails $1 $2 $3 $4 $5 $6 $7 $8 $9
  else
    echo "Current directory is not the root of a Rails project"
  fi
}
_function r
function rk () {
  if [[ -e bin/rake ]]; then
    bin/rake $1 $2 $3 $4 $5 $6 $7 $8 $9
  else
    echo "Current directory is not the root of a Rails project"
  fi
}
_function rk
_alias rkdbm 'rk db:migrate'
function t () {
  if [[ -e bin/rails ]]; then
    rspec
  fi
}
_function t

_alias meteor 'noglob meteor'

function code () {
  cd "$CODE_HOME/$1"
  git status --verbose
}
_function code

function f. () {
  noglob find . -name $1 2>/dev/null
}
_function f.

function gr. () {
  noglob grep -r $1 .
}
_function gr.

function gr () {
  noglob grep -r $1 $2
}
_function gr

function gimme_port () {
  kill -9 $(lsof -i :$1 -Fp | sed -E 's/.([0-9]+)/\1/')
}
_function gimme_port

# For Python's virtualevn
function venv () {
  echo "$HOME/.virtualenvs/$(basename $(pwd))"
}
_function venv

function witch () { 
  ll $(which $1) 
}

function is_function () {
  declare -f $1 > /dev/null;
  if [[ $? = "0" ]]; then echo "yes"; else echo ""; fi
}

function auto_activate_venv () {
  if [[ -a $(venv) ]]; then
    source $(venv)/bin/activate
  else
    if [[ -n $(is_function deactivate) ]]; then
      deactivate
    fi
  fi
}

function cd () {
  builtin cd $1
  auto_activate_venv
}

_alias gps1 "git push --set-upstream origin HEAD"
