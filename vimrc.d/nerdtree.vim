" quit vim if the only buffer left is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let NERDTreeRespectWildIgnore = 1
let NERDTreeMouseMode= 2
let NERDTreeMinimalUI = 1
let NERDTreeCascadeSingleChildDir = 1
let NERDTreeCascadeOpenSingleChildDir = 1

map <C-d> :NERDTreeFind<CR>
