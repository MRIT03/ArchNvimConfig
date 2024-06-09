local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-t>", ui.toggle_quick_menu)

-- Restore default functionality for <C-q>, <C-w>, <C-e>, <C-r>
-- I very smartly tried to play with ctrl w and ctrl r but vim decided to play with me
-- yes I am leaving this here as a testimony to my failure
--vim.api.nvim_del_keymap('n', '<C-q>')
--vim.api.nvim_del_keymap('n', '<C-w>')
--vim.api.nvim_del_keymap('n', '<C-e>')
--vim.api.nvim_del_keymap('n', '<C-r>')

-- Remap Harpoon navigation to Ctrl+1, Ctrl+2, Ctrl+3, Ctrl+4
vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end, { noremap = true, silent = true })
