if has('neovim')
    let s:python_host_init = 'python -c "import neovim; neovim.start_host()"'
    let &initpython = s:python_host_init
endif
" Configuration file for vim
set nocompatible    " Use Vim defaults instead of 100% vi compatibility

" vundle stuff
" download: git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" instructions: https://github.com/gmarik/Vundle.vim
" use BundleInstall 'scrooloose/nerdtree'
" and BundleInstall 'jlanzarotta/bufexplorer'
" etc.
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'tpope/vim-surround'
Bundle 'https://github.com/vim-scripts/TaskList.vim'
Bundle 'scrooloose/syntastic'
"Bundle 'jiangmiao/auto-pairs'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Valloric/YouCompleteMe'
"Bundle 'ervandew/supertab'

set grepprg=grep\ -nH\ $*

let g:Powerline_theme = 'custom'
let g:Powerline_colorscheme = 'turtle2'

let g:ycm_always_populate_location_list = 0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_blacklist = { 'tex' : 1 }
let g:ycm_path_to_python_interpreter = '/usr/bin/python'


let g:syntastic_mode_map = { 'mode': 'passive',
                               \ 'active_filetypes': ['ruby', 'php'],
                               \ 'passive_filetypes': ['puppet'] }

filetype indent plugin on

set modelines=0     " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set backspace=2     " more powerful backspacing

syntax on
set tabstop=4           " tab width is 4
set shiftwidth=4
set expandtab
set number              " line numbers
set hidden              " hide buffers, don't close - useful for autocomplete
set hlsearch            " highlight search results
set incsearch           " show search matches as you type
set autoindent
set smartindent
set undolevels=1000
set smartcase           " ignore case/don't ignore for searches
set pastetoggle=<F2>    " press F2 when pasting text in insert mode using Command-v
set mouse=a             " use the mouse while holding down alt (option)
set noerrorbells
set visualbell
set title               " title for terminal window
" set autochdir
set autoread
set wildmenu
set lazyredraw
set splitright
set showtabline=2
set tabpagemax=15
set nojoinspaces

" COLORS
colorscheme teal_airline

" Overridden by vim-airline
set laststatus=2
set statusline=
set statusline+=\                           " start of status
set statusline+=%-20.80f                    " file name
set statusline+=\ [%l/%L,                   " line #/total
set statusline+=%-(%c%)]                    " column #
set statusline+=%-4.(%m%)                   " modified [+]
set statusline+=%-5.(%r%)                   " read only [RO]
set statusline+=%-5.(%y%)                   " file type [vim]
set statusline+=%=                          " right align
set statusline+=%<%P\ 

set wildignore=
set wildignore+=*.out,*.o,*.class
set wildignore+=.git/,.hg/,.svn/
set wildignore+=.DS_Store,.localized
set wildignore+=*.bmp,*.gif,*.jpg,*.png
set wildignore+=*.swp
set wildignore+=*.aux,*.dvi,*.pdf

set foldmethod=syntax
" Don't fold new file
set nofoldenable

let g:tex_flavor = "latex"
set iskeyword+=:

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
inoremap <C-j> <C-f><C-o>o
inoremap <C-l> <C-o>A
" ctrl+g get the the end of a word (e.g. to close a parenthesis)
inoremap <C-g> <C-o>e<C-o>a

" NOMRAL MODE
" <space> and ,/ clear highlighting
nnoremap <silent> <space> :nohlsearch<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>
" ,. save and quit
nnoremap <silent> <leader>. :q<CR>
" ,m OR <enter> save
nnoremap <silent> <leader>m :w<CR>
nnoremap <CR> :w<CR>
nnoremap ; :
nnoremap <leader>s :source ~/.vimrc<CR>
" wrap text
nnoremap <silent> <leader>g :call WrapPar()<CR>
nnoremap \ $
" tab/shift+tab switch between windows
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W
nnoremap <C-t> :tabnew<SPACE>
nnoremap <C-l> :tabn<CR>
nnoremap <C-h> :tabp<CR>

" up/down/j/k don't jump over wrap-around lines
nnoremap <DOWN> gj
nnoremap <UP> gk
nnoremap j gj
nnoremap k gk

" open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
" pull up BufExplorer - useful for finding a buffer
" among a bunch of tabs/splits
nnoremap <C-a> <ESC>:BufExplorerVerticalSplit<CR>
inoremap <C-a> <ESC>:BufExplorerVerticalSplit<CR>
command! S w | SyntasticCheck

" reopen a buffer in a vsplit
nnoremap <C-x> :buffers<CR>:vert sb<SPACE>
inoremap <C-x> <ESC>:buffers<CR>:vert sb<SPACE>
" reopen a buffer in a new tab
nnoremap <C-c> :buffers<CR>:tabnew \| b<SPACE>

" ctrl+k toggle high visibility for the cursor
nnoremap <C-K> :call HighlightNearCursor()<CR>

nnoremap <F8> :setl noai nocin nosi inde=<CR>

command! Q execute "tabclose"
command! B buffers

function! HighlightNearCursor()
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
