local opts = {noremap = true, silent = true}
local M = {}
M.disabled = {
  n = {
    ["<C-s>"] = "",
  },
}
M.abc = {
  n = {
    ["<leader>w"] = {"<cmd> w <CR><ESC>", "save file", opts},
    ["<leader>q"] = {":q <CR>", "quit"},
    ["<leader><leader>"] = {
      function()
        require('specs').show_specs()
      end,
      "show cursor",
      opts
    },
    ["<C-t>"] = {
      "<cmd>ToggleTerm direction=float<CR>",
      "open float terminal"
    },
    ["<leader>lf"] = {
      "<cmd>lua vim.lsp.buf.format{ async = true }<CR>",
      "Format buffer"
    }
  },
  v = {
    ["<"] = {"<gv", ""},
    [">"] = {">gv", ""},
  },
  x = {
    ["K"] = {":move '<-2<CR>gv-gv", "move up", opts},
    ["J"] = {":move '>+1<CR>gv-gv", "move down", opts},
    ["<A-k>"] = {":move '>+1<CR>gv-gv", "move up", opts},
    ["<A-j>"] = {":move '<-2<CR>gv-gv", "move down", opts},
  },
}
M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>c"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["gcc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["gcc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}
M.nvterm = {
  plugin = true,
  t = {
    -- toggle in terminal mode
    ["<C-t>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
  },
  n = {
    -- toggle in terminal mode
    ["<C-t>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    ["<A-t"] = {
      function()
        require("nvterm").close_all_terms()
      end,
      "toggle all terminal windows"
    }
  },
}
M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ["gl"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    }
  }
}
return M
