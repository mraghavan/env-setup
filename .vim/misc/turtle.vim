" vim-airline colorscheme
" for more info, install vim-airline and look at
" vim-airline/autoload/airline/themes/dark.vim

let g:airline#themes#turtle#palette = {}

let s:N1   = [ '#00005f' , '#dfff00' , 232  , 190 ]
let s:N2   = [ '#ffffff' , '#444444' , 255 , 238 ]
let s:N3   = [ '#9cffd3' , '#202020' , 127  , 233 ]
let s:WARN = [ ''        , ''        , 15  , 160 ]
let g:airline#themes#turtle#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#turtle#palette.normal.airline_warning = s:WARN

" Here we define overrides for when the buffer is modified.  This will be
" applied after g:airline#themes#turtle#palette.normal, hence why only certain keys are
" declared.
let g:airline#themes#turtle#palette.normal_modified = {
      \ 'airline_c': [ '#ffffff' , '#5f005f' , 255     , 53      , ''     ] ,
      \ 'airline_warning': s:WARN ,
      \ }


let s:I1 = [ '#00005f' , '#00dfff' , 17  , 57  ]
let s:I2   = [ '#ffffff' , '#444444' , 255 , 238 ]
let s:I3   = [ '#9cffd3' , '#202020' , 127  , 233 ]
let g:airline#themes#turtle#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#turtle#palette.insert.airline_warning = s:WARN
let g:airline#themes#turtle#palette.insert_modified = {
      \ 'airline_c': [ '#ffffff' , '#5f005f' , 255     , 53      , ''     ] ,
      \ 'airline_warning': s:WARN ,
      \ }
let g:airline#themes#turtle#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , '#d78700' , s:I1[2] , 172     , ''     ] ,
      \ }


let g:airline#themes#turtle#palette.replace = copy(g:airline#themes#turtle#palette.insert)
let g:airline#themes#turtle#palette.replace.airline_a = [ s:I2[0]   , '#af0000' , s:I2[2] , 124     , ''     ]
let g:airline#themes#turtle#palette.replace_modified = g:airline#themes#turtle#palette.insert_modified


let s:V1   = [ '#00005f' , '#dfff00' , 17  , 23 ]
let s:V2 = s:N2
let s:V3 = s:N3
let g:airline#themes#turtle#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#turtle#palette.visual.airline_warning = s:WARN
let g:airline#themes#turtle#palette.visual_modified = {
      \ 'airline_c': [ '#ffffff' , '#5f005f' , 255     , 53      , ''     ] ,
      \ 'airline_warning': s:WARN ,
      \ }


let s:IA1 = [ '#4e4e4e' , '#1c1c1c' , 239 , 234 , '' ]
let s:IA2 = [ '#4e4e4e' , '#262626' , 239 , 235 , '' ]
let s:IA3 = [ '#4e4e4e' , '#303030' , 246 , 236 , '' ]
let g:airline#themes#turtle#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#turtle#palette.inactive.airline_warning = s:WARN
let g:airline#themes#turtle#palette.inactive_modified = {
      \ 'airline_c': [ '#875faf' , '' , 158 , '' , '' ] ,
      \ 'airline_warning': s:WARN ,
      \ }

let g:airline#themes#turtle#palette.syntastic = {
      \ 'airline_c': [ '#875faf' , '' , 158 , '' , '' ] ,
      \ }


" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a "red" accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
let g:airline#themes#turtle#palette.accents = {
      \ 'red': [ '#ff0000' , '' , 160 , ''  ]
      \ }


" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#turtle#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#d7d7ff' , '#5f00af' , 189 , 55  , ''     ],
      \ [ '#ffffff' , '#875fd7' , 231 , 98  , ''     ],
      \ [ '#5f00af' , '#ffffff' , 55  , 231 , 'bold' ])

