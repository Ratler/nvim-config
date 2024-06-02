local cmp = require 'cmp'
local M = {}


M.cmp = {
    completion = {
      completeopt = "menu,menuone,noselect,noinsert",
    },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    },
  },
}

return M
