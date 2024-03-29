local bind = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
bind("n", "<C-s>", ":w<CR>", opts)
bind("n", "<C-z>", "u", opts)
bind("n", "<leader>nh", ":nohl<CR>", opts)

-- Increment/decrement numbers
bind("n", "=", "<C-a>", opts) -- increment
bind("n", "-", "<C-x>", opts) -- decrement

-- Window management
bind("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
bind("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
bind("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
bind("n", "<leader>sx", ":close<CR>", opts) -- close current split window

-- Buffer management
bind("n", "<tab>", ":bnext<CR>", opts) -- next buffer
bind("n", "<s-tab>", ":bprev<CR>", opts) -- previous buffer
bind("n", "<leader>x", ":bdelete<CR>", opts)

-- Tabs
bind("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
bind("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab

-- QoL
bind("n", "<leader>q", ":q<CR>", opts)
bind("n", "<leader>Q", ":qa!<CR>", opts)
bind("v", "J", ":m '>+1<CR>gv=gv", opts)
bind("v", "K", ":m '<-2<CR>gv=gv", opts)
bind("n", "J", "mzgJ`z", opts)
bind("n", "<C-d>", "<C-d>zz", opts)
bind("n", "<C-u>", "<C-u>zz", opts)
bind("n", "<C-Down>", "<C-d>zz", opts)
bind("n", "<C-Up>", "<C-u>zz", opts)
bind("n", "n", "nzzzv", opts)
bind("n", "N", "Nzzzv", opts)
bind("i", "<C-q>", "<C-o>zz", opts)
bind("n", "<leader>p", "cw<C-r>0<ESC>b", opts)
bind("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts) -- replace word under cursor
bind("v", "<leader>/", "<esc>/\\%V", opts) -- search within selection
bind("i", "<A-l>", "<Right>", opts)
bind("i", "<A-h>", "<Left>", opts)
bind("i", "<A-j>", "<Down>", opts)
bind("i", "<A-k>", "<Up>", opts)
bind("n", "<C-a>", "ggVGo", opts)
bind("n", "<Return>", "o<ESC>k", opts)
bind("n", "<leader>5", ":UndotreeToggle<CR>", opts)

----------------------
-- Plugin Keybinds
----------------------

-- Lazy
bind("n", "<leader>l", ":Lazy<CR>", opts)

-- Clipboard/Yanks
bind("v", "<leader>y", '"+y', opts) -- Needs xclip (Arch)
bind("n", "<leader>y", '"+y', opts)
bind("v", "<leader>d", '"_d', opts)
bind("n", "<leader>d", '"_d', opts)
bind("n", "x", '"_x', opts)

-- Telescope
bind("n", ";f", "<cmd>Telescope find_files<cr>", opts) -- find files within current working directory, respects .gitignore
bind("n", ";r", "<cmd>Telescope live_grep<cr>", opts) -- find string in current working directory as you type
bind("n", ";;", "<cmd>Telescope resume<cr>", opts)
bind("n", ";d", "<cmd>Telescope diagnostics<cr>", opts) -- list all diagnostics
bind("n", ";t", ":TodoTelescope<CR>", opts) -- list all diagnostics
bind("n", ";z", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, opts) -- find string in current buffer
bind("n", "<leader>fP", function()
	require("telescope.builtin").find_files({
		cwd = require("lazy.core.config").options.root,
	})
end, opts) -- find string in current buffer
bind("n", ";b", function()
	local builtin = require("telescope.builtin")
	builtin.buffers()
end, opts) -- find string in current buffer
bind("n", ";e", function()
	local telescope = require("telescope")

	local function telescope_buffer_dir()
		return vim.fn.expand("%:p:h")
	end

	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end, opts) -- find string in current buffer
bind("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts) -- find string under cursor in current working directory
bind("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts) -- list open buffers in current neovim instance
bind("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) -- list available help tags
bind("n", "<leader>fm", "<cmd>Telescope marks<cr>", opts) -- list all marks
bind("n", "<leader>ft", "<cmd>Telescope tags<cr>", opts) -- list all tags
bind("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts) -- list recently opened files
bind("n", "<leader>dC", "<cmd>Telescope command_history<cr>", opts) -- list all commands
bind("n", "<leader>dk", "<cmd>Telescope keymaps<cr>", opts) -- list all keymaps
bind("n", "<leader>dv", "<cmd>Telescope vim_options<cr>", opts) -- list all vim options
bind("n", "<leader>yw", "<cmd>Telescope yank_history<cr>", opts) -- list all yanks
bind("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
bind("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", opts) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
bind("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts) -- list git branches (use <cr> to checkout) ["gb" for git branch]
bind("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts) -- list current changes per file with diff preview ["gs" for git status]

-- Dadbod
bind("n", "<leader>du", "<cmd>DBUIToggle<cr>", opts) -- open dadbod ui
bind("n", "<leader>df", "<cmd>DBUIFindBuffer<cr>", opts)
bind("n", "<leader>dq", "<cmd>DBUILastQueryInfo<cr>", opts)

-- Git - dv in fugitive
bind("n", "<leader>gd", "<cmd>Gvdiffsplit<cr>", opts)
bind("n", "gu", "<cmd>diffget //2<cr>", opts) -- get the upper version of a diff
bind("n", "gh", "<cmd>diffget //3<cr>", opts) -- get the lower version of a diff

-- lazygit
bind("n", "<leader>gg", ":LazyGit<CR>", opts)
bind("n", "<leader>gf", ":LazyGitFilter<CR>", opts)

-- Yanky
bind({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
bind({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
bind({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
bind({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
bind("n", "<c-n>", "<Plug>(YankyCycleForward)")
bind("n", "<c-p>", "<Plug>(YankyCycleBackward)")

-- Assistant
bind("n", ";c", "<cmd>ChatGPT<CR>", opts)
bind({ "n", "v" }, ";v", "<cmd>ChatGPTEditWithInstruction<CR>", opts)
bind({ "n", "v" }, ";ar", "<cmd>ChatGPTRun code_readability_analysis_4<CR>", opts)
bind({ "n", "v" }, ";ae", "<cmd>ChatGPTRun explain_code_4<CR>", opts)
