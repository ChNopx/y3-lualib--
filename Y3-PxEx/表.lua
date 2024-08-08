---@class 表
local m = Class '表'

---@overload fun(表:table,值:any)
---@overload fun(表:table,位置:integer,值:any)
function m.插入值(...)
    table.insert(...)
end

---@overload fun(表:table, 值:any)
---@overload fun(表:table, 索引:integer, 值:any)
function m.插入值_非重(...)
    local 表, 索引, 值 = ...
    if not m.查找值(表, 值 or 索引) then
        table.insert(...)
    end
end

---@param 数组 any[]
---@param 值 any
function m.移除索引值(数组, 值)
    for i = 1, #数组 do
        if 数组[i] == 值 then
            table.remove(数组, i)
            return
        end
    end
end

function m.移除键值(array, 值)
    for key, value in pairs(array) do
        if value == 值 then
            array[key] = nil
            return
        end
    end
end

---@overload fun(表:table):any
---@overload fun(表:table, 位置:integer):any
function m.移除索引(...)
    return table.remove(...)
end

---@param array table
---@param 值 any
---@return integer|string?
function m.查找值(array, 值)
    for key, value in pairs(array) do
        if value == 值 then
            return key
        end
    end
    return nil
end

---@param array table[]
---@param 值回调 fun(key, value):boolean
---@return any?
function m.查找值P(array, 值回调)
    for key, value in pairs(array) do
        if 值回调(key, value) then
            return key
        end
    end
    return nil
end

---@param ... any
---@return table
---@nodiscard
function m.创建自不定长参数(...)
    return table.pack(...)
end

---@generic T
---@param 表 T[]
---@param 开始位置? integer
---@param 结束位置? integer
---@return T ...
---@nodiscard
function m.获取不定长参数(表, 开始位置, 结束位置)
    return table.unpack(表, 开始位置, 结束位置)
end

---提供一个列表，其所有元素都是字符串或数字，返回字符串 list[i]..sep..list[i+1] ··· sep..list[j]。
---@overload fun(表:table,分隔符?:string,开始位置?:integer,结束位置?:integer)
---@return string
---@diagnostic disable-next-line: incomplete-signature-doc
function m.连接(...)
    return table.concat(...)
end

---@param 表 table 一维表,数组
---@param 分隔符 string
---@return string|nil
function m.连接P(表, 分隔符)
    local 返回文本 = ''
    if 表 then
        for _, value in ipairs(表) do
            if value ~= nil then
                if type(value) == 'table' and value ['__class__'] then
                    返回文本 = 返回文本 .. m.获取结构文本(表, {y3tostring=true}) .. 分隔符
                else
                    返回文本 = 返回文本 .. tostring(value) .. 分隔符
                end
            else
                返回文本 = 返回文本 .. 'nil' .. 分隔符
            end
        end
        return 返回文本
    end
    return nil
end

---表_获取最小可用索引
---@param 表 table
---@param 最大值? integer|nil 查找最大值以下的
---@return integer|nil
function m.获取最小可用索引(表, 最大值)
    最大值 = 最大值 or 100
    for i = 1, 最大值, 1 do
        if 表[i] == nil then
            return i
        end
    end
    return nil
end

---@param 表 table
---@param 值回调 fun(v:any):number
---@return number
function m.获取_最大值(表, 值回调)
    local r = -math.huge
    local num
    for key, value in pairs(表) do
         num = 值回调(value)
        if num > r then
            r = num
        end
    end
    return num
end

---@param 表 table
---@param 值回调 fun(v:any):number
---@return number
function m.获取_最小值(表, 值回调)
    local r = math.huge
    local num
    for key, value in pairs(表) do
         num = 值回调(value)
        if num < r then
            r = num
        end
    end
    return num
end

---@param 表 table
---@param ... {名:string, 值:fun(k:any, v:any):number}
---@return {[string]:number}
function m.获取最大值P(表, ...)
    local r = {}
    local k, v
    for _, 配置项 in ipairs({ ... }) do
        k = 配置项.名
        r[k] = -math.huge
    end
    for key, value in pairs(表) do
        for _, 配置项 in ipairs({ ... }) do
            k = 配置项.名
            v = 配置项.值(key, value)
            if r[k] < v then
                r[k] = v
            end
        end
    end
    return r
end

---@param 表 table
---@param ... fun(k:any, v:any):string,number
---@return {[string]:number}
function m.获取最小值P(表, ...)
    local r = {}
    local 参数数量 = select("#", ...)
    local k, v
    for i = 1, 参数数量 do
        k, v = select(i, ...)(i, {})
        r[k] = math.huge
    end
    for key, value in pairs(表) do
        for i = 1, 参数数量 do
            k, v = select(i, ...)(key, value)
            if r[k] > v then
                r[k] = v
            end
        end
    end
    return r
end

---@param 文本 string
---@return table
function m.创建自JSON文本(文本)
    return y3.json.decode(文本)
end

---@param 表 table
---@return string
function m.获取JSON文本(表)
    return y3.json.encode(表)
end

---表_到字符串
---@param 表 table
---@param 配置? {y3tostring:boolean,    alignment:unknown,    deep:unknown,    format:unknown,    longStringKey:unknown,    loop:unknown,    noArrayKey:unknown,    number:unknown,    sorter:unknown}
---@return string
function m.获取结构文本(表, 配置)
    return y3.util.dump(表, 配置)
end

---@param 表 table
---@return integer 长度
function m.获取长度(表)
    local 长度 = 0
    for key, value in pairs(表) do
        长度 = 长度 + 1
    end
    return 长度
end

---深度拷贝表,复制表,不处理元素,
---@param 旧表 table
---@param 新表? table
---@return table 返回的新表
function m.复制(旧表, 新表)
    return y3.util.deepCopy(旧表, 新表)
end

---@class 表
---@field 设置路径值 fun(表:table, ...?:any, 值:any):any
---@field 插入路径值 fun(表:table, ...?:any, 值:any)
---@field 移除路径值 fun(表:table, ...?:any?):any

function m.设置路径值(表, ...)
    local 字段数组 = m.创建自不定长参数(...)
    local 当前表 = 表
    if 表 == nil then
        调试错误('传入的table不能为nil')
        return
    end
    if 字段数组.n > 1 then
        for i = 1, 字段数组.n - 2 do
            if 当前表[字段数组[i]] == nil or type(当前表[字段数组[i]]) ~= "table" then
                当前表[字段数组[i]] = {}
            end
            当前表 = 当前表[字段数组[i]]
        end
        当前表[字段数组[字段数组.n - 1]] = 字段数组[字段数组.n]
        -- elseif 字段数组.n > 0 then
        --     当前表 = 字段数组[字段数组.n]
    else
        调试错误('至少输入1个字段和1个值')
    end
    return 字段数组[字段数组.n]
end

function m.移除路径值(表, ...)
    local 字段数组 = m.创建自不定长参数(...)
    local 当前表 = 表
    if 字段数组.n > 0 then
        for i = 1, 字段数组.n - 1 do
            if 当前表[字段数组[i]] == nil or type(当前表[字段数组[i]]) ~= "table" then
                return
            end
            当前表 = 当前表[字段数组[i]]
        end
        当前表[字段数组[字段数组.n]] = nil
    else
        调试错误('至少输入1个字段')
    end
end

function m.插入路径值(表, ...)
    local 字段数组 = m.创建自不定长参数(...)
    local 当前表 = 表
    if 字段数组.n > 1 then
        for i = 1, 字段数组.n - 1 do
            if 当前表[字段数组[i]] == nil then
                当前表[字段数组[i]] = {}
            end
            当前表 = 当前表[字段数组[i]]
        end
        table.insert(当前表, 字段数组[字段数组.n])
    elseif 字段数组.n > 0 then
        table.insert(当前表, 字段数组[字段数组.n])
    else
        调试错误('至少输入1个字段和1个值')
    end
end

---@overload fun(表:table, ...?:any?):any
function m.获取路径值(表, ...)
    local 字段数组 = m.创建自不定长参数(...)
    local 当前表 = 表
    if 字段数组.n > 0 then
        for i = 1, 字段数组.n do
            if 当前表 == nil then
                return nil
            end
            当前表 = 当前表[字段数组[i]]
        end
        return 当前表
    else
        return 当前表
    end
end

function m.增加_路径值(表, ...)
    local 字段数组 = m.创建自不定长参数(...)
    local 当前表 = 表
    if 表 == nil then
        调试错误('传入的table不能为nil')
        return
    end
    if 字段数组.n > 1 then
        for i = 1, 字段数组.n - 2 do
            if 当前表[字段数组[i]] == nil or type(当前表[字段数组[i]]) ~= "table" then
                当前表[字段数组[i]] = {}
            end
            当前表 = 当前表[字段数组[i]]
        end
        local 原始值 = 当前表[字段数组[字段数组.n - 1]] or 0
        当前表[字段数组[字段数组.n - 1]] = 字段数组[字段数组.n] + 原始值
    else
        调试错误('至少输入1个字段和1个值')
    end
    return 字段数组[字段数组.n]
end

---@generic t
---@param tbl t[] | {[any]:t}
---@param fun fun(a:t, b:t):boolean 同table.sort a > b = 降序, a < b = 升序
---@return table 排序后的索引数组
function m.排序(tbl, fun)
    local arr = {}
    for key, value in pairs(tbl) do
        arr[#arr + 1] = key
    end
    table.sort(arr, function(a, b)
        return fun(tbl[a], tbl[b])
    end)
    return arr
end

---@param 待排序表 table
---@param 数值回调 fun(k:integer|string,v:any):number
---@param 遍历回调? fun(i:integer,k:integer|string,v:any):boolean?
---@param 降序? boolean 默认升序
---@return any any
function m.排序_废弃的(待排序表, 数值回调, 遍历回调, 降序)
    local 临时表, 插入值
    local 返回表 = {}
    if 降序 then
        临时表 = { { 对比值 = -9999999999 } }
        插入值 = function(key, 对比值)
            for index, value in ipairs(临时表) do
                if 对比值 > value.对比值 then
                    m.插入值(临时表, index, { 原字段 = key, 对比值 = 对比值 })
                    m.插入值(返回表, key)
                    break
                end
            end
        end
    else
        临时表 = { { 对比值 = 9999999999 } }
        插入值 = function(key, 对比值)
            for index, value in ipairs(临时表) do
                if 对比值 <= value.对比值 then
                    m.插入值(临时表, index, { 原字段 = key, 对比值 = 对比值 })
                    m.插入值(返回表, key)
                    break
                end
            end
        end
    end

    for key, value in pairs(待排序表) do
        local 对比值 = 数值回调(key, value)
        if 对比值 then
            插入值(key, 对比值)
        else
            插入值(key, 1)
        end
    end
    table.remove(临时表)
    if 遍历回调 then
        for index, value in ipairs(临时表) do
            if 遍历回调(index, value.原字段, 待排序表[value.原字段]) then
                break
            end
        end
    end
    return 返回表
end

---@param a table
---@param b table
---@param 有序? boolean
---@return table
function m.合并(a, b, 有序)
    if 有序 then
        for i = 1, #b do
            a[#a + 1] = b[i]
        end
    else
        for k, v in pairs(b) do
            a[k] = v
        end
    end
    return a
end

---@param 名称 string
---@return table
function m.获取于物编(名称)
    return y3.游戏.get_table(名称)
end

return m
