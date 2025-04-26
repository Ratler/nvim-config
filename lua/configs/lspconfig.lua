-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.servers = {
  "gopls",
  "phpactor",
  "terraformls",
  "bashls",
  "yamlls",
  "dockerls",
  "html",
  "taplo",
  "ts_ls",
  "volar",
  "tailwindcss",
  "marksman",
  "ansiblels",
}

local default_servers = {}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

local mason_registry = require "mason-registry"

for _, lsp in ipairs(default_servers) do
  local server_config = {}
  if require("neoconf").get(lsp .. ".disable") then
    return
  end

  server_config.on_init = on_init
  server_config.on_attach = on_attach
  server_config.capabilities = capabilities

  if lsp == "volar" then
    server_config.filetypes = { "vue", "typescript", "javascript" }
    server_config.init_options = {
      typescript = {
        tsdk = mason_registry.get_package("vue-language-server"):get_install_path() .. "/node_modules/typescript/lib",
      },
      preferences = {
        disablesuggestions = true,
      },
    }
  end

  if lsp == "ts_ls" then
    server_config.init_options = {
      preferences = {
        disablesuggestions = true,
      },
    }
    server_config.commands = {
      OrganizeImports = {
        organize_imports,
        description = "organize imports",
      },
    }
  end

  lspconfig[lsp].setup(server_config)
end

lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.phpactor.setup {
  root_dir = function(_)
    return vim.loop.cwd()
  end,
  init_options = {
    ["language_server.diagnostics_on_update"] = false,
    ["language_server.diagnostics_on_open"] = false,
    ["language_server.diagnostics_on_save"] = false,
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
  },
}

lspconfig.clangd.setup {
  cmd = {
    -- see clangd --help-hidden
    "clangd",
    -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
    -- to add more checks, create .clang-tidy file in the root directory
    -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
    "--clang-tidy",
    "--background-index",
    "--completion-style=bundled",
    "--header-insertion=iwyu",
    "--enable-config",
  },
  -- TODO: figure out what is this
  init_options = {
    clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<M-S-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    --     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>F", function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Force ansiblels on buffers based on path patterns (to avoid ansible.yaml file endings or annotations)
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("ansible_playbook", {}),
  pattern = {
    "*/*playbook*/*.yml",
    "*/*playbook*/*.yaml",
    "*/*ansible*/*.yml",
    "*/*ansible*/*.yaml",
    "*/roles/*/tasks/*.yml",
    "*/roles/*/tasks/*.yaml",
    "*/roles/*/defaults/*.yml",
    "*/roles/*/defaults/*.yaml",
    "*/roles/*/handlers/*.yml",
    "*/roles/*/handlers/*.yaml",
    "*/roles/*/tasks/*.yml",
    "*/roles/*/tasks/*.yaml",
    "*/*ansible*/*.yaml",
    "*/*ansible*/*.yaml",
    "*/*ansible*/*.yaml",
    "playbook.yml",
    "playbook.yaml",
    "site.yml",
    "site.yaml",
    "inventory.yml",
    "inventory.yaml",
  },
  command = "set ft=yaml.ansible",
  desc = "use yaml.ansible for ansible playbooks",
})
