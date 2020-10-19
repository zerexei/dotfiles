""""""""""""""""
" Author: 
" Version: 1 2020
"
""""""""""""""""

set nocompatible

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'



call plug#end()

colorscheme gruvbox

" INDENTION
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" SEARCH
set hlsearch
set ignorecase
set incsearch
set smartcase
set magic

"TEXT RENDERING
syntax enable
set encoding=utf-8
set linebreak
set scrolloff=3
set sidescrolloff=5
set wrap
set textwidth=80
set backspace=indent,eol,start

" USER INTERFACE
set ruler
set cursorline
set number
set noerrorbells
set hidden
set mouse=a
set background=dark
set laststatus=2
set noshowmode

" MISC
set history=500
set noswapfile

" MAP
map <C-n> :NERDTreeToggle<CR>

" PLUG CONFIG
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif







