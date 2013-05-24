alias tvim='mvim -v'
alias vim='nohup mvim'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/usr/local/share/npm/bin
export JAVA_HOME=$(/usr/libexec/java_home)

# pyproj() {
#     echo "Lets hack on some $1!"
#     cd ~/.virtualenvs/couchstartup/
#     source ~/.virtualenvs/$1/bin/activate
#     cd ~/Projects/$1
# }
# alias ppcs="pyproj couchstartup"
# alias ppeq="pyproj eventq.net"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*

PYTHONSTARTUP=~/.pythonrc.py
export PYTHONSTARTUP
# source /usr/bin/virtualenvwrapper.sh
# export WORKON_HOME=~/codez

# echo "0.) None"
# echo "1.) EventRay"
# echo "2.) Zen Graphs"
# echo "3.) Blog"
# echo -n "Which project? (1)"
# read n;
# if [[ $n != "0" ]]; then
#     if [[ $n == "3" ]]; then
#         proj_name=pzatrick_dot_com
#         workon hiero_env
#     elif [[ $n == "2" ]]; then
#         proj_name=zen-graphs-d3    
#     else
#         proj_name=eventray
#         workon eventray_env
#     fi
#     old_proj_name=$(cat $HOME/.proj_name)
#     echo $proj_name > $HOME/.proj_name


#     server=$(lsof -i :6543)
#     if [[ $server == "" || $proj_name != $old_proj_name ]]; then 
#         echo -n "Start Server? [Y/n]: "; read yn; 
#         if [[ $yn != "n" && $yn != "N" ]]; then 
#             if [[ $server != "" ]]; then
#                 kill -9 $(lsof -i :6543 -t)
#             fi
#             pserve $VIRTUAL_ENV/$proj_name/development.ini --reload; 
#         fi
#     else
#         echo $server
#         echo -n "Start Vim? [Y/n]: "; read yn;
#         if [[ $yn != "n" && $yn != "N" ]]; then
#             cd $VIRTUAL_ENV/$proj_name/$proj_name
#             vim 
#         fi
#     fi

#     alias cdve='cd $VIRTUAL_ENV/$proj_name'
# fi


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# local settings for this machine
[[ -s "$HOME/.zshrc_local" ]] && source "$HOME/.zshrc_local"

