local config = require("plugins.configs.lspconfig")
local util = require 'lspconfig/util'

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

-- root_dir = nvim_lsp.util.root_pattern('.git', "pyrightconfig.json", ".tox");

-- lspconfig.jedi_language_server.setup{}
-- lspconfig.pylsp.setup{}
-- lspconfig.pylsp.setup{
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = {'W391'},
--           maxLineLength = 100
--         }
--       }
--     }
--   }
-- }
