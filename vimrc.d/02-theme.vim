" 256 colours
set t_Co=256

" always a dark background
set background=dark

" airline
let g:airline_theme = 'base16_solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1

" solarized (dark) colour scheme
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

" keep at least 5 lines spacing
set scrolloff=5
set sidescrolloff=5

" highlight the current line
set cursorline

" allow windows to have a 0 line height
set winminheight=0

" gui settings
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
    set guifont=MesloLGS\ Nerd\ Font\ Mono:h11
endif

highlight statusline gui=none

" show matching brackets/braces
set showmatch
" show line numbers
set number

" short messages
set shortmess+=aI

" set title for xterm etc
set title
