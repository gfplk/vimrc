set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin('~/.vim/bundle/')
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'vimwiki/vimwiki'
"Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set nu
let python_highlight_all=1
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
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '__pycache__'] 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1 
set autoindent
set cindent
set linespace=0
set ambiwidth=double
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set encoding=utf-8
let &termencoding=&encoding
set foldmethod=indent
set termguicolors
let g:solarized_termtrans = 1
color solarized

map <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
map <F5> :call Run()<CR>
map <F6> :call Test()<CR>
map <F11> :exec "%!xxd"<CR>
map <F12> :exec "%!xxd -r"<CR>

func! Run()
    if &filetype == 'python'
        if has("win32")
            exec "!python %"
        else
            exec "!python3 %"
        endif
    endif
endfunc

func! Test()
    if &filetype == 'python'
        if has('win32')
            exec "!python %'
        else
            exec '!python3 -m unittest %'
        endif
    endif
endfunc


set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set fenc=chinese
    set fileencoding=chinese
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8 
else
    set fileencoding=utf-8
endif

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = '/usr/bin/python3'
