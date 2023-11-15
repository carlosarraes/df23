return {
	"lewis6991/gitsigns.nvim",
	config = function()
		if vim.g.vscode then
			return
		end

		local gitsigns = require("gitsigns")

		gitsigns.setup({
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end
				-- Actions
				map("n", ";b", function()
					gs.blame_line({ full = true })
				end)
				map("n", ";w", gs.toggle_current_line_blame)
				map("n", ";d", gs.diffthis)
				map("n", ";D", function()
					gs.diffthis("~")
				end)
				map("n", ";q", gs.toggle_deleted)
			end,
		})
	end,
}
