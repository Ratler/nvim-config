local cmp = require "cmp"
local config = cmp.get_config()

table.insert(config.sources, {
  name = "supermaven",
})

local options = {
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

cmp.setup(options)
