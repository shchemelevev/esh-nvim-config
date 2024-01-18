vim.g.loaded_python3_provider = 1
vim.g.python3_host_prog = "/Users/e_shchemelev/.virtualenvs/neovim3/bin/python"
vim.g.python_host_prog = "/Users/e_shchemelev/.virtualenvs/neovim2/bin/python"
vim.cmd("set title")
vim.api.nvim_command('highlight default HopNextKey  guifg=#F7954F gui=bold ctermfg=198 cterm=bold')
vim.api.nvim_command('highlight default HopNextKey1 guifg=#89bfdc gui=bold ctermfg=45 cterm=bold')
vim.api.nvim_command('highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33')
vim.cmd("set winbar=%=\\m\\ %f")

vim.g.gitblame_message_template = '<author> • <summary>'
vim.g.gitblame_enabled = 0
vim.g.gitblame_virtual_text_column = 80

if vim.g.neovide then
  vim.o.guifont = "AnonymicePro Nerd Font Mono:h18" -- text below applies for VimScript
  vim.g.neovide_cursor_animate_in_insert_mode = false
end

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=#268bd2')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#839496')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#839496')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=#eee8d5')



vim.keymap.set('', "'", '"')
vim.keymap.set('', "q", '')
vim.keymap.set('', "Q", 'q')
vim.keymap.set('', "c", '"_c')
vim.keymap.set('', "C", '"_C')
vim.keymap.set('', "s", '"_s')
vim.keymap.set('', "S", '"_S')

vim.opt.spelllang = "en_us"
vim.opt.spell = true

local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand
autocmd('TermOpen', {
  pattern = '',
  command = ":setlocal nospell"
})

autocmd('FileType', {
  pattern = 'spectre_panel',
  command = ":setlocal nospell"
})

autocmd('BufEnter', {
  pattern = '*.keymap',
  callback = function ()
    vim.cmd(":set nowrap")
    vim.cmd(":set nospell")
  end,
})

autocmd('FileType', {
  pattern = 'quickfix',
  callback = function ()
    local bufnr = vim.fn.bufnr()
    print(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<esc>', '<cmd>cclose<CR>', {noremap=true})
  end
})


-- vim.o.foldcolumn = '1' -- '0' is not bad
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true

local enable_providers = { "python3_provider", }
for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end
