set number
set expandtab
set smartindent
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set hlsearch
set nobackup
set completeopt=menuone,noinsert
set background=light

inoremap jj <Esc>
noremap <C-y> y`m
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
noremap <C-n> :NERDTreeToggle<CR>

let mapleader = "\<Space>"

nnoremap <Leader>o :<C-u>Deol -split=floating<CR>
tnoremap <ESC>   <C-\><C-n>

nmap <silent> <Leader>d :LspDefinition<CR>
nmap <silent> <Leader>p :LspHover<CR>
nmap <silent> <Leader>r :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>
nmap <silent> <Leader>s :split \| :LspDefinition <CR>
nmap <silent> <Leader>v :vsplit \| :LspDefinition <CR>


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------
