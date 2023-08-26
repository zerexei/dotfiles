#!/bin/bash

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

# Functions

# excute artisan make command
arm() {
    ar make:$1 $2
}

# aroptimize() {
#     # optimize everything
# }

# arcache() {
#     # cache everything
# }

# refresh laravel compiled
ardump() {
    ar clear-compiled
    composer dump-autoload -o
    ar optimize
}

# ardev() {
#     # setup for development env
# }
# arprod() {
#     # setup for production env
# }

# sail npm
alias snpmi='sail npm install'
alias snpmrd='sail npm run dev'
alias snpmrb='sail npm run build'
