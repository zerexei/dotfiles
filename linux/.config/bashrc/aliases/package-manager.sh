#!/bin/bash

# npm
alias npmr='npm run'

# yarn
alias yarnr='yarn run'

# vite watch
alias vnpmrw='npm run build -- --watch'

# functions: install & watch
niw() {
    npm install
    npm run watch
}

yiw() {
    yarn
    yarn run watch
}
