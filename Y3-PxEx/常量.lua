-- 常量补充扩展
---@class y3.Const
local m = y3.const

---@alias y3.Const.动画名称 '攻击'|'技能'|'受击'|string

---@enum (key) y3.Const.镜头移动类型
m.镜头移动类型 = {
    ['匀速'] = 0,
    ['匀加速'] = 1,
    ['匀减速'] = 2,
}

---@enum (key) y3.Const.镜头角度类型
m.镜头角度类型 = {
    ['俯视角'] = 1,
    ['滚角'] = 2,
    ['导航角'] = 3,
}

---@enum (key) y3.Const.ModelKey
m.modelKey = {}


---@enum(key) y3.Const.unitKeys
m.unitKeys = {}

---@enum(key) y3.Const.abilityKeys
m.abilityKeys = {}


---@enum(key) y3.Const.itemKeys
m.itemKeys = {}


---@enum(key) y3.Const.projectileKeys
m.projectileKeys = {}


---@enum(key) y3.Const.buffKeys
m.buffKeys = {}

---@enum(key) y3.Const.SceneUI
m.SceneUI = {}

return m
