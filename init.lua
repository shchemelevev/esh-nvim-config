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
