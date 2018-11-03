function! agriculture#smart_quote_input(input)
  let hasQuotes = match(a:input, '"') > -1 || match(a:input, "'") > -1
  let hasOptions = match(' ' . a:input, '\s-[-a-zA-Z]') > -1
  let hasEscapedSpacesPlusPath = match(a:input, '\\ .*\ ') > 0
  return hasQuotes || hasOptions || hasEscapedSpacesPlusPath ? a:input : '-- "' . a:input . '"'
endfunction

function! agriculture#escape_quotes_in_register_a()
  let query = getreg('a')
  let escapedQuery = escape(query, "'#\\")
  call setreg('a', escapedQuery)
endfunction

function! agriculture#fzf_rg_raw(command_suffix, ...)
  if !executable('rg')
    return s:warn('rg is not found')
  endif
  return call('fzf#vim#grep', extend(['rg --column --line-number --no-heading --color=always '.a:command_suffix, 1], a:000))
endfunction

function! s:warn(message)
  echohl WarningMsg
  echom a:message
  echohl None
  return 0
endfunction
