# MacVim doesn't load .zshrc so we have to source the rvm scripts in this file to use RVM with MacVim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # Load RVM into a shell session *as a function*
