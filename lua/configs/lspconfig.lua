-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

lspconfig.servers = {
    "lua_ls",
    "clangd",
    "gopls",
    "pyright",
    "rust_analyzer",
    "zls",
}

local servers = {}
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilitites = nvlsp.capabilitites,
    })
end

lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        nvlsp.on_attach(client, bufnr)
    end,
    on_init = nvlsp.on_init,
    capabilitites = nvlsp.capabilitites,
})

lspconfig.lua_ls.setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilitites = nvlsp.capabilitites,
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
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilitites = nvlsp.capabilitites,
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
        nvlsp.on_attach(client, bufnr)
    end,
    on_init = nvlsp.on_init,
    capabilitites = nvlsp.capabilitites,
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
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    cmd = { "zls" },
    filetypes = { "zig", "zon" },
    root_dir = lspconfig.util.root_pattern("zls.json", "build.zig", ".git"),
})
