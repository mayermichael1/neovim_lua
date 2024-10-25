# Installation

```
mkdir -p ~/.config/nvim/
cd  ~/.config/nvim
git clone https://github.com/codingcor/neovim_lua .

nvim .
```

When starting nvim for the first time all plugins should be loaded automatically.

## Language Servers and Code highlighting

A few LSP configuration are already made. 
Disable or enable the configurations for a language in `./after/plugin/lsp.lua` as you see fit.
To enable Code highlighting the correspoding TreeSitter configuration has to be installed. 
Use `:TSInstall [language]` to install the code highlighting for a specific language.

# NVIM Tree 

By default all files ignored by `.gitignore` are not shown by nvim-tree by default.
To also these Files this behaviour can be toggled with `I`

To show or hide hidden files `H` may be pressed.

To change the root directory of NVIM-Tree `CTRL+]` may be pressed on the current directory.

# Snippets

snippets in the snipmate format are placed in `./snippets`.

# Folds

To create a toggle:

```
zf{motion}

//create fold for whole function
zfa}
```

To open and close fold:

```
za
```

# Keymaps 

To see all the keymaps for a given mode following command may be used:

```
:nmap
:verbose nmap
:nmap <leader>
```

This commands would list all normal mode mappings. 
The last command shows all normal mode mappings startign with the **leader** key. 

```
:Telescope keymaps
```

This command opens all keymaps in Telescope for searching.

# Debugging

Debugging works using the dap protocoll. To start a debugging session do the following:

1. optionally create breakpoints in your code (`<leader>b` or `:DapToggleBreakpoint`)
2. run the program (`:DapContinue` or `<leader>dc`) this start the debugging ui
3. Debug the Program
4. Terminate the Debugging Session by either running till the end or force terminate
(`<leader>dt` or `:DapTerminate`)

# Quickfix List

Open a quickfix list: `:copen` or `:cwindow`.
All Telescope searches can be turned into quickfix lists by pressing 'C-q'.
Commmands like `:vimgrep`,`:grep` or`:make` will also result in a quickfix.

# Filename Registers

The register `%` contains the current's file name. The register `#` contains
the last opened file name.

Example: pasting current filename to the buffer
```
"%p
```

Example: Full filename to the buffer
```
:let @" = expand("%")
p
```

# Current Working Directory

Print current working directory:

```
:pwd
```

change the current working directory:

```
:cd <directory>
```

change the current working directory to the directory containing the file:

```
:cd %:p:h
```

# TODOs

- [ ] diffview for git merges
- [ ] make command neovim

# How to Do 90% of What Plugins Do (With Just Vim)

[Youtube Reference](https://youtu.be/XA2WjJbmmoM?si=yjhcu9XwWDJeAjIV)

## Code Navigation

```bash
ctags `find . -name "*.[ch]" -print` 
```

With `ctags` a tag file can be created containing all relevant tags for a 
project. Neovim reads this tags file automatically. You can complete tags with 
`CTRL+n` and already existing tag can be jumped to by `CRTL+]` to leave this jump 
use `CTRL+t`.

This should also works quite well with large projects.

## Find Files

First following options have to be set

```
set path+=**
set wildmenu
```

Then following commands can be used for file searching:

```
:find  
```

This search list can be tab expanded and searches all subdirectories.
