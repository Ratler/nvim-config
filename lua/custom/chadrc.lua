---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
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
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
