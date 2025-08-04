return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				transparent_background = true,
				float = {
					transparent = false,
					solid = false,
				},
			})

			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
}
