local bind = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
bind("n", "<C-s>", ":w<CR>", opts)
bind("n", "<C-z>", "u", opts)
bind("n", "<leader>nh", ":nohl<CR>", opts)

-- Increment/decrement numbers
bind("n", "=", "<C-i>", opts) -- increment
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
bind("n", ";t", ":TodoTelescope<CR>", opts) -- list all diagnostics
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

-- Yanky
bind({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
bind({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
bind({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
bind({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
bind("n", "<c-n>", "<Plug>(YankyCycleForward)")
bind("n", "<c-p>", "<Plug>(YankyCycleBackward)")

-- Debug
bind("n", "\\b", "<cmd>DapToggleBreakpoint<cr>", opts)
bind("n", "\\c", "<cmd>DapContinue<cr>", opts)
bind("n", "\\s", "<cmd>DapStepOver<cr>", opts)
bind("n", "\\f", "<cmd>DapStepInto<cr>", opts)
bind("n", "\\k", "<cmd>DapTerminate<cr>", opts)

-- CChat
bind("n", ";ct", ":CopilotChatToggle<cr>", opts)
bind({ "n", "v" }, ";cc", ":CopilotChat<cr>", opts)
bind({ "n", "v" }, ";co", ":CopilotChatOptimize<cr>", opts)
bind({ "n", "v" }, ";cp", ":CopilotChatTests<cr>", opts)
bind({ "n", "v" }, ";ce", ":CopilotChatExplain<cr>", opts)
bind({ "n", "v" }, ";cr", ":CopilotChatReview<cr>", opts)
bind({ "n", "v" }, ";cf", ":CopilotChatFix<cr>", opts)
bind({ "n", "v" }, ";cd", ":CopilotChatFixDiagnostic<cr>", opts)

-- FzfLua
bind("n", ";f", "<cmd>lua require('fzf-lua').files()<cr>", opts)
bind("n", ";e", "<cmd>lua require('fzf-lua').live_grep_glob()<cr>", opts)
bind("n", ";r", "<cmd>lua require('fzf-lua').live_grep_glob({ filter = \"rg -v '*tests/'\" })<cr>", opts)
bind("n", ";;", "<cmd>lua require('fzf-lua').resume()<cr>", opts)

-- Obsidian
bind("n", ";oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<cr>", opts)
bind("n", ";ot", ":ObsidianTemplate<CR>", opts)
bind("n", ";oo", ":ObsidianOpen<CR>", opts)
bind("n", ";on", ":ObsidianNew<CR>", opts)
bind("n", ";os", ":ObsidianSearch<CR>", opts)
bind("n", ";ol", ":ObsidianLinks<CR>", opts)
bind("n", ";oq", ":ObsidianQuickSwitch<CR>", opts)

-- Floaterm
bind("n", "<C-t>", ":FloatermToggle<CR>", opts)
bind("t", "<C-t>", "<C-\\><C-n>:FloatermToggle<CR>", opts)
