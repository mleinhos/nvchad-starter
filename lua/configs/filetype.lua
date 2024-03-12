--require("filetype").setup({
local opts = {
      function_extensions = {
        ["c"] = function()
          vim.opt.expandtab = false
          vim.opt.shiftwidth = 8
          vim.opt.smartindent = true
          vim.opt.autoindent = true
          vim.opt.tabstop = 8
        end
      }
    }
--})
--
return opts
