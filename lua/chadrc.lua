---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nightowl",
  hl_override = {
    IncSearch = {
      fg = "black",
      bg = "green",
    },
    Search = {
      fg = "black",
      bg = "green",
    },
  },
}

-- M.ui = {
--   tabufline = {
--     enabled = false,
--   },
-- }
--
M.mason = {
  pkgs = {
    -- webdev
    "phpactor",
    "eslint_d",
    "prettierd",
    "js-debug-adapter",
    "typescript-language-server",
    "vue-language-server",
    "tailwindcss-language-server",
    "html-lsp",

    -- c/c++
    "clangd",
    "clang-format",
    "cmake-language-server",
    "cpplint",
    "cpptools",

    -- golang
    "gopls",
    "gofumpt",
    "goimports",
    "goimports-reviser",
    "golangci-lint",
    "golangci-lint-langserver",
    "golines",
    "gomodifytags",

    -- shell
    "bash-language-server",
    "shellcheck",

    -- python
    "black",
    "debugpy",
    "mypy",
    "pyright",

    -- mk
    "marksman",

    -- Ansible
    "ansible-language-server",
    "ansible-lint",

    -- Other
    "ruff",
    "terraform-ls",
    "tflint",
    "yaml-language-server",
    "dockerfile-language-server",
    "taplo",
  },
}

return M
