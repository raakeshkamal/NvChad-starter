local M = {}

function M.diffFormat()
    local hunks = require("gitsigns").get_hunks()
    local format = require("conform").format
    if hunks ~= nil then
        for i = #hunks, 1, -1 do
            local hunk = hunks[i]
            if hunk ~= nil and hunk.type ~= "delete" then
                local start = hunk.added.start
                local last = start + hunk.added.count
                -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
                local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
                local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
                format({ range = range })
            end
        end
    end
end

function M.toggle_gvdiff(revision)
    -- Check the window-local 'diff' option
    if vim.wo.diff then
        -- If currently in diff mode, turn it off and close other windows
        vim.cmd("diffoff!") -- Turn off diff for all windows in the tab
        vim.cmd("only") -- Close all other windows in the tab
        vim.cmd("bd")
    else
        -- If not in diff mode, open the diff
        local cmd = "Gvdiffsplit"
        if revision and revision ~= "" then
            cmd = cmd .. " " .. vim.fn.shellescape(revision) -- Basic quoting just in case
        end
        vim.cmd(cmd)
    end
end

-- basic telescope configuration
function M.toggle_telescope(harpoon_files)
    local conf = require("telescope.config").values
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

return M
