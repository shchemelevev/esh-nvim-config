---@type ChadrcConfig 
local M = {}


M.ui = {
  theme = 'solorized_light', 
  lsp_semantic_tokens=true,
  hl_override={
    CursorLine = {
      bg = "black2"
    }
  }
}


local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = "SessionLoadPost",
  group = config_group,
  callback = function()
    require('nvim-tree.api').tree.toggle(false, true)
  end,
})


vim.g.python_host_prog = "/Users/e_shchemelev/.virtualenvs/neovim2/bin/python"
vim.g.python3_host_prog = '/Users/e_shchemelev/.virtualenvs/neovim3/bin/python'

vim.g.terminal_color_0 = "#fdf6e3"
vim.g.terminal_color_1 = "#dc322f"  -- "#eee8d5"
vim.g.terminal_color_2 = "#859900"
vim.g.terminal_color_3 = "#839496"
vim.g.terminal_color_4 = "#657b83"
vim.g.terminal_color_5 = "#586e75"
vim.g.terminal_color_6 = "#073642"
vim.g.terminal_color_7 = "#002b36"
vim.g.terminal_color_8 = "#859900"
vim.g.terminal_color_9 = "#2aa198"
vim.g.terminal_color_10 = "#268bd2"
vim.g.terminal_color_11 = "#2aa198"
vim.g.terminal_color_12 = "#dc322f"
vim.g.terminal_color_13 = "#268bd2"
vim.g.terminal_color_14 = "#dc322f"



local id = vim.api.nvim_create_augroup("startup", {
  clear = false
})

local persistbuffer = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  vim.fn.setbufvar(bufnr, 'bufpersist', 1)
end

vim.api.nvim_create_autocmd({"BufRead"}, {
  group = id,
  pattern = {"*"},
  callback = function()
    vim.api.nvim_create_autocmd({"InsertEnter","BufModifiedSet"}, {
      buffer = 0,
      once = true,
      callback = function()
        persistbuffer()
      end
    })
  end
})

vim.keymap.set('n', '<Leader>b',
  function()
    local curbufnr = vim.api.nvim_get_current_buf()
    local buflist = vim.api.nvim_list_bufs()
    for _, bufnr in ipairs(buflist) do
      if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, 'bufpersist') ~= 1) then
        vim.cmd('bd ' .. tostring(bufnr))
      end
    end
  end, { silent = true, desc = 'Close unused buffers' })


local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

 vim.wo.relativenumber = true
-- map('n', ':', ';') -- change vertical to horizontal
map('n', '[', '{') -- change vertical to horizontal
map('n', ']', ']') -- change vertical to horizontal
vim.cmd [[
   augroup ilikecursorline
      autocmd VimEnter * :highlight CursorLine guibg=#f0ead9
   augroup END
   autocmd VimEnter * :highlight CursorLine guibg=#f0ead9
]]
vim.g.lua_snippets_path = "~/develop/esh-nvim-config/snippets/"

vim.g.myfunc = function ()
  local goto_any = require("custom.goto_any")
  goto_any.run()
end

vim.g.open_panel = function ()
    vim.cmd [[
      hi default NeotestRunning ctermfg=Cyan guifg=#00f1f5
    ]]
    require('neotest').output_panel.open()
    vim.defer_fn(function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>j G", true, false, true), "n", false)
    end, 200)

    vim.defer_fn(function()
      local r,c = unpack(vim.api.nvim_win_get_cursor(0))
      print(r, c)
      if r < 10 then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("G25k", true, false, true), "n", false)
      end
    end, 300)
end


vim.g.close_panel = function ()
    require('neotest').output_panel.close()
    vim.defer_fn(function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>l", true, false, true), "n", false)
    end, 200)
end


vim.g.run_cmd1 = function ()
    require("harpoon.term").gotoTerminal(1)
    require("harpoon.term").sendCommand(1, 1)           -- sends command 1 to term 1
    vim.defer_fn(function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("G", true, false, true), "n", false)
    end, 200)
end


vim.g.move_coursor_down = function (number)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>"..number.."j", true, false, true), "t", false)
end

vim.g.move_coursor_up = function (number)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>"..number.."k", true, false, true), "t", false)
end

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M

