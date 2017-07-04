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
Plugin 'tell-k/vim-autopep8'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/TxtBrowser'
Plugin 'fatih/vim-go'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set sw=4 ts=4 sts=4 expandtab
set laststatus=2
set showcmd
set nobackup
set cursorline
set hls
set noswapfile
set ignorecase
set linespace=0
set showmatch
let NERDTreeIgnore=['\.pyc','\~$','\.swp'] 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set autoindent
set cindent
set linespace=0
set ambiwidth=double
set nowrap

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set encoding=utf-8
let &termencoding=&encoding
set termencoding=utf-8

map <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
nnoremap <silent> <F4> :TlistToggle<CR>
map <F5> :call Run()<CR>
autocmd FileType python noremap <buffer> <F6> :call Autopep8()<CR>
map <F7> :exec "%!xxd"<CR>
map <F8> :exec "%!xxd -r"<CR>

func! Run()
    if &filetype == 'python'
        exec "!time python3 %"
    endif
    if &filetype == 'go'
        exec "!time go run %"
    endif
endfunc

set foldmethod=indent
au BufEnter *.txt setlocal ft=txt

let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
color Monokai
