#!/bin/bash

# storage
alias df='df -h'
alias du='du -h'
alias free='free -m'

# permissions
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# safe file modification
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'

# etc
alias cls='clear'
alias clrs='clear'
alias x='exit'
alias q='exit'

# text editor
alias vi='vim'
alias svi='sudo vim'
alias svim='sudo vim'
alias ebrc='vim ~/.bashrc'
alias evrc='vim ~/.vimrc'
alias c='code'

# functions
cd() { cd $1 && ls; }
mkcd() { mkdir $1 && cd $1; }
trash() { gvfs-trash "$@" && ls; }
