local focus = require("focus")

local M = {
  setup = function()
    local ignore_filetypes = { 
        "",
        "TelescopePrompt",
        "toggleterm",
        "nvterm",
        "poetry",
        "NvimTree",
        "NvimTree_1",
        "neo-tree",
        "nvim-tree",
        "nofile"
    }
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
    focus.setup({
      split = {
        bufnew = false
      },
      autoresize = {
        height_quickfix = 20
      },
    })
  end
}
return M
