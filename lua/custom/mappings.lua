local M = {}
M.general = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },

  n = {
    ["<leader>A"] = { "ggVG<CR>", opts = { silent = true }  },
    ["<C-q>"] = { ":q<CR>", opts = { silent = true }  },
    ["<C-n>"] = { ":Neotree focus<CR>", opts = { silent = true } },
    ["<leader>e"] = { ":Neotree toggle<CR>", opts = { silent = true }  },
    ["f"] = { "<cmd>HopChar1CurrentLineAC<cr>", opts = { silent = true }  },
    ["F"] = { "<cmd>HopChar1CurrentLineBC<cr>", opts = { silent = true }  },
    ["<leader>zf"] = { ":TZFocus<CR>", opts = { silent = true } },
    ["<leader>m"] = { ":TZMinimalist<CR>", opts = { silent = true } },
  },

  v = {},
  x = {},
}

return M
