" set titlestring=Faded
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin('~/.vim/bundle/')
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
color Monokai
set nu
set sw=4 ts=4 sts=4 expandtab
set laststatus=2
set go=m
set showcmd
set nobackup
set cursorline
hi colorcolumn guibg=#FEA0FE
set hls
set noswapfile
set ignorecase
set linespace=0
set showmatch
hi cursor guibg=#FEA0FE
let NERDTreeIgnore=['\.pyc','\~$','\.swp'] 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:indentLine_color_gui = '#A4E57E'
set autoindent
set linespace=0

set fileencodings=utf-8,gbk,chinese,cp936 
set termencoding=utf-8
set encoding=prc
let &termencoding=&encoding
set gfn=Monaco:h10:cANSI
set gfw=NSimsun:h12


map <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
map <F5> :call Run()<CR>

func! Run()
    if &filetype == 'python'
        exec "!python3 %"
    endif
endfunc
