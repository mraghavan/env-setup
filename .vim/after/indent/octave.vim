" Octave indent file
" Language:	Octave
" Modified By: Manish Raghavan
" Original Author:	Christophe Poucet <christophe.poucet@pandora.be>
" Original Language: Matlab
" Last Change:	7 January, 2014

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

" Some preliminary setting
setlocal indentkeys=!,o,O=end,=case,=else,=elseif,=otherwise,=catch


setlocal indentexpr=GetOctaveIndent(v:lnum)

" Only define the function once.
if exists("*GetOctaveIndent")
  finish
endif

function GetOctaveIndent(lnum)
  " Give up if this line is explicitly joined.
  if getline(a:lnum - 1) =~ '\\$'
    return -1
  endif

  let plnum = prevnonblank(v:lnum - 1)
  let prevline = getline(plnum)

  if plnum == 0
    " This is the first non-empty line, use zero indent.
    return 0
  endif

  let curind = indent(plnum)

  " Dedent after return
  if prevline =~ '^\s*\(return\)\>'
    if indent(a:lnum) > curind - &sw
      return curind - &sw
    endif
  endif

  " Double indent after the first ...
  " but not on subsequent lines
  if prevline =~ '^\s*.*\.\.\.$'
    let plnum2 = prevnonblank(plnum - 1)
    if (indent(a:lnum) < curind + 2 * &sw) && !(getline(plnum2) =~ '^\s*.*\.\.\.$')
      return curind + 2 * &sw
    endif
  endif

  " If the current line is a stop-block statement...
  if getline(v:lnum) =~ '^\s*\(end\|else\|elseif\|case\|otherwise\|catch\)\>'
    " See if this line does not follow the line right after an openblock
    if prevline =~ '^\s*\(for\|if\|else\|elseif\|case\|while\|switch\|try\|otherwise\|catch\)\>'
    " See if the user has already dedented
    elseif indent(v:lnum) > curind - &sw
      " If not, recommend one dedent
	let curind = curind - &sw
    else
      " Otherwise, trust the user
      return -1
    endif
"  endif

  " If the previous line opened a block
  elseif prevline =~ '^\s*\(for\|if\|else\|elseif\|case\|while\|switch\|try\|otherwise\|catch\|function\)\>'
    " See if the user has already indented
    if indent(v:lnum) < curind + &sw
      "If not, recommend indent
      let curind = curind + &sw
    else
      " Otherwise, trust the user
      return -1
    endif
  endif



  " If we got to here, it means that the user takes the standardversion, so we return it
  return curind
endfunction

" vim:sw=2
