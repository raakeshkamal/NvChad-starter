local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers")
        .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        })
        :find()
end

vim.keymap.set("n", "<leader>q", function()
    toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

-- vim.notify(msg_prefix .. msg, vim.log.levels.INFO, { title = 'VenvSelect' })
-- vim.keymap.set("n", "<leader>a", function()
--     harpoon:list():add()
-- end)
-- -- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- vim.keymap.set("n", "<C-h>", function()
--     harpoon:list():select(1)
-- end)
-- vim.keymap.set("n", "<C-t>", function()
--     harpoon:list():select(2)
-- end)
-- vim.keymap.set("n", "<C-n>", function()
--
--     harpoon:list():select(3)
--
-- end)
--
-- vim.keymap.set("n", "<C-s>", function()
--     harpoon:list():select(4)
-- end)
--
-- -- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-Left>", function()
    harpoon:list():prev()
end)
vim.keymap.set("n", "<C-Right>", function()
    harpoon:list():next()
end)

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
                -- print(buffer_index)
                if buffer_name ~= "" and not string.match(buffer_name, "NvimTree") then
                    -- vim.api.nvim_set_current_buf(buffer_index)
                    -- print(buffer_name)
                    -- harpoon:list():add()
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
