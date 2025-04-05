local function toggle_gvdiff(revision)
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

--- Example Key Mappings ---

-- Toggle diff against HEAD
vim.keymap.set("n", "<leader>gd", function()
    toggle_gvdiff()
end, { desc = "Toggle Gvdiff HEAD" })

-- Toggle diff against the index (staged changes)
vim.keymap.set("n", "<leader>gi", function()
    toggle_gvdiff(":")
end, { desc = "Toggle Gvdiff Index" })

-- Toggle diff against a specific branch (e.g., main) - less common for a toggle
vim.keymap.set("n", "<leader>gm", function()
    toggle_gvdiff("main")
end, { desc = "Toggle Gvdiff main" })
