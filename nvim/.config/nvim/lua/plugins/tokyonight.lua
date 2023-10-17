return {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	opts = {},
	config = function()
		if vim.g.vscode then
			return
		end

		local tokyonight = require("tokyonight")

		tokyonight.setup({
			style = "night",
		})

		vim.cmd([[colorscheme tokyonight]])
	end,
}
