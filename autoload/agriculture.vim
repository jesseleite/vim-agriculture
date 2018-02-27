function! agriculture#smart_quote_input(input)
  let hasQuotes = match(a:input, '"') > -1 || match(a:input, "'") > -1
  let hasOptions = match(' ' . a:input, '\s-') > -1
  let hasEscapedSpacesPlusPath = match(a:input, '\\ .*\ ') > 0
  return hasQuotes || hasOptions || hasEscapedSpacesPlusPath ? a:input : '"' . a:input . '"'
endfunction

