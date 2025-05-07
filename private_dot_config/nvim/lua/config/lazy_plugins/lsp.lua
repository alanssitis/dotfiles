return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- LSP manager
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",

			{ "j-hui/fidget.nvim", opts = {} },

			{
				'folke/lazydev.nvim',
				ft = 'lua',
				opts = {
					library = {
						-- load luvit types when the `vim.uv` word is found
						{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
					},
				},
			},
		},
		config = function()
			local servers = {
				astro = true,
				bashls = true,
				clangd = true,
				gopls = true,
				lua_ls = true,
				pyright = true,
				rust_analyzer = true,
				tailwindcss = true,
			}

			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_enable = true,
				ensure_installed = servers,
			})
		end,
	},
}
