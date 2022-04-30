syntax enable
filetype plugin indent on
let g:tex_flavor = 'latex'

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lualine/lualine.nvim'
Plug 'sbdchd/neoformat'

Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'kyazdani42/nvim-web-devicons'

Plug 'evanleck/vim-svelte', {'branch': 'main'}

Plug 'neovim/nvim-lspconfig'
Plug 'rust-lang/rust.vim'

Plug 'edkolev/tmuxline.vim'
call plug#end()

lua << END
require'lspconfig'.ccls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.svelte.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.texlab.setup{}

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_diagnostic', 'coc'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END
set termguicolors
colorscheme onehalfdark
hi Normal guibg=NONE ctermbg=NONE
