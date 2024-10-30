require "nvchad.mappings"
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- add yours here

local map = vim.keymap.set
-- local M = {}


map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "ff", "<ESC>")
map("n","<C-a>","ggVG",{noremap = true,silent = true})
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("i", "<C-r>", 'copilot#Accept("<CR>")', { silent = true, expr = true , replace_keycodes = false})

map("i", "<C-l>", function()
  require("copilot.suggestion").accept()
end, { desc = "Copilot accept" })

-- Split Windows
map('n', '<C-w>s', ':split<CR>', { desc = "Horizontal Split" })    -- Ctrl-w s for horizontal split
map('n', '<C-w>v', ':vsplit<CR>', { desc = "Vertical Split" })     -- Ctrl-w v for vertical split

-- Window Navigation using Ctrl + hjkl
map('n', '<C-h>', '<C-w>h', { desc = "Move to the left window" })  -- Ctrl-h to move left
map('n', '<C-j>', '<C-w>j', { desc = "Move to the window below" }) -- Ctrl-j to move down
map('n', '<C-k>', '<C-w>k', { desc = "Move to the window above" }) -- Ctrl-k to move up
map('n', '<C-l>', '<C-w>l', { desc = "Move to the right window" }) -- Ctrl-l to move right

-- Window Resizing using Ctrl + arrow keys
map('n', '<C-Up>', '<C-w>+', { desc = "Resize window up" })        -- Ctrl-Up to resize up
map('n', '<C-Down>', '<C-w>-', { desc = "Resize window down" })    -- Ctrl-Down to resize down
map('n', '<C-Left>', '<C-w><', { desc = "Resize window left" })    -- Ctrl-Left to resize left
map('n', '<C-Right>', '<C-w>>', { desc = "Resize window right" })  -- Ctrl-Right to resize right

--Ctrl + s to save in insert mode 
map('i', '<C-s>', '<C-o>:w<CR>', { desc = "Save file in insert mode" })

-- Compile and run C++ code, with input from 'input.txt' and output to 'output.txt'
map("n", "<leader>r", ":w | :silent !g++ main.cpp -o main && ./main < input.txt > output.txt && true<CR>", { noremap = true, silent = true })


-- View output in 'output.txt'
map("n", "<leader>o", ":e output.txt<CR>", { noremap = true, silent = true })

-- Optional: Open input file quickly
map("n", "<leader>i", ":e input.txt<CR>", { noremap = true, silent = true })

-- Open all files in a split window layout
map("n", "<leader>p", ":vsp input.txt | split output.txt<CR>", { noremap = true, silent = true })

