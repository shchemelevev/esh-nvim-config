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
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    keys = {
      {"<leader>sj", "<cmd>Portal jumplist backward<cr>"},
      {"<leader>su", "<cmd>Portal jumplist forward<cr>"},
      {"<leader>sm", "<cmd>Portal jumplist forward<cr>"}
    },
    setup = function()
      require("harpoon").setup({
        tabline = true,
        enter_on_sendcmd = true,
        menu = {
            width = 120
        }
      })
    end
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  },
  {
    'RishabhRD/lspactions',
    lazy=true,
    keys={
      {"<leader>lr", "<cmd> lua require'lspactions'.rename()<CR>"}
    },
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'VonHeikemen/fine-cmdline.nvim',
    lazy=false,
    dependencies = {
      {'MunifTanjim/nui.nvim'}
    }
  },
  {
    "tpope/vim-fugitive",
    lazy=true,
    cmd = "Git"
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd="DiffviewOpen",
    config = function ()
      local a = require "custom.configs.diffview"
      require('diffview').setup(a.config)
    end
  },
  {'nvim-lua/popup.nvim'},
  -- {
  --   "smjonas/inc-rename.nvim",
  --   lazy=false,
  --   config = function()
  --     require("inc_rename").setup()
  --   end,
  -- },
  {
    "folke/lsp-colors.nvim",
    ft="python",
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
    keys = {
      {"<leader>ta",  "<cmd>lua require('neotest').run.attach()<cr>"},
      {"<leader>tf",  "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>"},
      {"<leader>tF",  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>"},
      {"<leader>tl",  "<cmd>lua require('neotest').run.run_last()<cr>"},
      {"<leader>tL",  "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>"},
      {"<leader>tn",  "<cmd>lua require('neotest').run.run()<cr>"},
      {"<leader>tN",  "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>"},
      {"<leader>to",  "<cmd>lua require('neotest').output.open({ enter = true })<cr>"},
      {"<leader>tS",  "<cmd>lua require('neotest').run.stop()<cr>"},
      {"<leader>ts",  "<cmd>lua require('neotest').summary.toggle()<cr>"}
    },
    lazy=true,
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
        no_ignore = true,
        show_preview = true,
      })
    end,
  },
  {
    'Shatur/neovim-session-manager', lazy=false,
    init=function ()
      local Path = require('plenary.path')
      local config = require('session_manager.config')
      require('session_manager').setup({
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
        autoload_mode = config.AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true, -- Automatically save last session on exit and on session switch.
        autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
        -- autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
        autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
          'gitcommit',
          'gitrebase',
        },
        -- autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
        -- autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
        max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
      })
    end
  },
  -- {
  --   'charludo/projectmgr.nvim',
  --   lazy = false, -- important!
  -- },
  {
    "ibhagwan/fzf-lua",
    lazy = true,
    branch= "main",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },
  {
    "Pocco81/auto-save.nvim",
    event="InsertEnter",
    lazy = true
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
    cmd = "AerialToggle",
    keys = {
      { "<leader>a", "<cmd> AerialToggle <CR>NvimTreeRefresh<CR>" }
    },
    config = function()
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
    lazy=true,
    config = function()
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
  -- {
  --     "kwkarlwang/bufjump.nvim",
  --     lazy=false,
  --     init = function()
  --         require("bufjump").setup()
  --     end
  -- },
  -- {"ThePrimeagen/vim-be-good", lazy=false},
  -- {
  --     "cbochs/grapple.nvim",
  --     lazy = false,
  --     dependencies = { "nvim-lua/plenary.nvim" },
  -- },
  {
      "cbochs/portal.nvim",
      -- Optional dependencies
      lazy = true,
      keys = {
        {"<leader>o", "<cmd>Portal jumplist backward<cr>"},
        {"<leader>i", "<cmd>Portal jumplist forward<cr>"}
      },
      cmd = "Portal",
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
    lazy = true,
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
  {'kevinhwang91/nvim-bqf', ft = 'qf', event="VeryLazy"},
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
  --     vim.keymap.set('i', '<C-g>', function () return vim.fn'codeium#Accept'() end, { expr = true })
  --     vim.keymap.set('i', '<C-m>', function() return vim.fn'codeium#CycleCompletions'(1) end, { expr = true })
  --     vim.keymap.set('i', '<C-,>', function() return vim.fn'codeium#CycleCompletions'(-1) end, { expr = true })
  --     vim.keymap.set('i', '<c-x>', function() return vim.fn'codeium#Clear'() end, { expr = true })
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
    lazy=true,
    event="VeryLazy",
    config=function()
      require'hop'.setup({create_hl_autocmd=false})
      vim.api.nvim_command('highlight default HopNextKey  guifg=#F7954F gui=bold ctermfg=198 cterm=bold')
      vim.api.nvim_command('highlight default HopNextKey1 guifg=#89bfdc gui=bold ctermfg=45 cterm=bold')
      vim.api.nvim_command('highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33')
    end
  },
  -- {"chrisgrieser/nvim-spider", lazy=false},
  {'nanozuki/tabby.nvim', lazy=false},
  {'nvim-telescope/telescope-ui-select.nvim' ,
    init=function ()
      require("telescope").load_extension("ui-select")
    end,
    dependencies= {"nvim-telescope/telescope.nvim"},
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    -- optional for floating window border decoration
    keys = {
      { "<leager>lg", "<cmd>LazyGit<CR>"}
    },
    cmd = "LazyGit",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
  },
  {
    'nfvs/vim-perforce',
    lazy=true,
    cmd = {"P4edit", "P4info"}
  },
  {
    -- config location {project_root}/.nvim/rsync.toml
      'OscarCreator/rsync.nvim',
      build = 'make',
      lazy = true,
      requires = {'nvim-lua/plenary.nvim'},
      cmd = {"RsyncUp", "RsyncUpFile"},
      config = function()
          require("rsync").setup()
      end
  },
  {'f-person/git-blame.nvim', lazy=false,
    config=function ()
      vim.g.gitblame_enabled = 1
      vim.g.gitblame_message_template = '<author> • <summary>'
      vim.g.gitblame_virtual_text_column = 80
      require('gitblame').setup {
           --Note how the `gitblame_` prefix is omitted in `setup`
          enabled = true,

      }
    end
  },
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim"
    },
    lazy=true,
    keys = {
      {"<leader>gls",  "<cmd>lua require('gitlab').summary()<cr>"},
      {"<leader>glA",  "<cmd>lua require('gitlab').approve()<cr>"},
      {"<leader>glR",  "<cmd>lua require('gitlab').revoke()<cr>"},
      {"<leader>glc",  "<cmd>lua require('gitlab').create_comment()<cr>"},
      {"<leader>gld",  "<cmd>lua require('gitlab').list_discussions()<cr>"}
    },
    build = function () require("gitlab").build() end, -- Builds the Go binary
    config = function()
      require("gitlab").setup()
    end,
  },
  {
    "hinell/lsp-timeout.nvim",
    dependencies={ "neovim/nvim-lspconfig" }
  },
  {
    "ray-x/lsp_signature.nvim",
    opts = {},
    lazy=true,
    ft = "python",
    config = function(_, opts) require'lsp_signature'.setup(opts) end
  },
  {'psliwka/vim-dirtytalk', 
    lazy=false,
    -- #init=function()
      -- vim.cmd("DirtytalkUpdat")
    -- end
  },
  {
      "norseghost/nvimwordlist",
      cmd = "NvimWordlistUpdate",
      lazy = true,
      config = function()
          vim.opt.spelllang:append("vim")
      end
  },
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    keys = {
      {'<leader>S', '<cmd>lua require("spectre").toggle()<CR>'},
      {'<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>'}
    },
    config = function()
        require('spectre').setup()
    end
  },
  { "tenxsoydev/karen-yank.nvim", config = true, lazy=false },
  {
    "andythigpen/nvim-coverage",
    cmd = {"Coverage", "CoverageToggle"},
    lazy=true,
    requires = "nvim-lua/plenary.nvim",
    -- Optional: needed for PHP when using the cobertura parser
    -- rocks = { 'lua-xmlreader' },
    config = function()
      require("coverage").setup({
           highlights = {
               covered = { fg = "#859900" },
               uncovered = { fg = "#dc322f" },
               partial = { fg = "#AA71F0" },
           },
          signs = {
              covered = { hl = "CoverageCovered", text = "▎▎" },
              uncovered = { hl = "CoverageUncovered", text = "▎▎" },
              partial = { hl = "CoveragePartial", text = "▎▎" },
          },
          lang={
            python = {
                coverage_file = ".coverage",
                -- coverage_command = "source /Users/e_shchemelev/develop/accord/py-accord-handlers/.tox/py310/bin/activate && pytest .",
                coverage_command = "/Users/e_shchemelev/.virtualenvs/neovim3/bin/coverage json --fail-under=0 -q -o -",
                only_open_buffers = false,
            },
          }
      })
    end,
  },
}
return plugins
