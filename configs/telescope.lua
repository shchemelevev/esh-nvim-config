local options = {
  defaults = {
    pickers = {
      find_files = {
        follow = true
      }
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      }
    },
    file_ignore_patterns = {
      "node_modules",
      "**/.tox/**",
    },
  }
}

return options
