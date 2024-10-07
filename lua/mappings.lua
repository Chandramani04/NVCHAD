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

