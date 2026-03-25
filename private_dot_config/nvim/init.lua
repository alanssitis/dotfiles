-- Alan's config

----------
-- SETS --
----------

-- set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set only if nerd font is used
vim.g.have_nerd_font = true

-- show line and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- shown in
-- vim.opt.showmode = false

-- separate concerns between nvim and system
vim.opt.clipboard = "unnamedplus"

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- enable sign column
vim.opt.signcolumn = "yes:1"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

-- split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- enable showing substitutions
vim.opt.inccommand = "split"

-- show line cursor is on
vim.opt.cursorline = true

-- line to keep above and below cursor
vim.opt.scrolloff = 5

-- highlight on search
vim.opt.hlsearch = true

vim.opt.colorcolumn = "79"

--------------
-- KEYREMAP --
--------------

-- clear highlighting on search in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.get_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.get_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- simpler split navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-------------
-- AUTOCMD --
-------------

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-------------
-- PLUGINS --
-------------

local hooks = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	if name == "treesitter" and (kind == "install" or kind == "update") then
		-- Append `:wait()` if you need synchronous execution
		vim.cmd("TSUpdate")
	end
	if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
		-- Append `:wait()` if you need synchronous execution
		vim.system({ "make" }, { cwd = ev.data.path })
	end
end
vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

-- COLORSCHEME --
vim.pack.add({ {
	src = "https://github.com/catppuccin/nvim",
	name = "catppuccin",
} })
require("catppuccin").setup({
	flavour = "macchiato",
	transparent_background = true,
	float = {
		transparent = false,
		solid = false,
	},
})
vim.cmd.colorscheme("catppuccin-macchiato")

-- MINI --
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
-- text editing
require("mini.ai").setup({})
require("mini.completion").setup({})
require("mini.operators").setup({})
require("mini.pairs").setup({})
require("mini.snippets").setup({})
require("mini.surround").setup({})
-- general workflow
require("mini.bracketed").setup({})
-- appearance
require("mini.icons").setup({})
require("mini.statusline").setup({
	use_icons = vim.g.have_nerd_font,
})

-- TREESITTER --
vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
})
require("nvim-treesitter").setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
	},
})
vim.keymap.set("n", "<leader>tc", "<CMD>:TSContext toggle<CR>", { desc = "[T]oggle [C]ontext" })

-- LSP --
vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

require("fidget").setup({
	notification = {
		override_vim_notify = true,
	},
})

require("mason").setup({})
require("mason-lspconfig").setup({
	automatic_enable = true,
})

-- keymaps
vim.keymap.set("n", "<leader>lh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
	{ desc = "toggle [l]sp inlay [h]ints" })

-- FORMAT --
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
local conform = require("conform")
conform.setup({
	notify_on_error = true,
	format_on_save = function(bufnr)
		local disable_filetypes = { c = true, cpp = true }
		return {
			timeout_ms = 500,
			lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		}
	end,
})
vim.keymap.set("n", "<leader>f", function()
	conform.format({ async = true, lsp_fallback = true })
end, { desc = "[F]ormat buffer" })

-- TELESCOPE --
vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/kkharji/sqlite.lua",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-telescope/telescope-smart-history.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
})

-- telescope extensions
require("telescope").load_extension("fzf")
require("telescope").load_extension("smart_history")
require("telescope").load_extension("ui-select")

-- keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sp", builtin.git_files, { desc = "[S]earch (git) [P]roject files" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find({
		prompt_title = "Search in Current Buffer",
	})
end, { desc = "[/] Fuzzily search in current buffer" })
vim.keymap.set("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

-- OIL --
vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup({
	keymaps = {
		["<C-h>"] = false,
		["<C-l>"] = false,
		["<C-k>"] = false,
		["<C-j>"] = false,
	},
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "[-] Open parent directory" })

-- OTHER PLUGINS --
vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/folke/which-key.nvim",
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim", name = "ibl" },
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/tamarin-prover/editors",
})
require("todo-comments").setup({})
require("which-key").setup({})
require("ibl").setup({})
require("gitsigns").setup({})

-- AUTOMATICALLY UPDATE EVERY DAY ON FIRST OPEN --
local function update_on_first_daily_open()
	local data_dir = vim.fn.stdpath("data")
	local timestamp_file = data_dir .. "/last-update-date.txt"

	local current_date = os.date("%Y-%m-%d")
	local last_run_date = ""
	local f = io.open(timestamp_file, "r")
	if f then
		last_run_date = f:read("*l") or ""
		f:close()
	end

	if current_date ~= last_run_date then
		vim.pack.update(nil, { force = true })

		local fw = io.open(timestamp_file, "w")
		if fw then
			fw:write(current_date)
			fw:close()
		else
			vim.notify("Warning: Could not write to daily timestamp file.", vim.log.levels.WARN)
		end
	end
end
update_on_first_daily_open()
