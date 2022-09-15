vim.g.theprimeagen_colorscheme = "tokyonight"

function ColorMyPencils()
  vim.g.gruvbox_contrast_dark = "hard"
  vim.g.tokyonight_transparent_sidebar = true
  vim.g.tokyonight_transparent = true
  vim.g.gruvbox_invert_selection = "0"
  vim.g.gruvbox_material_disable_italic_comment = 0
  vim.g.gruvbox_material_foreground = "material"
  vim.g.gruvbox_material_background = "dark"
  vim.g.gruvbox_material_better_performance = 1
  vim.g.catppuccin_flavour = "mocha"
  vim.g.tokyodark_transparent_background = true
  vim.g.tokyodark_enable_italic_comment = true
  vim.g.tokyodark_enable_italic = false
  vim.g.tokyodark_color_gamma = "1.0"

  vim.cmd("colorscheme " .. vim.g.theprimeagen_colorscheme)

  local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
  end

  hl("SignColumn", {
    bg = "none",
  })

  hl("ColorColumn", {
    ctermbg = 0,
    bg = "#555555",
  })

  hl("CursorLineNR", {
    bg = "None",
  })

  hl("Normal", {
    bg = "none",
  })

  hl("LineNr", {
    fg = "#5eacd3",
  })

  hl("netrwDir", {
    fg = "#5eacd3",
  })
end
ColorMyPencils()
