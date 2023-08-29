###############################################
# BASE
###############################################
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

# NAVIGRATION
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

alias home='cd ~'

# etc
alias cls='clear'
alias clrs='clear'
alias x='exit'
alias q='exit'

# functions
cd() { cd $1 && ls; }
mkdircd() { mkdir $1 && cd $1; }
trash() { gvfs-trash "$@" && ls; }

###############################################
# BASE
###############################################
# common
alias gi='git init -b main'
alias ga='git add'
alias gc='git commit'
alias gg='git push'
alias ggg='git pull'
alias gghh='git pull && git diff' # good game, happy hacking ;)

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

alias dg='git diff --color $1 | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

# filter by author
alias gllme='git log --pretty=format:"%C(yellow)%h | %cs %C(green)%d => %C(white)%s %C(italic dim white)-> [%cn]" --author "Angelo Arcillas"'

# git log with branch visual
alias gbl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%n' --all"

# Remote
alias gr='git remote'
alias gra='git remote add'
alias grd='gir remote remove'

# Commits
alias wip='git add -A && git commit -m ":zap: wip"' # add all -> commit -> push
alias gac='git add -A && git commit -m'             # add all -> commit -> set message
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

###############################################
# Javascript
###############################################
# npm
alias npmr='npm run'
alias npmi='npm run install'
alias npmrd='npm run dev'
alias npmrw='npm run watch'
alias npmrb='npm run build'

# vite
alias vnpmrw='npm run build -- --watch'

###############################################
# LARAVEL
###############################################
# Compser
alias comp='composer'
alias compi='composer install'
alias compu='composer update'
alias compda='composer dump-autoload -o'
alias complaravel='composer create-project --prefer-dist laravel/laravel'

export ARTISAN_PREFIX='sail'

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

alias snpmi='sail npm install'
alias snpmrd='sail npm run dev'
alias snpmrb='sail npm run build'

###############################################
# PYTHON
###############################################
alias py='python3'
alias pyr='py -m'
alias pypipi='pyr pip install'

source ~/git-prompt.sh # update to git-prompt.sh location
export PS1='\[\e[38;5;240m\][\d \@] \[\e[35m\]\u@\h\[\e[37m\]: \[\e[33m\]\W \[\e[32m\]$(__git_ps1 " (%s)")\[\e[37m\]\n> \[\e[1;32m\]'
