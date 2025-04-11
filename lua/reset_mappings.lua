require("nvchad.mappings")
local remove_map = vim.keymap.del

remove_map("i", "<C-b>") --, "<ESC>^i", { desc = "move beginning of line" })
remove_map("i", "<C-e>") --, "<End>", { desc = "move end of line" })
remove_map("i", "<C-h>") --, "<Left>", { desc = "move left" })
remove_map("i", "<C-l>") --, "<Right>", { desc = "move right" })
remove_map("i", "<C-j>") --, "<Down>", { desc = "move down" })
remove_map("i", "<C-k>") --, "<Up>", { desc = "move up" })

remove_map("n", "<C-h>") -- "<C-w>h", { desc = "switch window left" })
remove_map("n", "<C-l>") -- "<C-w>l", { desc = "switch window right" })
remove_map("n", "<C-j>") -- "<C-w>j", { desc = "switch window down" })
remove_map("n", "<C-k>") -- "<C-w>k", { desc = "switch window up" })

remove_map("n", "<Esc>") -- "<cmd>noh<CR>", { desc = "general clear highlights" })

remove_map("n", "<C-s>") -- "<cmd>w<CR>", { desc = "general save file" })
remove_map("n", "<C-c>") -- "<cmd>%y+<CR>", { desc = "general copy whole file" })

remove_map("n", "<leader>n") -- "<cmd>set nu!<CR>", { desc = "toggle line number" })
remove_map("n", "<leader>rn") -- "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
remove_map("n", "<leader>ch") -- "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- map("n", "<leader>fm", function()
--   require("conform").format { lsp_fallback = true }
-- end, { desc = "general format file" })
remove_map("n", "<leader>fm")

-- global lsp mappings
remove_map("n", "<leader>ds") -- vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabufline
remove_map("n", "<leader>b") -- "<cmd>enew<CR>", { desc = "buffer new" })

-- map("n", "<tab>", function()
--   require("nvchad.tabufline").next()
-- end, { desc = "buffer goto next" })
remove_map("n", "<tab>")

-- map("n", "<S-tab>", function()
--   require("nvchad.tabufline").prev()
-- end, { desc = "buffer goto prev" })
remove_map("n", "<S-tab>")

-- map("n", "<leader>x", function()
--   require("nvchad.tabufline").close_buffer()
-- end, { desc = "buffer close" })
remove_map("n", "<leader>x")

-- Comment
remove_map("n", "<leader>/") -- "gcc", { desc = "toggle comment", remap = true })
remove_map("v", "<leader>/") -- "gc", { desc = "toggle comment", remap = true })

-- nvimtree
remove_map("n", "<C-n>") -- "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
remove_map("n", "<leader>e") -- "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
remove_map("n", "<leader>fw") -- "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
remove_map("n", "<leader>fb") -- "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
remove_map("n", "<leader>fh") -- "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
remove_map("n", "<leader>ma") -- "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
remove_map("n", "<leader>fo") -- "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
remove_map("n", "<leader>fz") -- "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
remove_map("n", "<leader>cm") -- "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
remove_map("n", "<leader>gt") -- "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
remove_map("n", "<leader>pt") -- "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

-- map("n", "<leader>th", function()
--   require("nvchad.themes").open()
-- end, { desc = "telescope nvchad themes" })
remove_map("n", "<leader>th")

remove_map("n", "<leader>ff") -- "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
-- map(
--   "n",
--   "<leader>fa",
--   "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
--   { desc = "telescope find all files" }
-- )
remove_map("n", "<leader>fa")

-- terminal
remove_map("t", "<C-x>") -- "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
-- map("n", "<leader>h", function()
--   require("nvchad.term").new { pos = "sp" }
-- end, { desc = "terminal new horizontal term" })
remove_map("n", "<leader>h")

-- map("n", "<leader>v", function()
--   require("nvchad.term").new { pos = "vsp" }
-- end, { desc = "terminal new vertical term" })
remove_map("n", "<leader>v")

-- toggleable
-- map({ "n", "t" }, "<A-v>", function()
--   require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
-- end, { desc = "terminal toggleable vertical term" })
remove_map({"n", "t"}, "<A-v>")

-- map({ "n", "t" }, "<A-h>", function()
--   require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
-- end, { desc = "terminal toggleable horizontal term" })
remove_map({"n", "t"}, "<A-h>")

-- map({ "n", "t" }, "<A-i>", function()
--   require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
-- end, { desc = "terminal toggle floating term" })
remove_map({"n", "t"}, "<A-i>")

-- whichkey
remove_map("n", "<leader>wK") -- "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

-- map("n", "<leader>wk", function()
--   vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
-- end, { desc = "whichkey query lookup" })
remove_map("n", "<leader>wk")