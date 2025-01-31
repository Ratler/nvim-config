return {

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server",
        "stylua",

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

        -- NIX
        "nixpkgs-fmt",
      },
    },
  },
}
