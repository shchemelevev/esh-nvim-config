local function restore_tabs()

    local buf_right = vim.cmd("echo bufnr('%')")
          local api = require('nvim-tree.api')
          local view = require('nvim-tree.view')

          if view.is_visible() then
            api.tree.close()
          end
    vim.t.bufs = vim.api.nvim_list_bufs()
            api.tree.open()
            vim.cmd("buffer " .. buf_right)
end

local function close_neotree()
   local api = require('nvim-tree.api')
   local view = require('nvim-tree.view')

   if view.is_visible() then
     api.tree.close()
   end
end

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
  -- { 'echasnovski/mini.nvim',
  --   version = false ,
  --   lazy = false,
  --   init = function()
  --     require('mini.sessions').setup({
  --       -- Whether to read latest session if Neovim opened without file arguments
  --       autoread = false,
  --       -- Whether to write current session before quitting Neovim
  --       autowrite = false,
  --       -- Directory where global sessions are stored (use `''` to disable)
  --       directory =  '~/.vim/sessions', --<"session" subdir of user data directory from |stdpath()|>,
  --       -- File for local session (use `''` to disable)
  --       file = '' -- 'Session.vim',
  --     })
  --     local header_art =
  --     [[
  --      ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
  --      │││├┤ │ │╰┐┌╯││││
  --      ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
  --     ]]
  --     local starter = require('mini.starter')
  --     starter.setup({
  --       -- evaluate_single = true,
  --       items = {
  --         starter.sections.sessions(77, true),
  --         starter.sections.builtin_actions(),
  --       },
  --       content_hooks = {
  --         function(content)
  --           local blank_content_line = { { type = 'empty', string = '' } }
  --           local section_coords = starter.content_coords(content, 'section')
  --           -- Insert backwards to not affect coordinates
  --           for i = #section_coords, 1, -1 do
  --             table.insert(content, section_coords[i].line + 1, blank_content_line)
  --           end
  --           return content
  --         end,
  --         starter.gen_hook.adding_bullet("» "),
  --         starter.gen_hook.aligning('center', 'center'),
  --       },
  --       header = header_art,
  --       footer = '',
  --     })
  --   end,
  -- {
  --   import = "custom.configs.coc"
  -- },
  {"RRethy/vim-illuminate", lazy=false},
  { "ThePrimeagen/harpoon" },
  {
    'rmagatti/auto-session',
    lazy = false,
    init = function()
      vim.api.nvim_create_autocmd({ 'BufEnter' }, {
        pattern = 'NvimTree*',
        callback = function()
          local api = require('nvim-tree.api')
          local view = require('nvim-tree.view')

          if not view.is_visible() then
            api.tree.open()
          end
        end,
      })
      vim.t.bufs = vim.api.nvim_list_bufs()
    end,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        post_restore_cmds = {restore_tabs},
        pre_save_cmds = {close_neotree},
      }
    end
  },
  {
    "tpope/vim-fugitive",
    lazy = false
  },
  {
    "sindrets/diffview.nvim",
    -- lazy = false,
    cmd="DiffviewOpen"
  },
  {'nvim-lua/popup.nvim'},
  {'RishabhRD/lspactions'},
  {
    "folke/lsp-colors.nvim",
    config = function()
      require("lsp-colors").setup({
        Error = "#db4b4b",
        Warning = "#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981"
      })
    end
  },

  -- {
  --     'crusj/bookmarks.nvim',
  --     lazy=false,
  --     keys = {
  --         { "<tab><tab>", mode = { "n" } },
  --     },
  --     branch = 'main',
  --     dependencies = { 'nvim-web-devicons' },
  --     config = function()
  --         require("bookmarks").setup({
  --            keymap = {
  --               toggle = "<tab><tab>", -- toggle bookmarks
  --               add = "mm", -- add bookmarks
  --               jump = "<CR>", -- jump from bookmarks
  --               delete = "dd", -- delete bookmarks
  --               order = "<space><space>", -- order bookmarks by frequency or updated_time
  --               delete_on_virt = "\\dd", -- delete bookmark at virt text line
  --               show_desc = "\\sd" -- show bookmark desc
  --           }
  --         })
  --         require("telescope").load_extension("bookmarks")
  --     end
  -- },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-vim-test",
    },
    config = function()
      require "custom.configs.neotest"
    end
  },
  {"mbbill/undotree", lazy = false},
  {
   'prabirshrestha/vim-lsp'
  },
  {
   "folke/trouble.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   ft = "python",
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
    'charludo/projectmgr.nvim',
    lazy = false, -- important!
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
  -- {
  --   "harrisoncramer/gitlab.nvim",
  --   base_branch = "main",
  --   port = 20136, -- The port of the Go server, which runs in the background
  --   dependencies = {
  --     "rcarriga/nvim-notify",
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim"
  --   },
  --   build = function () require("gitlab").build() end, -- Builds the Go binary
  --   config = function()
  --     -- vim.opt.termguicolors = true -- This is required if you aren't already initializing notify
  --     require("notify").setup({ background_colour = "#000000" })  -- This is required if you aren't already initializing notify
  --     require("gitlab").setup()
  --   end,
  -- },
  {
    'stevearc/aerial.nvim',
    init = function()
      require('aerial').setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
          vim.cmd("NvimTreeClose")
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
  {
    'm-demare/hlargs.nvim',
    ft = "python",
    init = function()
      require('hlargs').setup(
        {
          color = "#6c71c4",
          excluded_argnames = {
            declarations = {
                python = { 'self', 'cls' },
            },
            usages = {
              python = { 'self', 'cls' },
              lua = { 'self' }
            }
          },
        }
      )
    end
  },
  {
      "kwkarlwang/bufjump.nvim",
      lazy=false,
      init = function()
          require("bufjump").setup()
      end
  },
  {"ThePrimeagen/vim-be-good", lazy=false},
  {
      "cbochs/grapple.nvim",
      lazy = false,
      dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
      "cbochs/portal.nvim",
      -- Optional dependencies
      lazy = false,
      dependencies = {
          "cbochs/grapple.nvim",
          "ThePrimeagen/harpoon"
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
  {
    "mhinz/vim-signify",
    lazy = false,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  -- {"miyakogi/conoline.vim", lazy=false},
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
  {'kevinhwang91/nvim-bqf', ft = 'qf'},
  {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- {
  --   "Exafunction/codeium.vim",
  --   lazy=false,
  --   config = function ()
  --     -- Change '<C-g>' here to any keycode you like.
  --     vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
  --     vim.keymap.set('i', '<C-m>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
  --     vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
  --     vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  --   end
  -- },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   lazy=false,
  --   opts = {}
  -- },
  -- {'antonk52/bad-practices.nvim', lazy=false,
  --   setup = function()
  --     require('bad_practices.nvim').setup({
  --         most_splits = 3, -- how many splits are considered a good practice(default: 3)
  --         most_tabs = 3, -- how many tabs are considered a good practice(default: 3)
  --         max_hjkl = 5, -- how many times you can spam hjkl keys in a row(default: 10)
  --     })
  --   end
  -- },
  {
    'smoka7/hop.nvim',
    lazy=false,
    init=function()
      require'hop'.setup({create_hl_autocmd=false})
      vim.api.nvim_command('highlight default HopNextKey  guifg=#F7954F gui=bold ctermfg=198 cterm=bold')
      vim.api.nvim_command('highlight default HopNextKey1 guifg=#89bfdc gui=bold ctermfg=45 cterm=bold')
      vim.api.nvim_command('highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33')
    end
  },
  {"chrisgrieser/nvim-spider", lazy=false},
  {'nanozuki/tabby.nvim', lazy=false},
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
  },
  {
    -- config location {project_root}/.nvim/rsync.toml
      'OscarCreator/rsync.nvim',
      build = 'make',
      lazy = false,
      requires = {'nvim-lua/plenary.nvim'},
      init = function()
          require("rsync").setup()
      end
  }
}
return plugins
