local cmp = require "cmp"
local config = cmp.get_config()
local M = {}

table.insert(config.sources, {
  name = "supermaven",
})

M.cmp = {
  completion = {
    completeopt = "menu,menuone,noselect,noinsert",
  },
  sources = {
    { name = "supermaven" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    },
  },
}

return M
