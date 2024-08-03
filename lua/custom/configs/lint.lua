local lint = require "lint"
local eslint = lint.linters.eslint_d

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
}

eslint.args = {
  "--no-warn-ignored",
  "--format",
  "json",
  "--stdin",
  "--stdin-filename",
  function()
    return vim.api.nvim_buf_get_name(0)
  end,
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
