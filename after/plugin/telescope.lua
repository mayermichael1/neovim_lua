local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    print("Telescope could not be loaded")
    return
end

telescope.setup{}

local opts = {noremap = true, silent = true}
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", opts) -- search files
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", opts) -- search buffers
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", opts) -- search with grep

--vim.keymap.set("n", "<leader>fo", grep_in_buffer, opts); -- search in open buffers
--function grep_in_buffer()
--    local live_grep  = require("telescope.builtin");
--    live_grep.live_grep({grep_open_files=true});
--end

