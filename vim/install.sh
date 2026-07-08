#!/bin/bash

# create a backup dir
mkdir -p "$HOME/.backup"

# move old .vimrc to backup dir
mv "$HOME/.vimrc" "$HOME/.backup/.vimrc" 2>/dev/null

# create a symlink for .vimrc
ln -sf "$PWD/.vimrc" "$HOME/.vimrc"

# install plugins
vim +PlugInstall +qa!
