local global = {}
-- local env = require("module"):generatorGlobalEnv()
print(io.popen("uname"):read("*all"))
print(io.popen("top -bn 2 -i -c -d 0.1"):read("*all"))

global.inpairs = function()
end

global.purepairs = function()
end

local cache_dir_list = {}

-- function global:demo()
--     for i, path in ipairs(env) do
--         print(
--             "i: " .. i .. "\n" ..
--             "path: " .. path 
--         )
--     end
-- end
-- global:demo()

return global
