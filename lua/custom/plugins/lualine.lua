-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  bg="#232232",
  fg="#cdd6f4",
  none="",
  cyan="#89dceb",
  black="#181825",
  gray="#45475a",
  magenta="#cba6f7",
  pink="#f5c2e7",
  red="#f38ba8",
  green="#a6e3a1",
  yellow="#f9e2af",
  blue="#89b4fa",
  orange="#fab387",
  black4="#585b70",
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.bg, bg = colors.blue },
    b = { fg = colors.fg, bg = colors.gray },
    c = { fg = colors.fg, bg = colors.none },
  },

  insert = { a = { fg = colors.black, bg = colors.red } },
  visual = { a = { fg = colors.black, bg = colors.green } },
  replace = { a = { fg = colors.black, bg = colors.orange } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require("lualine").setup {
  options = {
    theme = bubbles_theme,
    component_separators = " ",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      { "mode", separator = { right = "" } },
    },
    lualine_b = { "filename" },
    lualine_c = { "branch", "diff" },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = {
      { "location", separator = { right = "" }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = {},
}
