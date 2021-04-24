#!/bin/bash

# common
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
alias gcb='git reset --soft HEAD~1' # uncommit recent git commit

# Info
alias gs='git status -sb'
alias gd='git diff'
alias gl='git log --pretty=format:"%C(yellow)%h %C(green)%d => %C(white)%s %C(italic dim white)-> [%cn] %C(cyan)- %cr"'
alias gll='git log --pretty=format:"%C(yellow)%h | %cs %C(green)%d => %C(white)%s %C(italic dim white)-> [%cn]"'

# git log with branch visual
alias gbl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%n' --all"

# Remote
alias gr='git remote'
alias gra='git remote add'
alias grd='gir remote remove'

# Commits
alias wip='git add -A && git commit -m ":zap: wip"'
alias gac='git add -A && git commit -m'
alias gca='git commit --amend -m'

# Branch
alias gb='git branch'
alias gbd='git branch -d'
alias gbm='git branch -m'
alias gsw='git switch'
alias gm='git merge --stat'

# etc
alias gcp='git cherry-pick'
alias clean-merged = 'git branch --merged | grep -v \"\\*\" | xargs -n 1 git branch -d'

# add all -> commit -> push
wipp() {
  git add -A
  git commit -m ":zap: wip"
  git push
}

# create a clean branch
gfb() {
  git checkout --orphan $1
  git reset
  git clean -df
}

# good game, happy hacking ;)
gghh() {
  git pull
  git diff
}