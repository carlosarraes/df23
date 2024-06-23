return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "carraes",
				path = "~/notes/carraes/",
			},
		},
		templates = {
			folder = "~/notes/carraes/99-Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},
	},
}
