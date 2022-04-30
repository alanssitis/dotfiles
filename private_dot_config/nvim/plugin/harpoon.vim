nnoremap <leader>a <cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>u <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>tc <cmd>lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <C-j> <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <C-k> <cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <C-l> <cmd>lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <C-h> <cmd>lua require("harpoon.ui").nav_file(4)<CR>

