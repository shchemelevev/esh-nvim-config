local M = {}

-- In order to disable a default keymap, use
-- M.disabled = {
--   t = {
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
     [",y"] = { '<cmd> lua vim.g.run_cmd1() <CR>', "harpoon file 1" },
     [",p"] = { '<cmd> lua require("harpoon.cmd-ui").toggle_quick_menu() <CR>', "harpoon file 1" },
     [",h"] = { '<cmd> lua require("harpoon.ui").nav_file(1) <CR>', "harpoon file 1" },
     [",j"] = { '<cmd> lua require("harpoon.ui").nav_file(2) <CR>', "harpoon file 2" },
     [",k"] = { '<cmd> lua require("harpoon.ui").nav_file(3) <CR>', "harpoon file 3" },
     [",l"] = { '<cmd> lua require("harpoon.ui").nav_file(4) <CR>', "harpoon file 4" },
     [",;"] = { '<cmd> lua require("harpoon.ui").nav_file(5) <CR>', "harpoon file 5" },
     [",n"] = { '<cmd> lua require("harpoon.term").gotoTerminal(1) <CR>', "harpoon terminal 1" },
     [",m"] = { '<cmd> lua require("harpoon.term").gotoTerminal(2) <CR>', "harpoon terminal 2" },
     [",,"] = { '<cmd> lua require("harpoon.term").gotoTerminal(3) <CR>', "harpoon terminal 3" },
     [",."] = { '<cmd> lua require("harpoon.term").gotoTerminal(4) <CR>', "harpoon terminal 4" },
     [",/"] = { '<cmd> lua require("harpoon.term").gotoTerminal(5) <CR>', "harpoon terminal 5" },
     [",t"] = { '<cmd> lua require("harpoon.term").sendCommand(1, "mypy tests/test_new_typing.py\\n") <CR>', "harpoon mypy to term 1"},
     ["<C-a>"] = { '<cmd> lua require("harpoon.mark").add_file() <CR>', "harpoon add file" },
     ["<C-t>"] = { '<cmd> lua require("harpoon.ui").toggle_quick_menu() <CR>', "harpoon toggle" },
     ["<C-p>"] = { '<cmd> b#<CR>', "previous buffer" },
    ["<CR>"] = {'<cmd>FineCmdline<CR>', 'fine cmdline'},
    ["<leader>ar"] = {'<cmd>FineCmdline<CR>', 'fine cmdline'},

    -- neotest
    ["<leader>X"] = { "<cmd>:q<cr>", "Attach" },
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
    ["<leader>tp"] = { "<cmd>lua vim.g.open_panel()<cr>", "Pannel" },
    -- ["<leader>pm"] = { "<cmd>ProjectMgr<cr>", "ProjectMGR" },
    ["<leader>sl"] = { "<cmd>SessionManager load_session<cr>", "Load Session" },
    ["<leader>ss"] = { "<cmd>SessionManager save_current_session<cr>", "Save Current Session" },
    ["<leader>pm"] = { "<cmd>ProjectMgr<cr>", "ProjectMGR" },
    ["<leader>tx"] = { "<cmd>lua vim.g.close_panel()<cr>", "Pannel" },
    ["<C-l>"] = { "<cmd>lua vim.g.myfunc()<cr>", "Summary" },

    ["<leader>o"] = { "<cmd>Portal jumplist backward<cr>", "Summary" },
    ["<leader>i"] = { "<cmd>Portal jumplist forward<cr>", "Summary" },

    ["<leader>gls"] = { "<cmd>lua require('gitlab').summary()<cr>", "Summary" },
    ["<leader>glA"] = { "<cmd>lua require('gitlab').approve()<cr>", "Approve" },
    ["<leader>glR"] = { "<cmd>lua require('gitlab').revoke()<cr>", "Revoke" },
    ["<leader>glc"] = { "<cmd>lua require('gitlab').create_comment()<cr>", "Create comment" },
    ["<leader>gld"] = { "<cmd>lua require('gitlab').list_discussions()<cr>", "List discussions" },

    ["<leader>fr"] = { "<cmd>Telescope resume<cr>", "Pannel" },
    ["w"] = { "<cmd>lua require('spider').motion('w')<CR>", "word"},
    ["e"] = { "<cmd>lua require('spider').motion('e')<CR>", "end"},
    ["b"] = { "<cmd>lua require('spider').motion('b')<CR>", "end"},

    ["<leader>a"] = { "<cmd> AerialToggle <CR>NvimTreeRefresh<CR>", "Toggle Aerial" },
    ["<leader>lg"] = { "<cmd> LazyGit<CR>", "LazyGit" },
    ["<leader>lr"] = { "<cmd> lua require'lspactions'.rename()<CR>", "lsp actions rename" },

    ["<UP>"] = { "<cmd> HopWordBC<CR>", "HopWordBC" },
    ["<DOWN>"] = { "<cmd> HopWordAC<CR>", "HopWordAC" },
    ["<LEFT>"] = { "<cmd> HopLineBC<CR>", "HopLineStartBC" },
    ["<RIGHT>"] = { "<cmd> HopLineAC<CR>", "HopLineStartAC" },
  },

  i = {
     ["<C-;>"] = { '<cmd> lua if require("luasnip").expand_or_jumpable() then require("luasnip").expand_or_jump() end <CR>', "snip jump next" },
    -- ...
  },
  t = {
   -- ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    -- ["<C-d>"] = { "<cmd>lua vim.g.move_coursor_down(20)<cr>", "Move coursor down" },
    -- ["<C-u>"] = { "<cmd>lua vim.g.move_coursor_up(20)<cr>", "Move cursor up" },
    ["<leader>tx"] = { "<cmd>lua vim.g.close_panel()<cr>", "Pannel" },
    ["<leader>x"] = { "<cmd>lua vim.g.close_panel()<cr>", "Pannel" },
    ["<C-\\>"] = {'<cmd>lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, false, true), "n", false)<cr>', "exit from terminal insert mode"}
  }
}


return M
