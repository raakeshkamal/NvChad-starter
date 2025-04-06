local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    python = { "mypy", "ruff" },
}

lint.linters.luacheck.args = {
    unpack(lint.linters.luacheck.args),
    -- "--globals",
    -- "love",
    -- "vim",
}

lint.linters.mypy.args = {
    unpack(lint.linters.mypy.args),
    "--ignore-missing-imports",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "TextChangedI" }, {
    callback = function()
        lint.try_lint()
    end,
})
