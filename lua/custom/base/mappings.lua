local M = {}

M.custom = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
    ["<C-o>"] = {
      function()
        local ls = require "luasnip"
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end,
      opts = { silent = true, noremap = true },
    },
    ["<S-Tab>"] = {
      function()
        require("luasnip").jump(-1)
      end,
      opts = { silent = true, noremap = true },
    },
  },

  s = {
    ["<C-o>"] = {
      function()
        local ls = require "luasnip"
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end,
      opts = { silent = true, noremap = true },
    },
  },

  n = {
    --General Mappingscmd
    ["x"] = { '"_x', "'x' doesnt copy", opts = {silent = true, noremap =true} },
    ["<M-Up>"] = { "<CMD>m -2<CR>", "Move Line Up", opts = { noremap = true } },
    ["<M-Down>"] = { "<CMD>m +1<CR>", "Move Line Down", opts = { noremap = true } },
    ["<leader>A"] = { "ggVG<CR>", "Select All", opts = { silent = true, noremap = true } },
    ["<C-q>"] = { "<CMD>TroubleToggle<CR>", "Toggle Lsp-Troble", opts = { silent = true, noremap = true } },
    ["<C-n>"] = { "<CMD>NvimTreeToggle<CR>", opts = { silent = true, noremap = true } },
    ["<leader>q"] = { "<CMD>q<CR>", "Quit Neovim", opts = { silent = true, noremap = true } },
    ["<leader>e"] = { "<CMD>Telescope file_browser<CR>", "File Browser", opts = { silent = true, noremap = true } },
    ["<leader><leader>"] = { "<CMD>Telescope find_files<CR>", "Find Files", opts = { silent = true, noremap = true } },
    ["<leader>zf"] = { "<CMD>TZFocus<CR>", "Focus Mode", opts = { silent = true, noremap = true } },
    ["<leader>m"] = { "<CMD>TZMinimalist<CR>", "Zen Mode", opts = { silent = true, noremap = true } },
    ["<leader>gf"] = { "<CMD>HopChar1<CR>", "1 Character Search", opts = { silent = true, noremap = true } },
    ["<leader>gt"] = { "<CMD>HopChar2<CR>", "2 Character Search", opts = { silent = true, noremap = true } },

    --Toggleterm Mappings
    ["<leader>tg"] = { "<CMD>lua _LAZYGIT_TOGGLE()<CR>", "Open Lazigit", opts = { noremap = true, silent = true } },
    ["<leader>tn"] = { "<CMD>lua _NODE_TOGGLE()<CR>", "Open Node", opts = { noremap = true, silent = true } },
    ["<leader>td"] = {
      "<CMD>lua _NCDU_TOGGLE()<CR>",
      "Open storage analyzer",
      opts = { noremap = true, silent = true },
    },
    ["<leader>tb"] = { "<CMD>lua _BTOP_TOGGLE()<CR>", "Open Task Manager", opts = { noremap = true, silent = true } },
    ["<leader>ts"] = { "<CMD>lua _SPOTIFY_TOGGLE()<CR>", "Open Spotify", opts = { noremap = true, silent = true } },
    ["<leader>tp"] = { "<CMD>lua _PYTHON_TOGGLE()<CR>", "Open Python3", opts = { noremap = true, silent = true } },
    -----------------------------------------------------------------
    -- SUPERCOOL MAPPING THAT SWAPS TRUE WITH FALSE AND VICE-VERSA --
    -----------------------------------------------------------------
    ["<leader>R"] = {
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

  i = {},

  t = {
    -- toggle in terminal mode
    ["<A-h>"] = "",
    ["o"] = "",
    ["O"] = "",
    -- ["-"] = "",
    -- ["+"] = "",
  },

  n = {
    ["<A-h>"] = "",
    ["<leader>pt"] = "",
  },
}
return M
