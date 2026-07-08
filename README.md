# dotfiles

Personal config files for Linux, Windows (Git Bash / WSL), Vim, Neovim, and VS Code.

---

## Structure

```
dotfiles/
├── linux/          — Bash config (modular alias files) + i3 WM + i3status
├── windows/        — Self-contained Bash config for Git Bash / WSL
├── vim/            — .vimrc with vim-plug plugins
├── neovim/         — Neovim config (lazy.nvim, LSP, Telescope, Neo-tree)
└── vscode/         — settings.json
```

---

## Install

Each environment has its own `install.sh`. Run it from inside its directory.

### Linux (Bash + i3)
```bash
cd linux
bash install.sh
```
Backs up existing files/dirs to `~/.backup/`, then symlinks everything into `$HOME`.

### Vim
```bash
cd vim
bash install.sh
```
Symlinks `.vimrc` and runs `vim +PlugInstall` to install plugins.

### Neovim
```bash
cd neovim
bash install.sh
```
Symlinks `.config/nvim`. On first launch, run `:Lazy sync` to install all plugins.

### VS Code
Copy `vscode/settings.json` to:
- **Linux / macOS**: `~/.config/Code/User/settings.json`
- **Windows**: `%APPDATA%\Code\User\settings.json`

### Windows (Git Bash / WSL)
Copy or symlink `windows/.bashrc` to `~/.bashrc`.

---

## Linux Bash — Alias Files

The Linux `.bashrc` sources from `~/.config/bashrc/`:

| File | Contents |
|---|---|
| `ps1.sh` | Custom prompt with git branch |
| `aliases/base.sh` | Core utils: chmod, cp/mv/rm safety, cd, clear |
| `aliases/navigation.sh` | `..`, `...`, `proj`, `repo` shortcuts |
| `aliases/search.sh` | `ls` variants, `stxt` (grep) |
| `aliases/arch.sh` | pacman + yay (auto-sourced on Arch) |
| `aliases/debian.sh` | apt (auto-sourced on Debian/Ubuntu) |
| `aliases/git.sh` | Full git workflow aliases |
| `aliases/package-manager.sh` | npm / yarn aliases |
| `aliases/laravel.sh` | Artisan + Sail + Composer aliases |

---

## Git Commit Emoji Guide

| Emoji | Code | Meaning |
|---|---|---|
| 🚀 | `:rocket:` | General commits |
| ⚡ | `:zap:` | WIP |
| 🔥 | `:fire:` | Hot fix |
| ⚠️ | `:warning:` | Not fixed / needs attention |
| ❌ | `:x:` | Failed / reverted |
| ✅ | `:white_check_mark:` | Success |
| ‼️ | `:bangbang:` | Critical |
| 📝 | `:memo:` | TODO / FIXME |
