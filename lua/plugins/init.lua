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
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "vim-crystal/vim-crystal",
    ft = "crystal",
    config = function(_)
      vim.g.crystal_auto_format = 1
    end,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "configs.cmp"
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "gbprod/none-ls-shellcheck.nvim",
    },
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    "nvim-neotest/nvim-nio",
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "mbbill/undotree",
    lazy = false,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "folke/neoconf.nvim",
    lazy = false,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
      "haydenmeade/neotest-jest",
      "rcasia/neotest-java",
      "rcasia/neotest-bash",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-go",
          require "neotest-jest",
          require "neotest-java",
          require "neotest-bash",
          require "neotest-python",
        },
      }
    end,
  },

  -- {
  --   url = "https://git.sr.ht/~reggie/licenses.nvim",
  --   lazy = false,
  --   config = function()
  --     require 'configs.license'
  --   end
  -- }

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
  --   "github/copilot.vim",
  --   lazy = false,
  --   config = function() -- Mapping tab is already used by NvChad
  --     -- vim.g.copilot_no_tab_map = true
  --     vim.g.copilot_assume_mapped = true
  --     -- vim.g.copilot_tab_fallback = ""
  --     -- The mapping is set to other key, see custom/lua/mappings
  --     -- or run <leader>ch to see copilot mapping section
  --   end,
  -- },
  --
  -- {
  --   "NeogitOrg/neogit",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",         -- required
  --     "sindrets/diffview.nvim",        -- optional - Diff integration
  --     -- Only one of these is needed, not both.
  --     "nvim-telescope/telescope.nvim", -- optional
  --     "ibhagwan/fzf-lua",              -- optional
  --   },
  --   config = true,
  -- },

  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recommended as each new version will have breaking changes
    opts = {
      --Config goes here
    },
  },
  --
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function(plugin)
      if vim.fn.executable "npx" then
        vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
      else
        vim.cmd [[Lazy load markdown-preview.nvim]]
        vim.fn["mkdp#util#install"]()
      end
    end,
    init = function()
      if vim.fn.executable "npx" then
        vim.g.mkdp_filetypes = { "markdown" }
      end
    end,
  },

  {
    "OXY2DEV/markview.nvim",
    -- The plugin automatically runs itself when a
    -- markdown file is opened. You need to use this to
    -- tell lazy to load the plugin when the filetype is
    -- markdown
    ft = "markdown",
    dependencies = {
      -- You may not need this if you don't lazy load
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",

      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "polarmutex/git-worktree.nvim",
    version = "^2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup {
        background_colour = "#000000",
        enabled = false,
      }
    end,
  },

  {
    "VonHeikemen/fine-cmdline.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        adaptive_size = true,
      },
    },
  },
}
