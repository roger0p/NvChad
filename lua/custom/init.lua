local opt = vim.opt
local g = vim.g
vim.cmd [[ 
autocmd FileType python nnoremap <buffer> <leader>B :!python3 %<CR>
autocmd FileType javascript nnoremap <buffer> <leader>B :!node %<CR>
]]

opt.swapfile = false
opt.scrolloff = 10
opt.wrap = false
opt.cmdheight = 1
opt.numberwidth = 1
opt.cursorline = true
g.gruvbox_material_disable_italic_comment = 0
g.gruvbox_material_background = "dark"
g.gruvbox_material_better_performance = 1
g.catppuccin_flavour = "mocha"
g.tokyodark_transparent_background = true
g.tokyodark_enable_italic_comment = true
g.tokyodark_enable_italic = false
g.tokyodark_color_gamma = "1.0"
