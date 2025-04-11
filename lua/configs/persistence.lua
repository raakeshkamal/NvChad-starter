require("persistence").setup({
    dir = vim.fn.stdpath("state") .. "/sessions", -- directory where sessions files are saved
    -- minimum number of file buffers that need to be open to save
    -- -- Set to 0 to always save
    need = 0,
    -- branch = true, -- use git branch to save session
})

-- Create an autocommand group to organize our autocommands
local vimenter_augroup = vim.api.nvim_create_augroup("VimEnterEvents", { clear = true })

-- Callback for when NvimTree is opened
vim.api.nvim_create_autocmd("VimEnter", {
    group = vimenter_augroup,
    callback = function()
        vim.schedule(function()
            require("persistence").load()
            require("nvim-tree.api").tree.toggle()
        end)
    end,
})
