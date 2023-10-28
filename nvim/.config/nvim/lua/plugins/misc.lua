return {
	"tpope/vim-surround",
	"tpope/vim-abolish",
	"tpope/vim-fugitive",
	{
		"tpope/vim-dadbod",
		dependencies = {
			"kristijanhusak/vim-dadbod-ui",
			"kristijanhusak/vim-dadbod-completion",
		},
	},
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{ "kdheepak/lazygit.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
}
