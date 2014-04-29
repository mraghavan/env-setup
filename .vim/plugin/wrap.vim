function! WrapPar()
    let line_number = line('.')
    let line=getline('.')
    silent! exec 'norm! ^'
    let indent_level=col('.')
    if indent_level == 0
        silent! exec 'norm! gqap'
        return
    endif
    let ind=indent_level
    let down = 0
    let prev = 0
    while ind == indent_level && line('.') != line('$')
        silent! exec 'norm! j'
        let line=getline('.')
        silent! exec 'norm! ^'
        let ind=col('.')
        if prev == 1
            let ind = -1
        elseif match(line, '\m\\\\$') >= 0
            let prev = 1
        endif
        let down += 1
    endwhile
    " return to original line
    silent! exec 'norm! '.down.'k'
    let down -= 1
    let up = 0
    let ind = indent_level
    while ind == indent_level && line('.') != 1
        silent! exec 'norm! k'
        let line=getline('.')
        silent! exec 'norm! ^'
        let ind=col('.')
        if match(line, '\m\\\\$') >= 0
            let ind = -1
        endif
        let up += 1
    endwhile
    let up -= 1
    let tot = up + down
    silent! exec 'norm! j'
    silent! exec 'norm! gq'.tot.'j'
    silent! exec 'norm! '.line_number.'G'
endfunction
