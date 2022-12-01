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
    ["x"] = { '"_x', "'x' doesnt copy", opts = { silent = true, noremap = true } },
    ["<leader>y"] = { '"+y', "'x' doesnt copy", opts = { silent = true, noremap = true } },
    ["<leader>d"] = { '"_d', "Delete without copy", opts = { silent = true, noremap = true } },
    ["<leader>Y"] = { '"+Y', "'x' doesnt copy", opts = { silent = true, noremap = true } },
    ["<M-Up>"] = { "<CMD>m -2<CR>", "Move Line Up", opts = { noremap = true } },
    ["<M-Down>"] = { "<CMD>m +1<CR>", "Move Line Down", opts = { noremap = true } },
    ["<leader>A"] = { "ggVG<CR>", "Select All", opts = { silent = true, noremap = true } },
    ["<C-q>"] = { "<CMD>TroubleToggle<CR>", "Toggle Lsp-Troble", opts = { silent = true, noremap = true } },
    ["<C-n>"] = { "<CMD>Neotree<CR>", opts = { silent = true, noremap = true } },
    ["<leader>q"] = { "<CMD>q<CR>", "Quit Neovim", opts = { silent = true, noremap = true } },
    ["<leader>e"] = { "<CMD>Telescope file_browser<CR>", "File Browser", opts = { silent = true, noremap = true } },
    ["<leader><leader>"] = { "<CMD>Telescope find_files<CR>", "Find Files", opts = { silent = true, noremap = true } },
    ["<leader>zf"] = { "<CMD>TZFocus<CR>", "Focus Mode", opts = { silent = true, noremap = true } },
    ["<leader>m"] = { "<CMD>TZMinimalist<CR>", "Zen Mode", opts = { silent = true, noremap = true } },
    ["<leader>gf"] = { "<CMD>HopChar1<CR>", "1 Character Search", opts = { silent = true, noremap = true } },
    ["<leader>gt"] = { "<CMD>HopChar2<CR>", "2 Character Search", opts = { silent = true, noremap = true } },
    ["<leader>tg"] = { "<CMD>lua _LAZYGIT_TOGGLE()<CR>", "Open Lazigit", opts = { noremap = true, silent = true } },
    ["<leader>tn"] = { "<CMD>lua _NODE_TOGGLE()<CR>", "Open Node", opts = { noremap = true, silent = true } },

    ["<leader>td"] = {
      "<CMD>lua _NCDU_TOGGLE()<CR>",
      "Open storage analyzer",
      opts = { noremap = true, silent = true },
    },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },
    ["<leader>h"] = { "<CMD>split<CR>", "new horizontal split", opts = { noremap = true, silent = true } },
    ["<leader>v"] = { "<CMD>vsplit<CR>", "new vertical split", opts = { noremap = true, silent = true } },
    ["<C-h>"] = { "<CMD>vertical resize +5<CR>", "resize vertical split", opts = { noremap = true, silent = true } },
    ["<C-l>"] = { "<CMD>vertical resize -5<CR>", "resize vertical split", opts = { noremap = true, silent = true } },
    ["<C-k>"] = { "<CMD>resize +5<CR>", "resize horizontal split", opts = { noremap = true, silent = true } },
    ["<C-j>"] = { "<CMD>resize -5<CR>", "resize horizontal split", opts = { noremap = true, silent = true } },
    ["<leader>tb"] = { "<CMD>lua _BTOP_TOGGLE()<CR>", "Open Task Manager", opts = { noremap = true, silent = true } },
    ["<leader>ts"] = { "<CMD>lua _SPOTIFY_TOGGLE()<CR>", "Open Spotify", opts = { noremap = true, silent = true } },
    ["<leader>tp"] = { "<CMD>lua _PYTHON_TOGGLE()<CR>", "Open Python3", opts = { noremap = true, silent = true } },
    ["<leader>ca"] = { "<CMD>Lspsaga code_action<CR>", "lsp code_action", opts = { noremap = true, silent = true } },
    ["gr"] = { "<CMD>Lspsaga lsp_finder<CR>", "lsp references", opts = { noremap = true, silent = true } },
    ["<leader>f"] = {
      "<CMD>Lspsaga show_line_diagnostics<CR>",
      "Show Information",
      opts = { noremap = true, silent = true },
    },

    --Harpoon Mappings
    ["<leader>P"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
    },
    ["za"] = {
      function()
        require("harpoon.mark").add_file()
      end,
    },
    ["zn"] = {
      function()
        require("harpoon.ui").nav_next()
      end,
    },
    ["zp"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
    },

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

  v = {
    ["<leader>y"] = { '"+y', "Yank without registring to clipboard", opts = { silent = true, noremap = true } },
    ["<leader>d"] = { '"_d', "Delete without copy", opts = { silent = true, noremap = true } },
  },
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
