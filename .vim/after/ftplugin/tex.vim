" Vim filetype plugin file
" Language: LaTex

command! TT w | !file=% && pdflatex -output-directory='%:p:h' -file-line-error -halt-on-error -shell-escape "${file}" && open -a Skim ${file\%.tex}.pdf
command! T w | !file=% && pdflatex -output-directory='%:p:h' -file-line-error -halt-on-error -shell-escape "${file}"
command! B w | !file=% && biber "${file\%.tex}"
inoremap <buffer> <C-a> \begin{align*}<esc>yypwcwend<esc>O
inoremap <buffer> <C-v> \begin{enumerate}<esc>yypwcwend<esc>O\item 
inoremap <buffer> <C-b> \begin{itemize}<esc>yypwcwend<esc>O\item 
inoremap <buffer> <C-_> \begin{claim}<esc>yypwcwend<esc>o\begin{proof}<esc>yypwcwend<esc>

highlight! texItalBoldStyle cterm=bold
highlight! texBoldItalStyle cterm=bold
highlight! texItalStyle cterm=bold
highlight! texBoldStyle cterm=bold
set shiftwidth=2
set tabstop=2
setlocal textwidth=80
