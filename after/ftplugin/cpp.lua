vim.api.nvim_buf_create_user_command(0, 'CMake', '!cmake -B %:p:h/build;', {});
vim.api.nvim_buf_create_user_command(0, 'Compile', '!cmake --build %:p:h/build;', {});
