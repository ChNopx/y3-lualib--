---@class 粒子特效
local m = Class '粒子特效'

local m_隐藏点 = y3.点.创建自坐标(0, 0, 0)

local function m_创建单位()
    local 单位 = y3.单位.创建(y3.玩家(1), 134242691, m_隐藏点, 0)
    return 单位
end

m.单位池 = {}

---@class 粒子特效.NEW
---@field 特效类型 py.SfxKey|integer 特效类型id
---@field 创建点 Point
---@field 朝向? number 方向
---@field 缩放? number 缩放
---@field 持续时间? number 持续时间
---@field 高度? number 高度，只有当 `target` 的类型为点时有效
---@field 销毁过渡? boolean 销毁时，是否有过度

---@param 参数 粒子特效.NEW
function m:__init(参数)
    if #m.单位池 == 0 then
        ---@type Unit
        self.局_单位 = m_创建单位()
    else
        ---@type Unit
        self.局_单位 = 表.移除索引(m.单位池)
    end
    ---@cast 参数 + Particle.Param.CreateChine
    参数.单位或点 = self.局_单位
    参数.单位挂接点 = 'root'
    self.局_单位:移动_强制传送到点(参数.创建点, false)
    self.局_特效 = y3.粒子特效.创建到单位或点(参数)
end

function m:移除()
    表.插入值(m.单位池, self.局_单位)
    self.局_特效:移除()
    self.局_单位:移动_强制传送到点(m_隐藏点, false)
    Delete(self)
end

---@param x number X轴角度
---@param y number Y轴角度
---@param z number Z轴角度
function m:设置旋转角度(x, y, z)
    self.局_特效:设置旋转角度(x, y, z)
end

function m:获取当前所在点()
    return self.局_单位:获取当前所在点()
end

---@param direction number 方向
function m:设置朝向(direction)
    self:设置朝向(direction)
end

---@param x number X轴缩放
---@param y number Y轴缩放
---@param z number Z轴缩放
function m:设置缩放比例(x, y, z)
    self.局_特效:设置缩放比例(x, y, z)
end

---@param height number 高度
function m:设置高度(height)
    self.局_特效:设置高度(height)
end

--设置坐标
---@param point Point 点
function m:设置坐标(point)
    self:设置坐标(point)
end

---@param speed number 速度
function m:设置动画速度(speed)
    self.局_特效:设置动画速度(speed)
end

---@param duration number 持续时间
function m:设置持续时间(duration)
    self.局_特效:设置持续时间(duration)
end

--设置特效颜色
---@param x number # x
---@param y number # y
---@param z number # z
---@param w number # w
function m:设置颜色(x, y, z, w)
    self.局_特效:设置颜色(x, y, z, w)
end

---@param visible boolean # 开关
function m:设置是否可见(visible)
    self.局_特效:设置是否可见(visible)
end

---@param 参数 Mover.CreateData.Line
function m:创建直线运动器(参数)
    self.局_单位:创建直线运动器(参数)
end

---@class Particle
local 粒子特效 = Class 'Particle'

---@param 参数 粒子特效.NEW
---@return 粒子特效
function 粒子特效.创建到运动器(参数)
    ---@class 粒子特效
    local 特效 = New '粒子特效' (参数)

    return 特效
end
