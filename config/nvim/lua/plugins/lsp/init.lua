local status_lsp_installer, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_lsp_installer then
	print("mason-lspconfig error")
	return
end

local status_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig then
	print("lspconfig error")
	return
end

local status, typescript = pcall(require, "typescript")
if not status then
	print("typescript error")
	return
end

local status_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp then
	print("cmp_nvim_lsp error")
	return
end

local config = {
	virtual_text = false,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

local on_attach = function(client)
	require("core.keymaps").lsp_keymaps()
	-- use null-ls for these languages
	local ignored_formatters = {
		"tsserver",
		"sumneko_lua",
		"html",
	}
	for _, value in ipairs(ignored_formatters) do
		if value == client.name then
			client.server_capabilities.document_formatting = false
		end
	end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local servers = {
	"html",
	"cssls",
	"tsserver",
	"sumneko_lua",
	"jsonls",
	"tailwindcss",
	"prismals",
	"marksman",
	"eslint",
	"pylsp",
	"zk",
}

mason_lspconfig.setup({ ensure_installed = servers })

for _, server in pairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	server = vim.split(server, "@")[1]
	local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	if server == "tsserver" then -- uses the typescript plugin
		typescript.setup({
			disable_commands = false, -- prevent the plugin from creating Vim commands
			debug = false, -- enable debug logging for commands
			server = opts,
		})
	else
		lspconfig[server].setup(opts)
	end
end
