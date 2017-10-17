"  {{{ pathogen.vim

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

"  }}}


" {{{ Auto Commands

" Have viminfo remember a bunch of stuff
set viminfo=!,'100,<100,f100,s10,n~/.viminfo

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

" persistent undo
set undofile
set undodir=~/.vim/.undo
set undolevels=1000
set undoreload=10000

" Backup to a central dir, to avoid clutter in workspace dirs
set directory=~/.vim/.tmp
set backupdir=~/.vim/.backup

" Modern terminal :)
set ttyfast

" zsh shell
set shell=zsh

" enable modelines
set modelines=5

" }}}


" {{{ Look and Feel

" 256 Colours
set t_Co=256

" Always a dark background
set background=dark

" Solarized (dark) colour scheme
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
else
    colorscheme solarized
endif

highlight clear SignColumn
highlight! Conceal ctermbg=NONE cterm=bold ctermfg=darkmagenta guibg=NONE gui=bold guifg=darkmagenta
" highlight cols 80,100 and 120+
let &colorcolumn="80,100,".join(range(120,999),",")

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
    " use powerline font
    set guifont=Monaco\ for\ Powerline:h11
endif
"  }}}

highlight statusline gui=none

" }}}


" {{{ Mappings

" '-' to clear highlighting for current search
map - :nohls<CR>

" sudo save
cmap w!! w !sudo tee % >/dev/null

" cd to files current directory
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

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

"  {{{ Markdown

au BufEnter *.md map <silent> <C-b> :silent !open -a Marked\ 2 %<CR>

"  }}}

" }}}


" {{{ Plugin Settings

"  {{{ airline

let g:airline_theme='base16_solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1

"  }}}

"  {{{ ALE

let g:ale_open_list=1

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
" private gist
noremap <leader>gg :Gist<CR>
" public gist
noremap <leader>gG :Gist -P<CR>
" private gist from all open tabs
noremap <leader>g!g :Gist -m<CR>
" anonymous gist from current tab
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

"  {{{ numbers.vim
nnoremap <leader>n :NumbersToggle<CR>
"  }}}

"  {{{ UndoTree
nnoremap <leader>u :UndotreeToggle<CR>
"  }}}

" }}}
