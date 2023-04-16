local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local M = {}
M.ui = {theme = 'ayu_light'}
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

-- require("custom.configs.null").setup()

return M
