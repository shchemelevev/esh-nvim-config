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


vim.g.move_coursor_down = function (number)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>"..number.."j", true, false, true), "t", false)
end

vim.g.move_coursor_up = function (number)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>"..number.."k", true, false, true), "t", false)
end

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M

