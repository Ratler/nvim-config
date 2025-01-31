require "nvchad.mappings"

local map = vim.keymap.set
local diagnostic_enabled = true

local function copyPath(opts)
  local path = vim.fn.expand(opts)
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end

-- Tmux navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- Navigation
map("n", "<C-d>", "<C-d>zz", { desc = "half page down (center)" })
map("n", "<C-u>", "<C-u>zz", { desc = "half page up (center)" })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find Todo" })
-- Telescope
map(
  "n",
  "<leader>ff",
  "<cmd> lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>",
  { desc = "Find files" }
)
map(
  "n",
  "<leader>fw",
  "<cmd> lua require'telescope.builtin'.live_grep({ additional_args = {'--hidden', '--iglob', '!.git'} })<CR>",
  { desc = "Live grep" }
)

-- map("n", "<leader>ft", "<cmd> TodoTelescope<CR>", { "Todo telescope" })

map("n", "<leader>dd", function()
  diagnostic_enabled = not diagnostic_enabled
  if diagnostic_enabled then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end, { desc = "Toggle diagnostic mode" })

-- Copy path
map("n", "<leader>cf", function()
  copyPath "%:h"
end, { desc = "Copy [c]urrent relative [f]ile directory" })
map("n", "<leader>cF", function()
  copyPath "%:p:h"
end, { desc = "Copy [c]urrent absolute [F]ile directory" })

-- Undotree
map("n", "<leader>u", "<cmd> UndotreeToggle<CR>", { desc = "Toggle undotree" })

-- Debug
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Add breakpoint at line" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })
map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Run or continue the debugger" })
map("n", "<leader>dn", function()
  require("dap").step_over()
end, { desc = "Step over" })
map("n", "<leader>dgt", function()
  require("dap-go").debug_test()
end, { desc = "Debug go test" })
map("n", "<leader>dgl", function()
  require("dap-go").debug_last()
end, { desc = "Debug last go test" })
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "Debug python test method" })

-- Tests
map("n", "<leader>ta", function()
  require("neotest").run.attach()
end, { desc = "Attach to the nearest test" })
map("n", "<leader>tl", function()
  require("neotest").run.run_last()
end, { desc = "Toggle Test Summary" })
map("n", "<leader>to", function()
  require("neotest").output_panel.toggle()
end, { desc = "Toggle Test Output Panel" })
map("n", "<leader>tp", function()
  require("neotest").run.stop()
end, { desc = "Stop the nearest test" })
map("n", "<leader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "Toggle Test Summary" })
map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Run the nearest test" })
map("n", "<leader>tT", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run test the current file" })

-- Go
map("n", "<leader>gsj", function()
  require("gopher").tag_add "json"
end, { desc = "Add json struct tags" })
map("n", "<leader>gsy", function()
  require("gopher").tag_add "yaml"
end, { desc = "Add yaml struct tags" })

-- Git
map("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end, { desc = "Git diff" })

-- M.copilot = {
--   i = {
--     ["<C-l>"] = {
--       function()
--         vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
--       end,
--       "Copilot Accept",
--       { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
--     },
--   },
-- }
--
