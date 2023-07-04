  require("neotest").setup({
    adapters = {
      require("neotest-python")({
          -- Extra arguments for nvim-dap configuration
          -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
          dap = { justMyCode = false },
          -- Command line arguments for runner
          -- Can also be a function to return dynamic values
          args = {"--log-level", "DEBUG", "-vv", "--quiet"},
          -- Runner to use. Will use pytest if available by default.
          -- Can be a function to return dynamic value.
          runner = "pytest",
          -- Custom python path for the runner.
          -- Can be a string or a list of strings.
          -- Can also be a function to return dynamic value.
          -- If not provided, the path will be inferred by checking for 
          -- virtual envs in the local directory and for Pipenev/Poetry configs
          python = ".tox/py310/bin/python"
      }),
      require("neotest-plenary"),
      -- require("neotest-vim-test")({
      --   ignore_file_types = { "python", "vim", "lua" },
      -- }),
    },
    output_panel = {
      enabled = true,
      open = "botright split | resize 50",
    },
    quickfix = {
      enabled = false,
      open = false,
    },
    output = { open_on_run = false, enter = false },
     -- quickfix = {
     --   open = function()
     --    lua require("neotest").output_panel.open()
     --     -- vim.cmd("Trouble quickfix")
     --     -- if require("lazy.util").has("trouble.nvim") then
     --     --   vim.cmd("Trouble quickfix")
     --     -- else
     --     --   vim.cmd("copen")
     --     -- end
     --   end,
     -- },
  })
