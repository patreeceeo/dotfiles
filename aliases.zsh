ALIAS_SCORE=0
function alias_win() {
((ALIAS_SCORE = ALIAS_SCORE + 1))
}

function _alias() {
  alias $1=$2
}

_alias aliases 'vim ~/aliases.zsh'
_alias 'hs'    'history-stat'
_alias 'rc'    "source $HOME/.zshrc"

_alias Vim 'mvim -v'

function vim () {
  nohup mvim $1 > /dev/null
}

_alias g   'git status --verbose'
_alias ga  'git add .'
_alias gc  'git commit'
_alias gco 'git checkout'
_alias gps 'git push'
_alias gpl 'git pull'
_alias gdf 'git diff'
_alias glg 'git log --graph --format=oneline'
_alias gl  'git log'

_alias bi   'bundle install'
_alias be   'bundle exec'
_alias bake 'bundle exec rake'
_alias beg  'bundle exec guard'

_alias c      'cdr'
_alias code   'cd ~/codez/'
_alias cspui  'cd ~/codez/spui/spui-webapp/'
_alias cscrui 'cd ~/codez/scrui/scrui-webapp/'


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
