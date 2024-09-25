-- Setup bufferline
require("bufferline").setup {
  options = {
    numbers = "buffer_id", -- Show buffer id or other numbering style
    close_command = "Bdelete! %d",       -- Custom close command (uses vim-bbye)
    right_mouse_command = "Bdelete! %d", -- Close buffer on right-click
    show_buffer_close_icons = false,     -- Don't show close icons
    separator_style = "slant",           -- Add slanted separators between tabs
    diagnostics = "nvim_lsp",            -- Show LSP diagnostics in tabs
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", text_align = "left" },
    },
  },
}
-- Keybindings to quickly move between tabs
vim.api.nvim_set_keymap('n', '<leader>l', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })  -- Move to the next buffer
vim.api.nvim_set_keymap('n', '<leader>h', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })  -- Move to the previous buffer

vim.api.nvim_set_keymap('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', { noremap = true, silent = true })
-- Continue for as many buffers as you need
-- Move the current buffer left in the tabline
vim.api.nvim_set_keymap('n', '<leader><', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })

-- Move the current buffer right in the tabline
vim.api.nvim_set_keymap('n', '<leader>>', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>q', ':Bdelete<CR>', { noremap = true, silent = true })

