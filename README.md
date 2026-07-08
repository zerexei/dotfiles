<div align="center">

# ✦ dotfiles

Personal configuration files for Linux, Windows, Vim, Neovim, and VS Code.

![Linux](https://img.shields.io/badge/Linux-i3%20%2B%20Bash-informational?style=flat&logo=linux&logoColor=white&color=333333)
![Neovim](https://img.shields.io/badge/Neovim-lazy.nvim-informational?style=flat&logo=neovim&logoColor=white&color=57A143)
![VS Code](https://img.shields.io/badge/VS%20Code-settings-informational?style=flat&logo=visualstudiocode&logoColor=white&color=007ACC)
![Shell](https://img.shields.io/badge/Shell-Bash-informational?style=flat&logo=gnubash&logoColor=white&color=4EAA25)

</div>

---

## Contents

```
dotfiles/
├── linux/      Bash (modular aliases) · i3 WM · i3status
├── windows/    Self-contained Bash for Git Bash / WSL
├── vim/        .vimrc · vim-plug
├── neovim/     Lua config · lazy.nvim · LSP · Telescope · Neo-tree
└── vscode/     settings.json
```

---

## Prerequisites

| Tool | Required by |
|---|---|
| `git` | All environments |
| `nvim` ≥ 0.9 | Neovim config |
| `make` | telescope-fzf-native (optional) |
| Node.js | LSP servers via mason.nvim |

---

## Install

Each environment has its own `install.sh`. All scripts back up existing files to `~/.backup/` before making changes.

<details>
<summary><b>🐧 Linux — Bash + i3</b></summary>

```bash
cd linux
bash install.sh
```

Symlinks `.bashrc` and the entire `.config/` tree into `$HOME`.

> The distro-specific alias file (`arch.sh` or `debian.sh`) is auto-detected at shell startup — no manual switching needed.

</details>

<details>
<summary><b>󰀲 Neovim</b></summary>

```bash
cd neovim
bash install.sh
```

Symlinks `~/.config/nvim`. On first launch, plugins install automatically via lazy.nvim. You can also run `:Lazy sync` manually.

**Plugins installed:**

| Plugin | Role |
|---|---|
| `spaceduck` | Colorscheme |
| `lualine` | Statusline |
| `nvim-treesitter` | Syntax highlighting |
| `telescope.nvim` | Fuzzy finder (`<C-p>`) |
| `neo-tree.nvim` | File explorer (`<C-n>`) |
| `mason` + `nvim-lspconfig` | LSP (TS, HTML, CSS, JSON, Lua) |
| `nvim-cmp` + `LuaSnip` | Autocompletion |
| `conform.nvim` | Format on save (Prettier, stylua) |
| `gitsigns.nvim` | Git gutter decorations |

</details>

<details>
<summary><b>⬡ Vim</b></summary>

```bash
cd vim
bash install.sh
```

Symlinks `.vimrc` and runs `vim +PlugInstall` to install plugins.

</details>

<details>
<summary><b>⬛ VS Code</b></summary>

Copy `vscode/settings.json` to your user settings directory:

| OS | Path |
|---|---|
| Linux / macOS | `~/.config/Code/User/settings.json` |
| Windows | `%APPDATA%\Code\User\settings.json` |

</details>

<details>
<summary><b>🪟 Windows — Git Bash / WSL</b></summary>

```bash
cp windows/.bashrc ~/.bashrc
# or
ln -sf "$PWD/windows/.bashrc" ~/.bashrc
```

The file is self-contained — all aliases are inlined with no external dependencies.

</details>

---

## Linux Bash — Alias Reference

<details>
<summary>Show alias files</summary>

The `.bashrc` sources from `~/.config/bashrc/`:

| File | What it provides |
|---|---|
| `ps1.sh` | Custom prompt with git branch |
| `aliases/base.sh` | Storage, permissions, safe cp/mv/rm, `cd`, `mkdircd` |
| `aliases/navigation.sh` | `..` / `...` / `proj` / `repo` shortcuts |
| `aliases/search.sh` | `ls` variants, `stxt` (recursive grep) |
| `aliases/arch.sh` | `pacs`, `pacu`, `ys`, `yu` — pacman + yay |
| `aliases/debian.sh` | `apti`, `aptu`, `aptac` — apt |
| `aliases/git.sh` | Full git workflow: branch, log, remote, stash |
| `aliases/package-manager.sh` | `npmr`, `yarnr`, `niw`, `yiw` |
| `aliases/laravel.sh` | Artisan (`ar`, `armi`, `armf`), Sail, Composer |

</details>

---

## Git Commit Convention

| Emoji | Shortcode | When to use |
|:---:|---|---|
| 🚀 | `:rocket:` | General / feature commits |
| ⚡ | `:zap:` | Work in progress |
| 🔥 | `:fire:` | Hot fix |
| ⚠️ | `:warning:` | Known issue, not yet fixed |
| ❌ | `:x:` | Failed attempt / revert |
| ✅ | `:white_check_mark:` | Confirmed working |
| ‼️ | `:bangbang:` | Critical change |
| 📝 | `:memo:` | TODO / FIXME / notes |
