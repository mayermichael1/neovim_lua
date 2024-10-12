local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    print("CMP could not be loaded")
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    print("Luasnip could not be loaded")
    return
end

cmp.setup{
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- use luasnip as snipping engine
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    --confirm_opts = {
    --    behavior = cmp.ConfirmBehavior.Replace,
    --    select = false,
    --},
    --window = {
    --    documentation = cmp.config.window.bordered(),
    --},
    --experimental = {
    --    ghost_text = false,
    --    native_menu = false,
    --},
}
