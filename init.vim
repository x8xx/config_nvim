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
map <C-n> :NERDTreeToggle<CR>

"autocmd VimEnter * execute 'NERDTree'

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
