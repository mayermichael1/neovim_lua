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
