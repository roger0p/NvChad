-- Chadrc

local M = {}

M.ui = {
  theme = "tokyodark", -- default theme
  transparency = false,
}

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

return M

