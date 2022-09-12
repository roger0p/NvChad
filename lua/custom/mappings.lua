local M = {}

local opts = "opts = { silent = true, noremap = true }"
M.custom = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },

  n = {
    ["<leader>A"] = { "ggVG<CR>", "Select All", opts },
    ["<C-q>"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },
    ["<C-n>"] = { ":NvimTreeToggle<CR>", opts },
    ["<leader>q"] = { ":q<CR>","Quit Neovim", opts },
    ["<leader>e"] = { ":Telescope file_browser<CR>", "File Browser", opts },
    ["f"] = { "<cmd>HopChar1CurrentLineAC<cr>", opts },
    ["F"] = { "<cmd>HopChar1CurrentLineBC<cr>", opts },
    ["<leader>jf"] = { "<cmd>HopChar1<CR>", "1 Character Search", opts },
    ["<leader>jt"] = { "<cmd>HopChar2<CR>", "2 Character Search", opts },
    ["<leader>zf"] = { ":TZFocus<CR>", "Focus Mode", opts },
    ["<leader>m"] = { ":TZMinimalist<CR>", "Zen Mode", opts },
    [";"] = { ":", "enter cmdline", opts = { nowait = true } },
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
      "Replace true/false",
    },
  },

  v = {},
  x = {},
}
-- keymap("n", "<leader>rr", default_opts)

return M
