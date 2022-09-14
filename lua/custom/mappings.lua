local M = {}

M.custom = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },

  n = {
    --General Mappings
    ["<leader>A"] = { "ggVG<CR>", "Select All", opts = { silent = true, noremap = true } },
    ["<C-q>"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },
    ["<C-n>"] = { ":NvimTreeToggle<CR>", opts = { silent = true, noremap = true } },
    ["f"] = { "<cmd>HopChar1CurrentLineAC<cr>", opts = { silent = true, noremap = true } },
    ["F"] = { "<cmd>HopChar1CurrentLineBC<cr>", opts = { silent = true, noremap = true } },
    ["<leader>q"] = { ":q<CR>", "Quit Neovim", opts = { silent = true, noremap = true } },
    ["<leader>e"] = { ":Telescope file_browser<CR>", "File Browser", opts = { silent = true, noremap = true } },
    ["<leader><leader>"] = { ":Telescope find_files<CR>", "Find Files", opts = { silent = true, noremap = true } },
    ["<leader>jf"] = { "<cmd>HopChar1<CR>", "1 Character Search", opts = { silent = true, noremap = true } },
    ["<leader>tp"] = { "<cmd>TSPlaygroundToggle<CR>", "Toggle TSPlayground", opts = { silent = true, noremap = true } },
    ["<leader>tb"] = { "<cmd>TroubleToggle<CR>", "Toggle Lsp-Troble", opts = { silent = true, noremap = true } },
    ["<leader>jt"] = { "<cmd>HopChar2<CR>", "2 Character Search", opts = { silent = true, noremap = true } },
    ["<leader>zf"] = { ":TZFocus<CR>", "Focus Mode", opts = { silent = true, noremap = true } },
    ["<leader>m"] = { ":TZMinimalist<CR>", "Zen Mode", opts = { silent = true, noremap = true } },
    [";"] = { ":", "enter cmdline", opts = { nowait = true } },

    --Toggleterm Mappings
    ["<leader>gg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Open Lazigit", opts = { noremap = true, silent = true } },
    ["<leader>gn"] = { "<cmd>lua _NODE_TOGGLE()<CR>", "Open Node", opts = { noremap = true, silent = true } },
    ["<leader>gd"] = { "<cmd>lua _NCDU_TOGGLE()<CR>", "Open storage analyzer", opts = { noremap = true, silent = true } },
    ["<leader>gb"] = { "<cmd>lua _BTOP_TOGGLE()<CR>", "Open Task Manager", opts = { noremap = true, silent = true } },
    ["<leader>gs"] = { "<cmd>lua _SPOTIFY_TOGGLE()<CR>", "Open Spotify", opts = { noremap = true, silent = true } },
    ["<leader>gp"] = { "<cmd>lua _PYTHON_TOGGLE()<CR>", "Open Python3", opts = { noremap = true, silent = true } },
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

M.disabled = {

  t = {
    -- toggle in terminal mode
    ["<A-h>"] = " ",
  },

  n = {
    ["<A-h>"] = " ",
  },
}
return M
