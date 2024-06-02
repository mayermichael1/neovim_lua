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
