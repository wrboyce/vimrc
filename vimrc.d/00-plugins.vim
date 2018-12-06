call plug#begin('~/.vim/bundle')

" load some sane defaults
Plug 'tpope/vim-sensible'

" look & feel
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim' | Plug 'altercation/vim-colors-solarized'

" sidebars
Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'majutsushi/tagbar' | Plug 'lvht/tagbar-markdown'

" completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer --rust-completer --ts-completer' }
  Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" git(hub)
Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'

" utils
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'wrboyce/cute.vim'
Plug 'tpope/vim-endwise'
Plug 'jeetsukumaran/vim-markology'
Plug 'farmergreg/vim-lastplace'
Plug 'myusuf3/numbers.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-repeat'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-sleuth'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mbbill/undotree'

" async linting for all the languages
Plug 'w0rp/ale'

" language specific plugins
Plug 'sheerun/vim-polyglot'
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

call plug#end()
