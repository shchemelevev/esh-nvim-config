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
-- map('n', ':', ';') -- change vertical to horizontal
return M

