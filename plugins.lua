local plugins = {
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require("dap")
  --     local dapui = require("dapui")
  --     dapui.setup()
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited["dapui_config"] = function()
  --       dapui.close()
  --     end
  --   end
  -- },
  {
    'shaunsingh/solarized.nvim'
  },
  {
    "sindrets/diffview.nvim",
    -- lazy = false,
    cmd="DiffviewOpen"
  },
  {'nvim-lua/popup.nvim'},
  {'RishabhRD/lspactions'},
  {
      'crusj/bookmarks.nvim',
      keys = {
          { "<tab><tab>", mode = { "n" } },
      },
      branch = 'main',
      dependencies = { 'nvim-web-devicons' },
      config = function()
          require("bookmarks").setup()
          require("telescope").load_extension("bookmarks")
      end
  },
  {
   'prabirshrestha/vim-lsp'
  },
  {
   "folke/trouble.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
      mode="document_diagnostics"
   },
  },
  {
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      require("dir-telescope").setup({
        -- these are the default options set
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end,
  },
  {
    "ibhagwan/fzf-lua",
    lazy = false,
    branch= "main",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },
  {
    "Pocco81/auto-save.nvim",
    lazy = false
  },
  {
    'stevearc/aerial.nvim',
    init = function()
      require('aerial').setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
        end
      })
    end,
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },
  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function(_, opts)
  --     require("core.utils").load_mappings("dap")
  --   end
  -- },
  -- {
  --   "mfussenegger/nvim-dap-python",
  --   ft = "python",
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --     "rcarriga/nvim-dap-ui",
  --   },
  --   config = function(_, opts)
  --     local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  --     require("dap-python").setup(path)
  --     require("core.utils").load_mappings("dap_python")
  --   end,
  -- },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   ft = {"python"},
  --   opts = function()
  --     return require "custom.configs.null-ls"
  --   end,
  -- },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
return plugins
