local term_id = 0

vim.api.nvim_create_autocmd('TermOpen', 
{
    callback = function()
        term_id = vim.bo.channel;
    end
})

function open_term()
    vim.cmd("tab term")
    run_in_terminal("clear");
end

function run_in_terminal(command)
    if (term_id == 0)
    then
        open_term()
    end
    local complete_command = string.format("%s \r\n", command)
    vim.fn.chansend(term_id, {complete_command})
end

vim.keymap.set("n", "<leader>tr", function(command)
    command = vim.fn.input("Command to run in terminal: ")
    run_in_terminal(command);
end)

vim.keymap.set("n", "<leader>tb", function(command)
    run_in_terminal("bake");
end)
