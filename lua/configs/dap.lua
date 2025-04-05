local map = vim.keymap.set

map("n", "<leader>db", '<cmd> lua require("dap").toggle_breakpoint() <CR>', { desc = "Toggle Breakpoint" })

map("n", "<leader>dc", '<cmd> lua require("dap").continue() <CR>', { desc = "Continue" })

map("n", "<leader>do", '<cmd> lua require("dap").step_over() <CR>', { desc = "Step Over" })

map("n", "<leader>di", '<cmd> lua require("dap").step_into() <CR>', { desc = "Step Into" })

map("n", "<leader>dC", '<cmd> lua require("dap").run_to_cursor() <CR>', { desc = "Run to Cursor" })

map("n", "<leader>dT", '<cmd> lua require("dap").terminate() <CR>', { desc = "Terminate" })
