function! SetCTags()
    let curdir = split(substitute(system('pwd'), "\n", "", ""), "/")
    let ctagdir = ""
    for folder in curdir
        let ctagdir .= "/" . folder
        let ctagfile = substitute(system('ls ' . ctagdir . '/tags'), "\n", "", "")
        if match(ctagfile, "^.*tags$") != -1
            execute 'autocmd BufEnter * :setlocal tags+=' . ctagfile
        else
            let ctagfile = substitute(system('ls ' . ctagdir . '/TAGS'), "\n", "", "")
            if match(ctagfile, "^.*TAGS$") != -1
                execute 'autocmd BufEnter * :setlocal tags+=' . ctagfile
            endif
        endif
    endfor
    unlet ctagdir
    unlet ctagfile
    unlet curdir
endfunc

call SetCTags()
