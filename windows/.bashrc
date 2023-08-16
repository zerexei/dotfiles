###############################################r
# BASE
###############################################

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

# ls
alias lsa='ls -Alp --color'
alias lst='ls -Alptr --color'
alias lsf='ls -Al | egrep -v '^d'' # Files only
alias lsd='ls -Al | egrep '^d''    # Directories only
alias ls='ls -Ap --color --group-directories-first'

# grep
alias stxt='grep -Hnri' # search text from a folder??

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

alias cls='clear'
alias clrs='clear'
alias x='exit'
alias q='exit'

###############################################
# GIT
###############################################
alias gi='git init -b main'
alias ga='git add'
alias gc='git commit'
alias gg='git push'
alias ggg='git pull'

alias gf='git fetch'
alias gmf='git merge FETCH_HEAD'

# time travel
alias nahh='git restore . && git clean -df'
alias ggb='git push -f origin HEAD^:master' # undo recent git push
alias gcb='git reset --soft HEAD~1'         # uncommit recent git commit

# Info
alias gs='git status -sb'
alias grf='git reflog'
alias gl='git log --pretty=format:"%C(yellow)%h %C(green)%d => %C(white)%s %C(italic dim white)-> [%cn] %C(cyan)- %cr"'
alias gll='git log --pretty=format:"%C(yellow)%h | %cs %C(green)%d => %C(white)%s %C(italic dim white)-> [%cn]"'
alias gllme='git log --pretty=format:"%C(yellow)%h | %cs %C(green)%d => %C(white)%s %C(italic dim white)-> [%cn]" --author="Angelo Arcillas"'

# git log with branch visual
alias gbl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%n' --all"

# Remote
alias gr='git remote'
alias gra='git remote add'
alias grd='gir remote remove'

# Commits
alias wip='git add -A && git commit -m ":zap: wip"'
alias gac='git add -A && git commit -m'
alias gca='git commit --amend'
alias gcaa='git commit --amend --no-edit'

# Branch
alias gb='git branch'
alias gbd='git branch -d'
alias gbm='git branch -m'
alias gsw='git switch'
alias gm='git merge --stat'

# etc
alias gcp='git cherry-pick'
alias clean-merged='git branch --merged | grep -v \"\\*\" | xargs -n 1 git branch -d'

# package manager
alias npmr="npm run"
alias yarnr='yarn run'

###############################################
# LARAVEL
###############################################

# Compser
alias comp='composer'
# alias compi='composer install'
# alias compu='composer update'
alias compda='composer dump-autoload -o'
alias complaravel='composer create-project --prefer-dist laravel/laravel'

# Base
alias ar='php artisan'
alias ars='php artisan serve'
alias art='php artisan tinker'

# Database
alias armi='php artisan migrate'
alias armin='php artisan migrate:install'
alias armf='php artisan migrate:fresh'
alias armfs='php artisan migrate:fresh --seed'
alias armr='php artisan migrate:rollback'
alias arms='php artisan migrate:status'

# Route
alias arr='php artisan route:list'

###############################################
# LARAVEL SAILc
###############################################

# Base
alias sar='sail artisan'
alias sars='sail artisan serve'
alias sart='sail artisan tinker'

# Database
alias sarmi='sail artisan migrate'
alias sarmin='sail artisan migrate:install'
alias sarmf='sail artisan migrate:fresh'
alias sarmfs='sail artisan migrate:fresh --seed'
alias sarmr='sail artisan migrate:rollback'
alias sarms='sail artisan migrate:status'

# Route
alias sarr='sail artisan route:list'

# NPM
alias snpmi='sail npm install'
alias snpmr='sail npm run'
alias snpmrd='sail npm run dev'
alias snpmrw='sail npm run build --- --watch'
alias snpmrb='sail npm run build'

# Functions

# excute artisan make command
arm() {
    php artisan make:$1 $2
}

# refresh laravel compiled
ardump() {
    php artisan clear-compiled
    composer dump-autoload -o
    php artisan optimize
}

# add all -> commit -> push
wip() {
    git add -A
    git commit -m ":zap: wip"
}

# # create a clean branch
# gfb() {
#   git checkout --orphan $1
#   git reset
#   git clean -df
# }

# good game, happy hacking ;)
gghh() {
    git pull
    git diff
}

# push w/ custom commit msg
gac() {
    git add -A
    git commit -m "$1"
}

gd() {
    git diff --color $1 | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r
}

###############################################
# PYTHON
###############################################
alias py='python3'
alias pyr='python3 -m'

# update to git-prompt.sh location
source ~/git-prompt.sh
export PS1='\[\e[0;37m\]\A \[\e[35m\]\u@\h\[\e[37m\]: \[\e[33m\]\W \[\e[32m\]$(__git_ps1 " (%s)")\[\e[37m\]\n> \[\e[1;32m\]'
