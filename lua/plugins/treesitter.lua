return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "vimdoc",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "vue",

        -- low level
        "c",

        -- Programming languages
        "tcl",
        "php",
        "go",
        "gomod",
        "python",
        "kotlin",
        "java",
        "groovy",

        -- Infra
        "hcl",
        "terraform",
        "yaml",
        "json",
        "bash",
        "dockerfile",
        "jq",

        -- markdown
        "markdown",
        "markdown_inline",

        -- NIX
        "nix",
      },
    },
  },
}
