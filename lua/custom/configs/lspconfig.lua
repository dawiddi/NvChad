local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "pyright", "texlab", "ltex"}

-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

local opts = {}

for _, lsp in pairs(servers) do
	opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	lsp = vim.split(lsp, "@")[1]

	local require_ok, conf_opts = pcall(require, "custom.configs.lspsettings." .. lsp)

	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[lsp].setup(opts)
end
