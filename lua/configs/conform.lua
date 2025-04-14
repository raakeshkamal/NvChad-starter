vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- FomatDisable! will disable autoformatting just for this buffer
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, { desc = "Disable Auto Format on Save", bang = true })

vim.api.nvim_create_user_command("FormatEnable", function(args)
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, { desc = "Re-Enable Auto Format on Save" })

local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        go = { "gofumpt", "goimports-reviser", "golines" },
        python = { "black", "isort" },
        zig = { "zig fmt" },
        json = { "jq" },
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
    format_on_save = function(bufnr)
        -- Disable with a global or buffer local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end
        -- These options will be passed to conform.format()
        return { timeout_ms = 500, lsp_fallback = true }
    end,
}

return options
