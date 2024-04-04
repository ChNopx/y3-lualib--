if GameAPI.api_get_start_mode() ~= 1 then
    return
end

---@class 重载扩展
local m = Class '重载扩展'

---@enum (key) 缓存类型
local 缓存 = {
    事件 = {},
}

local 强制清理 = {}


---@param 类型 缓存类型
---@param 对象 any
---@return any
local function 缓存对象(类型, 对象)
    local 载入名称 = 对象:获取载入名称()
    if 载入名称 then
        if 缓存[类型][载入名称] == nil then
            缓存[类型][载入名称] = {}
        end
        log.debug(string.format('创建 %s %s %s', 载入名称, 类型, tostring(对象)))

        table.insert(缓存[类型][载入名称], 对象)
    end
    return 对象
end

local function 事件(class)
    local 原函数 = class.event

    class.event = function(self, event_name, event_args, callback)
        return 缓存对象('事件', 原函数(self, event_name, event_args, callback))
    end
end

事件(Class 'EventManager')


---@param 文件名称 string
---@param 是否强制 boolean
function m.设置是否强制重载文件(文件名称, 是否强制)
    强制清理[文件名称] = 是否强制
end

y3.reload.onBeforeReload(function(reload, willReload)
    ---@diagnostic disable-next-line: invisible
    for _, value in ipairs(reload.includedNames) do
        if reload:isValidName(value) or 强制清理[value] then
            if 缓存.事件[value] then
                for _, 触发器 in ipairs(缓存.事件[value]) do
                    log.debug(string.format('重载移除 %s 事件 %s', value, tostring(触发器)))
                    触发器:移除()
                end
            end
        end
    end
end)

return m
