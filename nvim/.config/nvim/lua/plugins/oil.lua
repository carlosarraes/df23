return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>")
		vim.keymap.set("n", ";e", require("oil").toggle_float)
	end,
}
