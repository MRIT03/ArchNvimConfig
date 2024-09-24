-- NvimTree setup
require'nvim-tree'.setup {
  renderer = {
    highlight_opened_files = "all",
    highlight_git = true,
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "★",
        },
      },
    },
  },
}
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Setup for web-devicons
require('nvim-web-devicons').setup({
  default = true,
})
