" load bundles with pathogen
execute pathogen#infect()

" theme
syntax enable
colorscheme monrovia

" case insensitive search except when the search pattern contains upper case characters
set ignorecase
set smartcase

autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

let &t_SI="\033[4 q" " start insert mode
let &t_EI="\033[1 q" " end insert mode
"fefefihefiehfeifheiefifhef
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

" autohold timeout
set updatetime=1000

" enable filetype detection
filetype plugin indent on

" fzf
let $FZF_DEFAULT_COMMAND='find . \( -name obj -o -name bin -o -name node_modules -o -name .git -o -name .idea \) -prune -o -print'
set rtp+=/opt/homebrew/opt/fzf

let mapleader=","

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
noremap <leader>V :e $MYVIMRC<CR>
noremap <leader>v :so $MYVIMRC<CR>

autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ -A4
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ -A4
autocmd BufNewFile,BufRead *.hpp set formatprg=astyle\ -A4
autocmd BufNewFile,BufRead *.h set formatprg=astyle\ -A4

" OmniSharp
let g:OmniSharp_server_use_net6 = 1
let s:using_snippets = 1
let g:OmniSharp_want_snippet=1

nnoremap <C-o><C-u> :OmniSharpFindUsages<CR>
nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>
nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>
nnoremap <C-o><C-r> :!dotnet run

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview', 'popup'
" and 'popuphidden' if you don't want to see any documentation whatsoever.
" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  " Set desired preview window height for viewing documentation.
  set previewheight=5
endif

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <buffer> <Leader>gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <buffer> <Leader>gt <Plug>(omnisharp_go_to_type_definition)
  autocmd FileType cs nmap <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <buffer> <Leader>fi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <buffer> <Leader>sd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <buffer> <Leader>si <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <buffer> <Leader>d <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <buffer> <Leader>fs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <buffer> <Leader>u <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <buffer> <C-s> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <buffer> <C-s> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)

  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>gcc <Plug>(omnisharp_global_code_check)

  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <buffer> <C-b> <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <buffer> <C-b> <Plug>(omnisharp_code_actions)

  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>f <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>r <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osr <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>oss <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osS <Plug>(omnisharp_stop_server)
augroup END

" asynccomplete
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-'>"
let g:UltiSnipsJumpBackwardTrigger="<c-;>"
