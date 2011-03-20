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

" Automatically cd into the directory that the file is in
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Shows the current command being typed
set showcmd

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
set smarttab

" Reduce the size of tabs
set shiftwidth=4
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

" Wild Mode!
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a

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
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" ???
set ttyfast

" bash shell
set shell=bash

" turn on python highlighted numbers, builtins, exceptions, and space errors
let python_highlight_all = 1

" }}}


" {{{ Look and Feel

" Always a dark background!
set background=dark

" Colour scheme
colorscheme ir_black

" Keep at least 5 lines above/below
set scrolloff=5

"  {{{ GUI Settings
if has("gui_running")
    " remove toolbar
    set guioptions-=T
    " fill screen!
    set lines=40 columns=130
    " remove italics from the statusbar
endif
"  }}}

" Status Line
set laststatus=2
set statusline=%n:%F%y%m%r%h%w\ [%{&ff}%(,%{&fenc}%)]\ [%c][%l/%L][%p%%]
set statusline+=%(\ %#warningmsg#%{SyntasticStatuslineFlag()}%*%)
" Remove italics from the gui statusline
highlight statusline gui=none

" }}}


" {{{ Mappings

" 'ii' to exit insert mode
imap ii <Esc>

" '-' to disable highlighting for current search
map - :nohls<CR>

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

" }}}


" {{{ Plugin Settings

"  {{{ codepad.vim

" map <D-r> to CPRun
noremap <silent> <D-r><CR> :CPRun<CR>

"  }}}

"  {{{ pastie.vim

" map <D-p> to :%Pastie
" nomap <silent> <D-p> :%Pastie<CR>

"  }}}

"  {{{ taglist.vim

" map <D-e> to TlistToggle
noremap <silent> <D-e> :TlistToggle<CR>
" do not increase the size of my window
let Tlist_Inc_Winwidth=0

"  }}}

"  {{{ nerdtree.vim

" map <D-d> to NERDTreeToggle
noremap <silent> <D-d> :NERDTreeToggle<CR>

"  }}}

"  {{{ pydoc.vim

" map <D-/> to lookup current word
map  <D-/> :call ShowPyDoc('<C-R><C-W>', 1)<CR>
" disable highlighting of the term I looked up
" TODO: Perhaps I should underline it, or something similar
let g:pydoc_highlight = 0

"  }}}

"  {{{ syntastic.vim

" enable marking errors in the gutter
let g:syntastic_enable_signs=1
" enable automatic errors window
let g:syntastic_auto_loc_list=1

"  }}}

" }}}
