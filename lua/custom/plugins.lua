local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = require("core.utils").load_mappings "nvimtree",
    opts = function()
      return require "custom.configs.nvimtree"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },
  {
    "edluffy/specs.nvim",
    lazy = false,
    opts = function()
      return require "custom.configs.specs"
    end,
    config = function(_, opts)
      require("specs").setup(opts)
    end,
  },
  {
    "echasnovski/mini.sessions",
    version = false,
    lazy = false,
    config = function()
      require("custom.configs.session").setup()
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    after = "nvim-lspconfig",
    config = function()
      require("custom.configs.null").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    after = "nvim-web-devicons",
    config = function()
      require("custom.configs.trouble").setup()
    end,
  },
  {
    "Vigemus/iron.nvim",
    lazy = true,
    config = function()
      require("custom.configs.iron").setup()
    end,
  },
  {
    "nvim-focus/focus.nvim",
    lazy = false,
    version=false,
    config = function()
      require("custom.configs.focus").setup()
    end,
  }
}
return plugins
