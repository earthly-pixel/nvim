return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      -- Detect environment
      local is_termux = vim.fn.getenv("TERMUX_VERSION") ~= vim.NIL
      
      -- Define paths dynamically
      local node_path = is_termux and "/data/data/com.termux/files/usr/bin/node" or "node"
      local server_cmd = nil
      
      if is_termux then
        server_cmd = {
          node_path,
          "/data/data/com.termux/files/usr/lib/node_modules/@github/copilot-language-server/dist/language-server.js",
        }
      end

      require("copilot").setup({
        copilot_node_command = node_path,
        server_opts_overrides = {
          cmd = server_cmd,
        },
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            open = "<M-CR>",
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
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
