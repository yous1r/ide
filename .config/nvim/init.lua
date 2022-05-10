local present, impatient = pcall(require, "impatient")

if present then
    impatient.enable_profile()
end

require("plugins.init")
require("plugins.nvim-tree")
require("colors.catppuccin")
require("markdown-preview")
require("plugins.lsp")

