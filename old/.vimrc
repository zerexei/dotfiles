""""""""""""""""
" Author: Angelo Arcillas
" Version: 1.0 
" Date: 2020
"
" TODO: Clean, arrange and improve
""""""""""""""""

set nocompatible

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""
" B A S I C:
""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme onedark

filetype plugin on
filetype indent on

set encoding=utf-8
set background=dark
set mouse=a               " enable all mouse command
set history=500           " set history

" Visual
set number                " show line numbers
set wildmenu              " show auto complete for command menu
set ruler                 " show ruler
set cursorline
set laststatus=2

set hidden              " hide idle buffer
set noshowmode          " lightline
set linebreak

" Text, Indent, Tabs & spaces
set autoindent
set smartindent         " do smart indention
set expandtab           " use space instead of tab
set smarttab            " do smart tabbing
set noshiftround
set shiftwidth=4        " 
set tabstop=4           " number of visual spaces per tab
set softtabstop=4       " number of spaces in tab when editting
set backspace=eol,start,indent

" Search
set ignorecase          " ignore case
set smartcase           " smart case
set hlsearch            " highlight match
set incsearch           " search like modern browser
set magic               " use regex
set showmatch           " shighlight matching

" Etc
set lazyredraw          " dont redraw while executing macro
set belloff=all         " no error sound

" No backup
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""
" M A P I N G:
""""""""""""""""""""""""""""""""""""""""""""""""""""
command W w !sudo tee % > /dev/null

map <space> /
map <C-space> ?
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" move to beginning/end of line
nnoremap B ^
nnoremap E $

map <C-n> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""
" P L U G  C O N F I G:
""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
