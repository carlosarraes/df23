return {
	"nvim-lualine/lualine.nvim",
	config = function()
		if vim.g.vscode then
			return
		end

		local navic = require("nvim-navic")

		require("lualine").setup({
			options = {
				theme = "tokyonight",
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_c = {
					{
						function()
							return navic.get_location()
						end,
						cond = function()
							return navic.is_available()
						end,
					},
				},
			},
		})
	end,
}
