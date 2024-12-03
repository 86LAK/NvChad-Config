return {
  -- Other plugin configurations...

  -- Null-ls for linting, formatting, etc.
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,        -- Prettier for formatting
          null_ls.builtins.diagnostics.eslint,         -- ESLint for diagnostics
          null_ls.builtins.diagnostics.flake8,         -- Flake8 for Python diagnostics
          null_ls.builtins.formatting.stylua,          -- Stylua for Lua formatting
          null_ls.builtins.diagnostics.shellcheck,    -- ShellCheck for shell scripts
        },
      })
    end,
  },
}
