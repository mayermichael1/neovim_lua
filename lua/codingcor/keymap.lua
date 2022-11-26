local opts = {noremap = true, silent = true}

local term_opts = {silent = true}

-- set leader key
vim.keymap.set("", "<Space>", "<Nop>", opts);
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
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- resize windows
vim.keymap.set("n", "<C-Up>", ":resize +2<cr>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<cr>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", opts)
vim.keymap.set("n", "<C-Rigth>", ":vertical resize +2<cr>", opts)

-- navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<cr>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<cr>", opts)

-- insert mode
vim.keymap.set("i", "jk", "<ESC>", opts)

-- visual mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "p", '"_dP', opts)

-- Visual Block --
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
