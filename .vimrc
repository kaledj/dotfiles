set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'rust-lang/rust.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-bufferline'
call vundle#end()
filetype plugin indent on

execute pathogen#infect()

" For showing off .vimrc
"autocmd! bufwritepost .vimrc source %

set shell=/bin/zsh

" No markdown folding
let g:vim_markdown_folding_disabled = 1

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_c=''
let g:airline_theme='distinguished'
let g:airline_powerline_fonts=1

syntax on
set t_Co=256
colors dracula
set laststatus=2

set encoding=utf-8

set cursorline         " Highlight current line
set number             " add line number for current line
set title              " Show filename in titlebar
set showcmd            " Show what command I'm typing
set scrolloff=8        " Show me where I'm going
set wildmenu           " Autocomplete commands
set tabstop=4          " Set the tabstop to 2 spaces
set shiftwidth=4       " Shiftwidth should match tabstop
set softtabstop=2      " backspace tabs
set expandtab          " Convert tabs to <tabstop> number of spaces
set backspace=2        " makes backspace work like you expect
set autoindent
set smartindent
set smarttab
set formatoptions+=ro  " Insert leading comment characters on newline
set showmatch          " Show matching [] () {} etc...
set ignorecase
set smartcase
set incsearch
set splitbelow
set splitright
set ttyfast
set lazyredraw
set clipboard=unnamed  " Copy/paste like normal


set backup                 " keep a backup file
set backupdir=~/.vim/tmp " put it here
set dir=~/.vim/tmp       " put swap files here

" behave yourself
nnoremap Y y$

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-r> :nohl<CR><C-l>

" because of wordwrap
noremap j gj
noremap k gk

" moving around splits
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" moving between tabs
nmap <C-l> gt
nmap <C-h> gT

nmap <C-j> <C-e>

nmap <C-k> <C-y>
" :T <filename> opens file in new tab
command! -complete=file -nargs=1 T tabedit <args>

" :V vertical split
command! -complete=file -nargs=1 V vsplit <args>

" Format file as JSON
command! Json %!python -m json.tool

" Strip trailing whitespace (\ss) (strip spaces)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

highlight WhitespaceEOL ctermbg=Red guibg=Red
match WhitespaceEOL /\s\+$/

" Make vim turn *off* expandtab for files named Makefile or makefile
" We need the tab literal
autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab
autocmd BufNewFile,BufRead *\.md set noexpandtab

" Nerdtree
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Fugitive
map <Leader>gb :Gblame<CR>
map <Leader>gs :Gstatus<CR>

" Keep selection highlighted when changing indentation
vnoremap < <gv
vnoremap > >gv

" More logical indent/decrement
nnoremap + <C-a>
nnoremap - <C-x>

let g:EclimCompletionMethod = 'omnifunc'

