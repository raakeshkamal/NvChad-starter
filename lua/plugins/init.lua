-- highlight -> treesitter
-- lspconfig ->  language serve; maybe linting & formattiing
-- linter -> linting aka error highlighting
-- conform -> formatting
return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },
    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require("configs.conform"),
    },
    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        opts = require("configs.gitsigns"),
    },
    {
        "brianhuster/autosave.nvim",
        event = "BufLeave",
        opts = {},
    },
    {
        import = "configs.overseer",
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                shade_terminals = false,
                direction = "float",
                -- add --login so ~/.zprofile is loaded
                shell = "zsh --login",
            })
        end,
        keys = {
            { [[<C-\>]] },
        },
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
        opts = {
            -- Your options go here
            name = { ".venv", "venv" },
            -- auto_refresh = false
        },
        event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
        keys = {
            -- Keymap to open VenvSelector to pick a venv.
            { "<leader>vs", "<cmd>VenvSelect<cr>" },
            -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
            { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("configs.dap")
        end,
    },
    {
        "nvim-neotest/nvim-nio",
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            require("configs.dap-ui")
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            require("configs.dap-python")
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        config = function()
            require("configs.mason-dap")
        end,
    },
}
