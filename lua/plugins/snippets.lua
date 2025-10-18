return {
    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        version = "v2.*",
        init = function()
            local luasnip = require("luasnip");
            vim.keymap.set({"i"}, "<C-K>", function() luasnip.expand() end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-H>", function() luasnip.jump(-1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-L>", function() luasnip.jump( 1) end, {silent = true})

            --vim.keymap.set({"i", "s"}, "<C-E>", function()
            --	if luasnip.choice_active() then
            --		luasnip.change_choice(1)
            --	end
            --end, {silent = true})

            require("luasnip.loaders.from_snipmate").load();
            -- this loads snippets in snipmate format from snippets directory
            require("luasnip.loaders.from_snipmate").lazy_load({paths = "../snippets"})
            -- this would load snippets in visual studio code format
            -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-cool-snippets" } })
        end
    }
}
