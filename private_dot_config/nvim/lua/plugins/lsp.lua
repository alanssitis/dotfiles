return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"tamarin-prover/editors",

			-- LSP manager
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",

			{ "j-hui/fidget.nvim", opts = {} },

			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						-- load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local servers = {
				"astro",
				"bashls",
				"clangd",
				"gopls",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"tailwindcss",
			}

			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			})
			require("mason-lspconfig").setup({
				automatic_enable = true,
				ensure_installed = servers,
			})
		end,
	},
}
