return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			skip_confirm_for_simple_edits = true,
			keymaps = {
				["<C-s>"] = false,
			},
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name)
					return name == ".."
				end,
			},
			preview = {
				border = "single",
			},
		})

		vim.keymap.set("n", "-", require("oil").toggle_float)
	end,
}
