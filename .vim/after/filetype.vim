" Logic
autocmd BufRead,BufNewFile *.logic setfiletype logic

" .m files are "octave" files
augroup filetypedetect
  au! BufRead,BufNewFile *.m, set filetype=octave
augroup END
