local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
    print("Nvim-Tree could not be loaded")
    return
end

--vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", {silent = true, noremap = true}) -- show file explorer

--nvimtree.setup({})
