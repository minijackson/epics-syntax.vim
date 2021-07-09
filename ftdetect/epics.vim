if &compatible || v:version < 603
    finish
endif

function ftdetect#epics#SetFileTypeCmd()
    echom 'hello'

    if getline(1) =~# '^#!'
        set filetype=epics_cmd
    endif
endfunction

autocmd BufNewFile,BufRead *.db,*.template set filetype=epics_db
autocmd BufNewFile,BufRead *.sub,*.substitutions set filetype=epics_msi
autocmd BufNewFile,BufRead *.cmd call ftdetect#epics#SetFileTypeCmd()
