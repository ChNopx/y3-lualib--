调试输出 = log.debug
调试警告 = log.warn
调试错误 = log.error

数学 = require 'y3.game.math'
表 = require 'Y3-PxEx.表'
字符串 = require 'Y3-PxEx.字符串'

require 'Y3-PxEx.事件'

require 'Y3-PxEx.常量'
require 'Y3-PxEx.重载'

重载清理 = y3.reload.重载对象

require '模块.玩家数据'
require 'Y3-PxEx.中心计时器'
require 'Y3-PxEx.中心计时器_本地'
require 'Y3-PxEx.时间操作'
require 'Y3-PxEx.玩家组'
require 'Y3-PxEx.控件'
require 'Y3-PxEx.粒子特效'


--[[示例
    
    local function sayHello()
        print("hello")
    end
    local function sayNo()
    　　print("no")
    end
    local name = "leo"
    local ret = switch(name) {
    　　["lee"] = sayNo,--此处value可以是任何类型：nil、number、function、table、thread、userdata、string、boolean，如果是function或者thread，则先执行再返回，其他类型直接返回
    　　["leo"] = sayHello,
    　　["woof"] = function() print("woof") end,
    }　　--打印：hello

    搭配 packfunc 使用
    local name = "leo"
    swtich(name){
    　　["lee"] = packfunc(print,"no"),
    　　["leo"] = packfunc(print,"hello"),
    　　["woof"] = packfunc(print,"woof"),
    }

]]
---@param val any
---@return fun(table:{[string|integer]:any}):any
function switch(val)
    local function innerfunc(t)
        for key, value in pairs(t) do
            if key == val then
                if type(value) == "function" then
                    return value()
                elseif type(value) == "thread" then
                    return coroutine.resume(value)
                else
                    return value
                end
            end
        end
    end
    return innerfunc
end


--[[
　　把函数跟实参打包在一起的功能，返回值是一个function。
　　local prtNm = packfunc(print,"name")
　　prtNm() -- 打印：name
]]
---@param func fun(...?):any?
---@param ... any
---@return any
function packfunc(func, ...)
    local _argsSuper = { ... }
    local _c1 = select("#", ...)
    local function innerFunc(...)
        local args = { ... }
        local argsOut = { table.unpack(_argsSuper, 1, _c1) }
        for i, v in pairs(args) do
            argsOut[_c1 + i] = v
        end
        return func(table.unpack(argsOut, 1, #argsOut))
    end
    return innerFunc
end
