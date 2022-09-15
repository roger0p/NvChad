-- Chadrc

local M = {}

M.ui = {
  theme_toggle = { "catppuccin", "tokyodark" },
  theme = "catppuccin", -- default theme
  transparency = false,
  hl_override = require "custom.highlights",
  -- changed_themes = {
  --   catppuccin = {
  --     base_16 = {
  --       base00 = "",
  --     },
  --     -- base_30 = {
  --     --   red = "#mycol",
  --     --   white = "#mycol",
  --     -- },
  --   },
  --
  --   nord = {
  --     -- and so on!
  --   },
  -- },
}

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

return M
