local focus = require("focus")

local M = {
  setup = function()
    focus.setup({
      split = {
        bufnew = true
      }
    })
  end
}
return M
