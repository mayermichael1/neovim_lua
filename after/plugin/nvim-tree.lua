local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
    print("Nvim-Tree could not be loaded")
    return
end

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", {silent = true, noremap = true}) -- show file explorer

nvimtree.setup({
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "none",
        indent_width = 2,
        indent_markers = {
          enable = false,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        view = {
            signcolumn = "yes",
        },
        icons = {
          webdev_colors = true,
          git_placement = "signcolumn",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "+",
              staged = "~",
              unmerged = " ",
              renamed = "R",
              untracked = "U",
              deleted = "-",
              ignored = "◌",
            },
          },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
    },
})
