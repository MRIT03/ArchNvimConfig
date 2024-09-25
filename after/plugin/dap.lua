-- Load nvim-dap and configure keybindings
local dap = require('dap')

-- Keybindings for DAP
vim.api.nvim_set_keymap('n', '<Leader>x1', '<Cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>x2', '<Cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>x3', '<Cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x4', '<Cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<Cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>B', '<Cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dr', '<Cmd>lua require"dap".repl.open()<CR>', { noremap = true, silent = true })

-- Configure DAP UI (if installed)
require("dapui").setup()

-- DAP UI Keybindings
vim.api.nvim_set_keymap('n', '<leader>du', '<Cmd>lua require"dapui".toggle()<CR>', { noremap = true, silent = true })

-- Configure DAP Virtual Text (if installed)
require("nvim-dap-virtual-text").setup()
dap.adapters.python = {
  type = 'executable';
  command = vim.fn.exepath('python');
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}"; -- Launch the current file
    pythonPath = function()
      return vim.fn.exepath('python') -- Adjust this if you use virtual environments
    end;
  },
}
local dap = require('dap')

dap.adapters.java = {
  type = 'server',
  host = '127.0.0.1',
  port = 5005,  -- Port that the debugger will listen to
}

dap.configurations.java = {
  {
    type = 'java',
    request = 'attach',
    name = "Attach to the process",
    hostName = "127.0.0.1",
    port = 5005,
  },
}

