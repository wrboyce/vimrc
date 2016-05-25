"  {{{ pathogen.vim

call pathogen#infect()
call pathogen#helptags()

"  }}}


" {{{ Auto Commands

" Have viminfo remember a bunch of stuff
set viminfo=!,'100,<100,f100,h,s10,n~/.viminfo

" Restore cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Remove any trailing whitespace
autocmd BufWritePre * if ! &bin | silent! %s/\s\+$//ge | endif

" Automatically cd into the directory that the file is in
set autochdir

" }}}


" {{{ Misc Settings

" Disable vi compatability mode
set nocompatible

" hide buffers, don't close them
set hidden

" Show matching brackets/braces
set showmatch

" Folding
set foldmethod=marker

" use `grep -nH` for grepping
set grepprg=grep\ -nH\ $*

" Auto(smart)ident code
set smartindent

" Expand tabs to spaces
set expandtab

" Reduce the size of tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4

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

" Show wildcard matches as a list, longest common string
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a
" Automatically hide the cursor when typing
set mousehide

" Show line numbers
set number

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
" Highlight search matches
set hlsearch

" Backup to a central dir, to avoid clutter in workspace dirs
set directory=~/.vim/tmp
set nobackup "" disable backups.
"set backupdir=~/.vim/backup

" Modern terminal :)
set ttyfast

" zsh shell
set shell=zsh

" Handle Unicode properly
""if has("multi_byte")
""    if &termencoding == ""
""        let &termencoding = &encoding
""    endif
""    set encoding=utf-8
""    setglobal fileencoding=utf-8
""    set fileencodings=utf-8
""    scriptencoding utf-8
""endif

" enable modelines
set modelines=5

" }}}


" {{{ Look and Feel

" 256 Colours
set t_Co=256

" Always a dark background
set background=dark

" Solarized (dark) colour scheme
colorscheme solarized
highlight clear SignColumn
highlight! Conceal ctermbg=NONE cterm=bold ctermfg=darkmagenta guibg=NONE gui=bold guifg=darkmagenta

" Keep at least 5 lines spacing
set scrolloff=5
set sidescrolloff=5

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

highlight statusline gui=none

" }}}


" {{{ Mappings

" Fix home and end keybindings for screen
map [F $
imap [F $
map [H g0
imap [H g0

" '-' to clear highlighting for current search
map - :nohls<CR>

" sudo save
cmap w!! w !sudo tee % >/dev/null

" Next Tab
nnoremap <silent> <C-l> :tabnext<CR>
" Previous Tab
nnoremap <silent> <C-h> :tabprevious<CR>
" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

" Ctrl + B -> make
nnoremap <silent> <C-b> :make<CR>

" }}}


" {{{ Language Specifics

"  {{{ Python
"
" Allow lines longer than 80 chars
let g:syntastic_python_flake8_args='--ignore=E128,E501,E265,E731'

"  }}}

"  {{{ Haskell

au BufEnter *.hs compiler ghc

"  }}}

"  {{{ Markdown

au BufEnter *.md map <silent> <C-b> :silent !open -a Marked %<CR>

"  }}}

" }}}


" {{{ Plugin Settings

"  {{{ powerline
"
set runtimepath+=~/.vim/bundle/powerline/powerline/bindings/vim
set noshowmode
set guifont=Monaco\ for\ Powerline:h10

"  }}}

"  {{{ Jedi

let g:jedi#use_tabs_not_buffers=0
let g:jedi#popup_on_dot=0

"  }}}

"  {{{ SuperTab

let g:SuperTabDefaultCompletionType='context'

"  }}}

"  {{{ SnipMate

let g:snipMateAllowMatchingDot=0

"  }}}

"  {{{ ctrlp.vim

noremap <leader>p :CtrlPMixed<CR>

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

"  {{{ gitgutter

noremap <leader>gt :GitGutterSignsToggle<CR>
noremap <leader>gD :GitGutterLineHighlightsToggle<CR>
highlight link GitGutterAdd GitGutterAddLine
highlight link GitGutterChange GitGutterChangeLine
highlight link GitGutterDelete GitGutterDeleteLine
highlight link GitGutterChangeDelete GitGutterChangeDeleteLine

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

"  {{{ haskellmode_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
let g:haddock_docdir = "/usr/local/share/doc/ghc/html"
let g:haddock_indexfiledir = "~/.vim/tmp/"
"  }}}

"  {{{ numbers.vim
nnoremap <leader>n :NumbersToggle<CR>
"  }}}

"  {{{ UndoTree
nnoremap <leader>u :UndotreeToggle<CR>
"  }}}

" }}}
