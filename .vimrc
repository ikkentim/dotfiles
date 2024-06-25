syntax enable
execute pathogen#infect()

colorscheme monrovia

set ignorecase
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
"no <tab> za

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

" OmniSharp
let g:OmniSharp_server_use_net6 = 1

nnoremap <C-o><C-u> :OmniSharpFindUsages<CR>
nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>
nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>
nnoremap <C-o><C-r> :!dotnet run

" fzf
let $FZF_DEFAULT_COMMAND='find . \( -name obj -o -name bin -o -name node_modules -o -name .git \) -prune -o -print'

" asynccomplete
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
            \ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

set rtp+=/opt/homebrew/opt/fzf
