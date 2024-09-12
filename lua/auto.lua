vim.api.nvim_create_autocmd(
    {"TermOpen"},
    {
        pattern = {"*"},
        callback = function(ev)
            vim.opt_local.relativenumber = false;
            vim.opt_local.number = false;
        end
    }
);

