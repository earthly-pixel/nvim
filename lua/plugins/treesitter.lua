return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Old (Remove this):
    -- require("nvim-treesitter.configs").setup({ ... })

    -- New API:
    local ts = require("nvim-treesitter")
    
    -- Setup is optional and only needed to change default directories:
    ts.setup({}) 
    
    -- Install parsers explicitly:
    ts.install({
      "bash", "c", "html", "javascript", "json", "lua", "markdown", "python", "query", "typescript", "vim", "vimdoc", "yaml"
    })

    -- Highlighting is native to Neovim 0.12 by default, but to ensure 
    -- treesitter starts for your installed languages:
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
