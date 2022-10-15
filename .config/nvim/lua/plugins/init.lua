print("nvim load start")

local fn = require("global.init")
local pack = require("packer")
local tryCatch = require("util").tryCatch
local data_dir = string.format("%s/site/", vim.fn.stdpath("data"))

print("data_dir is :", "%s/site/", vim.fn.stdpath("data"))

local Packer = {}
-- Packer.init_ensure_plugins = function ()
-- 	local packer_dir = data_dir .. "pack/packer/start/packer.nvim"
-- 	local state = uv.fs_stat(packer_dir)
-- 	if not state then
-- 		local cmd = "!git clone https://github.com/wbthomason/packer.nvim " .. packer_dir
-- 		api.nvim_command(cmd)
-- 		uv.fs_mkdir(data_dir .. "lua", 511, function()
-- 			assert("make compile path dir failed")
-- 		end)
-- 	end
-- end

-- Packer.init_ensure_plugins()

local hasPacker, packer = tryCatch(require, "packer")

if not hasPacker then
    local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
end

return pack.startup(function()
    use({"lewis6991/impatient.nvim"})

    -- Packer can manage itself
    use({"wbthomason/packer.nvim"})

    use {"williamboman/nvim-lsp-installer", {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvim-lsp-installer").setup {}
            -- lsp_config.setup()
        end
    }}

    use({
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/plenary.nvim"}},
        opt = true
    })

    use({
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
            opt = true
        }
    })

    use({
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true
        }
    })

    use({
        "catppuccin/nvim",
        as = "catppuccin"
    })

    use({
        "iamcco/markdown-preview.nvim",
        as = "MarkdownPreview",
        opt = true
    })
end)
