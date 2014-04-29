" Authors:
"   @skwp
"   @manishraghavan
"
" turtle2 colorscheme for vim-powerline
call Pl#Hi#Allocate({
	\ 'black'          : 16,
	\ 'white'          : 231,
	\
	\ 'darkestgreen'   : 22,
	\ 'darkgreen'      : 28,
	\ 'mediumgreen'    : 70,
	\ 'lighterblue'  : 80,
	\ 'brightgreen'    : 148,
	\
	\ 'darkestcyan'    : 23,
	\ 'mediumcyan'     : 117,
	\
    \ 'darkerblue'     : 17,
	\ 'darkestblue'    : 24,
	\ 'darkblue'       : 31,
	\
	\ 'darkestred'     : 52,
	\ 'darkred'        : 88,
	\ 'mediumred'      : 124,
	\ 'brightred'      : 160,
	\ 'brightestred'   : 196,
	\
    \ 'darkpink'       : 53,
	\ 'mediumpink'     : 127,
    \ 'brightpink'     : 199,
    \
    \ 'bluepurple'     : 57,
	\ 'darkestpurple'  : 55,
	\ 'mediumpurple'   : 98,
	\ 'brightpurple'   : 189,
	\
    \ 'mediumyellow'   : 190,
	\
	\ 'brightorange'   : 208,
	\ 'brightestorange': 214,
	\
	\ 'gray0'          : 233,
	\ 'gray1'          : 235,
	\ 'gray2'          : 236,
	\ 'gray3'          : 239,
	\ 'gray4'          : 240,
	\ 'gray5'          : 241,
	\ 'gray6'          : 244,
	\ 'gray7'          : 245,
	\ 'gray8'          : 247,
	\ 'gray9'          : 250,
	\ 'gray10'         : 252,
    \ 'lightestgray'   : 255,
	\
	\ 'base03'         : [234, 0x002b36],
	\ 'base02'         : [235, 0x073642],
	\ 'base01'         : [240, 0x586e75],
	\ 'base00'         : [241, 0x657b83],
	\ 'base0'          : [244, 0x839496],
	\ 'base1'          : [245, 0x93a1a1],
	\ 'base2'          : [254, 0xeee8d5],
	\ 'base3'          : [230, 0xfdf6e3],
	\ 'yellow'         : [136, 0xb58900],
	\ 'orange'         : [166, 0xcb4b16],
	\ 'red'            : [160, 0xdc322f],
	\ 'magenta'        : [125, 0xd33682],
	\ 'violet'         : [61, 0x6c71c4],
	\ 'blue'           : [33, 0x268bd2],
	\ 'cyan'           : [37, 0x2aa198],
	\ 'green'          : [64, 0x859900],
	\ })

let g:Powerline#Colorschemes#turtle2#colorscheme = Pl#Colorscheme#Init([
	\ Pl#Hi#Segments(['SPLIT'], {
		\ 'n': ['base02', 'base02'],
		\ 'N': ['base02', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['mode_indicator'], {
		\ 'n': ['black', 'mediumyellow', ['bold']],
		\ 'i': ['white', 'bluepurple', ['bold']],
		\ 'v': ['darkerblue', 'darkestcyan', ['bold']],
		\ 'r': ['lightestgray', 'mediumred', ['bold']],
		\ 's': ['white', 'gray5', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['branch', 'raw', 'filesize'], {
		\ 'n': ['base03', 'blue'],
		\ 'N': ['gray5', 'base03'],
		\ }),
	\
	\ Pl#Hi#Segments(['scrollpercent'], {
		\ 'n': ['cyan', 'base02'],
		\ 'N': ['base2', 'base02'],
		\ 'i': ['violet', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['fileinfo', 'filename', 'filepath'], {
		\ 'n': ['mediumpink', 'gray0', ['bold']],
		\ 'N': ['base1', 'base02', ['bold']],
		\ 'i': ['blue', 'gray0', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['fileinfo.filepath'], {
		\ 'n': ['gray10'],
		\ 'N': ['gray5'],
		\ 'i': ['mediumpink'],
		\ }),
	\
	\ Pl#Hi#Segments(['static_str'], {
		\ 'n': ['base3', 'violet'],
		\ 'N': ['base1', 'base02'],
		\ 'i': ['white', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['fileinfo.flags'], {
		\ 'n': ['blue', ['bold']],
		\ 'N': ['blue'],
		\ 'i': ['blue', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['currenttag', 'fullcurrenttag', 'fileformat', 'fileencoding', 'pwd', 'filetype', 'rvm:string', 'rvm:statusline', 'virtualenv:statusline', 'charcode', 'currhigroup'], {
		\ 'n': ['cyan', 'base02'],
		\ 'i': ['violet', 'base02'],
		\ }),
	\
	\ Pl#Hi#Segments(['lineinfo'], {
		\ 'n': ['gray2', 'gray10', ['bold']],
		\ 'N': ['gray7', 'gray1', ['bold']],
		\ 'i': ['gray8', 'bluepurple', ['bold']],
		\ 'v': ['gray8', 'darkestcyan', ['bold']],
		\ 'r': ['gray8', 'mediumred', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['errors'], {
		\ 'n': ['white', 'red', ['bold']],
		\ 'N': ['gray5', 'base03', ['bold']],
		\ }),
	\
	\ Pl#Hi#Segments(['lineinfo.line.tot'], {
		\ 'n': ['darkestcyan'],
		\ 'N': ['gray6'],
		\ 'i': ['white'],
		\ 'v': ['white'],
		\ 'r': ['white'],
		\ }),
	\
	\ Pl#Hi#Segments(['paste_indicator', 'ws_marker'], {
		\ 'n': ['base3', 'red', ['bold']],
		\ }),
	\
  \
  \ Pl#Hi#Segments(['status'], {
		\ 'n': ['green', 'base02'],
		\ 'N': ['gray5', 'base02'],
    \ }),
\ ])

