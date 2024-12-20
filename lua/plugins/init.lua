return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "github/copilot.vim",
    lazy = false, -- load at startup
    config = function()
      -- Disable default Tab mapping since NVChad uses Tab for other things
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
    end
  },


  -- Treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- load at startup
    opts = {
      "vim", "lua", "vimdoc", "html", "css", "fsharp"  -- Add "fsharp" to the list of parsers
    },
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "fsharp" },  -- Add fsharp to the list of parsers
        highlight = {
          enable = true,  -- Enable syntax highlighting for F#
        },
      }
    end,
  },


  {
    "folke/which-key.nvim",
    lazy = false, -- load at startup
  },

  {
    "ionide/Ionide-vim",
  }
}
