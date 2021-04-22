#!/bin/bash

# create a backup dir
mkdir -p "$HOME/.backup"

# loop through files
for f in *; do

  # check if it's a markdown
  if [ "${f##*.md}" ]; then

    # check if it's a dir
    if [ -d "$f" ]; then
      echo "----> BACKING UP $f to $HOME/.backup/$f"

      # move files to backup dir
      mv "$HOME/$f/*" "$HOME/.backup/$f/" 2>/dev/null

      # create a dir, sometimes dir doesn't exists
      mkdir -p "$HOME/$f"
      echo "----> SYMLINKING $f"

      # symlink all files inside dir
      ln -s "$PWD/$f/"* "$HOME/$f/"

    # if not it's not a dir
    else
      echo "----> BACKING UP $f to $HOME/.backup/$f"

      # move files to backup dir
      mv "$HOME/$f" "$HOME/.backup/$f" 2>/dev/null
      echo "----> SYMLINKING $f"
      
      # symlink file
      ln -s "$PWD/$f" "$HOME/"
    fi
  fi
done
