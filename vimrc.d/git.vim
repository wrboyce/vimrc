" gitgutter
noremap <leader>gt :GitGutterSignsToggle<CR>
noremap <leader>gD :GitGutterLineHighlightsToggle<CR>
highlight link GitGutterAdd GitGutterAddLine
highlight link GitGutterChange GitGutterChangeLine
highlight link GitGutterDelete GitGutterDeleteLine
highlight link GitGutterChangeDelete GitGutterChangeDeleteLine

" fugitive
noremap <leader>gs :Gstatus<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gd :Gdiff<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gl :Glog<CR>
noremap <leader>ge :Gedit<CR>
noremap <leader>gw :Gwrite<CR>
noremap <leader>go :Gbrowse<CR>
noremap <leader>g<Space> :Git

" gist-vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1
noremap <leader>gg :Gist<CR>        " private gist
noremap <leader>gG :Gist -P<CR>     " public gist
noremap <leader>g!g :Gist -m<CR>    " private gist from all open tabs
noremap <leader>g?g :Gist -a<CR>    " anonymous gist from current tab
