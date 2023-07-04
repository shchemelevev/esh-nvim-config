---@type ChadrcConfig 
 local M = {}

 local function map(mode, lhs, rhs, opts)
   local options = { noremap=true, silent=true }
   if opts then
     options = vim.tbl_extend('force', options, opts)
   end
   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
 end

 M.ui = {theme = 'solorized_light', lsp_semantic_tokens=true}
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
vim.g.lua_snippets_path = "~/develop/esh-nvim-config/snippets/"

vim.g.myfunc = function ()
  local goto_any = require("custom.goto_any")
  goto_any.run()
end

vim.g.open_panel = function ()
    require('neotest').output_panel.toggle()
    vim.defer_fn(function()
      vim.cmd([[normal! <C-j>]])
      print("test")
      -- local new_mode = vim.api.nvim_get_mode().mode
      -- if new_mode ~= mode then
      --   if string.find(new_mode, "i") == 1 then
      --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, true, true), "n", false)
      --     -- Optionally restore visual selection if we came from visual mode (is this common?)
      --     if string.find(mode, "v") == 1 or string.find(mode, "V") == 1 then
      --       vim.cmd([[normal! gv]])
      --     end
      --   end
      -- end
    end, 200)


    -- vim.cmd(vim.api.nvim_replace_termcodes('normal <C-j>', true, true, true))
    --vim.cmd(vim.api.nvim_replace_termcodes('normal <S-g>', true, true, true))
end

return M

