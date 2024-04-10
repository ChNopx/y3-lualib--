---@class Player
---@field package _selecting_unit? Unit
---@field package _selecting_group? UnitGroup
local M = Class 'Player'

---@return Unit?
function M:get_selecting_unit()
    return self._selecting_unit
end

---@return UnitGroup?
function M:get_selecting_unit_group()
    return self._selecting_group
end

y3.游戏:事件('选中-单位', function(trg, data)
    data.触发玩家._selecting_unit = data.触发单位
    data.触发玩家._selecting_group = nil
end)

y3.游戏:事件('选中-单位组', function(trg, data)
    data.触发玩家._selecting_unit = data.unit_group_id_list:获取第一个单位()
    data.触发玩家._selecting_group = data.unit_group_id_list
end)
