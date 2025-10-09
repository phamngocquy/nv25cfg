require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "pyright",
  "yamlls",
  "gopls",
  "ansiblels",
  "sqlls",
  "buf_ls",
  "bashls",
  "dockerls",
  "clangd",
  "ts_ls",
  "ruby_lsp",
  "sqls",
  "docker_compose_language_service",
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
