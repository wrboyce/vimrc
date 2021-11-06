" disable vi compatability mode
set nocompatible

" modern terminal
set ttyfast

" zsh shell
set shell=zsh

" have viminfo remember a bunch of stuff
" set viminfo=!,'100,<100,f100,s10,n~/.viminfo

" hide buffers, don't close them
set hidden

" auto(smart)ident code
set smartindent

" expand tabs to spaces
" set expandtab
" reduce the size of tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4

" show wildcard matches as a list, longest common string
set wildmode=list:longest,full
" ignore common files
set wildignore+=*.pyc,__pycache__,.git,node_modules,*.zwc

" enable mouse support in console
set mouse=a
" automatically hide the cursor when typing
set mousehide

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
" highlight search matches
set hlsearch

" backup to a central dir, to avoid clutter in workspace dirs
set directory=~/.config/nvim/.tmp/
set backupdir=~/.config/nvim/.backup/

" enable modelines
set modelines=5

" onlt splits below/to the right
set splitbelow
set splitright
