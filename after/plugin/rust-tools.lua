local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>h", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
local dap = require('dap')

-- DAP adapter for Rust using lldb
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- Adjust the path if necessary
  name = "lldb",
}

-- Rust configuration
dap.configurations.rust = {
  {
    name = "Launch",
    type = "lldb",   -- Use lldb as the adapter
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- Additional setup for pretty-printing structs
    initCommands = function()
      -- Customize this if you want specific behavior for rust
      return {
        'settings set target.source-map /rustc/src /absolute/path/to/your/project/src',
      }
    end,
  },
}

