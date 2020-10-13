call plug#begin('~/.vim/plugged')

"" features
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ervandew/supertab'

"" appearence
Plug 'bling/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'sjl/badwolf'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mkitt/tabline.vim'

call plug#end()
" autocomplete commands
set wildmenu

" disable sounds
set noerrorbells
set novisualbell
set visualbell

" sacreligious butchery of tabs
set expandtab
set smarttab
set shiftwidth=3
set tabstop=3
set softtabstop=3

" formatting
set nowrap
set ai
set si
" set cursorline
set lazyredraw

" show line number
set number

" set encoding
set encoding=utf8
set ffs=unix,dos,mac

" set color scheme
colorscheme badwolf
set background=dark
" enable syntax
syntax enable

" enable mouse
set mouse=a

" enable filetype plugins
filetype plugin on
filetype indent on

set autoread
au FocusGained,BufEnter * checktime


"
" keymaps
"
let mapleader = "." " leader

" personal
nmap <leader>e :w!<CR>
nmap <leader>q :q!<CR>
nmap <leader>qe :wq!<CR>
imap ee <ESC> 

" plugin
nmap <C-n> :NERDTreeToggle<CR>

