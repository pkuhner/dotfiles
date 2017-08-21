set nocompatible
call pathogen#infect()

" -- UI
set title

filetype on
filetype plugin on
filetype indent on

set t_Co=256

syntax enable
set background=dark
let g:nord_italic_comments = 1
colorscheme nord

let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1
set laststatus=2

set mouse=a
set showmode
set number

set shiftwidth=4
set smarttab
set autoindent

set colorcolumn=80
set ruler
set wrap

set scrolloff=5
set sidescroll=20
set sidescrolloff=20

" -- Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" -- Beep
set noerrorbells

" -- Plugins
" autocmd vimenter * NERDTree

" -- Misc
set backspace=indent,eol,start
set hidden

" -- Avoid escape key
imap ;; <Esc>
map ;; <Esc>


" -- Python
let python_highlight_all = 1
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" -- CSS
au BufNewFile,BufRead *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent
