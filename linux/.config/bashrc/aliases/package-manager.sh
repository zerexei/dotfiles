#!/bin/bash

# # npm
# alias n='npm'
# alias ni='npm install'
# alias nid='npm install -D'
# alias nig='npm install -g'
# alias nu='npm update'
# alias nau='npm audit'
# alias nauf='npm audit fix'

# npm script
# alias nrs='npm run serve'
# alias nrw='npm run watch'
# alias nrt='npm run test'
# alias nrd='npm run dev'
# alias nrb='npm run build'
# alias nrp='npm run production'
alias npmr='npm run'

# yarn
# alias y='yarn'
# alias yi='yarn install'
# alias ya='yarn add'
# alias yad='yarn add -D'
# alias yau='yarn audit'
# alias yauf='yarn audit fix'

# yarn script
# alias yrs='yarn run serve'
# alias yrw='yarn run watch'
# alias yrt='yarn run test'
# alias yrd='yarn run dev'
# alias yrb='yarn run build'
# alias yrp='yarn run production'
alias yarnr='yarn run'

# Funtions

# npm install & watch
niw() {
    npm install
    npm run watch
}

yiw() {
    yarn
    yarn run watch
}

# vite
alias vnpmrw='npm run build -- --watch'
