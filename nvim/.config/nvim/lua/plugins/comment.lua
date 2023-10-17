return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		if vim.g.vscode then
			return
		end

		require("Comment").setup()
	end,
}
