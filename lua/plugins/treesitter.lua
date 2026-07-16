return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Register the blade filetypr so treesitter can parse it
    vim.filetype.add({
      pattern = {
        ["%.blade%.php"] = "blade",
      },
    })

    -- Register the custom external treesitter parser for blade
    local register_blade = function ()
      require("nvim-treesitter.parsers").blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade", -- local path or git repo
          files = { "src/parser.c" },
          branch = "main",
        },
        tier = 2, -- WARN: `tier 2` is required for external parsers, otherwise treesitter will not load it
        filetype = "blade", -- if filetype does not match the parser name
      }
    end

    -- Register immediately so that treesitter can parse blade files
    register_blade()
    -- .. and register again after treesitter is loaded, in case it was loaded before this plugin
    vim.api.nvim_create_autocmd("User", {
      pattern = "TSUpdate",
      callback = register_blade,
    })

    -- New API:
    local ts = require("nvim-treesitter")
    
    -- Setup is optional and only needed to change default directories:
    ts.setup({}) 
    
    -- Install parsers explicitly:
    ts.install({
      "bash", "c", "html", "javascript", "json", "lua", "markdown",
      "php", "blade", "python", "query", "typescript", "vim", "vimdoc", "yaml"
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
