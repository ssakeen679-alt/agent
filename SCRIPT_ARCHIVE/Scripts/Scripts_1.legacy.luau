
--========================================
-- Script : Workspace.tower.sections.finish.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.finish.roof.Meshes/yxY.rgbPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.floor.Meshes/yxY.rgbPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.bottomfloor.Meshes/yxY.rgbPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.gatettoh.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.Pyx.Animate
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
wait(1)
local v_u_1 = script.Parent
local v_u_2 = v_u_1:WaitForChild("Humanoid")
local v_u_3 = "Standing"
local v4, v5 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserNoUpdateOnLoop")
end)
local v_u_6 = v4 and v5
local v7, v8 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserEmoteToRunThresholdChange")
end)
local v_u_9 = v7 and v8
local v10, v11 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserPlayEmoteByIdAnimTrackReturn2")
end)
local v_u_12 = v10 and v11
local v_u_13 = script:FindFirstChild("ScaleDampeningPercent")
local v_u_14 = ""
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = 1
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = {}
local v_u_22 = {}
local v_u_23 = {
    ["idle"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507766666",
            ["weight"] = 1
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507766951",
            ["weight"] = 1
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507766388",
            ["weight"] = 9
        }
    },
    ["walk"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777826",
            ["weight"] = 10
        }
    },
    ["run"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507767714",
            ["weight"] = 10
        }
    },
    ["swim"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507784897",
            ["weight"] = 10
        }
    },
    ["swimidle"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507785072",
            ["weight"] = 10
        }
    },
    ["jump"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507765000",
            ["weight"] = 10
        }
    },
    ["fall"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507767968",
            ["weight"] = 10
        }
    },
    ["climb"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507765644",
            ["weight"] = 10
        }
    },
    ["sit"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=2506281703",
            ["weight"] = 10
        }
    },
    ["toolnone"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507768375",
            ["weight"] = 10
        }
    },
    ["toolslash"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=522635514",
            ["weight"] = 10
        }
    },
    ["toollunge"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=522638767",
            ["weight"] = 10
        }
    },
    ["wave"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770239",
            ["weight"] = 10
        }
    },
    ["point"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770453",
            ["weight"] = 10
        }
    },
    ["dance"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507771019",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507771955",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507772104",
            ["weight"] = 10
        }
    },
    ["dance2"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507776043",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507776720",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507776879",
            ["weight"] = 10
        }
    },
    ["dance3"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777268",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777451",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777623",
            ["weight"] = 10
        }
    },
    ["laugh"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770818",
            ["weight"] = 10
        }
    },
    ["cheer"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770677",
            ["weight"] = 10
        }
    }
}
local v_u_24 = {
    ["wave"] = false,
    ["point"] = false,
    ["dance"] = true,
    ["dance2"] = true,
    ["dance3"] = true,
    ["laugh"] = false,
    ["cheer"] = false
}
math.randomseed(tick())
function findExistingAnimationInSet(p25, p26)
    if p25 == nil or p26 == nil then
        return 0
    end
    for v27 = 1, p25.count do
        if p25[v27].anim.AnimationId == p26.AnimationId then
            return v27
        end
    end
    return 0
end
function configureAnimationSet(p_u_28, p_u_29)
    -- upvalues: (copy) v_u_22, (copy) v_u_21, (copy) v_u_2
    if v_u_22[p_u_28] ~= nil then
        for _, v30 in pairs(v_u_22[p_u_28].connections) do
            v30:disconnect()
        end
    end
    v_u_22[p_u_28] = {}
    v_u_22[p_u_28].count = 0
    v_u_22[p_u_28].totalWeight = 0
    v_u_22[p_u_28].connections = {}
    local v_u_31 = true
    local v32, _ = pcall(function()
        -- upvalues: (ref) v_u_31
        v_u_31 = game:GetService("StarterPlayer").AllowCustomAnimations
    end)
    v_u_31 = not v32 and true or v_u_31
    local v33 = script:FindFirstChild(p_u_28)
    if v_u_31 and v33 ~= nil then
        local v34 = v_u_22[p_u_28].connections
        local v35 = v33.ChildAdded
        table.insert(v34, v35:connect(function(_)
            -- upvalues: (copy) p_u_28, (copy) p_u_29
            configureAnimationSet(p_u_28, p_u_29)
        end))
        local v36 = v_u_22[p_u_28].connections
        local v37 = v33.ChildRemoved
        table.insert(v36, v37:connect(function(_)
            -- upvalues: (copy) p_u_28, (copy) p_u_29
            configureAnimationSet(p_u_28, p_u_29)
        end))
        for _, v38 in pairs(v33:GetChildren()) do
            if v38:IsA("Animation") then
                local v39 = v38:FindFirstChild("Weight")
                local v40 = v39 == nil and 1 or v39.Value
                v_u_22[p_u_28].count = v_u_22[p_u_28].count + 1
                local v41 = v_u_22[p_u_28].count
                v_u_22[p_u_28][v41] = {}
                v_u_22[p_u_28][v41].anim = v38
                v_u_22[p_u_28][v41].weight = v40
                v_u_22[p_u_28].totalWeight = v_u_22[p_u_28].totalWeight + v_u_22[p_u_28][v41].weight
                local v42 = v_u_22[p_u_28].connections
                local v43 = v38.Changed
                table.insert(v42, v43:connect(function(_)
                    -- upvalues: (copy) p_u_28, (copy) p_u_29
                    configureAnimationSet(p_u_28, p_u_29)
                end))
                local v44 = v_u_22[p_u_28].connections
                local v45 = v38.ChildAdded
                table.insert(v44, v45:connect(function(_)
                    -- upvalues: (copy) p_u_28, (copy) p_u_29
                    configureAnimationSet(p_u_28, p_u_29)
                end))
                local v46 = v_u_22[p_u_28].connections
                local v47 = v38.ChildRemoved
                table.insert(v46, v47:connect(function(_)
                    -- upvalues: (copy) p_u_28, (copy) p_u_29
                    configureAnimationSet(p_u_28, p_u_29)
                end))
            end
        end
    end
    if v_u_22[p_u_28].count <= 0 then
        for v48, v49 in pairs(p_u_29) do
            v_u_22[p_u_28][v48] = {}
            v_u_22[p_u_28][v48].anim = Instance.new("Animation")
            v_u_22[p_u_28][v48].anim.Name = p_u_28
            v_u_22[p_u_28][v48].anim.AnimationId = v49.id
            v_u_22[p_u_28][v48].weight = v49.weight
            v_u_22[p_u_28].count = v_u_22[p_u_28].count + 1
            v_u_22[p_u_28].totalWeight = v_u_22[p_u_28].totalWeight + v49.weight
        end
    end
    for _, v50 in pairs(v_u_22) do
        for v51 = 1, v50.count do
            if v_u_21[v50[v51].anim.AnimationId] == nil then
                v_u_2:LoadAnimation(v50[v51].anim)
                v_u_21[v50[v51].anim.AnimationId] = true
            end
        end
    end
end
function configureAnimationSetOld(p_u_52, p_u_53)
    -- upvalues: (copy) v_u_22, (copy) v_u_2
    if v_u_22[p_u_52] ~= nil then
        for _, v54 in pairs(v_u_22[p_u_52].connections) do
            v54:disconnect()
        end
    end
    v_u_22[p_u_52] = {}
    v_u_22[p_u_52].count = 0
    v_u_22[p_u_52].totalWeight = 0
    v_u_22[p_u_52].connections = {}
    local v_u_55 = true
    local v56, _ = pcall(function()
        -- upvalues: (ref) v_u_55
        v_u_55 = game:GetService("StarterPlayer").AllowCustomAnimations
    end)
    v_u_55 = not v56 and true or v_u_55
    local v57 = script:FindFirstChild(p_u_52)
    if v_u_55 and v57 ~= nil then
        local v58 = v_u_22[p_u_52].connections
        local v59 = v57.ChildAdded
        table.insert(v58, v59:connect(function(_)
            -- upvalues: (copy) p_u_52, (copy) p_u_53
            configureAnimationSet(p_u_52, p_u_53)
        end))
        local v60 = v_u_22[p_u_52].connections
        local v61 = v57.ChildRemoved
        table.insert(v60, v61:connect(function(_)
            -- upvalues: (copy) p_u_52, (copy) p_u_53
            configureAnimationSet(p_u_52, p_u_53)
        end))
        local v62 = 1
        for _, v63 in pairs(v57:GetChildren()) do
            if v63:IsA("Animation") then
                local v64 = v_u_22[p_u_52].connections
                local v65 = v63.Changed
                table.insert(v64, v65:connect(function(_)
                    -- upvalues: (copy) p_u_52, (copy) p_u_53
                    configureAnimationSet(p_u_52, p_u_53)
                end))
                v_u_22[p_u_52][v62] = {}
                v_u_22[p_u_52][v62].anim = v63
                local v66 = v63:FindFirstChild("Weight")
                if v66 == nil then
                    v_u_22[p_u_52][v62].weight = 1
                else
                    v_u_22[p_u_52][v62].weight = v66.Value
                end
                v_u_22[p_u_52].count = v_u_22[p_u_52].count + 1
                v_u_22[p_u_52].totalWeight = v_u_22[p_u_52].totalWeight + v_u_22[p_u_52][v62].weight
                v62 = v62 + 1
            end
        end
    end
    if v_u_22[p_u_52].count <= 0 then
        for v67, v68 in pairs(p_u_53) do
            v_u_22[p_u_52][v67] = {}
            v_u_22[p_u_52][v67].anim = Instance.new("Animation")
            v_u_22[p_u_52][v67].anim.Name = p_u_52
            v_u_22[p_u_52][v67].anim.AnimationId = v68.id
            v_u_22[p_u_52][v67].weight = v68.weight
            v_u_22[p_u_52].count = v_u_22[p_u_52].count + 1
            v_u_22[p_u_52].totalWeight = v_u_22[p_u_52].totalWeight + v68.weight
        end
    end
    for _, v69 in pairs(v_u_22) do
        for v70 = 1, v69.count do
            v_u_2:LoadAnimation(v69[v70].anim)
        end
    end
end
function scriptChildModified(p71)
    -- upvalues: (copy) v_u_23
    local v72 = v_u_23[p71.Name]
    if v72 ~= nil then
        configureAnimationSet(p71.Name, v72)
    end
end
script.ChildAdded:connect(scriptChildModified)
script.ChildRemoved:connect(scriptChildModified)
local v73
if v_u_2 then
    v73 = v_u_2:FindFirstChildOfClass("Animator")
else
    v73 = nil
end
if v73 then
    local v74 = v73:GetPlayingAnimationTracks()
    for _, v75 in ipairs(v74) do
        v75:Stop(0)
        v75:Destroy()
    end
end
for v76, v77 in pairs(v_u_23) do
    configureAnimationSet(v76, v77)
end
local v_u_78 = "None"
local v_u_79 = 0
local v_u_80 = 0
local v_u_81 = false
function stopAllAnimations()
    -- upvalues: (ref) v_u_14, (copy) v_u_24, (ref) v_u_81, (ref) v_u_15, (ref) v_u_17, (ref) v_u_16, (ref) v_u_20, (ref) v_u_19
    local v82 = v_u_14
    local v83 = v_u_24[v82] ~= nil and v_u_24[v82] == false and "idle" or v82
    if v_u_81 then
        v83 = "idle"
        v_u_81 = false
    end
    v_u_14 = ""
    v_u_15 = nil
    if v_u_17 ~= nil then
        v_u_17:disconnect()
    end
    if v_u_16 ~= nil then
        v_u_16:Stop()
        v_u_16:Destroy()
        v_u_16 = nil
    end
    if v_u_20 ~= nil then
        v_u_20:disconnect()
    end
    if v_u_19 ~= nil then
        v_u_19:Stop()
        v_u_19:Destroy()
        v_u_19 = nil
    end
    return v83
end
function getHeightScale()
    -- upvalues: (copy) v_u_2, (ref) v_u_13
    if not v_u_2 then
        return 1
    end
    if not v_u_2.AutomaticScalingEnabled then
        return 1
    end
    local v84 = v_u_2.HipHeight / 2
    if v_u_13 == nil then
        v_u_13 = script:FindFirstChild("ScaleDampeningPercent")
    end
    if v_u_13 ~= nil then
        v84 = 1 + (v_u_2.HipHeight - 2) * v_u_13.Value / 2
    end
    return v84
end
local function v_u_91(p85)
    -- upvalues: (ref) v_u_16, (ref) v_u_19
    local v86 = p85 * 1.25 / getHeightScale()
    local v87 = 0.0001
    local v88 = v86 / 0.5
    local v89 = v86 / 1
    local v90
    if v86 <= 0.5 then
        v87 = 1
        v90 = 0.0001
    elseif v86 < 1 then
        v90 = (v86 - 0.5) / 0.5
        v87 = 1 - v90
        v88 = 1
        v89 = 1
    else
        v90 = 1
    end
    v_u_16:AdjustWeight(v87)
    v_u_19:AdjustWeight(v90)
    v_u_16:AdjustSpeed(v88)
    v_u_19:AdjustSpeed(v89)
end
function setAnimationSpeed(p92)
    -- upvalues: (ref) v_u_14, (copy) v_u_91, (ref) v_u_18, (ref) v_u_16
    if v_u_14 == "walk" then
        v_u_91(p92)
    elseif p92 ~= v_u_18 then
        v_u_18 = p92
        v_u_16:AdjustSpeed(v_u_18)
    end
end
function keyFrameReachedFunc(p93)
    -- upvalues: (ref) v_u_14, (copy) v_u_6, (ref) v_u_19, (ref) v_u_16, (copy) v_u_24, (ref) v_u_81, (ref) v_u_18, (copy) v_u_2
    if p93 == "End" then
        if v_u_14 == "walk" then
            if v_u_6 ~= true then
                v_u_19.TimePosition = 0
                v_u_16.TimePosition = 0
                return
            end
            if v_u_19.Looped ~= true then
                v_u_19.TimePosition = 0
            end
            if v_u_16.Looped ~= true then
                v_u_16.TimePosition = 0
                return
            end
        else
            local v94 = v_u_14
            local v95 = v_u_24[v94] ~= nil and v_u_24[v94] == false and "idle" or v94
            if v_u_81 then
                if v_u_16.Looped then
                    return
                end
                v95 = "idle"
                v_u_81 = false
            end
            local v96 = v_u_18
            playAnimation(v95, 0.15, v_u_2)
            setAnimationSpeed(v96)
        end
    end
end
function rollAnimation(p97)
    -- upvalues: (copy) v_u_22
    local v98 = math.random(1, v_u_22[p97].totalWeight)
    local v99 = 1
    while v_u_22[p97][v99].weight < v98 do
        v98 = v98 - v_u_22[p97][v99].weight
        v99 = v99 + 1
    end
    return v99
end
local function v_u_105(p100, p101, p102, p103)
    -- upvalues: (ref) v_u_15, (ref) v_u_16, (ref) v_u_19, (copy) v_u_6, (ref) v_u_18, (ref) v_u_14, (ref) v_u_17, (copy) v_u_22, (ref) v_u_20
    if p100 ~= v_u_15 then
        if v_u_16 ~= nil then
            v_u_16:Stop(p102)
            v_u_16:Destroy()
        end
        if v_u_19 ~= nil then
            v_u_19:Stop(p102)
            v_u_19:Destroy()
            if v_u_6 == true then
                v_u_19 = nil
            end
        end
        v_u_18 = 1
        v_u_16 = p103:LoadAnimation(p100)
        v_u_16.Priority = Enum.AnimationPriority.Core
        v_u_16:Play(p102)
        v_u_14 = p101
        v_u_15 = p100
        if v_u_17 ~= nil then
            v_u_17:disconnect()
        end
        v_u_17 = v_u_16.KeyframeReached:connect(keyFrameReachedFunc)
        if p101 == "walk" then
            local v104 = rollAnimation("run")
            v_u_19 = p103:LoadAnimation(v_u_22.run[v104].anim)
            v_u_19.Priority = Enum.AnimationPriority.Core
            v_u_19:Play(p102)
            if v_u_20 ~= nil then
                v_u_20:disconnect()
            end
            v_u_20 = v_u_19.KeyframeReached:connect(keyFrameReachedFunc)
        end
    end
end
function playAnimation(p106, p107, p108)
    -- upvalues: (copy) v_u_22, (copy) v_u_105, (ref) v_u_81
    local v109 = rollAnimation(p106)
    v_u_105(v_u_22[p106][v109].anim, p106, p107, p108)
    v_u_81 = false
end
function playEmote(p110, p111, p112)
    -- upvalues: (copy) v_u_105, (ref) v_u_81
    v_u_105(p110, p110.Name, p111, p112)
    v_u_81 = true
end
local v_u_113 = ""
local v_u_114 = nil
local v_u_115 = nil
local v_u_116 = nil
function toolKeyFrameReachedFunc(p117)
    -- upvalues: (ref) v_u_113, (copy) v_u_2
    if p117 == "End" then
        playToolAnimation(v_u_113, 0, v_u_2)
    end
end
function playToolAnimation(p118, p119, p120, p121)
    -- upvalues: (copy) v_u_22, (ref) v_u_115, (ref) v_u_114, (ref) v_u_113, (ref) v_u_116
    local v122 = rollAnimation(p118)
    local v123 = v_u_22[p118][v122].anim
    if v_u_115 ~= v123 then
        if v_u_114 ~= nil then
            v_u_114:Stop()
            v_u_114:Destroy()
            p119 = 0
        end
        v_u_114 = p120:LoadAnimation(v123)
        if p121 then
            v_u_114.Priority = p121
        end
        v_u_114:Play(p119)
        v_u_113 = p118
        v_u_115 = v123
        v_u_116 = v_u_114.KeyframeReached:connect(toolKeyFrameReachedFunc)
    end
end
function stopToolAnimations()
    -- upvalues: (ref) v_u_113, (ref) v_u_116, (ref) v_u_115, (ref) v_u_114
    local v124 = v_u_113
    if v_u_116 ~= nil then
        v_u_116:disconnect()
    end
    v_u_113 = ""
    v_u_115 = nil
    if v_u_114 ~= nil then
        v_u_114:Stop()
        v_u_114:Destroy()
        v_u_114 = nil
    end
    return v124
end
function onRunning(p125)
    -- upvalues: (ref) v_u_9, (ref) v_u_81, (copy) v_u_2, (ref) v_u_3, (copy) v_u_24, (ref) v_u_14
    local v126 = v_u_9 and v_u_81
    if v126 then
        v126 = v_u_2.MoveDirection == Vector3.new(0, 0, 0)
    end
    if (v126 and v_u_2.WalkSpeed or 0.75) < p125 then
        playAnimation("walk", 0.2, v_u_2)
        setAnimationSpeed(p125 / 16)
        v_u_3 = "Running"
    elseif v_u_24[v_u_14] == nil and not v_u_81 then
        playAnimation("idle", 0.2, v_u_2)
        v_u_3 = "Standing"
    end
end
function onDied()
    -- upvalues: (ref) v_u_3
    v_u_3 = "Dead"
end
function onJumping()
    -- upvalues: (copy) v_u_2, (ref) v_u_80, (ref) v_u_3
    playAnimation("jump", 0.1, v_u_2)
    v_u_80 = 0.31
    v_u_3 = "Jumping"
end
function onClimbing(p127)
    -- upvalues: (copy) v_u_2, (ref) v_u_3
    playAnimation("climb", 0.1, v_u_2)
    setAnimationSpeed(p127 / 5)
    v_u_3 = "Climbing"
end
function onGettingUp()
    -- upvalues: (ref) v_u_3
    v_u_3 = "GettingUp"
end
function onFreeFall()
    -- upvalues: (ref) v_u_80, (copy) v_u_2, (ref) v_u_3
    if v_u_80 <= 0 then
        playAnimation("fall", 0.2, v_u_2)
    end
    v_u_3 = "FreeFall"
end
function onFallingDown()
    -- upvalues: (ref) v_u_3
    v_u_3 = "FallingDown"
end
function onSeated()
    -- upvalues: (ref) v_u_3
    v_u_3 = "Seated"
end
function onPlatformStanding()
    -- upvalues: (ref) v_u_3
    v_u_3 = "PlatformStanding"
end
function onSwimming(p128)
    -- upvalues: (copy) v_u_2, (ref) v_u_3
    if p128 > 1 then
        playAnimation("swim", 0.4, v_u_2)
        setAnimationSpeed(p128 / 10)
        v_u_3 = "Swimming"
    else
        playAnimation("swimidle", 0.4, v_u_2)
        v_u_3 = "Standing"
    end
end
function animateTool()
    -- upvalues: (ref) v_u_78, (copy) v_u_2
    if v_u_78 == "None" then
        playToolAnimation("toolnone", 0.1, v_u_2, Enum.AnimationPriority.Idle)
        return
    elseif v_u_78 == "Slash" then
        playToolAnimation("toolslash", 0, v_u_2, Enum.AnimationPriority.Action)
        return
    elseif v_u_78 == "Lunge" then
        playToolAnimation("toollunge", 0, v_u_2, Enum.AnimationPriority.Action)
    end
end
function getToolAnim(p129)
    for _, v130 in ipairs(p129:GetChildren()) do
        if v130.Name == "toolanim" and v130.className == "StringValue" then
            return v130
        end
    end
    return nil
end
local v_u_131 = 0
function stepAnimate(p132)
    -- upvalues: (ref) v_u_131, (ref) v_u_80, (ref) v_u_3, (copy) v_u_2, (copy) v_u_1, (ref) v_u_78, (ref) v_u_79, (ref) v_u_115
    local v133 = p132 - v_u_131
    v_u_131 = p132
    if v_u_80 > 0 then
        v_u_80 = v_u_80 - v133
    end
    if v_u_3 == "FreeFall" and v_u_80 <= 0 then
        playAnimation("fall", 0.2, v_u_2)
    else
        if v_u_3 == "Seated" then
            playAnimation("sit", 0.5, v_u_2)
            return
        end
        if v_u_3 == "Running" then
            playAnimation("walk", 0.2, v_u_2)
        elseif v_u_3 == "Dead" or (v_u_3 == "GettingUp" or (v_u_3 == "FallingDown" or (v_u_3 == "Seated" or v_u_3 == "PlatformStanding"))) then
            stopAllAnimations()
        end
    end
    local v134 = v_u_1:FindFirstChildOfClass("Tool")
    if v134 and v134:FindFirstChild("Handle") then
        local v135 = getToolAnim(v134)
        if v135 then
            v_u_78 = v135.Value
            v135.Parent = nil
            v_u_79 = p132 + 0.3
        end
        if v_u_79 < p132 then
            v_u_79 = 0
            v_u_78 = "None"
        end
        animateTool()
    else
        stopToolAnimations()
        v_u_78 = "None"
        v_u_115 = nil
        v_u_79 = 0
    end
end
v_u_2.Died:connect(onDied)
v_u_2.Running:connect(onRunning)
v_u_2.Jumping:connect(onJumping)
v_u_2.Climbing:connect(onClimbing)
v_u_2.GettingUp:connect(onGettingUp)
v_u_2.FreeFalling:connect(onFreeFall)
v_u_2.FallingDown:connect(onFallingDown)
v_u_2.Seated:connect(onSeated)
v_u_2.PlatformStanding:connect(onPlatformStanding)
v_u_2.Swimming:connect(onSwimming)
script:WaitForChild("PlayEmote").OnInvoke = function(p136)
    -- upvalues: (ref) v_u_3, (copy) v_u_24, (copy) v_u_2, (ref) v_u_12, (ref) v_u_16
    if v_u_3 == "Standing" then
        if v_u_24[p136] == nil then
            if typeof(p136) == "Instance" and p136:IsA("Animation") then
                playEmote(p136, 0.1, v_u_2)
                if v_u_12 then
                    return true, v_u_16
                else
                    return true
                end
            else
                return false
            end
        else
            playAnimation(p136, 0.1, v_u_2)
            if v_u_12 then
                return true, v_u_16
            else
                return true
            end
        end
    else
        return
    end
end
if v_u_1.Parent ~= nil then
    playAnimation("idle", 0.1, v_u_2)
    local _ = "Standing"
end
while v_u_1.Parent ~= nil do
    local _, v137 = wait(0.1)
    stepAnimate(v137)
end

--========================================
-- Script : Workspace.tower.sections.lobby.shop.Pyrx.Animate
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
wait(1)
local v_u_1 = script.Parent
local v_u_2 = v_u_1:WaitForChild("Humanoid")
local v_u_3 = "Standing"
local v4, v5 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserNoUpdateOnLoop")
end)
local v_u_6 = v4 and v5
local v7, v8 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserEmoteToRunThresholdChange")
end)
local v_u_9 = v7 and v8
local v10, v11 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserPlayEmoteByIdAnimTrackReturn2")
end)
local v_u_12 = v10 and v11
local v_u_13 = script:FindFirstChild("ScaleDampeningPercent")
local v_u_14 = ""
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = 1
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = {}
local v_u_22 = {}
local v_u_23 = {
    ["idle"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507766666",
            ["weight"] = 1
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507766951",
            ["weight"] = 1
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507766388",
            ["weight"] = 9
        }
    },
    ["walk"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777826",
            ["weight"] = 10
        }
    },
    ["run"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507767714",
            ["weight"] = 10
        }
    },
    ["swim"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507784897",
            ["weight"] = 10
        }
    },
    ["swimidle"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507785072",
            ["weight"] = 10
        }
    },
    ["jump"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507765000",
            ["weight"] = 10
        }
    },
    ["fall"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507767968",
            ["weight"] = 10
        }
    },
    ["climb"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507765644",
            ["weight"] = 10
        }
    },
    ["sit"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=2506281703",
            ["weight"] = 10
        }
    },
    ["toolnone"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507768375",
            ["weight"] = 10
        }
    },
    ["toolslash"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=522635514",
            ["weight"] = 10
        }
    },
    ["toollunge"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=522638767",
            ["weight"] = 10
        }
    },
    ["wave"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770239",
            ["weight"] = 10
        }
    },
    ["point"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770453",
            ["weight"] = 10
        }
    },
    ["dance"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507771019",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507771955",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507772104",
            ["weight"] = 10
        }
    },
    ["dance2"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507776043",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507776720",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507776879",
            ["weight"] = 10
        }
    },
    ["dance3"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777268",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777451",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777623",
            ["weight"] = 10
        }
    },
    ["laugh"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770818",
            ["weight"] = 10
        }
    },
    ["cheer"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770677",
            ["weight"] = 10
        }
    }
}
local v_u_24 = {
    ["wave"] = false,
    ["point"] = false,
    ["dance"] = true,
    ["dance2"] = true,
    ["dance3"] = true,
    ["laugh"] = false,
    ["cheer"] = false
}
math.randomseed(tick())
function findExistingAnimationInSet(p25, p26)
    if p25 == nil or p26 == nil then
        return 0
    end
    for v27 = 1, p25.count do
        if p25[v27].anim.AnimationId == p26.AnimationId then
            return v27
        end
    end
    return 0
end
function configureAnimationSet(p_u_28, p_u_29)
    -- upvalues: (copy) v_u_22, (copy) v_u_21, (copy) v_u_2
    if v_u_22[p_u_28] ~= nil then
        for _, v30 in pairs(v_u_22[p_u_28].connections) do
            v30:disconnect()
        end
    end
    v_u_22[p_u_28] = {}
    v_u_22[p_u_28].count = 0
    v_u_22[p_u_28].totalWeight = 0
    v_u_22[p_u_28].connections = {}
    local v_u_31 = true
    local v32, _ = pcall(function()
        -- upvalues: (ref) v_u_31
        v_u_31 = game:GetService("StarterPlayer").AllowCustomAnimations
    end)
    v_u_31 = not v32 and true or v_u_31
    local v33 = script:FindFirstChild(p_u_28)
    if v_u_31 and v33 ~= nil then
        local v34 = v_u_22[p_u_28].connections
        local v35 = v33.ChildAdded
        table.insert(v34, v35:connect(function(_)
            -- upvalues: (copy) p_u_28, (copy) p_u_29
            configureAnimationSet(p_u_28, p_u_29)
        end))
        local v36 = v_u_22[p_u_28].connections
        local v37 = v33.ChildRemoved
        table.insert(v36, v37:connect(function(_)
            -- upvalues: (copy) p_u_28, (copy) p_u_29
            configureAnimationSet(p_u_28, p_u_29)
        end))
        for _, v38 in pairs(v33:GetChildren()) do
            if v38:IsA("Animation") then
                local v39 = v38:FindFirstChild("Weight")
                local v40 = v39 == nil and 1 or v39.Value
                v_u_22[p_u_28].count = v_u_22[p_u_28].count + 1
                local v41 = v_u_22[p_u_28].count
                v_u_22[p_u_28][v41] = {}
                v_u_22[p_u_28][v41].anim = v38
                v_u_22[p_u_28][v41].weight = v40
                v_u_22[p_u_28].totalWeight = v_u_22[p_u_28].totalWeight + v_u_22[p_u_28][v41].weight
                local v42 = v_u_22[p_u_28].connections
                local v43 = v38.Changed
                table.insert(v42, v43:connect(function(_)
                    -- upvalues: (copy) p_u_28, (copy) p_u_29
                    configureAnimationSet(p_u_28, p_u_29)
                end))
                local v44 = v_u_22[p_u_28].connections
                local v45 = v38.ChildAdded
                table.insert(v44, v45:connect(function(_)
                    -- upvalues: (copy) p_u_28, (copy) p_u_29
                    configureAnimationSet(p_u_28, p_u_29)
                end))
                local v46 = v_u_22[p_u_28].connections
                local v47 = v38.ChildRemoved
                table.insert(v46, v47:connect(function(_)
                    -- upvalues: (copy) p_u_28, (copy) p_u_29
                    configureAnimationSet(p_u_28, p_u_29)
                end))
            end
        end
    end
    if v_u_22[p_u_28].count <= 0 then
        for v48, v49 in pairs(p_u_29) do
            v_u_22[p_u_28][v48] = {}
            v_u_22[p_u_28][v48].anim = Instance.new("Animation")
            v_u_22[p_u_28][v48].anim.Name = p_u_28
            v_u_22[p_u_28][v48].anim.AnimationId = v49.id
            v_u_22[p_u_28][v48].weight = v49.weight
            v_u_22[p_u_28].count = v_u_22[p_u_28].count + 1
            v_u_22[p_u_28].totalWeight = v_u_22[p_u_28].totalWeight + v49.weight
        end
    end
    for _, v50 in pairs(v_u_22) do
        for v51 = 1, v50.count do
            if v_u_21[v50[v51].anim.AnimationId] == nil then
                v_u_2:LoadAnimation(v50[v51].anim)
                v_u_21[v50[v51].anim.AnimationId] = true
            end
        end
    end
end
function configureAnimationSetOld(p_u_52, p_u_53)
    -- upvalues: (copy) v_u_22, (copy) v_u_2
    if v_u_22[p_u_52] ~= nil then
        for _, v54 in pairs(v_u_22[p_u_52].connections) do
            v54:disconnect()
        end
    end
    v_u_22[p_u_52] = {}
    v_u_22[p_u_52].count = 0
    v_u_22[p_u_52].totalWeight = 0
    v_u_22[p_u_52].connections = {}
    local v_u_55 = true
    local v56, _ = pcall(function()
        -- upvalues: (ref) v_u_55
        v_u_55 = game:GetService("StarterPlayer").AllowCustomAnimations
    end)
    v_u_55 = not v56 and true or v_u_55
    local v57 = script:FindFirstChild(p_u_52)
    if v_u_55 and v57 ~= nil then
        local v58 = v_u_22[p_u_52].connections
        local v59 = v57.ChildAdded
        table.insert(v58, v59:connect(function(_)
            -- upvalues: (copy) p_u_52, (copy) p_u_53
            configureAnimationSet(p_u_52, p_u_53)
        end))
        local v60 = v_u_22[p_u_52].connections
        local v61 = v57.ChildRemoved
        table.insert(v60, v61:connect(function(_)
            -- upvalues: (copy) p_u_52, (copy) p_u_53
            configureAnimationSet(p_u_52, p_u_53)
        end))
        local v62 = 1
        for _, v63 in pairs(v57:GetChildren()) do
            if v63:IsA("Animation") then
                local v64 = v_u_22[p_u_52].connections
                local v65 = v63.Changed
                table.insert(v64, v65:connect(function(_)
                    -- upvalues: (copy) p_u_52, (copy) p_u_53
                    configureAnimationSet(p_u_52, p_u_53)
                end))
                v_u_22[p_u_52][v62] = {}
                v_u_22[p_u_52][v62].anim = v63
                local v66 = v63:FindFirstChild("Weight")
                if v66 == nil then
                    v_u_22[p_u_52][v62].weight = 1
                else
                    v_u_22[p_u_52][v62].weight = v66.Value
                end
                v_u_22[p_u_52].count = v_u_22[p_u_52].count + 1
                v_u_22[p_u_52].totalWeight = v_u_22[p_u_52].totalWeight + v_u_22[p_u_52][v62].weight
                v62 = v62 + 1
            end
        end
    end
    if v_u_22[p_u_52].count <= 0 then
        for v67, v68 in pairs(p_u_53) do
            v_u_22[p_u_52][v67] = {}
            v_u_22[p_u_52][v67].anim = Instance.new("Animation")
            v_u_22[p_u_52][v67].anim.Name = p_u_52
            v_u_22[p_u_52][v67].anim.AnimationId = v68.id
            v_u_22[p_u_52][v67].weight = v68.weight
            v_u_22[p_u_52].count = v_u_22[p_u_52].count + 1
            v_u_22[p_u_52].totalWeight = v_u_22[p_u_52].totalWeight + v68.weight
        end
    end
    for _, v69 in pairs(v_u_22) do
        for v70 = 1, v69.count do
            v_u_2:LoadAnimation(v69[v70].anim)
        end
    end
end
function scriptChildModified(p71)
    -- upvalues: (copy) v_u_23
    local v72 = v_u_23[p71.Name]
    if v72 ~= nil then
        configureAnimationSet(p71.Name, v72)
    end
end
script.ChildAdded:connect(scriptChildModified)
script.ChildRemoved:connect(scriptChildModified)
local v73
if v_u_2 then
    v73 = v_u_2:FindFirstChildOfClass("Animator")
else
    v73 = nil
end
if v73 then
    local v74 = v73:GetPlayingAnimationTracks()
    for _, v75 in ipairs(v74) do
        v75:Stop(0)
        v75:Destroy()
    end
end
for v76, v77 in pairs(v_u_23) do
    configureAnimationSet(v76, v77)
end
local v_u_78 = "None"
local v_u_79 = 0
local v_u_80 = 0
local v_u_81 = false
function stopAllAnimations()
    -- upvalues: (ref) v_u_14, (copy) v_u_24, (ref) v_u_81, (ref) v_u_15, (ref) v_u_17, (ref) v_u_16, (ref) v_u_20, (ref) v_u_19
    local v82 = v_u_14
    local v83 = v_u_24[v82] ~= nil and v_u_24[v82] == false and "idle" or v82
    if v_u_81 then
        v83 = "idle"
        v_u_81 = false
    end
    v_u_14 = ""
    v_u_15 = nil
    if v_u_17 ~= nil then
        v_u_17:disconnect()
    end
    if v_u_16 ~= nil then
        v_u_16:Stop()
        v_u_16:Destroy()
        v_u_16 = nil
    end
    if v_u_20 ~= nil then
        v_u_20:disconnect()
    end
    if v_u_19 ~= nil then
        v_u_19:Stop()
        v_u_19:Destroy()
        v_u_19 = nil
    end
    return v83
end
function getHeightScale()
    -- upvalues: (copy) v_u_2, (ref) v_u_13
    if not v_u_2 then
        return 1
    end
    if not v_u_2.AutomaticScalingEnabled then
        return 1
    end
    local v84 = v_u_2.HipHeight / 2
    if v_u_13 == nil then
        v_u_13 = script:FindFirstChild("ScaleDampeningPercent")
    end
    if v_u_13 ~= nil then
        v84 = 1 + (v_u_2.HipHeight - 2) * v_u_13.Value / 2
    end
    return v84
end
local function v_u_91(p85)
    -- upvalues: (ref) v_u_16, (ref) v_u_19
    local v86 = p85 * 1.25 / getHeightScale()
    local v87 = 0.0001
    local v88 = v86 / 0.5
    local v89 = v86 / 1
    local v90
    if v86 <= 0.5 then
        v87 = 1
        v90 = 0.0001
    elseif v86 < 1 then
        v90 = (v86 - 0.5) / 0.5
        v87 = 1 - v90
        v88 = 1
        v89 = 1
    else
        v90 = 1
    end
    v_u_16:AdjustWeight(v87)
    v_u_19:AdjustWeight(v90)
    v_u_16:AdjustSpeed(v88)
    v_u_19:AdjustSpeed(v89)
end
function setAnimationSpeed(p92)
    -- upvalues: (ref) v_u_14, (copy) v_u_91, (ref) v_u_18, (ref) v_u_16
    if v_u_14 == "walk" then
        v_u_91(p92)
    elseif p92 ~= v_u_18 then
        v_u_18 = p92
        v_u_16:AdjustSpeed(v_u_18)
    end
end
function keyFrameReachedFunc(p93)
    -- upvalues: (ref) v_u_14, (copy) v_u_6, (ref) v_u_19, (ref) v_u_16, (copy) v_u_24, (ref) v_u_81, (ref) v_u_18, (copy) v_u_2
    if p93 == "End" then
        if v_u_14 == "walk" then
            if v_u_6 ~= true then
                v_u_19.TimePosition = 0
                v_u_16.TimePosition = 0
                return
            end
            if v_u_19.Looped ~= true then
                v_u_19.TimePosition = 0
            end
            if v_u_16.Looped ~= true then
                v_u_16.TimePosition = 0
                return
            end
        else
            local v94 = v_u_14
            local v95 = v_u_24[v94] ~= nil and v_u_24[v94] == false and "idle" or v94
            if v_u_81 then
                if v_u_16.Looped then
                    return
                end
                v95 = "idle"
                v_u_81 = false
            end
            local v96 = v_u_18
            playAnimation(v95, 0.15, v_u_2)
            setAnimationSpeed(v96)
        end
    end
end
function rollAnimation(p97)
    -- upvalues: (copy) v_u_22
    local v98 = math.random(1, v_u_22[p97].totalWeight)
    local v99 = 1
    while v_u_22[p97][v99].weight < v98 do
        v98 = v98 - v_u_22[p97][v99].weight
        v99 = v99 + 1
    end
    return v99
end
local function v_u_105(p100, p101, p102, p103)
    -- upvalues: (ref) v_u_15, (ref) v_u_16, (ref) v_u_19, (copy) v_u_6, (ref) v_u_18, (ref) v_u_14, (ref) v_u_17, (copy) v_u_22, (ref) v_u_20
    if p100 ~= v_u_15 then
        if v_u_16 ~= nil then
            v_u_16:Stop(p102)
            v_u_16:Destroy()
        end
        if v_u_19 ~= nil then
            v_u_19:Stop(p102)
            v_u_19:Destroy()
            if v_u_6 == true then
                v_u_19 = nil
            end
        end
        v_u_18 = 1
        v_u_16 = p103:LoadAnimation(p100)
        v_u_16.Priority = Enum.AnimationPriority.Core
        v_u_16:Play(p102)
        v_u_14 = p101
        v_u_15 = p100
        if v_u_17 ~= nil then
            v_u_17:disconnect()
        end
        v_u_17 = v_u_16.KeyframeReached:connect(keyFrameReachedFunc)
        if p101 == "walk" then
            local v104 = rollAnimation("run")
            v_u_19 = p103:LoadAnimation(v_u_22.run[v104].anim)
            v_u_19.Priority = Enum.AnimationPriority.Core
            v_u_19:Play(p102)
            if v_u_20 ~= nil then
                v_u_20:disconnect()
            end
            v_u_20 = v_u_19.KeyframeReached:connect(keyFrameReachedFunc)
        end
    end
end
function playAnimation(p106, p107, p108)
    -- upvalues: (copy) v_u_22, (copy) v_u_105, (ref) v_u_81
    local v109 = rollAnimation(p106)
    v_u_105(v_u_22[p106][v109].anim, p106, p107, p108)
    v_u_81 = false
end
function playEmote(p110, p111, p112)
    -- upvalues: (copy) v_u_105, (ref) v_u_81
    v_u_105(p110, p110.Name, p111, p112)
    v_u_81 = true
end
local v_u_113 = ""
local v_u_114 = nil
local v_u_115 = nil
local v_u_116 = nil
function toolKeyFrameReachedFunc(p117)
    -- upvalues: (ref) v_u_113, (copy) v_u_2
    if p117 == "End" then
        playToolAnimation(v_u_113, 0, v_u_2)
    end
end
function playToolAnimation(p118, p119, p120, p121)
    -- upvalues: (copy) v_u_22, (ref) v_u_115, (ref) v_u_114, (ref) v_u_113, (ref) v_u_116
    local v122 = rollAnimation(p118)
    local v123 = v_u_22[p118][v122].anim
    if v_u_115 ~= v123 then
        if v_u_114 ~= nil then
            v_u_114:Stop()
            v_u_114:Destroy()
            p119 = 0
        end
        v_u_114 = p120:LoadAnimation(v123)
        if p121 then
            v_u_114.Priority = p121
        end
        v_u_114:Play(p119)
        v_u_113 = p118
        v_u_115 = v123
        v_u_116 = v_u_114.KeyframeReached:connect(toolKeyFrameReachedFunc)
    end
end
function stopToolAnimations()
    -- upvalues: (ref) v_u_113, (ref) v_u_116, (ref) v_u_115, (ref) v_u_114
    local v124 = v_u_113
    if v_u_116 ~= nil then
        v_u_116:disconnect()
    end
    v_u_113 = ""
    v_u_115 = nil
    if v_u_114 ~= nil then
        v_u_114:Stop()
        v_u_114:Destroy()
        v_u_114 = nil
    end
    return v124
end
function onRunning(p125)
    -- upvalues: (ref) v_u_9, (ref) v_u_81, (copy) v_u_2, (ref) v_u_3, (copy) v_u_24, (ref) v_u_14
    local v126 = v_u_9 and v_u_81
    if v126 then
        v126 = v_u_2.MoveDirection == Vector3.new(0, 0, 0)
    end
    if (v126 and v_u_2.WalkSpeed or 0.75) < p125 then
        playAnimation("walk", 0.2, v_u_2)
        setAnimationSpeed(p125 / 16)
        v_u_3 = "Running"
    elseif v_u_24[v_u_14] == nil and not v_u_81 then
        playAnimation("idle", 0.2, v_u_2)
        v_u_3 = "Standing"
    end
end
function onDied()
    -- upvalues: (ref) v_u_3
    v_u_3 = "Dead"
end
function onJumping()
    -- upvalues: (copy) v_u_2, (ref) v_u_80, (ref) v_u_3
    playAnimation("jump", 0.1, v_u_2)
    v_u_80 = 0.31
    v_u_3 = "Jumping"
end
function onClimbing(p127)
    -- upvalues: (copy) v_u_2, (ref) v_u_3
    playAnimation("climb", 0.1, v_u_2)
    setAnimationSpeed(p127 / 5)
    v_u_3 = "Climbing"
end
function onGettingUp()
    -- upvalues: (ref) v_u_3
    v_u_3 = "GettingUp"
end
function onFreeFall()
    -- upvalues: (ref) v_u_80, (copy) v_u_2, (ref) v_u_3
    if v_u_80 <= 0 then
        playAnimation("fall", 0.2, v_u_2)
    end
    v_u_3 = "FreeFall"
end
function onFallingDown()
    -- upvalues: (ref) v_u_3
    v_u_3 = "FallingDown"
end
function onSeated()
    -- upvalues: (ref) v_u_3
    v_u_3 = "Seated"
end
function onPlatformStanding()
    -- upvalues: (ref) v_u_3
    v_u_3 = "PlatformStanding"
end
function onSwimming(p128)
    -- upvalues: (copy) v_u_2, (ref) v_u_3
    if p128 > 1 then
        playAnimation("swim", 0.4, v_u_2)
        setAnimationSpeed(p128 / 10)
        v_u_3 = "Swimming"
    else
        playAnimation("swimidle", 0.4, v_u_2)
        v_u_3 = "Standing"
    end
end
function animateTool()
    -- upvalues: (ref) v_u_78, (copy) v_u_2
    if v_u_78 == "None" then
        playToolAnimation("toolnone", 0.1, v_u_2, Enum.AnimationPriority.Idle)
        return
    elseif v_u_78 == "Slash" then
        playToolAnimation("toolslash", 0, v_u_2, Enum.AnimationPriority.Action)
        return
    elseif v_u_78 == "Lunge" then
        playToolAnimation("toollunge", 0, v_u_2, Enum.AnimationPriority.Action)
    end
end
function getToolAnim(p129)
    for _, v130 in ipairs(p129:GetChildren()) do
        if v130.Name == "toolanim" and v130.className == "StringValue" then
            return v130
        end
    end
    return nil
end
local v_u_131 = 0
function stepAnimate(p132)
    -- upvalues: (ref) v_u_131, (ref) v_u_80, (ref) v_u_3, (copy) v_u_2, (copy) v_u_1, (ref) v_u_78, (ref) v_u_79, (ref) v_u_115
    local v133 = p132 - v_u_131
    v_u_131 = p132
    if v_u_80 > 0 then
        v_u_80 = v_u_80 - v133
    end
    if v_u_3 == "FreeFall" and v_u_80 <= 0 then
        playAnimation("fall", 0.2, v_u_2)
    else
        if v_u_3 == "Seated" then
            playAnimation("sit", 0.5, v_u_2)
            return
        end
        if v_u_3 == "Running" then
            playAnimation("walk", 0.2, v_u_2)
        elseif v_u_3 == "Dead" or (v_u_3 == "GettingUp" or (v_u_3 == "FallingDown" or (v_u_3 == "Seated" or v_u_3 == "PlatformStanding"))) then
            stopAllAnimations()
        end
    end
    local v134 = v_u_1:FindFirstChildOfClass("Tool")
    if v134 and v134:FindFirstChild("Handle") then
        local v135 = getToolAnim(v134)
        if v135 then
            v_u_78 = v135.Value
            v135.Parent = nil
            v_u_79 = p132 + 0.3
        end
        if v_u_79 < p132 then
            v_u_79 = 0
            v_u_78 = "None"
        end
        animateTool()
    else
        stopToolAnimations()
        v_u_78 = "None"
        v_u_115 = nil
        v_u_79 = 0
    end
end
v_u_2.Died:connect(onDied)
v_u_2.Running:connect(onRunning)
v_u_2.Jumping:connect(onJumping)
v_u_2.Climbing:connect(onClimbing)
v_u_2.GettingUp:connect(onGettingUp)
v_u_2.FreeFalling:connect(onFreeFall)
v_u_2.FallingDown:connect(onFallingDown)
v_u_2.Seated:connect(onSeated)
v_u_2.PlatformStanding:connect(onPlatformStanding)
v_u_2.Swimming:connect(onSwimming)
script:WaitForChild("PlayEmote").OnInvoke = function(p136)
    -- upvalues: (ref) v_u_3, (copy) v_u_24, (copy) v_u_2, (ref) v_u_12, (ref) v_u_16
    if v_u_3 == "Standing" then
        if v_u_24[p136] == nil then
            if typeof(p136) == "Instance" and p136:IsA("Animation") then
                playEmote(p136, 0.1, v_u_2)
                if v_u_12 then
                    return true, v_u_16
                else
                    return true
                end
            else
                return false
            end
        else
            playAnimation(p136, 0.1, v_u_2)
            if v_u_12 then
                return true, v_u_16
            else
                return true
            end
        end
    else
        return
    end
end
if v_u_1.Parent ~= nil then
    playAnimation("idle", 0.1, v_u_2)
    local _ = "Standing"
end
while v_u_1.Parent ~= nil do
    local _, v137 = wait(0.1)
    stepAnimate(v137)
end

--========================================
-- Script : Workspace.tower.sections.lobby.shop.Pixy.Animate
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
wait(1)
local v_u_1 = script.Parent
local v_u_2 = v_u_1:WaitForChild("Humanoid")
local v_u_3 = "Standing"
local v4, v5 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserNoUpdateOnLoop")
end)
local v_u_6 = v4 and v5
local v7, v8 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserEmoteToRunThresholdChange")
end)
local v_u_9 = v7 and v8
local v10, v11 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserPlayEmoteByIdAnimTrackReturn2")
end)
local v_u_12 = v10 and v11
local v_u_13 = script:FindFirstChild("ScaleDampeningPercent")
local v_u_14 = ""
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = 1
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = {}
local v_u_22 = {}
local v_u_23 = {
    ["idle"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507766666",
            ["weight"] = 1
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507766951",
            ["weight"] = 1
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507766388",
            ["weight"] = 9
        }
    },
    ["walk"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777826",
            ["weight"] = 10
        }
    },
    ["run"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507767714",
            ["weight"] = 10
        }
    },
    ["swim"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507784897",
            ["weight"] = 10
        }
    },
    ["swimidle"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507785072",
            ["weight"] = 10
        }
    },
    ["jump"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507765000",
            ["weight"] = 10
        }
    },
    ["fall"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507767968",
            ["weight"] = 10
        }
    },
    ["climb"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507765644",
            ["weight"] = 10
        }
    },
    ["sit"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=2506281703",
            ["weight"] = 10
        }
    },
    ["toolnone"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507768375",
            ["weight"] = 10
        }
    },
    ["toolslash"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=522635514",
            ["weight"] = 10
        }
    },
    ["toollunge"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=522638767",
            ["weight"] = 10
        }
    },
    ["wave"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770239",
            ["weight"] = 10
        }
    },
    ["point"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770453",
            ["weight"] = 10
        }
    },
    ["dance"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507771019",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507771955",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507772104",
            ["weight"] = 10
        }
    },
    ["dance2"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507776043",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507776720",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507776879",
            ["weight"] = 10
        }
    },
    ["dance3"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777268",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777451",
            ["weight"] = 10
        },
        {
            ["id"] = "http://www.roblox.com/asset/?id=507777623",
            ["weight"] = 10
        }
    },
    ["laugh"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770818",
            ["weight"] = 10
        }
    },
    ["cheer"] = {
        {
            ["id"] = "http://www.roblox.com/asset/?id=507770677",
            ["weight"] = 10
        }
    }
}
local v_u_24 = {
    ["wave"] = false,
    ["point"] = false,
    ["dance"] = true,
    ["dance2"] = true,
    ["dance3"] = true,
    ["laugh"] = false,
    ["cheer"] = false
}
math.randomseed(tick())
function findExistingAnimationInSet(p25, p26)
    if p25 == nil or p26 == nil then
        return 0
    end
    for v27 = 1, p25.count do
        if p25[v27].anim.AnimationId == p26.AnimationId then
            return v27
        end
    end
    return 0
end
function configureAnimationSet(p_u_28, p_u_29)
    -- upvalues: (copy) v_u_22, (copy) v_u_21, (copy) v_u_2
    if v_u_22[p_u_28] ~= nil then
        for _, v30 in pairs(v_u_22[p_u_28].connections) do
            v30:disconnect()
        end
    end
    v_u_22[p_u_28] = {}
    v_u_22[p_u_28].count = 0
    v_u_22[p_u_28].totalWeight = 0
    v_u_22[p_u_28].connections = {}
    local v_u_31 = true
    local v32, _ = pcall(function()
        -- upvalues: (ref) v_u_31
        v_u_31 = game:GetService("StarterPlayer").AllowCustomAnimations
    end)
    v_u_31 = not v32 and true or v_u_31
    local v33 = script:FindFirstChild(p_u_28)
    if v_u_31 and v33 ~= nil then
        local v34 = v_u_22[p_u_28].connections
        local v35 = v33.ChildAdded
        table.insert(v34, v35:connect(function(_)
            -- upvalues: (copy) p_u_28, (copy) p_u_29
            configureAnimationSet(p_u_28, p_u_29)
        end))
        local v36 = v_u_22[p_u_28].connections
        local v37 = v33.ChildRemoved
        table.insert(v36, v37:connect(function(_)
            -- upvalues: (copy) p_u_28, (copy) p_u_29
            configureAnimationSet(p_u_28, p_u_29)
        end))
        for _, v38 in pairs(v33:GetChildren()) do
            if v38:IsA("Animation") then
                local v39 = v38:FindFirstChild("Weight")
                local v40 = v39 == nil and 1 or v39.Value
                v_u_22[p_u_28].count = v_u_22[p_u_28].count + 1
                local v41 = v_u_22[p_u_28].count
                v_u_22[p_u_28][v41] = {}
                v_u_22[p_u_28][v41].anim = v38
                v_u_22[p_u_28][v41].weight = v40
                v_u_22[p_u_28].totalWeight = v_u_22[p_u_28].totalWeight + v_u_22[p_u_28][v41].weight
                local v42 = v_u_22[p_u_28].connections
                local v43 = v38.Changed
                table.insert(v42, v43:connect(function(_)
                    -- upvalues: (copy) p_u_28, (copy) p_u_29
                    configureAnimationSet(p_u_28, p_u_29)
                end))
                local v44 = v_u_22[p_u_28].connections
                local v45 = v38.ChildAdded
                table.insert(v44, v45:connect(function(_)
                    -- upvalues: (copy) p_u_28, (copy) p_u_29
                    configureAnimationSet(p_u_28, p_u_29)
                end))
                local v46 = v_u_22[p_u_28].connections
                local v47 = v38.ChildRemoved
                table.insert(v46, v47:connect(function(_)
                    -- upvalues: (copy) p_u_28, (copy) p_u_29
                    configureAnimationSet(p_u_28, p_u_29)
                end))
            end
        end
    end
    if v_u_22[p_u_28].count <= 0 then
        for v48, v49 in pairs(p_u_29) do
            v_u_22[p_u_28][v48] = {}
            v_u_22[p_u_28][v48].anim = Instance.new("Animation")
            v_u_22[p_u_28][v48].anim.Name = p_u_28
            v_u_22[p_u_28][v48].anim.AnimationId = v49.id
            v_u_22[p_u_28][v48].weight = v49.weight
            v_u_22[p_u_28].count = v_u_22[p_u_28].count + 1
            v_u_22[p_u_28].totalWeight = v_u_22[p_u_28].totalWeight + v49.weight
        end
    end
    for _, v50 in pairs(v_u_22) do
        for v51 = 1, v50.count do
            if v_u_21[v50[v51].anim.AnimationId] == nil then
                v_u_2:LoadAnimation(v50[v51].anim)
                v_u_21[v50[v51].anim.AnimationId] = true
            end
        end
    end
end
function configureAnimationSetOld(p_u_52, p_u_53)
    -- upvalues: (copy) v_u_22, (copy) v_u_2
    if v_u_22[p_u_52] ~= nil then
        for _, v54 in pairs(v_u_22[p_u_52].connections) do
            v54:disconnect()
        end
    end
    v_u_22[p_u_52] = {}
    v_u_22[p_u_52].count = 0
    v_u_22[p_u_52].totalWeight = 0
    v_u_22[p_u_52].connections = {}
    local v_u_55 = true
    local v56, _ = pcall(function()
        -- upvalues: (ref) v_u_55
        v_u_55 = game:GetService("StarterPlayer").AllowCustomAnimations
    end)
    v_u_55 = not v56 and true or v_u_55
    local v57 = script:FindFirstChild(p_u_52)
    if v_u_55 and v57 ~= nil then
        local v58 = v_u_22[p_u_52].connections
        local v59 = v57.ChildAdded
        table.insert(v58, v59:connect(function(_)
            -- upvalues: (copy) p_u_52, (copy) p_u_53
            configureAnimationSet(p_u_52, p_u_53)
        end))
        local v60 = v_u_22[p_u_52].connections
        local v61 = v57.ChildRemoved
        table.insert(v60, v61:connect(function(_)
            -- upvalues: (copy) p_u_52, (copy) p_u_53
            configureAnimationSet(p_u_52, p_u_53)
        end))
        local v62 = 1
        for _, v63 in pairs(v57:GetChildren()) do
            if v63:IsA("Animation") then
                local v64 = v_u_22[p_u_52].connections
                local v65 = v63.Changed
                table.insert(v64, v65:connect(function(_)
                    -- upvalues: (copy) p_u_52, (copy) p_u_53
                    configureAnimationSet(p_u_52, p_u_53)
                end))
                v_u_22[p_u_52][v62] = {}
                v_u_22[p_u_52][v62].anim = v63
                local v66 = v63:FindFirstChild("Weight")
                if v66 == nil then
                    v_u_22[p_u_52][v62].weight = 1
                else
                    v_u_22[p_u_52][v62].weight = v66.Value
                end
                v_u_22[p_u_52].count = v_u_22[p_u_52].count + 1
                v_u_22[p_u_52].totalWeight = v_u_22[p_u_52].totalWeight + v_u_22[p_u_52][v62].weight
                v62 = v62 + 1
            end
        end
    end
    if v_u_22[p_u_52].count <= 0 then
        for v67, v68 in pairs(p_u_53) do
            v_u_22[p_u_52][v67] = {}
            v_u_22[p_u_52][v67].anim = Instance.new("Animation")
            v_u_22[p_u_52][v67].anim.Name = p_u_52
            v_u_22[p_u_52][v67].anim.AnimationId = v68.id
            v_u_22[p_u_52][v67].weight = v68.weight
            v_u_22[p_u_52].count = v_u_22[p_u_52].count + 1
            v_u_22[p_u_52].totalWeight = v_u_22[p_u_52].totalWeight + v68.weight
        end
    end
    for _, v69 in pairs(v_u_22) do
        for v70 = 1, v69.count do
            v_u_2:LoadAnimation(v69[v70].anim)
        end
    end
end
function scriptChildModified(p71)
    -- upvalues: (copy) v_u_23
    local v72 = v_u_23[p71.Name]
    if v72 ~= nil then
        configureAnimationSet(p71.Name, v72)
    end
end
script.ChildAdded:connect(scriptChildModified)
script.ChildRemoved:connect(scriptChildModified)
local v73
if v_u_2 then
    v73 = v_u_2:FindFirstChildOfClass("Animator")
else
    v73 = nil
end
if v73 then
    local v74 = v73:GetPlayingAnimationTracks()
    for _, v75 in ipairs(v74) do
        v75:Stop(0)
        v75:Destroy()
    end
end
for v76, v77 in pairs(v_u_23) do
    configureAnimationSet(v76, v77)
end
local v_u_78 = "None"
local v_u_79 = 0
local v_u_80 = 0
local v_u_81 = false
function stopAllAnimations()
    -- upvalues: (ref) v_u_14, (copy) v_u_24, (ref) v_u_81, (ref) v_u_15, (ref) v_u_17, (ref) v_u_16, (ref) v_u_20, (ref) v_u_19
    local v82 = v_u_14
    local v83 = v_u_24[v82] ~= nil and v_u_24[v82] == false and "idle" or v82
    if v_u_81 then
        v83 = "idle"
        v_u_81 = false
    end
    v_u_14 = ""
    v_u_15 = nil
    if v_u_17 ~= nil then
        v_u_17:disconnect()
    end
    if v_u_16 ~= nil then
        v_u_16:Stop()
        v_u_16:Destroy()
        v_u_16 = nil
    end
    if v_u_20 ~= nil then
        v_u_20:disconnect()
    end
    if v_u_19 ~= nil then
        v_u_19:Stop()
        v_u_19:Destroy()
        v_u_19 = nil
    end
    return v83
end
function getHeightScale()
    -- upvalues: (copy) v_u_2, (ref) v_u_13
    if not v_u_2 then
        return 1
    end
    if not v_u_2.AutomaticScalingEnabled then
        return 1
    end
    local v84 = v_u_2.HipHeight / 2
    if v_u_13 == nil then
        v_u_13 = script:FindFirstChild("ScaleDampeningPercent")
    end
    if v_u_13 ~= nil then
        v84 = 1 + (v_u_2.HipHeight - 2) * v_u_13.Value / 2
    end
    return v84
end
local function v_u_91(p85)
    -- upvalues: (ref) v_u_16, (ref) v_u_19
    local v86 = p85 * 1.25 / getHeightScale()
    local v87 = 0.0001
    local v88 = v86 / 0.5
    local v89 = v86 / 1
    local v90
    if v86 <= 0.5 then
        v87 = 1
        v90 = 0.0001
    elseif v86 < 1 then
        v90 = (v86 - 0.5) / 0.5
        v87 = 1 - v90
        v88 = 1
        v89 = 1
    else
        v90 = 1
    end
    v_u_16:AdjustWeight(v87)
    v_u_19:AdjustWeight(v90)
    v_u_16:AdjustSpeed(v88)
    v_u_19:AdjustSpeed(v89)
end
function setAnimationSpeed(p92)
    -- upvalues: (ref) v_u_14, (copy) v_u_91, (ref) v_u_18, (ref) v_u_16
    if v_u_14 == "walk" then
        v_u_91(p92)
    elseif p92 ~= v_u_18 then
        v_u_18 = p92
        v_u_16:AdjustSpeed(v_u_18)
    end
end
function keyFrameReachedFunc(p93)
    -- upvalues: (ref) v_u_14, (copy) v_u_6, (ref) v_u_19, (ref) v_u_16, (copy) v_u_24, (ref) v_u_81, (ref) v_u_18, (copy) v_u_2
    if p93 == "End" then
        if v_u_14 == "walk" then
            if v_u_6 ~= true then
                v_u_19.TimePosition = 0
                v_u_16.TimePosition = 0
                return
            end
            if v_u_19.Looped ~= true then
                v_u_19.TimePosition = 0
            end
            if v_u_16.Looped ~= true then
                v_u_16.TimePosition = 0
                return
            end
        else
            local v94 = v_u_14
            local v95 = v_u_24[v94] ~= nil and v_u_24[v94] == false and "idle" or v94
            if v_u_81 then
                if v_u_16.Looped then
                    return
                end
                v95 = "idle"
                v_u_81 = false
            end
            local v96 = v_u_18
            playAnimation(v95, 0.15, v_u_2)
            setAnimationSpeed(v96)
        end
    end
end
function rollAnimation(p97)
    -- upvalues: (copy) v_u_22
    local v98 = math.random(1, v_u_22[p97].totalWeight)
    local v99 = 1
    while v_u_22[p97][v99].weight < v98 do
        v98 = v98 - v_u_22[p97][v99].weight
        v99 = v99 + 1
    end
    return v99
end
local function v_u_105(p100, p101, p102, p103)
    -- upvalues: (ref) v_u_15, (ref) v_u_16, (ref) v_u_19, (copy) v_u_6, (ref) v_u_18, (ref) v_u_14, (ref) v_u_17, (copy) v_u_22, (ref) v_u_20
    if p100 ~= v_u_15 then
        if v_u_16 ~= nil then
            v_u_16:Stop(p102)
            v_u_16:Destroy()
        end
        if v_u_19 ~= nil then
            v_u_19:Stop(p102)
            v_u_19:Destroy()
            if v_u_6 == true then
                v_u_19 = nil
            end
        end
        v_u_18 = 1
        v_u_16 = p103:LoadAnimation(p100)
        v_u_16.Priority = Enum.AnimationPriority.Core
        v_u_16:Play(p102)
        v_u_14 = p101
        v_u_15 = p100
        if v_u_17 ~= nil then
            v_u_17:disconnect()
        end
        v_u_17 = v_u_16.KeyframeReached:connect(keyFrameReachedFunc)
        if p101 == "walk" then
            local v104 = rollAnimation("run")
            v_u_19 = p103:LoadAnimation(v_u_22.run[v104].anim)
            v_u_19.Priority = Enum.AnimationPriority.Core
            v_u_19:Play(p102)
            if v_u_20 ~= nil then
                v_u_20:disconnect()
            end
            v_u_20 = v_u_19.KeyframeReached:connect(keyFrameReachedFunc)
        end
    end
end
function playAnimation(p106, p107, p108)
    -- upvalues: (copy) v_u_22, (copy) v_u_105, (ref) v_u_81
    local v109 = rollAnimation(p106)
    v_u_105(v_u_22[p106][v109].anim, p106, p107, p108)
    v_u_81 = false
end
function playEmote(p110, p111, p112)
    -- upvalues: (copy) v_u_105, (ref) v_u_81
    v_u_105(p110, p110.Name, p111, p112)
    v_u_81 = true
end
local v_u_113 = ""
local v_u_114 = nil
local v_u_115 = nil
local v_u_116 = nil
function toolKeyFrameReachedFunc(p117)
    -- upvalues: (ref) v_u_113, (copy) v_u_2
    if p117 == "End" then
        playToolAnimation(v_u_113, 0, v_u_2)
    end
end
function playToolAnimation(p118, p119, p120, p121)
    -- upvalues: (copy) v_u_22, (ref) v_u_115, (ref) v_u_114, (ref) v_u_113, (ref) v_u_116
    local v122 = rollAnimation(p118)
    local v123 = v_u_22[p118][v122].anim
    if v_u_115 ~= v123 then
        if v_u_114 ~= nil then
            v_u_114:Stop()
            v_u_114:Destroy()
            p119 = 0
        end
        v_u_114 = p120:LoadAnimation(v123)
        if p121 then
            v_u_114.Priority = p121
        end
        v_u_114:Play(p119)
        v_u_113 = p118
        v_u_115 = v123
        v_u_116 = v_u_114.KeyframeReached:connect(toolKeyFrameReachedFunc)
    end
end
function stopToolAnimations()
    -- upvalues: (ref) v_u_113, (ref) v_u_116, (ref) v_u_115, (ref) v_u_114
    local v124 = v_u_113
    if v_u_116 ~= nil then
        v_u_116:disconnect()
    end
    v_u_113 = ""
    v_u_115 = nil
    if v_u_114 ~= nil then
        v_u_114:Stop()
        v_u_114:Destroy()
        v_u_114 = nil
    end
    return v124
end
function onRunning(p125)
    -- upvalues: (ref) v_u_9, (ref) v_u_81, (copy) v_u_2, (ref) v_u_3, (copy) v_u_24, (ref) v_u_14
    local v126 = v_u_9 and v_u_81
    if v126 then
        v126 = v_u_2.MoveDirection == Vector3.new(0, 0, 0)
    end
    if (v126 and v_u_2.WalkSpeed or 0.75) < p125 then
        playAnimation("walk", 0.2, v_u_2)
        setAnimationSpeed(p125 / 16)
        v_u_3 = "Running"
    elseif v_u_24[v_u_14] == nil and not v_u_81 then
        playAnimation("idle", 0.2, v_u_2)
        v_u_3 = "Standing"
    end
end
function onDied()
    -- upvalues: (ref) v_u_3
    v_u_3 = "Dead"
end
function onJumping()
    -- upvalues: (copy) v_u_2, (ref) v_u_80, (ref) v_u_3
    playAnimation("jump", 0.1, v_u_2)
    v_u_80 = 0.31
    v_u_3 = "Jumping"
end
function onClimbing(p127)
    -- upvalues: (copy) v_u_2, (ref) v_u_3
    playAnimation("climb", 0.1, v_u_2)
    setAnimationSpeed(p127 / 5)
    v_u_3 = "Climbing"
end
function onGettingUp()
    -- upvalues: (ref) v_u_3
    v_u_3 = "GettingUp"
end
function onFreeFall()
    -- upvalues: (ref) v_u_80, (copy) v_u_2, (ref) v_u_3
    if v_u_80 <= 0 then
        playAnimation("fall", 0.2, v_u_2)
    end
    v_u_3 = "FreeFall"
end
function onFallingDown()
    -- upvalues: (ref) v_u_3
    v_u_3 = "FallingDown"
end
function onSeated()
    -- upvalues: (ref) v_u_3
    v_u_3 = "Seated"
end
function onPlatformStanding()
    -- upvalues: (ref) v_u_3
    v_u_3 = "PlatformStanding"
end
function onSwimming(p128)
    -- upvalues: (copy) v_u_2, (ref) v_u_3
    if p128 > 1 then
        playAnimation("swim", 0.4, v_u_2)
        setAnimationSpeed(p128 / 10)
        v_u_3 = "Swimming"
    else
        playAnimation("swimidle", 0.4, v_u_2)
        v_u_3 = "Standing"
    end
end
function animateTool()
    -- upvalues: (ref) v_u_78, (copy) v_u_2
    if v_u_78 == "None" then
        playToolAnimation("toolnone", 0.1, v_u_2, Enum.AnimationPriority.Idle)
        return
    elseif v_u_78 == "Slash" then
        playToolAnimation("toolslash", 0, v_u_2, Enum.AnimationPriority.Action)
        return
    elseif v_u_78 == "Lunge" then
        playToolAnimation("toollunge", 0, v_u_2, Enum.AnimationPriority.Action)
    end
end
function getToolAnim(p129)
    for _, v130 in ipairs(p129:GetChildren()) do
        if v130.Name == "toolanim" and v130.className == "StringValue" then
            return v130
        end
    end
    return nil
end
local v_u_131 = 0
function stepAnimate(p132)
    -- upvalues: (ref) v_u_131, (ref) v_u_80, (ref) v_u_3, (copy) v_u_2, (copy) v_u_1, (ref) v_u_78, (ref) v_u_79, (ref) v_u_115
    local v133 = p132 - v_u_131
    v_u_131 = p132
    if v_u_80 > 0 then
        v_u_80 = v_u_80 - v133
    end
    if v_u_3 == "FreeFall" and v_u_80 <= 0 then
        playAnimation("fall", 0.2, v_u_2)
    else
        if v_u_3 == "Seated" then
            playAnimation("sit", 0.5, v_u_2)
            return
        end
        if v_u_3 == "Running" then
            playAnimation("walk", 0.2, v_u_2)
        elseif v_u_3 == "Dead" or (v_u_3 == "GettingUp" or (v_u_3 == "FallingDown" or (v_u_3 == "Seated" or v_u_3 == "PlatformStanding"))) then
            stopAllAnimations()
        end
    end
    local v134 = v_u_1:FindFirstChildOfClass("Tool")
    if v134 and v134:FindFirstChild("Handle") then
        local v135 = getToolAnim(v134)
        if v135 then
            v_u_78 = v135.Value
            v135.Parent = nil
            v_u_79 = p132 + 0.3
        end
        if v_u_79 < p132 then
            v_u_79 = 0
            v_u_78 = "None"
        end
        animateTool()
    else
        stopToolAnimations()
        v_u_78 = "None"
        v_u_115 = nil
        v_u_79 = 0
    end
end
v_u_2.Died:connect(onDied)
v_u_2.Running:connect(onRunning)
v_u_2.Jumping:connect(onJumping)
v_u_2.Climbing:connect(onClimbing)
v_u_2.GettingUp:connect(onGettingUp)
v_u_2.FreeFalling:connect(onFreeFall)
v_u_2.FallingDown:connect(onFallingDown)
v_u_2.Seated:connect(onSeated)
v_u_2.PlatformStanding:connect(onPlatformStanding)
v_u_2.Swimming:connect(onSwimming)
script:WaitForChild("PlayEmote").OnInvoke = function(p136)
    -- upvalues: (ref) v_u_3, (copy) v_u_24, (copy) v_u_2, (ref) v_u_12, (ref) v_u_16
    if v_u_3 == "Standing" then
        if v_u_24[p136] == nil then
            if typeof(p136) == "Instance" and p136:IsA("Animation") then
                playEmote(p136, 0.1, v_u_2)
                if v_u_12 then
                    return true, v_u_16
                else
                    return true
                end
            else
                return false
            end
        else
            playAnimation(p136, 0.1, v_u_2)
            if v_u_12 then
                return true, v_u_16
            else
                return true
            end
        end
    else
        return
    end
end
if v_u_1.Parent ~= nil then
    playAnimation("idle", 0.1, v_u_2)
    local _ = "Standing"
end
while v_u_1.Parent ~= nil do
    local _, v137 = wait(0.1)
    stepAnimate(v137)
end

--========================================
-- Script : Workspace.tower.sections.lobby.shop.crate.Crate2l.logo.Meshes/yxY.rgbPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.Mutators.sale.Part.SurfaceGui.HOLOGRAM.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.Mutators.sale.Part.SurfaceGui.HOLOGRAM.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.clickers.GearShopOpen.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
script.Parent:WaitForChild("ClickDetector").MouseClick:Connect(function()
    game.Players.LocalPlayer.PlayerGui.shop_mutators.open.Value = false
    game.Players.LocalPlayer.PlayerGui.shop_gears.open.Value = true
    game.Players.LocalPlayer.PlayerGui.shop_coins.open.Value = false
    local v1 = game.Players.LocalPlayer.CameraMinZoomDistance
    game.Players.LocalPlayer.CameraMinZoomDistance = 2
    game.Players.LocalPlayer.CameraMinZoomDistance = v1
end)

--========================================
-- Script : Workspace.tower.sections.lobby.shop.clickers.MutatorShopOpen.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
script.Parent:WaitForChild("ClickDetector").MouseClick:Connect(function()
    game.Players.LocalPlayer.PlayerGui.shop_mutators.open.Value = true
    game.Players.LocalPlayer.PlayerGui.shop_gears.open.Value = false
    game.Players.LocalPlayer.PlayerGui.shop_coins.open.Value = false
    local v1 = game.Players.LocalPlayer.CameraMinZoomDistance
    game.Players.LocalPlayer.CameraMinZoomDistance = 2
    game.Players.LocalPlayer.CameraMinZoomDistance = v1
end)

--========================================
-- Script : Workspace.tower.sections.lobby.shop.clickers.Analytics
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.clickers.CoinShopOpen.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
script.Parent:WaitForChild("ClickDetector").MouseClick:Connect(function()
    game.Players.LocalPlayer.PlayerGui.shop_mutators.open.Value = false
    game.Players.LocalPlayer.PlayerGui.shop_gears.open.Value = false
    game.Players.LocalPlayer.PlayerGui.shop_coins.open.Value = true
    local v1 = game.Players.LocalPlayer.CameraMinZoomDistance
    game.Players.LocalPlayer.CameraMinZoomDistance = 2
    game.Players.LocalPlayer.CameraMinZoomDistance = v1
end)

--========================================
-- Script : Workspace.tower.sections.lobby.shop.crate.Crate2l.logo.Meshes/yxY.rgbPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.MiniVault.Door.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.MiniVault.Cola.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.Sale.Part.fusion.ColorManager
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.Sale.Part.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.crate.Crate2l.logoYX.Meshes/yxY.rgbPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.crate.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.crate.Crate2l.logo.Meshes/yxY.rgbPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.shop.crate.Crate2l.logo.Meshes/yxY.rgbPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.gatead.AttributesController
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.gatead.Setup
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = script.Parent:WaitForChild("Door")
local v_u_2 = v_u_1:WaitForChild("AdPortal")
local v_u_3 = v_u_2:WaitForChild("AdGui")
local v_u_4 = script.Parent:WaitForChild("AdGuiAdornee")
local v_u_5 = script.Parent:WaitForChild("AdGuiVisible")
local v_u_6 = script.Parent:WaitForChild("AdGuiHidden")
local function v_u_8()
    -- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_6
    for _, v7 in pairs(script.Parent:GetDescendants()) do
        if v7:IsA("BasePart") and v7 ~= v_u_1 then
            v7.CanCollide = false
            v7.Transparency = 1
        end
    end
    v_u_4.CFrame = v_u_6.CFrame
    script.Parent.towerwall.Value.Transparency = 0
    script.Parent.towerwall.Value.CanCollide = true
end
local function v_u_10()
    -- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_5
    for _, v9 in pairs(script.Parent:GetDescendants()) do
        if v9:IsA("BasePart") and v9 ~= v_u_1 then
            v9.CanCollide = true
            v9.Transparency = 0
        end
    end
    v_u_4.CFrame = v_u_5.CFrame
end
local function v_u_11()
    -- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_2, (copy) v_u_10
    if game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId):WaitForChild("settings"):WaitForChild("Adblock").Value then
        v_u_8()
        return
    elseif v_u_3.Status == Enum.AdUnitStatus.Active and v_u_2.Status == Enum.AdUnitStatus.Active then
        script.Parent.towerwall.Value.Transparency = 1
        script.Parent.towerwall.Value.CanCollide = false
        v_u_10()
        return
    elseif v_u_3.Status == Enum.AdUnitStatus.Active and v_u_2.Status == Enum.AdUnitStatus.Inactive then
        script.Parent.towerwall.Value.Transparency = 0
        script.Parent.towerwall.Value.CanCollide = true
        v_u_10()
    elseif v_u_3.Status == Enum.AdUnitStatus.Inactive then
        v_u_8()
    end
end
v_u_3:GetPropertyChangedSignal("Status"):Connect(v_u_11)
v_u_2:GetPropertyChangedSignal("Status"):Connect(v_u_11)
script.Parent.DescendantAdded:Connect(function()
    -- upvalues: (copy) v_u_11
    v_u_11()
end)
v_u_11()

--========================================
-- Script : Workspace.tower.sections.lobby.Chill.Stacker.Stacker.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = script.Parent:WaitForChild("BaseSegment")
local v_u_2 = v_u_1
local v_u_3 = 0
local v_u_4 = script.Parent:WaitForChild("Segments"):WaitForChild("1")
local v_u_5 = nil
function get_speed(p6, p7)
    return script.Parent:GetAttribute("speed_base") + (p6 - 1) * script.Parent:GetAttribute("speed_increase") * math.sqrt(p7)
end
function position_segment(p8)
    -- upvalues: (copy) v_u_1, (ref) v_u_4, (ref) v_u_2
    v_u_4.Position = (v_u_1.Position + v_u_1.CFrame.RightVector * p8) * Vector3.new(1, 0, 1) + v_u_2.Position * Vector3.new(0, 1, 0) + v_u_2.CFrame.UpVector * (v_u_4.Size.Y / 2 + v_u_2.Size.Y / 2)
end
function update_segment()
    -- upvalues: (ref) v_u_4, (copy) v_u_1, (ref) v_u_5
    local v9 = time() * get_speed(v_u_4.Name, v_u_4.Size.X)
    local v10 = v_u_1.Size.X - v_u_4.Size.X
    local v11 = v9 % (v10 * 2)
    if v10 < v11 then
        v11 = v10 - (v11 - v10)
    end
    v_u_5 = v11 - v10 / 2
    position_segment(v_u_5)
end
function place_segment()
    -- upvalues: (ref) v_u_5, (ref) v_u_3, (ref) v_u_4, (ref) v_u_2
    local v12 = script.Parent:GetAttribute("bias") / 1000
    local v13 = v_u_5
    local v14 = v_u_5 - v_u_3
    local v15 = math.abs(v14)
    local v16 = get_speed(v_u_4.Name, v_u_4.Size.X) * v12
    local v17 = math.min(v15, v16)
    local v18 = v_u_3 - v_u_5
    local v19 = v13 + v17 * math.sign(v18)
    local v20 = v_u_3 - v_u_2.Size.X / 2
    local v21 = v_u_3 + v_u_2.Size.X / 2
    local v22 = v19 - v_u_4.Size.X / 2
    local v23 = v19 + v_u_4.Size.X / 2
    local v24 = math.max(v20, v22)
    local v25 = math.min(v21, v23)
    local v26 = (v24 + v25) / 2
    local v27 = v25 - v24
    if v27 <= 0 then
        lost()
        return
    else
        local v28 = v_u_4
        local v29 = v_u_4.Size.Y
        local v30 = v_u_4.Size.Z
        v28.Size = Vector3.new(v27, v29, v30)
        position_segment(v26)
        v_u_2 = v_u_4
        v_u_3 = v26
        local v31 = v_u_4.Name
        if tonumber(v31) == script.Parent:GetAttribute("height") then
            won()
        else
            v_u_4 = v_u_4:Clone()
            v_u_4.Name = v_u_4.Name + 1
            v_u_4.Parent = v_u_2.Parent
        end
    end
end
function lost()
    -- upvalues: (ref) v_u_4
    script.Parent:SetAttribute("state", "lost")
    v_u_4.Color = Color3.new(0.8, 0.3, 0.3)
    wait(1)
    reset()
end
function won()
    -- upvalues: (ref) v_u_4
    script.Parent:SetAttribute("state", "won")
    local v32 = v_u_4.Color
    local v33 = script.Parent.Segments:GetChildren()
    table.sort(v33, function(p34, p35)
        local v36 = p34.Name
        local v37 = tonumber(v36)
        local v38 = p35.Name
        return tonumber(v38) < v37
    end)
    for _, v39 in pairs(v33) do
        v39.Color = Color3.new(0.35, 0.8, 0.3)
        wait(0.1)
    end
    wait(0.2)
    for _, v40 in pairs(v33) do
        v40.Color = v32
    end
    reset()
end
function reset()
    -- upvalues: (ref) v_u_4, (ref) v_u_2, (copy) v_u_1, (ref) v_u_3
    for _, v41 in pairs(script.Parent.Segments:GetChildren()) do
        if v41.Name ~= "1" then
            v41:Destroy()
        end
    end
    v_u_4 = script.Parent.Segments["1"]
    v_u_2 = v_u_1
    v_u_3 = 0
    script.Parent:SetAttribute("state", "running")
end
script.Parent.place_segment.OnInvoke = place_segment
game:GetService("RunService").RenderStepped:Connect(function()
    if script.Parent:GetAttribute("state") == "running" then
        update_segment()
    end
end)

--========================================
-- Script : Workspace.tower.sections.lobby.Chill.Stacker.Stacker.Click
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = false
script.Parent:WaitForChild("Button"):WaitForChild("ClickDetector").MouseClick:Connect(function()
    -- upvalues: (ref) v_u_1
    if not v_u_1 then
        v_u_1 = true
        script.Parent.place_segment:Invoke()
        v_u_1 = false
    end
end)

--========================================
-- Script : Workspace.tower.sections.lobby.ChillSelector
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : Workspace.tower.sections.lobby.gate.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : StarterPlayer.StarterCharacterScripts.hitboxScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : StarterPlayer.StarterCharacterScripts.invisible.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Spectral
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Glowing Gravity Coil
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Transparent Gravity Coil
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Transparent Fusion Coil
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Transparent Speed Coil
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Glowing Speed Coil
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Glowing Fusion Coil
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.YXceptional Hook
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Blue Hourglass Sand
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.White Hook
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Rusted Hook
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Magma Trowel
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Green Hook
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Green Hourglass Sand
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Red Hourglass Sand
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Black Hourglass Sand
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.White Hourglass Sand
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Purple Hourglass Sand
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Cherry Hourglass
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Golden Trowel
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.YXceptional Trowel
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Copper Trowel
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Obsidian Hook
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Leaf Trowel
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Walnut Hourglass
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Yellow Hourglass Sand
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Acacia Hourglass
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Cat Ears
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Cat Tail
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Easter Balloon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Grapple Cane
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Festive Trowel
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Candy Speed Coil
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Candy Gravity Coil
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Candy Fusion Coil
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Blue Trail Tip
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Cyan Trail Tip
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Purple Trail Tip
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Black Trail Tip
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Green Trail Tip
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Red Trail Tip
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Yellow Trail Tip
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Orange Trail Tip
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.White Trail Tip
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Trail.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Loading Halo.rgbPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Rainbow Halo.Handle.rgbPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Spiral Ring.rgbPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Spiral Halo.rgbPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Present.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Effects.Dinnerbone.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Gear.bomb.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Gear.cola.BloxyColaScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Gear.yxterminator.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Gear.trowel.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Gear.banana.Banan
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Gear.banana.Handle.BananaTrip
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
if script.Parent.Name == "Banana" then
    wait(0.5)
    script.Parent.Touched:Connect(function(p1)
        local v2 = p1.Parent
        local v3 = v2:FindFirstChild("Humanoid")
        if v3 then
            local v4 = v3:GetState()
            if v4 == Enum.HumanoidStateType.Running or (v4 == Enum.HumanoidStateType.RunningNoPhysics or (v4 == Enum.HumanoidStateType.Climbing or (v4 == Enum.HumanoidStateType.Jumping or (v4 == Enum.HumanoidStateType.Freefall or (v4 == Enum.HumanoidStateType.Landed or (v4 == Enum.HumanoidStateType.Physics or v4 == Enum.HumanoidStateType.GettingUp)))))) then
                local v5 = p1.AssemblyLinearVelocity.Magnitude
                local v6 = math.max(1, v5)
                local v7 = math.pow(v6, -0.5) * 3 + 1
                p1.AssemblyLinearVelocity = p1.AssemblyLinearVelocity * Vector3.new(v7, 1, v7)
                script.Parent.Sound.TimePosition = 0.4
                script.Parent.Sound:Resume()
                if v2 == game.Players.LocalPlayer.Character then
                    v3:ChangeState(Enum.HumanoidStateType.FallingDown)
                end
            end
        else
            return
        end
    end)
end

--========================================
-- Script : ReplicatedStorage.Assets.Gear.fishingrod.Script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Gear.fishingrod.RopeScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = Instance.new("Part")
v_u_1.Shape = Enum.PartType.Cylinder
v_u_1.Parent = script.Parent
v_u_1.BrickColor = BrickColor.new("Really black")
v_u_1.CanCollide = false
v_u_1.Anchored = true
game:GetService("RunService").RenderStepped:Connect(function()
    -- upvalues: (copy) v_u_1
    local v2 = script.Parent.Handle.RodAttachment.WorldPosition
    local v3 = script.Parent.RopeConstraint.Attachment1.WorldPosition
    local v4 = (v2 + v3) / 2
    v_u_1.CFrame = CFrame.lookAt(v4, v3) * CFrame.Angles(0, 1.5707963267948966, 0)
    local v5 = v_u_1
    local v6 = (v3 - v2).Magnitude
    v5.Size = Vector3.new(v6, 0.2, 0.2)
end)

--========================================
-- Script : ReplicatedStorage.Assets.Gear.speed.ColorManager
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Gear.jump.ColorManager
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Gear.gravity.ColorManager
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : ReplicatedStorage.Assets.Gear.fusion.ColorManager
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- [FilteringEnabled] Server Scripts are IMPOSSIBLE to save

--========================================
-- Script : README
--========================================
--[[
		Thank you for using UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw.

		If you didn't save in Binary (rbxl) - it's recommended to save the game right away to take advantage of the binary format & to preserve values of certain properties if you used IgnoreDefaultProperties setting (as they might change in the future).
		You can do that by going to FILE -> Save to File As -> Make sure File Name ends with .rbxl -> Save

		ServerStorage, ServerScriptService and Server Scripts are IMPOSSIBLE to save because of FilteringEnabled.

		If your player cannot spawn into the game, please move the scripts in StarterPlayer somewhere else or delete them. Then run `game:GetService("Players").CharacterAutoLoads = true`.
		And use "Play Here" to start game instead of "Play" to spawn your Character where your Camera currently is.

		If the chat system does not work, please use the explorer and delete everything inside the TextChatService/Chat service(s). 
		Or run `game:GetService("Chat"):ClearAllChildren() game:GetService("TextChatService"):ClearAllChildren()`
				
		If Union and MeshPart collisions don't work, run the script below in the Studio Command Bar:
				
				
		local C = game:GetService("CoreGui")
		local D = Enum.CollisionFidelity.Default
				
		for _, v in game:GetDescendants() do
			if v:IsA("TriangleMeshPart") and not v:IsDescendantOf(C) then
				v.CollisionFidelity = D
			end
		end
		print("Done")
				
		If you can't move the Camera, run this script in the Studio Command Bar:
			
		workspace.CurrentCamera.CameraType = Enum.CameraType.Fixed
		
		Or Destroy the Camera.

		This file was generated with the following settings:
		{"SaveBytecode":false,"Callback":false,"ShowStatus":true,"IgnoreDefaultPlayerScripts":true,"NilInstancesFixes":{"BaseWrap":null,"Animator":null,"Attachment":null,"PackageLink":null,"AdPortal":null},"IgnoreList":["CoreGui","CorePackages"],"__DEBUG_MODE":false,"DecompileJobless":false,"IgnoreNotArchivable":true,"RemovePlayerCharacters":true,"Object":null,"DecompileIgnore":["TextChatService",null,null,null,null,null,null],"IgnoreSpecialProperties":false,"TreatUnionsAsParts":false,"IsModel":false,"NilInstances":false,"ExtraInstances":[],"noscripts":false,"ReadMe":true,"OptionsAliases":{"SavePlayers":"IsolatePlayers","IgnoreArchivable":"IgnoreNotArchivable","DecompileTimeout":"timeout","SaveNonCreatable":"SaveNotCreatable","InstancesBlacklist":"IgnoreList","IsolatePlayerGui":"IsolateLocalPlayer","FileName":"FilePath","IgnoreDefaultProps":"IgnoreDefaultProperties"},"scriptcache":true,"SharedStringOverwrite":false,"AlternativeWritefile":true,"mode":"full","SaveCacheInterval":56320,"IgnoreSharedStrings":true,"IsolatePlayers":false,"NotCreatableFixes":["","AdvancedDragger","AnimationTrack","Dragger","Player","PlayerGui","PlayerMouse","PlayerMouse","PlayerScripts","ScreenshotHud","StudioData","TextChatMessage","TextSource","TouchTransmitter","Translator"],"timeout":10,"IgnoreDefaultProperties":true,"Anonymous":false,"IsolateStarterPlayer":false,"IsolateLocalPlayerCharacter":false,"IgnorePropertiesOfNotScriptsOnScriptsMode":false,"AvoidFileOverwrite":true,"SaveNotCreatable":false,"IsolateLocalPlayer":false,"FilePath":false,"AntiIdle":true,"ShutdownWhenDone":false,"SafeMode":false,"IgnoreProperties":[]}

		Elapsed time: 14.387713699994492 Date (UTC): 24 February 2026 16:20:48 PlaceId: 1962086868 PlaceVersion: 2389 Client Version: 0.709.0.7090870 Executor: Synapse X v2.4.6
]]
