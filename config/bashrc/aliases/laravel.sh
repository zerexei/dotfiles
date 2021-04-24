#!/bin/bash

# Compser
alias com='composer'
alias comi='composer install'
alias comu='composer update'
alias comda='composer dump-autoload -o'
alias coml='composer create-project --prefer-dist laravel/laravel'

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
alias arrl='php artisan route:list -c'


# Functions
arm() {
    # artisan make command
    php artisan make:$1 $2
}

aroptimize() {
    # optimize everything
}

arcache() {
    # cache everything
}

ardump() {
    php artisan clear-compiled
    composer dump-autoload -o
    php artisan optimize
}

ardev() {
    # setup for development env
}
arprod() {
    # setup for production env
}