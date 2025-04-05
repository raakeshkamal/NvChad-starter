require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<leader>e", "<cmd> NvimTreeToggle <cr>", { desc = "File Tree Toggle" })

map("n", "<leader>u", vim.cmd.UndotreeToggle)
