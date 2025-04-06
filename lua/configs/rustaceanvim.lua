local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb"

local this_os = vim.uv.os_uname().sysname
-- print(this_os)
-- The path is different on Windows
if string.match(this_os, "Windows") then
    codelldb_path = extension_path .. "adapter\\codelldb.exe"
    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
else
    -- The liblldb extension is .so for Linux and .dylib for MacOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end
-- print(liblldb_path)

local cfg = require("rustaceanvim.config")
vim.g.rustaceanvim = {
    dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
}
