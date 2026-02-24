
--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple Wave Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v2.ZIndex = v2.ZIndex + 1
    v1.Image = "rbxassetid://5946399128"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v2.ZIndex = v2.ZIndex + 1
    v1.Image = "rbxassetid://4507869909"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black Wave Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v2.ZIndex = v2.ZIndex + 1
    v1.Image = "rbxassetid://5946399128"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Interface.Views.Template
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v2 = game.Players.LocalPlayer
local _ = game.ReplicatedStorage.data[v2.UserId]
function v1.Setup(_, _) end
function v1.Start(_, _) end
function v1.Destroy(_) end
return v1

--========================================
-- ModuleScript : ReplicatedStorage.Packages.lemonsignal
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return require(script.Parent._Index["data-oriented-house_lemonsignal@1.11.0"].lemonsignal)

--========================================
-- ModuleScript : ReplicatedStorage.Packages.promise
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return require(script.Parent._Index["evaera_promise@4.0.0"].promise)

--========================================
-- ModuleScript : ReplicatedStorage.Packages._Index.data-oriented-house_lemonsignal@1.11.0.lemonsignal
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
local function v_u_5(p2, p3, ...)
    -- upvalues: (copy) v_u_1
    p2(...)
    local v4 = v_u_1
    table.insert(v4, p3)
end
local function v_u_6()
    -- upvalues: (copy) v_u_5
    while true do
        v_u_5(coroutine.yield())
    end
end
local v_u_7 = {}
v_u_7.__index = v_u_7
function v_u_7.Disconnect(p8)
    if p8.Connected then
        p8.Connected = false
        local v9 = p8._next
        local v10 = p8._prev
        if v9 then
            v9._prev = v10
        end
        if v10 then
            v10._next = v9
        end
        local v11 = p8._signal
        if v11._head == p8 then
            v11._head = v9
        end
    end
end
function v_u_7.Reconnect(p12)
    if not p12.Connected then
        p12.Connected = true
        local v13 = p12._signal
        local v14 = v13._head
        if v14 then
            v14._prev = p12
        end
        v13._head = p12
        p12._next = v14
        p12._prev = false
    end
end
local v_u_15 = {}
v_u_15.__index = v_u_15
local v_u_16, v_u_17
if task then
    local v18 = Instance.new("BindableEvent")
    v_u_16 = v18.Event.Connect
    v_u_17 = v18.Event:Connect(function() end).Disconnect
    v18:Destroy()
else
    v_u_17 = nil
    v_u_16 = nil
end
local function v_u_26(p19, p20, ...)
    -- upvalues: (copy) v_u_7
    local v21 = p19._head
    local v22 = { ... }
    local v23 = {
        ["Connected"] = true,
        ["_signal"] = p19,
        ["_fn"] = p20
    }
    if #v22 == 0 then
        v22 = false
    end
    v23._varargs = v22
    v23._next = v21
    v23._prev = false
    local v24 = v_u_7
    local v25 = setmetatable(v23, v24)
    if v21 then
        v21._prev = v25
    end
    p19._head = v25
    return v25
end
local v43 = task and function(p27)
    -- upvalues: (copy) v_u_26
    local v_u_28 = coroutine.running()
    local v_u_29 = nil
    v_u_29 = v_u_26(p27, function(...)
        -- upvalues: (ref) v_u_29, (copy) v_u_28
        local v30 = v_u_29
        if v30.Connected then
            v30.Connected = false
            local v31 = v30._next
            local v32 = v30._prev
            if v31 then
                v31._prev = v32
            end
            if v32 then
                v32._next = v31
            end
            local v33 = v30._signal
            if v33._head == v30 then
                v33._head = v31
            end
        end
        if coroutine.status(v_u_28) == "suspended" then
            task.spawn(v_u_28, ...)
        end
    end)
    return coroutine.yield()
end or function(p34)
    -- upvalues: (copy) v_u_26
    local v_u_35 = coroutine.running()
    local v_u_36 = nil
    v_u_36 = v_u_26(p34, function(...)
        -- upvalues: (ref) v_u_36, (copy) v_u_35
        local v37 = v_u_36
        if v37.Connected then
            v37.Connected = false
            local v38 = v37._next
            local v39 = v37._prev
            if v38 then
                v38._prev = v39
            end
            if v39 then
                v39._next = v38
            end
            local v40 = v37._signal
            if v40._head == v37 then
                v40._head = v38
            end
        end
        local v41, v42 = coroutine.resume(v_u_35, ...)
        if not v41 then
            error(v42, 0)
        end
    end)
    return coroutine.yield()
end
local v_u_64 = task and function(p44, ...)
    -- upvalues: (copy) v_u_1, (copy) v_u_6
    local v45 = p44._head
    while v45 do
        local v46
        if #v_u_1 > 0 then
            v46 = v_u_1[#v_u_1]
            v_u_1[#v_u_1] = nil
        else
            v46 = coroutine.create(v_u_6)
            coroutine.resume(v46)
        end
        if v45._varargs then
            local v47 = v45._varargs
            local v48 = #v47
            local v49 = v48
            for _, v50 in { ... } do
                v48 = v48 + 1
                v47[v48] = v50
            end
            task.spawn(v46, v45._fn, v46, table.unpack(v47))
            for v51 = v48, v49 + 1, -1 do
                v47[v51] = nil
            end
        else
            task.spawn(v46, v45._fn, v46, ...)
        end
        v45 = v45._next
    end
end or function(p52, ...)
    -- upvalues: (copy) v_u_1, (copy) v_u_6
    local v53 = p52._head
    while v53 do
        local v54
        if #v_u_1 > 0 then
            v54 = v_u_1[#v_u_1]
            v_u_1[#v_u_1] = nil
        else
            v54 = coroutine.create(v_u_6)
            coroutine.resume(v54)
        end
        if v53._varargs then
            local v55 = v53._varargs
            local v56 = #v55
            local v57 = v56
            for _, v58 in { ... } do
                v56 = v56 + 1
                v55[v56] = v58
            end
            local v59, v60 = coroutine.resume(v54, v53._fn, v54, table.unpack(v55))
            if not v59 then
                print(string.format("%s\nstacktrace:\n%s", v60, debug.traceback()))
            end
            for v61 = v56, v57 + 1, -1 do
                v55[v61] = nil
            end
        else
            local v62, v63 = coroutine.resume(v54, v53._fn, v54, ...)
            if not v62 then
                print(string.format("%s\nstacktrace:\n%s", v63, debug.traceback()))
            end
        end
        v53 = v53._next
    end
end
function v_u_15.new()
    -- upvalues: (copy) v_u_15
    local v65 = v_u_15
    return setmetatable({
        ["_head"] = false
    }, v65)
end
function v_u_15.wrap(p66)
    -- upvalues: (copy) v_u_15, (ref) v_u_16, (copy) v_u_64
    local v67 = v_u_15
    local v_u_68 = setmetatable({
        ["_head"] = false
    }, v67)
    v_u_68.RBXScriptConnection = v_u_16(p66, function(...)
        -- upvalues: (ref) v_u_64, (copy) v_u_68
        v_u_64(v_u_68, ...)
    end)
    return v_u_68
end
v_u_15.Connect = v_u_26
function v_u_15.Once(p69, p_u_70, ...)
    -- upvalues: (copy) v_u_26
    local v_u_71 = nil
    v_u_71 = v_u_26(p69, function(...)
        -- upvalues: (ref) v_u_71, (copy) p_u_70
        local v72 = v_u_71
        if v72.Connected then
            v72.Connected = false
            local v73 = v72._next
            local v74 = v72._prev
            if v73 then
                v73._prev = v74
            end
            if v74 then
                v74._next = v73
            end
            local v75 = v72._signal
            if v75._head == v72 then
                v75._head = v73
            end
        end
        p_u_70(...)
    end, ...)
    return v_u_71
end
v_u_15.Wait = v43
v_u_15.Fire = v_u_64
function v_u_15.DisconnectAll(p76)
    local v77 = p76._head
    while v77 do
        if v77.Connected then
            v77.Connected = false
            local v78 = v77._next
            local v79 = v77._prev
            if v78 then
                v78._prev = v79
            end
            if v79 then
                v79._next = v78
            end
            local v80 = v77._signal
            if v80._head == v77 then
                v80._head = v78
            end
        end
        v77 = v77._next
    end
end
function v_u_15.Destroy(p81)
    -- upvalues: (ref) v_u_17
    local v82 = p81._head
    while v82 do
        if v82.Connected then
            v82.Connected = false
            local v83 = v82._next
            local v84 = v82._prev
            if v83 then
                v83._prev = v84
            end
            if v84 then
                v84._next = v83
            end
            local v85 = v82._signal
            if v85._head == v82 then
                v85._head = v83
            end
        end
        v82 = v82._next
    end
    local v86 = p81.RBXScriptConnection
    if v86 then
        v_u_17(v86)
        p81.RBXScriptConnection = nil
    end
end
return {
    ["new"] = v_u_15.new,
    ["wrap"] = v_u_15.wrap
}

--========================================
-- ModuleScript : ReplicatedStorage.Packages._Index.evaera_promise@4.0.0.promise
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    ["__mode"] = "k"
}
local function v7(p_u_2, p3)
    local v4 = {}
    for _, v5 in ipairs(p3) do
        v4[v5] = v5
    end
    return setmetatable(v4, {
        ["__index"] = function(_, p6)
            -- upvalues: (copy) p_u_2
            error(string.format("%s is not in %s!", p6, p_u_2), 2)
        end,
        ["__newindex"] = function()
            -- upvalues: (copy) p_u_2
            error(string.format("Creating new members in %s is not allowed!", p_u_2), 2)
        end
    })
end
local v_u_8 = {
    ["Kind"] = v7("Promise.Error.Kind", {
        "ExecutionError",
        "AlreadyCancelled",
        "NotResolvedInTime",
        "TimedOut"
    })
}
v_u_8.__index = v_u_8
function v_u_8.new(p9, p10)
    -- upvalues: (ref) v_u_8
    local v11 = p9 or {}
    local v12 = {}
    local v13 = v11.error
    v12.error = tostring(v13) or "[This error has no error text.]"
    v12.trace = v11.trace
    v12.context = v11.context
    v12.kind = v11.kind
    v12.parent = p10
    v12.createdTick = os.clock()
    v12.createdTrace = debug.traceback()
    local v14 = v_u_8
    return setmetatable(v12, v14)
end
function v_u_8.is(p15)
    if type(p15) == "table" then
        local v16 = getmetatable(p15)
        if type(v16) == "table" then
            local v17
            if rawget(p15, "error") == nil then
                v17 = false
            else
                local v18 = rawget(v16, "extend")
                v17 = type(v18) == "function"
            end
            return v17
        end
    end
    return false
end
function v_u_8.isKind(p19, p20)
    -- upvalues: (ref) v_u_8
    local v21 = p20 ~= nil
    assert(v21, "Argument #2 to Promise.Error.isKind must not be nil")
    local v22 = v_u_8.is(p19)
    if v22 then
        v22 = p19.kind == p20
    end
    return v22
end
function v_u_8.extend(p23, p24)
    -- upvalues: (ref) v_u_8
    local v25 = p24 or {}
    v25.kind = v25.kind or p23.kind
    return v_u_8.new(v25, p23)
end
function v_u_8.getErrorChain(p26)
    local v27 = { p26 }
    while v27[#v27].parent do
        local v28 = v27[#v27].parent
        table.insert(v27, v28)
    end
    return v27
end
function v_u_8.__tostring(p29)
    local v30 = { string.format("-- Promise.Error(%s) --", p29.kind or "?") }
    for _, v31 in ipairs(p29:getErrorChain()) do
        local v32 = table.concat
        local v33 = { v31.trace or v31.error, v31.context }
        table.insert(v30, v32(v33, "\n"))
    end
    return table.concat(v30, "\n")
end
local function v_u_34(...)
    return select("#", ...), { ... }
end
local function v_u_36(p35, ...)
    return p35, select("#", ...), { ... }
end
local function v_u_43(p_u_37, p38, ...)
    -- upvalues: (copy) v_u_36, (ref) v_u_8
    local v39 = v_u_36
    local v40 = xpcall
    local v41 = p_u_37 ~= nil
    assert(v41, "traceback is nil")
    return v39(v40(p38, function(p42)
        -- upvalues: (ref) v_u_8, (copy) p_u_37
        if type(p42) == "table" then
            return p42
        else
            return v_u_8.new({
                ["error"] = p42,
                ["kind"] = v_u_8.Kind.ExecutionError,
                ["trace"] = debug.traceback(tostring(p42), 2),
                ["context"] = "Promise created at:\n\n" .. p_u_37
            })
        end
    end, ...))
end
local v_u_44 = {
    ["Error"] = v_u_8,
    ["Status"] = v7("Promise.Status", {
        "Started",
        "Resolved",
        "Rejected",
        "Cancelled"
    }),
    ["_getTime"] = os.clock,
    ["_timeEvent"] = game:GetService("RunService").Heartbeat,
    ["_unhandledRejectionCallbacks"] = {},
    ["prototype"] = {}
}
v_u_44.__index = v_u_44.prototype
function v_u_44._new(p45, p_u_46, p47)
    -- upvalues: (copy) v_u_44, (copy) v_u_1, (copy) v_u_43
    if p47 ~= nil and not v_u_44.is(p47) then
        error("Argument #2 to Promise.new must be a promise or nil", 2)
    end
    local v_u_48 = {
        ["_thread"] = nil,
        ["_source"] = p45,
        ["_status"] = v_u_44.Status.Started,
        ["_values"] = nil,
        ["_valuesLength"] = -1,
        ["_unhandledRejection"] = true,
        ["_queuedResolve"] = {},
        ["_queuedReject"] = {},
        ["_queuedFinally"] = {},
        ["_cancellationHook"] = nil,
        ["_parent"] = p47
    }
    local v49 = v_u_1
    v_u_48._consumers = setmetatable({}, v49)
    if p47 and p47._status == v_u_44.Status.Started then
        p47._consumers[v_u_48] = true
    end
    local v50 = v_u_44
    setmetatable(v_u_48, v50)
    local function v_u_51(...)
        -- upvalues: (copy) v_u_48
        v_u_48:_resolve(...)
    end
    local function v_u_52(...)
        -- upvalues: (copy) v_u_48
        v_u_48:_reject(...)
    end
    local function v_u_54(p53)
        -- upvalues: (copy) v_u_48, (ref) v_u_44
        if p53 then
            if v_u_48._status == v_u_44.Status.Cancelled then
                p53()
            else
                v_u_48._cancellationHook = p53
            end
        end
        return v_u_48._status == v_u_44.Status.Cancelled
    end
    v_u_48._thread = coroutine.create(function()
        -- upvalues: (ref) v_u_43, (copy) v_u_48, (copy) p_u_46, (copy) v_u_51, (copy) v_u_52, (copy) v_u_54
        local v55, _, v56 = v_u_43(v_u_48._source, p_u_46, v_u_51, v_u_52, v_u_54)
        if not v55 then
            v_u_52(v56[1])
        end
    end)
    task.spawn(v_u_48._thread)
    return v_u_48
end
function v_u_44.new(p57)
    -- upvalues: (copy) v_u_44
    return v_u_44._new(debug.traceback(nil, 2), p57)
end
function v_u_44.__tostring(p58)
    return string.format("Promise(%s)", p58._status)
end
function v_u_44.defer(p_u_59)
    -- upvalues: (copy) v_u_44, (copy) v_u_43
    local v_u_60 = debug.traceback(nil, 2)
    return v_u_44._new(v_u_60, function(p_u_61, p_u_62, p_u_63)
        -- upvalues: (ref) v_u_44, (ref) v_u_43, (copy) v_u_60, (copy) p_u_59
        local v_u_64 = nil
        v_u_64 = v_u_44._timeEvent:Connect(function()
            -- upvalues: (ref) v_u_64, (ref) v_u_43, (ref) v_u_60, (ref) p_u_59, (copy) p_u_61, (copy) p_u_62, (copy) p_u_63
            v_u_64:Disconnect()
            local v65, _, v66 = v_u_43(v_u_60, p_u_59, p_u_61, p_u_62, p_u_63)
            if not v65 then
                p_u_62(v66[1])
            end
        end)
    end)
end
v_u_44.async = v_u_44.defer
function v_u_44.resolve(...)
    -- upvalues: (copy) v_u_34, (copy) v_u_44
    local v_u_67, v_u_68 = v_u_34(...)
    return v_u_44._new(debug.traceback(nil, 2), function(p69)
        -- upvalues: (copy) v_u_68, (copy) v_u_67
        local v70 = v_u_68
        local v71 = v_u_67
        p69(unpack(v70, 1, v71))
    end)
end
function v_u_44.reject(...)
    -- upvalues: (copy) v_u_34, (copy) v_u_44
    local v_u_72, v_u_73 = v_u_34(...)
    return v_u_44._new(debug.traceback(nil, 2), function(_, p74)
        -- upvalues: (copy) v_u_73, (copy) v_u_72
        local v75 = v_u_73
        local v76 = v_u_72
        p74(unpack(v75, 1, v76))
    end)
end
function v_u_44._try(p77, p_u_78, ...)
    -- upvalues: (copy) v_u_34, (copy) v_u_44
    local v_u_79, v_u_80 = v_u_34(...)
    return v_u_44._new(p77, function(p81)
        -- upvalues: (copy) p_u_78, (copy) v_u_80, (copy) v_u_79
        local v82 = v_u_80
        local v83 = v_u_79
        p81(p_u_78(unpack(v82, 1, v83)))
    end)
end
function v_u_44.try(p84, ...)
    -- upvalues: (copy) v_u_44
    return v_u_44._try(debug.traceback(nil, 2), p84, ...)
end
function v_u_44._all(p85, p_u_86, p_u_87)
    -- upvalues: (copy) v_u_44
    if type(p_u_86) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.all"), 3)
    end
    for v88, v89 in pairs(p_u_86) do
        if not v_u_44.is(v89) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(v88))), 3)
        end
    end
    if #p_u_86 == 0 or p_u_87 == 0 then
        return v_u_44.resolve({})
    else
        return v_u_44._new(p85, function(p_u_90, p_u_91, p92)
            -- upvalues: (copy) p_u_87, (copy) p_u_86
            local v_u_93 = {}
            local v_u_94 = {}
            local v_u_95 = 0
            local v_u_96 = 0
            local v_u_97 = false
            local function v_u_100(p98, ...)
                -- upvalues: (ref) v_u_97, (ref) v_u_95, (ref) p_u_87, (copy) v_u_93, (ref) p_u_86, (copy) p_u_90, (copy) v_u_94
                if not v_u_97 then
                    v_u_95 = v_u_95 + 1
                    if p_u_87 == nil then
                        v_u_93[p98] = ...
                    else
                        v_u_93[v_u_95] = ...
                    end
                    if v_u_95 >= (p_u_87 or #p_u_86) then
                        v_u_97 = true
                        p_u_90(v_u_93)
                        for _, v99 in ipairs(v_u_94) do
                            v99:cancel()
                        end
                    end
                end
            end
            p92(function()
                -- upvalues: (copy) v_u_94
                for _, v101 in ipairs(v_u_94) do
                    v101:cancel()
                end
            end)
            local v_u_102 = v_u_97
            for v_u_103, v104 in ipairs(p_u_86) do
                v_u_94[v_u_103] = v104:andThen(function(...)
                    -- upvalues: (copy) v_u_100, (copy) v_u_103
                    v_u_100(v_u_103, ...)
                end, function(...)
                    -- upvalues: (ref) v_u_96, (ref) p_u_87, (ref) p_u_86, (copy) v_u_94, (ref) v_u_102, (copy) p_u_91
                    v_u_96 = v_u_96 + 1
                    if p_u_87 == nil or #p_u_86 - v_u_96 < p_u_87 then
                        for _, v105 in ipairs(v_u_94) do
                            v105:cancel()
                        end
                        v_u_102 = true
                        p_u_91(...)
                    end
                end)
            end
            if v_u_102 then
                for _, v106 in ipairs(v_u_94) do
                    v106:cancel()
                end
            end
        end)
    end
end
function v_u_44.all(p107)
    -- upvalues: (copy) v_u_44
    return v_u_44._all(debug.traceback(nil, 2), p107)
end
function v_u_44.fold(p108, p_u_109, p110)
    -- upvalues: (copy) v_u_44
    local v111 = type(p108) == "table"
    assert(v111, "Bad argument #1 to Promise.fold: must be a table")
    local v112
    if type(p_u_109) == "function" then
        v112 = true
    elseif type(p_u_109) == "table" then
        local v113 = getmetatable(p_u_109)
        if v113 then
            local v114 = rawget(v113, "__call")
            v112 = type(v114) == "function"
        else
            v112 = false
        end
    else
        v112 = false
    end
    assert(v112, "Bad argument #2 to Promise.fold: must be a function")
    local v_u_115 = v_u_44.resolve(p110)
    return v_u_44.each(p108, function(p_u_116, p_u_117)
        -- upvalues: (ref) v_u_115, (copy) p_u_109
        v_u_115 = v_u_115:andThen(function(p118)
            -- upvalues: (ref) p_u_109, (copy) p_u_116, (copy) p_u_117
            return p_u_109(p118, p_u_116, p_u_117)
        end)
    end):andThen(function()
        -- upvalues: (ref) v_u_115
        return v_u_115
    end)
end
function v_u_44.some(p119, p120)
    -- upvalues: (copy) v_u_44
    local v121 = type(p120) == "number"
    assert(v121, "Bad argument #2 to Promise.some: must be a number")
    return v_u_44._all(debug.traceback(nil, 2), p119, p120)
end
function v_u_44.any(p122)
    -- upvalues: (copy) v_u_44
    return v_u_44._all(debug.traceback(nil, 2), p122, 1):andThen(function(p123)
        return p123[1]
    end)
end
function v_u_44.allSettled(p_u_124)
    -- upvalues: (copy) v_u_44
    if type(p_u_124) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2)
    end
    for v125, v126 in pairs(p_u_124) do
        if not v_u_44.is(v126) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(v125))), 2)
        end
    end
    if #p_u_124 == 0 then
        return v_u_44.resolve({})
    else
        return v_u_44._new(debug.traceback(nil, 2), function(p_u_127, _, p128)
            -- upvalues: (copy) p_u_124
            local v_u_129 = {}
            local v_u_130 = {}
            local v_u_131 = 0
            local function v_u_133(p132, ...)
                -- upvalues: (ref) v_u_131, (copy) v_u_129, (ref) p_u_124, (copy) p_u_127
                v_u_131 = v_u_131 + 1
                v_u_129[p132] = ...
                if v_u_131 >= #p_u_124 then
                    p_u_127(v_u_129)
                end
            end
            p128(function()
                -- upvalues: (copy) v_u_130
                for _, v134 in ipairs(v_u_130) do
                    v134:cancel()
                end
            end)
            for v_u_135, v136 in ipairs(p_u_124) do
                v_u_130[v_u_135] = v136:finally(function(...)
                    -- upvalues: (copy) v_u_133, (copy) v_u_135
                    v_u_133(v_u_135, ...)
                end)
            end
        end)
    end
end
function v_u_44.race(p_u_137)
    -- upvalues: (copy) v_u_44
    local v138 = type(p_u_137) == "table"
    local v139 = string.format
    assert(v138, v139("Please pass a list of promises to %s", "Promise.race"))
    for v140, v141 in pairs(p_u_137) do
        local v142 = v_u_44.is(v141)
        local v143 = string.format
        local v144 = tostring(v140)
        assert(v142, v143("Non-promise value passed into %s at index %s", "Promise.race", v144))
    end
    return v_u_44._new(debug.traceback(nil, 2), function(p_u_145, p_u_146, p147)
        -- upvalues: (copy) p_u_137
        local v_u_148 = {}
        local v_u_149 = false
        if not p147(function(...)
            -- upvalues: (copy) v_u_148, (ref) v_u_149, (copy) p_u_146
            for _, v150 in ipairs(v_u_148) do
                v150:cancel()
            end
            v_u_149 = true
            return p_u_146(...)
        end) then
            local v_u_151 = v_u_149
            for v152, v153 in ipairs(p_u_137) do
                v_u_148[v152] = v153:andThen(function(...)
                    -- upvalues: (copy) v_u_148, (ref) v_u_151, (copy) p_u_145
                    for _, v154 in ipairs(v_u_148) do
                        v154:cancel()
                    end
                    v_u_151 = true
                    return p_u_145(...)
                end, function(...)
                    -- upvalues: (copy) v_u_148, (ref) v_u_151, (copy) p_u_146
                    for _, v155 in ipairs(v_u_148) do
                        v155:cancel()
                    end
                    v_u_151 = true
                    return p_u_146(...)
                end)
            end
            if v_u_151 then
                for _, v156 in ipairs(v_u_148) do
                    v156:cancel()
                end
            end
        end
    end)
end
function v_u_44.each(p_u_157, p_u_158)
    -- upvalues: (copy) v_u_44, (ref) v_u_8
    local v159 = type(p_u_157) == "table"
    local v160 = string.format
    assert(v159, v160("Please pass a list of promises to %s", "Promise.each"))
    local v161
    if type(p_u_158) == "function" then
        v161 = true
    elseif type(p_u_158) == "table" then
        local v162 = getmetatable(p_u_158)
        if v162 then
            local v163 = rawget(v162, "__call")
            v161 = type(v163) == "function"
        else
            v161 = false
        end
    else
        v161 = false
    end
    local v164 = string.format
    assert(v161, v164("Please pass a handler function to %s!", "Promise.each"))
    return v_u_44._new(debug.traceback(nil, 2), function(p165, p166, p167)
        -- upvalues: (copy) p_u_157, (ref) v_u_44, (ref) v_u_8, (copy) p_u_158
        local v168 = {}
        local v_u_169 = {}
        local v_u_170 = false
        p167(function()
            -- upvalues: (ref) v_u_170, (copy) v_u_169
            v_u_170 = true
            for _, v171 in ipairs(v_u_169) do
                v171:cancel()
            end
        end)
        local v172 = v_u_170
        local v173 = {}
        for v174, v175 in ipairs(p_u_157) do
            if v_u_44.is(v175) then
                if v175:getStatus() == v_u_44.Status.Cancelled then
                    for _, v176 in ipairs(v_u_169) do
                        v176:cancel()
                    end
                    return p166(v_u_8.new({
                        ["error"] = "Promise is cancelled",
                        ["kind"] = v_u_8.Kind.AlreadyCancelled,
                        ["context"] = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v174, v175._source)
                    }))
                end
                if v175:getStatus() == v_u_44.Status.Rejected then
                    for _, v177 in ipairs(v_u_169) do
                        v177:cancel()
                    end
                    return p166(select(2, v175:await()))
                end
                local v178 = v175:andThen(function(...)
                    return ...
                end)
                table.insert(v_u_169, v178)
                v173[v174] = v178
            else
                v173[v174] = v175
            end
        end
        for v179, v182 in ipairs(v173) do
            if v_u_44.is(v182) then
                local v181, v182 = v182:await()
                if not v181 then
                    for _, v183 in ipairs(v_u_169) do
                        v183:cancel()
                    end
                    return p166(v182)
                end
            end
            if v172 then
                return
            end
            local v184 = v_u_44.resolve(p_u_158(v182, v179))
            table.insert(v_u_169, v184)
            local v185, v186 = v184:await()
            if not v185 then
                for _, v187 in ipairs(v_u_169) do
                    v187:cancel()
                end
                return p166(v186)
            end
            v168[v179] = v186
        end
        p165(v168)
    end)
end
function v_u_44.is(p188)
    -- upvalues: (copy) v_u_44
    if type(p188) ~= "table" then
        return false
    end
    local v189 = getmetatable(p188)
    if v189 == v_u_44 then
        return true
    end
    if v189 ~= nil then
        if type(v189) == "table" then
            local v190 = rawget(v189, "__index")
            if type(v190) == "table" then
                local v191 = rawget(v189, "__index")
                local v192 = rawget(v191, "andThen")
                local v193
                if type(v192) == "function" then
                    v193 = true
                else
                    local v194 = type(v192) == "table" and getmetatable(v192)
                    if v194 then
                        local v195 = rawget(v194, "__call")
                        v193 = type(v195) == "function"
                    else
                        v193 = false
                    end
                end
                if v193 then
                    return true
                end
            end
        end
        return false
    end
    local v196 = p188.andThen
    if type(v196) == "function" then
        return true
    end
    local v197 = type(v196) == "table" and getmetatable(v196)
    if v197 then
        local v198 = rawget(v197, "__call")
        if type(v198) == "function" then
            return true
        end
    end
    return false
end
function v_u_44.promisify(p_u_199)
    -- upvalues: (copy) v_u_44
    return function(...)
        -- upvalues: (ref) v_u_44, (copy) p_u_199
        return v_u_44._try(debug.traceback(nil, 2), p_u_199, ...)
    end
end
local v_u_200 = nil
local v_u_201 = nil
function v_u_44.delay(p202)
    -- upvalues: (copy) v_u_44, (ref) v_u_201, (ref) v_u_200
    local v203 = type(p202) == "number"
    assert(v203, "Bad argument #1 to Promise.delay, must be a number.")
    local v_u_204 = (p202 < 0.016666666666666666 or p202 == (1 / 0)) and 0.016666666666666666 or p202
    return v_u_44._new(debug.traceback(nil, 2), function(p205, _, p206)
        -- upvalues: (ref) v_u_44, (ref) v_u_204, (ref) v_u_201, (ref) v_u_200
        local v207 = v_u_44._getTime()
        local v208 = v207 + v_u_204
        local v_u_209 = {
            ["resolve"] = p205,
            ["startTime"] = v207,
            ["endTime"] = v208
        }
        if v_u_201 == nil then
            v_u_200 = v_u_209
            v_u_201 = v_u_44._timeEvent:Connect(function()
                -- upvalues: (ref) v_u_44, (ref) v_u_200, (ref) v_u_201
                local v210 = v_u_44._getTime()
                while v_u_200 ~= nil and v_u_200.endTime < v210 do
                    local v211 = v_u_200
                    v_u_200 = v211.next
                    if v_u_200 == nil then
                        v_u_201:Disconnect()
                        v_u_201 = nil
                    else
                        v_u_200.previous = nil
                    end
                    v211.resolve(v_u_44._getTime() - v211.startTime)
                end
            end)
        elseif v_u_200.endTime < v208 then
            local v212 = v_u_200
            local v213 = v212.next
            while v213 ~= nil and v213.endTime < v208 do
                local v214 = v213.next
                v212 = v213
                v213 = v214
            end
            v212.next = v_u_209
            v_u_209.previous = v212
            if v213 ~= nil then
                v_u_209.next = v213
                v213.previous = v_u_209
            end
        else
            v_u_209.next = v_u_200
            v_u_200.previous = v_u_209
            v_u_200 = v_u_209
        end
        p206(function()
            -- upvalues: (copy) v_u_209, (ref) v_u_200, (ref) v_u_201
            local v215 = v_u_209.next
            if v_u_200 == v_u_209 then
                if v215 == nil then
                    v_u_201:Disconnect()
                    v_u_201 = nil
                else
                    v215.previous = nil
                end
                v_u_200 = v215
            else
                local v216 = v_u_209.previous
                v216.next = v215
                if v215 ~= nil then
                    v215.previous = v216
                end
            end
        end)
    end)
end
local function v221(p217, p_u_218, p_u_219)
    -- upvalues: (copy) v_u_44, (ref) v_u_8
    local v_u_220 = debug.traceback(nil, 2)
    return v_u_44.race({ v_u_44.delay(p_u_218):andThen(function()
            -- upvalues: (ref) v_u_44, (copy) p_u_219, (ref) v_u_8, (copy) p_u_218, (copy) v_u_220
            return v_u_44.reject(p_u_219 == nil and v_u_8.new({
                ["kind"] = v_u_8.Kind.TimedOut,
                ["error"] = "Timed out",
                ["context"] = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p_u_218, v_u_220)
            }) or p_u_219)
        end), p217 })
end
v_u_44.prototype.timeout = v221
function v_u_44.prototype.getStatus(p222)
    return p222._status
end
function v_u_44.prototype._andThen(p_u_223, p_u_224, p_u_225, p_u_226)
    -- upvalues: (copy) v_u_44, (copy) v_u_43
    p_u_223._unhandledRejection = false
    if p_u_223._status ~= v_u_44.Status.Cancelled then
        return v_u_44._new(p_u_224, function(p_u_227, p_u_228, p229)
            -- upvalues: (copy) p_u_225, (copy) p_u_224, (ref) v_u_43, (copy) p_u_226, (copy) p_u_223, (ref) v_u_44
            local v_u_230
            if p_u_225 then
                local v_u_231 = p_u_224
                local v_u_232 = p_u_225
                v_u_230 = function(...)
                    -- upvalues: (ref) v_u_43, (copy) v_u_231, (copy) v_u_232, (copy) p_u_227, (copy) p_u_228
                    local v233, v234, v235 = v_u_43(v_u_231, v_u_232, ...)
                    if v233 then
                        p_u_227(unpack(v235, 1, v234))
                    else
                        p_u_228(v235[1])
                    end
                end
            else
                v_u_230 = p_u_227
            end
            if p_u_226 then
                local v_u_236 = p_u_224
                local v_u_237 = p_u_226
                p_u_228 = function(...)
                    -- upvalues: (ref) v_u_43, (copy) v_u_236, (copy) v_u_237, (copy) p_u_227, (copy) p_u_228
                    local v238, v239, v240 = v_u_43(v_u_236, v_u_237, ...)
                    if v238 then
                        p_u_227(unpack(v240, 1, v239))
                    else
                        p_u_228(v240[1])
                    end
                end
            end
            if p_u_223._status == v_u_44.Status.Started then
                local v241 = p_u_223._queuedResolve
                table.insert(v241, v_u_230)
                local v242 = p_u_223._queuedReject
                table.insert(v242, p_u_228)
                p229(function()
                    -- upvalues: (ref) p_u_223, (ref) v_u_44, (ref) v_u_230, (ref) p_u_228
                    if p_u_223._status == v_u_44.Status.Started then
                        table.remove(p_u_223._queuedResolve, table.find(p_u_223._queuedResolve, v_u_230))
                        table.remove(p_u_223._queuedReject, table.find(p_u_223._queuedReject, p_u_228))
                    end
                end)
            elseif p_u_223._status == v_u_44.Status.Resolved then
                local v243 = p_u_223._values
                local v244 = p_u_223._valuesLength
                v_u_230(unpack(v243, 1, v244))
            elseif p_u_223._status == v_u_44.Status.Rejected then
                local v245 = p_u_223._values
                local v246 = p_u_223._valuesLength
                p_u_228(unpack(v245, 1, v246))
            end
        end, p_u_223)
    end
    local v247 = v_u_44.new(function() end)
    v247:cancel()
    return v247
end
function v_u_44.prototype.andThen(p248, p249, p250)
    local v251
    if p249 == nil or type(p249) == "function" then
        v251 = true
    elseif type(p249) == "table" then
        local v252 = getmetatable(p249)
        if v252 then
            local v253 = rawget(v252, "__call")
            v251 = type(v253) == "function"
        else
            v251 = false
        end
    else
        v251 = false
    end
    local v254 = string.format
    assert(v251, v254("Please pass a handler function to %s!", "Promise:andThen"))
    local v255
    if p250 == nil or type(p250) == "function" then
        v255 = true
    elseif type(p250) == "table" then
        local v256 = getmetatable(p250)
        if v256 then
            local v257 = rawget(v256, "__call")
            v255 = type(v257) == "function"
        else
            v255 = false
        end
    else
        v255 = false
    end
    local v258 = string.format
    assert(v255, v258("Please pass a handler function to %s!", "Promise:andThen"))
    return p248:_andThen(debug.traceback(nil, 2), p249, p250)
end
function v_u_44.prototype.catch(p259, p260)
    local v261
    if p260 == nil or type(p260) == "function" then
        v261 = true
    elseif type(p260) == "table" then
        local v262 = getmetatable(p260)
        if v262 then
            local v263 = rawget(v262, "__call")
            v261 = type(v263) == "function"
        else
            v261 = false
        end
    else
        v261 = false
    end
    local v264 = string.format
    assert(v261, v264("Please pass a handler function to %s!", "Promise:catch"))
    return p259:_andThen(debug.traceback(nil, 2), nil, p260)
end
function v_u_44.prototype.tap(p265, p_u_266)
    -- upvalues: (copy) v_u_44, (copy) v_u_34
    local v267
    if type(p_u_266) == "function" then
        v267 = true
    elseif type(p_u_266) == "table" then
        local v268 = getmetatable(p_u_266)
        if v268 then
            local v269 = rawget(v268, "__call")
            v267 = type(v269) == "function"
        else
            v267 = false
        end
    else
        v267 = false
    end
    local v270 = string.format
    assert(v267, v270("Please pass a handler function to %s!", "Promise:tap"))
    return p265:_andThen(debug.traceback(nil, 2), function(...)
        -- upvalues: (copy) p_u_266, (ref) v_u_44, (ref) v_u_34
        local v271 = p_u_266(...)
        if not v_u_44.is(v271) then
            return ...
        end
        local v_u_272, v_u_273 = v_u_34(...)
        return v271:andThen(function()
            -- upvalues: (copy) v_u_273, (copy) v_u_272
            local v274 = v_u_273
            local v275 = v_u_272
            return unpack(v274, 1, v275)
        end)
    end)
end
function v_u_44.prototype.andThenCall(p276, p_u_277, ...)
    -- upvalues: (copy) v_u_34
    local v278
    if type(p_u_277) == "function" then
        v278 = true
    elseif type(p_u_277) == "table" then
        local v279 = getmetatable(p_u_277)
        if v279 then
            local v280 = rawget(v279, "__call")
            v278 = type(v280) == "function"
        else
            v278 = false
        end
    else
        v278 = false
    end
    local v281 = string.format
    assert(v278, v281("Please pass a handler function to %s!", "Promise:andThenCall"))
    local v_u_282, v_u_283 = v_u_34(...)
    return p276:_andThen(debug.traceback(nil, 2), function()
        -- upvalues: (copy) p_u_277, (copy) v_u_283, (copy) v_u_282
        local v284 = v_u_283
        local v285 = v_u_282
        return p_u_277(unpack(v284, 1, v285))
    end)
end
function v_u_44.prototype.andThenReturn(p286, ...)
    -- upvalues: (copy) v_u_34
    local v_u_287, v_u_288 = v_u_34(...)
    return p286:_andThen(debug.traceback(nil, 2), function()
        -- upvalues: (copy) v_u_288, (copy) v_u_287
        local v289 = v_u_288
        local v290 = v_u_287
        return unpack(v289, 1, v290)
    end)
end
function v_u_44.prototype.cancel(p291)
    -- upvalues: (copy) v_u_44
    if p291._status == v_u_44.Status.Started then
        p291._status = v_u_44.Status.Cancelled
        if p291._cancellationHook then
            p291._cancellationHook()
        end
        coroutine.close(p291._thread)
        if p291._parent then
            p291._parent:_consumerCancelled(p291)
        end
        for v292 in pairs(p291._consumers) do
            v292:cancel()
        end
        p291:_finalize()
    end
end
function v_u_44.prototype._consumerCancelled(p293, p294)
    -- upvalues: (copy) v_u_44
    if p293._status == v_u_44.Status.Started then
        p293._consumers[p294] = nil
        if next(p293._consumers) == nil then
            p293:cancel()
        end
    end
end
function v_u_44.prototype._finally(p_u_295, p296, p_u_297)
    -- upvalues: (copy) v_u_44
    p_u_295._unhandledRejection = false
    return v_u_44._new(p296, function(p_u_298, p_u_299, p300)
        -- upvalues: (copy) p_u_295, (copy) p_u_297, (ref) v_u_44
        local v_u_301 = nil
        p300(function()
            -- upvalues: (ref) p_u_295, (ref) v_u_301
            p_u_295:_consumerCancelled(p_u_295)
            if v_u_301 then
                v_u_301:cancel()
            end
        end)
        local v304 = p_u_297 and function(...)
            -- upvalues: (ref) p_u_297, (ref) v_u_44, (ref) v_u_301, (copy) p_u_298, (ref) p_u_295, (copy) p_u_299
            local v302 = p_u_297(...)
            if v_u_44.is(v302) then
                v_u_301 = v302
                v302:finally(function(p303)
                    -- upvalues: (ref) v_u_44, (ref) p_u_298, (ref) p_u_295
                    if p303 ~= v_u_44.Status.Rejected then
                        p_u_298(p_u_295)
                    end
                end):catch(function(...)
                    -- upvalues: (ref) p_u_299
                    p_u_299(...)
                end)
            else
                p_u_298(p_u_295)
            end
        end or p_u_298
        if p_u_295._status == v_u_44.Status.Started then
            local v305 = p_u_295._queuedFinally
            table.insert(v305, v304)
        else
            v304(p_u_295._status)
        end
    end)
end
function v_u_44.prototype.finally(p306, p307)
    local v308
    if p307 == nil or type(p307) == "function" then
        v308 = true
    elseif type(p307) == "table" then
        local v309 = getmetatable(p307)
        if v309 then
            local v310 = rawget(v309, "__call")
            v308 = type(v310) == "function"
        else
            v308 = false
        end
    else
        v308 = false
    end
    local v311 = string.format
    assert(v308, v311("Please pass a handler function to %s!", "Promise:finally"))
    return p306:_finally(debug.traceback(nil, 2), p307)
end
function v_u_44.prototype.finallyCall(p312, p_u_313, ...)
    -- upvalues: (copy) v_u_34
    local v314
    if type(p_u_313) == "function" then
        v314 = true
    elseif type(p_u_313) == "table" then
        local v315 = getmetatable(p_u_313)
        if v315 then
            local v316 = rawget(v315, "__call")
            v314 = type(v316) == "function"
        else
            v314 = false
        end
    else
        v314 = false
    end
    local v317 = string.format
    assert(v314, v317("Please pass a handler function to %s!", "Promise:finallyCall"))
    local v_u_318, v_u_319 = v_u_34(...)
    return p312:_finally(debug.traceback(nil, 2), function()
        -- upvalues: (copy) p_u_313, (copy) v_u_319, (copy) v_u_318
        local v320 = v_u_319
        local v321 = v_u_318
        return p_u_313(unpack(v320, 1, v321))
    end)
end
function v_u_44.prototype.finallyReturn(p322, ...)
    -- upvalues: (copy) v_u_34
    local v_u_323, v_u_324 = v_u_34(...)
    return p322:_finally(debug.traceback(nil, 2), function()
        -- upvalues: (copy) v_u_324, (copy) v_u_323
        local v325 = v_u_324
        local v326 = v_u_323
        return unpack(v325, 1, v326)
    end)
end
function v_u_44.prototype.awaitStatus(p327)
    -- upvalues: (copy) v_u_44
    p327._unhandledRejection = false
    if p327._status == v_u_44.Status.Started then
        local v_u_328 = coroutine.running()
        p327:finally(function()
            -- upvalues: (copy) v_u_328
            task.spawn(v_u_328)
        end):catch(function() end)
        coroutine.yield()
    end
    if p327._status == v_u_44.Status.Resolved then
        local v329 = p327._status
        local v330 = p327._values
        local v331 = p327._valuesLength
        return v329, unpack(v330, 1, v331)
    end
    if p327._status ~= v_u_44.Status.Rejected then
        return p327._status
    end
    local v332 = p327._status
    local v333 = p327._values
    local v334 = p327._valuesLength
    return v332, unpack(v333, 1, v334)
end
local function v_u_336(p335, ...)
    -- upvalues: (copy) v_u_44
    return p335 == v_u_44.Status.Resolved, ...
end
function v_u_44.prototype.await(p337)
    -- upvalues: (copy) v_u_336
    return v_u_336(p337:awaitStatus())
end
local function v_u_339(p338, ...)
    -- upvalues: (copy) v_u_44
    if p338 ~= v_u_44.Status.Resolved then
        error(... == nil and "Expected Promise rejected with no value." or ..., 3)
    end
    return ...
end
function v_u_44.prototype.expect(p340)
    -- upvalues: (copy) v_u_339
    return v_u_339(p340:awaitStatus())
end
v_u_44.prototype.awaitValue = v_u_44.prototype.expect
function v_u_44.prototype._unwrap(p341)
    -- upvalues: (copy) v_u_44
    if p341._status == v_u_44.Status.Started then
        error("Promise has not resolved or rejected.", 2)
    end
    local v342 = p341._status == v_u_44.Status.Resolved
    local v343 = p341._values
    local v344 = p341._valuesLength
    return v342, unpack(v343, 1, v344)
end
local function v353(p_u_345, ...)
    -- upvalues: (copy) v_u_44, (ref) v_u_8, (copy) v_u_34
    if p_u_345._status == v_u_44.Status.Started then
        if v_u_44.is((...)) then
            if select("#", ...) > 1 then
                local v346 = string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p_u_345._source)
                warn(v346)
            end
            local v_u_347 = ...
            local v349 = v_u_347:andThen(function(...)
                -- upvalues: (copy) p_u_345
                p_u_345:_resolve(...)
            end, function(...)
                -- upvalues: (copy) v_u_347, (ref) v_u_8, (copy) p_u_345
                local v348 = v_u_347._values[1]
                if v_u_347._error then
                    v348 = v_u_8.new({
                        ["error"] = v_u_347._error,
                        ["kind"] = v_u_8.Kind.ExecutionError,
                        ["context"] = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
                    })
                end
                if v_u_8.isKind(v348, v_u_8.Kind.ExecutionError) then
                    return p_u_345:_reject(v348:extend({
                        ["error"] = "This Promise was chained to a Promise that errored.",
                        ["trace"] = "",
                        ["context"] = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p_u_345._source)
                    }))
                end
                p_u_345:_reject(...)
            end)
            if v349._status == v_u_44.Status.Cancelled then
                p_u_345:cancel()
            elseif v349._status == v_u_44.Status.Started then
                p_u_345._parent = v349
                v349._consumers[p_u_345] = true
            end
        else
            p_u_345._status = v_u_44.Status.Resolved
            local v350, v351 = v_u_34(...)
            p_u_345._valuesLength = v350
            p_u_345._values = v351
            for _, v352 in ipairs(p_u_345._queuedResolve) do
                coroutine.wrap(v352)(...)
            end
            p_u_345:_finalize()
            return
        end
    else
        if v_u_44.is((...)) then
            (...):_consumerCancelled(p_u_345)
        end
        return
    end
end
v_u_44.prototype._resolve = v353
function v_u_44.prototype._reject(p_u_354, ...)
    -- upvalues: (copy) v_u_44, (copy) v_u_34
    if p_u_354._status == v_u_44.Status.Started then
        p_u_354._status = v_u_44.Status.Rejected
        local v355, v356 = v_u_34(...)
        p_u_354._valuesLength = v355
        p_u_354._values = v356
        local v357 = p_u_354._queuedReject
        if next(v357) == nil then
            local v_u_358 = tostring((...))
            coroutine.wrap(function()
                -- upvalues: (ref) v_u_44, (copy) p_u_354, (copy) v_u_358
                v_u_44._timeEvent:Wait()
                if p_u_354._unhandledRejection then
                    local v359 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", v_u_358, p_u_354._source)
                    for _, v360 in ipairs(v_u_44._unhandledRejectionCallbacks) do
                        local v361 = task.spawn
                        local v362 = p_u_354
                        local v363 = p_u_354._values
                        local v364 = p_u_354._valuesLength
                        v361(v360, v362, unpack(v363, 1, v364))
                    end
                    if not v_u_44.TEST then
                        warn(v359)
                    end
                else
                    return
                end
            end)()
        else
            for _, v365 in ipairs(p_u_354._queuedReject) do
                coroutine.wrap(v365)(...)
            end
        end
        p_u_354:_finalize()
    end
end
function v_u_44.prototype._finalize(p366)
    -- upvalues: (copy) v_u_44
    for _, v367 in ipairs(p366._queuedFinally) do
        coroutine.wrap(v367)(p366._status)
    end
    p366._queuedFinally = nil
    p366._queuedReject = nil
    p366._queuedResolve = nil
    if not v_u_44.TEST then
        p366._parent = nil
        p366._consumers = nil
    end
    task.defer(coroutine.close, p366._thread)
end
local function v372(p368, p369)
    -- upvalues: (copy) v_u_44, (ref) v_u_8
    local v370 = debug.traceback(nil, 2)
    if p368._status == v_u_44.Status.Resolved then
        return p368:_andThen(v370, function(...)
            return ...
        end)
    end
    local v371 = v_u_44.reject
    if p369 == nil then
        p369 = v_u_8.new({
            ["kind"] = v_u_8.Kind.NotResolvedInTime,
            ["error"] = "This Promise was not resolved in time for :now()",
            ["context"] = ":now() was called at:\n\n" .. v370
        }) or p369
    end
    return v371(p369)
end
v_u_44.prototype.now = v372
function v_u_44.retry(p_u_373, p_u_374, ...)
    -- upvalues: (copy) v_u_44
    local v375
    if type(p_u_373) == "function" then
        v375 = true
    elseif type(p_u_373) == "table" then
        local v376 = getmetatable(p_u_373)
        if v376 then
            local v377 = rawget(v376, "__call")
            v375 = type(v377) == "function"
        else
            v375 = false
        end
    else
        v375 = false
    end
    assert(v375, "Parameter #1 to Promise.retry must be a function")
    local v378 = type(p_u_374) == "number"
    assert(v378, "Parameter #2 to Promise.retry must be a number")
    local v_u_379 = { ... }
    local v_u_380 = select("#", ...)
    return v_u_44.resolve(p_u_373(...)):catch(function(...)
        -- upvalues: (copy) p_u_374, (ref) v_u_44, (copy) p_u_373, (copy) v_u_379, (copy) v_u_380
        if p_u_374 <= 0 then
            return v_u_44.reject(...)
        end
        local v381 = v_u_379
        local v382 = v_u_380
        return v_u_44.retry(p_u_373, p_u_374 - 1, unpack(v381, 1, v382))
    end)
end
function v_u_44.retryWithDelay(p_u_383, p_u_384, p_u_385, ...)
    -- upvalues: (copy) v_u_44
    local v386
    if type(p_u_383) == "function" then
        v386 = true
    elseif type(p_u_383) == "table" then
        local v387 = getmetatable(p_u_383)
        if v387 then
            local v388 = rawget(v387, "__call")
            v386 = type(v388) == "function"
        else
            v386 = false
        end
    else
        v386 = false
    end
    assert(v386, "Parameter #1 to Promise.retry must be a function")
    local v389 = type(p_u_384) == "number"
    assert(v389, "Parameter #2 (times) to Promise.retry must be a number")
    local v390 = type(p_u_385) == "number"
    assert(v390, "Parameter #3 (seconds) to Promise.retry must be a number")
    local v_u_391 = { ... }
    local v_u_392 = select("#", ...)
    return v_u_44.resolve(p_u_383(...)):catch(function(...)
        -- upvalues: (copy) p_u_384, (ref) v_u_44, (copy) p_u_385, (copy) p_u_383, (copy) v_u_391, (copy) v_u_392
        if p_u_384 <= 0 then
            return v_u_44.reject(...)
        end
        v_u_44.delay(p_u_385):await()
        local v393 = v_u_391
        local v394 = v_u_392
        return v_u_44.retryWithDelay(p_u_383, p_u_384 - 1, p_u_385, unpack(v393, 1, v394))
    end)
end
function v_u_44.fromEvent(p_u_395, p396)
    -- upvalues: (copy) v_u_44
    local v_u_397 = p396 or function()
        return true
    end
    return v_u_44._new(debug.traceback(nil, 2), function(p_u_398, _, p399)
        -- upvalues: (copy) p_u_395, (ref) v_u_397
        local v_u_400 = nil
        local v_u_401 = false
        local function v402()
            -- upvalues: (ref) v_u_400
            v_u_400:Disconnect()
            v_u_400 = nil
        end
        v_u_400 = p_u_395:Connect(function(...)
            -- upvalues: (ref) v_u_397, (copy) p_u_398, (ref) v_u_400, (ref) v_u_401
            local v403 = v_u_397(...)
            if v403 == true then
                p_u_398(...)
                if v_u_400 then
                    v_u_400:Disconnect()
                    v_u_400 = nil
                else
                    v_u_401 = true
                end
            else
                if type(v403) ~= "boolean" then
                    error("Promise.fromEvent predicate should always return a boolean")
                end
                return
            end
        end)
        if v_u_401 and v_u_400 then
            return v402()
        end
        p399(v402)
    end)
end
function v_u_44.onUnhandledRejection(p_u_404)
    -- upvalues: (copy) v_u_44
    local v405 = v_u_44._unhandledRejectionCallbacks
    table.insert(v405, p_u_404)
    return function()
        -- upvalues: (ref) v_u_44, (copy) p_u_404
        local v406 = table.find(v_u_44._unhandledRejectionCallbacks, p_u_404)
        if v406 then
            table.remove(v_u_44._unhandledRejectionCallbacks, v406)
        end
    end
end
return v_u_44

--========================================
-- ModuleScript : ReplicatedStorage.Packages._Index.evaera_promise@4.0.0.promise.init.spec
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v_u_1 = require(script.Parent)
    v_u_1.TEST = true
    local v_u_2 = Instance.new("BindableEvent")
    v_u_1._timeEvent = v_u_2.Event
    local v_u_3 = 0
    function v_u_1._getTime()
        -- upvalues: (ref) v_u_3
        return v_u_3
    end
    local function v_u_6(p4)
        -- upvalues: (ref) v_u_3, (copy) v_u_2
        local v5 = p4 or 0.016666666666666666
        v_u_3 = v_u_3 + v5
        v_u_2:Fire(v5)
    end
    local function v_u_7(...)
        return select("#", ...), { ... }
    end
    describe("Promise.Status", function()
        -- upvalues: (copy) v_u_1
        it("should error if indexing nil value", function()
            -- upvalues: (ref) v_u_1
            expect(function()
                -- upvalues: (ref) v_u_1
                local _ = v_u_1.Status.wrong
            end).to.throw()
        end)
    end)
    describe("Unhandled rejection signal", function()
        -- upvalues: (copy) v_u_1, (ref) v_u_6
        it("should call unhandled rejection callbacks", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_6
            local v_u_9 = v_u_1.new(function(_, p8)
                p8(1, 2)
            end)
            local v_u_10 = 0
            local function v14(p11, p12, p13)
                -- upvalues: (ref) v_u_10, (copy) v_u_9
                v_u_10 = v_u_10 + 1
                expect(p11).to.equal(v_u_9)
                expect(p12).to.equal(1)
                expect(p13).to.equal(2)
            end
            local v15 = v_u_1.onUnhandledRejection(v14)
            v_u_6()
            expect(v_u_10).to.equal(1)
            v15()
            v_u_1.new(function(_, p16)
                p16(3, 4)
            end)
            v_u_6()
            expect(v_u_10).to.equal(1)
        end)
    end)
    describe("Promise.new", function()
        -- upvalues: (copy) v_u_1
        it("should instantiate with a callback", function()
            -- upvalues: (ref) v_u_1
            local v17 = v_u_1.new(function() end)
            expect(v17).to.be.ok()
        end)
        it("should invoke the given callback with resolve and reject", function()
            -- upvalues: (ref) v_u_1
            local v_u_18 = 0
            local v_u_19 = nil
            local v_u_20 = nil
            local v23 = v_u_1.new(function(p21, p22)
                -- upvalues: (ref) v_u_18, (ref) v_u_19, (ref) v_u_20
                v_u_18 = v_u_18 + 1
                v_u_19 = p21
                v_u_20 = p22
            end)
            expect(v23).to.be.ok()
            expect(v_u_18).to.equal(1)
            expect(v_u_19).to.be.a("function")
            expect(v_u_20).to.be.a("function")
            expect(v23:getStatus()).to.equal(v_u_1.Status.Started)
        end)
        it("should resolve promises on resolve()", function()
            -- upvalues: (ref) v_u_1
            local v_u_24 = 0
            local v26 = v_u_1.new(function(p25)
                -- upvalues: (ref) v_u_24
                v_u_24 = v_u_24 + 1
                p25()
            end)
            expect(v26).to.be.ok()
            expect(v_u_24).to.equal(1)
            expect(v26:getStatus()).to.equal(v_u_1.Status.Resolved)
        end)
        it("should reject promises on reject()", function()
            -- upvalues: (ref) v_u_1
            local v_u_27 = 0
            local v29 = v_u_1.new(function(_, p28)
                -- upvalues: (ref) v_u_27
                v_u_27 = v_u_27 + 1
                p28()
            end)
            expect(v29).to.be.ok()
            expect(v_u_27).to.equal(1)
            expect(v29:getStatus()).to.equal(v_u_1.Status.Rejected)
        end)
        it("should reject on error in callback", function()
            -- upvalues: (ref) v_u_1
            local v_u_30 = 0
            local v31 = v_u_1.new(function()
                -- upvalues: (ref) v_u_30
                v_u_30 = v_u_30 + 1
                error("hahah")
            end)
            expect(v31).to.be.ok()
            expect(v_u_30).to.equal(1)
            expect(v31:getStatus()).to.equal(v_u_1.Status.Rejected)
            local v32 = expect
            local v33 = v31._values[1]
            v32(tostring(v33):find("hahah")).to.be.ok()
            local v34 = expect
            local v35 = v31._values[1]
            v34(tostring(v35):find("init.spec")).to.be.ok()
            local v36 = expect
            local v37 = v31._values[1]
            v36(tostring(v37):find("runExecutor")).to.be.ok()
        end)
        it("should work with C functions", function()
            -- upvalues: (ref) v_u_1
            expect(function()
                -- upvalues: (ref) v_u_1
                v_u_1.new(tick):andThen(tick)
            end).to.never.throw()
        end)
        it("should have a nice tostring", function()
            -- upvalues: (ref) v_u_1
            local v38 = expect
            local v39 = v_u_1.resolve
            v38(tostring(v39()):gmatch("Promise(Resolved)")).to.be.ok()
        end)
        it("should allow yielding", function()
            -- upvalues: (ref) v_u_1
            local v_u_40 = Instance.new("BindableEvent")
            local v42 = v_u_1.new(function(p41)
                -- upvalues: (copy) v_u_40
                v_u_40.Event:Wait()
                p41(5)
            end)
            expect(v42:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_40:Fire()
            expect(v42:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v42._values[1]).to.equal(5)
        end)
        it("should preserve stack traces of resolve-chained promises", function()
            -- upvalues: (ref) v_u_1
            local v44 = v_u_1.new(function(p43)
                -- upvalues: (ref) v_u_1
                p43(v_u_1.new(function()
                    error("sample text")
                end))
            end)
            expect(v44:getStatus()).to.equal(v_u_1.Status.Rejected)
            local v45 = v44._values[1]
            local v46 = tostring(v45)
            expect(v46:find("sample text")).to.be.ok()
            expect(v46:find("nestedCall")).to.be.ok()
            expect(v46:find("runExecutor")).to.be.ok()
            expect(v46:find("runPlanNode")).to.be.ok()
            expect(v46:find("...Rejected because it was chained to the following Promise, which encountered an error:")).to.be.ok()
        end)
        it("should report errors from Promises with _error (< v2)", function()
            -- upvalues: (ref) v_u_1
            local v47 = v_u_1.reject()
            v47._error = "Sample error"
            local v48 = v_u_1.resolve():andThenReturn(v47)
            expect(v48:getStatus()).to.equal(v_u_1.Status.Rejected)
            local v49 = v48._values[1]
            local v50 = tostring(v49)
            expect(v50:find("Sample error")).to.be.ok()
            expect(v50:find("...Rejected because it was chained to the following Promise, which encountered an error:")).to.be.ok()
            expect(v50:find("%[No stack trace available")).to.be.ok()
        end)
        it("should allow callable tables", function()
            -- upvalues: (ref) v_u_1
            local v52 = v_u_1.new((setmetatable({}, {
                ["__call"] = function(_, p51)
                    p51(1)
                end
            })))
            local v_u_53 = false
            local v55 = {
                ["__call"] = function(_, p54)
                    -- upvalues: (ref) v_u_53
                    expect(p54).to.equal(1)
                    v_u_53 = true
                end
            }
            v52:andThen((setmetatable({}, v55)))
            expect(v_u_53).to.equal(true)
        end)
        itSKIP("should close the thread after resolve", function()
            -- upvalues: (ref) v_u_1
            local v_u_56 = 0
            v_u_1.new(function(p57)
                -- upvalues: (ref) v_u_56, (ref) v_u_1
                v_u_56 = v_u_56 + 1
                p57()
                v_u_1.delay(1):await()
                v_u_56 = v_u_56 + 1
            end)
            task.wait(1)
            expect(v_u_56).to.equal(1)
        end)
    end)
    describe("Promise.defer", function()
        -- upvalues: (copy) v_u_1, (ref) v_u_6
        it("should execute after the time event", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_6
            local v_u_58 = 0
            local v63 = v_u_1.defer(function(p59, p60, p61, p62)
                -- upvalues: (ref) v_u_58
                expect((type(p59))).to.equal("function")
                expect((type(p60))).to.equal("function")
                expect((type(p61))).to.equal("function")
                expect((type(p62))).to.equal("nil")
                v_u_58 = v_u_58 + 1
                p59("foo")
            end)
            expect(v_u_58).to.equal(0)
            expect(v63:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_6()
            expect(v_u_58).to.equal(1)
            expect(v63:getStatus()).to.equal(v_u_1.Status.Resolved)
            v_u_6()
            expect(v_u_58).to.equal(1)
        end)
    end)
    describe("Promise.delay", function()
        -- upvalues: (copy) v_u_1, (ref) v_u_6
        it("should schedule promise resolution", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_6
            local v64 = v_u_1.delay(1)
            expect(v64:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_6()
            expect(v64:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_6(1)
            expect(v64:getStatus()).to.equal(v_u_1.Status.Resolved)
        end)
        it("should allow for delays to be cancelled", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_6
            local v_u_65 = v_u_1.delay(2)
            v_u_1.delay(1):andThen(function()
                -- upvalues: (copy) v_u_65
                v_u_65:cancel()
            end)
            expect(v_u_65:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_6()
            expect(v_u_65:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_6(1)
            expect(v_u_65:getStatus()).to.equal(v_u_1.Status.Cancelled)
            v_u_6(1)
        end)
    end)
    describe("Promise.resolve", function()
        -- upvalues: (copy) v_u_1
        it("should immediately resolve with a value", function()
            -- upvalues: (ref) v_u_1
            local v66 = v_u_1.resolve(5, 6)
            expect(v66).to.be.ok()
            expect(v66:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v66._values[1]).to.equal(5)
            expect(v66._values[2]).to.equal(6)
        end)
        it("should chain onto passed promises", function()
            -- upvalues: (ref) v_u_1
            local v68 = v_u_1.resolve(v_u_1.new(function(_, p67)
                p67(7)
            end))
            expect(v68).to.be.ok()
            expect(v68:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v68._values[1]).to.equal(7)
        end)
    end)
    describe("Promise.reject", function()
        -- upvalues: (copy) v_u_1
        it("should immediately reject with a value", function()
            -- upvalues: (ref) v_u_1
            local v69 = v_u_1.reject(6, 7)
            expect(v69).to.be.ok()
            expect(v69:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v69._values[1]).to.equal(6)
            expect(v69._values[2]).to.equal(7)
        end)
        it("should pass a promise as-is as an error", function()
            -- upvalues: (ref) v_u_1
            local v71 = v_u_1.new(function(p70)
                p70(6)
            end)
            local v72 = v_u_1.reject(v71)
            expect(v72).to.be.ok()
            expect(v72:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v72._values[1]).to.equal(v71)
        end)
    end)
    describe("Promise:andThen", function()
        -- upvalues: (copy) v_u_1, (copy) v_u_7
        it("should allow yielding", function()
            -- upvalues: (ref) v_u_1
            local v_u_73 = Instance.new("BindableEvent")
            local v74 = v_u_1.resolve():andThen(function()
                -- upvalues: (copy) v_u_73
                v_u_73.Event:Wait()
                return 5
            end)
            expect(v74:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_73:Fire()
            expect(v74:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v74._values[1]).to.equal(5)
        end)
        it("should run andThens on a new thread", function()
            -- upvalues: (ref) v_u_1
            local v_u_75 = Instance.new("BindableEvent")
            local v_u_76 = nil
            local v78 = v_u_1.new(function(p77)
                -- upvalues: (ref) v_u_76
                v_u_76 = p77
            end)
            local v79 = v78:andThen(function()
                -- upvalues: (copy) v_u_75
                v_u_75.Event:Wait()
                return 5
            end)
            local v80 = v78:andThen(function()
                return "foo"
            end)
            expect(v78:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_76()
            expect(v80:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v80._values[1]).to.equal("foo")
            expect(v79:getStatus()).to.equal(v_u_1.Status.Started)
        end)
        it("should chain onto resolved promises", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_7
            local v_u_81 = nil
            local v_u_82 = nil
            local v_u_83 = 0
            local v_u_84 = 0
            local v85 = v_u_1.resolve(5)
            local v88 = v85:andThen(function(...)
                -- upvalues: (ref) v_u_82, (ref) v_u_81, (ref) v_u_7, (ref) v_u_83
                local v86, v87 = v_u_7(...)
                v_u_82 = v86
                v_u_81 = v87
                v_u_83 = v_u_83 + 1
            end, function()
                -- upvalues: (ref) v_u_84
                v_u_84 = v_u_84 + 1
            end)
            expect(v_u_84).to.equal(0)
            expect(v_u_83).to.equal(1)
            expect(v_u_82).to.equal(1)
            expect(v_u_81[1]).to.equal(5)
            expect(v85).to.be.ok()
            expect(v85:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v85._values[1]).to.equal(5)
            expect(v88).to.be.ok()
            expect(v88).never.to.equal(v85)
            expect(v88:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(#v88._values).to.equal(0)
        end)
        it("should chain onto rejected promises", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_7
            local v_u_89 = nil
            local v_u_90 = nil
            local v_u_91 = 0
            local v_u_92 = 0
            local v93 = v_u_1.reject(5)
            local v96 = v93:andThen(function(...)
                -- upvalues: (ref) v_u_92
                v_u_92 = v_u_92 + 1
            end, function(...)
                -- upvalues: (ref) v_u_90, (ref) v_u_89, (ref) v_u_7, (ref) v_u_91
                local v94, v95 = v_u_7(...)
                v_u_90 = v94
                v_u_89 = v95
                v_u_91 = v_u_91 + 1
            end)
            expect(v_u_92).to.equal(0)
            expect(v_u_91).to.equal(1)
            expect(v_u_90).to.equal(1)
            expect(v_u_89[1]).to.equal(5)
            expect(v93).to.be.ok()
            expect(v93:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v93._values[1]).to.equal(5)
            expect(v96).to.be.ok()
            expect(v96).never.to.equal(v93)
            expect(v96:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(#v96._values).to.equal(0)
        end)
        it("should reject on error in callback", function()
            -- upvalues: (ref) v_u_1
            local v_u_97 = 0
            local v98 = v_u_1.resolve(1):andThen(function()
                -- upvalues: (ref) v_u_97
                v_u_97 = v_u_97 + 1
                error("hahah")
            end)
            expect(v98).to.be.ok()
            expect(v_u_97).to.equal(1)
            expect(v98:getStatus()).to.equal(v_u_1.Status.Rejected)
            local v99 = expect
            local v100 = v98._values[1]
            v99(tostring(v100):find("hahah")).to.be.ok()
            local v101 = expect
            local v102 = v98._values[1]
            v101(tostring(v102):find("init.spec")).to.be.ok()
            local v103 = expect
            local v104 = v98._values[1]
            v103(tostring(v104):find("runExecutor")).to.be.ok()
        end)
        it("should chain onto asynchronously resolved promises", function()
            -- upvalues: (ref) v_u_1
            local v_u_105 = nil
            local v_u_106 = nil
            local v_u_107 = 0
            local v_u_108 = 0
            local v_u_109 = nil
            local v111 = v_u_1.new(function(p110)
                -- upvalues: (ref) v_u_109
                v_u_109 = p110
            end)
            local v112 = v111:andThen(function(...)
                -- upvalues: (ref) v_u_105, (ref) v_u_106, (ref) v_u_107
                v_u_105 = { ... }
                v_u_106 = select("#", ...)
                v_u_107 = v_u_107 + 1
            end, function()
                -- upvalues: (ref) v_u_108
                v_u_108 = v_u_108 + 1
            end)
            expect(v_u_107).to.equal(0)
            expect(v_u_108).to.equal(0)
            v_u_109(6)
            expect(v_u_108).to.equal(0)
            expect(v_u_107).to.equal(1)
            expect(v_u_106).to.equal(1)
            expect(v_u_105[1]).to.equal(6)
            expect(v111).to.be.ok()
            expect(v111:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v111._values[1]).to.equal(6)
            expect(v112).to.be.ok()
            expect(v112).never.to.equal(v111)
            expect(v112:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(#v112._values).to.equal(0)
        end)
        it("should chain onto asynchronously rejected promises", function()
            -- upvalues: (ref) v_u_1
            local v_u_113 = nil
            local v_u_114 = nil
            local v_u_115 = 0
            local v_u_116 = 0
            local v_u_117 = nil
            local v119 = v_u_1.new(function(_, p118)
                -- upvalues: (ref) v_u_117
                v_u_117 = p118
            end)
            local v120 = v119:andThen(function()
                -- upvalues: (ref) v_u_116
                v_u_116 = v_u_116 + 1
            end, function(...)
                -- upvalues: (ref) v_u_113, (ref) v_u_114, (ref) v_u_115
                v_u_113 = { ... }
                v_u_114 = select("#", ...)
                v_u_115 = v_u_115 + 1
            end)
            expect(v_u_115).to.equal(0)
            expect(v_u_116).to.equal(0)
            v_u_117(6)
            expect(v_u_116).to.equal(0)
            expect(v_u_115).to.equal(1)
            expect(v_u_114).to.equal(1)
            expect(v_u_113[1]).to.equal(6)
            expect(v119).to.be.ok()
            expect(v119:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v119._values[1]).to.equal(6)
            expect(v120).to.be.ok()
            expect(v120).never.to.equal(v119)
            expect(v120:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(#v120._values).to.equal(0)
        end)
        it("should propagate errors through multiple levels", function()
            -- upvalues: (ref) v_u_1
            local v_u_121 = nil
            local v_u_122 = nil
            local v_u_123 = nil
            v_u_1.new(function(_, p124)
                p124(1, 2, 3)
            end):andThen(function() end):catch(function(p125, p126, p127)
                -- upvalues: (ref) v_u_121, (ref) v_u_122, (ref) v_u_123
                v_u_121 = p125
                v_u_122 = p126
                v_u_123 = p127
            end)
            expect(v_u_121).to.equal(1)
            expect(v_u_122).to.equal(2)
            expect(v_u_123).to.equal(3)
        end)
        it("should not call queued callbacks from a cancelled sub-promise", function()
            -- upvalues: (ref) v_u_1
            local v_u_128 = nil
            local v_u_129 = 0
            local v131 = v_u_1.new(function(p130)
                -- upvalues: (ref) v_u_128
                v_u_128 = p130
            end)
            v131:andThen(function()
                -- upvalues: (ref) v_u_129
                v_u_129 = v_u_129 + 1
            end)
            v131:andThen(function()
                -- upvalues: (ref) v_u_129
                v_u_129 = v_u_129 + 1
            end):cancel()
            v_u_128("foo")
            expect(v_u_129).to.equal(1)
        end)
    end)
    describe("Promise:cancel", function()
        -- upvalues: (copy) v_u_1, (ref) v_u_6
        it("should mark promises as cancelled and not resolve or reject them", function()
            -- upvalues: (ref) v_u_1
            local v_u_132 = 0
            local v_u_133 = 0
            local v134 = v_u_1.new(function() end):andThen(function()
                -- upvalues: (ref) v_u_132
                v_u_132 = v_u_132 + 1
            end):finally(function()
                -- upvalues: (ref) v_u_133
                v_u_133 = v_u_133 + 1
            end)
            v134:cancel()
            v134:cancel()
            expect(v_u_132).to.equal(0)
            expect(v_u_133).to.equal(1)
            expect(v134:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should call the cancellation hook once", function()
            -- upvalues: (ref) v_u_1
            local v_u_135 = 0
            local v137 = v_u_1.new(function(_, _, p136)
                -- upvalues: (ref) v_u_135
                p136(function()
                    -- upvalues: (ref) v_u_135
                    v_u_135 = v_u_135 + 1
                end)
            end)
            v137:cancel()
            v137:cancel()
            expect(v_u_135).to.equal(1)
        end)
        it("should propagate cancellations", function()
            -- upvalues: (ref) v_u_1
            local v138 = v_u_1.new(function() end)
            local v139 = v138:andThen()
            local v140 = v138:andThen()
            expect(v138:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v139:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v140:getStatus()).to.equal(v_u_1.Status.Started)
            v139:cancel()
            expect(v138:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v139:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v140:getStatus()).to.equal(v_u_1.Status.Started)
            v140:cancel()
            expect(v138:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v139:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v140:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should affect downstream promises", function()
            -- upvalues: (ref) v_u_1
            local v141 = v_u_1.new(function() end)
            local v142 = v141:andThen()
            v141:cancel()
            expect(v142:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should track consumers", function()
            -- upvalues: (ref) v_u_1
            local v_u_143 = v_u_1.new(function() end)
            local v144 = v_u_1.resolve()
            local v_u_145 = v144:andThen(function()
                -- upvalues: (copy) v_u_143
                return v_u_143
            end)
            local v147 = v_u_1.new(function(p146)
                -- upvalues: (copy) v_u_145
                p146(v_u_145)
            end)
            local v148 = v147:andThen(function() end)
            expect(v_u_145._parent).to.never.equal(v144)
            expect(v147._parent).to.never.equal(v_u_145)
            expect(v147._consumers[v148]).to.be.ok()
            expect(v148._parent).to.equal(v147)
        end)
        it("should cancel resolved pending promises", function()
            -- upvalues: (ref) v_u_1
            local v_u_149 = v_u_1.new(function() end)
            local v151 = v_u_1.new(function(p150)
                -- upvalues: (copy) v_u_149
                p150(v_u_149)
            end):finally(function() end)
            v151:cancel()
            expect(v_u_149._status).to.equal(v_u_1.Status.Cancelled)
            expect(v151._status).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should close the promise thread", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_6
            local v_u_152 = 0
            v_u_1.new(function()
                -- upvalues: (ref) v_u_152, (ref) v_u_1
                v_u_152 = v_u_152 + 1
                v_u_1.delay(1):await()
                v_u_152 = v_u_152 + 1
            end):cancel()
            v_u_6(2)
            expect(v_u_152).to.equal(1)
        end)
    end)
    describe("Promise:finally", function()
        -- upvalues: (copy) v_u_1
        it("should be called upon resolve, reject, or cancel", function()
            -- upvalues: (ref) v_u_1
            local v_u_153 = 0
            local function v154()
                -- upvalues: (ref) v_u_153
                v_u_153 = v_u_153 + 1
            end
            v_u_1.new(function(p155, _)
                p155()
            end):finally(v154)
            v_u_1.resolve():andThen(function() end):finally(v154):finally(v154)
            v_u_1.reject():finally(v154)
            v_u_1.new(function() end):finally(v154):cancel()
            expect(v_u_153).to.equal(5)
        end)
        it("should not forward return values", function()
            -- upvalues: (ref) v_u_1
            local v_u_156 = nil
            v_u_1.resolve(2):finally(function()
                return 1
            end):andThen(function(p157)
                -- upvalues: (ref) v_u_156
                v_u_156 = p157
            end)
            expect(v_u_156).to.equal(2)
        end)
        it("should not consume rejections", function()
            -- upvalues: (ref) v_u_1
            local v_u_158 = false
            local v_u_159 = false
            v_u_1.reject(5):finally(function()
                return 42
            end):andThen(function()
                -- upvalues: (ref) v_u_159
                v_u_159 = true
            end):catch(function(p160)
                -- upvalues: (ref) v_u_158
                v_u_158 = true
                expect(p160).to.equal(5)
            end)
            expect(v_u_158).to.equal(true)
            expect(v_u_159).to.equal(false)
        end)
        it("should wait for returned promises", function()
            -- upvalues: (ref) v_u_1
            local v_u_161 = nil
            local v163 = v_u_1.reject("foo"):finally(function()
                -- upvalues: (ref) v_u_1, (ref) v_u_161
                return v_u_1.new(function(p162)
                    -- upvalues: (ref) v_u_161
                    v_u_161 = p162
                end)
            end)
            expect(v163:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_161()
            expect(v163:getStatus()).to.equal(v_u_1.Status.Rejected)
            local _, v164 = v163:_unwrap()
            expect(v164).to.equal("foo")
        end)
        it("should reject with a returned rejected promise\'s value", function()
            -- upvalues: (ref) v_u_1
            local v_u_165 = nil
            local v167 = v_u_1.reject("foo"):finally(function()
                -- upvalues: (ref) v_u_1, (ref) v_u_165
                return v_u_1.new(function(_, p166)
                    -- upvalues: (ref) v_u_165
                    v_u_165 = p166
                end)
            end)
            expect(v167:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_165("bar")
            expect(v167:getStatus()).to.equal(v_u_1.Status.Rejected)
            local _, v168 = v167:_unwrap()
            expect(v168).to.equal("bar")
        end)
        it("should reject when handler errors", function()
            -- upvalues: (ref) v_u_1
            local v_u_169 = {}
            local v170, v171 = v_u_1.reject("bar"):finally(function()
                -- upvalues: (copy) v_u_169
                error(v_u_169)
            end):_unwrap()
            expect(v170).to.equal(false)
            expect(v171).to.equal(v_u_169)
        end)
        it("should not prevent cancellation", function()
            -- upvalues: (ref) v_u_1
            local v172 = v_u_1.new(function() end)
            local v_u_173 = false
            v172:finally(function()
                -- upvalues: (ref) v_u_173
                v_u_173 = true
            end)
            v172:andThen(function() end):cancel()
            expect(v172:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v_u_173).to.equal(true)
        end)
        it("should propagate cancellation downwards", function()
            -- upvalues: (ref) v_u_1
            local v_u_174 = false
            local v175 = v_u_1.new(function() end)
            local v176 = v175:finally(function()
                -- upvalues: (ref) v_u_174
                v_u_174 = true
            end)
            v175:cancel()
            expect(v175:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v176:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v_u_174).to.equal(true)
            expect(false).to.equal(false)
        end)
        it("should propagate cancellation upwards", function()
            -- upvalues: (ref) v_u_1
            local v_u_177 = false
            local v178 = v_u_1.new(function() end)
            local v179 = v178:finally(function()
                -- upvalues: (ref) v_u_177
                v_u_177 = true
            end)
            v179:cancel()
            expect(v178:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v179:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v_u_177).to.equal(true)
            expect(false).to.equal(false)
        end)
        it("should cancel returned promise if cancelled", function()
            -- upvalues: (ref) v_u_1
            local v_u_180 = v_u_1.new(function() end)
            v_u_1.resolve():finally(function()
                -- upvalues: (copy) v_u_180
                return v_u_180
            end):cancel()
            expect(v_u_180:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
    end)
    describe("Promise.all", function()
        -- upvalues: (copy) v_u_1, (copy) v_u_7
        it("should error if given something other than a table", function()
            -- upvalues: (ref) v_u_1
            expect(function()
                -- upvalues: (ref) v_u_1
                v_u_1.all(1)
            end).to.throw()
        end)
        it("should resolve instantly with an empty table if given no promises", function()
            -- upvalues: (ref) v_u_1
            local v181 = v_u_1.all({})
            local v182, v183 = v181:_unwrap()
            expect(v182).to.equal(true)
            expect(v181:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v183).to.be.a("table")
            expect(next(v183)).to.equal(nil)
        end)
        it("should error if given non-promise values", function()
            -- upvalues: (ref) v_u_1
            expect(function()
                -- upvalues: (ref) v_u_1
                v_u_1.all({
                    {},
                    {},
                    {}
                })
            end).to.throw()
        end)
        it("should wait for all promises to be resolved and return their values", function()
            -- upvalues: (ref) v_u_7, (ref) v_u_1
            local v184, v_u_185 = v_u_7(1, "A string", nil, false)
            local v_u_186 = {}
            local v187 = {}
            for v_u_188 = 1, v184 do
                v187[v_u_188] = v_u_1.new(function(p189)
                    -- upvalues: (copy) v_u_186, (copy) v_u_188, (copy) v_u_185
                    v_u_186[v_u_188] = { p189, v_u_185[v_u_188] }
                end)
            end
            local v190 = v_u_1.all(v187)
            for _, v191 in ipairs(v_u_186) do
                expect(v190:getStatus()).to.equal(v_u_1.Status.Started)
                v191[1](v191[2])
            end
            local v192, v193 = v_u_7(v190:_unwrap())
            local v194, v195 = unpack(v193, 1, v192)
            expect(v192).to.equal(2)
            expect(v194).to.equal(true)
            expect(v195).to.be.a("table")
            expect(#v195).to.equal(#v187)
            for v196 = 1, v184 do
                expect(v195[v196]).to.equal(v_u_185[v196])
            end
        end)
        it("should reject if any individual promise rejected", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_7
            local v_u_197 = nil
            local v_u_198 = nil
            local v200 = v_u_1.new(function(_, p199)
                -- upvalues: (ref) v_u_197
                v_u_197 = p199
            end)
            local v202 = v_u_1.new(function(p201)
                -- upvalues: (ref) v_u_198
                v_u_198 = p201
            end)
            local v203 = v_u_1.all({ v200, v202 })
            expect(v203:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_197("baz", "qux")
            v_u_198("foo", "bar")
            local v204, v205 = v_u_7(v203:_unwrap())
            local v206, v207, v208 = unpack(v205, 1, v204)
            expect(v204).to.equal(3)
            expect(v206).to.equal(false)
            expect(v207).to.equal("baz")
            expect(v208).to.equal("qux")
            expect(v202:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should not resolve if resolved after rejecting", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_7
            local v_u_209 = nil
            local v_u_210 = nil
            local v213 = { v_u_1.new(function(_, p211)
                    -- upvalues: (ref) v_u_209
                    v_u_209 = p211
                end), (v_u_1.new(function(p212)
                    -- upvalues: (ref) v_u_210
                    v_u_210 = p212
                end)) }
            local v214 = v_u_1.all(v213)
            expect(v214:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_209("baz", "qux")
            v_u_210("foo", "bar")
            local v215, v216 = v_u_7(v214:_unwrap())
            local v217, v218, v219 = unpack(v216, 1, v215)
            expect(v215).to.equal(3)
            expect(v217).to.equal(false)
            expect(v218).to.equal("baz")
            expect(v219).to.equal("qux")
        end)
        it("should only reject once", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_7
            local v_u_220 = nil
            local v_u_221 = nil
            local v224 = { v_u_1.new(function(_, p222)
                    -- upvalues: (ref) v_u_220
                    v_u_220 = p222
                end), (v_u_1.new(function(_, p223)
                    -- upvalues: (ref) v_u_221
                    v_u_221 = p223
                end)) }
            local v225 = v_u_1.all(v224)
            expect(v225:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_220("foo", "bar")
            expect(v225:getStatus()).to.equal(v_u_1.Status.Rejected)
            v_u_221("baz", "qux")
            local v226, v227 = v_u_7(v225:_unwrap())
            local v228, v229, v230 = unpack(v227, 1, v226)
            expect(v226).to.equal(3)
            expect(v228).to.equal(false)
            expect(v229).to.equal("foo")
            expect(v230).to.equal("bar")
        end)
        it("should error if a non-array table is passed in", function()
            -- upvalues: (ref) v_u_1
            local v231, v232 = pcall(function()
                -- upvalues: (ref) v_u_1
                v_u_1.all(v_u_1.new(function() end))
            end)
            expect(v231).to.be.ok()
            expect(v232:find("Non%-promise")).to.be.ok()
        end)
        it("should cancel pending promises if one rejects", function()
            -- upvalues: (ref) v_u_1
            local v233 = v_u_1.new(function() end)
            expect(v_u_1.all({ v_u_1.resolve(), v_u_1.reject(), v233 }):getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v233:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should cancel promises if it is cancelled", function()
            -- upvalues: (ref) v_u_1
            local v234 = v_u_1.new(function() end)
            v234:andThen(function() end)
            local v235 = { v_u_1.new(function() end), v_u_1.new(function() end), v234 }
            v_u_1.all(v235):cancel()
            expect(v235[1]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v235[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v235[3]:getStatus()).to.equal(v_u_1.Status.Started)
        end)
    end)
    describe("Promise.fold", function()
        -- upvalues: (copy) v_u_1, (ref) v_u_6
        it("should return the initial value in a promise when the list is empty", function()
            -- upvalues: (ref) v_u_1
            local v236 = {}
            local v237 = v_u_1.fold({}, function()
                error("should not be called")
            end, v236)
            expect(v_u_1.is(v237)).to.equal(true)
            expect(v237:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v237:expect()).to.equal(v236)
        end)
        it("should accept promises in the list", function()
            -- upvalues: (ref) v_u_1
            local v_u_238 = nil
            local v242 = v_u_1.fold({ v_u_1.new(function(p239)
                    -- upvalues: (ref) v_u_238
                    v_u_238 = p239
                end), 2, 3 }, function(p240, p241)
                return p240 + p241
            end, 0)
            v_u_238(1)
            expect(v_u_1.is(v242)).to.equal(true)
            expect(v242:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v242:expect()).to.equal(6)
        end)
        it("should always return a promise even if the list or reducer don\'t use them", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_6
            local v246 = v_u_1.fold({ 1, 2, 3 }, function(p243, p244, p245)
                -- upvalues: (ref) v_u_1
                if p245 == 2 then
                    return v_u_1.delay(1):andThenReturn(p243 + p244)
                else
                    return p243 + p244
                end
            end, 0)
            expect(v_u_1.is(v246)).to.equal(true)
            expect(v246:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_6(2)
            expect(v246:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v246:expect()).to.equal(6)
        end)
        it("should return the first rejected promise", function()
            -- upvalues: (ref) v_u_1
            local v250 = v_u_1.fold({ 1, 2, 3 }, function(p247, p248, p249)
                -- upvalues: (ref) v_u_1
                if p249 == 2 then
                    return v_u_1.reject("foo")
                else
                    return p247 + p248
                end
            end, 0)
            expect(v_u_1.is(v250)).to.equal(true)
            local v251, v252 = v250:awaitStatus()
            expect(v251).to.equal(v_u_1.Status.Rejected)
            expect(v252).to.equal("foo")
        end)
        it("should return the first canceled promise", function()
            -- upvalues: (ref) v_u_1
            local v_u_253 = nil
            local v257 = v_u_1.fold({ 1, 2, 3 }, function(p254, p255, p256)
                -- upvalues: (ref) v_u_253, (ref) v_u_1
                if p256 == 1 then
                    return p254 + p255
                end
                if p256 == 2 then
                    v_u_253 = v_u_1.delay(1):andThenReturn(p254 + p255)
                    return v_u_253
                end
                error("this should not run if the promise is cancelled")
            end, 0)
            expect(v_u_1.is(v257)).to.equal(true)
            expect(v257:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_253:cancel()
            expect(v257:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
    end)
    describe("Promise.race", function()
        -- upvalues: (copy) v_u_1
        it("should resolve with the first settled value", function()
            -- upvalues: (ref) v_u_1
            local v259 = v_u_1.race({ v_u_1.resolve(1), v_u_1.resolve(2) }):andThen(function(p258)
                expect(p258).to.equal(1)
            end)
            expect(v259:getStatus()).to.equal(v_u_1.Status.Resolved)
        end)
        it("should cancel other promises", function()
            -- upvalues: (ref) v_u_1
            local v260 = v_u_1.new(function() end)
            v260:andThen(function() end)
            local v262 = { v260, v_u_1.new(function() end), v_u_1.new(function(p261)
                    p261(2)
                end) }
            local v263 = v_u_1.race(v262)
            expect(v263:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v263._values[1]).to.equal(2)
            expect(v262[1]:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v262[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v262[3]:getStatus()).to.equal(v_u_1.Status.Resolved)
            local v264 = v_u_1.new(function() end)
            expect(v_u_1.race({ v_u_1.reject(), v_u_1.resolve(), v264 }):getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v264:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should error if a non-array table is passed in", function()
            -- upvalues: (ref) v_u_1
            local v265, v266 = pcall(function()
                -- upvalues: (ref) v_u_1
                v_u_1.race(v_u_1.new(function() end))
            end)
            expect(v265).to.be.ok()
            expect(v266:find("Non%-promise")).to.be.ok()
        end)
        it("should cancel promises if it is cancelled", function()
            -- upvalues: (ref) v_u_1
            local v267 = v_u_1.new(function() end)
            v267:andThen(function() end)
            local v268 = { v_u_1.new(function() end), v_u_1.new(function() end), v267 }
            v_u_1.race(v268):cancel()
            expect(v268[1]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v268[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v268[3]:getStatus()).to.equal(v_u_1.Status.Started)
        end)
    end)
    describe("Promise.promisify", function()
        -- upvalues: (copy) v_u_1
        it("should wrap functions", function()
            -- upvalues: (ref) v_u_1
            local v270 = v_u_1.promisify(function(p269)
                return p269 + 1
            end)(1)
            local v271, v272 = v270:_unwrap()
            expect(v271).to.equal(true)
            expect(v270:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v272).to.equal(2)
        end)
        it("should catch errors after a yield", function()
            -- upvalues: (ref) v_u_1
            local v_u_273 = Instance.new("BindableEvent")
            local v274 = v_u_1.promisify(function()
                -- upvalues: (copy) v_u_273
                v_u_273.Event:Wait()
                error("errortext")
            end)()
            expect(v274:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_273:Fire()
            expect(v274:getStatus()).to.equal(v_u_1.Status.Rejected)
            local v275 = expect
            local v276 = v274._values[1]
            v275(tostring(v276):find("errortext")).to.be.ok()
        end)
    end)
    describe("Promise.tap", function()
        -- upvalues: (copy) v_u_1
        it("should thread through values", function()
            -- upvalues: (ref) v_u_1
            local v_u_277 = nil
            local v_u_278 = nil
            v_u_1.resolve(1):andThen(function(p279)
                return p279 + 1
            end):tap(function(p280)
                -- upvalues: (ref) v_u_277
                v_u_277 = p280
                return p280 + 1
            end):andThen(function(p281)
                -- upvalues: (ref) v_u_278
                v_u_278 = p281
            end)
            expect(v_u_277).to.equal(2)
            expect(v_u_278).to.equal(2)
        end)
        it("should chain onto promises", function()
            -- upvalues: (ref) v_u_1
            local v_u_282 = nil
            local v_u_283 = nil
            local v286 = v_u_1.resolve(1):tap(function()
                -- upvalues: (ref) v_u_1, (ref) v_u_282
                return v_u_1.new(function(p284)
                    -- upvalues: (ref) v_u_282
                    v_u_282 = p284
                end)
            end):andThen(function(p285)
                -- upvalues: (ref) v_u_283
                v_u_283 = p285
            end)
            expect(v286:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v_u_283).to.never.be.ok()
            v_u_282(1)
            expect(v286:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v_u_283).to.equal(1)
        end)
    end)
    describe("Promise.try", function()
        -- upvalues: (copy) v_u_1
        it("should catch synchronous errors", function()
            -- upvalues: (ref) v_u_1
            local v_u_287 = nil
            v_u_1.try(function()
                error("errortext")
            end):catch(function(p288)
                -- upvalues: (ref) v_u_287
                v_u_287 = tostring(p288)
            end)
            expect(v_u_287:find("errortext")).to.be.ok()
        end)
        it("should reject with error objects", function()
            -- upvalues: (ref) v_u_1
            local v_u_289 = {}
            local v290, v291 = v_u_1.try(function()
                -- upvalues: (copy) v_u_289
                error(v_u_289)
            end):_unwrap()
            expect(v290).to.equal(false)
            expect(v291).to.equal(v_u_289)
        end)
        it("should catch asynchronous errors", function()
            -- upvalues: (ref) v_u_1
            local v_u_292 = Instance.new("BindableEvent")
            local v293 = v_u_1.try(function()
                -- upvalues: (copy) v_u_292
                v_u_292.Event:Wait()
                error("errortext")
            end)
            expect(v293:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_292:Fire()
            expect(v293:getStatus()).to.equal(v_u_1.Status.Rejected)
            local v294 = expect
            local v295 = v293._values[1]
            v294(tostring(v295):find("errortext")).to.be.ok()
        end)
    end)
    describe("Promise:andThenReturn", function()
        -- upvalues: (copy) v_u_1
        it("should return the given values", function()
            -- upvalues: (ref) v_u_1
            local v_u_296 = nil
            local v_u_297 = nil
            v_u_1.resolve():andThenReturn(1, 2):andThen(function(p298, p299)
                -- upvalues: (ref) v_u_296, (ref) v_u_297
                v_u_296 = p298
                v_u_297 = p299
            end)
            expect(v_u_296).to.equal(1)
            expect(v_u_297).to.equal(2)
        end)
    end)
    describe("Promise:andThenCall", function()
        -- upvalues: (copy) v_u_1
        it("should call the given function with arguments", function()
            -- upvalues: (ref) v_u_1
            local v_u_300 = nil
            local v_u_301 = nil
            v_u_1.resolve():andThenCall(function(p302, p303)
                -- upvalues: (ref) v_u_300, (ref) v_u_301
                v_u_300 = p302
                v_u_301 = p303
            end, 3, 4)
            expect(v_u_300).to.equal(3)
            expect(v_u_301).to.equal(4)
        end)
    end)
    describe("Promise.some", function()
        -- upvalues: (copy) v_u_1
        it("should resolve once the goal is reached", function()
            -- upvalues: (ref) v_u_1
            local v304 = v_u_1.some({ v_u_1.resolve(1), v_u_1.reject(), v_u_1.resolve(2) }, 2)
            expect(v304:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v304._values[1][1]).to.equal(1)
            expect(v304._values[1][2]).to.equal(2)
        end)
        it("should error if the goal can\'t be reached", function()
            -- upvalues: (ref) v_u_1
            expect(v_u_1.some({ v_u_1.resolve(), v_u_1.reject() }, 2):getStatus()).to.equal(v_u_1.Status.Rejected)
            local v_u_305 = nil
            local v307 = v_u_1.some({ v_u_1.resolve(), v_u_1.new(function(_, p306)
                    -- upvalues: (ref) v_u_305
                    v_u_305 = p306
                end) }, 2)
            expect(v307:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_305("foo")
            expect(v307:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v307._values[1]).to.equal("foo")
        end)
        it("should cancel pending Promises once the goal is reached", function()
            -- upvalues: (ref) v_u_1
            local v_u_308 = nil
            local v309 = v_u_1.new(function() end)
            local v311 = v_u_1.new(function(p310)
                -- upvalues: (ref) v_u_308
                v_u_308 = p310
            end)
            local v312 = v_u_1.some({ v309, v311, v_u_1.resolve() }, 2)
            expect(v312:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v309:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v311:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_308()
            expect(v312:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v309:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v311:getStatus()).to.equal(v_u_1.Status.Resolved)
        end)
        it("should error if passed a non-number", function()
            -- upvalues: (ref) v_u_1
            expect(function()
                -- upvalues: (ref) v_u_1
                v_u_1.some({}, "non-number")
            end).to.throw()
        end)
        it("should return an empty array if amount is 0", function()
            -- upvalues: (ref) v_u_1
            local v313 = v_u_1.some({ v_u_1.resolve(2) }, 0)
            expect(v313:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(#v313._values[1]).to.equal(0)
        end)
        it("should not return extra values", function()
            -- upvalues: (ref) v_u_1
            local v314 = v_u_1.some({
                v_u_1.resolve(1),
                v_u_1.resolve(2),
                v_u_1.resolve(3),
                v_u_1.resolve(4)
            }, 2)
            expect(v314:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(#v314._values[1]).to.equal(2)
            expect(v314._values[1][1]).to.equal(1)
            expect(v314._values[1][2]).to.equal(2)
        end)
        it("should cancel promises if it is cancelled", function()
            -- upvalues: (ref) v_u_1
            local v315 = v_u_1.new(function() end)
            v315:andThen(function() end)
            local v316 = { v_u_1.new(function() end), v_u_1.new(function() end), v315 }
            v_u_1.some(v316, 3):cancel()
            expect(v316[1]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v316[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v316[3]:getStatus()).to.equal(v_u_1.Status.Started)
        end)
        describe("Promise.any", function()
            -- upvalues: (ref) v_u_1
            it("should return the value directly", function()
                -- upvalues: (ref) v_u_1
                local v317 = v_u_1.any({ v_u_1.reject(), v_u_1.reject(), v_u_1.resolve(1) })
                expect(v317:getStatus()).to.equal(v_u_1.Status.Resolved)
                expect(v317._values[1]).to.equal(1)
            end)
            it("should error if all are rejected", function()
                -- upvalues: (ref) v_u_1
                expect(v_u_1.any({ v_u_1.reject(), v_u_1.reject(), v_u_1.reject() }):getStatus()).to.equal(v_u_1.Status.Rejected)
            end)
        end)
    end)
    describe("Promise.allSettled", function()
        -- upvalues: (copy) v_u_1
        it("should resolve with an array of PromiseStatuses", function()
            -- upvalues: (ref) v_u_1
            local v_u_318 = nil
            local v320 = v_u_1.allSettled({
                v_u_1.resolve(),
                v_u_1.reject(),
                v_u_1.resolve(),
                v_u_1.new(function(_, p319)
                    -- upvalues: (ref) v_u_318
                    v_u_318 = p319
                end)
            })
            expect(v320:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_318()
            expect(v320:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v320._values[1][1]).to.equal(v_u_1.Status.Resolved)
            expect(v320._values[1][2]).to.equal(v_u_1.Status.Rejected)
            expect(v320._values[1][3]).to.equal(v_u_1.Status.Resolved)
            expect(v320._values[1][4]).to.equal(v_u_1.Status.Rejected)
        end)
        it("should cancel promises if it is cancelled", function()
            -- upvalues: (ref) v_u_1
            local v321 = v_u_1.new(function() end)
            v321:andThen(function() end)
            local v322 = { v_u_1.new(function() end), v_u_1.new(function() end), v321 }
            v_u_1.allSettled(v322):cancel()
            expect(v322[1]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v322[2]:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v322[3]:getStatus()).to.equal(v_u_1.Status.Started)
        end)
    end)
    describe("Promise:await", function()
        -- upvalues: (copy) v_u_1, (ref) v_u_6
        it("should return the correct values", function()
            -- upvalues: (ref) v_u_1
            local v323, v324, v325, v326, v327 = v_u_1.resolve(5, 6, nil, 7):await()
            expect(v323).to.equal(true)
            expect(v324).to.equal(5)
            expect(v325).to.equal(6)
            expect(v326).to.equal(nil)
            expect(v327).to.equal(7)
        end)
        it("should work if yielding is needed", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_6
            local v_u_328 = false
            task.spawn(function()
                -- upvalues: (ref) v_u_1, (ref) v_u_328
                local _, v329 = v_u_1.delay(1):await()
                expect((type(v329))).to.equal("number")
                v_u_328 = true
            end)
            v_u_6(2)
            expect(v_u_328).to.equal(true)
        end)
    end)
    describe("Promise:expect", function()
        -- upvalues: (copy) v_u_1
        it("should throw the correct values", function()
            -- upvalues: (ref) v_u_1
            local v330 = {}
            local v_u_331 = v_u_1.reject(v330)
            local v332, v333 = pcall(function()
                -- upvalues: (copy) v_u_331
                v_u_331:expect()
            end)
            expect(v332).to.equal(false)
            expect(v333).to.equal(v330)
        end)
    end)
    describe("Promise:now", function()
        -- upvalues: (copy) v_u_1
        it("should resolve if the Promise is resolved", function()
            -- upvalues: (ref) v_u_1
            local v334, v335 = v_u_1.resolve("foo"):now():_unwrap()
            expect(v334).to.equal(true)
            expect(v335).to.equal("foo")
        end)
        it("should reject if the Promise is not resolved", function()
            -- upvalues: (ref) v_u_1
            local v336, v337 = v_u_1.new(function() end):now():_unwrap()
            expect(v336).to.equal(false)
            expect(v_u_1.Error.isKind(v337, "NotResolvedInTime")).to.equal(true)
        end)
        it("should reject with a custom rejection value", function()
            -- upvalues: (ref) v_u_1
            local v338, v339 = v_u_1.new(function() end):now("foo"):_unwrap()
            expect(v338).to.equal(false)
            expect(v339).to.equal("foo")
        end)
    end)
    describe("Promise.each", function()
        -- upvalues: (copy) v_u_1
        it("should iterate", function()
            -- upvalues: (ref) v_u_1
            local v340, v341 = v_u_1.each({
                "foo",
                "bar",
                "baz",
                "qux"
            }, function(...)
                return { ... }
            end):_unwrap()
            expect(v340).to.equal(true)
            expect(v341[1][1]).to.equal("foo")
            expect(v341[1][2]).to.equal(1)
            expect(v341[2][1]).to.equal("bar")
            expect(v341[2][2]).to.equal(2)
            expect(v341[3][1]).to.equal("baz")
            expect(v341[3][2]).to.equal(3)
            expect(v341[4][1]).to.equal("qux")
            expect(v341[4][2]).to.equal(4)
        end)
        it("should iterate serially", function()
            -- upvalues: (ref) v_u_1
            local v_u_342 = {}
            local v_u_343 = {}
            local v349 = v_u_1.each({ "foo", "bar", "baz" }, function(p_u_344, p345)
                -- upvalues: (copy) v_u_343, (ref) v_u_1, (copy) v_u_342
                v_u_343[p345] = (v_u_343[p345] or 0) + 1
                return v_u_1.new(function(p_u_346)
                    -- upvalues: (ref) v_u_342, (copy) p_u_344
                    local v347 = v_u_342
                    local function v348()
                        -- upvalues: (copy) p_u_346, (ref) p_u_344
                        p_u_346(p_u_344:upper())
                    end
                    table.insert(v347, v348)
                end)
            end)
            expect(v349:getStatus()).to.equal(v_u_1.Status.Started)
            expect(#v_u_342).to.equal(1)
            expect(v_u_343[1]).to.equal(1)
            expect(v_u_343[2]).to.never.be.ok()
            table.remove(v_u_342, 1)()
            expect(v349:getStatus()).to.equal(v_u_1.Status.Started)
            expect(#v_u_342).to.equal(1)
            expect(v_u_343[1]).to.equal(1)
            expect(v_u_343[2]).to.equal(1)
            expect(v_u_343[3]).to.never.be.ok()
            table.remove(v_u_342, 1)()
            expect(v349:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v_u_343[1]).to.equal(1)
            expect(v_u_343[2]).to.equal(1)
            expect(v_u_343[3]).to.equal(1)
            table.remove(v_u_342, 1)()
            expect(v349:getStatus()).to.equal(v_u_1.Status.Resolved)
            local v350 = expect
            local v351 = v349._values[1]
            v350((type(v351))).to.equal("table")
            local v352 = expect
            local v353 = v349._values[2]
            v352((type(v353))).to.equal("nil")
            local v354 = v349._values[1]
            expect(v354[1]).to.equal("FOO")
            expect(v354[2]).to.equal("BAR")
            expect(v354[3]).to.equal("BAZ")
        end)
        it("should reject with the value if the predicate promise rejects", function()
            -- upvalues: (ref) v_u_1
            local v355 = v_u_1.each({ 1, 2, 3 }, function()
                -- upvalues: (ref) v_u_1
                return v_u_1.reject("foobar")
            end)
            expect(v355:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v355._values[1]).to.equal("foobar")
        end)
        it("should allow Promises to be in the list and wait when it gets to them", function()
            -- upvalues: (ref) v_u_1
            local v_u_356 = nil
            local v358 = { (v_u_1.new(function(p357)
                    -- upvalues: (ref) v_u_356
                    v_u_356 = p357
                end)) }
            local v360 = v_u_1.each(v358, function(p359)
                return p359 * 2
            end)
            expect(v360:getStatus()).to.equal(v_u_1.Status.Started)
            v_u_356(2)
            expect(v360:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v360._values[1][1]).to.equal(4)
        end)
        it("should reject with the value if a Promise from the list rejects", function()
            -- upvalues: (ref) v_u_1
            local v_u_361 = false
            local v362 = v_u_1.each({ 1, 2, v_u_1.reject("foobar") }, function(_)
                -- upvalues: (ref) v_u_361
                v_u_361 = true
                return "never"
            end)
            expect(v362:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v362._values[1]).to.equal("foobar")
            expect(v_u_361).to.equal(false)
        end)
        it("should reject immediately if there\'s a cancelled Promise in the list initially", function()
            -- upvalues: (ref) v_u_1
            local v363 = v_u_1.new(function() end)
            v363:cancel()
            local v_u_364 = false
            local v365 = v_u_1.each({ 1, 2, v363 }, function()
                -- upvalues: (ref) v_u_364
                v_u_364 = true
            end)
            expect(v365:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v_u_364).to.equal(false)
            expect(v365._values[1].kind).to.equal(v_u_1.Error.Kind.AlreadyCancelled)
        end)
        it("should stop iteration if Promise.each is cancelled", function()
            -- upvalues: (ref) v_u_1
            local v_u_366 = {}
            local v368 = v_u_1.each({ "foo", "bar", "baz" }, function(_, p367)
                -- upvalues: (copy) v_u_366, (ref) v_u_1
                v_u_366[p367] = (v_u_366[p367] or 0) + 1
                return v_u_1.new(function() end)
            end)
            expect(v368:getStatus()).to.equal(v_u_1.Status.Started)
            expect(v_u_366[1]).to.equal(1)
            expect(v_u_366[2]).to.never.be.ok()
            v368:cancel()
            expect(v368:getStatus()).to.equal(v_u_1.Status.Cancelled)
            expect(v_u_366[1]).to.equal(1)
            expect(v_u_366[2]).to.never.be.ok()
        end)
        it("should cancel the Promise returned from the predicate if Promise.each is cancelled", function()
            -- upvalues: (ref) v_u_1
            local v_u_369 = nil
            v_u_1.each({ "foo", "bar", "baz" }, function(_, _)
                -- upvalues: (ref) v_u_369, (ref) v_u_1
                v_u_369 = v_u_1.new(function() end)
                return v_u_369
            end):cancel()
            expect(v_u_369:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
        it("should cancel Promises in the list if Promise.each is cancelled", function()
            -- upvalues: (ref) v_u_1
            local v370 = v_u_1.new(function() end)
            v_u_1.each({ v370 }, function() end):cancel()
            expect(v370:getStatus()).to.equal(v_u_1.Status.Cancelled)
        end)
    end)
    describe("Promise.retry", function()
        -- upvalues: (copy) v_u_1
        it("should retry N times", function()
            -- upvalues: (ref) v_u_1
            local v_u_371 = 0
            local v373 = v_u_1.retry(function(p372)
                -- upvalues: (ref) v_u_371, (ref) v_u_1
                expect(p372).to.equal("foo")
                v_u_371 = v_u_371 + 1
                if v_u_371 == 5 then
                    return v_u_1.resolve("ok")
                else
                    return v_u_1.reject("fail")
                end
            end, 5, "foo")
            expect(v373:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v373._values[1]).to.equal("ok")
        end)
        it("should reject if threshold is exceeded", function()
            -- upvalues: (ref) v_u_1
            local v374 = v_u_1.retry(function()
                -- upvalues: (ref) v_u_1
                return v_u_1.reject("fail")
            end, 5)
            expect(v374:getStatus()).to.equal(v_u_1.Status.Rejected)
            expect(v374._values[1]).to.equal("fail")
        end)
    end)
    describe("Promise.retryWithDelay", function()
        -- upvalues: (copy) v_u_1, (ref) v_u_6
        it("should retry after a delay", function()
            -- upvalues: (ref) v_u_1, (ref) v_u_6
            local v_u_375 = 0
            local v377 = v_u_1.retryWithDelay(function(p376)
                -- upvalues: (ref) v_u_375, (ref) v_u_1
                expect(p376).to.equal("foo")
                v_u_375 = v_u_375 + 1
                if v_u_375 == 3 then
                    return v_u_1.resolve("ok")
                else
                    return v_u_1.reject("fail")
                end
            end, 3, 10, "foo")
            expect(v_u_375).to.equal(1)
            v_u_6(11)
            expect(v_u_375).to.equal(2)
            v_u_6(11)
            expect(v_u_375).to.equal(3)
            expect(v377:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v377._values[1]).to.equal("ok")
        end)
    end)
    describe("Promise.fromEvent", function()
        -- upvalues: (copy) v_u_1
        it("should convert a Promise into an event", function()
            -- upvalues: (ref) v_u_1
            local v378 = Instance.new("BindableEvent")
            local v379 = v_u_1.fromEvent(v378.Event)
            expect(v379:getStatus()).to.equal(v_u_1.Status.Started)
            v378:Fire("foo")
            expect(v379:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v379._values[1]).to.equal("foo")
        end)
        it("should convert a Promise into an event with the predicate", function()
            -- upvalues: (ref) v_u_1
            local v380 = Instance.new("BindableEvent")
            local v382 = v_u_1.fromEvent(v380.Event, function(p381)
                return p381 == "foo"
            end)
            expect(v382:getStatus()).to.equal(v_u_1.Status.Started)
            v380:Fire("bar")
            expect(v382:getStatus()).to.equal(v_u_1.Status.Started)
            v380:Fire("foo")
            expect(v382:getStatus()).to.equal(v_u_1.Status.Resolved)
            expect(v382._values[1]).to.equal("foo")
        end)
    end)
    describe("Promise.is", function()
        -- upvalues: (copy) v_u_1
        it("should work with current version", function()
            -- upvalues: (ref) v_u_1
            local v383 = v_u_1.resolve(1)
            expect(v_u_1.is(v383)).to.equal(true)
        end)
        it("should work with any object with an andThen", function()
            -- upvalues: (ref) v_u_1
            expect(v_u_1.is({
                ["andThen"] = function()
                    return 1
                end
            })).to.equal(true)
        end)
        it("should work with older promises", function()
            -- upvalues: (ref) v_u_1
            local v384 = {
                ["prototype"] = {}
            }
            v384.__index = v384.prototype
            function v384.prototype.andThen(_) end
            local v385 = setmetatable({}, v384)
            expect(v_u_1.is(v385)).to.equal(true)
        end)
    end)
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Modules.TypedPromise
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return require(game.ReplicatedStorage.Packages.promise)

--========================================
-- ModuleScript : ReplicatedStorage.Library.Modules.getRealCoins
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1)
    local v2 = workspace:WaitForChild("tower"):WaitForChild("maxCoins").Value
    local v3 = require(game.ReplicatedStorage.Configuration.getRewardFactor)(p1) * v2
    local v4 = game.ReplicatedStorage.data:FindFirstChild(p1.UserId)
    local v5 = v4.coinMultiplier.Value + workspace.tower.coinMultiplier.Value
    return v4.coins.Value + math.floor(v3) * v5
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Modules.skillHelpers
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.stringListContains)
local v_u_1 = require(game.ReplicatedStorage.Library.Utility.seperateArguments)
return {
    ["getRequirements"] = function(p2)
        -- upvalues: (copy) v_u_1
        local v3 = v_u_1(p2, "/")
        local v4 = v3[1]
        local v5 = v3[2]
        local v6 = game.StarterGui.levels.skills:FindFirstChild(v4)
        local v7 = {}
        local v8 = {}
        for _, v9 in pairs(v6:GetChildren()) do
            if v9:IsA("ImageLabel") and v9:FindFirstChild("unlocks") then
                local v10 = nil
                for _, v11 in pairs(v9.unlocks:GetChildren()) do
                    for _, v12 in pairs(v11:GetChildren()) do
                        if v12.Value == v5 then
                            v10 = v11
                        end
                    end
                end
                if v10 then
                    if v9.Name ~= "base" then
                        local v13 = v9.Name
                        table.insert(v8, v13)
                    end
                    for _, v14 in pairs(v9.unlocks:GetChildren()) do
                        for _, v15 in pairs(v14:GetChildren()) do
                            if v14 ~= v10 then
                                local v16 = v15.Value
                                table.insert(v7, v16)
                            end
                        end
                    end
                end
            end
        end
        return v8, v7
    end,
    ["getRequiring"] = function(p17)
        -- upvalues: (copy) v_u_1
        local v18 = v_u_1(p17, "/")
        local v19 = v18[1]
        local v20 = v18[2]
        local v21 = game.StarterGui.levels.skills:FindFirstChild(v19):FindFirstChild(v20)
        local v22 = {}
        if not v21:FindFirstChild("unlocks") then
            return v22
        end
        for _, v23 in pairs(v21.unlocks:GetChildren()) do
            for _, v24 in pairs(v23:GetChildren()) do
                local v25 = v24.Value
                table.insert(v22, v25)
            end
        end
        return v22
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.Library.Modules.tagMaster
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("CollectionService")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = typeof(p2) == "Instance"
    local v4 = "tagMaster expected parameter \'moduleContainer\' to be of type \'Instance\'. (got \'" .. typeof(p2) .. "\')"
    assert(v3, v4)
    if next(p2:GetChildren()) then
        local v5 = {}
        for _, v_u_6 in pairs(p2:GetChildren()) do
            if v_u_6:IsA("ModuleScript") then
                local v7, v8 = pcall(function()
                    -- upvalues: (copy) v_u_6
                    return require(v_u_6)
                end)
                if v7 then
                    v5[v_u_6.Name] = v8
                else
                    warn("tagMaster failed to initialize module \'" .. v_u_6.Name .. "\' due to \'" .. (v8 or "No response") .. "\'")
                end
            end
        end
        for v9, v_u_10 in pairs(v5) do
            for _, v_u_11 in pairs(v_u_1:GetTagged(v9)) do
                coroutine.wrap(function()
                    -- upvalues: (copy) v_u_10, (copy) v_u_11
                    v_u_10:AddTagged(v_u_11)
                end)()
            end
            v_u_1:GetInstanceAddedSignal(v9):Connect(function(p12)
                -- upvalues: (copy) v_u_10
                v_u_10:AddTagged(p12)
            end)
            v_u_1:GetInstanceRemovedSignal(v9):Connect(function(p13)
                -- upvalues: (copy) v_u_10
                v_u_10:RemoveTagged(p13)
            end)
        end
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Modules.textWriter
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.ReplicatedStorage.Assets.Models.TextWriter
return function(p2, p3, p4, p5, p6)
    -- upvalues: (copy) v_u_1
    local v7 = p2:upper()
    local v8 = Instance.new("Model")
    local v9 = Instance.new("Part")
    v9.Anchored = not p6
    v9.CanCollide = false
    v9.Transparency = 1
    v9.Parent = v8
    v8.PrimaryPart = v9
    local v10 = p5 or {}
    local v11 = 0
    local v12 = 1
    for v13, v14 in utf8.graphemes(v7) do
        local v15 = string.sub(v7, v13, v14)
        local v16 = v_u_1:FindFirstChild(v15)
        if v16 then
            local v17 = v16:Clone()
            v17.Size = v17.Size * p3
            local v18 = v10.depth or v17.Size.X
            local v19 = v17.Size.Y
            local v20 = v17.Size.Z
            v17.Size = Vector3.new(v18, v19, v20)
            if v15 == "." then
                local v21 = v11 + v17.Size.Z / 2
                local v22 = -p3 * 0.4
                v17.Position = Vector3.new(v21, v22, 0)
                v17.CFrame = v17.CFrame * CFrame.Angles(-1.5707963267948966, 0, -1.5707963267948966)
            else
                local v23 = v11 + v17.Size.Z / 2
                v17.Position = Vector3.new(v23)
            end
            v11 = v11 + (v10.monospace and p3 and p3 or v17.Size.Z + p4)
            v17.Color = v10.color or v17.Color
            v17.Material = v10.material or v17.Material
            v17.Transparency = v10.transparency or v17.Transparency
            v17.Parent = v8
        elseif v15 == " " or v15 == "_" then
            v11 = v11 + (p3 / 2 + p4)
        else
            warn((("textWriter: No character grapheme found for \"%*\"."):format(v15)))
        end
        v12 = v12 + 1
    end
    local v24 = v11 - p4
    v9.Size = Vector3.new(v24, p3, 1)
    local v25 = v24 / 2
    v9.Position = Vector3.new(v25)
    if p6 then
        for _, v26 in pairs(v8:GetChildren()) do
            if v26 ~= v9 then
                local v27 = Instance.new("ManualWeld")
                v27.Part0 = v9
                v27.Part1 = v26
                v27.C0 = v9.CFrame:Inverse() * v26.CFrame
                v27.Parent = v26
                v26.Anchored = false
            end
        end
    end
    return v8
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Modules.xpFormulas
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_13 = {
    ["getRequiredXp"] = function(p1)
        local v2 = math.sign(p1)
        local v3 = math.abs(p1)
        local v4 = v3 / 5
        return (v3 - math.floor(v4) * 2) * 100 * v2
    end,
    ["getTotalRequiredXp"] = function(p5)
        -- upvalues: (copy) v_u_13
        local v6 = math.sign(p5)
        local v7 = 0
        for v8 = 1, math.abs(p5) do
            v7 = v7 + v_u_13.getRequiredXp(v8)
        end
        return v6 * v7
    end,
    ["getLevel"] = function(p9)
        -- upvalues: (copy) v_u_13
        local v10 = math.sign(p9)
        local v11 = math.abs(p9)
        for v12 = 1, 1000000 do
            if v11 < v_u_13.getRequiredXp(v12) then
                return v10 * (v12 - 1)
            end
            v11 = v11 - v_u_13.getRequiredXp(v12)
        end
        return 1000000
    end,
    ["getSkillCost"] = function(_)
        return 1
    end
}
return v_u_13

--========================================
-- ModuleScript : ReplicatedStorage.Library.Shared.EventTimestamps
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["CHRISTMAS_SECTIONS_START"] = 1765623600,
    ["CHRISTMAS_SECTIONS_END"] = 1767589200,
    ["GIFT_OPENING_TIME"] = 1766638800
}

--========================================
-- ModuleScript : ReplicatedStorage.Library.Shared.PlacePermissions
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {
    ["CASUAL_SERVERS_ID"] = 1962086868,
    ["EVELYN_DEV_CASUAL_ID"] = 90821256595907,
    ["PRO_SERVERS_ID"] = 3582763398,
    ["EVELYN_DEV_PRO_ID"] = 130782057180437,
    ["TTOH_ID"] = 94971861814985,
    ["LEGACY_TTOH_ID"] = 2127551566,
    ["DEV_PLACE_ID"] = 2203399276,
    ["TOH_DEV"] = 78061339299150,
    ["EVENT_PLACE_ID"] = 7227293156,
    ["APPEALS_PLACE_ID"] = 5253186791,
    ["DEMO_PLACE_ID"] = 7237795212
}
local v2 = { v1.DEV_PLACE_ID, v1.DEMO_PLACE_ID, v1.EVELYN_DEV_PRO_ID }
local v3 = {
    v1.DEV_PLACE_ID,
    v1.DEMO_PLACE_ID,
    v1.EVELYN_DEV_CASUAL_ID,
    v1.EVELYN_DEV_PRO_ID,
    v1.TOH_DEV
}
local v4 = {
    ["ttoh"] = { v1.LEGACY_TTOH_ID, v1.TTOH_ID },
    ["pro"] = { v1.PRO_SERVERS_ID, v1.EVELYN_DEV_PRO_ID }
}
return {
    ["GAME_MODE"] = table.find(v4.ttoh, game.PlaceId) and "ttoh" or (table.find(v4.pro, game.PlaceId) and "pro" or "casual"),
    ["DATA_SAVING_ENABLED"] = game.PlaceId ~= v1.APPEALS_PLACE_ID,
    ["IS_PLACE_WHITELISTED"] = table.find(v2, game.PlaceId),
    ["IS_ANTICHEAT_ENABLED"] = game.PlaceId ~= v1.APPEALS_PLACE_ID,
    ["IS_DEV_SERVER"] = table.find(v3, game.PlaceId)
}

--========================================
-- ModuleScript : ReplicatedStorage.Library.Shared.SlidingObjectBehavior
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v2 = game:GetService("RunService")
local v_u_3 = math.sign
local v_u_4 = math.abs
local v_u_5 = {}
local function v_u_15(p6)
    if p6:GetAttribute("platform_anti_gravity") ~= false then
        local v_u_7 = p6.Attachment1.Parent
        local v_u_8 = v_u_7:FindFirstChild("AntiGravity")
        if not v_u_8 then
            v_u_8 = Instance.new("BodyForce")
            v_u_8.Name = "AntiGravity"
            v_u_8.Parent = v_u_7
        end
        v_u_7:GetPropertyChangedSignal("AssemblyMass"):Connect(function()
            -- upvalues: (copy) v_u_7, (ref) v_u_8
            local v9 = v_u_8
            local v10 = v_u_7.AssemblyMass * workspace.Gravity
            v9.Force = Vector3.new(0, v10, 0)
        end)
        local v11 = v_u_8
        local v12 = v_u_7.AssemblyMass * workspace.Gravity
        v11.Force = Vector3.new(0, v12, 0)
        task.wait(1)
        local v13 = v_u_8
        local v14 = v_u_7.AssemblyMass * workspace.Gravity
        v13.Force = Vector3.new(0, v14, 0)
        return v_u_8
    end
end
v2.Heartbeat:Connect(function()
    -- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
    for v16, v17 in pairs(v_u_5) do
        if os.clock() - v17.__nextTick > 0 then
            if v17.Object.Attachment0 and (v17.Object.Attachment1 and v17.Object.Parent) then
                local v18 = v17.Object.Attachment1.WorldPosition - v17.Object.Attachment0.WorldPosition
                local v19 = v17.Object.Attachment0.WorldAxis
                local v20 = v18[v17.Axis] / v19[v17.Axis]
                if v_u_4(v20) + 1 >= v_u_4(v17.Object.TargetPosition) and v_u_3(v20) == v_u_3(v17.Object.TargetPosition) then
                    v17.Object.TargetPosition = -v17.Object.TargetPosition
                end
                v17.__nextTick = os.clock() + 0.25 / (1 * v17.Object.Parent.Velocity.Magnitude + 1)
            else
                table.remove(v_u_5, v16)
            end
        end
    end
end)
workspace:GetPropertyChangedSignal("Gravity"):Connect(function()
    -- upvalues: (copy) v_u_5
    for _, v21 in pairs(v_u_5) do
        local v22 = v21.Object.Attachment1.Parent
        local v23 = v21.AntiGravity
        local v24 = v22.AssemblyMass * workspace.Gravity
        v23.Force = Vector3.new(0, v24, 0)
    end
end)
function v1.AddTagged(_, p25)
    -- upvalues: (copy) v_u_4, (copy) v_u_15, (copy) v_u_5
    task.wait(1)
    local v26 = p25.Attachment0
    if v26 and p25.Parent then
        local v27 = v_u_4(v26.WorldAxis.X)
        local v28 = v_u_4(v26.WorldAxis.Y)
        local v29 = v_u_4(v26.WorldAxis.Z)
        local v30 = v_u_5
        local v31 = {
            ["AntiGravity"] = v_u_15(p25),
            ["Axis"] = v28 < v27 and v29 < v27 and "X" or (v27 < v28 and v29 < v28 and "Y" or "Z"),
            ["Object"] = p25,
            ["__nextTick"] = 0
        }
        table.insert(v30, v31)
    end
end
function v1.RemoveTagged(_, p32)
    -- upvalues: (copy) v_u_5
    local v33 = table.find(v_u_5, p32)
    if v33 then
        table.remove(v_u_5, v33)
    end
end
return v1

--========================================
-- ModuleScript : ReplicatedStorage.Library.Utility.Base64
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["encode"] = function(p1, p2)
        local v3 = p2 or 0
        if p1 == 0 then
            return string.rep("A", (math.max(v3, 1)))
        end
        local v4 = ""
        while p1 > 0 or v3 > 0 do
            local v5 = p1 % 64
            v4 = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v5 + 1, v5 + 1) .. v4
            local v6 = p1 / 64
            p1 = math.floor(v6)
            v3 = v3 - 1
        end
        return v4
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.Library.Utility.colorFromId
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1)
    math.randomseed(p1 % 1073741824 + 6)
    local v2 = math.random()
    return Color3.fromHSV(v2, 1, 1)
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Utility.colorFromName
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1)
    local v2 = 0
    for v3 = 1, #p1 do
        v2 = v2 + (string.byte(p1, v3) - 81) * v3
    end
    math.randomseed(v2)
    local v4 = math.random()
    return Color3.fromHSV(v4, 1, 1)
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Utility.getAvatarThumbnail
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p_u_1, p_u_2)
    local v_u_3 = {
        Enum.ThumbnailSize.Size420x420,
        Enum.ThumbnailSize.Size352x352,
        Enum.ThumbnailSize.Size180x180,
        Enum.ThumbnailSize.Size150x150,
        Enum.ThumbnailSize.Size100x100
    }
    local v4 = nil
    for v_u_5 = 1, #v_u_3 do
        local v6, v7, v8 = pcall(function()
            -- upvalues: (copy) p_u_1, (copy) p_u_2, (copy) v_u_3, (copy) v_u_5
            return game.Players:GetUserThumbnailAsync(p_u_1, p_u_2, v_u_3[v_u_5])
        end)
        if v8 and v6 then
            return v7
        end
        if v6 and not v4 then
            v4 = v7
        end
    end
    return v4 or ""
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Utility.gridLayoutHelper
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
function indexOf(p1, p2)
    for v3, v4 in pairs(p1) do
        if v4 == p2 then
            return v3
        end
    end
end
return function(p5)
    local v9 = setmetatable({}, {
        ["__index"] = function(p6, p7)
            local v8 = {}
            rawset(p6, p7, v8)
            return v8
        end
    })
    local v10 = {}
    local v11 = {}
    local v12 = {}
    for _, v13 in pairs(p5:GetChildren()) do
        if v13:IsA("GuiObject") and v13.Visible then
            local v14 = v13.AbsolutePosition
            if not indexOf(v10, v14.Y) then
                local v15 = v14.Y
                table.insert(v10, v15)
            end
            if not indexOf(v11, v14.X) then
                local v16 = v14.X
                table.insert(v11, v16)
            end
            table.insert(v12, v13)
        end
    end
    table.sort(v11)
    table.sort(v10)
    for _, v17 in pairs(v12) do
        local v18 = v17.AbsolutePosition
        v9[indexOf(v10, v18.Y)][indexOf(v11, v18.X)] = v17
    end
    for v19, v20 in pairs(v9) do
        for v21, v22 in pairs(v20) do
            v22.NextSelectionUp = v9[v19 - 1][v21] or v9[v19 - 1][1]
            v22.NextSelectionDown = v9[v19 + 1][v21] or v9[v19 + 1][1]
            v22.NextSelectionLeft = v9[v19][v21 - 1]
            v22.NextSelectionRight = v9[v19][v21 + 1]
        end
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Utility.seperateArguments
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1, p2)
    local v3 = {}
    while true do
        local v4 = string.find(p1, p2 or ":", nil, true)
        if not v4 then
            break
        end
        local v5 = v4 - 1
        local v6 = string.sub(p1, 1, v5)
        table.insert(v3, v6)
        local v7 = v4 + 1
        p1 = string.sub(p1, v7, -1)
    end
    table.insert(v3, p1)
    return v3
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Utility.spaceOutByCapitals
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1)
    if type(p1) ~= "string" then
        return p1
    end
    while true do
        local v2, v3 = p1:find("%l%u")
        if not (v2 and v3) then
            break
        end
        p1 = p1:gsub("%l%u", ("%* %*"):format(p1:sub(v2, v2), (p1:sub(v3, v3))), 1)
        if p1:find("%l%u") == nil then
            break
        end
    end
    return p1
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Utility.stringListContains
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1, p2)
    for _, v3 in p1:split(";") do
        if v3 == p2 then
            return true
        end
    end
    return false
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Utility.thumbScroller
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p_u_1, p_u_2, p_u_3, p_u_4, p_u_5, p_u_6)
    local v_u_7 = 0
    local v_u_8 = 0
    game:GetService("UserInputService").InputChanged:Connect(function(p9)
        -- upvalues: (copy) p_u_1, (copy) p_u_4, (copy) p_u_2, (copy) p_u_5, (ref) v_u_8, (ref) v_u_7, (copy) p_u_3, (copy) p_u_6
        if p9.KeyCode == p_u_1 and not p_u_4 or p9.UserInputType == p_u_4 then
            local v10 = p9.Position[p_u_2]
            if (p_u_5 or 0.9) < math.abs(v10) and v_u_8 == 0 then
                local v11 = p9.Position[p_u_2]
                v_u_8 = math.sign(v11)
                while true do
                    local v12 = v_u_8
                    local v13 = p9.Position[p_u_2]
                    if v12 ~= math.sign(v13) then
                        break
                    end
                    local v14 = p9.Position[p_u_2]
                    if (p_u_5 or 0.9) >= math.abs(v14) then
                        break
                    end
                    v_u_7 = v_u_7 + 1
                    p_u_3(v_u_7 * v_u_8, v_u_8)
                    local v15 = 0
                    while true do
                        local v16 = v_u_8
                        local v17 = p9.Position[p_u_2]
                        if v16 ~= math.sign(v17) then
                            break
                        end
                        local v18 = p9.Position[p_u_2]
                        if (p_u_5 or 0.9) >= math.abs(v18) or v15 >= (p_u_6 or 0.5) / v_u_7 then
                            break
                        end
                        v15 = v15 + wait()
                    end
                end
                v_u_7 = 0
                v_u_8 = 0
            end
        end
    end)
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Utility.thumbScroller2D
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p_u_1, p_u_2, p_u_3, p_u_4, p_u_5)
    local v_u_6 = 0
    local v_u_7 = Vector3.new()
    local v_u_8 = 0
    game:GetService("UserInputService").InputChanged:Connect(function(p9)
        -- upvalues: (copy) p_u_1, (copy) p_u_3, (copy) p_u_4, (ref) v_u_7, (ref) v_u_8, (ref) v_u_6, (copy) p_u_2, (copy) p_u_5
        if p9.KeyCode == p_u_1 and not p_u_3 or p9.UserInputType == p_u_3 then
            local v10 = p9.Position.X
            local v11 = math.abs(v10)
            local v12 = p9.Position.Y
            local v13 = math.abs(v12) < v11
            local v14 = v13 and p9.Position.X or p9.Position.Y
            if (p_u_4 or 0.9) < math.abs(v14) then
                local v15 = math.sign(v14)
                local v16 = Vector3.new(v13 and v15 and v15 or 0, v13 and 0 or v15)
                if v_u_7 ~= Vector3.new() then
                    if v_u_7 ~= v16 then
                        v_u_6 = 0
                    end
                    v_u_7 = v16
                    return
                end
                v_u_7 = v16
                local v17 = v_u_8 + 1
                v_u_8 = v17
                while v_u_8 == v17 do
                    v_u_6 = v_u_6 + 1
                    p_u_2(v_u_7, v_u_7)
                    wait((p_u_5 or 0.5) / v_u_6)
                end
            else
                v_u_6 = 0
                v_u_7 = Vector3.new()
            end
        end
    end)
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Utility.thumbScrollerSmooth
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p_u_1, p_u_2, p_u_3, p_u_4, p_u_5)
    local v_u_6 = 0
    local v_u_7 = 0
    local function v14(p8)
        -- upvalues: (copy) p_u_1, (copy) p_u_4, (copy) p_u_2, (copy) p_u_5, (ref) v_u_7, (ref) v_u_6, (copy) p_u_3
        if p8.KeyCode == p_u_1 and not p_u_4 or p8.UserInputType == p_u_4 then
            local v9 = p8.Position[p_u_2]
            if (p_u_5 or 0.9) < math.abs(v9) and v_u_7 == 0 then
                local v10 = p8.Position[p_u_2]
                v_u_7 = math.sign(v10)
                while true do
                    local v11 = v_u_7
                    local v12 = p8.Position[p_u_2]
                    if v11 ~= math.sign(v12) then
                        break
                    end
                    local v13 = p8.Position[p_u_2]
                    if (p_u_5 or 0.9) >= math.abs(v13) then
                        break
                    end
                    v_u_6 = v_u_6 + wait()
                    p_u_3(v_u_7, v_u_6 * v_u_7, v_u_6 ^ 2 * v_u_7)
                end
                v_u_6 = 0
                v_u_7 = 0
            end
        end
    end
    game:GetService("UserInputService").InputChanged:Connect(v14)
end

--========================================
-- ModuleScript : ReplicatedStorage.Library.Utility.weightedRandom
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1)
    local v2 = 0
    for _, v3 in pairs(p1) do
        v2 = v2 + v3
    end
    local v4 = math.random(1, v2)
    for v5, v6 in pairs(p1) do
        v4 = v4 - v6
        if v4 <= 0 then
            return v5
        end
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.bunny
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["mutate"] = function()
        game.ReplicatedStorage.GameValues.bunnyJumping.Value = true
    end,
    ["revert"] = function()
        game.ReplicatedStorage.GameValues.bunnyJumping.Value = false
    end,
    ["isEnabled"] = function()
        return game.ReplicatedStorage.GameValues.bunnyJumping.Value
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.checkpoints
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = false
local function v8(p_u_2)
    -- upvalues: (ref) v_u_1
    p_u_2.CharacterAdded:Connect(function(p3)
        -- upvalues: (ref) v_u_1, (copy) p_u_2
        if v_u_1 then
            local v4 = game.ReplicatedStorage.data:FindFirstChild(p_u_2.UserId)
            if not (v4 and v4:FindFirstChild("unlockedCheckpoint")) then
                return
            end
            local v5 = v4.unlockedCheckpoint.Value
            local v6 = v5 <= 2 and -1 or v5
            for _, v7 in pairs(workspace.tower.sections:GetChildren()) do
                if v7.i.Value == v6 then
                    while p3:WaitForChild("Humanoid").Health <= 0 or not p3:IsDescendantOf(workspace) do
                        game:GetService("RunService").Heartbeat:Wait()
                    end
                    p3:WaitForChild("Head")
                    p3:WaitForChild("HumanoidRootPart")
                    p3:SetPrimaryPartCFrame(CFrame.new(v7.start.Position + Vector3.new(0, 6, 0)))
                    return
                end
            end
        end
    end)
end
local v_u_9 = v_u_1
for _, v_u_10 in pairs(game.Players:GetChildren()) do
    v_u_10.CharacterAdded:Connect(function(p11)
        -- upvalues: (ref) v_u_9, (copy) v_u_10
        if v_u_9 then
            local v12 = game.ReplicatedStorage.data:FindFirstChild(v_u_10.UserId)
            if not (v12 and v12:FindFirstChild("unlockedCheckpoint")) then
                return
            end
            local v13 = v12.unlockedCheckpoint.Value
            local v14 = v13 <= 2 and -1 or v13
            for _, v15 in pairs(workspace.tower.sections:GetChildren()) do
                if v15.i.Value == v14 then
                    while p11:WaitForChild("Humanoid").Health <= 0 or not p11:IsDescendantOf(workspace) do
                        game:GetService("RunService").Heartbeat:Wait()
                    end
                    p11:WaitForChild("Head")
                    p11:WaitForChild("HumanoidRootPart")
                    p11:SetPrimaryPartCFrame(CFrame.new(v15.start.Position + Vector3.new(0, 6, 0)))
                    return
                end
            end
        end
    end)
end
game.Players.ChildAdded:Connect(v8)
return {
    ["mutate"] = function()
        -- upvalues: (ref) v_u_9
        v_u_9 = true
    end,
    ["revert"] = function()
        -- upvalues: (ref) v_u_9
        v_u_9 = false
    end,
    ["isEnabled"] = function()
        -- upvalues: (ref) v_u_9
        return v_u_9
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.double coins
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = false
return {
    ["mutate"] = function()
        -- upvalues: (ref) v_u_1
        workspace.tower.coinMultiplier.Value = workspace.tower.coinMultiplier.Value + 1
        v_u_1 = true
    end,
    ["revert"] = function()
        -- upvalues: (ref) v_u_1
        workspace.tower.coinMultiplier.Value = workspace.tower.coinMultiplier.Value - 1
        v_u_1 = false
    end,
    ["isEnabled"] = function()
        -- upvalues: (ref) v_u_1
        return v_u_1
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.double jump
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["mutate"] = function()
        game.ReplicatedStorage.GameValues.globalJumps.Value = 1
    end,
    ["revert"] = function()
        game.ReplicatedStorage.GameValues.globalJumps.Value = 0
    end,
    ["isEnabled"] = function()
        return game.ReplicatedStorage.GameValues.globalJumps.Value > 0
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.fluffy
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v_u_2 = require(game.ServerScriptService.Modules.makeHumanoidFluffy)
local v_u_3 = nil
local v_u_4 = {}
local function v_u_6(p5)
    -- upvalues: (copy) v_u_2
    p5.Humanoid:WaitForChild("HumanoidDescription")
    v_u_2(p5.Humanoid)
end
function v1.mutate()
    -- upvalues: (copy) v_u_2, (ref) v_u_4, (copy) v_u_6, (ref) v_u_3
    local function v12(p7)
        -- upvalues: (ref) v_u_2, (ref) v_u_4, (ref) v_u_6
        if p7.Character then
            local v8 = p7.Character
            v8.Humanoid:WaitForChild("HumanoidDescription")
            v_u_2(v8.Humanoid)
        end
        local v9 = v_u_4
        local v10 = p7.CharacterAdded
        local v11 = v_u_6
        table.insert(v9, v10:connect(v11))
    end
    v_u_3 = game.Players.PlayerAdded:connect(v12)
    for _, v13 in pairs(game.Players:GetPlayers()) do
        if v13.Character then
            local v14 = v13.Character
            v14.Humanoid:WaitForChild("HumanoidDescription")
            v_u_2(v14.Humanoid)
        end
        local v15 = v_u_4
        local v16 = v13.CharacterAdded
        local v17 = v_u_6
        table.insert(v15, v16:connect(v17))
    end
end
function v1.revert()
    -- upvalues: (ref) v_u_3, (ref) v_u_4
    v_u_3:Disconnect()
    v_u_3 = nil
    for _, v18 in pairs(v_u_4) do
        v18:Disconnect()
    end
    v_u_4 = {}
    for _, v19 in pairs(game.Players:GetPlayers()) do
        if v19.Character and (v19.Character:FindFirstChild("Humanoid") and v19.Character:FindFirstChild("OriginalHumanoidDescription")) then
            v19.Character.Humanoid:ApplyDescription(v19.Character.OriginalHumanoidDescription)
        end
    end
end
function v1.isEnabled()
    -- upvalues: (ref) v_u_3
    return v_u_3 and true or false
end
return v1

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.fog
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["mutate"] = function()
        game.Lighting.FogEnd = 50
        game.Lighting.FogColor = Color3.new(0.75, 0.75, 0.75)
    end,
    ["revert"] = function()
        game.Lighting.FogEnd = 1200
        game.Lighting.FogColor = Color3.new(0.5, 0.5, 0.5)
    end,
    ["isEnabled"] = function()
        return game.Lighting.FogEnd == 50
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.gravity
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["mutate"] = function()
        workspace.Gravity = 147.14999999999998
    end,
    ["revert"] = function()
        workspace.Gravity = 196.2
    end,
    ["isEnabled"] = function()
        local v1 = workspace.Gravity
        return math.ceil(v1) ~= 197
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.invincibility
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v_u_2 = game.ReplicatedStorage.GameValues.killbricksDisabled
function v1.mutate()
    -- upvalues: (copy) v_u_2
    v_u_2.Value = true
end
function v1.revert()
    -- upvalues: (copy) v_u_2
    v_u_2.Value = false
end
function v1.isEnabled()
    -- upvalues: (copy) v_u_2
    return v_u_2.Value
end
return v1

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.invisibility
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v_u_2 = nil
local v_u_3 = {}
local function v_u_5(p4)
    p4.invisible.Value = true
end
function v1.mutate()
    -- upvalues: (ref) v_u_3, (copy) v_u_5, (ref) v_u_2
    local function v10(p6)
        -- upvalues: (ref) v_u_3, (ref) v_u_5
        if p6.Character then
            p6.Character.invisible.Value = true
        end
        local v7 = v_u_3
        local v8 = p6.CharacterAdded
        local v9 = v_u_5
        table.insert(v7, v8:connect(v9))
    end
    v_u_2 = game.Players.PlayerAdded:connect(v10)
    for _, v11 in pairs(game.Players:GetPlayers()) do
        if v11.Character then
            v11.Character.invisible.Value = true
        end
        local v12 = v_u_3
        local v13 = v11.CharacterAdded
        local v14 = v_u_5
        table.insert(v12, v13:connect(v14))
    end
end
function v1.revert()
    -- upvalues: (ref) v_u_2, (ref) v_u_3
    v_u_2:Disconnect()
    v_u_2 = nil
    for _, v15 in pairs(v_u_3) do
        v15:Disconnect()
    end
    v_u_3 = {}
    for _, v_u_16 in pairs(game.Players:GetPlayers()) do
        spawn(function()
            -- upvalues: (copy) v_u_16
            v_u_16.Character.invisible.Value = false
        end)
    end
end
function v1.isEnabled()
    -- upvalues: (ref) v_u_2
    return v_u_2 and true or false
end
return v1

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.lengthen
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.pitchforkGenerator.randomItem)
local v_u_2 = require(game.ServerScriptService.Modules.pitchforkGenerator.insertSection)
local v3 = {}
local v_u_4 = false
function v3.mutate(p5)
    -- upvalues: (ref) v_u_4, (copy) v_u_1, (copy) v_u_2
    v_u_4 = true
    if not p5 then
        local v6 = game.ServerStorage.vanilla:GetChildren()
        local v7 = {}
        for _, v8 in pairs(v6) do
            if not v8:FindFirstChild("weight") then
                error("No weight in section " .. v8.Name)
            end
            v7[v8] = v8.weight.Value
        end
        local v9 = v_u_1(v7):Clone()
        p5 = game.ServerStorage.sections:FindFirstChild(v9.Name)
    end
    local v10 = workspace.tower.sections:GetChildren()[1]
    for _, v11 in pairs(workspace.tower.sections:GetChildren()) do
        if v11.i.Value < v10.i.Value then
            v10 = v11
        end
    end
    local v12 = v10.PrimaryPart.CFrame
    v_u_2(p5, 1)
    local v13 = v10.PrimaryPart.CFrame * v12:Inverse()
    for _, v14 in pairs(game.Players:GetChildren()) do
        if v14.Character and (v14.Character.PrimaryPart and (v14.Character:FindFirstChild("currentSection") and v14.Character.currentSection.Value == 1)) then
            v14.Character:SetPrimaryPartCFrame(v13 * v14.Character:GetPrimaryPartCFrame())
        end
    end
end
function v3.revert()
    -- upvalues: (ref) v_u_4
    v_u_4 = false
end
function v3.isEnabled()
    -- upvalues: (ref) v_u_4
    return v_u_4
end
return v3

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.negative
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["mutate"] = function()
        game.Lighting.Negative.Enabled = true
        game:GetService("TweenService"):Create(game.Lighting.Negative, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            ["Saturation"] = -2
        }):Play()
    end,
    ["revert"] = function()
        local v1 = game:GetService("TweenService"):Create(game.Lighting.Negative, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            ["Saturation"] = 0
        })
        v1.Completed:Connect(function()
            game.Lighting.Negative.Enabled = false
        end)
        v1:Play()
    end,
    ["isEnabled"] = function()
        return game.Lighting.Negative.Enabled
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.speed
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["mutate"] = function()
        game.ReplicatedStorage.GameValues.globalSpeed.Value = game.ReplicatedStorage.GameValues.globalSpeed.Value * 1.25
    end,
    ["revert"] = function()
        game.ReplicatedStorage.GameValues.globalSpeed.Value = game.ReplicatedStorage.GameValues.globalSpeed.Value / 1.25
    end,
    ["isEnabled"] = function()
        return game.ReplicatedStorage.GameValues.globalSpeed.Value > 16
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.Mutators.time
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v_u_2 = false
function v1.mutate()
    -- upvalues: (ref) v_u_2
    game.ReplicatedStorage.GameValues.roundTimeout.Value = game.ReplicatedStorage.GameValues.roundTimeout.Value + 120
    v_u_2 = true
end
function v1.revert()
    -- upvalues: (ref) v_u_2
    game.ReplicatedStorage.GameValues.roundTimeout.Value = game.ReplicatedStorage.GameValues.roundTimeout.Value - 120
    v_u_2 = false
end
function v1.isEnabled()
    -- upvalues: (ref) v_u_2
    return v_u_2
end
return v1

--========================================
-- ModuleScript : ReplicatedStorage.Configuration.getRewardFactor
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1)
    local v2 = (game.ReplicatedStorage.data:FindFirstChild(p1.UserId).highestSection.Value - 2) / (workspace:WaitForChild("tower"):WaitForChild("sectionCount").Value - 2)
    return math.max(0, v2) ^ 2
end

--========================================
-- ModuleScript : ReplicatedStorage.Configuration.Effects.Boxes.Regular.filter
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    "Plastic Coil",
    "Smoke",
    "Special Trail",
    "Radiance",
    "Flames",
    "TwoColor Trail",
    "Solid Trail",
    "Fading Trail",
    "Wave Trail",
    "Pride Trail"
}
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = (p2:FindFirstChild("group") or p2.type).Value
    for _, v4 in pairs(v_u_1) do
        if v4 == v3 then
            return true
        end
    end
    return false
end

--========================================
-- ModuleScript : ReplicatedStorage.Configuration.Effects.Boxes.Premium.filter
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    "Coil Speed",
    "Coil Fusion",
    "Coil Gravity",
    "Hourglass",
    "Hook",
    "Trowel",
    "Halo",
    "Coil Hat",
    "Trail Tip",
    "Pride Trail"
}
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = (p2:FindFirstChild("group") or p2.type).Value
    for _, v4 in pairs(v_u_1) do
        if v4 == v3 then
            return true
        end
    end
    return false
end

--========================================
-- ModuleScript : TestService.RobloxLSP_Settings
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["port"] = 27843,
    ["startAutomatically"] = false,
    ["exclude"] = {}
}
