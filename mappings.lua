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
     ["h4"] = { '<cmd> lua require("harpoon.ui").nav_file(5) <CR>', "harpoon file 4" },
     ["<C-a>"] = { '<cmd> lua require("harpoon.mark").add_file() <CR>', "harpoon add file" },
     ["<C-t>"] = { '<cmd> lua require("harpoon.ui").toggle_quick_menu() <CR>', "harpoon toggle" },
  },

  i = {
     ["<C-;>"] = { '<cmd> lua if require("luasnip").expand_or_jumpable() then require("luasnip").expand_or_jump() end <CR>', "snip jump next" },
    -- ...
  }
}

return M
