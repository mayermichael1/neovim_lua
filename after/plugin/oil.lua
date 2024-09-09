local status_ok, oil = pcall(require, "oil")
if not status_ok then
    print("Oil could not be loaded")
    return
end

vim.keymap.set("n", "<leader>e", ":Oil<cr>", {silent = true, noremap = true}) -- show file explorer

oil.setup({
    view_options = {
        show_hidden = true
    }
})
