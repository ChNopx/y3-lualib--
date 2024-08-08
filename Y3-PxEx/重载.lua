---@class Reload
local M = Class 'Reload'

M.是否为重载 = (function()
    local 局_是否为重载 = false
    M.onBeforeReload(function(reload, willReload)
        局_是否为重载 = true
    end)
    return function()
        return 局_是否为重载
    end
end)()



M.保护数据 = (function()
    local 局_缓存数据 = {}
    --- 第一个返回值是要操作的对象, 之后是该对象的字段名称
    ---@param 传递数据 fun():对象:any, ...:string
    return function(传递数据)
        local 参数 = 表.创建自不定长参数(传递数据())
        local 对象 = 参数[1]
        local 名称 = debug.getinfo(传递数据, "S").source
        for i = 2, 参数.n do
            local 字段 = 参数[i]
            if 局_缓存数据[名称] and 局_缓存数据[名称][i] then
                对象[参数[i]] = 局_缓存数据[名称][i]
            end
        end
        M.onBeforeReload(function(reload, willReload)
            局_缓存数据[名称] = {}
            for i = 2, 参数.n do
                local 字段 = 参数[i]
                局_缓存数据[名称][i] = 对象[字段]
            end
        end)
    end
end)()


---@param 回调 fun()
function M.禁止重载(回调)
    if M.是否为重载() then
        return
    end
    回调()
end

local 重载移除对象缓存 = {}

---@generic T:table
---@param 对象 T
---@return T
function M.重载对象(对象)
    重载移除对象缓存[#重载移除对象缓存 + 1] = 对象
    return 对象
end

y3.游戏:事件("键盘-抬起", y3.const.KeyboardKey["RSHIFT"], function(trg, data)
    if y3.游戏.是否为调试模式() then
        y3.reload.reload()
        return
    end
end)


y3.reload.onBeforeReload(function(reload, willReload)
    for i = #重载移除对象缓存, 1, -1 do
        Delete(重载移除对象缓存[i])
    end
end)
