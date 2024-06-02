local M = {}

local diagnostic_enabled = true

local function copyPath(opts)
  local path = vim.fn.expand(opts)
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    ["<leader>ff"] = {
      "<cmd> lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>",
      "Find files",
    },
    ["<leader>fw"] = {
      "<cmd> lua require'telescope.builtin'.live_grep({ additional_args = {'--hidden', '--iglob', '!.git'} })<CR>",
      "Live grep",
    },
    ["<leader>f?"] = { "<cmd> :TodoTelescope<CR>", "Todo Telescope" },
    ["<leader>q"] = { vim.diagnostic.setloclist, "Open Diagnostic [Q]uickfix list" },
    ["<leader>dd"] = {
      function()
        diagnostic_enabled = not diagnostic_enabled
        if diagnostic_enabled then
          vim.diagnostic.show()
        else
          vim.diagnostic.hide()
        end
      end,
      "Toggle diagnostic mode",
    },
    ["<leader>cf"] = {
      function()
        copyPath "%:h"
      end,
      "Copy [c]urrent relative [f]ile directory",
    },
    ["<leader>cF"] = {
      function()
        copyPath "%:p:h"
      end,
      "Copy [c]urrent [a]bsolute file directory",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

M.undotree = {
  n = {
    ["<leader>u"] = {
      "<cmd> UndotreeToggle <CR>",
      "Toggle undotree",
    },
  },
}

M.neotest = {
  n = {
    ["<leader>ta"] = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach to the nearest test" },
    ["<leader>tl"] = { "<cmd>lua require('neotest').run.run_last()<cr>", "Toggle Test Summary" },
    ["<leader>to"] = { "<cmd>lua require('neotest').output_panel.toggle()<cr>", "Toggle Test Output Panel" },
    ["<leader>tp"] = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop the nearest test" },
    ["<leader>ts"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Toggle Test Summary" },
    ["<leader>tt"] = { "<cmd>lua require('neotest').run.run()<cr>", "Run the nearest test" },
    ["<leader>tT"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run test the current file" },
  },
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

M.neogit = {
  n = {
    ["<leader>gn"] = {
      "<cmd> Neogit <CR>",
      "Open Neogit",
    },
  },
}

M.gitsigns = {
  n = {
    ["<leader>gd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "Git diff",
    },
  },
}

return M
