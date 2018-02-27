# Vim Agriculture 🚜

A vim plugin to smart quote your ag searches.

# Installation

1. Install using [vim-plug](https://github.com/junegunn/vim-plug) or similar:

    ```
    Plug 'jesseleite/vim-agriculture'
    ```
    
2. Overwrite your favourite search wrapper to use `agriculture#smart_quote_input()` in your `.vimrc`.

   [Fzf.vim's :Ag](https://github.com/junegunn/fzf.vim):
   ```
   command! -bang -nargs=+ -complete=dir Ag call fzf#vim#ag_raw(agriculture#smart_quote_input(<q-args>), <bang>0)
   ```

   [Ack.vim's :Ack](https://github.com/mileszs/ack.vim):
   ```
   command! -bang -nargs=* -complete=file Ack call ack#Ack('grep<bang>', agriculture#smart_quote_input(<q-args>))
   ```

3. Save, source, and enjoy!

# Who am I?

Just a hack 🔨

- [jesseleite.com](https://jesseleite.com)
- [@jesseleite85](https://twitter.com/jesseleite85)
