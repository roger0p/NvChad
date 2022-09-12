local overrides = require "custom.plugins.overrides"
-- custom/plugins/init.lua
return {

  --NvChad Ui Changes
  ["NvChad/ui"] = {
    override_options = {
      statusline = {
        separator_style = "default",
        -- separator_style = {
        --   left = " ",
        --   right = "",
        -- },
      },
    },
  },

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- ["nvim-telescope/telescope.nvim"] = {
  --   override_options = overrides.telescope,
  -- },
  --
  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    -- disable = true,
    override_options = overrides.nvimtree,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- Install plugin
  ["Pocco81/TrueZen.nvim"] = {},
  ["folke/which-key.nvim"] = {
    disable = false,
  },

  -- Override plugin definition options
  ["goolord/alpha-nvim"] = {
    disable = false,
    cmd = "Alpha",
    config = function()
      require "plugins.configs.alpha"
    end,
  },

  -- load it after nvim-lspconfig cuz we lazy loaded lspconfig
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["nvim-telescope/telescope-file-browser.nvim"] = {},
  ["sam4llis/nvim-tundra"] = {},
  ["folke/tokyonight.nvim"] = {},
  ["catppuccin/nvim"] = { module = "catppuccin" },
  ["Everblush/everblush.nvim"] = {},
  ["michaeldyrynda/carbon.vim"] = {},
  ["tiagovla/tokyodark.nvim"] = {},
  ["rebelot/kanagawa.nvim"] = {},
  ["ellisonleao/gruvbox.nvim"] = {},
  ["sainnhe/gruvbox-material"] = {},
  ["sainnhe/everforest"] = {},
  ["folke/trouble.nvim"] = { cmd = "TroubleToggle" },
  ["windwp/nvim-ts-autotag"] = {
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  ["p00f/nvim-ts-rainbow"] = {},
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-surround"] = {},
  ["phaazon/hop.nvim"] = {
    branch = "v2", -- optional but strongly recommended
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },
  ["karb94/neoscroll.nvim"] = {
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      }
    end,
  },
  ["nvim-neo-tree/neo-tree.nvim"] = {
    branch = "v2.x",
    module = "neo-tree",
    cmd = "Neotree",
    requires = { { "MunifTanjim/nui.nvim", module = "nui" } },
    setup = function()
      vim.g.neo_tree_remove_legacy_commands = true
    end,
    config = function()
      require "custom.plugins.neo-tree"
    end,
  },
}
