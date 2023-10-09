local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open()
end
local ignore_filetypes = { 'nvim-tree' }
local ignore_buftypes = { 'nofile', 'prompt', 'popup' }

local augroup =
    vim.api.nvim_create_augroup('FocusDisable', { clear = true })

vim.api.nvim_create_autocmd('WinEnter', {
    group = augroup,
    callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
        then
            vim.w.focus_disable = true
        else
            vim.w.focus_disable = false
        end
    end,
    desc = 'Disable focus autoresize for BufType',
})

vim.api.nvim_create_autocmd('FileType', {
    group = augroup,
    callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.b.focus_disable = true
        else
            vim.b.focus_disable = false
        end
    end,
    desc = 'Disable focus autoresize for FileType',
})

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local M = {}
M.ui = {theme = 'ayu_light'}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

-- require("custom.configs.null").setup()

return M
