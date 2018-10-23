CODE_HOME=$HOME/codez

function _alias() {
  echo "$1 \t\t=> $2"
  alias $1=$2
}

function _function() {
  echo "$(which $1)"
}

_alias 'rc'    "source $HOME/.zshrc"

function vim () {
  nohup mvim $1 $2 $3 > /dev/null
}
_function vim

_alias ll    'ls -la'
_alias ga    'git add -A .'
_alias gc    'git commit'
_alias gco   'git checkout'
_alias gps   'git push'
_alias gpl   'git pull --ff-only --stat'
_alias gpr   'git pull --rebase --stat'
_alias gdf   'git diff'
_alias gdfc  'git diff --cached'
_alias gl    'git log --graph --format=oneline'
_alias gs    'git status -v | less'
_alias gb    'git branch'
_alias grm   'git rm'
_alias gr    'git remote -v'

function gimme_port () {
  kill -9 $(lsof -i :$1 -Fp | sed -E 's/.([0-9]+)/\1/')
}
_function gimme_port

# For Python's virtualevn
function venv () {
  echo "$HOME/virtualenvs/$(basename $(pwd))"
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

function remove_node_bin_from_path () {
  path=("${(@)path:#$(npm bin)}")
}

function add_node_bin_to_path () {
  if [[ -a $(npm bin) ]]; then
    path=(
      $(npm bin)
      $path
    )
  fi
}

function cd () {
  remove_node_bin_from_path
  builtin cd $1
  auto_activate_venv
  add_node_bin_to_path
}
_function cd

_alias gps1 "git push --set-upstream origin HEAD"
function gnf () {
  git checkout $1 # dev branch
  git pull --ff-only
  git checkout -b $2 # feature branch
  git branch --edit-description
  git push --set-upstream origin HEAD
}
_function gnf
