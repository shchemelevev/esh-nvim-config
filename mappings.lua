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
     ["<leader>fm"] = {":Telescope Marks <CR>", "Telescope Marks"},
     ["<leader>fw"] = {":Telescope live_grep <CR>", "Telescope live grep"},
     ["<leader>fW"] = {":Telescope grep_string <CR>", "Telescope grep string under cursor"},
     ["<leader>fl"] = {":Telescope lsp_references <CR>", "Telescope lsp references"},
     ["<C-u>"] = {"<C-u>zz", "up"},
     ["<C-d>"] = {"<C-d>zz", "down"},
     ["su"] = { '<cmd> lua vim.g.run_cmd_in_harpoon_term(1, 1) <CR>', "harpoon term 1 cmd 1" },
     ["si"] = { '<cmd> lua vim.g.run_cmd_in_harpoon_term(1, 2) <CR>', "harpoon term 1 cmd 2" },
     ["so"] = { '<cmd> lua vim.g.run_cmd_in_harpoon_term(1, 3) <CR>', "harpoon term 1 cmd 3" },
     ["sp"] = { '<cmd> lua vim.g.run_cmd_in_harpoon_term(1, 4) <CR>', "harpoon term 1 cmd 4" },
     ["sy"] = { '<cmd> lua vim.g.run_cmd_in_harpoon_term(1, 5) <CR>', "harpoon term 1 cmd 5" },
     ["s7"] = { '<cmd> lua vim.g.restart_rebuild_docker(1, 6) <CR>', "harpoon term 1 cmd 6" },
     ["s8"] = { '<cmd> lua vim.g.run_cmd_in_harpoon_term(2, 7) <CR>', "harpoon term 2 cmd 7" },
     ["s/"] = { '<cmd> lua require("harpoon.cmd-ui").toggle_quick_menu() <CR>', "harpoon file 1" },
     ["sj"] = { '<cmd> lua require("harpoon.ui").nav_file(1) <CR>', "harpoon file 1" },
     ["sk"] = { '<cmd> lua require("harpoon.ui").nav_file(2) <CR>', "harpoon file 2" },
     ["sl"] = { '<cmd> lua require("harpoon.ui").nav_file(3) <CR>', "harpoon file 3" },
     ["s;"] = { '<cmd> lua require("harpoon.ui").nav_file(4) <CR>', "harpoon file 4" },
     ["sh"] = { '<cmd> lua require("harpoon.ui").nav_file(5) <CR>', "harpoon file 5" },
     -- ["s;"] = { '<cmd> lua require("harpoon.ui").nav_file(5) <CR>', "harpoon file 5" },
     ["sm"] = { '<cmd> lua require("harpoon.term").gotoTerminal(1) <CR>', "harpoon terminal 1" },
     ["s,"] = { '<cmd> lua require("harpoon.term").gotoTerminal(2) <CR>', "harpoon terminal 2" },
     ["s."] = { '<cmd> lua require("harpoon.term").gotoTerminal(3) <CR>', "harpoon terminal 3" },
     ["sn"] = { '<cmd> lua require("harpoon.term").gotoTerminal(5) <CR>', "harpoon terminal 5" },
     ["st"] = { '<cmd> lua require("harpoon.term").sendCommand(1, "mypy tests/test_new_typing.py\\n") <CR>', "harpoon mypy to term 1"},
     ["<C-a>"] = { '<cmd> lua require("harpoon.mark").add_file() <CR>', "harpoon add file" },
     ["<C-t>"] = { '<cmd> lua require("harpoon.ui").toggle_quick_menu() <CR>', "harpoon toggle" },
     ["<C-p>"] = { '<cmd> b#<CR>', "previous buffer" },
     ["<leader>T"] = { '<cmd> TroubleToggle<CR>', "previous buffer" },

     [";"] = {'<cmd>FineCmdline<CR>', 'fine cmdline'},
     [":"] = {'<cmd>FineCmdline<CR>', 'fine cmdline'},
     ["<leader>ar"] = {'<cmd>FineCmdline<CR>', 'fine cmdline'},

    -- neotest
    ["<leader>x"] = { "<cmd>:q<cr>", "close" },
    ["<leader>ta"] = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
    ["<leader>tc"] = { "<cmd>Coverage<cr>", "Coverage" },
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
    ["<leader>rw"] = { ":%s/\\<<C-r><C-w>\\>/", "replace word under cursor" },

    ["<C-l>"] = { "<cmd>lua vim.g.myfunc()<cr>", "Summary" },
    ["sw"] = { "<cmd>lua vim.g.sel_workspace()<cr>", "Summary" },

    ["<leader>o"] = { "<cmd>Portal jumplist backward<cr>", "Summary" },
    ["<leader>i"] = { "<cmd>Portal jumplist forward<cr>", "Summary" },

    ["<leader>gls"] = { "<cmd>lua require('gitlab').summary()<cr>", "Summary" },
    ["<leader>glA"] = { "<cmd>lua require('gitlab').approve()<cr>", "Approve" },
    ["<leader>glR"] = { "<cmd>lua require('gitlab').revoke()<cr>", "Revoke" },
    ["<leader>glc"] = { "<cmd>lua require('gitlab').create_comment()<cr>", "Create comment" },
    ["<leader>gld"] = { "<cmd>lua require('gitlab').list_discussions()<cr>", "List discussions" },

    ["<leader>fr"] = { "<cmd>Telescope resume<cr>", "Pannel" },
    -- ["w"] = { "<cmd>lua require('spider').motion('w')<CR>", "word"},
    -- ["e"] = { "<cmd>lua require('spider').motion('e')<CR>", "end"},
    -- ["b"] = { "<cmd>lua require('spider').motion('b')<CR>", "end"},

    ["<leader>a"] = { "<cmd> AerialToggle <CR>NvimTreeRefresh<CR>", "Toggle Aerial" },
    ["<leader>lg"] = { "<cmd> LazyGit<CR>", "LazyGit" },
    ["<leader>lr"] = { "<cmd> lua require'lspactions'.rename()<CR>", "lsp actions rename" },

    ["<UP>"] = { "<cmd> HopWordBC<CR>", "HopWordBC" },
    ["<DOWN>"] = { "<cmd> HopWordAC<CR>", "HopWordAC" },
    ["<LEFT>"] = { "<cmd> HopLineBC<CR>", "HopLineStartBC" },
    ["<RIGHT>"] = { "<cmd> HopLineAC<CR>", "HopLineStartAC" },

    -- spectre
    ['<leader>S'] = {'<cmd>lua require("spectre").toggle()<CR>', "Toggle Spectre" },
    ['<leader>sw'] = {'<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search current word"},
    ['<leader>ll'] = {'<cmd> lua vim.g.lsp_restart_full()<cr>', 'lsp restart'},
    ['<leader>tt'] = {'<cmd> lua require("trouble").next({skip_groups = true, jump = true})<CR>', "jump to next trouble"}
  },

  i = {
     ["<C-;>"] = { '<cmd> lua if require("luasnip").expand_or_jumpable() then require("luasnip").expand_or_jump() end <CR>', "snip jump next" },
    -- ...
  },
  v = {
    ['<leader>sw'] = {'<esc><cmd>lua require("spectre").open_visual()<CR>', "Search current word"},
    ['<leader>sp'] = {'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "Search on current file"},
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
