if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# exports
export EDITOR=/usr/bin/nvim
export TERM=xterm-256color

# prompt
source ~/.config/bashrc/ps1.sh

# system aliases
source ~/.config/bashrc/aliases/base.sh
source ~/.config/bashrc/aliases/navigation.sh
source ~/.config/bashrc/aliases/search.sh

# distro-based aliases (auto-detected)
if command -v pacman &>/dev/null; then
    source ~/.config/bashrc/aliases/arch.sh
elif command -v apt &>/dev/null; then
    source ~/.config/bashrc/aliases/debian.sh
fi

# app aliases
source ~/.config/bashrc/aliases/git.sh
source ~/.config/bashrc/aliases/package-manager.sh
source ~/.config/bashrc/aliases/laravel.sh
