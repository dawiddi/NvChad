local plugins = {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    init = function()
      require("core.utils").load_mappings "telescope"
    end,
    opts = function()
      return require "custom.configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
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
    ft = "python",
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
  },
  {
    "rmagatti/goto-preview",
    lazy = true,
    ft = "python",
    config = function()
      require("custom.configs.goto_preview").setup()
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    lazy = true,
    ft = "python",
    config = function()
      require("custom.configs.treesitter_context").setup()
    end
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings()
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    lazy=true,
    ft="python",
    config = function()
      require("symbols-outline").setup()
    end
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end
  },
}
return plugins
