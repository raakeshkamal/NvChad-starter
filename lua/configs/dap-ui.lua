local dap = require("dap")
local dapui = require("dapui")
dapui.setup()

dap.listeners.after.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.after.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

-- Create an autocommand group to organize our autocommands
local vimleave_augroup = vim.api.nvim_create_augroup("VimLeaveEvents", { clear = true })

-- Callback for when NvimTree is opened
vim.api.nvim_create_autocmd("ExitPre", {
    group = vimleave_augroup,
    callback = function()
        dapui.close()
    end,
})
