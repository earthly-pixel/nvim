return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter", -- Only loads Copilot when you start typing to keep Neovim fast
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            open = "<M-CR>", -- Alt + Enter to open the Copilot suggestions panel
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true, -- Automatically show suggestions as ghost text while typing
          debounce = 75,
          keymap = {
            accept = "<Tab>", -- Press Tab to accept the AI suggestion
            next = "<M-]>>",  -- Alt + ] to cycle to the next suggestion
            prev = "<M-[>",   -- Alt + [ to cycle to the previous suggestion
            dismiss = "<C-]>",-- Ctrl + ] to dismiss the ghost text
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
          -- Ensure it is explicitly enabled for your Laravel files:
          php = true,
          blade = true,
          javascript = true,
          html = true,
          css = true,
          lua = true,
        },
      })
    end,
  },
}
