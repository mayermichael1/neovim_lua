local term_id = 0

vim.api.nvim_create_autocmd('TermOpen', 
{
    callback = function()
        term_id = vim.bo.channel;
    end
})

vim.keymap.set("n", "<leader>rt", function()
    local command = vim.fn.input("Command to run in terminal: ")
    local complete_command = string.format("%s \r\n", command)
    vim.fn.chansend(term_id, {complete_command})
end)
