local function diffFormat()
    local hunks = require("gitsigns").get_hunks()
    local format = require("conform").format
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

vim.keymap.set("", "<leader>df", function()
    diffFormat()
end, { desc = "Diff Format" })

vim.keymap.set("v", "<leader>fs", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format Selection" })

local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        go = { "gofumpt", "goimports-reviser", "golines" },
        python = { "isort", "black" },
        zig = { "zig fmt" },
        -- css = { "prettier" },
        -- html = { "prettier" },
    },
    -- formatters = {
    --   ["clang_format"] = {
    --     prepend_args = {
    --       "-style={\
    --               IndentWidth:4,\
    --               TabWidth:4,\
    --               UseTab: Never,\
    --               AccessModifierOffset:0,\
    --               IndentAccessModifiers:true,\
    --               PackConstructorInitializers:Never}",
    --     },
    --   },
    -- },
    formatters = {
        ["goimports-reviser"] = {
            prepend_args = { "-rm-unused" },
        },
        golines = {
            prepend_args = { "-max-len=80" },
        },
        black = {
            prepend_args = { "--fast", "--line-length", "80" },
        },
        isort = {
            prepend_args = { "--profile", "black" },
        },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return options
