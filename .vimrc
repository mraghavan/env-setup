" /usr/share/vimrc
" Configuration file for vim
set fileformat=mac
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

syntax on
filetype indent plugin on
set tabstop=4		    " tab width is 4
set shiftwidth=4
set expandtab
set number		        " line numbers
set hidden	            " hide buffers, don't close - useful for autocomplete
set hlsearch	    	" highlight search results
set incsearch		    " show search matches as you type
set autoindent
set smartindent
set undolevels=1000
set smartcase		    " ignore case/don't ignore for searches
set pastetoggle=<F2>	" press F2 when pasting text in insert mode using Command-v
set mouse=a             " use the mouse while holding down alt (option)
set noerrorbells
set visualbell
set title				" title for terminal window
set wildmenu
set lazyredraw
set splitright

" COLORS
" Darker gray statusline
highlight StatusLine cterm=reverse ctermfg=26 ctermbg=15
highlight StatusLineNC ctermfg=8 ctermbg=15
" Blue comments
highlight Comment ctermfg=26
" Brighter constnats
highlight Constant ctermfg=9
" Brighter sky blue for identifiers
highlight Identifier ctermfg=14
" Autocomplete menu highlighting - blue menu, black/yellow selection
highlight Pmenu ctermbg=26
highlight PmenuSel ctermfg=0 ctermbg=184
" Coloring for folding
highlight Folded ctermfg=15 ctermbg=8
" Coloring for border
highlight VertSplit ctermfg=0 ctermbg=15
" Coloring for menu
highlight WildMenu ctermfg=0 ctermbg=8

set laststatus=2
set statusline=
set statusline+=\                 		" start of status
set statusline+=%-20.80f					" file name
set statusline+=\ line\ %l/%L				" line #/total
set statusline+=\ column\ %-4.(%c%)			" column #
set statusline+=%-4.(%m%)					" modified [+]
set statusline+=%-5.(%r%)					" read only [RO]
set statusline+=%-5.(%y%)					" file type [vim]
set statusline+=%=							" right align
set statusline+=%<%P\ 

set foldmethod=syntax
" Don't fold new file
set nofoldenable

" Don't unfold while typing
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" MAPPINGS
let mapleader=","

" INSERT MODE
" ctrl+space autocomplete. Use repeatedly to go through list of possibilities
inoremap <Nul> <C-P>
" ctrl+[hjl] navigate while in insert mode
inoremap <C-h> <C-o>I
inoremap <C-j> <C-o>o
inoremap <C-l> <C-o>A
" ctrl+g get the the end of a word (e.g. to close a parenthesis)
inoremap <C-g> <C-o>e<C-o>a
" alt+= delete the next character
inoremap ≠ <Del>

" NOMRAL MODE
" ,/ clear highlighting
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap ; :
nnoremap <leader>s :source ~/.vimrc<CR>
" tab/shift+tab switch between windows
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" ctrl+k toggle high visibility for the cursor
nnoremap <C-K> :call HighlightNearCursor()<CR>
" ,[ad][sw] scroll adjacent window
nnoremap <silent> <leader>dw :call ScrollOther("right", "up")<CR>
nnoremap <silent> <leader>ds :call ScrollOther("right", "down")<CR>
nnoremap <silent> <leader>aw :call ScrollOther("left", "up")<CR>
nnoremap <silent> <leader>as :call ScrollOther("left", "down")<CR>

function ScrollOther(horiz, vert)
	if a:horiz == "left"
		let hmove = "W"
		let revmove = "w"
	elseif a:horiz == "right"
		let hmove = "w"
		let revmove = "W"
	endif
	if a:vert == "up"
		let vmove = "\<C-U>"
	elseif a:vert == "down"
		let vmove = "\<C-D>"
	endif
	exec "normal \<C-W>" . hmove . vmove . "\<C-W>" . revmove
endfunction

function HighlightNearCursor()
  if !exists("s:highlightcursor")
    match Todo /\k*\%#\k*/
    set cursorline
    let s:highlightcursor=1
  else
    match None
    set nocursorline
    unlet s:highlightcursor
  endif
endfunction

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
