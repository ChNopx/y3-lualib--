---@diagnostic disable: undefined-field
---@class 事件
local m = Class '事件'
---@class  事件: CustomEvent
Extends('事件', 'CustomEvent')

---@overload fun(self:self, 名称:string,回调:fun(触发器:Trigger, 参数:{})):Trigger
---@overload fun(self:self,名称:string,标识:string,回调:fun(触发器:Trigger, 参数:{})):Trigger
function m:事件(...)
    local 触发器 = self:事件C(...)
    return 触发器
end

---@overload fun(self:self,名称:string,参数:{})
---@overload fun(self:self,名称:string,标识:any,参数:{})
function m:发起事件(名称, 标识, 参数)
    if 参数 == nil then
        self:发起事件C(名称, 标识)
    else
        self:发起事件CP(名称, { 标识 }, 参数)
    end
end

---@overload fun(self:self,名称:string,参数:{}):any, any, any, any
---@overload fun(self:self,名称:string,标识:{},参数:{}):any, any, any, any
function m:发起回执事件(名称, 标识, 参数)
    if 参数 == nil then
        return self:发起事件CD(名称, 标识)
    else
        return self:发起事件CPD(名称, 标识, 参数)
    end
end

