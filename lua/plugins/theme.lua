return {
  "Mofiqul/vscode.nvim",
  priority = 1000, -- Load before everything else
  config = function()
    require("vscode").setup({
      transparent = false,
      italic_comments = true,
    })
    -- CRITICAL: This line actually switches your editor to the theme!
    vim.cmd.colorscheme("vscode")
  end,
}
