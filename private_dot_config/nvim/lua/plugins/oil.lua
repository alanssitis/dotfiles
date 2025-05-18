return {
	{
		"stevearc/oil.nvim",
		dependencies = {
			"echasnovski/mini.icons",
		},
		lazy = false,
		opts = {
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["<C-k>"] = false,
				["<C-j>"] = false,
			},
		},
		keys = {
			{ "-", "<CMD>Oil<CR>", desc = "[-] Open parent directory" },
		},
	},
}
