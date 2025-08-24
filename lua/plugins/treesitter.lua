return {
    {'nvim-treesitter/nvim-treesitter', 
        lazy = false,
        build = ':TSUpdate',
        config = function()
            local configs = require 'nvim-treesitter.configs'
            configs.setup({

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
            })
        end
    },
    {'nvim-treesitter/nvim-treesitter-context', lazy = true},
    {'nvim-treesitter/playground', lazy = true}
}
