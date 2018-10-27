command! -bang -nargs=+ -complete=dir AgRaw call fzf#vim#ag_raw(agriculture#smart_quote_input(<q-args>), <bang>0)

command! -bang -nargs=+ -complete=dir RgRaw call agriculture#fzf_rg_raw(agriculture#smart_quote_input(<q-args>), <bang>0)
