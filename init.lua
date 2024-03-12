vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

require("cscope_maps").setup()

--[[
local conform_opts = require("configs.conform")
require("conform").setup(conform_opts)
--]]

--[[
local conform = require("conform")
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
		conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
	end, { desc = "Format file or range (in visual mode)" })
--]]

--require("filetype")
  --[[
require("filetype").setup({
  -- [[
  function_extensions = {
    ["c"] = function()
      --vim.bo.filetype = "cpp"
      -- Remove annoying indent jumping
      -- vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
      -- vim.opt.expandtab = false
      -- vim.opt.shiftwidth = 8
      -- vim.opt.smartindent = true
      -- vim.opt.autoindent = true
      -- vim.opt.tabstop = 8
    end,
  }
  -- ]]
-- })
  --]]

vim.schedule(function()
  require "mappings"
end)
