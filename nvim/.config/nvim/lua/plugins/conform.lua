return {
	"stevearc/conform.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		if vim.g.vscode then
			return
		end

		local conform = require("conform")
		local save_config = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		}

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				markdown = { "prettierd" },
				yaml = { "prettierd" },
				lua = { "stylua" },
				python = { "ruff_format", "ruff_fix" },
			},
			format_on_save = save_config,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format(save_config)
		end)
	end,
}
