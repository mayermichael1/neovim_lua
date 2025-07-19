--print("Lazy package manager could not be loaded")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_status_ok, lazy = pcall(require,"lazy");
--if not lazy_satus_ok then
--    print("Lazy package manager could not be loaded")
--    return
--end

lazy.setup({
    -- color schemes
    {'sainnhe/sonokai', lazy = true},
    {'sainnhe/gruvbox-material', lazy = false},
    {'luisiacc/gruvbox-baby', lazy = true},

    -- cmp plugins
    "hrsh7th/nvim-cmp", -- The completion plugin
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "hrsh7th/cmp-nvim-lsp", -- lsp source for cmp
    "hrsh7th/cmp-nvim-lua", -- lua source for cmp

    -- snipping engine
    {"L3MON4D3/LuaSnip", version = "v2.*"}, --snippet engine
    "saadparwaiz1/cmp_luasnip", -- snippet completions-- completion

    -- lsp 
    "neovim/nvim-lspconfig", -- enable LSP

    -- treesitter
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    {'nvim-treesitter/nvim-treesitter-context', lazy = true},
    {'nvim-treesitter/playground', lazy = true},

    -- git integration
    { "lewis6991/gitsigns.nvim", lazy = false},
    { "NeogitOrg/neogit", lazy = false, dependencies = {"nvim-lua/plenary.nvim"}},

    -- telescope
    { 'nvim-telescope/telescope.nvim',
        version = '0.1.4',
        dependencies =  {'nvim-lua/plenary.nvim' },
        init = function()
            function grep_in_buffer()
                local live_grep  = require("telescope.builtin");
                live_grep.live_grep({grep_open_files=true});
            end

            local opts = {noremap = true, silent = true}
            vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", opts) -- search files
            vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", opts) -- search buffers
            vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", opts) -- search with grep
            vim.keymap.set("n", "<leader>fo", grep_in_buffer, opts); -- search in open buffers
        end
    },

    -- file explorer
    { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons', opt = true}}, -- optional, for file icons ,
    { 'stevearc/oil.nvim', 
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        opts = {
            view_options = {show_hidden = true}
        },
        init = function()
            vim.keymap.set("n", "<leader>e", ":Oil<cr>", {silent = true, noremap = true}) -- show file explorer
        end
    },

    -- status line
    { 'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
        opts = {
            options = {
                theme = "auto",
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                globalstatus = true,
            },
            tabline = {
                lualine_a = {'tabs'},
            },
        }
    },

    --terminal
    --"akinsho/toggleterm.nvim",

    -- useless stuff
    {'eandrju/cellular-automaton.nvim' , lazy = true},
    {'alec-gibson/nvim-tetris', lazy = true},
    
});
