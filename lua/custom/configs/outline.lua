local context = require("outline")
local M = {
  setup = function()
    context.setup({
      position = "right",
      autofold_depth = 0,
      auto_close = true,
    })
  end
}
return M
