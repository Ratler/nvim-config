return {

  -- {
  --   "github/copilot.vim",
  --   enable = false,
  --   lazy = false,
  --   config = function() -- Mapping tab is already used by NvChad
  --     -- vim.g.copilot_no_tab_map = true
  --     vim.g.copilot_assume_mapped = true
  --     -- vim.g.copilot_tab_fallback = ""
  --     -- The mapping is set to other key, see custom/lua/mappings
  --     -- or run <leader>ch to see copilot mapping section
  --   end,
  -- },

  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    event = "InsertEnter",
    config = function()
      require("supermaven-nvim").setup {
        disable_inline_completion = true,
        disable_keymaps = true,
      }
    end,
  },

  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require "configs.codecompanion"
  --   end,
  -- },
}
