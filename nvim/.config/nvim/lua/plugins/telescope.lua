return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-tree/nvim-web-devicons",
		"gbprod/yanky.nvim",
	},
	config = function(_, opts)
		if vim.g.vscode then
			return
		end

		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local yanky = require("yanky")
		local fb_actions = telescope.extensions.file_browser.actions
		local utils = require("yanky.utils")
		local mapping = require("yanky.telescope.mapping")

		opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
			wrap_results = true,
			layout_strategy = "horizontal",
			layout_config = { prompt_position = "top" },
			sorting_strategy = "ascending",
			winblend = 0,
			grouped = true,
			mappings = {
				i = {
					["<C-p>"] = actions.move_selection_previous,
					["<C-n>"] = actions.move_selection_next,
					["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				},
			},
		})
		opts.extensions = {
			file_browser = {
				theme = "dropdown",
				hijack_netrw = true,
				mappings = {
					["i"] = {
						["A"] = fb_actions.create,
						["D"] = fb_actions.remove,
						["Y"] = fb_actions.copy,
						["M"] = fb_actions.move,
						["R"] = fb_actions.rename,
						["."] = fb_actions.toggle_hidden,
						["<C-d>"] = fb_actions.goto_parent_dir,
						["<C-p>"] = actions.move_selection_previous,
						["<C-n>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		}
		opts.pickers = {
			diagnostics = {
				theme = "ivy",
				initial_mode = "normal",
				layout_config = {
					preview_cutoff = 9999,
				},
			},
		}

		telescope.setup({})

		telescope.load_extension("fzf")
		telescope.load_extension("yank_history")
		telescope.load_extension("file_browser")

		yanky.setup({
			picker = {
				telescope = {
					mappings = {
						default = mapping.put("p"),
						i = {
							["<c-p>"] = mapping.put("p"),
							["<c-k>"] = mapping.put("P"),
							["<c-x>"] = mapping.delete(),
							["<c-r>"] = mapping.set_register(utils.get_default_register()),
						},
						n = {
							p = mapping.put("p"),
							P = mapping.put("P"),
							d = mapping.delete(),
							r = mapping.set_register(utils.get_default_register()),
						},
					},
				},
			},
		})
	end,
}
