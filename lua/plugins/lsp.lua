return {
    {"neovim/nvim-lspconfig",
        config = function()

            local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
            if not lspconfig_status_ok then
                print("LSP could not be loaded")
                return
            end

            local opts = {noremap=true, silent=true}
            vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts) -- show diagnostic
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- previous diagnostic
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- next diagnotic
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts) -- diagnostic as list

            local on_attach = function(client, bufnr)
                local bufopts = {noremap=true, silent=true,buffer=bufnr} 
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts) -- go to declaration
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- go to definition
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts) -- show documentation / hover
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts) -- go to implementation
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts) -- signature help in function
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts) -- go to type definition
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts) -- rename using lsp
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts) -- code action
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) -- show references
                --vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts) -- format
            end

            -- ccls setup
            -- c
            -- cpp
            lspconfig.ccls.setup{
                on_attach = on_attach,
                init_options = {
                    compilationDatabaseDirectory = "./",
                    index = {
                        threads = 0,
                    },
                    clang = {
                        excludeArgs = { "-frounding-math"},
                    },
                }
            }

            -- dartls server setup
            -- dart
            lspconfig.dartls.setup{
                on_attach = on_attach,
                init_options = {
                    closingLabels = false,
                    flutterOutline = false,
                    onlyAnalyzeProjectsWithOpenFiles = false,
                    outline = false,
                    suggestFromUnimportedLibraries = false
                },
                settings = {
                  dart = {
                    completeFunctionCalls = false,
                    showTodos = false
                  }
                }
            }

            -- typescript server setup
            -- typescript
            -- javascript
            -- deprecated
            --lspconfig.tsserver.setup{}

            -- phpactor server setup
            -- php
            lspconfig.phpactor.setup{}
        end
    }
}
