" persistent undo
set undofile
set undodir=~/.config/nvim/.undo
set undolevels=1000
set undoreload=10000

" toggle undotree with <leader>u
nnoremap <leader>u :UndotreeToggle<CR>
