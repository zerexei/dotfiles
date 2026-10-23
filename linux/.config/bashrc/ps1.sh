#!/bin/bash

source ~/git-prompt.sh # update to git-prompt.sh location
export PS1='\[\e[38;5;240m\][\d \@] \[\e[35m\]\u@\h\[\e[37m\]: \[\e[33m\]\W \[\e[32m\]$(__git_ps1 " (%s)")\[\e[37m\]\n> \[\e[1;32m\]'

# py venv support
# export PS1='\[\e[38;5;37m\]$(if [[ -n "$VIRTUAL_ENV" ]]; then echo "($(basename "$VIRTUAL_ENV")) "; fi)\[\e[38;5;240m\][\d \@] \[\e[35m\]\u@\h\[\e[37m\]: \[\e[33m\]\W \[\e[32m\]$(__git_ps1 " (%s)")\[\e[37m\]\n> \[\e[1;32m\]'
