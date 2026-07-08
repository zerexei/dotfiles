#!/bin/bash

# create a backup dir
mkdir -p "$HOME/.backup"

# loop through files in the current directory
for f in *; do

  # skip markdown files and this script itself
  case "$f" in
    *.md|install.sh) continue ;;
  esac

  # check if it's a directory
  if [ -d "$f" ]; then
    echo "----> BACKING UP $f to $HOME/.backup/$f"

    mkdir -p "$HOME/.backup/$f"
    # unquoted glob so shell expands it; errors suppressed if dir is empty
    mv "$HOME/$f"/* "$HOME/.backup/$f/" 2>/dev/null

    mkdir -p "$HOME/$f"

    echo "----> SYMLINKING contents of $f"
    ln -s "$PWD/$f/"* "$HOME/$f/"

  else
    echo "----> BACKING UP $f to $HOME/.backup/$f"
    mv "$HOME/$f" "$HOME/.backup/$f" 2>/dev/null

    echo "----> SYMLINKING $f"
    ln -s "$PWD/$f" "$HOME/"
  fi

done
