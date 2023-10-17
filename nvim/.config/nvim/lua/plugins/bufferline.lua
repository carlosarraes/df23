return {
	"akinsho/bufferline.nvim",
	config = function()
		if vim.g.vscode then
			return
		end

		local bufferline = require("bufferline")

		bufferline.setup({}, {
			hightlights = {
				fill = {
					fg = { attribute = "fg", highlight = "TabLine" },
					bg = { attribute = "bg", highlight = "TabLine" },
				},
			},
		})
	end,
}
