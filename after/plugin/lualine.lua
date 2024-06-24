local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    print("Lualine could not be loaded")
    return
end

--lualine.setup{
--    options = {
--        theme = "auto",
--        component_separators = { left = '', right = ''},
--        section_separators = { left = '', right = ''},
--        globalstatus = true,
--    },
--    tabline = {
--        lualine_a = {'buffers'},
--        lualine_b = {},
--        lualine_c = {},
--        lualine_x = {},
--        lualine_y = {},
--        lualine_z = {'tabs'},
--    },
--}
--
lualine.setup()

