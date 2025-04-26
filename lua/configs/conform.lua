local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    gomod = { "gofumpt", "goimports-reviser" },
    gowork = { "gofumpt", "goimports-reviser" },
    gotmpl = { "gofumpt", "goimports-reviser" },
    css = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    python = { "black" },
  },

  formatters = {
    -- Golang
    ["goimports-reviser"] = {
      prepend_args = { "-rm-unused -set-alias" },
    },
    golines = {
      prepend_args = { "--max-len=120" },
    },
    -- Python
    black = {
      prepend_args = {
        "--fast",
        "--line-length",
        "120",
      },
    },
  },

  format_on_save = {
    timeout_ms = 1500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
