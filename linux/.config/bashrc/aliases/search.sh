#!/bin/bash

# ls
alias lsa='ls -Alp --color'
alias lst='ls -Alptr --color'
alias lsf='ls -Al | egrep -v '^d'' # Files only
alias lsd='ls -Al | egrep '^d''    # Directories only

alias ls='ls -Ap --color --group-directories-first'

# grep
alias stxt='grep -Hnri' # search text from a folder??

# filter network by port
# alias x='netstat -tupln  | grep'
