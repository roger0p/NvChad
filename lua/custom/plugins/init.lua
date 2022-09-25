local overrides = require "custom.plugins.overrides"
-- custom/plugins/init.lua
return {

  --NvChad Ui Changes
  ["NvChad/ui"] = {
    override_options = {
      statusline = {
        separator_style = "round", --default/round/block/arrow
        -- separator_style = {
        --   left = " ",
        --   right = "",
        -- },
      },
    },
  },

  -- Override plugin options
  ["goolord/alpha-nvim"] = {
    after = "base46",
    disable = false,
    config = function()
      require "custom.plugins.alpha"
    end,
  },

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },
  --
  -- override plugin configs
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

  ["nvchad/nvim-colorizer.lua"] = {
    override_options = overrides.colorizer,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = overrides.blankline,
  },
  -- Add another configuration to plugins without changing NvChad's Default
  --[[ In this case I just wanted to add telescope-file-browser to telescope 
       config without changing the default so, updating NvChad doesn't reset telescope config ]]
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- Install plugin
  ["dsznajder/vscode-es7-javascript-react-snippets"] = {
    run = "yarn install --frozen-lockfile && yarn compile",
  },

  ["nvim-treesitter/playground"] = {
    config = function()
      require("nvim-treesitter.configs").setup {
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      }
    end,
  },

  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    config = function()
      local saga = require "lspsaga"

      saga.init_lsp_saga {
        -- your configuration
      }
    end,
  },

  ["Pocco81/TrueZen.nvim"] = {},

  -- load it after nvim-lspconfig cuz we lazy loaded lspconfig
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["akinsho/toggleterm.nvim"] = {
    tag = "*",
    config = function()
      require "custom.plugins.toggleterm"
    end,
  },

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
  ["windwp/nvim-ts-autotag"] = {
    config = function()
      require("nvim-ts-autotag").setup()
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
  ["p00f/nvim-ts-rainbow"] = {},
  ["tpope/vim-repeat"] = {},
  ["tpope/vim-surround"] = {},
}
