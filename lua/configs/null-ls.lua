-- local null_ls = require "null-ls"
-- local helpers = require "null-ls.helpers"
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local b = null_ls.builtins
--
-- local markdownlint = {
--   method = null_ls.methods.DIAGNOSTICS,
--   filetypes = { "markdown" },
--   -- null_ls.generator creates an async source
--   -- that spawns the command with the given arguments and options
--   generator = null_ls.generator {
--     command = "markdownlint",
--     args = { "--stdin", "--config", "~/.markdownlint.yaml" },
--     to_stdin = true,
--     from_stderr = true,
--     -- choose an output format (raw, json, or line)
--     format = "line",
--     check_exit_code = function(code, stderr)
--       local success = code <= 1
--
--       if not success then
--         -- can be noisy for things that run often (e.g. diagnostics), but can
--         -- be useful for things that run on demand (e.g. formatting)
--         print(stderr)
--       end
--
--       return success
--     end,
--     -- use helpers to parse the output from string matchers,
--     -- or parse it manually with a function
--     on_output = helpers.diagnostics.from_patterns {
--       {
--         pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
--         groups = { "row", "col", "message" },
--       },
--       {
--         pattern = [[:(%d+) [%w-/]+ (.*)]],
--         groups = { "row", "message" },
--       },
--     },
--   },
-- }
--
-- null_ls.register(markdownlint)
--
-- local opts = {
--   sources = {
--
--     -- webdev
--     b.formatting.prettierd,
--
--     -- python
--     b.diagnostics.mypy,
--
--     -- cpp
--     b.formatting.clang_format,
--     b.diagnostics.cppcheck,
--
--     -- shell
--     b.formatting.shfmt,
--     require("none-ls-shellcheck.diagnostics").with { diagnostics_format = "#{m} [#{c}]" },
--     require "none-ls.diagnostics.ruff",
--     require "none-ls.diagnostics.eslint_d",
--   },
--   on_attach = function(client, bufnr)
--     if client.supports_method "textDocument/formatting" then
--       vim.api.nvim_clear_autocmds {
--         group = augroup,
--         buffer = bufnr,
--       }
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           vim.lsp.buf.format { bufnr = bufnr }
--         end,
--       })
--     end
--   end,
-- }
--
-- return opts
