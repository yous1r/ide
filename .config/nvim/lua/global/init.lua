local utils = require("util");

-- 映射vim api
local global = {
    api = vim.api,
    cmd = vim.cmd,
    fn = vim.fn,
    log = vim.log,
    loop = vim.loop,
    uv = vim.uv,
    os = os
};

local os = vim.loop.os_uname().sysname;


function global:generatorGlobalEnv()
    local env = {
        is_mac = os == "Darwin",
        is_linux = os == "Linux",
        is_windows = os == "Windows_NT",
        vim_path = self.fn.stdpath("config")
    }
    local path_sep = env.is_windows and "\\" or "/";
    local home = env.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME");
    env.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep;
    env.modules_dir = env.vim_path .. path_sep .. "modules";
    env.home = home;
    env.data_dir = string.format("%s/site/", self.fn.stdpath("data"));
    global.env = env
    global.generatorGlobalEnv = nil
end

utils:tryCatch(global:generatorGlobalEnv())

return global
