" Vim filetype plugin file
" Language: octave
"
set expandtab
set smarttab

set tabstop=2
set shiftwidth=2

" Prevent auto unindent for comments
inoremap # X<C-h>#
" comment out current line
nnoremap <leader>c I# <esc>
" uncomment current line
nnoremap <leader>v ^2x
