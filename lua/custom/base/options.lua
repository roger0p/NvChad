-------------------
-- O P T I O N S --
-------------------

local o = vim.opt
local g = vim.g

o.swapfile = false
o.scrolloff = 8
o.wrap = false
o.cmdheight = 1
-- o.laststatus = 1
o.numberwidth = 1
o.cursorline = true
o.list = true
o.listchars:append "eol:↲"
o.listchars:append "tab:<->"
-- o.listchars:append "tab:>-,trail:-,eol:<,nbsp:%"
o.lcs:append "extends:>,precedes:<"

g.gruvbox_material_disable_italic_comment = 0
g.gruvbox_material_foreground = "material"
g.gruvbox_material_background = "dark"
g.gruvbox_material_better_performance = 1
g.catppuccin_flavour = "mocha"
g.tokyodark_transparent_background = true
g.tokyodark_enable_italic_comment = true
g.tokyodark_enable_italic = false
g.tokyodark_color_gamma = "1.0"
require("lualine").setup()
