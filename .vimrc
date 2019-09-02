version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=700
set nomodeline
set printoptions=paper:letter
set ruler
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vim74
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set number
set incsearch
set wrapscan
set autoread
set wildmenu
set ruler
set cmdheight=2
set showmatch
set noerrorbells
syntax on
set background=dark
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai
set si
set nowrap
set nocompatible
set hidden
set showcmd
set hlsearch
set autoindent
set nostartofline
set laststatus=2
set confirm
set visualbell
set mouse=a
set smartindent
set smarttab
set foldmethod=syntax
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk