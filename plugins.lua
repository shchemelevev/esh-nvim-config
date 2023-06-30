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
    "sindrets/diffview.nvim",
    -- lazy = false,
    cmd="DiffviewOpen"
  },
  {'nvim-lua/popup.nvim'},
  {'RishabhRD/lspactions'},
  {
      'crusj/bookmarks.nvim',
      lazy=false,
      keys = {
          { "<tab><tab>", mode = { "n" } },
      },
      branch = 'main',
      dependencies = { 'nvim-web-devicons' },
      config = function()
          require("bookmarks").setup({
             keymap = {
                toggle = "<tab><tab>", -- toggle bookmarks
                add = "mm", -- add bookmarks
                jump = "<CR>", -- jump from bookmarks
                delete = "dd", -- delete bookmarks
                order = "<space><space>", -- order bookmarks by frequency or updated_time
                delete_on_virt = "\\dd", -- delete bookmark at virt text line
                show_desc = "\\sd" -- show bookmark desc
            }
          })
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
