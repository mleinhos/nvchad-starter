--[[
local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    astyle = {
			"suffix=none",
			"style=allman",
			"indent=force-tab=8",
			"keep-one-line-blocks",
			"max-code-length=100",
			"break-after-logical",
			"break-return-type",
			"break-return-type-decl",
			"align-pointer=type",
			"indent-preproc-block",
			"lineend=linux",
			"break-blocks",
			"pad-comma",
			"pad-header",
			"pad-oper",
    },
  },

}

return options
]]--

return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        astyle = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      formatters = {
        astyle = {
          command = "astyle",
          args = {
            "suffix=none",
            "style=allman",
            "indent=force-tab=8",
            "keep-one-line-blocks",
            "max-code-length=100",
            "break-after-logical",
            "break-return-type",
            "break-return-type-decl",
            "align-pointer=type",
            "indent-preproc-block",
            "lineend=linux",
            "break-blocks",
            "pad-comma",
            "pad-header",
            "pad-oper",
          }
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
