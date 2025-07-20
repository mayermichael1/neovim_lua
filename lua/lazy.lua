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

lazy.setup("plugins");

-- set the colorscheme here
vim.cmd.colorscheme("gruvbox-material");
