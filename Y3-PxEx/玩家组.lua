---@class PlayerGroup
local m = y3.玩家组

function m.创建于玩家或玩家组(玩家或玩家组)
    if 玩家或玩家组.type == 'player' then
        -- local 返回玩家组 = m.创建空玩家组()
        local 返回玩家组 = y3.玩家组.获取所有非中立玩家():清空()
        ---@diagnostic disable-next-line: param-type-mismatch
        返回玩家组:添加玩家(玩家或玩家组)
        return 返回玩家组
    else
        ---@diagnostic disable-next-line: return-type-mismatch
        return 玩家或玩家组
    end
end
