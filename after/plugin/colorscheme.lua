-- documentation: https://github.com/olimorris/onedarkpro.nvim
local status_ok, scheme = pcall(require, "onedarkpro")
if not status_ok then
    print("Packer could not be loaded...")
    return
end

scheme.setup({
    dark_theme = "onedark_vivid",
    options = {
        cursorline = true,
        transparency = true,
    }
})

vim.cmd("colorscheme onedarkpro")
