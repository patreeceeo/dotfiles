CODE_HOME=$HOME/codez

function _alias() {
  alias $1=$2
}

_alias 'rc'    "source $HOME/.zshrc"

function gvim () {
  nohup /Applications/VimR.app/Contents/MacOS/VimR $1 $2 $3 > /dev/null &
}

_alias ll    'ls -lA'
_alias jest  'jest && echo "\e[1mDid you mean \e[37;41mnpm test\e[m?"'

_alias ga    'git add -A .'
_alias gc    'git cz 2>/dev/null | git commit'
_alias gco   'command git checkout'
_alias gca   'git commit --amend'
_alias gps   'git push'
_alias gpl   'git pull --ff-only --stat'
_alias gpr   'git pull --rebase --stat'
_alias gdf   'git diff'
_alias gdfc  'git diff --cached'
_alias gl    'git log'
_alias gll   'git log --graph --format=oneline'
_alias gs    'git status -v | less'
_alias gb    'command git branch'
_alias grm   'command git rm'
_alias gr    'git remote -v'
_alias git   'hub'


function gimme_port () {
  kill -9 $(lsof -i :$1 -Fp | sed -E 's/.([0-9]+)/\1/')
}

function gq () {
  command git commit -m $1 --no-verify && gps1
}


function witch () {
  ll $(which $1)
}

function is_function () {
  declare -f $1 > /dev/null;
  if [[ $? = "0" ]]; then echo "yes"; else echo ""; fi
}

# For Python's virtualenv
function venv () {
  echo "$HOME/virtualenvs/$(basename $(pwd))"
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

# only enter a  Pipenv shell if there's a Pipfile and
# we're not already in one.
function auto_activate_pipenv () {
  if [[ (-a "$(pwd)/Pipfile") && $(is_function deactivate) == "" ]]; then
    pipenv shell
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

function install_pre_commit_hooks() {
  if [[ -a '.pre-commit-config.yaml' ]]; then
    pre-commit install && pre-commit run -a
  fi
}

function do_git_stuff() {
  num_behind=$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')
  if [[ -a '.git' && $num_behind -gt 0 ]]; then
    git pull --ff-only
  fi
}

function cd () {
  remove_node_bin_from_path
  builtin cd $1
  auto_activate_pipenv
  add_node_bin_to_path
  install_pre_commit_hooks
  do_git_stuff
}

_alias gps1 "git push --set-upstream origin HEAD"
function gnf () {
  git checkout $1 # dev branch
  git pull --ff-only
  git checkout -b $2 # feature branch
  git branch --edit-description
  git push --set-upstream origin HEAD
}


# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE="$GIT_STATE ${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}"
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE="$GIT_STATE ${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}"
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE="$GIT_STATE $GIT_PROMPT_MERGING"
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE="$GIT_STATE $GIT_PROMPT_UNTRACKED"
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE="$GIT_STATE $GIT_PROMPT_MODIFIED"
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE="$GIT_STATE $GIT_PROMPT_STAGED"
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_STATE"
  fi

}

truncate_string() {
  if [ ${#1} -gt $2 ]; then
    echo "${1[0,$2]}…"
  else
    echo $1
  fi
}

function jira_ticket() {
  open "https://jira.rallyhealth.com/browse/$1"
}

function test_engage() {
  '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' http://www.local.werally.in:3000 --disable-web-security --user-data-dir --incognito --disable-features=CrossSiteDocumentBlockingIfIsolating
}

# very Pink Panther specific
function workon() {
  cd ~/Code/pink-panther/

  add_node_bin_to_path

  ticket_id=$1
  config_js_path=app/scripts/app/config.js

  git checkout master

  if [[ $? -ne 0 ]]; then
    return
  fi

  git pull
  git checkout $ticket_id 2>/dev/null

  if [[ $? -ne 0 ]]; then
    git checkout -b $ticket_id
    vim $config_js_path
  else
    git checkout $ticket_id
    git merge master

    gimme_port 3000 2>/dev/null
    if [[ $? -eq 0 ]]; then
      rm -rf node_modules/.cache/hard-source
      echo "Reminder: restart server"
    fi

  fi

  git diff --exit-code $config_js_path
  if [[ $? -eq 0 ]]; then
    git apply ~/Code/patches/pink-panther-use-zerocats.patch
  fi
}
