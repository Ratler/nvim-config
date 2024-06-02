vim.opt.colorcolumn = "120"
vim.wo.relativenumber = true

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
