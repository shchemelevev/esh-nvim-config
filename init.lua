vim.g.python3_host_prog = "/Users/e_shchemelev/.virtualenvs/neovim3/bin/python"
vim.g.python_host_prog = "/Users/e_shchemelev/.virtualenvs/neovim2/bin/python"
vim.cmd("set title")
vim.api.nvim_command('highlight default HopNextKey  guifg=#F7954F gui=bold ctermfg=198 cterm=bold')
vim.api.nvim_command('highlight default HopNextKey1 guifg=#89bfdc gui=bold ctermfg=45 cterm=bold')
vim.api.nvim_command('highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33')

if vim.g.neovide then
  vim.o.guifont = "AnonymicePro Nerd Font Mono:h18" -- text below applies for VimScript
  vim.g.neovide_cursor_animate_in_insert_mode = false
end
