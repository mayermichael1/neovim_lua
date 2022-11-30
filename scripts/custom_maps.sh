#!/bin/bash

echo "*custom_maps.txt* Custom Keymaps in Neovim Config" > $HOME/.config/nvim/doc/custom_maps.txt
echo "*custom_maps* " >> $HOME/.config/nvim/doc/custom_maps.txt

grep -Rhs "vim.keymap.set" $HOME/.config/nvim | awk '{$1=$1;print}' | sed 's/^/ - /' >> $HOME/.config/nvim/doc/custom_maps.txt
