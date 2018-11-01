" Commands
command! -bang -nargs=+ -complete=dir AgRaw call fzf#vim#ag_raw(agriculture#smart_quote_input(<q-args>), <bang>0)
command! -bang -nargs=+ -complete=dir RgRaw call agriculture#fzf_rg_raw(agriculture#smart_quote_input(<q-args>), <bang>0)

" Mappings
nnoremap <Plug>AgRawSearch :AgRaw<Space>
nnoremap <Plug>RgRawSearch :RgRaw<Space>

" Mappings to search visual selection
vnoremap <Plug>AgRawVisualSelection "ay:AgRaw -Q '<C-r>a'
vnoremap <Plug>RgRawVisualSelection "ay:RgRaw -F '<C-r>a'

" Mappings to search word under cursor
nnoremap <Plug>AgRawWordUnderCursor :AgRaw -Q '<C-R><C-W>'
nnoremap <Plug>RgRawWordUnderCursor :RgRaw -F '<C-R><C-W>'
