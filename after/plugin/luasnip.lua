local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    print("Luasnip could not be loaded")
    return
end

vim.keymap.set({"i"}, "<C-K>", function() luasnip.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() luasnip.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() luasnip.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, {silent = true})

require("luasnip.loaders.from_snipmate").load();
-- this loads snippets in snipmate format from snippets directory
require("luasnip.loaders.from_snipmate").lazy_load({paths = "../../snippets"})
-- this would load snippets in visual studio code format
-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-cool-snippets" } })
