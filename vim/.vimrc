set nocompatible
call pathogen#infect()

" -- UI
set title

filetype on
filetype plugin on
filetype indent on

set t_Co=256

syntax on
"colorscheme jellybeans
"let g:jellybeans_overrides = {
"\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
"\}

set mouse=a
set showmode
set number

set shiftwidth=4
set smarttab
set autoindent

set ruler
set wrap

set scrolloff=5

" -- Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" -- Beep
set visualbell
set noerrorbells

" -- Plugins
" autocmd vimenter * NERDTree

" -- Misc
set backspace=indent,eol,start
set hidden

" -- Avoid escape key
imap ;; <Esc>
map ;; <Esc>
