" Commands
command! -bang -nargs=+ -complete=dir AgRaw call agriculture#fzf_ag_raw(agriculture#smart_quote_input(<q-args>), <bang>0)
command! -bang -nargs=+ -complete=dir RgRaw call agriculture#fzf_rg_raw(agriculture#smart_quote_input(<q-args>), <bang>0)

" Mappings
nnoremap <Plug>AgRawSearch :AgRaw<Space>
nnoremap <Plug>RgRawSearch :RgRaw<Space>

" Mappings to search visual selection
vnoremap <Plug>AgRawVisualSelection "ay:call agriculture#trim_and_escape_register_a()<CR>:AgRaw -Q -- <C-r>a
vnoremap <Plug>RgRawVisualSelection "ay:call agriculture#trim_and_escape_register_a()<CR>:RgRaw -F -- <C-r>a

" Mappings to search word under cursor
nnoremap <Plug>AgRawWordUnderCursor "ayiw:call agriculture#trim_and_escape_register_a()<CR>:AgRaw -Q -- <C-r>a
nnoremap <Plug>RgRawWordUnderCursor "ayiw:call agriculture#trim_and_escape_register_a()<CR>:RgRaw -F -- <C-r>a
