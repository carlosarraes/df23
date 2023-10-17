return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		if vim.g.vscode then
			return
		end

		require("ibl").setup()
	end,
}
