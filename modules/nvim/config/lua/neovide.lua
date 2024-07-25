-- vim.cmd 'set guifont="MesloLGS Nerd Font:h14"'
vim.o.guifont = 'MesloLGS Nerd Font:h14'
vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
vim.keymap.set('v', '<D-c>', '"+y') -- Copy
vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })

-- Dynamically change scale
vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set('n', '<C-=>', function()
  change_scale_factor(1.25)
end)
vim.keymap.set('n', '<C-->', function()
  change_scale_factor(1 / 1.25)
end)

vim.g.transparency = 0.8

local change_transparency = function(delta)
  local next_value = vim.g.transparency + delta
  if next_value > 1.0 or next_value < 0.0 then
    return
  else
    vim.g.transparency = next_value
  end
end
vim.keymap.set({ 'n', 'v', 'o' }, '<D-]>', function()
  change_transparency(0.05)
end)
vim.keymap.set({ 'n', 'v', 'o' }, '<D-[>', function()
  change_transparency(-0.05)
end)

vim.keymap.set({ 'n', 'v', 'o' }, '<D-;>', function()
  vim.g.neovide_window_blurred = not vim.g.neovide_window_blurred
end)
