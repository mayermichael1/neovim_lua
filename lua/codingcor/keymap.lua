local opts = {noremap = true, silent = true}

local term_opts = {silent = true}

-- set leader key
vim.keymap.set("", "<Space>", "<Nop>", opts); -- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--  modes
--      normal mode ... n
--      insert mode ... i
--      visual mode ... v
--      visual block mode ... x
--      term mode ... t
--      command mode ... c

-- normal mode remaps

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- move to the left window
vim.keymap.set("n", "<C-j>", "<C-w>j", opts) -- move to the bottom window
vim.keymap.set("n", "<C-k>", "<C-w>k", opts) -- move to the top window
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- move to the right window

-- resize windows
vim.keymap.set("n", "<C-Up>", ":resize +2<cr>", opts) -- resize vertial +
vim.keymap.set("n", "<C-Down>", ":resize -2<cr>", opts) -- resize vertical -
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", opts) -- resize horizontal -
vim.keymap.set("n", "<C-Rigth>", ":vertical resize +2<cr>", opts) -- resize horizontal +

-- navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<cr>", opts) -- next buffer
vim.keymap.set("n", "<S-h>", ":bprevious<cr>", opts) -- previous buffer

-- insert mode
vim.keymap.set("i", "jk", "<ESC>", opts) -- exist insert mode

-- visual mode
vim.keymap.set("v", "<", "<gv", opts) -- reselect after indentation
vim.keymap.set("v", ">", ">gv", opts) -- reselect after indentation

vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts) -- move visual selection down
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts) -- move visual selection up
vim.keymap.set("v", "p", '"_dP', opts) -- keep paste when in visual mode

-- Visual Block --
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts) -- move visual block down
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts) -- move visual block up
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts) -- move visual block down
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts) -- move visual block up
