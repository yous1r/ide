local util = {};

--- try catch
---@param fun function
---@return boolean result
---@return string? error
function util:tryCatch(fun, ...)
    local result, error = pcall(fun, ...);
    -- 如果报错，直接弹出
    if not result then
        print("error: " .. error);
    end
    local arg = {...}; -- 将剩余参数放入表中，用于迭代器遍历
    for i, v in ipairs(arg) do
        print("arg length: " .. #arg)
        -- 判断是否有剩余参数
        if #arg ~= 0 then
            -- 递归遍历是否仍有表或函数
            util:deepCheck(v);
        else
            print("try catch has no args")
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
        print("length:" .. #M)
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

return util;
