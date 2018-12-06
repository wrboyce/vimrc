" persistent undo
set undofile
set undodir=~/.vim/.undo
set undolevels=1000
set undoreload=10000

" toggle undotree with <leader>u
nnoremap <leader>u :UndotreeToggle<CR>
