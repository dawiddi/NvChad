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
    ["<leader>lf"] = {
      "<cmd>lua vim.lsp.buf.format{ async = true }<CR>",
      "Format buffer"
    },
    ["+"] = {
      "<cmd>vertical resize +2<CR>",
      "Increase window width"
    },
    ["ü"] = {
      "<cmd>vertical resize -2<CR>",
      "Decrease window width"
    },
    ["<A-l>"] = {
      function()
        require('focus').split_command('l')
      end,
      "Split left",
    },
    ["<A-j>"] = {
      function()
        require('focus').split_command("j")
      end,
      "Split down",
    },
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
        require("nvchad.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>c"] = {
      function()
        require("nvchad.tabufline").close_buffer()
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
    },
  },
}
M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
  n = {
    ["gd"] = {
      function()
        require("goto-preview").goto_preview_definition()
      end,
      "Code definition preview"
    },
    ["gdd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },
    ["gi"] = {
      function()
        require("goto-preview").goto_preview_implementation()
      end,
      "Code implementation preview"
    },
    ["gii"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },
    ["gl"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
    ["gq"] = {
      function()
        require("goto-preview").close_all_win()
      end,
      "Close all preview windows"
    },
    ["gt"] = {
      "<cmd>TroubleToggle document_diagnostics<CR>",
      "Toggle Trouble Document Diagnostics"
    },
    ["gta"] = {
      "<cmd>TroubleToggle workspace_diagnostics<CR>",
      "Toggle Trouble Workspace Diagnostics"
    },
    ["gtq"] = {
      "<cmd>TroubleToggle quickfix<CR>",
      "Toggle Trouble Quickfix"
    },
  }
}
return M
