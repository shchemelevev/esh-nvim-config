require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.shfmt,
    require("custom.null-ls-tox-mypy")
  },
  timeout_ms=5000,
  root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".tox", ".git"),
})
