-- Setup animations
require('mini.animate').setup({
  cursor = {
    enable = true, -- Enable smooth cursor movement
    timing = require('mini.animate').gen_timing.linear({ duration = 200, unit = 'total' }),
  },
  resize = {
    enable = true, -- Enable animated resizing of splits
    timing = require('mini.animate').gen_timing.linear({ duration = 100, unit = 'total' }),
  },
  scroll = {
    enable = true, -- Enable animated scrolling
    timing = require('mini.animate').gen_timing.linear({ duration = 150, unit = 'total' }),
  },
})
