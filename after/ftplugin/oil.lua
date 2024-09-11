-- disable line numbers in oil
vim.opt.nu = false
vim.opt.relativenumber = false

-- do not re open oil while its open
vim.keymap.set("n", "<leader>e", "", {silent = true, noremap = true, buffer=true})
