---@class UI
local M = Class 'UI'

---@param 回调 fun(索引:integer,遍历到的控件:UI):any?
---@return any? return 当前回调返回值
function M:遍历_子控件(回调)
    for index, value in ipairs(self:获取_所有子控件()) do
        local r = 回调(index, value)
        if r then
            return r
        end
    end
end

---@param 回调 fun(深度:integer,父控件:UI):self
---@return UI
function M:遍历_父控件(回调)
    local 父控件 = self
    for i = 1, 30, 1 do
        if 父控件 then
            回调(i, 父控件)
            if 父控件:获取_父控件() then
                父控件 = 父控件:获取_父控件()
            else
                return 父控件
            end
        end
    end
    return 父控件
end

---@param 控件 UI
---@param 回调 fun(当前控件:UI)
local function 获取子控件(控件, 回调)
    控件:遍历_子控件(function(索引, 遍历到的控件)
        回调(遍历到的控件)
    end)
end

---@param 深度 integer?
---@param 包含父控件 boolean?
---@return UI[]
function M:获取_所有子控件P(深度, 包含父控件)
    深度 = 深度 or 1
    local r = {}
    local cr1 = {}
    local cr2 = { self }
    for i = 1, 深度 do
        cr1 = cr2
        cr2 = {}
        for index, value in ipairs(cr1) do
            获取子控件(value, function(当前控件)
                table.insert(cr2, 当前控件)
                if 包含父控件 or i == 深度 then
                    table.insert(r, 当前控件)
                end
            end)
        end
    end
    return r
end

---@return UI[]
function M:获取_所有父控件()
    local r = {}
    local 父控件 = self
    for i = 1, 30, 1 do
        if 父控件 then
            父控件 = 父控件:获取_父控件()
            if 父控件 then
                table.insert(r, 父控件)
            else
                break
            end
        end
    end
    return r
end

---@return UI
function M:获取_最高父控件()
    local 父控件 = self
    for i = 1, 50, 1 do
        if 父控件:获取_父控件() then
            父控件 = 父控件:获取_父控件()
        else
            break
        end
    end
    return 父控件
end

---@param 公式 string
---@return self
function M:设置_绑定_公式(公式)
    GameAPI.set_ui_comp_bind_format(self.player.handle, self.handle, 公式)
    return self
end

M.__数据 = {}

---@overload fun(self:UI, ...:any, 值:any)
function M:设置_数据(...)
    表.设置路径值(M.__数据, self.handle, ...)
end

---@param ... any 键
---@return any
function M:获取_数据(...)
    return 表.获取路径值(M.__数据,self.handle, ...)
end

---@return UIPrefab
function M:获取_所属元件()
    ---@diagnostic disable-next-line: param-type-mismatch
    return y3.元件.从handle获取(self.player, GameAPI.get_ui_comp_prefab(self.player.handle, self.handle))
end

---@alias UI.位置移动类型 '上'|'下'|'左'|'右'|'中'

---@param 目标控件 UI
---@param 参数 {位置:UI.位置移动类型, 横向偏移:number, 纵向偏移:number}
function M:移动_到目标控件(目标控件, 参数)
    参数.位置 = 参数.位置 or '左'
    if self.player ~= y3.玩家.获取本地玩家() then
        return
    end
    目标控件.player = self.player
    local 自身宽度 = self:获取_真实宽度() / 2
    local 自身高度 = self:获取_真实高度() / 2
    local 目标宽度 = 目标控件:获取_真实宽度() / 2
    local 目标高度 = 目标控件:获取_真实高度() / 2
    local 目标绝对x = 目标控件:获取_本地绝对坐标X()
    local 目标绝对y = 目标控件:获取_本地绝对坐标Y()
    local 横坐标, 纵坐标
    local 横向分辨率 = y3.控件.获取_窗口宽度()
    local 纵向分辨率 = y3.控件.获取_窗口高度()


    if 参数.位置 == '上' then
        横坐标 = 目标绝对x
        纵坐标 = 目标绝对y + 目标高度 + 自身高度
    elseif 参数.位置 == '下' then
        横坐标 = 目标绝对x
        纵坐标 = 目标绝对y - 目标高度 - 自身高度
    elseif 参数.位置 == '右' then
        横坐标 = 目标绝对x + 自身宽度 + 目标宽度
        纵坐标 = 目标绝对y
    elseif 参数.位置 == '左' then
        横坐标 = 目标绝对x - 自身宽度 - 目标宽度
        纵坐标 = 目标绝对y
    end

    local 纵向修正 = 纵向分辨率 - 纵坐标 - 自身高度
    if 纵向修正 < 0 then
        纵坐标 = 纵坐标 + 纵向修正
    elseif 纵坐标 < 自身高度 then
           纵坐标 = 自身高度
    end


    self:设置_绝对坐标(横坐标 + px.工具.转换真实宽度((参数.横向偏移 or 0)), 纵坐标 + px.工具.转换真实高度((参数.纵向偏移 or 0)))
end
