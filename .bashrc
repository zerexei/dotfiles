#
# ~/.bashrc
#
# TODO: Clean & improve
########

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# exports
export EDITOR=/usr/bin/vim
export TERM=xterm-256color

alias update='sudo pacman -Syu'
alias clean='sudo pacman -Sc'

# system aliases
source ~/.config/bashrc/aliases/base
source ~/.config/bashrc/aliases/navigation
source ~/.config/bashrc/aliases/search

# apps aliases
source ~/.config/bashrc/aliases/git
source ~/.config/bashrc/aliases/npm
source ~/.config/bashrc/aliases/laravel