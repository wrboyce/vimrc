" use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
   " enable spellchecking on new txt files
   autocmd BufNewFile,BufRead *.txt setlocal spell
endif

