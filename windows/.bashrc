# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return ;;
esac

# History settings: avoid duplicates, append to history, and set history size
HISTCONTROL=ignoreboth    # Ignore duplicates and commands starting with space
shopt -s histappend       # Append to history file, don't overwrite
HISTSIZE=1000             # In-memory history size
HISTFILESIZE=2000         # Maximum history file size

# source ~/git-prompt.sh # update to git-prompt.sh location
PS1='\[\e[38;5;240m\][\d \@] \[\e[35m\]\u@\h\[\e[37m\]: \[\e[33m\]\W \[\e[32m\]$(__git_ps1 " (%s)")\[\e[37m\]\n> \[\e[1;32m\]'

if command -v dircolors &>/dev/null; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ──────────────────────────────
# Base
# ──────────────────────────────

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

# navigation
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

alias vi='vim'
alias v='vim'

# functions
cd() { cd $1 && ls; }
mkdircd() { mkdir $1 && cd $1; }
trash() { gvfs-trash "$@" && ls; }

# ──────────────────────────────
# Git
# ──────────────────────────────
alias ga='git add'
alias gc='git commit'
alias gg='git push'
alias ggg='git pull'

# time travel
alias nahh='git restore . && git clean -df'
alias ggb='git push -f origin HEAD^:master' # undo recent git push
alias gcb='git reset --soft HEAD~1'         # uncommit recent git commit

# Info
alias gs='git status -sb'
alias grf='git reflog'
alias gl='git log --pretty=format:"%C(yellow)%h %C(green)%d => %C(white)%s %C(italic dim white)-> [%cn] %C(cyan)- %cr"'
alias gll='git log --pretty=format:"%C(yellow)%h | %cs %C(green)%d => %C(white)%s %C(italic dim white)-> [%cn]"'

alias gd='git diff --color $1 | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

# filter by author
alias gllme='git log --pretty=format:"%C(yellow)%h | %cs %C(green)%d => %C(white)%s %C(italic dim white)-> [%cn]" --author "Angelo Arcillas"'

# Remote
alias gr='git remote'

# Commits
alias wip='git add -A && git commit -m ":zap: wip"' # add all -> commit -> push
alias gac='git add -A && git commit -m'             # add all -> commit -> set message
alias gca='git commit --amend'
alias gcaa='git commit --amend --no-edit'

# Branch
alias gb='git branch'
alias gsw='git switch'
alias gm='git merge --stat'

# ──────────────────────────────
# NPM
# ──────────────────────────────
alias npmr='npm run'

# ──────────────────────────────
# Laravel Artisan
# ──────────────────────────────
ARTISAN_PREFIX='sail'

# Base
alias ar='$ARTISAN_PREFIX artisan'
alias ars='ar serve'
alias art='ar tinker'

# Database
alias armi='ar migrate'
alias armin='ar migrate:install'
alias armf='ar migrate:fresh'
alias armfs='ar migrate:fresh --seed'
alias armr='ar migrate:rollback'
alias arms='ar migrate:status'

# Route
alias arr='ar route:list'

# ──────────────────────────────
# Python
# ──────────────────────────────
alias py='python3'
alias pyr='py -m'
alias pypi='pyr pip install'
