set nocompatible

" PLUGINS ----------------------------
call plug#begin('~/.vim/plugged')

Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/AutoComplPop'

call plug#end()


" SETTINGS ---------------------------

"" APPEARANCE
filetype on
filetype plugin on
filetype indent on
syntax on
colorscheme spaceduck


set number
set background=dark
set wildmenu
set showcmd
set scrolloff=10
set laststatus=2
set noshowmode

"" INDENT
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

"" TEXT
set textwidth=79


"" ETC
set mouse=a
set nobackup
set history=1000
set belloff=all


" MAPPING -------------------------------

"" split window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" PLUGINS CONFIG -----------------------
let g:lightline = {
    \ 'colorscheme': 'spaceduck',
    \ }