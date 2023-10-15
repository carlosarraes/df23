return {
	"akinsho/bufferline.nvim",
	config = function()
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
