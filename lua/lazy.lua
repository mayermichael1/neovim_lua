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
    {'sainnhe/sonokai', 
        init = function()
            vim.g.sonokai_transparent_background = 0
            vim.g.sonokai_style = 'shusia'
            vim.g.sonokai_better_performance = 1;
            vim.g.sonokai_disable_italic_comment = 1;
        end
    },
    {'sainnhe/gruvbox-material', 
        init = function() 
            vim.g.gruvbox_material_foreground='material'
            vim.g.gruvbox_material_disable_italic_comment=1
        end
    },
    {'luisiacc/gruvbox-baby'},

    -- cmp plugins
    {"hrsh7th/nvim-cmp", 
        dependencies = {
            "hrsh7th/cmp-buffer", -- buffer completions
            "hrsh7th/cmp-path", -- path completions
            "hrsh7th/cmp-cmdline", -- cmdline completions
            "hrsh7th/cmp-nvim-lsp", -- lsp source for cmp
            "hrsh7th/cmp-nvim-lua", -- lua source for cmp
            "saadparwaiz1/cmp_luasnip", -- snippet completions-- completion
        },
        config = function()
            local cmp = require("cmp");
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- use luasnip as snipping engine
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end
        
    }, 

    -- snipping engine
    {"L3MON4D3/LuaSnip",
        version = "v2.*",
        init = function()
            local luasnip = require("luasnip");
            vim.keymap.set({"i"}, "<C-K>", function() luasnip.expand() end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-J>", function() luasnip.jump( 1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-L>", function() luasnip.jump(-1) end, {silent = true})

            --vim.keymap.set({"i", "s"}, "<C-E>", function()
            --	if luasnip.choice_active() then
            --		luasnip.change_choice(1)
            --	end
            --end, {silent = true})

            require("luasnip.loaders.from_snipmate").load();
            -- this loads snippets in snipmate format from snippets directory
            require("luasnip.loaders.from_snipmate").lazy_load({paths = "../snippets"})
            -- this would load snippets in visual studio code format
            -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-cool-snippets" } })
        end
    }, --snippet engine

    -- lsp 
    "neovim/nvim-lspconfig", -- enable LSP

    -- treesitter
    {'nvim-treesitter/nvim-treesitter', 
        build = ':TSUpdate',
        opts = {
            ensure_installed = { "" },
            sync_install = false,
            auto_install = false,
            ignore_install = { "" },
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = false,
                disable = {"dart"},
            }
        }
    },
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

-- set the colorscheme here
vim.cmd.colorscheme("gruvbox-material");
