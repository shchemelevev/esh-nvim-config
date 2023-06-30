---@type ChadrcConfig 
 local M = {}

 local function map(mode, lhs, rhs, opts)
   local options = { noremap=true, silent=true }
   if opts then
     options = vim.tbl_extend('force', options, opts)
   end
   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
 end

 M.ui = {theme = 'solorized_light'}
 M.plugins = "custom.plugins"
 vim.wo.relativenumber = true
 M.mappings = require "custom.mappings"
-- map('n', ':', ';') -- change vertical to horizontal
map('n', '[', '{') -- change vertical to horizontal
map('n', ']', ']') -- change vertical to horizontal
vim.cmd [[

   augroup ilikecursorline
      autocmd VimEnter * :highlight CursorLine guibg=#f0ead9
   augroup END

]]

return M

