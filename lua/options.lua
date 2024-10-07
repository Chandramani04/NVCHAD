require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
-- o.relativenumber = true
o.number = true


--tabs and indentation 
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true

--search setting 
o.ignorecase = true
o.smarttab = true

o.cursorline = true

vim.g.copilot_no_tab_map = true
vim.b.copilot_enables = false
