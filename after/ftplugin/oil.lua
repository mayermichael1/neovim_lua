-- disable line numbers in oil
vim.opt_local.nu = false
vim.opt_local.relativenumber = false

-- do not re open oil while its open
vim.keymap.set("n", "<leader>e", "", {silent = true, noremap = true, buffer=true})
