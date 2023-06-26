-- Credits to original https://github.com/sainnhe/everforest
-- This is modified version of it

local M = {}

M.base_30 = {
  white = "#272f35",
  darker_black = "#f5efde",
  black = "#fff9e8", --  nvim bg
  black2 = "#F0EAD9",
  one_bg = "#E0DAC9",
  one_bg2 = "#D1CBBA",
  one_bg3 = "#C2BCAB",
  grey = "#B3AD9C",
  grey_fg = "#A39D8C",
  grey_fg2 = "#948E7D",
  light_grey = "#857F6E",
  red = "#c85552",
  baby_pink = "#ce8196",
  pink = "#ef6590",
  line = "#e8e2d1", -- for lines like vertsplit
  green = "#5da111",
  vibrant_green = "#87a060",
  nord_blue = "#656c5f",
  blue = "#3a94c5",
  yellow = "#b58900",
  sun = "#d1b171",
  purple = "#b67996",
  dark_purple = "#966986",
  teal = "#69a59d",
  orange = "#F7954F",
  cyan = "#89bfdc",
  statusline_bg = "#ede7d6",
  lightbg = "#d3cdbc",
  pmenu_bg = "#5f9b93",
  folder_bg = "#747b6e",
}

-- available colors
-- base03    #002b36
-- base02    #073642
-- base01    #586e75
-- base00    #657b83
-- base0     #839496
-- base1     #93a1a1
-- base2     #eee8d5
-- base3     #fdf6e3
-- yellow    #b58900
-- orange    #cb4b16
-- red       #dc322f
-- magenta   #d33682
-- violet    #6c71c4
-- blue      #268bd2
-- cyan      #2aa198
-- green     #859900

M.base_16 = {
  base00 = "#fdf6e3",
  base01 = "#eee8d5",
  base02 = "#93a1a1",
  base03 = "#839496",
  base04 = "#657b83",
  base05 = "#586e75",
  base06 = "#073642",
  base07 = "#002b36",
  base08 = "#859900",
  base09 = "#2aa198",
  base0A = "#268bd2",
  base0B = "#2aa198",
  base0C = "#dc322f",
  base0D = "#268bd2",
  base0E = "#859900",
  base0F = "#d33682",
}

M.polish_hl = {
  DiffAdd = { fg = M.base_30.green },
  WhichKeyDesc = { fg = M.base_30.white },
  WhichKey = { fg = M.base_30.white },
  NvimTreeFolderName = { fg = "#4e565c" },
  TbLineThemeToggleBtn = { bg = M.base_30.one_bg },
  Pmenu = { bg = M.base_30.black2 },
  IndentBlanklineContextStart = { bg = M.base_30.black2 },
  St_pos_text = { fg = M.base_30.white },
  ["@tag"] = { fg = M.base_30.orange },
  ["@field"] = { fg = M.base_16.base05 },
  ["@include"] = { fg = M.base_16.base08 },
  ["@constructor"] = { fg = M.base_30.blue },
}

M.type = "light"

M = require("base46").override_theme(M, "everforest_light")

return M
