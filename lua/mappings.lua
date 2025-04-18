local helpers = require("helpers.plugin_helpers")

-- <C> -> Ctrl
-- <leader> -> Space
-- <A> -> alt
-- <S> -> shift

local function map(mode, l, r, desc)
    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
end

--[[
==============================================================================
  ____          _                     _  __
 / ___|   _ ___| |_ ___  _ __ ___    | |/ /___ _   _ _ __ ___   __ _ _ __  ___
| |  | | | / __| __/ _ \| '_ ` _ \   | ' // _ \ | | | '_ ` _ \ / _` | '_ \/ __|
| |__| |_| \__ \ || (_) | | | | | |  | . \  __/ |_| | | | | | | (_| | |_) \__ \
 \____\__,_|___/\__\___/|_| |_| |_|  |_|\_\___|\__, |_| |_| |_|\__,_| .__/|___/
                                                |___/                |_|
==============================================================================
]]

--[[
==============================================================================
  _   _          ____ _               _
 | \ | |_   __  / ___| |__   __ _  __| |
 |  \| \ \ / / | |   | '_ \ / _` |/ _` |
 | |\  |\ V /  | |___| | | | (_| | (_| |
 |_| \_| \_/    \____|_| |_|\__,_|\__,_|
==============================================================================
]]
-- add yours here
map("n", "<leader>th", '<cmd>lua require("nvchad.themes").open()<CR>', "NvChad Themes")

map("n", ";", ":", "CMD enter command mode")

-- line action
map("n", "<C-,>", "^", "move to start of the line")
map("n", "<C-.>", "$", "move to end of the line")
map("n", "<leader>n", "<cmd>set nu!<CR>", "toggle line number")
map("n", "<leader>rn", "<cmd>set rnu!<CR>", "toggle relative number")
-- Comment
vim.keymap.set("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
vim.keymap.set("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- NvimTree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", "nvimtree toggle")

-- buffer actions
map("n", "<tab>", "<CMD>bnext<CR>", "Next Buffer")
map("n", "<S-tab>", "<CMD>bprev<CR>", "Prev Buffer")

map("n", "<leader>x", function()
    require("nvchad.tabufline").close_buffer()
end, "buffer close")
--[[
==============================================================================
 _____                          _   _   _
|  ___|__  _ __ _ __ ___   __ _| |_| |_(_)_ __   __ _
| |_ / _ \| '__| '_ ` _ \ / _` | __| __| | '_ \ / _` |
|  _| (_) | |  | | | | | | (_| | |_| |_| | | | | (_| |
|_|  \___/|_|  |_| |_| |_|\__,_|\__|\__|_|_| |_|\__, |
                                                |___/
==============================================================================
]]

map("", "<leader>fd", function()
    helpers.diffFormat()
end, "Diff Format")

map("n", "<leader>fe", "<cmd>FormatEnable<CR>", "Enable AutoFormat")
map("n", "<leader>fE", "<cmd>FormatDisable<CR>", "Disable AutoFormat")

--[[
==============================================================================
 _____    _
|_   _|__| | ___  ___  ___ ___  _ __   ___
  | |/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \
  | |  __/ |  __/\__ \ (_| (_) | |_) |  __/
  |_|\___|_|\___||___/\___\___/| .__/ \___|
                               |_|
==============================================================================
]]

map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", "telescope live grep")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", "telescope find buffers")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", "telescope help page")
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", "telescope find marks")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", "telescope find oldfiles")
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", "telescope find in current buffer")
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", "telescope git commits")
map("n", "<leader>gt", "<cmd>Telescope git_signs<CR>", "telescope git buffer status")
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", "telescope git status")
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", "telescope pick hidden term")

map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", "telescope lsp symbols")
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", "telescope find files")
map(
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    "telescope find all files"
)

--[[
==============================================================================
 _   _           _     _____
| | | |_ __   __| | __|_   _| __ ___  ___
| | | | '_ \ / _` |/ _ \| || '__/ _ \/ _ \
| |_| | | | | (_| | (_) | || | |  __/  __/
 \___/|_| |_|\__,_|\___/|_||_|  \___|\___|
==============================================================================
]]

map("n", "<leader>u", vim.cmd.UndotreeToggle, "Undo Tree")

--[[
==============================================================================
 _____                 _      _____
|_   _|___   __ _  __ | | ___|_   _|___ _ __ _ __ ___
  | |/ _ \ / _` |/ _` | |/ _ \ | |/ _ \ '__| '_ ` _ \
  | | (_) | (_| | (_| | |  __/ | |  __/ |  | | | | | |
  |_|\___/ \__, |\__, |_|\___| |_|\___|_|  |_| |_| |_|
           |___/ |___/
==============================================================================
]]

map({ "n", "i", "v" }, "<C-\\>", "<cmd>ToggleTerm direction=float<CR>", "Toggle Terminal")

--[[
==============================================================================
__     __              _____       _           _
\ \   / /__ _ ____   _/ ___|  ___ | | ___  ___| |_
 \ \ / / _ \ '_ \ \ / /\___ \ / _ \ |/ _ \/ __| __|
  \ V /  __/ | | \ V /  ___) |  __/ |  __/ (__| |_
   \_/ \___|_| |_|\_/  |____/ \___|_|\___|\___|\__|
==============================================================================
]]

-- Keymap to open VenvSelector to pick a venv.
map("n", "<leader>vs", "<cmd>VenvSelect<CR>", "Select Venv")
-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
map("n", "<leader>vc", "<cmd>VenvSelectCached<CR>", "Sel. Last Venv")

--[[
==============================================================================
 ____    _    ____
|  _ \  / \  |  _ \
| | | |/ _ \ | |_) |
| |_| / ___ \|  __/
|____/_/   \_\_|
==============================================================================
]]

map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", "Toggle DAP UI")
map("n", "<leader>db", '<cmd> lua require("dap").toggle_breakpoint() <CR>', "Toggle Breakpoint")
map("n", "<leader>dc", '<cmd> lua require("dap").continue() <CR>', "Continue")
map("n", "<leader>do", '<cmd> lua require("dap").step_over() <CR>', "Step Over")
map("n", "<leader>di", '<cmd> lua require("dap").step_into() <CR>', "Step Into")
map("n", "<leader>dC", '<cmd> lua require("dap").run_to_cursor() <CR>', "Run to Cursor")
map("n", "<leader>dT", '<cmd> lua require("dap").terminate() <CR>', "Terminate")

--[[
==============================================================================
 _____             _ _   _
|  ___|_   _  __ _(_) |_(_)_   _____
| |_ | | | |/ _` | | __| \ \ / / _ \
|  _|| |_| | (_| | | |_| |\ V /  __/
|_|   \__,_|\__, |_|\__|_| \_/ \___|
            |___/
==============================================================================
]]

-- Toggle diff against HEAD
map("n", "<leader>gd", function()
    helpers.toggle_gvdiff()
end, "Toggle Gvdiff HEAD")

-- Toggle diff against the index (staged changes)
map("n", "<leader>gi", function()
    helpers.toggle_gvdiff(":")
end, "Toggle Gvdiff Index")

-- Toggle diff against a specific branch (e.g., main) - less common for a toggle
map("n", "<leader>gm", function()
    helpers.toggle_gvdiff("main")
end, "Toggle Gvdiff main")

--[[
==============================================================================
  ____ _ _   ____  _
 / ___(_) |_/ ___|(_) __ _ _ __  ___
| |  _| | __\___ \| |/ _` | '_ \/ __|
| |_| | | |_ ___) | | (_| | | | \__ \
 \____|_|\__|____/|_|\__, |_| |_|___/
                     |___/
==============================================================================
]]

local gs = require("gitsigns")

-- stylua: ignore start
map("n", "]h", function()
    if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
    else
        gs.nav_hunk("next")
    end
end, "Next Hunk")

map("n", "[h", function()
    if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
    else
        gs.nav_hunk("prev")
    end
end, "Prev Hunk")

map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
map("n", "<leader>ghd", gs.diffthis, "Diff This")
map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")

--[[
==============================================================================
 _   _
| | | | __ _ _ __ _ __   ___   ___  _ __
| |_| |/ _` | '__| '_ \ / _ \ / _ \| '_ \
|  _  | (_| | |  | |_) | (_) | (_) | | | |
|_| |_|\__,_|_|  | .__/ \___/ \___/|_| |_|
                 |_|
==============================================================================
]]

local harpoon = require("harpoon")
map("n", "<leader>q", function()
    helpers.toggle_telescope(harpoon:list())
end,  "Open harpoon window" )

-- vim.notify(msg_prefix .. msg, vim.log.levels.INFO, { title = 'VenvSelect' })
-- map("n", "<leader>a", function()
--     harpoon:list():add()
-- end)
-- -- map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- map("n", "<C-h>", function()
--     harpoon:list():select(1)
-- end)
-- map("n", "<C-t>", function()
--     harpoon:list():select(2)
-- end)
-- map("n", "<C-n>", function()
--
--     harpoon:list():select(3)
--
-- end)
--
-- map("n", "<C-s>", function()
--     harpoon:list():select(4)
-- end)
--
-- -- Toggle previous & next buffers stored within Harpoon list
-- map("n", "<S-tab>", function()
--     harpoon:list():prev()
-- end)
-- map("n", "<tab>", function()
--     harpoon:list():next()
-- end)

--[[
==============================================================================
 ____               _     _
|  _ \ ___ _ __ ___(_)___| |_ ___ _ __   ___ ___
| |_) / _ \ '__/ __|_/ __| __/ _ \ '_ \ / __/ _ \
|  __/  __/ |  \__ \ \__ \ ||  __/ | | | (_|  __/
|_|   \___|_|  |___/_|___/\__\___|_| |_|\___\___|
==============================================================================
]]

-- require("persistence").load({ last = true })

-- local map = map
-- -- load the session for the current directory
-- map("n", "<leader>qs", '<cmd> lua require("persistence").load() <CR>',  "load session" )
--
-- map("n", "<leader>qS", '<cmd> lua require("persistence").select() <CR>',  "select session" )
--
-- map("n", "<leader>ql", '<cmd> lua require("persistence").load({last = true}) <CR>',  "load last session" )
--
-- map("n", "<leader>qd", '<cmd> lua require("persistence").stop() <CR>',  "stop persist" )

--[[
==============================================================================
  ___
 / _ \__   _____ _ __ ___  ___  ___ _ __
| | | \ \ / / _ \ '__/ __|/ _ \/ _ \ '__|
| |_| |\ V /  __/ |  \__ \  __/  __/ |
 \___/  \_/ \___|_|  |___/\___|\___|_|
==============================================================================
]]

map( "n", "<leader>ow", "<cmd>OverseerToggle<cr>",       "Task list")
map( "n", "<leader>oo", "<cmd>OverseerRun<cr>",          "Run task" )
map( "n", "<leader>oq", "<cmd>OverseerQuickAction<cr>",  "Action recent task" )
map( "n", "<leader>oi", "<cmd>OverseerInfo<cr>",         "Overseer Info" )
map( "n", "<leader>ob", "<cmd>OverseerBuild<cr>",        "Task builder" )
map( "n", "<leader>ot", "<cmd>OverseerTaskAction<cr>",   "Task action" )
map( "n", "<leader>oc", "<cmd>OverseerClearCache<cr>",   "Clear cache" )
