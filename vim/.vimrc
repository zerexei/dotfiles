" Set lightline colorscheme and statusline configuration
" Plugin Manager: vim-plug
call plug#begin('~/.vim/plugged')

" Coc.nvim for autocompletion (requires Node.js)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy file search with fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File system explorer (NERDTree)
Plug 'preservim/nerdtree'

" Colorscheme (e.g. spaceduck)
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

" Lightline for statusline
Plug 'itchyny/lightline.vim'

" Syntax highlighting for web files, including JSX/TSX
Plug 'sheerun/vim-polyglot'

call plug#end()

" Enable global extensions for Coc.nvim (React, JavaScript, etc.)
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-html', 'coc-css']

" Enable line numbers and relative line numbers
set number

" Enable syntax highlighting and set background for dark themes
syntax enable
set background=dark
colorscheme spaceduck

" Enable auto-indentation for web files
filetype indent plugin on
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Disable backups and swap files
set nobackup
set noswapfile
set nowritebackup

" Enable true color support (for supported terminals)
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set noshowmode so lightline can show the mode
set statusline=2
set noshowmode

" Keybindings for easier navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Fuzzy search with fzf
nnoremap <silent> <C-p> :Files<CR>

" Toggle NERDTree (file explorer)
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Enable autocomplete with Tab for Coc
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

" Enable auto-formatting with coc.nvim (autoformat on save)
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.html :call CocAction('format')

" Set lightline colorscheme and statusline configuration
let g:lightline = {
      \ 'colorscheme': 'spaceduck',
      \ 'active': {
      \   'left': [['mode'], ['filename', 'readonly']],
      \   'right': [['branch'], ['lsp', 'filetype', 'percent']],
      \ },
      \ 'component_function': {
      \   'lsp': 'coc#status',
      \   'branch': 'GetBranch',
      \ },
      \ }

" Get current Git branch using git rev-parse
function! GetBranch()
    let branch = trim(system('git rev-parse --abbrev-ref HEAD'))
    return branch =~ 'fatal:' ? '' :' ' . branch
endfunction
