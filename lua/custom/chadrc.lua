-- Chadrc

local M = {}

M.ui = {
  theme_toggle = {"catppuccin", "tokyodark"},
  theme = "catppuccin", -- default theme
  transparency = false,
  hl_override = require("custom.highlights")
}

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

return M

