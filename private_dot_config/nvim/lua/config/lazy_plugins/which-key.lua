return {
	{
		"folke/which-key.nvim",
		dependencies = {
			"echasnovski/mini.icons",
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		opts = { },
		-- config = function()
		-- 	require("which-key").add({
		-- 		{ "<leader>c", desc = "[c]ode" },
		-- 		{ "<leader>c_", hidden = true },
		-- 		{ "<leader>d", desc = "[d]ocument" },
		-- 		{ "<leader>d_", hidden = true },
		-- 		{ "<leader>h", desc = "Git [h]unk" },
		-- 		{ "<leader>h_", hidden = true },
		-- 		{ "<leader>r", desc = "[r]ename" },
		-- 		{ "<leader>r_", hidden = true },
		-- 		{ "<leader>s", desc = "[s]earch" },
		-- 		{ "<leader>s_", hidden = true },
		-- 		{ "<leader>t", desc = "[t]oggle" },
		-- 		{ "<leader>t_", hidden = true },
		-- 		{ "<leader>w", desc = "[w]orkspace" },
		-- 		{ "<leader>w_", hidden = true },
		-- 		{ "<leader>h", desc = "Git [h]unk", mode = "v" },
		-- 	})
		-- end,
	}
}
