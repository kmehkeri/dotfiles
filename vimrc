" Init
set nocompatible                  " vim not vi

" Navigation
map <A-left> :tabp<cr>            " Previous tab
map <A-right> :tabn<cr>           " Next tab
set mouse=                        " Disable mouse
set wildmenu                      " Visual command completion

" Display
syntax on
set ruler                         " Show current cursor coordinates
set scrolloff=3                   " Keep lines visible above/below cursor
set sidescrolloff=5               " Keep chars visible left/right cursor
set nowrap                        " Disable wrapping
set nonumber                      " Disable line numbering
set laststatus=2                  " Display status line
set showmatch                     " Show matching bracket
set noerrorbells                  " Disable beep
set novisualbell                  " Disable blink

" Writing
set encoding=utf8                 " Use UTF-8 by default
set pastetoggle=<F2>              " Win+F2 for pasting external text
set autoindent smartindent        " Indentation
set tabstop=4                     " Tab size
set shiftwidth=4                  " Indent size
set backspace=indent,eol,start    " Backspace over all kind of things

" Searching
set hlsearch                      " Highlight matches
set incsearch                     " Search while typing
set wrapscan                      " Continue searching from top when hitting bottom

" Backups/swap
set nobackup
set nowb
set noswapfile

" Local settings
if filereadable(glob("$HOME/.vimrc.local")) 
	source $HOME/.vimrc.local
endif
