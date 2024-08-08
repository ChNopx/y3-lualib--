---@class 字符串
local m = Class '字符串'

到字符串 = tostring
m.替换 = string.gsub
m.匹配 = string.match
m.查找 = string.find
m.获取长度 = string.len

--[[
%c - 接受一个数字,并将其转化为ASCII码表中对应的字符
%d, %i - 接受一个数字并将其转化为有符号的整数格式
%o - 接受一个数字并将其转化为八进制数格式
%u - 接受一个数字并将其转化为无符号整数格式
%x - 接受一个数字并将其转化为十六进制数格式,使用小写字母
%X - 接受一个数字并将其转化为十六进制数格式,使用大写字母
%e - 接受一个数字并将其转化为科学记数法格式,使用小写字母e
%E - 接受一个数字并将其转化为科学记数法格式,使用大写字母E
%f - 接受一个数字并将其转化为浮点数格式
%g(%G) - 接受一个数字并将其转化为%e(%E,对应%G)及%f中较短的一种格式
%q - 接受一个字符串并将其转化为可安全被Lua编译器读入的格式
%s - 接受一个字符串并按照给定的参数格式化该字符串

为进一步细化格式, 可以在%号后添加参数.参数将以如下的顺序读入:

(1) 符号:一个+号表示其后的数字转义符将让正数显示正号.默认情况下只有负数显示符号.
(2) 占位符: 一个0,在后面指定了字串宽度时占位用.不填时的默认占位符是空格.
(3) 对齐标识: 在指定了字串宽度时,默认为右对齐,增加-号可以改为左对齐.
(4) 宽度数值
(5) 小数位数/字串裁切:在宽度数值后增加的小数部分n,若后接f(浮点数转义符,如%6.3f)则设定该浮点数的小数只保留n位,若后接s(字符串转义符,如%5.3s)则设定该字符串只显示前n位.

    格式化文本('%-15s', '123') = '           123'
    格式化文本('%.0f', 0.123) = 0


]]
格式化文本 = string.format


---@param 原文本 string
---@param 检查文本 string[]
---@return boolean 包含任意一个返回true
function m.是否包含多个文本(原文本, 检查文本)
    for index, value in ipairs(检查文本) do
        -- print(index, value)
        -- if string.find(原文本, value) then
        --     return true
        -- end
        if 原文本 == value then
            return true
        end
    end
    return false
end


function m.获取字节长度(str)
    local curIndex = 0;
    local i = 1;
    local lastCount = 1;
    repeat
        lastCount = m.获取字符字节数(str, i)
        i = i + lastCount;
        curIndex = curIndex + 1;
    until (lastCount == 0);
    return curIndex - 1;
end

local function __SubStringGetTrueIndex(str, index)
    local curIndex = 0;
    local i = 1;
    local lastCount = 1;
    repeat
        lastCount = m.获取字符字节数(str, i)
        i = i + lastCount;
        curIndex = curIndex + 1;
    until (curIndex >= index);
    return i - lastCount;
end

function m.获取字符字节数(str, index)
    local curByte = string.byte(str, index)
    local byteCount = 1;
    if curByte == nil then
        byteCount = 0
    elseif curByte > 0 and curByte <= 127 then
        byteCount = 1
    elseif curByte >= 192 and curByte <= 223 then
        byteCount = 2
    elseif curByte >= 224 and curByte <= 239 then
        byteCount = 3
    elseif curByte >= 240 and curByte <= 247 then
        byteCount = 4
    end
    return byteCount;
end

---@overload fun(文本: string|number, 开始位置: integer, 结束位置?: integer): string 开始位置起始为1 结束位置默认-1全部截取, 可以为负数截取至倒数
function m.截取(文本, 开始位置, 结束位置)
    if 开始位置 < 0 then
        开始位置 = m.获取字节长度(文本) + 开始位置 + 1;
    end

    if 结束位置 ~= nil and 结束位置 < 0 then
        结束位置 = m.获取字节长度(文本) + 结束位置 + 1;
    end

    if 结束位置 == nil then
        return string.sub(文本, __SubStringGetTrueIndex(文本, 开始位置));
    else
        return string.sub(文本, __SubStringGetTrueIndex(文本, 开始位置), __SubStringGetTrueIndex(文本, 结束位置 + 1) - 1);
    end
end

---@param s any
---@param 分隔符 any
---@return string[]
function m.分割(s, 分隔符)
    local start = 1
    local arr = {}
    if 分隔符 == nil then
        local r = 字符串.截取(s, 1, 1)
        for i = 1, utf8.len(s) do
            table.insert(arr, 字符串.截取(s, i, i))
        end
        return arr
    end

    while true do
        local pos = string.find(s, 分隔符, start, true)
        if not pos then
            break
        end
        table.insert(arr, string.sub(s, start, pos - 1))
        start = pos + string.len(分隔符)
    end

    table.insert(arr, string.sub(s, start))
    return arr
end

---@param 文本 string
---@param 模板 string
---@param 包含模板? boolean
---@return string
function m.取左边文本(文本, 模板, 包含模板)
    local s = m.匹配(文本, '.-' .. 模板, 1)
    if s then
        if 包含模板 then
            return s
        end
        s = m.替换(s, 模板, '')
        return s
    end
    return 文本
end

---@param 文本 string
---@param 模板 string
---@param 包含模板? boolean
---@return string
function m.取右边文本(文本, 模板, 包含模板)
    local s = m.匹配(文本, 模板 .. '.*', 1)
    if s then
        if 包含模板 then
            return s
        end
        s = m.替换(s, 模板, '')
        return s
    end
    return 文本
end

---@param 文本 string
---@param 左边文本 string
---@param 右边文本 string
---@param 包含模板? boolean
---@return string?
function m.取中间文本(文本, 左边文本, 右边文本, 包含模板)
    local s = m.匹配(文本, 左边文本 .. '.*' .. 右边文本, 1)
    if s then
        if 包含模板 then
            return s
        else
            s = m.替换(s, 左边文本, '')
            s = m.替换(s, 右边文本, '')
            return s
        end
    end
    return nil
end

---@param s string
---@return string
function m.转竖排文字(s)
    local r = 字符串.截取(s, 1, 1)
    for i = 2, utf8.len(s) do
        r = r .. '\n' .. 字符串.截取(s, i, i)
    end
    return r
end

-- ---@param 内容 string  格式化文本 =  获得经验{经验} {150}
-- ---@param ... table <string, 枚举.颜色>[]
-- ---@return string
-- 字符串格式化_彩色 = function(内容, ...)
--     local 颜色数组 = 表_组包(...)
--     local 返回内容
--     for index, value in ipairs(颜色数组) do
--         if value then
--             local 替换文本 = " <span style = 'color: " .. value[2] .. ";'> " .. 到字符串(value[1]) .. " </span> "
--             返回内容 = 字符串_替换(内容, "{}", 替换文本, 1)
--         end
--     end
--     -- if not 返回内容 then
--     --     返回内容 = "<span> " .. 内容 .. " </span>"
--     -- end

--     调试输出(返回内容)
--     return "<p> " .. 返回内容 .. " </p>"
-- end


---@param str string  格式化文本 =  获得经验{经验} {150}
---@param ... table <string, string, integer>[] -- 内容, 颜色, 长度
---@return string
格式化文本彩色 = function(str, ...)
    local 颜色数组 = 表.创建自不定长参数(...)
    local 返回内容 = str
    ---@type string, string?, integer
    local 替换文本, 颜色, 长度
    for index, value in ipairs(颜色数组) do
        if value[3] then
            颜色 = value[2]
            长度 = value[3]
        elseif value[2] then
            if type(value[2]) == 'number' then
                长度 = value[2]
                颜色 = nil
            else
                颜色 = value[2]
            end
        end

        if 颜色 then
            替换文本 = 颜色 .. '' .. 到字符串(value[1])
        else
            替换文本 = 到字符串(value[1])
        end
        if 长度 then
            local 文本长度 = string.len(替换文本)
            if 文本长度 < 长度 then
                for i = 1, 长度 - 文本长度 do
                    替换文本 = ' ' .. 替换文本
                end
            end
        end
        返回内容 = m.替换(返回内容, '{}', 替换文本, 1)
    end
    return 返回内容
end

---@param 字体大小 integer
---@param 内容 string
---@return number
local function 获取文本宽度(字体大小, 内容)
    local r = 0
    local 字体大小2 = 字体大小 * 0.66
    local curIndex = 0;
    local i = 1;
    local lastCount = 1;
    repeat
        lastCount = m.获取字符字节数(内容, i)
        i = i + lastCount;
        if lastCount > 1 then
            r = r + 字体大小
        else
            r = r + 字体大小2
        end
        curIndex = curIndex + 1;
    until (lastCount == 0);
    return r
end

---@param 内容 string
---@param 字体大小 integer
---@param 最大宽度 number
---@param 保留换行? boolean
---@return number 宽度, number 高度
function m.获取文本画板尺寸(内容, 字体大小, 最大宽度, 保留换行)
    内容 = m.替换(内容, '#%w%w%w%w%w%w', '')
    local 行高 = 字体大小 * 1.38
    if 内容 == '' then
        return 0, 0
    end
    if not 保留换行 then
        local 总长度 = 获取文本宽度(字体大小, 内容)
        if 总长度 <= 最大宽度 then
            return 总长度, 行高
        else
            return 最大宽度, 行高 * 数学.向上取整(总长度 / 最大宽度)
        end
    else
        local 内容数组 = m.分割(内容, '\n')
        local 返回高度 = 0
        local 返回行宽 = 0
        for index, value in ipairs(内容数组) do
            local 当前文本长度 = m.获取长度(value) * 字体大小 / 2
            if 当前文本长度 > 返回行宽 then
                返回行宽 = 当前文本长度
            end
            if 当前文本长度 > 最大宽度 then
                返回高度 = 返回高度 + 行高 * 数学.向下取整(当前文本长度 / 最大宽度)
            end
        end
        返回高度 = 返回高度 + #内容数组 * 行高
        return 返回行宽, 返回高度
    end
end

return m
