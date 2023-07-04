local M = {}

-- In order to disable a default keymap, use
-- M.disabled = {
--   n = {
--       ["<leader>h"] = "",
--       ["<C-a>"] = ""
--   }
-- }
--

-- Your custom mappings
M.abc = {
  n = {
     -- ["<C-n>"] = {"<cmd> Telescope <CR>", "Telescope"},
     -- ["<C-s>"] = {":Telescope Files <CR>", "Telescope Files"},
     ["h1"] = { '<cmd> lua require("harpoon.ui").nav_file(1) <CR>', "harpoon file 1" },
     ["h2"] = { '<cmd> lua require("harpoon.ui").nav_file(2) <CR>', "harpoon file 2" },
     ["h3"] = { '<cmd> lua require("harpoon.ui").nav_file(3) <CR>', "harpoon file 3" },
     ["h4"] = { '<cmd> lua require("harpoon.ui").nav_file(4) <CR>', "harpoon file 4" },
     ["h5"] = { '<cmd> lua require("harpoon.ui").nav_file(5) <CR>', "harpoon file 5" },
     ["<C-a>"] = { '<cmd> lua require("harpoon.mark").add_file() <CR>', "harpoon add file" },
     ["<C-t>"] = { '<cmd> lua require("harpoon.ui").toggle_quick_menu() <CR>', "harpoon toggle" },
     ["<C-p>"] = { '<cmd> b#<CR>', "previous buffer" },
    -- neotest
    ["<leader>ta"] = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
    ["<leader>tf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
    ["<leader>tF"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
    ["<leader>tl"] = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
    ["<leader>tL"] = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
    ["<leader>tn"] = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
    ["<leader>tN"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
    ["<leader>to"] = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
    ["<leader>tS"] = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
    ["<leader>ts"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
    ["<leader>tp"] = { "<cmd>lua vim.g.open_panel()<cr>", "Summary" },
    ["<leader>gl"] = { "<cmd>lua vim.g.myfunc()<cr>", "Summary" },
  },

  i = {
     ["<C-;>"] = { '<cmd> lua if require("luasnip").expand_or_jumpable() then require("luasnip").expand_or_jump() end <CR>', "snip jump next" },
    -- ...
  }
}


return M
