local status, telescope = pcall(require, "telescope")
if not status then
  return
end
local actions = require "telescope.actions"

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = false,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function()
            vim.cmd "normal vbd"
          end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd "startinsert"
          end,
        },
      },
    },
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

telescope.load_extension "file_browser"
telescope.load_extension "harpoon"
telescope.load_extension "fzf_native"
