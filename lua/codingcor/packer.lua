local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Packer could not be loaded...")
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- color schemes
    use 'sainnhe/sonokai'

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions-- completion

    use "hrsh7th/cmp-nvim-lsp" -- lsp source for cmp
    use "hrsh7th/cmp-nvim-lua" -- lua source for cmp

    -- snipping engine
    use "L3MON4D3/LuaSnip" --snippet engine

    -- lsp 
    use "neovim/nvim-lspconfig" -- enable LSP

    -- treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/playground'

    -- git integration
    use "lewis6991/gitsigns.nvim"
    
    -- telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- file explorer
    use {
       'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    --terminal
    use "akinsho/toggleterm.nvim"
end)
