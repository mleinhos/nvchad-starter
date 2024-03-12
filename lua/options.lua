require "nvchad.options"

-- add yours here!

-- vim.opt.expandtab = false
-- vim.opt.shiftwidth = 8
-- vim.opt.smartindent = true
-- vim.opt.autoindent = true
-- vim.opt.tabstop = 8
-- vim.opt.ruler = true
-- vim.opt.cursorline = true

-- replace with astyle or clang
vim.opt.cindent = true
vim.opt.cinwords="if,else,while,do,for,switch"
vim.opt.cinkeys = "0{,0},0),0],0#,!^F,o,O,e"

if vim.bo.filetype == 'c' --.matchregex({filename = '*.[ch]'})
then
  vim.opt.expandtab = false
  vim.opt.shiftwidth = 8
  vim.opt.smartindent = true
  vim.opt.autoindent = true
  vim.opt.tabstop = 8
end


-- filetype plugin is better suited for this but I can't figure it out
--[[
vim.api.nvim_create_augroup('BasicCFormat', {clear = true})

vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
    {
      group = 'BasicCFormat',
      pattern = { '*.c', '*.cpp', '*.h' },
      command = 'setlocal expandtab! tabstop=8 shiftwidth=8 autoindent smartindent',
  }
)
--]]

-- vim.opt.cinoptions=

vim.cmd("highlight CursorLine cterm=NONE ctermbg=red ctermfg=white guibg=red guifg=white")

---#vim.opt.softtabstop = 2

