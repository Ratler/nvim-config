local options = {
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
    "python",
    "kotlin",
    "java",
    "groovy",

    -- Golang
    "go",
    "gomod",
    "gotmpl",
    "gowork",

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

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  ident = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
