if &compatible || v:version < 603
    finish
endif

autocmd BufNewFile,BufRead *.db,*.template set ft=epics_db
autocmd BufNewFile,BufRead *.sub,*.substitutions set ft=epics_msi
