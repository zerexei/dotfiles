# BASE

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

alias c="code"
alias repo='cd z:projects'

# GIT
alias gi='git init -b main'
alias gr='git remote'
alias ga='git add'
alias gc='git commit'
alias gg='git push'
alias ggg='git pull'

# info
alias gs='git status -sb'
alias grf='git reflog'
alias gl='git log --pretty=format:"%C(yellow)%h %C(green)%d => %C(white)%s %C(italic dim white)-> [%cn] %C(cyan)- %cr"'

# commit
alias gac='git add -A && git commit -m'
alias gca='git commit --amend'
alias gcaa='git commit --amend --no-edit'
alias wip='git add -A && git commit -m ":zap: wip"'
alias wipp='git add -A && git commit -m ":zap: wip" && git push'

# branch
alias gb='git branch'
alias gsw='git switch'
alias gm='git merge'

# time travel
alias nahh='git restore . && git clean -df'
alias ggb='git push -f origin HEAD^:master' # undo recent git push
alias gcb='git reset --soft HEAD~1'         # uncommit the latest commit

# create a fresh branch
gfb() {
	git checkout --orphan $1
	git reset
	git clean -df
}

# pull and diff
gghh() {
	git pull
	git diff
}

# push w/ custom commit
gacp() {
	git add -A
	git commit -m $1
	git push
}

# remove +/- on git diff
function gd() {
	git diff --color $1 | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r
}

# LARAVEL
alias ar="php artisan"
alias ars="php artisan serve"
alias art="php artisan tinker"
alias artt="php artisan test"
alias arttf="php artisan test --filter"
alias armf="php artisan migrate:fresh"
alias armfs="php artisan migrate:fresh --seed"
alias armr='php artisan migrate:rollback'
alias arrl='php artisan route:list -c'

# excute artisan make command
arm() {
	php artisan make:$1 $2
}

# YARN
alias y='yarn'
alias yi='yarn install'
alias ya='yarn add'
alias yad='yarn add -D'
alias yau='yarn audit'
alias yauf='yarn audit fix'

# yarn script
alias yrs='yarn run serve'
alias yrw='yarn run watch'
alias yrt='yarn run test'
alias yrd='yarn run dev'
alias yrb='yarn run build'
alias yrp='yarn run production'
