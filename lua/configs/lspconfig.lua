-- Load NvChad's default LSP configuration
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- List of LSP servers to configure
local servers = {
  -- Ansible
  "ansiblels",              -- Ansible Language Server

  -- Bash
  "bashls",                 -- Bash Language Server

  -- C/C++
  "clangd",                 -- C/C++ Language Server

  -- CSS
  "cssls",                  -- CSS Language Server

  -- Docker
  "dockerls",               -- Docker Language Server
  "docker_compose_language_service", -- Docker Compose Language Service

  -- Go
  "gopls",                  -- Go Language Server

  -- Helm
  "helm_ls",                -- Helm Language Server

  -- HTML
  "html",                   -- HTML Language Server

  -- JSON
  "jsonls",                 -- JSON Language Server

  -- Lua
  "lua_ls",                 -- Lua Language Server

  -- Markdown
  "marksman",               -- Markdown Language Server (alternative: "markdown_oxide")

  -- Python
  "jedi_language_server",   -- Python Jedi Language Server
  "pyright",                -- Pyright (optional: can replace Jedi)
  "pylsp",                  -- Python Language Server
  "ruff",               -- Ruff LSP for Python

  -- Rust
  "rust_analyzer",          -- Rust Analyzer

  -- Terraform
  "terraformls",            -- Terraform Language Server

  -- TypeScript/JavaScript
  "ts_ls",               -- TypeScript/JavaScript Language Server

  -- YAML
  "yamlls",                 -- YAML Language Server
}

-- Setup each LSP server with the default configuration
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end



local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    -- Python
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.autopep8,

    -- Bash
    null_ls.builtins.diagnostics.shellcheck,

    -- Docker
    null_ls.builtins.diagnostics.hadolint,

    -- YAML
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.formatting.yamlfmt,

    -- JavaScript/TypeScript/JSON/CSS/HTML/Markdown
    null_ls.builtins.formatting.prettier,

    -- Go
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,

    -- C/C++
    null_ls.builtins.diagnostics.clang_check,

    -- Lua
    null_ls.builtins.formatting.stylua,

    -- Rust
    null_ls.builtins.formatting.rustfmt,

    -- Markdown
    null_ls.builtins.diagnostics.markdownlint,

    -- Spelling
    null_ls.builtins.diagnostics.codespell,
  },
}
