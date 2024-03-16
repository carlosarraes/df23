return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer",
	},
	config = function()
		if vim.g.vscode then
			return
		end

		local mason = require("mason")
		local mason_lsp = require("mason-lspconfig")
		local mason_tool = require("mason-tool-installer")

		mason.setup()

		mason_lsp.setup({
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"emmet_ls",
				"pyright",
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"bashls",
			},
			automatic_installation = true,
		})

		mason_tool.setup({
			"eslint_d",
			"prettierd",
			"mypy",
			"stylua",
			"ruff",
			"goimports",
			"gofumpt",
			"shellcheck",
			"shfmt",
		})
	end,
}
