# Vim Agriculture 🚜

A vim plugin to improve the project search experience when using tools like [ag](https://github.com/ggreer/the_silver_searcher) and [rg](https://github.com/BurntSushi/ripgrep).

- [Rationale](#rationale)
- [Installation](#installation)
- [Usage](#usage)
- [Mappings](#mappings)
- [Customization](#customization)
- [How It Works](#how-it-works)

## Rationale

I was inspired by [fzf.vim](https://github.com/junegunn/fzf.vim)'s ability to quickly `:Ag` search multiple words without quotes, narrow down multiple results in realtime with [extended search syntax](https://github.com/junegunn/fzf#search-syntax), then populate quickfix for a large refactor 👌

```
:Ag function index
```

But I found myself missing the ability to pass command line options like I could with [ack.vim](https://github.com/mileszs/ack.vim)'s `:Ack` 😢

```
:Ack -Q -i 'function index' vendor
```

Furthermore, fzf.vim's `:Ag` treats quotes as a literal part of the search query, which is inconsistent with `ag` on the command line.

Thus, the intention of this plugin is to bring the best of both worlds to your favourite search wrapper.  Perform multi-word searches with or without quotes, pass command line options, and do it all from one command.

[Read more about my project searching workflow with fzf.vim and agriculture](https://jesseleite.com/posts/4/project-search-your-feelings) ❤️

## Installation

Install using [vim-plug](https://github.com/junegunn/vim-plug) or similar:

```vim
Plug 'jesseleite/vim-agriculture'
```

## Usage

If you are already using [fzf.vim](https://github.com/junegunn/fzf.vim) or [fzf-lua](https://github.com/ibhagwan/fzf-lua) you can use the provided `:AgRaw` / `:RgRaw` commands.

```vim
:AgRaw func.*index
:AgRaw 'func.*index'
:AgRaw -Q 'function index()' app/Http/Controllers
```

Likewise for `:RgRaw`, just substitute `AgRaw` in `RgRaw` in the above examples.

If you are using another search wrapper, you'll need to wrap your input with `agriculture#smart_quote_input()`.

## Mappings

If you are using one of the provided commands, you can hook into the provided `<Plug>` mappings in your `.vimrc`:

```vim
nmap <Leader>/ <Plug>AgRawSearch
vmap <Leader>/ <Plug>AgRawVisualSelection
nmap <Leader>* <Plug>AgRawWordUnderCursor
```

Likewise for `:RgRaw`, just substitute `AgRaw` in `RgRaw` in the above examples.

## Customization

### Command Line Options

If you are using one of the provided commands, you can also set default command line options in your `.vimrc`:

```vim
let g:agriculture#ag_options = '--case-sensitive'
```

Again likewise for `:RgRaw` with `g:agriculture#rg_options`.

### Disable Smart Quoting

If you are using one of the provided commands, and want to disable smart quoting for CLI consistency:

```vim
let g:agriculture#disable_smart_quoting = 1
```

### Preview Window

Preview windows are now rendered by default in many [fzf.vim](https://github.com/junegunn/fzf.vim) commands.  If you wish to customize or disable this behaviour, [see fzf.vim's documentation](https://github.com/junegunn/fzf.vim#preview-window) on preview windows.

[fzf-lua's](https://github.com/ibhagwan/fzf-lua) preview is been used as defined by default / setup for `grep` [see fzf.lua's documentation](https://github.com/ibhagwan/fzf-lua).

### Choosing wrapper

Currently

- [fzf.vim](https://github.com/junegunn/fzf.vim)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)

are supported and will be automatically chosen but can also be predefined with

```vim
let g:agriculture#fzf_wrapper = 'fzf.vim'
```

or

```vim
let g:agriculture#fzf_wrapper = 'fzf-lua'
```

## How It Works

Your input will be automatically quoted _unless_ the following conditions are met:
   - Quotes in your query, signifying you might want to handle your own quoting/escaping, ie.
      ```
      :Ag -Q "Already quoted this pattern."
      :Ag Why you "scruffy looking nerf herder"!
      :Ag Who's scruffy looking?
      ```
   - A space followed by a dash in your query, signifying you might be passing an option, ie.
      ```
      :Ag -Q function index
      :Ag Which way to the beach? -> that way!
      ```
   - An escaped pattern followed by an unescaped space, signifying you might be passing a path, ie.
      ```
      :Ag an\ escaped\ pattern vendor/folder
      ```

TL;DR: If you use quotes, dashes, or need to pass a path, it's recommended you quote/escape your own pattern and vim-agriculture will stay out of your way 👍

## Who am I?

Just a hack 🔨

- [jesseleite.com](https://jesseleite.com)
- [@jesseleite85](https://twitter.com/jesseleite85)
