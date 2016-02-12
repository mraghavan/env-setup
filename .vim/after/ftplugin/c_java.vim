" Vim filetype plugin file
" Language: C, Java
" Maps common to both C and java

" NORMAL
" ,i surround current line with if statement
nnoremap <silent> <leader>i >>Oif () {<esc>jo}<esc>kkf)i

" VISUAL
" ,i highlight lines and surround them with if
vnoremap <silent> <leader>i >`<Oif () {<esc>`>o}<esc>`<kf)i
