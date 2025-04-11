local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- Create an autocommand group to organize our autocommands
local persistence_augroup = vim.api.nvim_create_augroup("PersistenceEvents", { clear = true })

-- Callback for when NvimTree is opened
vim.api.nvim_create_autocmd("User", {
    group = persistence_augroup,
    pattern = "PersistenceLoadPost",
    callback = function()
        vim.schedule(function()
            harpoon:list():clear()
            for _, buffer_index in ipairs(vim.api.nvim_list_bufs()) do
                local buffer_name = vim.api.nvim_buf_get_name(buffer_index)
                if buffer_name ~= "" and not string.match(buffer_name, "NvimTree") then
                    local pos = { 1, 0 }
                    if buffer_index ~= -1 then
                        pos = vim.api.nvim_win_get_cursor(0)
                    end
                    harpoon:list():add({ value = buffer_name, context = { row = pos[1], col = pos[2] } })
                end
            end
        end)
    end,
})
