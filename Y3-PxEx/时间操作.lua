---@class 时间
---@field 时间戳 integer
---@field 局_时间表 osdateparam
local m = Class '时间'
m.type = '时间'

y3.时间 = m

local 周转换 = {
    [2] = { 文本 = '星期一', 数值 = 1 },
    [3] = { 文本 = '星期二', 数值 = 2 },
    [4] = { 文本 = '星期三', 数值 = 3 },
    [5] = { 文本 = '星期四', 数值 = 4 },
    [6] = { 文本 = '星期五', 数值 = 5 },
    [7] = { 文本 = '星期六', 数值 = 6 },
    [1] = { 文本 = '星期日', 数值 = 7 },
}


function m:__tostring()
    return 格式化文本('{时间|%s %s|%d}', self:格式化('%Y-%m-%d %H:%M:%S'), self:获取时间("星期"), self.时间戳)
end

---@enum (key) 时间.时间表字段
local 映射表_时间字段 = {
    年 = 'year',
    月 = 'month',
    日 = 'day',
    时 = 'hour',
    分 = 'min',
    秒 = 'sec',
    isdst = 'isdst',
    星期 = 'wday',
    年日 = 'yday',

}

---@enum (key) 时间.单位
local 映射表_时间单位 = {
    日 = 86400,
    时 = 3600,
    分 = 60,
    秒 = 1,
}

---@param 时间戳 integer
---@param 是否为北京时间戳 boolean?
---@return 时间
function m.创建自时间戳(时间戳, 是否为北京时间戳)
    ---@class 时间
    local self = New '时间' ()
    self.局_时间表 = os.date('*t', 时间戳) --[[@as osdateparam]]
    self.时间戳 = 时间戳
    return self
end

---@class 时间.时间表
---@field 年 integer
---@field 月 integer
---@field 日 integer
---@field 时? integer
---@field 分? integer
---@field 秒? integer
---@field isdst? boolean
---@field 星期? string|integer
---@field yday? string|integer

---@param 时间表 时间.时间表
---@return self
function m.创建自时间表(时间表)
    ---@class 时间
    local r = New '时间' ()
    r.局_时间表 = {
        year = 时间表.年,
        month = 时间表.月,
        day = 时间表.日,
        hour = 时间表.时,
        min = 时间表.分,
        sec = 时间表.秒,
        isdst = 时间表.isdst,
        wday = 时间表.星期,
        yday = 时间表.yday,
    }
    r.时间戳 = os.time(r.局_时间表)
    return r
end

---@alias 时间.格式化文本
---| string
---| "%Y-%m-%d %H:%M:%S" 2022-10-12 09:03:58
---| "%Y-%m-%d" 2022-10-12
---| "%H:%M:%S" 09:03:58

--[[
%a	星期几的简写（Wed）
%A	星期几的全名（Wednesday）
%b	月份的简写（Oct）
%B	月份的全名（October）
%c	日期和时间(默认)（Wed Oct 12 09:03:58 2022）
%d	一个月中的第几天 [01-31]
%H	24小时制中的小时数
%I	12小时制中的小时数
%j	一年中的第几天
%m	月份
%M	分钟
%p	“am” 或 “pm”
%S	秒数
%w	星期
%W	一年中的第几周
%x	日期（10/12/22）
%X	时间（09:03:58）
%y	两位数年份（22）
%Y	完整的年份（2022）
%z	时区（+0800）
%%	百分号（%）
]]
---@overload fun(self:时间|integer,格式化文本:时间.格式化文本):string
function m.格式化(时间, 格式化文本)
    if type(时间) == 'number' then
        return os.date(格式化文本, 时间) --[[@as string]]
    else
        return os.date(格式化文本, 时间.时间戳) --[[@as string]]
    end
end

---@overload fun(时间:时间|integer,数值:integer, 单位:时间.时间表字段):时间
function m.增减时间(时间, 数值, 单位)
    if type(时间) == 'number' then
        时间 = m.创建自时间戳(时间)
    end
    时间.时间戳 = 时间.时间戳 + 数值 * 映射表_时间单位[单位 or '秒']
    时间.局_时间表 = os.date('*t', 时间.时间戳) --[[@as osdateparam]]
    return 时间 --[[@as 时间]]
end

---@overload fun(时间1:时间|integer, 单位:时间.时间表字段):integer
function m.获取时间(时间, 单位)
    if type(时间) == 'number' then
        时间 = m.创建自时间戳(时间)
    end
    if 单位 == '星期' then
        return 周转换[时间.局_时间表[映射表_时间字段[单位]]].数值
    end
    return 时间.局_时间表[映射表_时间字段[单位]]
end

function m.获取当前服务器时间()
    return m.创建自时间戳(y3.游戏.获取_当前服务器时间(8).timestamp)
end

---@overload fun(时间1:时间|integer,时间2:时间|integer, 单位:时间.单位)
function m.获取时间差(时间1, 时间2, 单位)
    local 自身时间戳 = type(时间1) == 'number' and 时间1 or 时间1.时间戳
    local 目标时间戳 = type(时间2) == 'number' and 时间2 or 时间2.时间戳
    local 相差秒数 = os.difftime(自身时间戳, 目标时间戳)
    return 相差秒数 / 映射表_时间单位[单位 or '秒']
end

---@class 时间.周期参数
---@field 类型 时间.周期类型
---@field 开始时间? {年?:integer, 月?:integer, 周?:integer, 日?:integer, 时?:integer, 分?:integer, 秒?:integer}
---@field 结束时间? {年?:integer, 月?:integer, 周?:integer, 日?:integer, 时?:integer, 分?:integer, 秒?:integer}


---@param 时间1 时间
---@param 时间2 时间
---@return boolean
function m:判断_时间是否在范围内(时间1, 时间2)
    if 时间1.时间戳 > 时间2.时间戳 then
        return self.时间戳 >= 时间2.时间戳 and self.时间戳 < 时间1.时间戳
    else
        return self.时间戳 >= 时间1.时间戳 and self.时间戳 < 时间2.时间戳
    end
end

---@enum (key) 时间.周期类型
local 判断_时间是否过期_类型函数 = {
    ---@param 时间 时间
    ---@param 参数 时间.周期参数
    ---@return 时间, 时间, 时间
    每日 = function(时间, 参数)
        local 周期开始参数 = 参数.开始时间 or {}
        local 周期结束参数 = 参数.结束时间 or {}
        local 当前时间 = m.获取当前服务器时间()
        local 周期结束时间 = m.创建自时间表({
            年 = 当前时间:获取时间("年"),
            月 = 当前时间:获取时间("月"),
            日 = 当前时间:获取时间("日"),
            时 = 周期结束参数.时 or 23,
            分 = 周期结束参数.分 or 59,
            秒 = 周期结束参数.秒 or 59
        })
        local 周期开始时间 = m.创建自时间表({
            年 = 周期结束时间:获取时间("年"),
            月 = 周期结束时间:获取时间("月"),
            日 = 周期结束时间:获取时间("日"),
            时 = 周期开始参数.时 or 0,
            分 = 周期开始参数.分 or 0,
            秒 = 周期开始参数.秒 or 0
        })
        return 当前时间, 周期开始时间, 周期结束时间
    end,

    ---@param 时间 时间
    ---@param 参数 时间.周期参数
    ---@return 时间, 时间, 时间
    每周 = function(时间, 参数)
        local 周期开始参数 = 参数.开始时间 or {}
        local 周期结束参数 = 参数.结束时间 or {}
        local 当前时间 = m.获取当前服务器时间():增减时间(-3, "日")
        local 结束星期 = 周期结束参数.周 or 7 -- 4
        local 当前星期 = 当前时间:获取时间("星期") --  3
        local 结束增加时间
        if 结束星期 > 当前星期 then
            结束增加时间 = 结束星期 - 当前星期
        else
            结束增加时间 = 7 - 当前星期 + 结束星期
        end
        local 周期结束时间 = m.创建自时间表({
            年 = 当前时间:获取时间("年"),
            月 = 当前时间:获取时间("月"),
            日 = 当前时间:获取时间("日"),
            时 = 周期结束参数.时 or 23,
            分 = 周期结束参数.分 or 59,
            秒 = 周期结束参数.秒 or 59
        }):增减时间(结束增加时间, "日")
        local 周期开始时间 = m.创建自时间表({
            年 = 周期结束时间:获取时间("年"),
            月 = 周期结束时间:获取时间("月"),
            日 = 周期结束时间:获取时间("日"),
            时 = 周期开始参数.时 or 0,
            分 = 周期开始参数.分 or 0,
            秒 = 周期开始参数.秒 or 0
        }):增减时间(-6, "日")
        return 当前时间, 周期开始时间, 周期结束时间
    end
}

---@param 时间 时间|integer
---@param 参数 时间.周期参数
---@return boolean
function m.判断_时间是否过期(时间, 参数)
    时间 = type(时间) == "number" and m.创建自时间戳(时间) or 时间 --[[@as 时间]]
    local 当前时间, 周期开始时间, 周期结束时间 = 判断_时间是否过期_类型函数[参数.类型](时间, 参数)
    -- 调试输出(格式化文本('存档时间 %s\n周期开始 %s\n周期结束 %s',
    --     时间,
    --     周期开始时间,
    --     周期结束时间
    -- ))
    if not 当前时间:判断_时间是否在范围内(周期开始时间, 周期结束时间) then
        return true
    end
    if 时间:判断_时间是否在范围内(周期开始时间, 周期结束时间) then
        return false
    else
        return true
    end
end

return m
