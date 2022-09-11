local M = {}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },

  n = {
    ["<leader>A"] = { "ggVG<CR>", opts = { silent = true } },
    ["<C-q>"] = { ":q<CR>", opts = { silent = true } },
    ["<C-n>"] = { ":NvimTreeToggle<CR>", opts = { silent = true } },
    ["<leader>e"] = { ":Telescope file_browser<CR>", opts = { silent = true } },
    ["f"] = { "<cmd>HopChar1CurrentLineAC<cr>", opts = { silent = true } },
    ["F"] = { "<cmd>HopChar1CurrentLineBC<cr>", opts = { silent = true } },
    ["<leader>zf"] = { ":TZFocus<CR>", opts = { silent = true } },
    ["<leader>m"] = { ":TZMinimalist<CR>", opts = { silent = true } },
    -----------------------------------------------------------------
    -- SUPERCOOL MAPPING THAT SWAPS TRUE WITH FALSE AND VICE-VERSA --
    -----------------------------------------------------------------
    ["<leader>rr"] = {
      function()
        local swapBoolean = function()
          local c = vim.api.nvim_get_current_line()
          local subs = c:match "true" and c:gsub("true", "false") or c:gsub("false", "true")
          vim.api.nvim_set_current_line(subs)
        end
        swapBoolean()
      end,
    },
  },

  v = {},
  x = {},
}
-- keymap("n", "<leader>rr", default_opts)

return M
