---@diagnostic disable: invisible
---@class 本地中心计时器2
---@overload fun(参数:本地中心计时器2.NEW):self
local m = Class '本地中心计时器2'

---@type 本地中心计时器2[]
m.局_全部计时器 = {}

---@class 本地中心计时器2.NEW
---@field 回调 fun(计时器:本地中心计时器2, 当前计次:integer)
---@field 次数 integer
---@field 等待时间 number

---@param 参数 本地中心计时器2.NEW
function m:__init(参数)
    self.局_回调 = 参数.回调
    self.局_执行间隔 = 参数.等待时间
    self.局_执行次数 = 1
    self.局_总执行次数 = 参数.次数
    self.局_状态 = 1
    self.局_最近执行时间 = os.clock_banned() + 参数.等待时间
    表.插入值(m.局_全部计时器, self)
end

function m:__del()

end

function m:__tosring()
    return 格式化文本('{中心计时器|%.2f|%d|%d',
        self.局_执行间隔,
        self.局_执行次数, self.局_总执行次数)
end

---@param 等待时间 number
---@param 回调 fun(计时器:本地中心计时器2, 计次:integer)
---@return self
function m.单次执行(等待时间, 回调)
    local self = New '本地中心计时器2' ({
        次数 = 1,
        等待时间 = 等待时间,
        回调 = 回调
    })
    return self
end

---@param 等待时间 number
---@param 次数 integer
---@param 回调 fun(计时器:本地中心计时器2, 计次:integer)
---@return self
function m.计次执行(等待时间, 次数, 回调)
    local self = New '本地中心计时器2' ({
        次数 = 次数,
        等待时间 = 等待时间,
        回调 = 回调
    })
    return self
end

---@param 等待时间 number
---@param 回调 fun(计时器:本地中心计时器2, 计次:integer)
---@return self
function m.循环执行(等待时间, 回调)
    local self = New '本地中心计时器2' ({
        次数 = math.huge --[[@as integer]],
        等待时间 = 等待时间,
        回调 = 回调
    })
    return self
end

---@return self
function m:暂停()
    self.局_状态 = 2
    return self
end

function m:继续()
    self.局_状态 = 1
end

function m:移除()
    self.局_状态 = 3
    Delete(self)
end

---@return self
function m:立即执行()
    self.局_最近执行时间 = 0
    return self
end

function m:判断_是否正在运行()
    return self.局_状态 == 1
end

local function 执行计时器()
    local 当前时间 = os.clock_banned()
    local 无效计时器 = {}
    for index, value in ipairs(m.局_全部计时器) do
        if value.局_状态 == 1 then
            if value.局_总执行次数 >= value.局_执行次数 then
                if 当前时间 > value.局_最近执行时间 then
                    value.局_回调(value, value.局_执行次数)
                    value.局_执行次数 = value.局_执行次数 + 1
                    value.局_最近执行时间 = 当前时间 + value.局_执行间隔
                end
            else
                value.局_状态 = 3
            end
        elseif value.局_状态 == 3 then
            表.插入值(无效计时器, index)
        end
    end
    for i = #无效计时器, 1, -1 do
        表.移除索引(m.局_全部计时器, 无效计时器[i])
    end
end

y3.l计时器.loop(0.01, function(timer, count)
    执行计时器()
end)

y3.本地中心计时器 = m
