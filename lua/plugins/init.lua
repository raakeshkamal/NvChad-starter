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
        event = { "BufUnload", "BufHidden", "BufDelete", "BufWipeout" },
        opts = {},
    },
    {
        import = "configs.overseer",
    },
    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<c-\>]],
                shade_terminals = false,
                direction = "float",
                -- add --login so ~/.zprofile is loaded
                shell = "zsh --login",
            })
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
        config = function()
            require("configs.rustaceanvim")
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "saecki/crates.nvim",
        tag = "stable",
        ft = { "toml" },
        config = function()
            require("crates").setup({
                completion = {
                    cmp = {
                        enabled = true,
                    },
                },
            })
            require("cmp").setup.buffer({
                sources = { { name = "crates" } },
            })
        end,
    },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
        opts = {
            -- Your options go here
            name = { ".venv", "venv" },
            stay_on_this_version = true,
            -- auto_refresh = false
        },
        event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("configs.dap")
        end,
    },
    {
        "nvim-neotest/nvim-nio",
        event = "VeryLazy",
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        event = "VeryLazy",
        opts = {},
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
    {
        "julianolf/nvim-dap-lldb",
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("configs.dap-lldb")
        end,
    },
    {
        "folke/persistence.nvim",
        event = "VimEnter",
        config = function()
            require("configs.persistence")
        end,
    },
    {
        "tpope/vim-fugitive",
        event = "VimEnter",
        cmd = "G",
        config = function()
            require("configs.fugitive")
        end,
    },
    {
        "mbbill/undotree",
        event = "VeryLazy",
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "ThePrimeagen/harpoon",
        event = "VimEnter",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim", "folke/persistence.nvim" },
        config = function()
            require("configs.harpoon")
        end,
    },
    {
        "echasnovski/mini.nvim",
        event = "VeryLazy",
        version = "*",
    },
    {
        "lervag/vimtex",
        event = "VimEnter",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "skim"
            vim.g.vimtex_compiler_method = "tectonic"
        end,
    },
    {
        "radyz/telescope-gitsigns",
        event = "VeryLazy",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-telescope/telescope.nvim",
        },
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        config = function()
            require("configs.todo-comments")
        end,
    },
    -- {
    --     "supermaven-inc/supermaven-nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("supermaven-nvim").setup({
    --             keymaps = {
    --                 accept_suggestion = "<C-o>",
    --                 clear_suggestion = "<C-]>",
    --                 accept_word = "<C-j>",
    --             },
    --         })
    --     end,
    -- },
}
