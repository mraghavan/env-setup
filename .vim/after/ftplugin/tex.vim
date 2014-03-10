" Vim filetype plugin file
" Language: LaTex

" command! T w | !lx %
command! T w | !file=% && pdflatex -file-line-error -halt-on-error "${file}" && open ${file\%.tex}.pdf
ab benum \\begin{enumerate}
ab eenum \\end{enumerate}
ab bal \\begin{align*}
ab eal \\end{align*}

" NORMAL
" comment out current line
nnoremap <leader>c I%%%<esc>
" uncomment current line
nnoremap <leader>v ^3x
" VISUAL
" ,c highilight lines and comment them out
vnoremap <silent> <leader>c <esc>`<O\iffalse<esc>`>o\fi<esc>
" ,v highlight lines and uncomment them
vnoremap <silent> <leader>v <esc>`<dd<esc>`>dd<esc>
