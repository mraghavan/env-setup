" Vim filetype plugin file
" Language: LaTex

" command! T w | !lx %
command! T w | !file=% && pdflatex -file-line-error -halt-on-error "${file}" && open ${file\%.tex}.pdf
ab benum \\begin{enumerate}
ab eenum \\end{enumerate}
ab bal \\begin{align*}
ab eal \\end{align*}
