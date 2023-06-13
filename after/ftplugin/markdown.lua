vim.api.nvim_buf_create_user_command(0, 'Build', '!pandoc % > %<.html', {});
vim.api.nvim_buf_create_user_command(0, 'Run', '!firefox %<.html', {});
