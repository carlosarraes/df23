return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		if vim.g.vscode then
			return
		end

		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local cmp_lsp = require("cmp_nvim_lsp")
		local cmp = require("cmp")

		local capabilities = cmp_lsp.default_capabilities()
		local on_attach = function(client, bufnr)
			local on_list = require("plugins.lsp.utils.ignore-modules")
			local def_split = require("plugins.lsp.utils.def_split")
			local navic = require("nvim-navic")
			local opts = { noremap = true, silent = true, buffer = bufnr }
			local bind = vim.keymap.set

			bind("n", "gV", def_split, opts)
			bind("n", "gd", function()
				vim.lsp.buf.definition({ on_list = on_list })
			end, opts) -- go to definition
			bind("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show references
			bind("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show references
			bind("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- go to implementation
			bind("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
			bind({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
			bind("n", "<space>rn", vim.lsp.buf.rename, opts)
			bind("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
			bind("n", "<leader>d", vim.diagnostic.open_float, opts)
			bind("n", "<C-p>", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
			bind("n", "<C-n>", "<cmd>lua vim.diagnostic.goto_next()<CR>")

			bind("n", "<leader>rf", ":TSToolsRenameFile<CR>") -- rename file and update imports
			bind("n", "<leader>ri", ":TSToolsRemoveUnused<CR>") -- remove unused variables
			bind("n", "<leader>ru", ":TSToolsOrganizeImports<CR>") -- organize imports

			if client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
			end
		end

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["marksman"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tsserver"].setup({
			server = {
				capabilities = capabilities,
				on_attach = on_attach,
			},
		})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "css", "sass", "scss", "less", "svelte" },
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "workspace",
						typeCheckingMode = "basic",
					},
				},
			},
		})

		lspconfig["crystalline"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig["rust_analyzer"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "gopls", "serve" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.mod", ".git"),
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
				},
			},
		})

		lspconfig["bashls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "bash-language-server", "start" },
			filetypes = { "sh", "bash", "zsh" },
		})
	end,
}
