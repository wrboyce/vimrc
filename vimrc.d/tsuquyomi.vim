let g:tsuquyomi_disable_quickfix = 1

if has('balloon_eval')
  au BufEnter,BufNew *.ts set noballooneval
endif
