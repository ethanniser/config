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

-- Helper function for transparency formatting
local alpha = function()
  return string.format('%x', math.floor((255 * vim.g.neovide_transparency_point) or 0.8))
end
-- Set transparency and background color (title bar color)
vim.g.neovide_transparency = 0.0
vim.g.neovide_transparency_point = 0.8
vim.g.neovide_background_color = '#0f1117' .. alpha()
-- Add keybinds to change transparency
local change_transparency = function(delta)
  vim.g.neovide_transparency_point = vim.g.neovide_transparency_point + delta
  vim.g.neovide_background_color = '#0f1117' .. alpha()
end
vim.keymap.set({ 'n', 'v', 'o' }, '<D-]>', function()
  change_transparency(0.01)
end)
vim.keymap.set({ 'n', 'v', 'o' }, '<D-[>', function()
  change_transparency(-0.01)
end)
