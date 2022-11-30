#!/bin/bash

MAPS="$HOME/.config/nvim/doc/custom_maps.txt"


echo "*custom_maps.txt* Custom Keymaps in Neovim Config" > $MAPS
echo "*custom_maps* " >> $MAPS
echo "" >> $MAPS
echo "Keymappings: " >> $MAPS

grep -Rhs "vim.keymap.set" $HOME/.config/nvim --exclude-dir=scripts | awk '{$1=$1;print}' | sed 's/^/ - /' >> $MAPS
