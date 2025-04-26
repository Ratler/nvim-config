return {
  {
    "saghen/blink.compat",
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = "*",
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },

  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = {
      "rafamadriz/friendly-snippets",
      "supermaven-inc/supermaven-nvim",
    },
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      appearance = {
        nerd_font_variant = "mono",
      },

      -- signature = {
      --   enabled = true,
      -- },
      --
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { "supermaven", "lsp", "path", "snippets", "buffer" },
        providers = {
          supermaven = {
            name = "supermaven",
            module = "blink.compat.source",
            score_offset = 3,
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
