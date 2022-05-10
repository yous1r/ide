local util = {};
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

local time = {
    startTime = 0,
    endTime = 0
}

-- local lsc = require "luarocks.site_config";
-- local system = lsc.LUAROCKS_UNAME_S or io.popen("uname -s"):read("*l")  
print(io.popen("uname -s"):read("l"))

function global:generatorGlobalEnv()
    local env = {
        is_mac = os == "Darwin",
        is_linux = os == "Linux",
        is_windows = os == "Windows_NT"
        -- vim_path = self.fn.stdpath("config")
    }
    local path_sep = env.is_windows and "\\" or "/";
    local home = env.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME");
    env.cache_dir = home .. path_sep .. ".cache" .. path_sep .. "nvim" .. path_sep;
    env.modules_dir = env.vim_path .. path_sep .. "modules";
    env.home = home;
    env.data_dir = string.format("%s/site/", self.fn.stdpath("data"));
    global.env = env;
    global.generatorGlobalEnv = nil;
    return env
end

function time:update_start_time(time)
    self.startTime = time;
end
function time:update_end_time(time)
    self.endTime = time;
end

--- try catch
---@param fun function
---@return boolean result
---@return string? error
function util:tryCatch(fun, ...)
    time:update_start_time(os.clock())
    print(time.startTime)
    local result, error = pcall(fun, ...);
    -- 如果报错，直接弹出
    if not result then
        print("result: " .. tostring(result));
        print("error: " .. tostring(error));
    end
    local arg = {...}; -- 将剩余参数放入表中，用于迭代器遍历
    if #arg ~= 0 then
        for i, v in ipairs(arg) do
            -- 判断是否有剩余参数
            if #arg ~= 0 then
                -- 递归遍历是否仍有表或函数
                util:deepCheck(v);
                time:update_end_time(os.clock())
                print(time.endTime)
            else
                print("try catch has no args")
            end
        end
    end
    return result, error;
end

--- func desc
---@param table any
function util:deepCheck(table, ...)
    local M = {table, ...}
    for i, v in ipairs(M) do
        -- 判断是否有剩余参数
        if #M ~= 0 then
            if type(v) == "table" then
                for _i, inner_v in ipairs(v) do
                    if #v ~= 0 then
                        util:deepCheck(inner_v);
                    else
                        print("inner val has no args");
                    end
                end
            elseif type(table) == "function" then
                table();
            elseif type(table) == ("thread" or "userdata") then
                print("please check your params, can not parse type of thread or userdata ");
            else
                print("value: " .. table);
            end
        else
            print("deepCheck has no args");
        end
    end
end

local count = 0
local function startCount()
    count = count + 1;
    print("计时 count: " .. count)
end

-- local function insertProp(M)
local function genertatorTestM(len, fn)
    local M = {}
    -- for i = 1, 2, 1 do
    M.insert({fn})
    -- end
end

util:tryCatch(genertatorTestM(3, startCount))

function util:deepCheckProp(M)
    if (type(M) == "table") then
        for i, v in ipairs(M) do

        end
        util.deepCheckProp(M)
    else
        return false
    end
end

util:tryCatch(startCount,
    {startCount, {startCount, {startCount, {startCount, {startCount, {startCount, {startCount}}}}}}})

return global;
