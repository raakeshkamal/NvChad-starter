-- List of servers to install (servers configured in lspconfig.lua)
local all_servers = {
    "lua_ls",
    "gopls",
    "rust_analyzer",
    "texlab",
    "zls",
    "html",
    "cssls",
}

-- List of servers to ignore during install (already handled by other configs)
local ignore_install = {
    "clangd",
    "pyright",
}

-- Helper function to find if value is in table
local function table_contains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

-- Filter out ignored servers
local filtered_servers = {}
for _, s in ipairs(all_servers) do
    if not table_contains(ignore_install, s) then
        table.insert(filtered_servers, s)
    end
end

require("mason-lspconfig").setup({
    ensure_installed = filtered_servers,
    automatic_installation = false,
})
