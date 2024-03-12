require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- vim.cmd("map <F5> :!cscope -Rb<CR>:cs reset<CR><CR>")
map("n", "<F5>", ":CScope -Rb<CR>:Cscope reset<CR><CR>")
