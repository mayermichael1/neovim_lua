local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    print("Lualine could not be loaded")
    return
end

lualine.setup{
    options = {
        theme = "onedark",
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        tabline = {
          lualine_a = {},
          lualine_b = {'branch'},
          lualine_c = {'filename'},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        }
    }
}

