require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "ff", "<ESC>")
map("n","<C-a>","ggVG",{noremap = true,silent = true})
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
