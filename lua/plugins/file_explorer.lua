return {
    { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons', opt = true}}, -- optional, for file icons ,
    { 'stevearc/oil.nvim', 
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        opts = {
            view_options = {show_hidden = true}
        },
        init = function()
            vim.keymap.set("n", "<leader>e", ":Oil<cr>", {silent = true, noremap = true}) -- show file explorer
        end
    }
}
