syntax enable
execute pathogen#infect()

colorscheme monrovia

set nocompatible
set autoindent
set smartcase
set ttyfast
set lazyredraw
set relativenumber
set laststatus=2
set encoding=utf-8

set enc=utf-8
set fillchars=vert:¦

set expandtab
set tabstop=4
set shiftwidth=4
set linespace=0
set history=1000
set backspace=indent,eol,start
"set list listchars=tab:› ,trail:-,extends:>,precedes:<,eol:¬

set foldmethod=syntax
set foldlevelstart=20

let g:airline_powerline_fonts = 1

let mapleader=","

filetype plugin indent on


no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <tab> za

noremap <bs> :e#<CR>
noremap <leader>w :FixWhitespace<CR>
noremap <leader>p :read !pbpaste<CR>

ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

map <C-n> :NERDTreeToggle<CR>
map <C-g> :GitGutterToggle<CR>

autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ -A4
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ -A4
autocmd BufNewFile,BufRead *.hpp set formatprg=astyle\ -A4
autocmd BufNewFile,BufRead *.h set formatprg=astyle\ -A4
