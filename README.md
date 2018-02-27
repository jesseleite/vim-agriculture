# Vim Agriculture 🚜

A vim plugin to smart quote your [ag](https://github.com/ggreer/the_silver_searcher) searches.

# Rationale

I was inspired by [Fzf.vim](https://github.com/junegunn/fzf.vim)'s ability to quickly `:Ag` search multiple words without quotes, narrow down multiple results in realtime with [extended search syntax](https://github.com/junegunn/fzf#search-syntax), then populate quickfix for a large refactor 👌

```
:Ag function index
```

But I found myself missing the ability to pass options to like I could with [Ack.vim](https://github.com/mileszs/ack.vim)'s `:Ack` 😢

```
:Ack -Q -i 'function index' vendor
```

Furthermore, switching between both tools was frustrating because Ack.vim always required quotes for multi word searches, but Fzf.vim treated quotes as a literal part of the search query.

Thus, the intention of this plugin is to bring the best of both worlds to your favourite search wrapper.  Perform multi-word searches with or without quotes, pass options, and do it all from one command! ❤️

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
