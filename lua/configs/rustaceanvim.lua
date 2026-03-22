-- Set up basic rustaceanvim config without DAP by default
vim.g.rustaceanvim = {}

-- Try to set up DAP with codelldb if available
local success, err = pcall(function()
    local mason_registry = require("mason-registry")
    local codelldb = mason_registry.get_package("codelldb")

    -- Check if codelldb exists and is installed
    if codelldb and codelldb:is_installed() then
        local ok, install_path = pcall(function()
            return codelldb:get_install_path()
        end)

        if not ok or not install_path or install_path == "" or type(install_path) ~= "string" then
            return
        end

        local extension_path = install_path .. "/extension/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        local liblldb_path = extension_path .. "lldb/lib/liblldb"

        local this_os = vim.uv.os_uname().sysname
        -- The path is different on Windows
        if string.match(this_os, "Windows") then
            codelldb_path = extension_path .. "adapter\\codelldb.exe"
            liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
        else
            -- The liblldb extension is .so for Linux and .dylib for MacOS
            liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
        end

        local cfg = require("rustaceanvim.config")
        vim.g.rustaceanvim = {
            dap = {
                adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
            },
        }
    end
end)

if not success then
    -- If DAP setup fails, we still have the basic config set above
    vim.notify("Could not set up rust DAP: " .. tostring(err), vim.log.levels.WARN)
end
