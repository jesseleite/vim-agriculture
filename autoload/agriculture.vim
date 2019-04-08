function! agriculture#smart_quote_input(input)
  let hasQuotes = match(a:input, '"') > -1 || match(a:input, "'") > -1
  let hasOptions = match(' ' . a:input, '\s-[-a-zA-Z]') > -1
  let hasEscapedSpacesPlusPath = match(a:input, '\\ .*\ ') > 0
  return hasQuotes || hasOptions || hasEscapedSpacesPlusPath ? a:input : '-- "' . a:input . '"'
endfunction

function! agriculture#trim_and_escape_register_a()
  let query = getreg('a')
  let trimmedQuery = trim(query)
  let escapedQuery = escape(trimmedQuery, "'#%\\")
  call setreg('a', escapedQuery)
endfunction

function! agriculture#fzf_ag_raw(command_suffix, ...)
  if !executable('ag')
    return s:warn('ag is not found')
  endif
  let userOptions = get(g:, 'agriculture#ag_options', '')
  let command = 'ag --nogroup --column --color ' . trim(userOptions . ' ' . a:command_suffix)
  return call('fzf#vim#grep', extend([command, 1], a:000))
endfunction

function! agriculture#fzf_rg_raw(command_suffix, ...)
  if !executable('rg')
    return s:warn('rg is not found')
  endif
  let userOptions = get(g:, 'agriculture#rg_options', '')
  let command = 'rg --column --line-number --no-heading --color=always ' . trim(userOptions . ' ' . a:command_suffix)
  return call('fzf#vim#grep', extend([command, 1], a:000))
endfunction

function! s:warn(message)
  echohl WarningMsg
  echom a:message
  echohl None
  return 0
endfunction
