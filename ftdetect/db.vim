if &compatible || v:version < 603
    finish
endif

autocmd BufNewFile,BufRead *.db set ft=epics_db
