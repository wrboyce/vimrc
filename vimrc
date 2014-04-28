"  {{{ pathogen.vim

call pathogen#infect()
call pathogen#helptags()

"  }}}

" {{{ Auto Commands

" Remove any trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

" }}}


" {{{ Misc Settings

" Disable vi compatability mode
set nocompatible

" Watch for file changes
set autoread

" Store a reasonable sized history
set history=1000

" Automatically cd into the directory that the file is in
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Shows the current command being typed
set showcmd

" hide buffers, don't close them
set hidden

" Show matching brackets/braces
set showmatch

" Folding
set foldmethod=marker

" Syntax Highlighting
filetype on
filetype plugin on
filetype indent on
syntax enable
set grepprg=grep\ -nH\ $*

" Autoident code
set autoindent
set smartindent

" Expand tabs to spaces
set expandtab

" Reduce the size of tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround

" obey sw when inserting tabs
set smarttab

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
   " Enable spellchecking on new txt files
   autocmd BufNewFile,BufRead *.txt setlocal spell
endif

" use '[RO]' for '[readonly]'
set shortmess+=r

" set title for xterm etc
set title

" Wild Mode!
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a
" Automatically hide the cursor when typing
set mousehide

" Fix backspace
set backspace=2

" Show line numbers
set number

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" Incremental searching
set incsearch

" Highlight search matches
set hlsearch

" Backup to a central dir, to avoid clutter in workspace dirs
set nobackup "" disable backups.
"set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" ???
set ttyfast

" zsh shell
set shell=zsh

" Handle Unicode properly
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set fileencodings=utf-8
    scriptencoding utf-8
endif

" turn on python highlighted numbers, builtins, exceptions, and space errors
let python_highlight_all = 1

" }}}


" {{{ Look and Feel

" 256 Colours!
set t_Co=256

" Always a dark background!
set background=dark

" Solarized (dark) colour scheme
colorscheme solarized
highlight clear SignColumn
highlight! Conceal ctermbg=NONE cterm=bold ctermfg=darkmagenta guibg=NONE gui=bold guifg=darkmagenta

" Keep at least 5 lines above/below
set scrolloff=5

" highlight the current line
set cursorline

" allow windows to have a 0 line height
set winminheight=0

"  {{{ GUI Settings
if has("gui_running")
    " remove toolbar
    set guioptions-=T
    " fill screen!
    set lines=40 columns=130
    " Use system clipboard
    if has('x')
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif
endif
"  }}}

" Status Line
set laststatus=2
" superceded by Powerline
" set statusline=%n:%F%y%m%r%h%w\ [%{&ff}%(,%{&fenc}%)]\ [%c][%l/%L][%p%%]
" set statusline+=%{fugitive#statusline()}\ %(\ %#warningmsg#%{SyntasticStatuslineFlag()}%*%)
" Remove italics from the gui statusline
highlight statusline gui=none

" }}}


" {{{ Mappings

" 'ii' to exit insert mode
imap ii <Esc>

" '-' to disable highlighting for current search
map - :nohls<CR>

" sudo save
cmap w!! w !sudo tee % >/dev/null

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>
" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>
" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

" Cmd + B -> make
nnoremap <silent> <M-b> :make<CR>

" }}}


" {{{ Language Specifics

"  {{{ Haskell

au BufEnter *.hs compiler ghc

"  }}}

"  {{{ Markdown

au BufEnter *.md map <silent> <D-r> :silent !open -a Marked %<CR>

"  }}}

" }}}


" {{{ Plugin Settings

"  {{{ powerline
"
set runtimepath+=~/.vim/bundle/powerline/powerline/bindings/vim
set noshowmode
set guifont=Monaco\ for\ Powerline:h10

"  }}}

" map <D-r> to CPRun
noremap <silent> <D-r><CR> :CPRun<CR>
"  {{{ Jedi

let g:jedi#use_tabs_not_buffers=0
let g:jedi#popup_on_dot=0
let g:jedi#show_function_definition=0

"  }}}


"  }}}

"  {{{ pastie.vim

" map <D-p> to :%Pastie
" nomap <silent> <D-p> :%Pastie<CR>

"  }}}

"  {{{ fugitive.vim

noremap <leader>gs :Gstatus<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gd :Gdiff<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gl :Glog<CR>
noremap <leader>ge :Gedit<CR>
noremap <leader>gw :Gwrite<CR>
noremap <leader>go :Gbrowse<CR>
noremap <leader>g<Space> :Git

"  }}}


"  {{{ gist-vim

let g:gist_clip_command='pbcopy'
let g:gist_detect_filetype=1
let g:gist_show_privates=1
let g:gist_post_private=1
let g:gist_get_multiplefile = 1
noremap <leader>gg :Gist<CR>
noremap <leader>gG :Gist -P<CR>
noremap <leader>g!g :Gist -m<CR>
noremap <leader>g?g :Gist -a<CR>


"  }}}


"  {{{ taglist.vim

" map <D-e> to TlistToggle
noremap <silent> <D-e> :TlistToggle<CR>
" do not increase the size of my window
let Tlist_Inc_Winwidth=0

"  }}}

"  {{{ FuzzyFinder.vim

" map <D-d> to fuzzy file finder
noremap <silent> <D-d> :FufFile<CR>

"  }}}

"  {{{ nerdtree.vim

" map <D-d> to NERDTreeToggle
noremap <silent> <C-d> :NERDTreeToggle<CR>

"  }}}

"  {{{ syntastic.vim

" enable marking errors in the gutter
let g:syntastic_enable_signs=1
" enable automatic errors window
let g:syntastic_auto_loc_list=1
" 'sexy' unicode signs
let g:syntastic_error_symbol='✗'
let g:syntastic_style_error_symbol='S'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol='s'

"  }}}

"  {{{ ctrlp.vim

noremap <leader>p :CtrlPMixed<CR>

"  }}}

"  {{{ haskellmode_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
let g:haddock_docdir = "/usr/local/share/doc/ghc/html"
let g:haddock_indexfiledir = "~/.vim/tmp/"
"  }}}

" }}}


" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
