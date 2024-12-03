require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--

-- Copilot mappings
local M = {}
M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      "Copilot Accept",
      { expr = true, silent = true, noremap = true }
    }
  }
}

-- Register the Copilot mapping
map("i", "<C-l>", M.copilot.i["<C-l>"][1], { expr = true, silent = true, noremap = true })

return M
