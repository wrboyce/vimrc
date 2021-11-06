call plug#begin()

" load some sane defaults
Plug 'tpope/vim-sensible'

" look & feel
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Plug 'chriskempson/base16-vim' | Plug 'altercation/vim-colors-solarized'
" Plug 'danielwe/base16-vim' | Plug 'altercation/vim-colors-solarized'

" sidebars
Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'majutsushi/tagbar' | Plug 'lvht/tagbar-markdown'

" completion
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer --rust-completer --ts-completer' }
" Plug 'ervandew/supertab'
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'tenfyzhong/CompleteParameter.vim'

" git(hub)
Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'

" utils
Plug 'tpope/vim-commentary'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'wrboyce/cute.vim'
" Plug 'tpope/vim-endwise'
Plug 'jeetsukumaran/vim-markology'
Plug 'farmergreg/vim-lastplace'
Plug 'myusuf3/numbers.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-repeat'
" Plug 'jremmen/vim-ripgrep'
" Plug 'junegunn/vim-peekaboo'
" Plug 'junegunn/vim-slash'
Plug 'tpope/vim-sleuth'
" Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mbbill/undotree'
Plug 'editorconfig/editorconfig-vim'

" async linting for all the languages
" Plug 'w0rp/ale'

" language specific plugins
" Plug 'ARM9/arm-syntax-vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Plug 'zplugin/zplugin-vim-syntax'

call plug#end()
