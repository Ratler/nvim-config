vim.opt.colorcolumn = "120"
vim.wo.relativenumber = true

-- CurSearch needs to be set here, hl_override is not working
vim.api.nvim_set_hl(0, "Search", { fg = "black", bg = "green" })
vim.api.nvim_set_hl(0, "IncSearch", { fg = "black", bg = "green" })
vim.api.nvim_set_hl(0, "CurSearch", { fg = "#f8bd96", bg = "#474656" })

-- Status column colors
vim.api.nvim_set_hl(0, "LineNr4", { fg = "#3b4261" })
vim.api.nvim_set_hl(0, "LineNr3", { fg = "#446464" })
vim.api.nvim_set_hl(0, "LineNr2", { fg = "#5d8e97" })
vim.api.nvim_set_hl(0, "LineNr1", { fg = "#7daeb9" })
vim.api.nvim_set_hl(0, "LineNr0", { fg = "#bdeff9", bold = true })
vim.opt.statuscolumn = '%s%=%#LineNr4#%{(v:relnum >= 4)?v:relnum." │ ":"" }'
    .. '%#LineNr3#%{(v:relnum == 3)?v:relnum." │ ":"" }'
    .. '%#LineNr2#%{(v:relnum == 2)?v:relnum." │ ":"" }'
    .. '%#LineNr1#%{(v:relnum == 1)?v:relnum." │ ":"" }'
    .. '%#LineNr0#%{(v:relnum == 0)?v:lnum." │ ":"" }'

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Undotree
vim.g.undotree_WindowLayout = 3

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- " copy current file name (relative/absolute) to system clipboard
-- if has("mac") || has("gui_macvim") || has("gui_mac")
--   " relative path  (src/foo.txt)
--   nnoremap <leader>cf :let @*=expand("%")<CR>
--
--   " absolute path  (/something/src/foo.txt)
--   nnoremap <leader>cF :let @*=expand("%:p")<CR>
--
--   " filename       (foo.txt)
--   nnoremap <leader>ct :let @*=expand("%:t")<CR>
--
--   " directory name (/something/src)
--   nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
-- endif
--
-- " copy current file name (relative/absolute) to system clipboard (Linux version)
-- if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
--   " relative path (src/foo.txt)
--   nnoremap <leader>cf :let @+=expand("%")<CR>
--
--   " absolute path (/something/src/foo.txt)
--   nnoremap <leader>cF :let @+=expand("%:p")<CR>
--
--   " filename (foo.txt)
--   nnoremap <leader>ct :let @+=expand("%:t")<CR>
--
--   " directory name (/something/src)
--   nnoremap <leader>ch :let @+=expand("%:p:h")<CR>
