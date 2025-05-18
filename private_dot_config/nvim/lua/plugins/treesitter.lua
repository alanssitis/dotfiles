return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-context" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
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
				sync_install = false,
				auto_install = false,
				ignore_install = {},
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
				modules = {},
			})

			vim.keymap.set("n", "<leader>tc", "<CMD>:TSContextToggle<CR>", { desc = "[T]oggle [C]ontext" })
		end,
	},
}
