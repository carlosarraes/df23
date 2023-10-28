return {
	"fredeeb/tardis.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("tardis-nvim").setup({
			keymap = {
				next = "<C-j>",
				prev = "<C-k>",
				quit = "q",
				commit_message = "m",
			},
			commits = 32,
		})
	end,
}
