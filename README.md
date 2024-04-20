# Installation

```
mkdir -p ~/.config/nvim/
cd  ~/.config/nvim
git clone https://github.com/codingcor/neovim_lua .

nvim .
```

When starting nvim for the first time all plugins should be loaded automatically.

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
