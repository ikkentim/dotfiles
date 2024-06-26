" load bundles with pathogen
execute pathogen#infect()

" theme
syntax enable
colorscheme monrovia

" case insensitive search except when the search pattern contains upper case characters
set ignorecase
set smartcase

" automatically indent new lines
set autoindent

" show relative and absolute line numbers
set number relativenumber

" use utf-8 encoding instead of system based encoding
set encoding=utf-8

" auto expand tabs to spaces, set tab size and indent size to 4
set expandtab
set tabstop=4
set shiftwidth=4

" remember 1k lines of commands history
set history=1000

" allow backspacing over indents, line breaks and the start position of the insert action
set backspace=indent,eol,start

" fzf
let $FZF_DEFAULT_COMMAND='find . \( -name obj -o -name bin -o -name node_modules -o -name .git \) -prune -o -print'
set rtp+=/opt/homebrew/opt/fzf

let mapleader=","

" enable filetype detection
filetype plugin indent on

" Disable arrows in all modes
noremap <up> <Nop>
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>

inoremap <up> <Nop>
inoremap <down> <Nop>
inoremap <left> <Nop>
inoremap <right> <Nop>

" bind backspace to editing the previously opened buffer
noremap <bs> :e#<CR>

" open various tooling
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-g> :GitGutterToggle<CR>
noremap <Space> :Files<CR>

noremap <leader>w :FixWhitespace<CR>
noremap <leader>p :read !pbpaste<CR>
noremap <leader>h :e ~/projects/notebook/dev/cheatsheet.md<CR>
noremap <leader>r :so $MYVIMRC<CR>

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


" asynccomplete
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

