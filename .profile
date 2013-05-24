# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

. "$HOME/.zshrc"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "/usr/local/git/bin" ] ; then
    PATH="/usr/local/git/bin:$PATH"
fi

#put /usr/local/lib in your LD_LIBRARY_PATH
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"

PYTHONSTARTUP=$HOME/.pythonrc.py

export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
