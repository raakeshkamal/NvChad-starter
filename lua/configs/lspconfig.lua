-- Custom LSP utility functions
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Upstream basic servers using new vim.lsp.config API
vim.lsp.config("html", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("cssls", {
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Try to use old lspconfig for complex servers if available
local status_ok, lspconfig = pcall(require, "lspconfig")
if status_ok then
    -- Suppress lspconfig deprecation warnings
    local original_warn = vim.notify
    vim.notify = function(msg, ...)
        if msg and type(msg) == "string" and (msg:match("deprecated") or msg:match("lspconfig")) then
            return
        end
        original_warn(msg, ...)
    end

    -- Suppress errors from deprecated lspconfig calls
    local xpcall_result, xpcall_err = pcall(function()
    -- lsps with default config
    lspconfig.texlab.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig.clangd.setup({
        on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            on_attach(client, bufnr)
        end,
        capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    enable = false, -- Disable all diagnostics
                },
                workspace = {
                    library = {
                        vim.fn.expand("$VIMRUNTIME/lua"),
                        vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                        vim.fn.expand("data") .. "/lazy/ui/nvchad_types",
                        vim.fn.expand("data") .. "/lazy/lazy.nvim/lua/lazy",
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
            },
        },
    })

    lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            pyright = {
                disableOrganizeImports = true,
            },
            python = {
                analysis = {
                    typeCheckingMode = "off",
                },
            },
        },
    })

    lspconfig.gopls.setup({
        on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gotmpl", "gowork" },
        root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                completeUnimported = true,
                usePlaceholders = true,
                staticcheck = true,
            },
        },
    })

    lspconfig.zls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "zls" },
        filetypes = { "zig", "zon" },
        root_dir = lspconfig.util.root_pattern("zls.json", "build.zig", ".git"),
    })
    end)

    -- Restore notify function
    vim.notify = original_warn
end

-- Enable the servers
vim.lsp.enable({ "html", "cssls" })

-- read :h vim.lsp.config for changing options of lsp servers
