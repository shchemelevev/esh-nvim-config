vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    local api = require('nvim-tree.api')

    -- Only 1 window with nvim-tree left: we probably closed a file buffer
    if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
      -- Required to let the close event complete. An error is thrown without this.
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last hidden buffer used before closing
        api.tree.toggle({find_file = true, focus = true})
        -- re-open nivm-tree
        api.tree.toggle({find_file = true, focus = true})
        -- nvim-tree is still the active window. Go to the previous window.
        vim.cmd("wincmd p")
      end, 0)
    end
  end
})

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  local hop = require('hop')
  local directions = require('hop.hint').HintDirection

  -- for some reason it doesn't work properly
  vim.keymap.set("n", "k", hop.hint_word({direction=directions.BEFORE_CURSOR}))
  vim.keymap.set("n", "j", hop.hint_word({direction=directions.AFTER_CURSOR}))
end

local options = {
  filters = {
    custom = { "__pycache__", ".mypy_cache", '.idea', '*.git', '.cargo'}
  },
  update_focused_file = {
    enable = false,
    update_root = false,
    ignore_list = {"*/.tox", ".tox"}
  },
  on_attach = my_on_attach,
}

return options
