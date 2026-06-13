return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    config = function()
      local opencode_cmd = "opencode --port"
      local terminal_opts = {
        win = {
          position = "right",
          enter = false,
        },
      }

      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = {
          start = function()
            require("snacks.terminal").open(opencode_cmd, terminal_opts)
          end,
        },
      }

      vim.o.autoread = true

      vim.keymap.set({ "n", "t" }, "<leader>oo", function()
        require("snacks.terminal").toggle(opencode_cmd, terminal_opts)
      end, { desc = "Toggle OpenCode" })

      vim.keymap.set("n", "<leader>oa", function()
        require("opencode").ask("@buffer: ")
      end)

      vim.keymap.set("v", "<leader>oa", function()
        require("opencode").ask("@this: ")
      end)

      vim.keymap.set({ "n", "x" }, "<leader>os", function()
        require("opencode").select()
      end, { desc = "Select OpenCode" })

      vim.keymap.set({ "n", "x" }, "go", function()
        return require("opencode").operator("@this ")
      end, { desc = "Append range to OpenCode", expr = true })

      vim.keymap.set("n", "goo", function()
        return require("opencode").operator("@this ") .. "_"
      end, { desc = "Append line to OpenCode", expr = true })

      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "Scroll OpenCode up" })

      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "Scroll OpenCode down" })
    end,
  },
}
