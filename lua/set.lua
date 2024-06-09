-- line numbering
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- search options
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.showmatch = true

-- no wrap
vim.opt.wrap = false

-- disable mouse completely
-- vim.opt.mouse=""

-- don't check for vim modelines
vim.opt.modelines=0

-- visuals
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.visualbell = true
vim.opt.laststatus = 2
vim.opt.showmode = true
vim.opt.cmdheight = 1
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.showtabline = 2
vim.opt.termguicolors = true

-- auto formating
vim.opt.formatoptions = "ro/nj"
vim.opt.scrolloff = 8
vim.opt.sidescroll = 8
vim.opt.matchpairs:append "<:>"

-- undodir
vim.opt.swapfile = false
vim.opt.undofile = true

-- window controls
vim.opt.splitbelow = true
vim.opt.splitright = true

-- updatetime
vim.opt.updatetime = 300

-- leader key
vim.g.mapleader = " "

-- netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- for comp
-- vim.opt.completeopt = {"menuone", "noinsert"}
vim.opt.syntax = "off"
