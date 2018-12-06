" '-' to clear highlighting for current search
map - :nohls<CR>

" sudo save
cmap w!! w !sudo tee % >/dev/null

" cd to files current directory
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

" next tab
nnoremap <silent> <C-l> :tabnext<CR>
" previous tab
nnoremap <silent> <C-h> :tabprevious<CR>
" new tab
nnoremap <silent> <C-t> :tabnew<CR>

" ctrl + b -> make
nnoremap <silent> <C-b> :make<CR>
