require("mason-conform").setup({
    -- List of formatters to ignore during install
    ignore_install = { "clang_format", "black", "zig fmt" },
})
