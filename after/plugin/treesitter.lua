local status_ok, treesitterconfig = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    print('Treesitter could not be loaded')
    return
end

treesitterconfig.setup  {
    ensure_installed = { "" },
    sync_install = false,
    auto_install = false,
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = false,
        disable = {"dart"},
    }
}


