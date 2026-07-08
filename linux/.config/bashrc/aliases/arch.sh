#!/bin/bash

# Arch Linux — pacman
alias pacs='sudo pacman -S'        # install
alias pacr='sudo pacman -Rs'       # remove (with unused deps)
alias pacu='sudo pacman -Syu'      # update all
alias pacss='pacman -Ss'           # search repos
alias pacsi='pacman -Si'           # package info
alias pacli='pacman -Qe'           # list explicitly installed
alias paclog='cat /var/log/pacman.log | tail -50'

# AUR — yay
alias ys='yay -S'                  # install from AUR
alias yu='yay -Syu'                # update including AUR
alias yss='yay -Ss'                # search AUR + repos
