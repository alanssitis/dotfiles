require("monokai-pro").setup({
  transparent_background = false
})

vim.cmd.colorscheme("monokai-pro")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
