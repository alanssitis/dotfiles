return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-context" },
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"gleam",
				"go",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"python",
				"rust",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},

			-- Autoinstall languages that are not installed
			auto_install = false,
		},
		highlight = {
			enable = true,
			disable = function(_, buf)
				local max_filesize = 500 * 1024 -- 500 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
		-- keys = {
		-- 	{ "<leader>tc", ":TSContextToggle<CR>", desc = "[T]oggle [C]ontext" },
		-- },
	},
}
