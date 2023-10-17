return {
	"nvim-lualine/lualine.nvim",
	config = function()
		if vim.g.vscode then
			return
		end

		require("lualine").setup({
			options = {
				theme = "tokyonight",
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
			},
		})
	end,
}
