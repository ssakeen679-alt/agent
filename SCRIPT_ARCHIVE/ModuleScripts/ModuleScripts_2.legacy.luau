
--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.WeaponFire.MovingFireModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("SoundService").Sound
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Players")
local v_u_5 = game:GetService("Debris")
local v_u_6 = v_u_4.LocalPlayer
local v_u_7 = workspace.Terrain
local v_u_8 = workspace.Camera
local v_u_9 = v_u_2.RemoteEvent.WeaponEvent.ReplicateHit
local v_u_10 = require(v_u_2.AllModules.CharacterSize.GetCharacterScale)
local v_u_11 = require(v_u_2.AllModules.Functions.ScaleNumberSequence)
local v_u_12 = require(v_u_2.AllModules.Functions.ScaleNumbeRange)
local v_u_13 = require(v_u_2.AllModules.WeaponStats)
local v_u_14 = v_u_2.Tools.FireParts
local v_u_15 = v_u_2.Tools.Effects
local v_u_16 = v_u_13.MovingPartLifeTime
local v_u_17 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v_u_18 = {}
local v_u_19 = nil
local v_u_20 = nil
for _, v21 in pairs({ "Millionaire cannon", "Billionaire cannon", "Greedy clone cannon" }) do
    v_u_18[v21] = {
        ["IncomeTxt"] = "+$" .. v_u_13[v21].HitIncome / 1000 .. "K",
        ["MinLevel"] = v_u_13[v21].LevelRequiredForEffect
    }
end
local v_u_22 = {}
local v_u_23 = {}
v_u_22.AllFireParts = v_u_23
local v_u_24 = {
    ["IsPartOwned"] = false,
    ["HasTouched"] = false,
    ["UniqueId"] = "",
    ["Part"] = nil
}
function v_u_22.Fire(p25, p26, p27, p28, p29, p30, p31, p32)
    -- upvalues: (copy) v_u_14, (copy) v_u_10, (copy) v_u_13, (copy) v_u_24, (copy) v_u_22, (copy) v_u_16
    local v33 = v_u_14:FindFirstChild(p26 .. (p32 or "")) or v_u_14:FindFirstChild(p26)
    if not v33 then
        return
    end
    local v34 = v33:Clone()
    v34.Parent = workspace
    local v35 = CFrame.lookAt(p25, p27).Rotation
    local v36 = v34:GetAttribute("OrientCF")
    if v36 then
        v35 = v35 * v36
    end
    local v37 = p31 or v_u_10(p28) ^ 0.7
    if v37 ~= 1 then
        local v38 = Instance.new("Model")
        v34.Parent = v38
        v38:ScaleTo(v37)
        v34.Parent = workspace
        v38:Destroy()
    end
    local v39
    if p32 then
        v39 = v_u_13[p26][p32]
    else
        v39 = p32
    end
    local v40 = (p27 - p25).Unit
    local v41 = v39 and v39.Speed or v_u_13[p26].Speed
    local v42 = v_u_24
    local v43 = setmetatable({}, v42)
    v43.ModelWhoFired = p28
    v43.IsPartOwned = not p30
    v43.SizeFactor = v37
    v43.Direction = v40
    v43.UniqueId = p29
    v43.ToolName = p26
    v43.ToolMode = p32
    v43.Part = v34
    v_u_22.AllFireParts[p29] = v43
    local v44 = RaycastParams.new()
    v44.FilterType = Enum.RaycastFilterType.Exclude
    v44.FilterDescendantsInstances = { p28 }
    v34:PivotTo(CFrame.new(p25) * v35)
    if p30 then
        local v45 = v40 * v41 * p30
        if v45.Magnitude < 1020 then
            CastRay(v43, p25, v45, v40, v44)
        end
        p25 = p25 + v45
    end
    local v46 = task.wait()
    local v47 = 0
    while v47 + v46 < v_u_16 and not v43.HasTouched do
        v47 = v47 + v46
        local v48 = v40 * v41 * v46
        CastRay(v43, p25, v48, v40, v44)
        if v43.HasTouched then
            break
        end
        p25 = p25 + v48
        v34:PivotTo(CFrame.new(p25) * v35)
        v46 = task.wait()
    end
    Destroy(p29)
end
function v_u_22.ServerHit(p49, p50)
    -- upvalues: (copy) v_u_23
    local v51 = v_u_23[p49]
    if not v51.HasTouched then
        OnHit(v51, p50)
    end
end
local v_u_52 = {
    "Egg cannon",
    "Ice spike cannon",
    "Cube cannon",
    "Snowball"
}
function OnHit(p53, p54)
    -- upvalues: (copy) v_u_8, (copy) v_u_52, (copy) v_u_7, (copy) v_u_15, (ref) v_u_19, (copy) v_u_18, (copy) v_u_6, (copy) v_u_3, (copy) v_u_17, (ref) v_u_20, (copy) v_u_2, (copy) v_u_4, (copy) v_u_1, (copy) v_u_11, (copy) v_u_12, (copy) v_u_5, (copy) v_u_9
    if (v_u_8.CFrame.Position - p53.Part.Position).Magnitude < 500 then
        local v55 = p53.Part:FindFirstChild("Fire") or (p53.Part:FindFirstChild("Sparkles") or p53.Part:FindFirstChild("ParticleEmitter") or (p53.Part:FindFirstChild("EffectAtt") and p53.Part.EffectAtt:FindFirstChild("Fire") or p53.Part:FindFirstChild("Trail")))
        if v55 or table.find(v_u_52, p53.ToolName) then
            local v56 = Instance.new("Attachment", v_u_7)
            v56.WorldCFrame = CFrame.lookAlong(p53.Part.Position, p53.Direction)
            local v57 = nil
            local v58 = nil
            local v59 = nil
            local v60 = 1
            if p53.ToolName == "Egg cannon" then
                v58 = v_u_15.ChocolateSplash:Clone()
                v57 = v_u_15.EggSplat:Clone()
                if p53.ToolMode == "Red" then
                    if not v_u_19 then
                        v_u_19 = require(script.Parent.Parent.ExplosionReplicator.AnimateExplosion)
                    end
                    v_u_19(p53.Part.Position)
                end
            elseif p53.ToolName == "Cube cannon" or (p53.ToolName == "Extra cannon" or v_u_18[p53.ToolName]) then
                v56.CFrame = v56.CFrame * CFrame.Angles(0.7853981633974483, 0, 0)
                v57 = v_u_15.Debris:Clone()
                v58 = v_u_15.DebrisEmitter:Clone()
                v60 = 20
                local v61 = v_u_18[p53.ToolName]
                if v61 then
                    local v62 = true
                    if p53.ToolName == "Greedy clone cannon" then
                        local v63
                        if p54 then
                            v63 = p54:FindFirstAncestorOfClass("Model")
                        else
                            v63 = p54
                        end
                        if not (v63 and v63:HasTag("Clone")) then
                            v62 = false
                        end
                    end
                    v58.Color = ColorSequence.new(Color3.fromRGB(255, 245, 133))
                    if v62 then
                        v58.Texture = "rbxassetid://6908632622"
                        local v64 = v_u_15.Coins:Clone()
                        v64.Parent = v56
                        v64:Play()
                        v60 = 10
                    elseif p53.ToolName == "Greedy clone cannon" then
                        v58.Texture = "rbxassetid://7114263327"
                    end
                    local v65
                    if v_u_6.leaderstats.Level.Value >= v61.MinLevel then
                        v65 = v61.IncomeTxt
                    else
                        v65 = nil
                    end
                    if p53.IsPartOwned and (v65 and v62) then
                        local v_u_66 = v_u_15.IncomeGui:Clone()
                        v_u_66.Parent = v56
                        v_u_66.Size = UDim2.new()
                        v_u_66.TextLabel.Text = v65
                        if p53.Direction.Y > 0 then
                            v_u_66.SizeOffset = Vector2.zero
                        end
                        local v_u_67 = v_u_3:Create(v_u_66, v_u_17, {
                            ["Size"] = UDim2.new(4, 20, 1, 5)
                        })
                        v_u_67:Play()
                        task.delay(1.5, function()
                            -- upvalues: (ref) v_u_67, (ref) v_u_3, (copy) v_u_66, (ref) v_u_17
                            v_u_67 = v_u_3:Create(v_u_66, v_u_17, {
                                ["Size"] = UDim2.new()
                            })
                            v_u_67:Play()
                        end)
                    end
                elseif p53.ToolName == "Extra cannon" then
                    v58.Color = ColorSequence.new(Color3.fromRGB(255, 245, 133))
                end
            elseif p53.ToolName == "Firework cannon" then
                v58 = v_u_15.FireworksExplodeEffect:Clone()
                v58.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.fromHSV(math.random(0, 99) / 100, 1, 0.5)) })
                v57 = v_u_15.FireworkSnd:Clone()
            elseif p53.ToolName == "Snowball" then
                v58 = v_u_15.SnowballHit:Clone()
                v57 = v_u_15.SnowballHitSnd:Clone()
                v60 = 30
            elseif p53.ToolName == "Heart cannon" then
                local v68
                if p54 then
                    v68 = p54:FindFirstAncestorOfClass("Model")
                else
                    v68 = p54
                end
                if not v_u_20 then
                    v_u_20 = require(v_u_2.AllModules.Friends.IsCharAFriendlyUnit)
                end
                local v69 = v_u_4:GetPlayerFromCharacter(p53.ModelWhoFired)
                if v69 then
                    v69 = v_u_20(v69, v68)
                end
                if v69 then
                    v57 = v_u_15.HeartCannonHealSnd:Clone()
                    v58 = v_u_15.HealEmitter:Clone()
                    v60 = 40
                else
                    v57 = v_u_15.HeartCannonHit:Clone()
                    v58 = v_u_15.DebrisEmitter:Clone()
                    v58.Color = ColorSequence.new(Color3.new(1, 1, 1))
                    v58.LightEmission = 1
                    v60 = 8
                end
            elseif p53.ToolName == "Ice spike cannon" then
                v57 = v_u_15.IceImpactSound:Clone()
            elseif p53.ToolName == "Pumpkin launcher" then
                v59 = v_u_15.PumpkinExplosion:Clone()
                local v70 = p53.ToolMode and p53.ToolMode ~= "" and (p53.ToolMode:sub(-1) or 0) or 0
                local v71 = tonumber(v70)
                if v71 < 3 then
                    v59.Sparks:Destroy()
                    if v71 < 1 then
                        v57 = v_u_15.PumpkinImpact:Clone()
                        v59.BrightWave:Destroy()
                    else
                        v57 = v_u_15.LightExplosion:Clone()
                    end
                else
                    v57 = v_u_1.ExplosionSound:Clone()
                end
            elseif p53.ToolName:find("ift cannon") then
                v59 = v_u_15[p53.ToolName .. p53.ToolMode]:Clone()
                v57 = (p53.ToolMode == "Red" and v_u_15.PumpkinImpact or v_u_15.GiftExplosion):Clone()
            end
            if v57 then
                v57.Parent = v56
                v57:Play()
            end
            if v58 then
                if p53.SizeFactor ~= 1 then
                    v58.Size = v_u_11(v58.Size, p53.SizeFactor)
                    v58.Speed = v_u_12(v58.Speed, p53.SizeFactor)
                    v58.Acceleration = v58.Acceleration * p53.SizeFactor
                end
                v58.Parent = v56
                v58.Enabled = false
                v58:Emit(v60)
            end
            if v59 then
                for _, v72 in pairs(v59:GetChildren()) do
                    v72.Parent = v56
                    if p53.SizeFactor ~= 1 then
                        v72.Size = v_u_11(v72.Size, p53.SizeFactor)
                        v72.Speed = v_u_12(v72.Speed, p53.SizeFactor)
                        v72.Acceleration = v72.Acceleration * p53.SizeFactor
                    end
                    v72:Emit(v72:GetAttribute("EmitCount"))
                end
                v59:Destroy()
            end
            if v55 then
                v55.Parent = v56
                v55.Enabled = false
            end
            v_u_5:AddItem(v56, 5)
        end
        local v73 = p53.Part:FindFirstChildOfClass("Trail")
        if v73 then
            local v74 = v73.Attachment0
            local v75 = v73.Attachment1
            local v76 = v74.WorldPosition
            local v77 = v75.WorldPosition
            v74.Parent = v_u_7
            v75.Parent = v_u_7
            v74.WorldPosition = v76
            v75.WorldPosition = v77
            v73.Parent = v_u_7
            v_u_5:AddItem(v74, 15)
            v_u_5:AddItem(v75, 15)
            v_u_5:AddItem(v73, 15)
        end
    end
    p53.HasTouched = true
    if p53.IsPartOwned and p54 then
        v_u_9:FireServer(p53.UniqueId, p54)
    end
end
function CastRay(p78, p79, p80, p81, p82)
    local v83 = workspace:Shapecast(p78.Part, p80, p82)
    if v83 and v83.Distance then
        p78.Part.Position = p79 + v83.Distance * p81
        OnHit(p78, v83.Instance)
    end
end
function Destroy(p84)
    -- upvalues: (copy) v_u_23
    v_u_23[p84].Part:Destroy()
    task.wait()
    table.clear(v_u_23[p84])
    v_u_23[p84] = nil
end
return v_u_22

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.WeaponFire.CheckFiringThroughtWalls
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Players").LocalPlayer
local v_u_2 = {}
function GetAttachment(p3)
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    if not (v_u_2[p3] and v_u_2[p3]:IsDescendantOf(workspace)) then
        local v4 = v_u_2
        local v5 = v_u_1.Character
        if v5 then
            v5 = v_u_1.Character:FindFirstChild(p3, true)
        end
        v4[p3] = v5
    end
    return v_u_2[p3]
end
function CheckFiringThroughtWalls(p6)
    -- upvalues: (copy) v_u_1
    local v7 = GetAttachment("RightShoulderAttachment")
    local v8 = p6 or GetAttachment("RightGripAttachment")
    if v7 and v8 then
        local v9 = RaycastParams.new()
        v9.FilterDescendantsInstances = { v_u_1.Character }
        v9.FilterType = Enum.RaycastFilterType.Exclude
        local v10 = workspace:Raycast(v7.WorldPosition, v8.WorldPosition - v7.WorldPosition, v9)
        if v10 then
            v10 = v10.Position
        end
        return v10
    end
end
return CheckFiringThroughtWalls

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.ExplosionReplicator.AnimateExplosion
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = workspace.Terrain
local v_u_4 = game:GetService("SoundService"):WaitForChild("Sound"):WaitForChild("ExplosionSound")
local v_u_5 = script.ExplosionHaptic
function AnimateExplosion(p6)
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2, (copy) v_u_5, (copy) v_u_1
    local v7 = Instance.new("Attachment", v_u_3)
    v7.WorldPosition = p6
    local v8 = Instance.new("Explosion", v7)
    v8.DestroyJointRadiusPercent = 0
    v8.Position = p6
    v8.BlastPressure = 50000
    local v9 = v_u_4:Clone()
    v9.Parent = v7
    v9:Play()
    local v10 = v_u_2:DistanceFromCharacter(p6)
    if v10 <= 20 and v10 > 0 then
        pcall(v_u_5.Play, v_u_5)
    end
    v_u_1:AddItem(v7, 3)
end
return AnimateExplosion

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.TowerOptimization.AddElevatorDoorButtonGui
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.FloorPart
local v_u_3 = script.ArrowModel
local v_u_4 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
local v_u_5 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.In)
function EndArrows(p_u_6)
    -- upvalues: (copy) v_u_1, (copy) v_u_4
    local v7 = nil
    for v8 = 1, 3 do
        v7 = v_u_1:Create(p_u_6[v8], v_u_4, {
            ["Size"] = Vector3.new(0, 0, 0)
        })
        v7:Play()
        task.wait(0.15)
    end
    v7.Completed:Once(function()
        -- upvalues: (copy) p_u_6
        p_u_6:Destroy()
    end)
end
function TweenArrows(p9, p10, p11, p12, p13)
    -- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_5
    local v14 = v_u_3:Clone()
    v14:PivotTo(p9 * CFrame.new(1.4, 0, -0.1) * CFrame.Angles(0, -1.5707963267948966, p10 * 3.141592653589793 / 2))
    v14.Parent = p13
    local v15 = {}
    for v16 = 1, 3 do
        v15[v16] = {
            ["Arrow"] = v14[v16],
            ["Tween"] = nil
        }
    end
    while true do
        if not p11() then
            table.clear(v15[1])
            table.clear(v15[2])
            table.clear(v15[3])
            table.clear(v15)
            return
        end
        for v17 = 1, 3 do
            if not p11() then
                break
            end
            if p12() == 1 then
                local v18 = v15[v17].Arrow
                v18.Color = Color3.new(0.2, 0.2, 1)
                v18.Transparency = 0
                v15[v17].Tween = v_u_1:Create(v18, v_u_5, {
                    ["Color"] = Color3.new(0.2, 0.2, 0.2),
                    ["Transparency"] = 0.5
                })
                v15[v17].Tween:Play()
                task.wait(0.15)
            end
        end
        task.wait(0.5)
    end
end
function AddElevatorButtonGui(p19, p_u_20, p_u_21, p_u_22, p_u_23)
    -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
    if p_u_23:FindFirstChild("FloorPart") then
        return
    else
        local v_u_24 = p_u_21:FindFirstChild("LevelInfo")
        if v_u_24 then
            v_u_24 = p_u_21.LevelInfo:FindFirstChild("Level", true)
        end
        if v_u_24 then
            local v25 = p19.CFrame
            local v_u_26 = v_u_2:Clone()
            v_u_26.Parent = p_u_23
            v_u_26.CFrame = v25 * CFrame.new(0, v_u_26.Size.Y / 2 + p19.Size.Y / 2 + 0.25, 0)
            local v_u_27 = v_u_26.SurfaceGui.TextLabel
            local v_u_29 = v_u_24:GetPropertyChangedSignal("Text"):Connect(function()
                -- upvalues: (copy) v_u_24, (copy) v_u_27, (copy) p_u_20
                local v28 = v_u_24.Text
                v_u_27.Text = v28
                if p_u_20 == v28 then
                    v_u_27.TextColor3 = Color3.new(0, 1)
                end
            end)
            local v30 = v_u_24.Text
            v_u_27.Text = v30
            if p_u_20 == v30 then
                v_u_27.TextColor3 = Color3.new(0, 1)
            end
            local v_u_31 = true
            local v_u_32 = nil
            local v_u_33 = nil
            local function v_u_36()
                -- upvalues: (ref) v_u_31, (ref) v_u_33, (copy) v_u_29, (ref) v_u_32, (copy) v_u_26, (copy) p_u_23, (ref) v_u_1, (ref) v_u_4
                v_u_31 = false
                v_u_33:Disconnect()
                v_u_29:Disconnect()
                v_u_32:Disconnect()
                if v_u_26:IsDescendantOf(workspace) then
                    local v34 = v_u_26.ArrowModel
                    v34.Parent = p_u_23
                    task.spawn(EndArrows, v34)
                    local v35 = v_u_1:Create(v_u_26, v_u_4, {
                        ["Size"] = Vector3.new(0, 0, 0)
                    })
                    v35:Play()
                    v35.Completed:Once(function()
                        -- upvalues: (ref) v_u_26
                        v_u_26:Destroy()
                    end)
                end
            end
            v_u_32 = p_u_21.AncestryChanged:Once(v_u_36)
            v_u_33 = p_u_21:GetAttributeChangedSignal("ElevatorState"):Connect(function()
                -- upvalues: (ref) p_u_22, (copy) p_u_21, (copy) v_u_36
                p_u_22 = p_u_21:GetAttribute("ElevatorState")
                if p_u_22 == 0 then
                    v_u_36()
                end
            end)
            local v37 = TweenArrows
            local v38 = p_u_20 - v_u_24.Text
            v37(v25, math.sign(v38), function()
                -- upvalues: (ref) v_u_31
                return v_u_31
            end, function()
                -- upvalues: (ref) p_u_22
                return p_u_22
            end, v_u_26)
        end
    end
end
return AddElevatorButtonGui

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.RbxCharacterSounds.AtomicBinding
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.TouchThumbstick
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.ClickToMoveController
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.VRNavigation
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.PathDisplay
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.TouchJump
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.Gamepad
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.BaseCharacterController
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.Keyboard
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.VehicleController
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.ClickToMoveDisplay
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.DynamicThumbstick
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.ZoomController
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.TransparencyController
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.LegacyCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.OrbitalCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraUtils
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.ClassicCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.BaseOcclusion
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.Invisicam
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraToggleStateController
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRVehicleCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRBaseCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.BaseCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraInput
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera.VehicleCameraCore
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera.VehicleCameraConfig
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraUI
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.Poppercam
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.MouseLockController
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.ConnectionUtil.spec
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.CameraWrapper.spec
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.FlagUtil
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.CameraWrapper
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.ConnectionUtil
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CommonUtils.CharacterUtil
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterGui.MainGui.MainGuiScript.ToggleFrameModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("CollectionService")
local v2 = game:GetService("SoundService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = workspace.Camera
local v_u_5 = require(script.TweenSizeOnFrame)
local v_u_6 = script.Parent.Parent
local v_u_7 = v_u_6.BuyDevProductFrame
local v8 = v_u_6.BackpackFrame
local v9 = v_u_6.CloneFrame
local v10 = v_u_6.CustomisationFrame
local v11 = v2:WaitForChild("Sound")
local v_u_12 = v11:WaitForChild("WhooshSoundSpin")
local v_u_13 = v11:WaitForChild("WhooshSoundBis")
local v_u_14 = v11:WaitForChild("ClickSound")
local v_u_15 = v_u_6.LowerFrameContainer.ToolFrame.BackpackFunction
local v_u_16 = v9.CloseCloneFrameF
local v_u_17 = v10.ToggleCustomizationF
local v_u_18 = {}
function OnFrameAdded(p19, p20)
    -- upvalues: (copy) v_u_18, (copy) v_u_6
    if p20 then
        local v21 = table.find(v_u_18, p19)
        if v21 then
            table.remove(v_u_18, v21)
            return
        end
    else
        if not p19:IsDescendantOf(v_u_6) then
            return
        end
        local v22 = v_u_18
        table.insert(v22, p19)
    end
end
for _, v23 in pairs(v1:GetTagged("TogglableFrame")) do
    OnFrameAdded(v23)
end
v1:GetInstanceAddedSignal("TogglableFrame"):Connect(OnFrameAdded)
v1:GetInstanceRemovedSignal("TogglableFrame"):Connect(function(p24)
    OnFrameAdded(p24, true)
end)
local v_u_25 = false
local v_u_26 = {}
local v_u_27 = TweenInfo.new(1, Enum.EasingStyle.Linear)
local v_u_28 = v_u_7.CanvasGroup.BuyCashFrame.BestDeal.UIStroke
local v_u_29 = 0
function TweenBDeal()
    -- upvalues: (ref) v_u_29, (copy) v_u_28, (copy) v_u_3, (copy) v_u_27
    v_u_29 = v_u_29 + 1
    local v30 = v_u_29
    v_u_28.Color = Color3.new(1)
    while v30 == v_u_29 do
        for _, v31 in pairs({
            Color3.new(1, 1),
            Color3.new(0, 1),
            Color3.new(0, 1, 1),
            Color3.new(0, 0, 1),
            Color3.new(1, 0, 1),
            Color3.new(1)
        }) do
            local v32 = v_u_3:Create(v_u_28, v_u_27, {
                ["Color"] = v31
            })
            v32:Play()
            v32.Completed:Wait()
        end
    end
end
v_u_26.OpenFunctions = {
    [v8] = function()
        -- upvalues: (copy) v_u_15
        v_u_15:Invoke()
    end,
    [v9] = function()
        -- upvalues: (copy) v_u_16
        v_u_16:Invoke()
    end,
    [v_u_7] = function()
        -- upvalues: (copy) v_u_7, (ref) v_u_25, (copy) v_u_3, (copy) v_u_13
        v_u_7.Position = UDim2.new(1.3, 0, 0.5, -25)
        v_u_7.Size = UDim2.new(0, 0, 0.2, 0)
        v_u_7.Visible = true
        v_u_25 = true
        TweenBlur(true)
        local v33 = v_u_3:Create(v_u_7, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["Size"] = UDim2.new(0, 0, 0.45, 80),
            ["Position"] = UDim2.new(0.5, 0, 0.5, -25)
        })
        v33:Play()
        task.defer(TweenBDeal)
        v_u_13:Play()
        v33.Completed:Once(function()
            -- upvalues: (ref) v_u_25
            v_u_25 = false
        end)
    end,
    [v10] = function()
        -- upvalues: (copy) v_u_17
        v_u_17:Invoke()
    end
}
v_u_26.CloseFunctions = {
    [v10] = function()
        -- upvalues: (copy) v_u_17
        v_u_17:Invoke()
    end,
    [v8] = function()
        -- upvalues: (copy) v_u_15
        v_u_15:Invoke()
    end,
    [v9] = function()
        -- upvalues: (copy) v_u_16
        v_u_16:Invoke()
    end,
    [v_u_7] = function(p34)
        -- upvalues: (ref) v_u_25, (copy) v_u_3, (copy) v_u_7, (copy) v_u_12
        TweenBlur(false)
        if p34 then
            if not v_u_25 then
                v_u_25 = true
                local v35 = v_u_3:Create(v_u_7, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ["Size"] = UDim2.new(0, 0, 0.25, 0),
                    ["Position"] = UDim2.fromScale(1.3, 1.4)
                })
                v35:Play()
                v_u_12:Play()
                v35.Completed:Once(function()
                    -- upvalues: (ref) v_u_7, (ref) v_u_25
                    v_u_7.Visible = false
                    v_u_25 = false
                end)
            end
        else
            v_u_7.Visible = false
            return
        end
    end
}
function GetFrameForName(p36)
    -- upvalues: (copy) v_u_18
    for _, v37 in pairs(v_u_18) do
        if v37.Name == p36 then
            return v37
        end
    end
end
function v_u_26.ToggleFrame(p38, p39, p40, p41)
    -- upvalues: (copy) v_u_14, (copy) v_u_26, (copy) v_u_5
    local v42 = typeof(p38) ~= "string" or GetFrameForName(p38)
    if v42 then
        if not p40 then
            v_u_14:Play()
        end
        if p39 == nil then
            p39 = not v42.Visible
        end
        local v43 = (p39 and "Open" or "Close") .. "Functions"
        local v44 = v42:FindFirstChild("OpenArgument")
        if v44 then
            if p39 and p41 then
                v44.Value = p41 or nil
            else
                v44:ResetPropertyToDefault("Value")
            end
        end
        if p39 then
            v_u_26.CloseOpenedFrame()
        end
        if v_u_26[v43][v42] then
            v_u_26[v43][v42](true)
            return
        elseif v42:FindFirstChild("UIScale") then
            v_u_5(v42, p39)
        else
            v42.Visible = p39
        end
    else
        warn("TOGGLE FRAME: No frame for the given name", v42)
        return
    end
end
function v_u_26.CloseOpenedFrame()
    -- upvalues: (copy) v_u_26
    local v45 = v_u_26.GetOpenedFrame()
    if v45 then
        v_u_26.ToggleFrame(v45, false)
    end
end
function v_u_26.GetOpenedFrame()
    -- upvalues: (copy) v_u_18
    for _, v46 in pairs(v_u_18) do
        if v46.Visible then
            return v46
        end
    end
    return false
end
local v_u_47 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v_u_48 = nil
local v_u_49 = nil
local v_u_50 = nil
function TweenBlur(p51)
    -- upvalues: (ref) v_u_49, (ref) v_u_50, (ref) v_u_48, (copy) v_u_3, (copy) v_u_47, (copy) v_u_4
    if not v_u_49 then
        v_u_49 = Instance.new("BlurEffect", game:GetService("Lighting"))
        v_u_49.Size = 0
    end
    if v_u_50 and v_u_50.PlaybackState ~= Enum.PlaybackState.Completed then
        v_u_50:Cancel()
    end
    if v_u_48 and v_u_48.PlaybackState ~= Enum.PlaybackState.Completed then
        v_u_48:Cancel()
    end
    v_u_50 = v_u_3:Create(v_u_49, v_u_47, {
        ["Size"] = p51 and 10 or 0
    })
    v_u_50:Play()
    v_u_48 = v_u_3:Create(v_u_4, v_u_47, {
        ["FieldOfView"] = p51 and 63 or 70
    })
    v_u_48:Play()
end
return v_u_26

--========================================
-- ModuleScript : StarterGui.MainGui.MainGuiScript.ToggleFrameModule.TweenSizeOnFrame
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = {}
local v_u_3 = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local v_u_4 = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In)
function TweenGuiSize(p_u_5, p6)
    -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
    local v7 = p_u_5.UIScale
    local v8 = v_u_2[p_u_5]
    if v8 then
        v8:Cancel()
    end
    local v9
    if p6 then
        if not p_u_5.Visible then
            p_u_5.Visible = true
            v7.Scale = 0.05
        end
        v9 = v_u_1:Create(v7, v_u_3, {
            ["Scale"] = 1
        })
    else
        local v_u_10 = v_u_1:Create(v7, v_u_4, {
            ["Scale"] = 0.05
        })
        v_u_10.Completed:Once(function()
            -- upvalues: (ref) v_u_10, (ref) v_u_2, (copy) p_u_5
            if v_u_10 == v_u_2[p_u_5] then
                p_u_5.Visible = false
            end
        end)
        v9 = v_u_10
    end
    v9:Play()
    v_u_2[p_u_5] = v9
end
return TweenGuiSize

--========================================
-- ModuleScript : StarterGui.MainGui.MainGuiScript.AnimateChange
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v3 = game.Players.LocalPlayer
local v_u_4 = v3.PlayerGui.MainGui
local v_u_5 = v3:WaitForChild("Settings"):WaitForChild("CoinsAdded")
local v_u_6 = require(v1.AllModules.ConvertVal)
local v_u_7 = TweenInfo.new(0.75, Enum.EasingStyle.Linear)
local v_u_8 = Instance.new("TextLabel")
v_u_8.BackgroundTransparency = 1
local v_u_9 = Color3.new(0, 1, 0)
local v_u_10 = Color3.new(1, 0, 0)
function AnimateChangeOn(p_u_11, p_u_12, p_u_13, p_u_14, p_u_15)
    -- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_10, (copy) v_u_2, (copy) v_u_7
    local v_u_16 = p_u_11.Value
    p_u_12.Text = v_u_16
    local v_u_17 = v_u_8:Clone()
    v_u_17.TextScaled = true
    v_u_17.TextColor3 = v_u_9
    v_u_17.Font = Enum.Font.Highway
    v_u_17.TextStrokeTransparency = 0
    local v_u_18 = p_u_12.TextXAlignment
    if v_u_18 == Enum.TextXAlignment.Center then
        v_u_17.AnchorPoint = Vector2.new(0.5, 0.5)
    elseif v_u_18 == Enum.TextXAlignment.Right then
        v_u_17.AnchorPoint = Vector2.new(1, 0.5)
    else
        v_u_17.AnchorPoint = Vector2.new(0, 0.5)
    end
    v_u_17.TextXAlignment = v_u_18
    p_u_11:GetPropertyChangedSignal("Value"):Connect(function()
        -- upvalues: (copy) p_u_12, (ref) v_u_6, (copy) p_u_11, (ref) v_u_5, (ref) v_u_16, (copy) v_u_17, (ref) v_u_4, (copy) p_u_13, (ref) v_u_10, (copy) p_u_15, (copy) v_u_18, (copy) p_u_14, (ref) v_u_2, (ref) v_u_7
        p_u_12.Text = v_u_6.SimpleConversion(p_u_11.Value)
        if v_u_5.Value then
            local v19 = v_u_17:Clone()
            v19.Parent = v_u_4
            v19.Size = UDim2.fromOffset(2 * p_u_12.AbsoluteSize.X, p_u_13 * p_u_12.AbsoluteSize.Y)
            if p_u_11.Value < v_u_16 then
                v19.Text = v_u_6.SimpleConversion(p_u_11.Value - v_u_16)
                v19.TextColor3 = v_u_10
            else
                v19.Text = "+" .. v_u_6.SimpleConversion(p_u_11.Value - v_u_16)
                if p_u_15 then
                    p_u_15:Play()
                end
            end
            v_u_16 = p_u_11.Value
            local v20 = p_u_12.AbsolutePosition.X
            if v_u_18 == Enum.TextXAlignment.Center then
                v20 = v20 + p_u_12.AbsoluteSize.X / 2
            elseif v_u_18 == Enum.TextXAlignment.Right then
                v20 = v20 + p_u_12.AbsoluteSize.X
            end
            v19.Position = UDim2.fromOffset(v20, p_u_12.AbsolutePosition.Y)
            v19:TweenPosition(UDim2.new(0, v20, p_u_14, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 2.25)
            task.wait(1.5)
            local v21 = v_u_2:Create(v19, v_u_7, {
                ["TextTransparency"] = 1,
                ["TextStrokeTransparency"] = 1
            })
            v21:Play()
            v21.Completed:Wait()
            v19:Destroy()
        else
            v_u_16 = p_u_11.Value
        end
    end)
    p_u_12.Text = v_u_6.SimpleConversion(p_u_11.Value)
end
return AnimateChangeOn

--========================================
-- ModuleScript : StarterGui.MainGui.MainGuiScript.CashButtonModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("GuiService")
local v4 = game.Players.LocalPlayer
local v_u_5 = v4:WaitForChild("leaderstats"):WaitForChild("Cash")
local v_u_6 = v4:WaitForChild("Settings"):WaitForChild("CoinsAdded")
local v_u_7 = require(v1.AllModules.ConvertVal).SimpleConversion
local v_u_8 = script.Parent.Parent
local v_u_9 = v_u_8.CashImgButton
local v_u_10 = v_u_9.CashLabel
local v_u_11 = v_u_10.UIScale
local v_u_12 = v_u_9:WaitForChild("MoreCashFrame")
local v_u_13 = v_u_9:WaitForChild("FrameForChangingCash")
local v_u_14 = 0
local v_u_20 = {
    ["CashImageSize"] = 0,
    ["PlaceCash"] = function()
        -- upvalues: (copy) v_u_3, (ref) v_u_14, (copy) v_u_8, (copy) v_u_9, (copy) v_u_20
        local v15 = v_u_3.TopbarInset.Height
        v_u_14 = v_u_8.AbsoluteSize.Y
        local v16 = (v_u_14 - 320) * 0.4 / 760 + 0.6
        local v17 = math.min(1, v16)
        local v18 = math.max(0.6, v17)
        local v19 = v15 ~= 0 and v18 * v15 or v_u_14 * 0.05
        v_u_9.ImageRectOffset = Vector2.new(0, 70 - v19)
        v_u_9.Size = UDim2.new(0, 5.2 * v19, 0, v19)
        v_u_9.Position = UDim2.new(0.5, 0, 0, -v15)
        v_u_20.CashImageSize = v19
    end
}
v_u_3:GetPropertyChangedSignal("TopbarInset"):Connect(v_u_20.PlaceCash)
local v_u_21 = Color3.new(0.8, 0.8, 0.8)
local v_u_22 = Color3.new(1, 1, 1)
v_u_9.MouseEnter:Connect(function()
    -- upvalues: (copy) v_u_12, (copy) v_u_21, (copy) v_u_9, (copy) v_u_10
    v_u_12.BackgroundColor3 = v_u_21
    v_u_9.ImageColor3 = v_u_21
    v_u_10.TextColor3 = v_u_21
end)
v_u_9.MouseLeave:Connect(function()
    -- upvalues: (copy) v_u_12, (copy) v_u_22, (copy) v_u_9, (copy) v_u_10
    v_u_12.BackgroundColor3 = v_u_22
    v_u_9.ImageColor3 = v_u_22
    v_u_10.TextColor3 = v_u_22
end)
local v_u_23 = nil
local v_u_24 = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local v_u_25 = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
local v_u_26 = 0
local v_u_27 = Instance.new("TextLabel", script)
v_u_27.FontFace = Font.new("rbxasset://fonts/families/HighwayGothic.json", Enum.FontWeight.Bold)
v_u_27.AnchorPoint = Vector2.new(1, 0)
v_u_27.TextColor3 = Color3.new(0, 1)
v_u_27.BackgroundTransparency = 1
v_u_27.TextStrokeTransparency = 0
v_u_27.FontFace.Bold = true
v_u_27.TextScaled = true
local v_u_28 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v_u_29 = nil
local v_u_30 = {}
local v_u_31 = {}
function RemoveCashLabel(p_u_32)
    -- upvalues: (copy) v_u_30, (copy) v_u_31, (copy) v_u_2, (copy) v_u_25
    local v33 = v_u_30[p_u_32]
    if v33 then
        v33:Cancel()
        v_u_30[p_u_32] = nil
        local v34 = table.find(v_u_31, p_u_32)
        if v34 then
            table.remove(v_u_31, v34)
        end
        local v35 = v_u_2:Create(p_u_32, v_u_25, {
            ["Size"] = UDim2.new(0, 0)
        })
        v35:Play()
        v35.Completed:Once(function()
            -- upvalues: (copy) p_u_32
            p_u_32:Destroy()
        end)
    end
end
function PrintCashVal()
    -- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_7, (ref) v_u_23, (copy) v_u_6, (ref) v_u_26, (copy) v_u_27, (copy) v_u_13, (copy) v_u_2, (copy) v_u_24, (copy) v_u_20, (ref) v_u_29, (copy) v_u_11, (copy) v_u_28, (copy) v_u_30, (copy) v_u_31
    local v36 = v_u_5.Value
    v_u_10.Text = "$" .. v_u_7(v36)
    if v_u_23 and v_u_6.Value then
        v_u_26 = v_u_26 + 1
        local v37 = v_u_27:Clone()
        v37.Parent = v_u_13
        v37.LayoutOrder = v_u_26
        local v38 = v36 - v_u_23
        local v39 = "$" .. v_u_7((math.abs(v38)))
        local v40
        if v_u_23 < v36 then
            v40 = "+" .. v39
        else
            v37.TextColor3 = Color3.new(1)
            v40 = "-" .. v39
        end
        v37.Text = v40
        v_u_23 = v36
        local v41 = v_u_2:Create(v37, v_u_24, {
            ["Size"] = UDim2.new(1, 0, 0, 0.6 * v_u_20.CashImageSize)
        })
        v41:Play()
        if v_u_29 and v_u_29.PlaybackState == Enum.PlaybackState.Playing then
            v_u_29:Cancel()
        end
        v_u_11.Scale = 1.3
        v_u_29 = v_u_2:Create(v_u_11, v_u_28, {
            ["Scale"] = 1
        })
        v_u_29:Play()
        v_u_30[v37] = v41
        local v42 = v_u_31
        table.insert(v42, v37)
        if #v_u_31 > 4 then
            RemoveCashLabel(v_u_31[1])
        end
        task.wait(2)
        RemoveCashLabel(v37)
    else
        v_u_23 = v36
    end
end
PrintCashVal()
v_u_5:GetPropertyChangedSignal("Value"):Connect(PrintCashVal)
return v_u_20

--========================================
-- ModuleScript : StarterGui.MainGui.MainGuiScript.GetJumpButton
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local v_u_2 = nil
function GetJumpButton(p3)
    -- upvalues: (ref) v_u_2, (copy) v_u_1
    if v_u_2 then
        return v_u_2
    end
    local v4 = v_u_1:WaitForChild("TouchGui", p3 or 1e-9)
    if v4 then
        v_u_2 = v4:WaitForChild("TouchControlFrame"):WaitForChild("JumpButton")
    end
    return v_u_2
end
return GetJumpButton

--========================================
-- ModuleScript : StarterGui.MainGui.MainGuiScript.ImprovedUIDragger
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("Players").LocalPlayer:GetMouse()
local v_u_3 = game:GetService("GuiService")
local v_u_4 = {}
v_u_4.__index = v_u_4
function MakeNewUIDragger(p_u_5, p_u_6, p_u_7, p8, p_u_9)
    -- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
    local v10 = v_u_4
    local v_u_11 = setmetatable({}, v10)
    v_u_11.MoveFunction = p_u_7
    v_u_11.EndFunction = p8
    v_u_11.OtherArgument = p_u_9
    v_u_11.Start_C = p_u_5.InputBegan:Connect(function(p_u_12)
        -- upvalues: (copy) v_u_11, (ref) v_u_3, (copy) p_u_5, (copy) p_u_6, (ref) v_u_1, (copy) p_u_7, (copy) p_u_9, (ref) v_u_2
        if v_u_11.MouseDown then
            return
        elseif v_u_3.SelectedObject and v_u_3.SelectedObject ~= p_u_5 then
            return
        elseif not p_u_6 or p_u_6((Vector2.new(p_u_12.Position.X, p_u_12.Position.Y))) then
            if p_u_12.UserInputType == Enum.UserInputType.Touch then
                if p_u_12.Delta.Magnitude > 0 then
                    return
                end
                v_u_11.MouseDown = true
                v_u_11.InputChanged_C = v_u_1.InputChanged:Connect(function(p13)
                    -- upvalues: (copy) p_u_12, (ref) p_u_7, (ref) p_u_9
                    if p13 == p_u_12 then
                        p_u_7(Vector2.new(p13.Position.X, p13.Position.Y), p_u_9)
                    end
                end)
            else
                if p_u_12.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    return
                end
                v_u_11.MouseDown = true
                v_u_11.InputChanged_C = v_u_2.Move:Once(function()
                    -- upvalues: (ref) v_u_11, (ref) v_u_2, (ref) p_u_7, (ref) p_u_9
                    while v_u_11.MouseDown do
                        p_u_7(Vector2.new(v_u_2.X, v_u_2.Y), p_u_9)
                        task.wait()
                    end
                end)
            end
            v_u_11.EndConnection = v_u_1.InputEnded:Connect(function(p14)
                -- upvalues: (copy) p_u_12, (ref) v_u_11
                if p14.KeyCode == Enum.KeyCode.ButtonA or (p14.UserInputType == Enum.UserInputType.MouseButton1 or p14.UserInputType == Enum.UserInputType.Touch and p14 == p_u_12) then
                    v_u_11:Stop(p14)
                end
            end)
        end
    end)
    return v_u_11
end
function v_u_4.DisconnectAndClear(p15)
    p15.Start_C:Disconnect()
    p15:Stop()
    table.clear(p15)
end
function v_u_4.Stop(p16, p17)
    if p16.MouseDown then
        p16.MouseDown = false
        if p16.InputChanged_C and p16.InputChanged_C.Connected then
            p16.InputChanged_C:Disconnect()
        end
        if p16.EndConnection and p16.EndConnection.Connected then
            p16.EndConnection:Disconnect()
        end
        if p17 then
            p17 = Vector2.new(p17.Position.X, p17.Position.Y)
        end
        p16.EndFunction(p17, p16.OtherArgument)
    end
end
return MakeNewUIDragger

--========================================
-- ModuleScript : StarterGui.MainGui.StatsFrame.FrameForPages.PrintProgression
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage").AllModules
local v_u_2 = require(v1.ImageFromName)
local v_u_3 = require(v1.ConvertVal)
function PrintProgression(p4, p5, p6, p7, p8, p9)
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    local v10 = not p9
    local v11
    if v10 then
        v11 = 1
    else
        local v12 = p5 / p6
        v11 = math.max(0, v12)
    end
    if p7 then
        p5 = v_u_3.RoundedTimeConversion(p5)
        if not v10 then
            p6 = v_u_3.RoundedTimeConversion(p6)
        end
    end
    p4.BarFrame.ProgressionLabel.Text = p5 .. (v10 and "" or "/" .. p6)
    p4.CheckImage.Visible = v10
    if p8 then
        p8.Visible = not v10
    end
    if p8 and not v10 then
        if typeof(p9) == "number" then
            p8.Text = "Reward:\n+$" .. v_u_3.SimpleConversion(p9)
            p8.TextYAlignment = Enum.TextYAlignment.Center
            p8.RewardSection.Visible = false
        else
            local v13 = p9:split("_")
            p8.Text = "Reward:"
            p8.TextYAlignment = Enum.TextYAlignment.Top
            p8.RewardSection.Visible = true
            local v14 = v_u_2[v13[1]]
            p8.RewardSection.RewardImg.Image = v14.Image
            p8.RewardSection.AmountLabel.Text = "\195\151" .. v13[2]
            if v14.AspectRatio then
                p8.RewardSection.RewardImg.UIAspectRatioConstraint.AspectRatio = v14.AspectRatio
            end
            p8.RewardSection.RewardImg.UIScale.Scale = v14.SizeFactor or 1
        end
    end
    local v15 = p4.BarFrame.UIGradient
    if v11 <= 0 then
        v15.Color = ColorSequence.new(Color3.new())
        return
    elseif v11 + 0.001 >= 1 then
        v15.Color = ColorSequence.new(Color3.new(0, 1))
    else
        v15.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(0, 1)),
            ColorSequenceKeypoint.new(v11, Color3.new(0, 1)),
            ColorSequenceKeypoint.new(v11 + 0.001, Color3.new(0, 0)),
            ColorSequenceKeypoint.new(1, Color3.new(0, 0))
        })
    end
end
return PrintProgression

--========================================
-- ModuleScript : StarterGui.MainGui.SettingsFrame.SettingsScript.SettingsModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v2 = {}
local v3 = {
    ["Name"] = "Lag",
    ["AvialableSettings"] = {
        {
            ["ValueName"] = "Shadows"
        },
        {
            ["ValueName"] = "Droppers"
        }
    }
}
local v4 = {
    ["Name"] = "Audio",
    ["AvialableSettings"] = {
        {
            ["ValueName"] = "Music"
        },
        {
            ["ValueName"] = "TycoonSounds",
            ["DisplayName"] = "Tycoon sounds"
        },
        {
            ["ValueName"] = "NotificationsSounds",
            ["DisplayName"] = "Notification sounds"
        }
    }
}
local v5 = {
    ["Name"] = "Visual",
    ["AvialableSettings"] = {
        {
            ["ValueName"] = "NotificationsVisual",
            ["DisplayName"] = "Notifications"
        },
        {
            ["ValueName"] = "AnimatedButtons",
            ["DisplayName"] = "Animated building"
        },
        {
            ["ValueName"] = "CoinsAdded",
            ["DisplayName"] = "Currency change animation"
        }
    }
}
__set_list(v2, 1, {v3, v4, v5})
v1.SettingSection = v2
v1.SettingDescription = {
    ["Shadows"] = {
        { "ON", "OFF" },
        { Color3.fromRGB(0, 255, 0), Color3.new(255, 0, 0) },
        { true, false }
    },
    ["Droppers"] = {
        { "ON", "Yours\nonly", "OFF" },
        { Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 0), Color3.new(255, 0, 0) },
        { "ON", "ON_Limited", "OFF" }
    },
    ["NotificationsVisual"] = {
        { "ALL", "Yours\nonly", "OFF" },
        { Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 0), Color3.new(255, 0, 0) },
        { "ON", "ON_1", "OFF" }
    },
    ["NotificationsSounds"] = {
        { "ON", "Yours\nonly", "OFF" },
        { Color3.fromRGB(0, 255, 0), Color3.fromRGB(255, 255, 0), Color3.new(255, 0, 0) },
        { "ON", "ON_1", "OFF" }
    },
    ["CoinsAdded"] = {
        { "ON", "OFF" },
        { Color3.fromRGB(0, 255, 0), Color3.new(255, 0, 0) },
        { true, false }
    },
    ["AnimatedButtons"] = {
        { "ON", "OFF" },
        { Color3.fromRGB(0, 255, 0), Color3.new(255, 0, 0) },
        { true, false }
    },
    ["Music"] = {
        { "ON", "OFF" },
        { Color3.fromRGB(0, 255, 0), Color3.new(255, 0, 0) },
        { true, false }
    },
    ["TycoonSounds"] = {
        { "ON", "OFF" },
        { Color3.fromRGB(0, 255, 0), Color3.new(255, 0, 0) },
        { true, false }
    }
}
return v1

--========================================
-- ModuleScript : StarterGui.MainGui.CustomisationFrame.CustomizationScript.SelectColorModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent.Parent.FrameForColors
local v_u_3 = v_u_2.ScrlF
local v4 = v_u_3.ColorButton
local v5 = v_u_2.ValidBttn
local v6 = v_u_2.UnselectBttn
local v_u_7 = v_u_2.Title
local v_u_8 = v_u_3.UIGridLayout
local v_u_9 = require(script.Parent.CustomisationApplier)
local v_u_10 = game:GetService("SoundService").Sound.ClickSound
local v_u_11 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local v_u_12 = {}
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = nil
for v16 = 0, 127 do
    local v_u_17 = v4:Clone()
    local v18 = BrickColor.palette(v16)
    v_u_17.BackgroundColor = v18
    local v19, _, v20 = v18.Color:ToHSV()
    v_u_17.LayoutOrder = (v19 * 360 + v20) * 255
    v_u_17.Parent = v_u_3
    v_u_17.Name = v18.Name
    v_u_12[v18.Name] = v_u_17
    v_u_17.Activated:Connect(function()
        -- upvalues: (copy) v_u_10, (copy) v_u_17
        v_u_10:Play()
        ChangeSelectedButton(v_u_17, true)
    end)
end
v4:Destroy()
local v_u_21 = {}
local v_u_22 = nil
function ChangeSelectedButton(p23, p24)
    -- upvalues: (ref) v_u_22, (ref) v_u_15, (copy) v_u_9, (ref) v_u_13, (copy) v_u_1, (copy) v_u_3, (copy) v_u_11
    if v_u_22 then
        v_u_22.UIStroke.Thickness = 2
        v_u_22.UIStroke.Color = Color3.new()
    end
    if p23 then
        p23.UIStroke.Thickness = 5
        p23.UIStroke.Color = Color3.new(0.4, 0.6, 1)
        if p24 then
            if v_u_15 then
                v_u_9.ChangeACustomElement(p23.BackgroundColor3, "Colors", v_u_15)
            end
            if v_u_13 then
                v_u_13.BackgroundColor = p23.BackgroundColor
            end
        else
            v_u_1:Create(v_u_3, v_u_11, {
                ["CanvasPosition"] = Vector2.new(0, p23.AbsolutePosition.Y + v_u_3.CanvasPosition.Y - v_u_3.AbsolutePosition.Y - 0.1 * v_u_3.AbsoluteSize.Y)
            }):Play()
        end
    end
    v_u_22 = p23
end
function v_u_21.ShowAndSelect(p25, p26)
    -- upvalues: (ref) v_u_14, (ref) v_u_13, (ref) v_u_15, (copy) v_u_2, (copy) v_u_7, (copy) v_u_3, (copy) v_u_8, (copy) v_u_12
    v_u_14 = p26.BackgroundColor3
    v_u_13 = p26
    v_u_15 = p25
    v_u_2.Visible = true
    v_u_7.Text = " " .. p25 .. " color "
    local v27 = v_u_3.AbsoluteSize.X - 18
    local v28 = v27 < 200 and 30 or (v27 < 250 and 35 or (v27 < 300 and 40 or (v27 < 350 and 45 or (v27 < 400 and 50 or 55))))
    v_u_8.CellSize = UDim2.fromOffset(v28, v28)
    local v29 = v_u_12[p26.BackgroundColor.Name]
    ChangeSelectedButton(v29)
end
function v_u_21.Close()
    -- upvalues: (ref) v_u_15, (ref) v_u_14, (ref) v_u_13, (copy) v_u_2
    v_u_15 = nil
    v_u_14 = nil
    v_u_13 = nil
    v_u_2.Visible = false
    ChangeSelectedButton()
end
v6.Activated:Connect(function()
    -- upvalues: (ref) v_u_13, (ref) v_u_14, (copy) v_u_9, (ref) v_u_15, (copy) v_u_21, (copy) v_u_10
    v_u_13.BackgroundColor3 = v_u_14
    v_u_9.ChangeACustomElement(v_u_14, "Colors", v_u_15)
    v_u_21.Close()
    v_u_10:Play()
    v_u_21.UnselectOnCustomizeGui()
end)
v5.Activated:Connect(function()
    -- upvalues: (copy) v_u_21, (copy) v_u_10
    v_u_21.Close()
    v_u_10:Play()
    v_u_21.UnselectOnCustomizeGui()
end)
return v_u_21

--========================================
-- ModuleScript : StarterGui.MainGui.CustomisationFrame.CustomizationScript.CustomisationApplier
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players").LocalPlayer
local v_u_3 = v1.RemoteFunction.ApplyCustomizationF
local v_u_4 = require(v1.AllModules.GetTowerForPlayer)(v2, true)
local v_u_5 = require(v1.AllModules.TycoonColors)
local v_u_6 = {}
local v_u_7 = {
    "Wall",
    "Wall base",
    "Window border",
    "Window",
    "Floor",
    "Path",
    "Loadout pad",
    "Lights"
}
v_u_6.OrderedPartName = v_u_7
local v_u_8 = {
    ["Colors"] = {},
    ["Materials"] = {}
}
function v_u_6.GetAppliedAppearanceAndResetCustomization(p9)
    -- upvalues: (ref) v_u_8, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
    table.clear(v_u_8.Materials)
    table.clear(v_u_8.Colors)
    table.clear(v_u_8)
    if p9 then
        local v10 = v_u_5.GetAppliedAppearance(v_u_4)
        v_u_8 = {
            ["Colors"] = table.clone(v10.Colors),
            ["Materials"] = table.clone(v10.Materials)
        }
    else
        v_u_8 = {
            ["Colors"] = table.clone(v_u_5.TycoonColors[v_u_4.Name]),
            ["Materials"] = table.clone(v_u_5.DefaultMaterial)
        }
    end
    v_u_6.ApplyAppearance(v_u_8)
    return v_u_8
end
function v_u_6.ChangeACustomElement(p11, p12, p13)
    -- upvalues: (copy) v_u_7, (ref) v_u_8, (copy) v_u_5, (copy) v_u_4
    local v14 = table.find(v_u_7, p13)
    v_u_8[p12][v14] = p11
    v_u_5.ColorModel(v_u_4.AllModels, v_u_4, v_u_8, true)
end
function v_u_6.ApplyAppearance(p15)
    -- upvalues: (copy) v_u_5, (copy) v_u_4, (ref) v_u_8
    v_u_5.ColorModel(v_u_4.AllModels, v_u_4, p15 or v_u_8, true)
end
function v_u_6.SendCustomisationToServer(p16)
    -- upvalues: (copy) v_u_3, (ref) v_u_8, (copy) v_u_5, (copy) v_u_4
    v_u_3:InvokeServer(p16 and v_u_8 or false)
    v_u_5.SetAppearanceToApplyToTycoon(v_u_4)
end
return v_u_6

--========================================
-- ModuleScript : StarterGui.MainGui.CustomisationFrame.CustomizationScript.SelectMaterialModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent.Parent.FrameForMaterials
local v_u_3 = v_u_2.ScrlF
local v4 = v_u_3.MaterialButton_TEMPLATE
local v5 = v_u_2.ValidBttn
local v6 = v_u_2.UnselectBttn
local v_u_7 = v_u_2.Title
local v_u_8 = require(game:GetService("ReplicatedStorage").AllModules.Customization.AvialableMaterials)
local v_u_9 = require(script.Parent.CustomisationApplier)
local v_u_10 = game:GetService("SoundService").Sound.ClickSound
local v_u_11 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local v_u_12 = {}
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = nil
for v_u_16, v17 in pairs(v_u_8) do
    local v_u_18 = v4:Clone()
    v_u_18.MaterialImage.Image = v17
    v_u_18.Parent = v_u_3
    v_u_18.Name = v_u_16
    v_u_18.MaterialNameLabel.Text = v_u_16 == "DiamondPlate" and "Diamond plate" or (v_u_16 == "WoodPlanks" and "Wood planks" or v_u_16)
    v_u_12[v_u_16] = v_u_18
    v_u_18.Activated:Connect(function()
        -- upvalues: (copy) v_u_10, (copy) v_u_18, (copy) v_u_16
        v_u_10:Play()
        ChangeSelectedButton(v_u_18, true, v_u_16)
    end)
end
v4:Destroy()
local v_u_19 = {}
local v_u_20 = nil
function ChangeSelectedButton(p21, p22, p23)
    -- upvalues: (ref) v_u_20, (ref) v_u_14, (copy) v_u_9, (ref) v_u_15, (copy) v_u_8, (copy) v_u_1, (copy) v_u_3, (copy) v_u_11
    if v_u_20 then
        v_u_20.UIStroke.Thickness = 2
        v_u_20.UIStroke.Color = Color3.new()
    end
    if p21 then
        p21.UIStroke.Thickness = 5
        p21.UIStroke.Color = Color3.new(0.4, 0.6, 1)
        if p22 then
            if v_u_14 then
                v_u_9.ChangeACustomElement(p23, "Materials", v_u_14)
            end
            if v_u_15 then
                v_u_15.Image = v_u_8[p23]
            end
        else
            v_u_1:Create(v_u_3, v_u_11, {
                ["CanvasPosition"] = Vector2.new(0, p21.AbsolutePosition.Y + v_u_3.CanvasPosition.Y - v_u_3.AbsolutePosition.Y - 0.1 * v_u_3.AbsoluteSize.Y)
            }):Play()
        end
    end
    v_u_20 = p21
end
function v_u_19.ShowAndSelect(p24, p25)
    -- upvalues: (ref) v_u_13, (ref) v_u_15, (ref) v_u_14, (copy) v_u_2, (copy) v_u_7, (copy) v_u_12
    v_u_13 = p25:GetAttribute("CurrentMaterialName")
    v_u_15 = p25
    v_u_14 = p24
    v_u_2.Visible = true
    v_u_7.Text = " " .. p24 .. " material "
    local v26 = v_u_12[v_u_13]
    ChangeSelectedButton(v26)
end
function v_u_19.Close()
    -- upvalues: (ref) v_u_14, (ref) v_u_13, (ref) v_u_15, (copy) v_u_2
    v_u_14 = nil
    v_u_13 = nil
    v_u_15 = nil
    v_u_2.Visible = false
    ChangeSelectedButton()
end
v6.Activated:Connect(function()
    -- upvalues: (ref) v_u_15, (copy) v_u_8, (ref) v_u_13, (copy) v_u_9, (ref) v_u_14, (copy) v_u_19, (copy) v_u_10
    v_u_15.Image = v_u_8[v_u_13]
    v_u_9.ChangeACustomElement(v_u_13, "Materials", v_u_14)
    v_u_19.Close()
    v_u_10:Play()
    v_u_19.UnselectOnCustomizeGui()
end)
v5.Activated:Connect(function()
    -- upvalues: (copy) v_u_19, (copy) v_u_10
    v_u_19.Close()
    v_u_10:Play()
    v_u_19.UnselectOnCustomizeGui()
end)
return v_u_19

--========================================
-- ModuleScript : StarterGui.MainGui.OwnedTickets.OwnedTicketGuiModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("Players").LocalPlayer:WaitForChild("Stats"):WaitForChild("Tickets")
local v_u_2 = script.Parent
local v3 = v_u_2.Parent
local v_u_4 = v_u_2.InteractButton
local v_u_5 = require(v3.MainGuiScript.ToggleFrameModule).ToggleFrame
local v_u_6 = v3.BuyDevProductFrame
local v_u_7 = {}
local v_u_8 = game:GetService("SoundService"):WaitForChild("Sound"):WaitForChild("ClickSound")
function PrintTicketVal(p9)
    -- upvalues: (copy) v_u_7
    v_u_7[p9].TicketNumLabel.Text = v_u_7[p9].TicketIntVal.Value
end
local v_u_10 = nil
for _, v11 in pairs({ "Dropper", "Button" }) do
    v_u_7[v11] = {
        ["TicketIntVal"] = v1:WaitForChild(v11 .. "Ticket"),
        ["TicketNumLabel"] = v_u_2[v11]
    }
end
v_u_4.Activated:Connect(function()
    -- upvalues: (ref) v_u_10, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5
    if v_u_10 then
        v_u_8:Play()
        v_u_5(v_u_10, nil, nil, v_u_10 == v_u_6.Name and "BuyTickets" or nil)
    end
end)
return {
    ["EnableGui"] = function(p12, p13, p14, p15, p16)
        -- upvalues: (copy) v_u_7, (copy) v_u_2, (ref) v_u_10, (copy) v_u_4, (copy) v_u_6
        for v_u_17, v18 in pairs(v_u_7) do
            if v18.TicketValChanged then
                v18.TicketValChanged:Disconnect()
            end
            v18.TicketValChanged = v18.TicketIntVal.Changed:Connect(function()
                -- upvalues: (copy) v_u_17
                PrintTicketVal(v_u_17)
            end)
            PrintTicketVal(v_u_17)
        end
        if p13 then
            v_u_2.Size = p13
        end
        if p14 then
            v_u_2.Position = p14
        end
        if p15 then
            v_u_2.AnchorPoint = p15
        end
        v_u_10 = p16
        if v_u_10 then
            v_u_4.Visible = true
            if v_u_10 == v_u_6.Name then
                v_u_4.Label.Text = "Buy"
            else
                v_u_4.Label.Text = "Use"
            end
        else
            v_u_4.Visible = false
        end
        v_u_2.Parent = p12
        v_u_2.Visible = true
    end,
    ["DisableGui"] = function(p19)
        -- upvalues: (copy) v_u_2, (copy) v_u_7
        if p19 == v_u_2.Parent then
            for _, v20 in pairs(v_u_7) do
                if v20.TicketValChanged then
                    v20.TicketValChanged:Disconnect()
                end
            end
            v_u_2.Visible = false
        end
    end
}

--========================================
-- ModuleScript : StarterGui.MainGui.UseTicketFrame.UseTicketScript.ComfirmTicketUse
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = require(v_u_2:WaitForChild("Storage"))
local v_u_4 = require(script.Parent.Parent.Parent.MainGuiScript.ToggleFrameModule.TweenSizeOnFrame)
local v_u_5 = require(v1.AllModules.TicketsDescription)
local v_u_6 = require(v1.AllModules.GetTowerForPlayer)
local v_u_7 = script.Parent.Parent.ConfirmTicketUse
local v_u_8 = v_u_7.UIStroke
local v_u_9 = v_u_7.NumTicketToUseLabel
local v10 = v_u_7.UnselectBttn
local v_u_11 = v_u_7.TicketImage
local v_u_12 = v_u_7.FinalLabel
local v13 = v_u_7.ValidBttn
local _ = v_u_7.UIScale
local v14 = v_u_7.Minus
local v15 = v_u_7.Plus
local v_u_16 = v1.RemoteFunction.UseTicketF
local v_u_17 = v1.RemoteEvent.GuiEvent.GuiEventLocal
local v_u_18 = require(v1.AllModules.ImageFromName)
local v19 = game:GetService("SoundService"):WaitForChild("Sound")
local v_u_20 = v19:WaitForChild("ClickSound")
local v_u_21 = v19:WaitForChild("BuySound")
local v_u_22 = nil
local v_u_23 = nil
local v_u_24 = false
local v_u_25 = false
local v_u_26 = {}
function PrintSelectedTicketNumber()
    -- upvalues: (copy) v_u_9, (ref) v_u_22, (copy) v_u_12, (ref) v_u_23
    v_u_9.Text = v_u_22
    v_u_12.Text = v_u_23:lower() .. " ticket" .. (v_u_22 > 1 and "s?" or "?")
end
function v_u_26.ScaleGui(p27)
    -- upvalues: (copy) v_u_8, (copy) v_u_7
    v_u_8.Thickness = p27 * 0.015
    v_u_7.BorderSizePixel = p27 * 0.01
end
function v_u_26.CloseConfirmPrompt()
    -- upvalues: (copy) v_u_4, (copy) v_u_7
    v_u_4(v_u_7, false)
end
function v_u_26.PromptTicketUse(p28)
    -- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_17, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7, (ref) v_u_22, (ref) v_u_23, (copy) v_u_11, (copy) v_u_18, (ref) v_u_25
    local v29 = v_u_6(v_u_2)
    if v29 and not v29:GetAttribute("IsBuilding") then
        if v_u_3[p28 .. "Ticket"].Value < 1 then
            v_u_17:Fire("WrongMessage", "You don\'t have enough " .. p28:lower() .. " ticket")
        else
            v_u_4(v_u_7, true)
            v_u_22 = 1
            v_u_23 = p28
            v_u_11.Image = v_u_18[p28 .. "Ticket"].Image
            PrintSelectedTicketNumber()
            v_u_25 = true
        end
    else
        v_u_17:Fire("WrongMessage", "Wait for the tower to load")
        return
    end
end
v10.Activated:Connect(function()
    -- upvalues: (copy) v_u_20, (copy) v_u_26
    v_u_20:Play()
    v_u_26.CloseConfirmPrompt()
end)
v13.Activated:Connect(function()
    -- upvalues: (ref) v_u_25, (copy) v_u_20, (ref) v_u_24, (copy) v_u_16, (ref) v_u_23, (ref) v_u_22, (copy) v_u_21, (copy) v_u_26
    if v_u_25 then
        v_u_25 = false
        v_u_20:Play()
        if not v_u_24 then
            v_u_24 = true
            local v30 = v_u_16:InvokeServer(v_u_23, v_u_22)
            v_u_24 = false
            if v30 then
                v_u_21:Play()
            end
            v_u_26.CloseConfirmPrompt()
        end
    else
        return
    end
end)
v15.Activated:Connect(function()
    -- upvalues: (copy) v_u_20, (copy) v_u_5, (ref) v_u_23, (copy) v_u_3, (ref) v_u_22
    v_u_20:Play()
    local v31 = v_u_5[v_u_23].MaxTickets - (#v_u_3[v_u_23 .. "TicketInUse"].Value:split("_") - 1)
    local v32 = v_u_22 + 1
    local v33 = v_u_3[v_u_23 .. "Ticket"].Value
    v_u_22 = math.min(v32, v33, v31)
    PrintSelectedTicketNumber()
end)
v14.Activated:Connect(function()
    -- upvalues: (copy) v_u_20, (ref) v_u_22
    v_u_20:Play()
    local v34 = v_u_22 - 1
    v_u_22 = math.max(1, v34)
    PrintSelectedTicketNumber()
end)
return v_u_26

--========================================
-- ModuleScript : StarterGui.MainGui.SeasonFrame.SeasonScript.PositionAndSize
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    {
        ["Size"] = UDim2.fromScale(0.8, 0.8),
        ["Positions"] = { UDim2.fromScale(0.5, 0.5) }
    },
    {
        ["Size"] = UDim2.fromScale(0.8, 0.8),
        ["Positions"] = { UDim2.fromScale(0.28, 0.5), UDim2.fromScale(0.72, 0.5) }
    },
    {
        ["Size"] = UDim2.fromScale(0.65, 0.65),
        ["Positions"] = { UDim2.fromScale(0.175, 0.5), UDim2.fromScale(0.5, 0.5), UDim2.fromScale(0.825, 0.5) }
    },
    {
        ["Size"] = UDim2.fromScale(0.5, 0.5),
        ["Positions"] = {
            UDim2.fromScale(0.125, 0.5),
            UDim2.fromScale(0.375, 0.5),
            UDim2.fromScale(0.625, 0.5),
            UDim2.fromScale(0.875, 0.5)
        }
    },
    {
        ["Size"] = UDim2.fromScale(0.47, 0.47),
        ["Positions"] = {
            UDim2.fromScale(0.275, 0.2575),
            UDim2.fromScale(0.5, 0.2575),
            UDim2.fromScale(0.725, 0.2575),
            UDim2.fromScale(0.3875, 0.7425),
            UDim2.fromScale(0.6125, 0.7425)
        }
    },
    {
        ["Size"] = UDim2.fromScale(0.47, 0.47),
        ["Positions"] = {
            UDim2.fromScale(0.275, 0.2575),
            UDim2.fromScale(0.5, 0.2575),
            UDim2.fromScale(0.725, 0.2575),
            UDim2.fromScale(0.275, 0.7425),
            UDim2.fromScale(0.5, 0.7425),
            UDim2.fromScale(0.725, 0.7425)
        }
    },
    {
        ["Size"] = UDim2.fromScale(0.47, 0.47),
        ["Positions"] = {
            UDim2.fromScale(0.1625, 0.2575),
            UDim2.fromScale(0.3875, 0.2575),
            UDim2.fromScale(0.6125, 0.2575),
            UDim2.fromScale(0.8325, 0.2575),
            UDim2.fromScale(0.275, 0.7425),
            UDim2.fromScale(0.5, 0.7425),
            UDim2.fromScale(0.725, 0.7425)
        }
    },
    {
        ["Size"] = UDim2.fromScale(0.47, 0.47),
        ["Positions"] = {
            UDim2.fromScale(0.1625, 0.2575),
            UDim2.fromScale(0.3875, 0.2575),
            UDim2.fromScale(0.6125, 0.2575),
            UDim2.fromScale(0.8325, 0.2575),
            UDim2.fromScale(0.1625, 0.7425),
            UDim2.fromScale(0.3875, 0.7425),
            UDim2.fromScale(0.6125, 0.7425),
            UDim2.fromScale(0.8325, 0.7425)
        }
    }
}

--========================================
-- ModuleScript : StarterGui.MessageGUI.MessageLocalScript.WinAnimation
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v3 = v1.AllModules
local v_u_4 = require(game:GetService("Players").LocalPlayer.PlayerScripts.Client_CollectionScript.Client_OnDoorForKeyAdded)
local v_u_5 = require(v3.TeleportButton)
local v_u_6 = require(v3.ImageFromName)
local v_u_7 = require(v3.A_Or_An)
local v8 = game.SoundService.Sound
local v_u_9 = v8.VictorySound
local v_u_10 = v8.WhooshSound
local v_u_11 = script.Parent.Parent
local v_u_12 = v_u_11.KeyFrame
local v_u_13 = TweenInfo.new(7.2, Enum.EasingStyle.Linear)
local v_u_14 = TweenInfo.new(1, Enum.EasingStyle.Linear)
local v_u_15 = nil
local v_u_16 = {}
v_u_16.__index = v_u_16
function v_u_16.new()
    -- upvalues: (copy) v_u_16, (ref) v_u_15
    local v17 = v_u_16
    local v18 = setmetatable({}, v17)
    v18.Active = true
    if v_u_15 then
        task.spawn(v_u_15.EndAnimation, v_u_15)
    end
    v_u_15 = v18
    return v18
end
function WinAnimation(p19, p20, _)
    -- upvalues: (copy) v_u_12, (copy) v_u_6, (copy) v_u_11, (copy) v_u_16, (copy) v_u_7, (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_13, (copy) v_u_10, (copy) v_u_9
    local v21 = v_u_12:Clone()
    local v22 = v21.MainImage
    local v23 = v_u_6[p20]
    v22.Image = v23.Image
    if v23.SizeFactor then
        Instance.new("UIScale", v22).Scale = v23.SizeFactor
    end
    v22.UIAspectRatioConstraint.AspectRatio = v23.AspectRatio or 1
    v21.Position = UDim2.new(0.5, 0, 0, -50 - v21.AbsoluteSize.Y / 2)
    v21.Visible = true
    v21.Parent = v_u_11
    local v24 = v_u_16.new()
    v24.YellowBackground = v21.YellowBackground
    v24.DescriptionLabel = v21.Description
    v24.DescriptionLabel.Text = p19
    v24.MainImage = v22
    v24.Help = v21.Help
    v24.KeyFrame = v21
    if p20:find("key") then
        v24.Help.Text = "Use it to open " .. v_u_7(p20:sub(1, -5), false) .. " door"
        local v25 = v_u_4.KeyNameToDoorForKey[p20]
        local v26
        if v25 then
            v26 = v25:FindFirstChild("CollisionPart")
        else
            v26 = v25
        end
        if v26 then
            v26 = v26.CFrame * CFrame.new(-v26.Size.X / 2 - 10, -v26.Size.Y / 2, 0) * CFrame.Angles(0, -1.5707963267948966, 0)
        end
        if v26 then
            task.spawn(v_u_5.EnableButton, "Use key now", v26, v25, p20)
        end
    end
    v21:TweenPosition(UDim2.new(0.5, 0, 0.5, -50), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1.2)
    v24.TweenYellow = v_u_2:Create(v24.YellowBackground, v_u_13, {
        ["Rotation"] = 180
    })
    v24.TweenYellow:Play()
    v_u_10:Play()
    task.wait(0.5)
    v_u_9:Play()
    task.wait(3.5)
    if v24.Active then
        v24:EndAnimation()
    end
end
function v_u_16.EndAnimation(p27)
    -- upvalues: (copy) v_u_2, (copy) v_u_14, (ref) v_u_15
    if p27.Active then
        p27.Active = false
        v_u_2:Create(p27.DescriptionLabel, v_u_14, {
            ["TextTransparency"] = 1,
            ["TextStrokeTransparency"] = 1
        }):Play()
        v_u_2:Create(p27.Help, v_u_14, {
            ["TextTransparency"] = 1,
            ["TextStrokeTransparency"] = 1
        }):Play()
        v_u_2:Create(p27.YellowBackground, v_u_14, {
            ["ImageTransparency"] = 1
        }):Play()
        v_u_2:Create(p27.MainImage, v_u_14, {
            ["ImageTransparency"] = 1
        }):Play()
        task.wait(1)
        p27.KeyFrame:Destroy()
        p27.TweenYellow:Cancel()
        p27.TweenYellow:Destroy()
        if v_u_15 == p27 then
            v_u_15 = nil
        end
        table.clear(p27)
    end
end
return WinAnimation

--========================================
-- ModuleScript : StarterGui.MessageGUI.MessageLocalScript.WriteMessage
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent.Parent
local v_u_3 = v_u_2:WaitForChild("NotificationLabel")
local v_u_4 = nil
local v_u_5 = nil
task.spawn(function()
    -- upvalues: (ref) v_u_5, (copy) v_u_2
    v_u_5 = v_u_2.Parent:WaitForChild("MainGui"):WaitForChild("LowerFrameContainer"):WaitForChild("ToolFrame")
end)
local v_u_6 = game:GetService("SoundService"):WaitForChild("Sound"):WaitForChild("TextWriteSound")
local v_u_7 = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v_u_8 = TweenInfo.new(1, Enum.EasingStyle.Linear)
function WriteMessage(p9, p10)
    -- upvalues: (ref) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_2, (ref) v_u_5, (copy) v_u_1, (copy) v_u_7, (copy) v_u_8
    if v_u_4 then
        v_u_4:Destroy()
        if v_u_6.IsPlaying then
            v_u_6:Stop()
        end
    end
    local v11 = v_u_3:Clone()
    v11.Text = p9
    v11.Size = UDim2.fromScale(0, 0)
    v11.Parent = v_u_2
    v11.MaxVisibleGraphemes = 0
    v11.Visible = true
    v_u_4 = v11
    if v_u_5 and v_u_5.Visible then
        v11.Position = UDim2.fromOffset(v_u_5.AbsolutePosition.X + v_u_5.AbsoluteSize.X / 2, v_u_5.AbsolutePosition.Y - v_u_5.AbsoluteSize.Y * 0.15)
    end
    local v12 = v_u_1:Create(v11, v_u_7, {
        ["Size"] = UDim2.fromOffset(15 + v11.TextBounds.X, 25),
        ["BackgroundTransparency"] = 0
    })
    v12:Play()
    v12.Completed:Wait()
    task.wait(0.1)
    if v11.Parent then
        if p10 then
            v_u_6:Play()
        end
        for v13 = 1, string.len(p9) do
            v11.MaxVisibleGraphemes = v13
            task.wait(0.03)
            if not v11.Parent then
                return
            end
        end
        if v_u_6.IsPlaying then
            v_u_6:Stop()
        end
        task.wait(4)
        if v11.Parent then
            local v14 = v_u_1:Create(v11, v_u_8, {
                ["Transparency"] = 1
            })
            v14:Play()
            v14.Completed:Wait()
            if v11.Parent then
                v11:Destroy()
            end
        else
            return
        end
    else
        return
    end
end
return WriteMessage

--========================================
-- ModuleScript : StarterGui.MessageGUI.MessageLocalScript.SendNotification
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
game:GetService("GuiService")
local v2 = game.Players.LocalPlayer.PlayerGui
local v_u_3 = v2:WaitForChild("MainGui")
local v_u_4 = v2:WaitForChild("MessageGUI"):WaitForChild("NotificationFrame")
local v_u_5 = v_u_3:WaitForChild("CashImgButton")
local v_u_6 = v_u_3:WaitForChild("HealthBar")
local v_u_7 = script:WaitForChild("Info")
v_u_7:WaitForChild("UIScale").Scale = 0
v_u_7.BackgroundTransparency = 1
v_u_7.TextTransparency = 1
local v_u_8 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v_u_9 = TweenInfo.new(0.8, Enum.EasingStyle.Linear)
local v_u_10 = TweenInfo.new(0.3, Enum.EasingStyle.Linear)
local v_u_11 = {}
local v_u_12 = {}
function FadeOutMessage(p_u_13, p14)
    -- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_1, (copy) v_u_10, (copy) v_u_9
    local v15 = v_u_11[p_u_13]
    if v15 then
        for _, v16 in pairs(v15) do
            v16:Cancel()
        end
        table.clear(v15)
        v_u_11[p_u_13] = nil
        local v17 = table.find(v_u_12, p_u_13)
        if v17 then
            table.remove(v_u_12, v17)
        end
        local v18 = v_u_1:Create(p_u_13, p14 and v_u_10 or v_u_9, {
            ["TextTransparency"] = 1,
            ["BackgroundTransparency"] = 1
        })
        v18:Play()
        v18.Completed:Once(function()
            -- upvalues: (copy) p_u_13
            p_u_13:Destroy()
        end)
    end
end
local v_u_19 = 0
function SendNotification(p20, p21)
    -- upvalues: (ref) v_u_19, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_1, (copy) v_u_8, (copy) v_u_11, (copy) v_u_12
    v_u_19 = v_u_19 - 1
    local v22 = v_u_7:Clone()
    local v23 = 12 + 0.01 * v_u_3.AbsoluteSize.Y
    v22.TextSize = math.min(v23, 23)
    v22.LayoutOrder = v_u_19
    v22.TextColor3 = p21
    v22.Parent = v_u_4
    v22.Text = p20
    local v24 = v22.UIScale
    local v25 = v_u_1:Create(v22, v_u_8, {
        ["TextTransparency"] = 0,
        ["BackgroundTransparency"] = 0.35
    })
    local v26 = v_u_1:Create(v24, v_u_8, {
        ["Scale"] = 1
    })
    v25:Play()
    v26:Play()
    v_u_11[v22] = { v25, v26 }
    local v27 = v_u_12
    table.insert(v27, v22)
    if #v_u_12 >= 8 then
        FadeOutMessage(v_u_12[1], true)
    end
    task.wait(3)
    FadeOutMessage(v22)
end
function PlaceNotificationFrame()
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7
    local v28 = v_u_3.AbsoluteSize.Y * 0.013
    v_u_4.Position = v_u_6.Position + UDim2.fromOffset(0, v_u_6.AbsoluteSize.Y + v_u_6:WaitForChild("UIStroke").Thickness + v28)
    v_u_4.Size = UDim2.new(0.5, -v_u_5.AbsoluteSize.X / 2 - 2 * v28, 1)
    v_u_7.UISizeConstraint.MaxSize = Vector2.new(v_u_4.AbsoluteSize.X, (1 / 0))
end
v_u_5:GetPropertyChangedSignal("AbsoluteSize"):Connect(PlaceNotificationFrame)
v_u_6:GetPropertyChangedSignal("Position"):Connect(PlaceNotificationFrame)
PlaceNotificationFrame()
return SendNotification

--========================================
-- ModuleScript : StarterGui.MessageGUI.MessageLocalScript.BadgeAnimation
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("SoundService")
local v_u_2 = game:GetService("TweenService")
local v3 = v1.Sound
local v_u_4 = v3.Unlock
local v_u_5 = v3.WhooshLight
local v_u_6 = script.Parent.Parent
local v7 = v_u_6.Parent.MainGui
local v_u_8 = script.BadgeFrame_Template
local v_u_9 = v7.ButtonContainer.TowerFloorsBttn
local v_u_10 = require(v7.MainGuiScript.ToggleFrameModule)
local v_u_11 = require(game:GetService("ReplicatedStorage").AllModules.GetBadgeImageId)
local v_u_12 = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local v_u_13 = TweenInfo.new(1.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local v_u_14 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
local v_u_15 = v_u_6.Parent:WaitForChild("FloorBuildingSG").ScrollingFrame
function AnimateEarnFloorBadge(p16)
    -- upvalues: (copy) v_u_10, (copy) v_u_8, (copy) v_u_6, (copy) v_u_15, (copy) v_u_11, (copy) v_u_2, (copy) v_u_13, (copy) v_u_5, (copy) v_u_12, (copy) v_u_4, (copy) v_u_9, (copy) v_u_14
    v_u_10.CloseOpenedFrame()
    local v17 = v_u_8:Clone()
    local v18 = v17.BadgeImage
    local v19 = v17.NameLabel
    local v20 = v19.UIScale
    local v21 = v17.UIStroke
    local v22 = v17.YellowBackground
    local v23 = v17.UIScale
    local v24 = 65 + 0.14 * v_u_6.AbsoluteSize.Y
    v17.Size = UDim2.fromOffset(v24, v24)
    v21.Thickness = v24 * 0.02
    if p16.FloorName then
        local v25 = v_u_15:FindFirstChild(p16.FloorLevel)
        if v25 then
            v18.Image = v25.BadgeImage.Image
        end
        local v26 = p16.FloorName:split("_")
        v19.Text = #v26 == 1 and p16.FloorName or v26[1] .. " floor"
    else
        v19.Text = p16.Description
        v18.Image = v_u_11(p16.BadgeId, 3)
    end
    v19.TextSize = v24 / 5
    v20.Scale = 0
    v17.Parent = v_u_6
    v17.Position = UDim2.fromScale(0.3, 0.45)
    v17.BackgroundTransparency = 1
    v17.Rotation = -12
    local v27 = v_u_2:Create(v17, v_u_13, {
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["BackgroundTransparency"] = 0,
        ["Rotation"] = 0
    })
    v27:Play()
    v18.ImageTransparency = 1
    v_u_2:Create(v18, v_u_13, {
        ["ImageTransparency"] = 0
    }):Play()
    v21.Transparency = 1
    v_u_2:Create(v21, v_u_13, {
        ["Transparency"] = 0
    }):Play()
    v_u_5:Play()
    v27.Completed:Wait()
    local v28 = v18:Clone()
    v28.Size = UDim2.fromScale(2.2, 2.2)
    v28.ImageColor3 = Color3.new()
    v28.ImageTransparency = 1
    v28.Parent = v17
    local v29 = v_u_2:Create(v28, v_u_12, {
        ["ImageTransparency"] = 0,
        ["Size"] = UDim2.fromScale(0.9, 0.9),
        ["ImageColor3"] = Color3.new(1, 1, 1)
    })
    v29:Play()
    v_u_2:Create(v18, TweenInfo.new(v_u_12.Time * 0.7, Enum.EasingStyle.Linear), {
        ["ImageTransparency"] = 1
    }):Play()
    task.wait(v_u_12.Time * 0.3)
    v_u_4:Play()
    task.wait(v_u_12.Time * 0.15)
    v_u_2:Create(v23, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
        ["Scale"] = 0.9
    }):Play()
    v22.ImageTransparency = 1
    v_u_2:Create(v22, TweenInfo.new(1), {
        ["ImageTransparency"] = 0
    }):Play()
    v_u_2:Create(v22, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false), {
        ["Rotation"] = 360
    }):Play()
    v_u_2:Create(v20, TweenInfo.new(0.4 * v_u_12.Time, Enum.EasingStyle.Sine), {
        ["Scale"] = 1
    }):Play()
    v29.Completed:Wait()
    task.wait(3)
    local v30 = v_u_9.AbsolutePosition
    local v31 = v_u_9.AbsoluteSize
    local v32 = v_u_2:Create(v17, v_u_14, {
        ["Rotation"] = -25,
        ["Position"] = UDim2.fromOffset(v30.X + v31.X / 2, v30.Y + v31.Y / 2)
    })
    v_u_2:Create(v23, v_u_14, {
        ["Scale"] = 0
    }):Play()
    v32:Play()
    v32.Completed:Wait()
    v17:Destroy()
end
return AnimateEarnFloorBadge

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.KeyGeneratorStats
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    "1",
    "50",
    "51",
    "100",
    "101",
    "150"
}
local v2 = v_u_1[#v_u_1]
local v3 = tonumber(v2)
UpgradePrice = {
    ["1"] = 0,
    ["2"] = 1000,
    ["3"] = 2000,
    ["4"] = 4000,
    ["5"] = 8000,
    ["6"] = 16000,
    ["7"] = 32000,
    ["8"] = 64000,
    ["9"] = 128000,
    ["10"] = 250000,
    ["11"] = 350000,
    ["12"] = 500000,
    ["13"] = 750000,
    ["14"] = 1000000,
    ["15"] = 1250000,
    ["16"] = 1500000,
    ["17"] = 2000000,
    ["18"] = 2500000,
    ["19"] = 3000000,
    ["20"] = 4000000,
    ["21"] = 5000000,
    ["22"] = 6000000,
    ["23"] = 7000000,
    ["24"] = 8000000,
    ["25"] = 9000000,
    ["26"] = 10000000,
    ["27"] = 11000000,
    ["28"] = 12000000,
    ["29"] = 13000000,
    ["30"] = 14000000,
    ["31"] = 15000000,
    ["32"] = 16000000,
    ["33"] = 17000000,
    ["34"] = 18000000,
    ["35"] = 19000000,
    ["36"] = 20000000,
    ["37"] = 21000000,
    ["38"] = 22000000,
    ["39"] = 23000000,
    ["40"] = 24000000,
    ["41"] = 25000000,
    ["42"] = 26000000,
    ["43"] = 27000000,
    ["44"] = 28000000,
    ["45"] = 29000000,
    ["46"] = 30000000,
    ["47"] = 32000000,
    ["48"] = 35000000,
    ["49"] = 39000000,
    ["50"] = 44000000
}
local v4 = UpgradePrice["50"]
local v5 = {}
for v6 = 51, 100 do
    v4 = v4 + 2000000
    UpgradePrice[tostring(v6)] = v4
end
for v7 = 51, v3 do
    v4 = v4 + 4000000
    UpgradePrice[tostring(v7)] = v4
end
local v8 = {
    "wooden key",
    "stone key",
    "silver key",
    "golden key",
    "diamond key"
}
local v9 = {
    "stone key",
    "silver key",
    "golden key",
    "diamond key",
    "infinity key"
}
local v10 = {
    "silver key",
    "golden key",
    "diamond key",
    "infinity key",
    "absolute infinity key"
}
local v_u_11 = {
    ["1"] = {
        ["Keys"] = v8,
        ["Probs"] = {
            500,
            350,
            100,
            49,
            1
        },
        ["Time"] = {
            360,
            600,
            900,
            1200,
            1800
        }
    },
    ["50"] = {
        ["Keys"] = v8,
        ["Probs"] = {
            0,
            220,
            400,
            280,
            100
        },
        ["Time"] = {
            80,
            230,
            435,
            560,
            930
        }
    },
    ["51"] = {
        ["Keys"] = v9,
        ["Probs"] = {
            215,
            395,
            285,
            103,
            2
        },
        ["Time"] = {
            230,
            435,
            560,
            930,
            1700
        },
        ["LevelRequired"] = 400
    },
    ["100"] = {
        ["Keys"] = v9,
        ["Probs"] = {
            0,
            150,
            450,
            300,
            100
        },
        ["Time"] = {
            130,
            240,
            450,
            700,
            1100
        },
        ["LevelRequired"] = 400
    },
    ["101"] = {
        ["Keys"] = v10,
        ["Probs"] = {
            147,
            445,
            302,
            104,
            2
        },
        ["Time"] = {
            230,
            435,
            560,
            930,
            1700
        },
        ["LevelRequired"] = 1000
    },
    ["150"] = {
        ["Keys"] = v10,
        ["Probs"] = {
            0,
            200,
            400,
            300,
            100
        },
        ["Time"] = {
            130,
            240,
            450,
            700,
            1100
        },
        ["LevelRequired"] = 1000
    }
}
local v_u_12 = {
    ["0"] = {
        ["Keys"] = v8,
        ["Probs"] = {
            0,
            0,
            0,
            350,
            650
        },
        ["Time"] = {
            0,
            0,
            0,
            240,
            420
        }
    },
    ["400"] = {
        ["Keys"] = v9,
        ["Probs"] = {
            0,
            0,
            250,
            500,
            250
        },
        ["Time"] = {
            0,
            0,
            180,
            360,
            720
        }
    },
    ["1000"] = {
        ["Keys"] = v10,
        ["Probs"] = {
            0,
            0,
            300,
            400,
            300
        },
        ["Time"] = {
            0,
            0,
            300,
            600,
            1000
        }
    }
}
local v_u_13 = { 1000, 400, 0 }
for v14, v15 in pairs(v_u_11) do
    v15.Price = UpgradePrice[v14]
end
local v_u_16 = table.clone(v_u_11)
function GetKeyGenLevelDescription(p17, p18, p19)
    -- upvalues: (copy) v_u_16, (copy) v_u_13, (copy) v_u_12, (copy) v_u_1, (copy) v_u_11
    local v20 = p19 or (p18 or p17.Stats.KeyGenerator1Level).Value
    local v21 = tostring(v20)
    if v_u_16[v21] then
        return v_u_16[v21]
    end
    if v21 == "Special" then
        local v22 = p17.leaderstats.Level.Value
        for _, v23 in pairs(v_u_13) do
            if v23 <= v22 then
                return v_u_12[tostring(v23)]
            end
        end
        warn("should not end here")
        return v_u_12["0"]
    end
    local v24 = 1
    local v25 = 1
    for _, v26 in pairs(v_u_1) do
        if v21 - v26 <= 0 then
            v25 = v26
            break
        end
        v24 = v26
    end
    local v27 = v_u_11[v24]
    local v28 = v_u_11[v25]
    local v29 = v27.Keys
    local _ = v28.Keys
    local v30 = v27.LevelRequired
    local v31 = {}
    local v32 = 0
    local v33 = {}
    for v34, _ in pairs(v29) do
        local v35 = (v21 - v24) / (v25 - v24)
        local v36 = v27.Probs[v34]
        local v37 = v28.Probs[v34]
        local v38 = v36 + v32 + (v37 - v36) * v35
        local v39 = math.round(v38)
        v32 = v38 - v39
        table.insert(v33, v39)
        local v40 = v27.Time[v34]
        local v41 = (v28.Time[v34] - v40) * v35
        local v42 = v40 + math.round(v41)
        table.insert(v31, v42)
    end
    local v43 = {
        ["Keys"] = v29,
        ["Probs"] = v33,
        ["Time"] = v31,
        ["LevelRequired"] = v30,
        ["Price"] = UpgradePrice[v21]
    }
    v_u_16[v21] = v43
    return v43
end
v5.MaxLevel = v3
v5.UpgradePrice = UpgradePrice
v5.GetKeyGenLevelDescription = GetKeyGenLevelDescription
return v5

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.LaserStats
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    {
        {
            10,
            1.2,
            0.9,
            50,
            175
        },
        0
    },
    {
        {
            11,
            1.25,
            0.85,
            55,
            178
        },
        500
    },
    {
        {
            12,
            1.3,
            0.8,
            60,
            181
        },
        1500
    },
    {
        {
            13,
            1.35,
            0.75,
            65,
            184
        },
        3000
    },
    {
        {
            14,
            1.4,
            0.7,
            70,
            187
        },
        6000
    },
    {
        {
            15,
            1.45,
            0.65,
            75,
            190
        },
        10000
    },
    {
        {
            16,
            1.5,
            0.6,
            80,
            193
        },
        15000
    },
    {
        {
            17,
            1.65,
            0.55,
            85,
            196
        },
        25000
    },
    {
        {
            18,
            1.7,
            0.5,
            90,
            199
        },
        40000
    },
    {
        {
            19,
            1.75,
            0.48,
            95,
            202
        },
        60000
    },
    {
        {
            20,
            1.8,
            0.46,
            100,
            205
        },
        100000
    },
    {
        {
            21,
            1.85,
            0.45,
            105,
            208
        },
        150000
    },
    {
        {
            22,
            1.9,
            0.44,
            110,
            211
        },
        250000
    },
    {
        {
            23,
            1.95,
            0.43,
            115,
            214
        },
        500000
    },
    {
        {
            24,
            2,
            0.42,
            120,
            217
        },
        750000
    },
    {
        {
            25,
            2.05,
            0.41,
            125,
            220
        },
        1000000
    },
    {
        {
            25,
            2.1,
            0.4,
            130,
            223
        },
        1500000
    },
    {
        {
            26,
            2.15,
            0.395,
            135,
            226
        },
        2500000
    },
    {
        {
            27,
            2.2,
            0.39,
            140,
            229
        },
        4000000
    },
    {
        {
            28,
            2.25,
            0.385,
            145,
            232
        },
        5000000
    },
    {
        {
            29,
            2.3,
            0.38,
            150,
            235
        },
        6000000
    },
    {
        {
            30,
            2.35,
            0.375,
            155,
            238
        },
        7000000
    },
    {
        {
            31,
            2.4,
            0.37,
            160,
            241
        },
        8000000
    },
    {
        {
            32,
            2.45,
            0.365,
            165,
            244
        },
        9000000
    },
    {
        {
            33,
            2.5,
            0.36,
            170,
            247
        },
        10000000
    }
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.UsefullFunction
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["HasPlayerTool"] = function(p1, p2)
        local v3 = not p2.Backpack:FindFirstChild(p1) and p2.Character
        if v3 then
            v3 = p2.Character:FindFirstChild(p1)
        end
        return v3
    end,
    ["GetDictionnaryLength"] = function(p4)
        local v5 = 0
        for _, _ in pairs(p4) do
            v5 = v5 + 1
        end
        return v5
    end,
    ["GetEffectiveRewLevel"] = function(p6)
        return p6 > 6 and (p6 < 25 and 6 or (p6 < 50 and 25 or (p6 < 100 and 50 or (p6 < 200 and 100 or (p6 < 400 and 200 or (p6 < 1000 and 400 or (p6 < 2000 and 1000 or 2000))))))) or p6
    end,
    ["Get_2D_Dist"] = function(p7, p8)
        local v9 = Vector2.new(p7.Position.X, p7.Position.Z)
        return (Vector2.new(p8.Position.X, p8.Position.Z) - v9).Magnitude
    end,
    ["HasGamePass"] = function(p10, p11)
        if not p10 then
            return false
        end
        local v12 = p10:WaitForChild("Stats"):WaitForChild("GamePass")
        local v13 = v12:WaitForChild("AreGamePassBooleanFullyLoaded")
        while not v13.Value do
            v13:GetPropertyChangedSignal("Value"):Wait()
        end
        return v12[p11].Value
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.DailySpinReward
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    [45] = { "coin_Medium", 0.2 },
    [90] = { "stone key" },
    [135] = { "wooden key" },
    [180] = { "coin_Small", 0.13333333333333333 },
    [225] = { "diamond key" },
    [270] = { "coin_Large", 0.26666666666666666 },
    [315] = { "golden key" },
    [360] = { "silver key" }
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.CratesValueModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.AllModules.UsefullFunction).GetEffectiveRewLevel
local v_u_3 = require(v1.AllModules.ConvertVal)
local v4 = {}
CrateValues = {
    ["wooden crate"] = {
        ["MinValue"] = 100,
        ["Multiplicator"] = 5
    },
    ["stone crate"] = {
        ["MinValue"] = 500,
        ["Multiplicator"] = 10
    },
    ["silver crate"] = {
        ["MinValue"] = 1000,
        ["Multiplicator"] = 20
    },
    ["golden crate"] = {
        ["MinValue"] = 4000,
        ["Multiplicator"] = 40
    },
    ["diamond crate"] = {
        ["MinValue"] = 20000,
        ["Multiplicator"] = 100
    },
    ["infinity crate"] = {
        ["MinValue"] = 22500,
        ["Multiplicator"] = 280
    },
    ["absolute infinity crate"] = {
        ["MinValue"] = 27500,
        ["Multiplicator"] = 675
    },
    ["terminusfinity crate"] = {
        ["MinValue"] = 32500,
        ["Multiplicator"] = 1700
    },
    ["halloween crate"] = {
        ["MinValue"] = 700,
        ["Multiplicator"] = 15,
        ["EventName"] = "HalloweenEvent"
    },
    ["red gift crate"] = {
        ["MinValue"] = 750,
        ["Multiplicator"] = 15,
        ["EventName"] = "ChristmasEvent"
    },
    ["cyan gift crate"] = {
        ["MinValue"] = 15000,
        ["Multiplicator"] = 60,
        ["EventName"] = "ChristmasEvent"
    },
    ["winter crate"] = {
        ["MinValue"] = 725,
        ["Multiplicator"] = 15,
        ["EventName"] = "WinterEvent"
    },
    ["frozen crate"] = {
        ["MinValue"] = 17500,
        ["Multiplicator"] = 90,
        ["EventName"] = "WinterEvent"
    },
    ["summer crate"] = {
        ["MinValue"] = 775,
        ["Multiplicator"] = 15,
        ["EventName"] = "SummerEvent"
    },
    ["green easter crate"] = {
        ["MinValue"] = 250,
        ["Multiplicator"] = 7,
        ["EventName"] = "EasterEvent"
    },
    ["red easter crate"] = {
        ["MinValue"] = 5000,
        ["Multiplicator"] = 50,
        ["EventName"] = "EasterEvent"
    },
    ["4th of july crate"] = {
        ["MinValue"] = 175,
        ["Multiplicator"] = 6,
        ["EventName"] = "4thOfJulyEvent"
    },
    ["thanksgiving crate"] = {
        ["MinValue"] = 800,
        ["Multiplicator"] = 15,
        ["EventName"] = "ThanksgivingEvent"
    },
    ["valentine crate"] = {
        ["MinValue"] = 3000,
        ["Multiplicator"] = 30,
        ["EventName"] = "ValentineEvent"
    },
    ["flower crate"] = {
        ["MinValue"] = 1100,
        ["Multiplicator"] = 20,
        ["EventName"] = "SpringEvent"
    }
}
v4.CrateValues = CrateValues
v4.EventNameToCrates = {}
for v5, v6 in pairs(CrateValues) do
    local v7 = v6.EventName
    if v7 then
        local v8 = v4.EventNameToCrates[v7] or {}
        table.insert(v8, v5)
        v4.EventNameToCrates[v7] = v8
    end
end
function v4.GetCrateReward(p9, p10)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    local v11 = v_u_2(p9.leaderstats.Level.Value)
    if v11 > 6 then
        v11 = v11 == 25 and 6.4 or (v11 == 50 and 6.65 or (v11 == 100 and 7.15 or (v11 == 200 and 7.65 or (v11 == 400 and 8.6 or (v11 == 1000 and 9.6 or (v11 == 2000 and 10 or v11))))))
    end
    local v12 = v_u_3.RoundValueWithNonZeroDigit
    local v13 = CrateValues[p10].MinValue
    local v14 = 4 ^ v11 * CrateValues[p10].Multiplicator
    return v12(v13 + math.floor(v14), 2)
end
return v4

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.CloneUpgrades
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.ImageFromName)
local v_u_2 = nil
local v_u_5 = {
    ["GetPlayerClone"] = function(p3, p4)
        -- upvalues: (copy) v_u_5
        return workspace.CloneFolder:FindFirstChild(v_u_5.GetCloneIdentifiantStr(p4):upper() .. p3.Name)
    end
}
function SimplePrint(p6, p7, p8, p9, p10)
    -- upvalues: (copy) v_u_5
    p7.ValText.Text = v_u_5[p6][p8][1] * (p10 and 2 or 1)
    p7.ValText.TextColor3 = p9
end
function SimpleUpdate(p11, p12, p13)
    -- upvalues: (copy) v_u_5
    local v14 = v_u_5.GetCloneIdentifiantStr(p13)
    local v15 = p12.Stats.CloneStats[v14 .. p11]
    local v16 = p12.leaderstats.Cash
    local v17 = v_u_5[p11][v15.Value + 1]
    local v18 = v17[2]
    if v16.Value < v18 then
        warn(p12.DisplayName .. " not enough cash to buy clone upgrade!")
        return false
    end
    local v19 = v17[3]
    if v19 and p12.leaderstats.Level.Value < v19 then
        warn(p12.DisplayName .. "@" .. p12.Name .. " tried to buy clone weapon without the required level!!")
        return false
    end
    local v20 = p12.leaderstats.Cash
    v20.Value = v20.Value - v18
    v15.Value = v15.Value + 1
    local v21 = v_u_5[p11].ApplyVal
    if v21 then
        v21(p12, v15.Value, p13)
    end
    return v15.Value
end
v_u_5.TargetMode = {
    ["Kill"] = { "Closest", "Strongest", "Weakest" },
    ["Crates"] = { "Closest", "Rarest" },
    ["Keys"] = { "Closest", "Rarest" },
    ["Bones"] = { "Closest" },
    ["Eggs"] = { "Closest" },
    ["UpdateVal"] = function(p22, p23)
        -- upvalues: (copy) v_u_5
        local v24 = v_u_5.GetCloneIdentifiantStr(p23)
        local v25 = p22.Stats.CloneStats[v24 .. "Mode"].Value
        local v26 = p22.Stats.CloneStats[v24 .. "TargetMode"]
        local v27 = v_u_5.TargetMode[v25]
        local v28 = table.find(v27, v26.Value) + 1
        if #v27 < v28 then
            v28 = v28 - #v27
        end
        v26.Value = v27[v28]
        local v29 = v_u_5.GetPlayerClone(p22, p23)
        if v29 then
            v29:SetAttribute("TargetMode", v26.Value)
        end
        return v27[v28]
    end
}
v_u_5.CloneMode = {
    ["UpdateVal"] = function(p30, p31)
        -- upvalues: (copy) v_u_5
        local v32 = v_u_5.GetCloneIdentifiantStr(p31)
        local v33 = p30.Stats.CloneStats[v32 .. "Mode"]
        if v33.Value == "Kill" then
            v33.Value = "Crates"
        elseif v33.Value == "Crates" then
            v33.Value = "Keys"
        elseif v33.Value == "Keys" and workspace:GetAttribute("HalloweenEvent") then
            v33.Value = "Bones"
        elseif v33.Value == "Keys" and workspace:GetAttribute("EasterEvent") then
            v33.Value = "Eggs"
        else
            v33.Value = "Kill"
        end
        local v34 = v_u_5.TargetMode[v33.Value]
        local v35 = p30.Stats.CloneStats[v32 .. "TargetMode"]
        if not table.find(v34, v35.Value) then
            v35.Value = v34[1]
        end
        local v36 = v_u_5.GetPlayerClone(p30, p31)
        if v36 then
            v36:SetAttribute("CloneMode", v33.Value)
            v36:SetAttribute("TargetMode", v35.Value)
        end
        return { v33.Value, v35.Value }
    end
}
v_u_5.Health = {
    [0] = { 50, 0 },
    [1] = { 52, 100 },
    [2] = { 54, 200 },
    [3] = { 58, 400 },
    [4] = { 65, 800 },
    [5] = { 75, 1600 },
    [6] = { 88, 3200 },
    [7] = { 100, 6400 },
    [8] = { 115, 12800 },
    [9] = { 130, 20000 },
    [10] = { 150, 40000 },
    [11] = { 170, 80000 },
    [12] = { 190, 160000 },
    [13] = { 210, 320000 },
    [14] = { 235, 400000 },
    [15] = { 260, 500000 },
    [16] = { 290, 600000 },
    [17] = { 320, 700000 },
    [18] = { 360, 800000 },
    [19] = { 400, 900000 },
    [20] = { 440, 1000000 },
    [21] = { 480, 1100000 },
    [22] = { 520, 1200000 },
    [23] = { 570, 1300000 },
    [24] = { 620, 1400000 },
    [25] = { 680, 1500000 },
    [26] = { 740, 1600000 },
    [27] = { 800, 1700000 },
    [28] = { 900, 1800000 },
    [29] = { 1000, 1900000 },
    [30] = { 1100, 2000000 },
    [31] = { 1200, 2200000 },
    [32] = { 1300, 2400000 },
    [33] = { 1450, 2600000 },
    [34] = { 1600, 2800000 },
    [35] = { 1750, 3000000 },
    [36] = { 1900, 3200000 },
    [37] = { 2050, 3400000 },
    [38] = { 2200, 3600000 },
    [39] = { 2350, 3800000 },
    [40] = { 2500, 4000000 },
    [41] = { 2600, 15000000, 1000 },
    [42] = { 2700, 25000000, 1000 },
    [43] = { 2800, 50000000, 1000 },
    [44] = { 2900, 100000000, 1000 },
    [45] = { 3000, 500000000, 2000 },
    [46] = { 3100, 1000000000, 2000 },
    [47] = { 3200, 2000000000, 2000 },
    [48] = { 3300, 4000000000, 2000 },
    [49] = { 3400, 10000000000, 2000 },
    [50] = { 3500, 20000000000, 2000 },
    ["PrintValue"] = function(p37, p38, p39, p40)
        SimplePrint("Health", p37, p38, p39, p40)
    end,
    ["UpdateVal"] = function(p41, p42)
        return SimpleUpdate("Health", p41, p42)
    end,
    ["ApplyVal"] = function(p43, p44, p45)
        -- upvalues: (copy) v_u_5
        local v46 = v_u_5.GetPlayerClone(p43, p45)
        if v46 then
            local v47 = v46:FindFirstChild("Humanoid")
            if not v47 or v47.Health <= 0 then
                return
            end
            local v48 = v47.Health / v47.MaxHealth
            v47.MaxHealth = v_u_5.Health[p44][1] * v46:GetScale()
            v47.Health = v48 * v47.MaxHealth
        end
    end
}
v_u_5.Regen = {
    [0] = { 0, 0 },
    [1] = { 0.1, 400 },
    [2] = { 0.2, 800 },
    [3] = { 0.3, 1600 },
    [4] = { 0.4, 3200 },
    [5] = { 0.5, 6400 },
    [6] = { 0.6, 12800 },
    [7] = { 0.7, 25600 },
    [8] = { 0.8, 50000 },
    [9] = { 0.9, 75000 },
    [10] = { 1, 100000 },
    [11] = { 1.1, 130000 },
    [12] = { 1.2, 160000 },
    [13] = { 1.3, 190000 },
    [14] = { 1.4, 220000 },
    [15] = { 1.5, 400000 },
    [16] = { 1.6, 800000 },
    [17] = { 1.7, 1600000 },
    [18] = { 1.8, 3200000 },
    [19] = { 1.9, 6400000 },
    [20] = { 2, 12000000 },
    ["PrintValue"] = function(p49, p50, p51, p52)
        SimplePrint("Regen", p49, p50, p51, p52)
    end,
    ["UpdateVal"] = function(p53, p54)
        return SimpleUpdate("Regen", p53, p54)
    end,
    ["ApplyVal"] = function(p55, p56, p57)
        -- upvalues: (copy) v_u_5
        local v58 = v_u_5.GetPlayerClone(p55, p57)
        if v58 then
            v58:SetAttribute("RegenAmount", v_u_5.Regen[p56][1] * v58:GetScale())
        end
    end
}
v_u_5.Accuracy = {
    [0] = { 5, 0 },
    [1] = { 4.9, 100 },
    [2] = { 4.8, 200 },
    [3] = { 4.7, 300 },
    [4] = { 4.6, 400 },
    [5] = { 4.5, 500 },
    [6] = { 4.4, 700 },
    [7] = { 4.3, 900 },
    [8] = { 4.2, 1100 },
    [9] = { 4.1, 1300 },
    [10] = { 4, 1500 },
    [11] = { 3.9, 2000 },
    [12] = { 3.8, 2500 },
    [13] = { 3.7, 3500 },
    [14] = { 3.6, 5000 },
    [15] = { 3.5, 7500 },
    [16] = { 3.4, 9500 },
    [17] = { 3.3, 12000 },
    [18] = { 3.2, 15000 },
    [19] = { 3.1, 20000 },
    [20] = { 3, 25000 },
    [21] = { 2.9, 30000 },
    [22] = { 2.8, 40000 },
    [23] = { 2.7, 50000 },
    [24] = { 2.6, 60000 },
    [25] = { 2.5, 70000 },
    [26] = { 2.4, 85000 },
    [27] = { 2.3, 100000 },
    [28] = { 2.2, 200000 },
    [29] = { 2.1, 400000 },
    [30] = { 2, 550000 },
    [31] = { 1.9, 700000 },
    [32] = { 1.8, 900000 },
    [33] = { 1.7, 1100000 },
    [34] = { 1.6, 1300000 },
    [35] = { 1.5, 1500000 },
    [36] = { 1.4, 1800000 },
    [37] = { 1.3, 2100000 },
    [38] = { 1.2, 2400000 },
    [39] = { 1.1, 2700000 },
    [40] = { 1, 3000000 },
    [41] = { 0.9, 3500000 },
    [42] = { 0.8, 4000000 },
    [43] = { 0.7, 4500000 },
    [44] = { 0.6, 5000000 },
    [45] = { 0.5, 6000000 },
    [46] = { 0.4, 7000000 },
    [47] = { 0.3, 8000000 },
    [48] = { 0.2, 9000000 },
    [49] = { 0.1, 10000000 },
    [50] = { 0, 11000000 },
    ["PrintValue"] = function(p59, p60, p61)
        -- upvalues: (copy) v_u_5
        p59.ValText.Text = (10 - v_u_5.Accuracy[p60][1]) * 10 .. "%"
        p59.ValText.TextColor3 = p61
    end,
    ["UpdateVal"] = function(p62, p63)
        return SimpleUpdate("Accuracy", p62, p63)
    end,
    ["ApplyVal"] = function(p64, p65, p66)
        -- upvalues: (copy) v_u_5
        local v67 = v_u_5.GetPlayerClone(p64, p66)
        if v67 then
            v67:SetAttribute("Accuracy", v_u_5.Accuracy[p65][1])
        end
    end
}
v_u_5.WalkSpeed = {
    [0] = { 14, 0 },
    [1] = { 14.3, 400 },
    [2] = { 14.7, 800 },
    [3] = { 15, 1400 },
    [4] = { 15.3, 2200 },
    [5] = { 15.7, 2800 },
    [6] = { 16, 4000 },
    [7] = { 16.25, 5300 },
    [8] = { 16.5, 7000 },
    [9] = { 16.75, 9500 },
    [10] = { 17, 12000 },
    [11] = { 17.2, 15000 },
    [12] = { 17.4, 18000 },
    [13] = { 17.6, 25000 },
    [14] = { 17.8, 34000 },
    [15] = { 18, 44000 },
    [16] = { 18.1, 50000 },
    [17] = { 18.2, 60000 },
    [18] = { 18.3, 70000 },
    [19] = { 18.4, 85000 },
    [20] = { 18.5, 100000 },
    [21] = { 17.2, 125000 },
    [22] = { 17.4, 150000 },
    [23] = { 17.6, 200000 },
    [24] = { 17.8, 300000 },
    [25] = { 18, 500000 },
    ["PrintValue"] = function(p68, p69, p70, p71)
        SimplePrint("WalkSpeed", p68, p69, p70, p71)
    end,
    ["UpdateVal"] = function(p72, p73)
        return SimpleUpdate("WalkSpeed", p72, p73)
    end,
    ["ApplyVal"] = function(p74, p75, p76)
        -- upvalues: (copy) v_u_5
        local v77 = v_u_5.GetPlayerClone(p74, p76)
        if v77 and v77:FindFirstChild("Humanoid") then
            v77:SetAttribute("WalkSpeed", v_u_5.WalkSpeed[p75][1] * v77:GetScale())
        end
    end
}
v_u_5.Weapon = {
    [0] = { "Wooden M9", 0, 0 },
    [1] = { "Stone M9", 35000, 0 },
    [2] = { "Silver M9", 100000, 0 },
    [3] = { "Golden M9", 500000, 0 },
    [4] = { "Diamond M9", 2250000, 0 },
    [5] = { "Wooden AK-47", 50000000, 25 },
    [6] = { "Stone AK-47", 150000000, 50 },
    [7] = { "Silver AK-47", 400000000, 100 },
    [8] = { "Golden AK-47", 800000000, 200 },
    [9] = { "Diamond AK-47", 2000000000, 400 },
    [10] = { "Minigun", 20000000000, 1000 },
    [11] = { "\206\169 laser", 250000000000, 2000 },
    ["PrintValue"] = function(p78, p79, p80)
        -- upvalues: (copy) v_u_1, (copy) v_u_5
        local v81 = p78.ValImage
        v81.Image = v_u_1.Tools[v_u_5.Weapon[p79][1]].Image
        if p80 == Color3.fromRGB(0, 255, 0) then
            v81.BackgroundTransparency = 0.75
        else
            v81.BackgroundTransparency = 1
        end
    end,
    ["UpdateVal"] = function(p82, p83)
        return SimpleUpdate("Weapon", p82, p83)
    end,
    ["ApplyVal"] = function(p84, p85, p86)
        -- upvalues: (copy) v_u_5
        local v87 = v_u_5.GetPlayerClone(p84, p86)
        if v87 then
            v87:SetAttribute("ToolName", v_u_5.Weapon[p85][1])
        end
    end
}
v_u_5.RespawnTime = {
    [0] = { 40, 0 },
    [1] = { 39, 100 },
    [2] = { 38, 200 },
    [3] = { 37, 400 },
    [4] = { 36, 800 },
    [5] = { 35, 1600 },
    [6] = { 34, 2500 },
    [7] = { 33.5, 3250 },
    [8] = { 33, 3750 },
    [9] = { 32.5, 4300 },
    [10] = { 32, 4800 },
    [11] = { 31.5, 6000 },
    [12] = { 31, 12000 },
    [13] = { 30.5, 24000 },
    [14] = { 30, 48000 },
    [15] = { 29.5, 100000 },
    [16] = { 29, 200000 },
    [17] = { 28.5, 300000 },
    [18] = { 28, 400000 },
    [19] = { 27.5, 500000 },
    [20] = { 27, 600000 },
    [21] = { 26.5, 700000 },
    [22] = { 26, 800000 },
    [23] = { 25.5, 900000 },
    [24] = { 25, 1000000 },
    [25] = { 24.5, 1100000 },
    [26] = { 24, 1200000 },
    [27] = { 23.5, 1300000 },
    [28] = { 23, 1400000 },
    [29] = { 22.5, 1500000 },
    [30] = { 22, 1600000 },
    [31] = { 21.5, 1650000 },
    [32] = { 21, 1700000 },
    [33] = { 20.5, 1750000 },
    [34] = { 20, 1800000 },
    ["PrintValue"] = function(p88, p89, p90)
        SimplePrint("RespawnTime", p88, p89, p90)
    end,
    ["UpdateVal"] = function(p91, p92)
        -- upvalues: (ref) v_u_2, (copy) v_u_5
        local v93 = SimpleUpdate("RespawnTime", p91, p92)
        if v93 then
            if not v_u_2 then
                v_u_2 = require(game:GetService("ReplicatedStorage").AllModules.GetTowerForPlayer)
            end
            local v94 = v_u_2(p91).AllModels:FindFirstChild("Clone")[v_u_5.GetCloneIdentifiantStr(p92) .. "TimeBeforeRespawn"]
            if v94.Value > 1 then
                v94.Value = v94.Value - 1
            end
        end
        return v93
    end
}
v_u_5.Headshot = {
    [0] = { 0, 0 },
    [1] = { 0.5, 100 },
    [2] = { 1, 200 },
    [3] = { 1.5, 300 },
    [4] = { 2, 400 },
    [5] = { 2.5, 500 },
    [6] = { 3, 700 },
    [7] = { 3.5, 900 },
    [8] = { 4, 1100 },
    [9] = { 4.5, 1300 },
    [10] = { 5, 1500 },
    [11] = { 5.5, 2000 },
    [12] = { 6, 2500 },
    [13] = { 6.5, 3500 },
    [14] = { 7, 5000 },
    [15] = { 7.5, 7500 },
    [16] = { 8, 9500 },
    [17] = { 8.5, 12000 },
    [18] = { 9, 15000 },
    [19] = { 9.5, 20000 },
    [20] = { 10, 25000 },
    [21] = { 10.5, 30000 },
    [22] = { 11, 35000 },
    [23] = { 11.5, 40000 },
    [24] = { 12, 45000 },
    [25] = { 12.5, 50000 },
    [26] = { 13, 60000 },
    [27] = { 13.5, 70000 },
    [28] = { 14, 80000 },
    [29] = { 14.5, 90000 },
    [30] = { 15, 100000 },
    [31] = { 15.5, 120000 },
    [32] = { 16, 140000 },
    [33] = { 16.5, 160000 },
    [34] = { 17, 180000 },
    [35] = { 17.5, 200000 },
    [36] = { 18, 233000 },
    [37] = { 18.5, 266000 },
    [38] = { 19, 300000 },
    [39] = { 19.5, 350000 },
    [40] = { 20, 400000 },
    [41] = { 20.5, 450000 },
    [42] = { 21, 500000 },
    [43] = { 21.5, 550000 },
    [44] = { 22, 600000 },
    [45] = { 22.5, 700000 },
    [46] = { 23, 800000 },
    [47] = { 23.5, 900000 },
    [48] = { 24, 1000000 },
    [49] = { 24.5, 1200000 },
    [50] = { 25, 1500000 },
    [51] = { 25.5, 1600000 },
    [52] = { 26, 1800000 },
    [53] = { 26.5, 2000000 },
    [54] = { 27, 2500000 },
    [55] = { 27.5, 3000000 },
    [56] = { 28, 3500000 },
    [57] = { 28.5, 4000000 },
    [58] = { 29, 4500000 },
    [59] = { 29.5, 5000000 },
    [60] = { 30, 5500000 },
    ["PrintValue"] = function(p95, p96, p97)
        -- upvalues: (copy) v_u_5
        p95.ValText.Text = v_u_5.Headshot[p96][1] .. "%"
        p95.ValText.TextColor3 = p97
    end,
    ["UpdateVal"] = function(p98, p99)
        return SimpleUpdate("Headshot", p98, p99)
    end,
    ["ApplyVal"] = function(p100, p101, p102)
        -- upvalues: (copy) v_u_5
        local v103 = v_u_5.GetPlayerClone(p100, p102)
        if v103 then
            v103:SetAttribute("Headshot", v_u_5.Headshot[p101][1])
        end
    end
}
function v_u_5.GetCloneIdentifiantStr(p104)
    return "Clone" .. (p104 == 2 and 2 or "")
end
local v_u_105 = {
    "Health",
    "Regen",
    "Accuracy",
    "WalkSpeed",
    "Weapon",
    "RespawnTime",
    "Headshot",
    "Mode",
    "TargetMode"
}
v_u_5.StatsName = v_u_105
function v_u_5.GetCloneStats(p106, p107, p108)
    -- upvalues: (copy) v_u_5, (copy) v_u_105
    local v109 = p106.Stats.CloneStats
    local v110 = v_u_5.GetCloneIdentifiantStr(p108)
    local v111 = {}
    for _, v112 in pairs(v_u_105) do
        if v112:find("Mode") then
            local v113 = v109[v110 .. v112].Value
            table.insert(v111, v113)
        else
            local v114 = v_u_5[v112][v109[v110 .. v112].Value][1]
            table.insert(v111, v114)
        end
    end
    if p107 then
        v111[1] = v111[1] * 2
        v111[2] = v111[2] * 2
        v111[4] = v111[4] * 2
    end
    return v111
end
return v_u_5

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.UnlockFloorFunctions
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage"):WaitForChild("AllModules")
local v_u_3 = require(v2.Friends.ImprovedIsFriendWith)
local v_u_4 = require(v2.GetClonePrice)
return {
    ["CommunityAccess"] = function(p5)
        local v6, v7 = pcall(p5.IsInGroup, p5, 34430086)
        return v6 and v7
    end,
    ["PaidAccess"] = function(p8, p9)
        return p9 <= p8.leaderstats.Cash.Value
    end,
    ["GiftAccess"] = function(p10)
        local v11 = p10.Stats.Kills
        return v11["Red santa zombie"].Value + v11["Cyan santa zombie"].Value >= 10
    end,
    ["LaserAccess"] = function(p12)
        return p12.Stats.LaserDoorDamage.Value >= 500
    end,
    ["FriendAccess"] = function(p13)
        -- upvalues: (copy) v_u_1, (copy) v_u_3
        for _, v14 in pairs(v_u_1:GetPlayers()) do
            if v14 ~= p13 and v_u_3(p13, v14.UserId) then
                return true
            end
        end
        return false
    end,
    ["QuestAccess"] = function(p15)
        return p15.Stats.DailyQuest.TotalDailyQuestCompleted.Value >= 3
    end,
    ["CodeAccess"] = function(p16)
        return p16.Stats.CodesUsed.Value >= 4
    end,
    ["KeyAccess"] = function(p17)
        return p17.Stats.Keys:GetAttribute("Total") >= 5
    end,
    ["HPAccess"] = function(p18)
        return p18.Stats.MedkitLevel.Value >= 10
    end,
    ["CrateAccess"] = function(p19)
        return p19.Stats.Crates:GetAttribute("Total") >= 25
    end,
    ["CloneAccess"] = function(p20, p21)
        -- upvalues: (copy) v_u_4
        return p21 < v_u_4(p20)
    end,
    ["SpinAccess"] = function(p22)
        return p22.Stats.DailySpinStats.TotalDailySpin.Value >= 5
    end,
    ["ZombieAccess"] = function(p23)
        local v24 = 0
        for _, v25 in pairs(p23.Stats.Kills:GetChildren()) do
            v24 = v24 + v25.Value
            if v24 >= 10 then
                return true
            end
        end
        if v24 >= 10 then
            return true
        end
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.StatsRewards
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.AllModules.CratesValueModule).GetCrateReward
local v_u_3 = require(v1.AllModules.ConvertVal).RoundValueWithNonZeroDigit
local v_u_4 = {
    { 5, 10 },
    { 15, 30 },
    { 50, 80 },
    { 100, 130 },
    { 175, 150 },
    { 250, 165 },
    { 500, 200 },
    { 750, 250 },
    { 1500, 400 },
    { 2500, 500 }
}
local v5 = #v_u_4
local v6 = v_u_4[v5 - 1][1]
local v7 = {
    {
        5,
        25,
        50,
        100,
        175,
        250,
        500,
        750,
        1500,
        2500
    },
    {
        1500,
        25000,
        80000,
        200000,
        500000,
        1000000,
        3000000,
        10000000,
        50000000,
        125000000
    }
}
local v8 = {
    {
        2,
        5,
        10,
        25,
        40,
        75,
        125,
        200,
        400
    },
    {
        10000,
        100000,
        250000,
        1000000,
        10000000,
        40000000,
        175000000,
        250000000,
        500000000
    }
}
while true do
    LastMaxValue = v_u_4[v5][1]
    local v9 = v_u_3(LastMaxValue + 1.1 * (LastMaxValue - v6), 3)
    table.insert(v_u_4, { v9, 500 })
    if v9 >= 1000000 then
        break
    end
    v6 = LastMaxValue
    v5 = v5 + 1
end
local v_u_10 = {
    ["infinity crate"] = {
        ["IsCrateStats"] = true,
        ["ShowOnlyIfMoreThan0"] = true
    },
    ["absolute infinity crate"] = {
        ["IsCrateStats"] = true,
        ["ShowOnlyIfMoreThan0"] = true
    },
    ["terminusfinity crate"] = {
        ["IsCrateStats"] = true,
        ["ShowOnlyIfMoreThan0"] = true
    },
    ["summer crate"] = {
        ["IsCrateStats"] = true
    },
    ["green easter crate"] = {
        ["IsCrateStats"] = true
    },
    ["red easter crate"] = {
        ["IsCrateStats"] = true
    },
    ["4th of july crate"] = {
        ["IsCrateStats"] = true
    },
    ["halloween crate"] = {
        ["IsCrateStats"] = true
    },
    ["thanksgiving crate"] = {
        ["IsCrateStats"] = true
    },
    ["red gift crate"] = {
        ["IsCrateStats"] = true
    },
    ["cyan gift crate"] = {
        ["IsCrateStats"] = true
    },
    ["winter crate"] = {
        ["IsCrateStats"] = true
    },
    ["frozen crate"] = {
        ["IsCrateStats"] = true
    },
    ["valentine crate"] = {
        ["IsCrateStats"] = true
    },
    ["flower crate"] = {
        ["IsCrateStats"] = true
    },
    ["wooden crate"] = {
        v7[1],
        v7[2],
        {
            2127610320,
            2127628020,
            2127628033,
            2127654128,
            2127654150,
            2127695778,
            2127695788,
            2127740652,
            2127810712,
            2128142208
        }
    },
    ["stone crate"] = {
        {
            5,
            20,
            40,
            80,
            125,
            200,
            500,
            1000,
            2000
        },
        {
            3000,
            50000,
            160000,
            400000,
            1000000,
            5000000,
            20000000,
            75000000,
            200000000
        },
        {
            2127611203,
            2127628038,
            2127654159,
            2127695797,
            2127719441,
            2127740661,
            2127772850,
            2127810705,
            2128142206
        }
    },
    ["silver crate"] = {
        {
            3,
            10,
            25,
            50,
            75,
            125,
            200,
            500,
            1000
        },
        {
            5000,
            60000,
            200000,
            700000,
            1500000,
            3000000,
            25000000,
            125000000,
            350000000
        },
        {
            2127612021,
            2127628044,
            2127654172,
            2127695803,
            2127719433,
            2127740676,
            2127772839,
            2127810700,
            2128142203
        }
    },
    ["golden crate"] = {
        v8[1],
        v8[2],
        {
            2127612031,
            2127628058,
            2127654179,
            2127695809,
            2127719420,
            2127740689,
            2127772835,
            2127810698,
            2128142199
        }
    },
    ["diamond crate"] = {
        {
            1,
            3,
            5,
            8,
            12,
            20,
            40
        },
        {
            50000,
            500000,
            2000000,
            4000000,
            20000000,
            90000000,
            140000000
        },
        {
            2127612035,
            2127719403,
            2127719410,
            2127740697,
            2127772833,
            2127810696,
            2128142195
        }
    },
    ["Level"] = {
        {
            2,
            5,
            10,
            17,
            25,
            35,
            50,
            60,
            75,
            90,
            100,
            120,
            140,
            160,
            180,
            200,
            240,
            280,
            320,
            360,
            400,
            450,
            500
        },
        {}
    },
    ["CodesUsed"] = {
        {
            5,
            15,
            30,
            50,
            100,
            200,
            400,
            600,
            800,
            1000,
            1250,
            1500,
            1750,
            2000,
            2300,
            2600,
            3000
        },
        {}
    },
    ["Kills"] = {
        {
            2,
            5,
            15,
            35,
            75,
            125,
            250,
            500,
            1000,
            1750,
            2500,
            5000,
            7500
        },
        {
            5000,
            15000,
            60000,
            800000,
            3000000,
            5000000,
            15000000,
            50000000,
            175000000,
            300000000,
            450000000,
            750000000,
            1250000000
        }
    },
    ["Playtime"] = {
        {
            600,
            1800,
            3600,
            7200,
            14400,
            36000,
            54000,
            86400,
            129600,
            172800,
            259200,
            345600,
            432000,
            518400,
            604800,
            864000
        },
        {
            15000,
            50000,
            400000,
            1000000,
            2000000,
            5000000,
            25000000,
            50000000,
            175000000,
            350000000,
            475000000,
            600000000,
            1000000000,
            1250000000,
            1750000000,
            10000000000
        }
    }
}
for v11 = 1, 100 do
    local v12 = v_u_10.Level[1]
    local v13 = 500 + 50 * v11
    table.insert(v12, v13)
end
for v14, _ in pairs(v_u_10.Level[1]) do
    local v15 = v_u_10.Level[2]
    local v16 = v14 % 5 == 0 and "ButtonTicket_1" or "DropperTicket_1"
    table.insert(v15, v16)
end
for v17 = 1, 100 do
    local v18 = v_u_10.CodesUsed[1]
    local v19 = 3000 + 500 * v17
    table.insert(v18, v19)
end
for v20, _ in pairs(v_u_10.CodesUsed[1]) do
    local v21 = v_u_10.CodesUsed[2]
    local v22 = v20 % 5 == 0 and "ButtonTicket_1" or "DropperTicket_" .. (v20 >= 10 and 2 or 1)
    table.insert(v21, v22)
end
return {
    ["AllStatsReward"] = v_u_10,
    ["GetStatsInfoFor"] = function(p23, p24, p25, p26)
        -- upvalues: (copy) v_u_10, (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
        if v_u_10[p24].IsCrateStats then
            local v27 = nil
            local v28 = nil
            for _, v29 in pairs(v_u_4) do
                if p25 == v29[1] then
                    v28 = v29[1]
                    v27 = v29[2]
                    break
                end
                if p25 < v29[1] then
                    if p26 then
                        v27 = v29[2]
                        v28 = v29[1]
                    end
                    break
                end
            end
            if v27 then
                v27 = v_u_3(v_u_2(p23, p24) * v27, 2)
            end
            return v27, v28
        end
        local v30 = nil
        for v31, v32 in pairs(v_u_10[p24][1]) do
            if p25 == v32 then
                v30 = v31
                break
            end
            if p25 < v32 then
                if p26 then
                    v30 = v31
                end
                break
            end
        end
        if v30 then
            local v33 = v_u_10[p24][2][v30]
            local v34 = v_u_10[p24][1][v30]
            local v35 = v_u_10[p24][3]
            if v35 then
                v35 = v_u_10[p24][3][v30]
            end
            return v33, v34, v35
        end
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.GetRandomFromList
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local function v_u_16(p1, p2, p3)
    local v4 = p1 - p2
    local v5 = p3 * math.min(v4, 0)
    local v6 = -math.exp(v5)
    local v7 = -p3 * p2
    local v8 = v6 + math.exp(v7)
    local v9 = -p3
    local v10 = p1 - p2
    local v11 = v9 * math.max(v10, 0)
    local v12 = v8 + math.exp(v11) - 1
    local v13 = -p3 * p2
    local v14 = math.exp(v13)
    local v15 = -p3 * (1 - p2)
    return v12 / (v14 + math.exp(v15) - 2)
end
local v_u_17 = Random.new()
function GetRandomFromList(p18, p19, p20)
    -- upvalues: (copy) v_u_17, (copy) v_u_16
    local v21 = math.clamp(p19 or 0.5, 0, 1)
    local v22 = v_u_17:NextNumber()
    local v23 = #p18
    local v24 = 1
    local v25 = p20 or 1
    while v_u_16(v24 / v23, v21, v25) < v22 do
        v24 = v24 + 1
        if v23 <= v24 then
            break
        end
    end
    return p18[v24]
end
return GetRandomFromList

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ImageFromName
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {
    ["wooden crate"] = {
        ["Image"] = "rbxassetid://10339105771"
    },
    ["stone crate"] = {
        ["Image"] = "rbxassetid://10339107064"
    },
    ["silver crate"] = {
        ["Image"] = "rbxassetid://10339108265"
    },
    ["golden crate"] = {
        ["Image"] = "rbxassetid://10649632786"
    },
    ["diamond crate"] = {
        ["Image"] = "rbxassetid://10339111239"
    },
    ["winter crate"] = {
        ["Image"] = "http://www.roblox.com/asset/?id=15756930443"
    },
    ["frozen crate"] = {
        ["Image"] = "rbxassetid://15756936746"
    },
    ["summer crate"] = {
        ["Image"] = "rbxassetid://18299682687"
    },
    ["halloween crate"] = {
        ["Image"] = "rbxassetid://14917056720"
    },
    ["red gift crate"] = {
        ["Image"] = "rbxassetid://15475574394"
    },
    ["cyan gift crate"] = {
        ["Image"] = "rbxassetid://15475578896"
    },
    ["green easter crate"] = {
        ["Image"] = "rbxassetid://81882754152456"
    },
    ["red easter crate"] = {
        ["Image"] = "rbxassetid://140640897078237"
    },
    ["infinity crate"] = {
        ["Image"] = "rbxassetid://78256958614925"
    },
    ["4th of july crate"] = {
        ["Image"] = "rbxassetid://101995560644968"
    },
    ["absolute infinity crate"] = {
        ["Image"] = "rbxassetid://135767922671208"
    },
    ["thanksgiving crate"] = {
        ["Image"] = "rbxassetid://134369743269742"
    },
    ["terminusfinity crate"] = {
        ["Image"] = "rbxassetid://127173583767868"
    },
    ["valentine crate"] = {
        ["Image"] = "rbxassetid://101317437029147"
    },
    ["flower crate"] = {
        ["Image"] = "rbxassetid://128953406441868"
    },
    ["wooden key"] = {
        ["Image"] = "rbxassetid://126650741806605"
    },
    ["stone key"] = {
        ["Image"] = "rbxassetid://110776126157087"
    },
    ["silver key"] = {
        ["Image"] = "rbxassetid://135230583191095"
    },
    ["golden key"] = {
        ["Image"] = "rbxassetid://112738330915522"
    },
    ["diamond key"] = {
        ["Image"] = "rbxassetid://117588288388076"
    },
    ["winter key"] = {
        ["Image"] = "rbxassetid://15759713568"
    },
    ["halloween key"] = {
        ["Image"] = "rbxassetid://88380499178182"
    },
    ["red christmas key"] = {
        ["Image"] = "rbxassetid://102187901508056"
    },
    ["green easter key"] = {
        ["Image"] = "rbxassetid://125341320676293"
    },
    ["infinity key"] = {
        ["Image"] = "rbxassetid://108389440063881"
    },
    ["absolute infinity key"] = {
        ["Image"] = "rbxassetid://86243964822883"
    },
    ["cyan christmas key"] = {
        ["Image"] = "rbxassetid://130118007056172"
    },
    ["terminusfinity key"] = {
        ["Image"] = "rbxassetid://101109842564979"
    },
    ["frozen key"] = {
        ["Image"] = "rbxassetid://89636581576227"
    },
    ["coin_VerySmall"] = {
        ["Image"] = "http://www.roblox.com/asset/?id=10320517904",
        ["SizeFactor"] = 0.5
    },
    ["coin_Small"] = {
        ["Image"] = "rbxassetid://10320520003",
        ["AspectRatio"] = 1.207,
        ["SizeFactor"] = 0.6
    },
    ["coin_Medium"] = {
        ["Image"] = "rbxassetid://10320524148",
        ["AspectRatio"] = 1.25,
        ["SizeFactor"] = 0.6
    },
    ["coin_Large"] = {
        ["Image"] = "rbxassetid://10320526707",
        ["AspectRatio"] = 1.0729,
        ["SizeFactor"] = 0.8
    },
    ["coin_Huge"] = {
        ["Image"] = "rbxassetid://13551440042",
        ["AspectRatio"] = 0.7778,
        ["SizeFactor"] = 0.8
    },
    ["coin_Popular"] = {
        ["Image"] = "rbxassetid://13551440042",
        ["AspectRatio"] = 0.7778
    },
    ["coin_BestDeal"] = {
        ["Image"] = "rbxassetid://17300756798"
    },
    ["bomb"] = {
        ["Image"] = "rbxassetid://5834510027"
    },
    ["Kills"] = {
        ["Image"] = "rbxassetid://14029997290"
    },
    ["respin"] = {
        ["Image"] = "rbxassetid://13696857957"
    },
    ["TotalDailySpin"] = {
        ["Image"] = "rbxassetid://13696857957"
    },
    ["Playtime"] = {
        ["Image"] = "rbxassetid://10648364883"
    },
    ["DropperTicket"] = {
        ["Image"] = "rbxassetid://112264428587378",
        ["AspectRatio"] = 1.85,
        ["SizeFactor"] = 0.8
    },
    ["ButtonTicket"] = {
        ["Image"] = "rbxassetid://107022843993091",
        ["AspectRatio"] = 1.85,
        ["SizeFactor"] = 0.8
    },
    ["Level"] = {
        ["Image"] = "http://www.roblox.com/asset/?id=9260379880"
    },
    ["ChristmasBells"] = {
        ["Image"] = "rbxassetid://15571134957"
    },
    ["CodesUsed"] = {
        ["Image"] = "rbxassetid://13917098514"
    },
    ["WinterEvent"] = {
        ["Image"] = "rbxassetid://135802927406931"
    },
    ["ValentineEvent"] = {
        ["Image"] = "rbxassetid://136419455864586"
    },
    ["ChristmasEvent"] = {
        ["Image"] = "rbxassetid://89227438069601"
    },
    ["ThanksgivingEvent"] = {
        ["Image"] = "rbxassetid://128526057801520"
    },
    ["4thOfJulyEvent"] = {
        ["Image"] = "rbxassetid://70435361883631"
    },
    ["EasterEvent"] = {
        ["Image"] = "rbxassetid://103053102324477"
    },
    ["SpringEvent"] = {
        ["Image"] = "rbxassetid://87689256115340"
    }
}
local v2 = {
    ["Speed potion"] = {
        ["Image"] = "rbxassetid://13836273037"
    },
    ["Size potion"] = {
        ["Image"] = "rbxassetid://13836279363"
    },
    ["Wooden AK-47"] = {
        ["Image"] = "rbxassetid://13952865474"
    },
    ["Stone AK-47"] = {
        ["Image"] = "rbxassetid://13952863469"
    },
    ["Silver AK-47"] = {
        ["Image"] = "rbxassetid://13952861680"
    },
    ["Golden AK-47"] = {
        ["Image"] = "rbxassetid://13952859825"
    },
    ["Diamond AK-47"] = {
        ["Image"] = "rbxassetid://13952858696"
    },
    ["Spring hand"] = {
        ["Image"] = "http://www.roblox.com/asset/?id=10650408836"
    },
    ["Stone M9"] = {
        ["Image"] = "rbxassetid://13952055329"
    },
    ["Punch"] = {
        ["Image"] = "http://www.roblox.com/asset?id=180620809"
    },
    ["Mine"] = {
        ["Image"] = "http://www.roblox.com/asset/?id=10650219968"
    },
    ["wooden key"] = {
        ["Image"] = "rbxassetid://14715875143"
    },
    ["Pumpkin launcher"] = {
        ["Image"] = "rbxassetid://15004283118"
    },
    ["Fireball"] = {
        ["Image"] = "http://www.roblox.com/asset/?id=571342640"
    },
    ["Wooden stick"] = {
        ["Image"] = "http://www.roblox.com/asset/?id=5405625405"
    },
    ["Sword"] = {
        ["Image"] = "http://www.roblox.com/asset/?id=3197769392"
    },
    ["Ice spike cannon"] = {
        ["Image"] = "rbxassetid://123811179235471"
    },
    ["Silver M9"] = {
        ["Image"] = "http://www.roblox.com/asset/?id=9826863711"
    },
    ["Diamond M9"] = {
        ["Image"] = "http://www.roblox.com/asset/?id=9826866794"
    },
    ["Mega punch"] = {
        ["Image"] = "rbxassetid://14029764901"
    },
    ["Water gun"] = {
        ["Image"] = "rbxassetid://18292799598"
    },
    ["Extra cannon"] = {
        ["Image"] = "rbxassetid://78044004607150"
    },
    ["Candy cane"] = {
        ["Image"] = "rbxassetid://11752147027"
    },
    ["Snowball"] = {
        ["Image"] = "rbxassetid://311313250"
    },
    ["Medkit"] = {
        ["Image"] = "rbxassetid://13888579862"
    },
    ["Jump potion"] = {
        ["Image"] = "http://www.roblox.com/asset/?id=5744488965"
    },
    ["Wooden M9"] = {
        ["Image"] = "rbxassetid://13952052992"
    },
    ["Golden M9"] = {
        ["Image"] = "rbxassetid://9826865170"
    },
    ["Minigun"] = {
        ["Image"] = "rbxassetid://122255653064812"
    },
    ["Egg cannon"] = {
        ["Image"] = "rbxassetid://105172546095967"
    },
    ["P-Knocker"] = {
        ["Image"] = "rbxassetid://128956491186705"
    },
    ["Cube cannon"] = {
        ["Image"] = "rbxassetid://76931472645720"
    },
    ["Sunflower"] = {
        ["Image"] = "rbxassetid://104465994733045"
    },
    ["Billionaire cannon"] = {
        ["Image"] = "rbxassetid://139769302214535"
    },
    ["Friend baton"] = {
        ["Image"] = "rbxassetid://70625650383950"
    },
    ["Millionaire cannon"] = {
        ["Image"] = "rbxassetid://125860709967177"
    },
    ["Refiller"] = {
        ["Image"] = "rbxassetid://108159434055753"
    },
    ["Code mace"] = {
        ["Image"] = "rbxassetid://112761168778648"
    },
    ["Twin keys"] = {
        ["Image"] = "rbxassetid://136359092952767"
    },
    ["Clone healer"] = {
        ["Image"] = "rbxassetid://80556769819414"
    },
    ["Greedy clone cannon"] = {
        ["Image"] = "rbxassetid://115067831768241"
    },
    ["Firework cannon"] = {
        ["Image"] = "rbxassetid://80945069113224"
    },
    ["Healing bubble launcher"] = {
        ["Image"] = "rbxassetid://82992144892294"
    },
    ["Crate finder"] = {
        ["Image"] = "rbxassetid://117152175391389"
    },
    ["\206\169 laser"] = {
        ["Image"] = "rbxassetid://124663335662169"
    },
    ["Axe"] = {
        ["Image"] = "rbxassetid://81791526186759"
    },
    ["Spin wheel mace"] = {
        ["Image"] = "rbxassetid://81696932040310"
    },
    ["Turkey leg"] = {
        ["Image"] = "rbxassetid://84728606099753"
    },
    ["Zombieplicator"] = {
        ["Image"] = "rbxassetid://112530352651206"
    },
    ["Gift cannon"] = {
        ["Image"] = "rbxassetid://107069704506277"
    },
    ["Blizzard gun"] = {
        ["Image"] = "rbxassetid://119253987547007"
    },
    ["Laser barrier"] = {
        ["Image"] = "rbxassetid://128008271374569"
    },
    ["Heart cannon"] = {
        ["Image"] = "rbxassetid://82595091637762"
    }
}
v1.Tools = v2
return v1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolButtons
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage").AllModules
local v_u_3 = require(v2.KeyInputLabelMaker)
local v_u_4 = require(v2.InputManager)
local v5 = game.Players.LocalPlayer.PlayerGui:WaitForChild("MainGui")
local v6 = v5.GunFrame.FrameForButtons
local v_u_7 = v5.LowerFrameContainer.FrameForToolButtons
local v_u_8 = {
    ["DrinkBttn"] = v5.LowerFrameContainer.PotionFrame.DrinkBttn,
    ["SecondaryToolButton"] = v_u_7.SecondaryToolButton,
    ["MainToolButton"] = v_u_7.MainToolButton,
    ["ReloadBttn"] = v6.ReloadBttn,
    ["FireBttn"] = v6.FireBttn
}
local v_u_9 = Color3.new(1, 1, 1)
local v_u_10 = Color3.new(0.7, 0.7, 0.7)
local v_u_11 = Color3.new(1, 1, 1)
local v_u_12 = {}
local v_u_13 = {}
function ToggleKeyGamepadImage(p14, p15)
    -- upvalues: (copy) v_u_1, (copy) v_u_3
    local v16
    if p15 then
        v16 = v_u_1:GetImageForKeyCode(p15)
    else
        v16 = p15
    end
    if v16 then
        v16 = v16 ~= ""
    end
    if p14:FindFirstChild("GamepadInputFrame") or v16 then
        local v17 = v_u_3.ShowKeyInputImage(p14, p15, {
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
            ["Position"] = UDim2.fromScale(0.85, 0.85),
            ["Size"] = UDim2.fromScale(0.55, 0.55)
        }, "GamepadInputFrame")
        if v17 then
            v17.Visible = v16
        end
    end
end
function FullColorButton(p18, p19, p20)
    -- upvalues: (copy) v_u_10, (copy) v_u_9
    p18.ActionTitle.TextColor3 = p19
    local v21 = p20 and v_u_10 or v_u_9
    p18.ImageColor3 = v21
    p18.ActionIcon.ImageColor3 = v21
    local v22 = p18:FindFirstChild("GamepadInputFrame")
    if v22 then
        v22.InputImage.ImageColor3 = v21
    end
end
function v_u_13.EnableButton(p23, p24, p_u_25, p_u_26, p_u_27, p_u_28)
    -- upvalues: (copy) v_u_12, (copy) v_u_13, (copy) v_u_8, (copy) v_u_7, (copy) v_u_11, (copy) v_u_4, (copy) v_u_1
    if v_u_12[p23] then
        v_u_13.DisableButton(p23)
    end
    local v_u_29 = v_u_8[p23]
    if v_u_29 then
        v_u_29.Visible = true
        v_u_29.ActionIcon.Image = p24.Image or ""
        if p23 == "MainToolButton" or p23 == "SecondaryToolButton" then
            v_u_7.Visible = true
        end
        local v30 = p24.TextLabelSize or 0.8
        v_u_29.ActionTitle.Size = UDim2.fromScale(v30, v30)
        if p24.ImageSize then
            v_u_29.ActionIcon.Size = p24.ImageSize
        end
        local v31 = nil
        if p24.Text then
            v_u_29.ActionTitle.Text = p24.Text
            if p24.TextColor3 then
                v31 = p24.TextColor3
            end
        end
        local v_u_32 = v31 or v_u_11
        local v_u_33 = Color3.new(0.7 * v_u_32.R, 0.7 * v_u_32.G, 0.7 * v_u_32.B)
        local v34 = v_u_29.MouseEnter:Connect(function()
            -- upvalues: (copy) v_u_29, (copy) v_u_33
            FullColorButton(v_u_29, v_u_33, true)
        end)
        local v35 = v_u_29.MouseLeave:Connect(function()
            -- upvalues: (copy) v_u_29, (ref) v_u_32, (ref) v_u_4, (copy) p_u_27
            FullColorButton(v_u_29, v_u_32, false)
            if v_u_4.LastInputType == "Mobile" and p_u_27 then
                p_u_27()
            end
        end)
        local v36 = nil
        local v37 = nil
        local v38
        if p_u_26 then
            v38 = v_u_29.MouseButton1Down:Connect(p_u_26)
        else
            v38 = nil
        end
        if p_u_27 then
            v36 = v_u_29.MouseButton1Up:Connect(p_u_27)
        end
        if p_u_28 then
            v37 = v_u_29.Activated:Connect(p_u_28)
        end
        ToggleKeyGamepadImage(v_u_29, p_u_25)
        if p_u_25 and p_u_25 ~= Enum.KeyCode.Unknown then
            if v_u_1:IsKeyDown(p_u_25) then
                FullColorButton(v_u_29, v_u_33, true)
            else
                FullColorButton(v_u_29, v_u_32, false)
            end
            v_u_12[p23] = {
                v38,
                v36,
                v_u_1.InputBegan:Connect(function(p39, p40)
                    -- upvalues: (copy) p_u_25, (copy) v_u_29, (copy) v_u_33, (copy) p_u_26, (copy) p_u_28
                    if not p40 and p39.KeyCode == p_u_25 then
                        FullColorButton(v_u_29, v_u_33, true)
                        if p_u_26 then
                            p_u_26()
                        end
                        if p_u_28 then
                            p_u_28()
                        end
                    end
                end),
                v_u_1.InputEnded:Connect(function(p41, p42)
                    -- upvalues: (copy) p_u_25, (copy) v_u_29, (ref) v_u_32, (copy) p_u_27
                    if not p42 and p41.KeyCode == p_u_25 then
                        FullColorButton(v_u_29, v_u_32, false)
                        if p_u_27 then
                            p_u_27()
                        end
                    end
                end),
                v34,
                v35
            }
        else
            v_u_29.ActionTitle.TextColor3 = v_u_32
            v_u_12[p23] = {
                v38,
                v36,
                v37,
                v34,
                v35
            }
        end
        return v_u_29
    end
    warn("No button found for " .. p23)
end
function v_u_13.DisableButton(p43)
    -- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_12
    local v44 = v_u_8[p43]
    if v44 then
        if p43 == "MainToolButton" then
            if not v_u_8.SecondaryToolButton.Visible then
                v_u_7.Visible = false
            end
        elseif p43 == "SecondaryToolButton" and not v_u_8.MainToolButton.Visible then
            v_u_7.Visible = false
        end
        ToggleKeyGamepadImage(v44)
        v44.Visible = false
        v44.ActionIcon.Image = ""
        v44.ActionIcon.Size = UDim2.fromScale(0.7, 0.7)
        v44.ActionTitle.Text = ""
        if v_u_12[p43] then
            for _, v45 in pairs(v_u_12[p43]) do
                v45:Disconnect()
            end
        end
        v_u_12[p43] = nil
    else
        warn("No button found for " .. p43)
    end
end
function v_u_13.AddToolButton(p46)
    -- upvalues: (copy) v_u_8
    if not v_u_8[p46.Name] then
        v_u_8[p46.Name] = p46
    end
end
return v_u_13

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.WeaponStats
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = nil
local v6 = {
    ["AccuracyReferenceDist"] = 1000,
    ["Wooden M9"] = {
        ["AnimationType"] = "M9",
        ["Damages"] = 13,
        ["Headshot"] = 19,
        ["FiringDelay"] = 0.77,
        ["ReloadTime"] = 3.3,
        ["MaxAmmo"] = 12,
        ["BotAccuracy"] = 12,
        ["Speed"] = 400
    },
    ["Stone M9"] = {
        ["AnimationType"] = "M9",
        ["Damages"] = 15,
        ["Headshot"] = 22,
        ["FiringDelay"] = 0.7,
        ["ReloadTime"] = 3,
        ["MaxAmmo"] = 15,
        ["BotAccuracy"] = 10,
        ["Speed"] = 425
    },
    ["Silver M9"] = {
        ["AnimationType"] = "M9",
        ["Damages"] = 18,
        ["Headshot"] = 27,
        ["FiringDelay"] = 0.55,
        ["ReloadTime"] = 2.7,
        ["MaxAmmo"] = 18,
        ["BotAccuracy"] = 7,
        ["Speed"] = 450
    },
    ["Golden M9"] = {
        ["AnimationType"] = "M9",
        ["Damages"] = 22,
        ["Headshot"] = 33,
        ["FiringDelay"] = 0.45,
        ["ReloadTime"] = 2.3,
        ["MaxAmmo"] = 21,
        ["BotAccuracy"] = 4,
        ["Speed"] = 475
    },
    ["Diamond M9"] = {
        ["AnimationType"] = "M9",
        ["Damages"] = 25,
        ["Headshot"] = 37,
        ["FiringDelay"] = 0.35,
        ["ReloadTime"] = 2,
        ["MaxAmmo"] = 25,
        ["BotAccuracy"] = 3,
        ["Speed"] = 500
    },
    ["Wooden AK-47"] = {
        ["AnimationType"] = "AK",
        ["Damages"] = 15,
        ["Headshot"] = 25,
        ["AutomaticFire"] = true,
        ["FiringDelay"] = 0.2,
        ["ReloadTime"] = 2.8,
        ["MaxAmmo"] = 30,
        ["BotAccuracy"] = 7,
        ["Speed"] = 400
    },
    ["Stone AK-47"] = {
        ["AnimationType"] = "AK",
        ["Damages"] = 18,
        ["Headshot"] = 30,
        ["AutomaticFire"] = true,
        ["FiringDelay"] = 0.175,
        ["ReloadTime"] = 2.5,
        ["MaxAmmo"] = 35,
        ["BotAccuracy"] = 5.5,
        ["Speed"] = 425
    },
    ["Silver AK-47"] = {
        ["AnimationType"] = "AK",
        ["Damages"] = 22,
        ["Headshot"] = 37,
        ["AutomaticFire"] = true,
        ["FiringDelay"] = 0.15,
        ["ReloadTime"] = 2.25,
        ["MaxAmmo"] = 40,
        ["BotAccuracy"] = 4.5,
        ["Speed"] = 450
    },
    ["Golden AK-47"] = {
        ["AnimationType"] = "AK",
        ["Damages"] = 26,
        ["Headshot"] = 44,
        ["AutomaticFire"] = true,
        ["FiringDelay"] = 0.125,
        ["ReloadTime"] = 2.1,
        ["MaxAmmo"] = 45,
        ["BotAccuracy"] = 3.5,
        ["Speed"] = 475
    },
    ["Diamond AK-47"] = {
        ["AnimationType"] = "AK",
        ["Damages"] = 30,
        ["Headshot"] = 51,
        ["AutomaticFire"] = true,
        ["FiringDelay"] = 0.1,
        ["ReloadTime"] = 1.9,
        ["MaxAmmo"] = 50,
        ["BotAccuracy"] = 2.5,
        ["Speed"] = 500
    },
    ["Wooden shotgun"] = {
        ["AnimationType"] = "Shotgun",
        ["Damages"] = 22,
        ["NumBullets"] = 5,
        ["Headshot"] = 32,
        ["FiringDelay"] = 1,
        ["ReloadTime"] = 3,
        ["MaxAmmo"] = 5,
        ["SpreadAccuracy"] = 90,
        ["BotAccuracy"] = 8,
        ["Speed"] = 300
    },
    ["Stone shotgun"] = {
        ["AnimationType"] = "Shotgun",
        ["Damages"] = 22,
        ["NumBullets"] = 6,
        ["Headshot"] = 32,
        ["FiringDelay"] = 0.9,
        ["ReloadTime"] = 2.75,
        ["MaxAmmo"] = 6,
        ["SpreadAccuracy"] = 85,
        ["BotAccuracy"] = 7,
        ["Speed"] = 325
    },
    ["Silver shotgun"] = {
        ["AnimationType"] = "Shotgun",
        ["Damages"] = 22,
        ["NumBullets"] = 7,
        ["Headshot"] = 32,
        ["FiringDelay"] = 0.8,
        ["ReloadTime"] = 2.5,
        ["MaxAmmo"] = 6,
        ["SpreadAccuracy"] = 80,
        ["BotAccuracy"] = 8,
        ["Speed"] = 350
    },
    ["Golden shotgun"] = {
        ["AnimationType"] = "Shotgun",
        ["Damages"] = 22,
        ["NumBullets"] = 8,
        ["Headshot"] = 32,
        ["FiringDelay"] = 0.7,
        ["ReloadTime"] = 2.25,
        ["MaxAmmo"] = 8,
        ["SpreadAccuracy"] = 75,
        ["BotAccuracy"] = 5,
        ["Speed"] = 375
    },
    ["Diamond shotgun"] = {
        ["AnimationType"] = "Shotgun",
        ["Damages"] = 22,
        ["NumBullets"] = 10,
        ["Headshot"] = 32,
        ["FiringDelay"] = 0.6,
        ["ReloadTime"] = 2,
        ["MaxAmmo"] = 10,
        ["SpreadAccuracy"] = 70,
        ["BotAccuracy"] = 4,
        ["Speed"] = 400
    },
    ["Minigun"] = {
        ["AnimationType"] = "Minigun",
        ["AutomaticFire"] = true,
        ["FiringDelay"] = 0.04,
        ["BotAccuracy"] = 5,
        ["ReloadTime"] = 3,
        ["Headshot"] = 35,
        ["MaxAmmo"] = 200,
        ["Damages"] = 22,
        ["Speed"] = 550
    },
    ["Water gun"] = {
        ["Damages"] = 9,
        ["Headshot"] = 12,
        ["FiringDelay"] = 0.1,
        ["MaxAmmo"] = (1 / 0)
    },
    ["Green laser"] = {
        ["Damages"] = 7,
        ["Headshot"] = 10,
        ["FiringDelay"] = 0.1,
        ["MaxAmmo"] = (1 / 0)
    },
    ["\206\169 laser"] = {
        ["Damages"] = 22,
        ["Headshot"] = 26,
        ["FiringDelay"] = 0.1,
        ["MaxAmmo"] = (1 / 0),
        ["MaxCharge"] = 5,
        ["MinCharge"] = 1,
        ["ChargeRate"] = 0.5,
        ["BotAccuracy"] = 5,
        ["GetChargeForTime"] = function(p2)
            -- upvalues: (ref) v_u_1
            local v3 = v_u_1["\206\169 laser"].MinCharge + p2 * v_u_1["\206\169 laser"].ChargeRate
            local v4 = v_u_1["\206\169 laser"].MinCharge
            local v5 = v_u_1["\206\169 laser"].MaxCharge
            return math.clamp(v3, v4, v5)
        end
    },
    ["Blizzard gun"] = {
        ["AnimationType"] = "NormalCannon",
        ["Damages"] = 3,
        ["Headshot"] = 3,
        ["FiringDelay"] = 0.1,
        ["MaxAmmo"] = (1 / 0),
        ["Angle"] = 25,
        ["Range"] = 35,
        ["FreezeAmount"] = 2,
        ["MaxFreeze"] = 70
    },
    ["Punch"] = {
        ["Damages"] = 15,
        ["FiringDelay"] = 0.8
    },
    ["Mega punch"] = {
        ["Damages"] = 50,
        ["FiringDelay"] = 0.8
    },
    ["Wooden stick"] = {
        ["Damages"] = 10,
        ["FiringDelay"] = 1
    },
    ["Sword"] = {
        ["Damages"] = 13,
        ["FiringDelay"] = 0.7
    }
}
local v13 = {
    ["StatsAndRequirement"] = {
        ["KillRequired"] = { 5, 8, 25 },
        ["KillName"] = { "Red santa zombie", "Cyan santa zombie", "Cyan santa zombie" },
        ["UpgradeName"] = { "shiny", "cyan", "shiny cyan" }
    },
    ["GetCurrentLevelAndNextLevel"] = function(p7)
        -- upvalues: (ref) v_u_1
        local v8 = p7.Stats.Kills
        local v9 = v_u_1["Candy cane"].StatsAndRequirement
        for v10, v11 in pairs(v9.KillRequired) do
            local v12 = v9.KillName[v10]
            if v8[v12].Value < v11 then
                return "Lvl" .. v10 - 1, v11, v12, v9.UpgradeName[v10]
            end
        end
        return "Lvl" .. #v9.KillRequired
    end,
    ["Lvl0"] = {
        ["FiringDelay"] = 0.85,
        ["PrctRegen"] = 10,
        ["Damages"] = 60
    },
    ["Lvl1"] = {
        ["FiringDelay"] = 0.75,
        ["PrctRegen"] = 13,
        ["Damages"] = 85
    },
    ["Lvl2"] = {
        ["FiringDelay"] = 0.625,
        ["PrctRegen"] = 16,
        ["Damages"] = 130
    },
    ["Lvl3"] = {
        ["FiringDelay"] = 0.475,
        ["PrctRegen"] = 20,
        ["Damages"] = 225
    }
}
v6["Candy cane"] = v13
v6["P-Knocker"] = {
    ["Damages"] = 60,
    ["FiringDelay"] = 0.65
}
v6.Sunflower = {
    ["Damages"] = 70,
    ["FiringDelay"] = 0.4
}
local v14 = {
    ["Damages"] = 30,
    ["FiringDelay"] = 0.5,
    ["1_friend"] = {
        ["Damages"] = 45
    },
    ["2_friend"] = {
        ["Damages"] = 60
    },
    ["3_friend"] = {
        ["Damages"] = 80
    },
    ["4_friend"] = {
        ["Damages"] = 100
    },
    ["5_friend"] = {
        ["Damages"] = 130
    }
}
v6["Friend baton"] = v14
v6.Badge = {
    ["Damages"] = 18,
    ["FiringDelay"] = 0.4
}
v6.Refiller = {
    ["Damages"] = 50,
    ["FiringDelay"] = 0.45
}
v6["Code mace"] = {
    ["Damages"] = 40,
    ["FiringDelay"] = 0.55,
    ["DmgIcrement"] = 10
}
v6["Clone healer"] = {
    ["Damages"] = 25,
    ["FiringDelay"] = 0.35
}
v6.Axe = {
    ["Damages"] = 50,
    ["FiringDelay"] = 0.8
}
local v15 = {
    ["Damages"] = 50,
    ["FiringDelay"] = 0.7,
    ["ModeList"] = {
        "Coin1",
        "Normal1",
        "Damage1",
        "Coin2",
        "Blue",
        "Coin3",
        "Damage2",
        "Normal2"
    },
    ["Damage1"] = {
        ["Damages"] = 100
    },
    ["Damage2"] = {
        ["Damages"] = 100
    },
    ["Blue"] = {
        ["Damages"] = 200,
        ["HitIncome"] = 12000
    },
    ["Coin1"] = {
        ["HitIncome"] = 6000
    },
    ["Coin2"] = {
        ["HitIncome"] = 6000
    },
    ["Coin3"] = {
        ["HitIncome"] = 6000
    }
}
v6["Spin wheel mace"] = v15
v6["Turkey leg"] = {
    ["Damages"] = 35,
    ["FiringDelay"] = 0.7,
    ["DamageBoostByEat"] = 50,
    ["DamageBoostDuration"] = 20
}
v6.Fireball = {
    ["Damages"] = 25,
    ["Headshot"] = 25,
    ["Speed"] = 55,
    ["FiringDelay"] = 0.6,
    ["MaxAmmo"] = 1
}
local v17 = {
    ["AnimationType"] = "SmallCannon",
    ["GetCurrentLevelAndNextLevel"] = function(p16)
        if p16 < 2 then
            return "", 2
        elseif p16 < 8 then
            return "Lvl1", 8
        elseif p16 < 25 then
            return "Lvl2", 25
        else
            return "Lvl3"
        end
    end,
    ["Damages"] = 45,
    ["Headshot"] = 50,
    ["Lvl1"] = {
        ["Damages"] = 65,
        ["Headshot"] = 70
    },
    ["Lvl2"] = {
        ["Damages"] = 100,
        ["Headshot"] = 120
    },
    ["Lvl3"] = {
        ["Damages"] = 150,
        ["Headshot"] = 175,
        ["Speed"] = 100
    },
    ["Speed"] = 85,
    ["FiringDelay"] = 0.8,
    ["MaxAmmo"] = 1
}
v6["Pumpkin launcher"] = v17
v6.Snowball = {
    ["Damages"] = 50,
    ["Headshot"] = 50,
    ["Speed"] = 70,
    ["FiringDelay"] = 0.5,
    ["MaxAmmo"] = 1,
    ["FreezeAmount"] = 1,
    ["MaxFreeze"] = 20
}
v6["Ice spike cannon"] = {
    ["Damages"] = 65,
    ["Headshot"] = 75,
    ["Speed"] = 100,
    ["FiringDelay"] = 0.33,
    ["MaxAmmo"] = 1,
    ["FreezeAmount"] = 2,
    ["MaxFreeze"] = 40
}
local v18 = {
    ["AnimationType"] = "SmallCannon",
    ["Damages"] = 40,
    ["Headshot"] = 50,
    ["Speed"] = 75,
    ["Blue"] = {
        ["Speed"] = 112.5
    },
    ["Yellow"] = {
        ["Damages"] = 60,
        ["Headshot"] = 72
    },
    ["Orange"] = {
        ["Damages"] = 80,
        ["Headshot"] = 100
    },
    ["Red"] = {
        ["Damages"] = 30,
        ["Headshot"] = 35
    },
    ["FiringDelay"] = 0.8,
    ["MaxAmmo"] = 1
}
v6["Egg cannon"] = v18
v6["Cube cannon"] = {
    ["AnimationType"] = "SmallCannon",
    ["Damages"] = 30,
    ["Headshot"] = 35,
    ["FiringDelay"] = 0.3,
    ["MaxAmmo"] = 1,
    ["Speed"] = 65
}
v6["Extra cannon"] = {
    ["AnimationType"] = "NormalCannon",
    ["Damages"] = 50,
    ["Headshot"] = 60,
    ["FiringDelay"] = 0.4,
    ["MaxAmmo"] = 1,
    ["Speed"] = 90
}
v6["Millionaire cannon"] = {
    ["LevelRequiredForEffect"] = 9,
    ["AnimationType"] = "NormalCannon",
    ["Damages"] = 30,
    ["Headshot"] = 35,
    ["FiringDelay"] = 0.5,
    ["HitIncome"] = 2500,
    ["MaxAmmo"] = 1,
    ["Speed"] = 90
}
v6["Billionaire cannon"] = {
    ["AnimationType"] = "BillionaireCannon",
    ["LevelRequiredForEffect"] = 300,
    ["Damages"] = 80,
    ["Headshot"] = 95,
    ["FiringDelay"] = 0.3,
    ["AutomaticFire"] = true,
    ["HitIncome"] = 10000,
    ["MaxAmmo"] = 1,
    ["Speed"] = 100
}
v6["Greedy clone cannon"] = {
    ["LevelRequiredForEffect"] = 600,
    ["AnimationType"] = "NormalCannon",
    ["Damages"] = 180,
    ["Headshot"] = 220,
    ["FiringDelay"] = 0.5,
    ["HitIncome"] = 70000,
    ["MaxAmmo"] = 1,
    ["Speed"] = 120
}
v6["Coconut cannon"] = {
    ["AnimationType"] = "NormalCannon",
    ["Damages"] = 75,
    ["Headshot"] = 85,
    ["FiringDelay"] = 0.44,
    ["MaxAmmo"] = 1,
    ["Speed"] = 80
}
v6["Firework cannon"] = {
    ["AnimationType"] = "NormalCannon",
    ["Damages"] = 80,
    ["Headshot"] = 95,
    ["FiringDelay"] = 1.1,
    ["MaxAmmo"] = 1,
    ["Speed"] = 70
}
v6["Healing bubble launcher"] = {
    ["AnimationType"] = "NormalCannon",
    ["Damages"] = 50,
    ["Headshot"] = 100,
    ["FiringDelay"] = 12,
    ["MaxAmmo"] = 1,
    ["Speed"] = 70
}
local v20 = {
    ["AnimationType"] = "SmallCannon",
    ["MaxAmmo"] = 1,
    ["GetCurrentLevelAndNextLevel"] = function(p19)
        if p19 < 30 then
            return "Red", 30
        else
            return "Cyan"
        end
    end,
    ["Red"] = {
        ["FiringDelay"] = 0.75,
        ["Headshot"] = 180,
        ["Damages"] = 110,
        ["Speed"] = 95
    },
    ["Cyan"] = {
        ["FiringDelay"] = 0.5,
        ["Headshot"] = 250,
        ["Damages"] = 200,
        ["Speed"] = 130
    }
}
v6["Gift cannon"] = v20
v6["Heart cannon"] = {
    ["AnimationType"] = "NormalCannon",
    ["Damages"] = 45,
    ["Headshot"] = 55,
    ["FiringDelay"] = 0.8,
    ["MaxAmmo"] = 1,
    ["Speed"] = 75
}
v6["Crate finder"] = {
    ["GetBonusForCrateStreak"] = function(p21)
        local v22 = p21 + 1
        local v23 = math.sqrt(v22) * 10
        return math.min(v23, 500)
    end
}
v6.Zombieplicator = {
    ["Cooldown"] = 300
}
v6["Twin keys"] = {
    ["UnlockWithNumberOfKeysFound"] = {
        0,
        0,
        100,
        1000
    }
}
v_u_1 = v6
v_u_1.MovingPartLifeTime = 15
v_u_1.BulletLifeTime = 5
return v_u_1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.MaterialBase
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = v_u_1.ForKeys
local v_u_3 = v_u_2.IceSpike
local v_u_4 = {
    {
        ["Size"] = Vector3.new(0.19664384, 0.6402724, 0.19664384),
        ["CF"] = CFrame.new(-0.0621212944, 0.274536967, 0.126591653, 0.640856385, 0.298836231, 0.707106769, -0.42261824, 0.906307817, 0, -0.640856385, -0.298836231, 0.707106769)
    },
    {
        ["Size"] = Vector3.new(0.19664384, 0.6402724, 0.19664384),
        ["CF"] = CFrame.new(0.188165441, 0.274536937, -0.123695083, 0.640856326, -0.298836231, 0.707106769, 0.42261827, 0.906307757, 0, -0.640856326, 0.298836231, 0.707106769)
    },
    {
        ["Size"] = Vector3.new(0.19664384, 0.6402724, 0.19664384),
        ["CF"] = CFrame.new(0.188165441, 0.274536967, 0.126591653, -0.640856385, -0.298836231, 0.707106769, -0.42261824, 0.906307817, 0, -0.640856385, -0.298836231, -0.707106769)
    },
    {
        ["Size"] = Vector3.new(0.19664384, 0.6402724, 0.19664384),
        ["CF"] = CFrame.new(-0.062121287, 0.274536937, -0.123695083, -0.640856326, 0.298836231, 0.707106769, 0.42261827, 0.906307757, 0, -0.640856326, 0.298836231, -0.707106769)
    },
    {
        ["Size"] = Vector3.new(0.14999999, 0.634, 0.14999999),
        ["CF"] = CFrame.new(0.138542503, -0.67759645, 0, 0.976296008, -0.21643962, 0, 0.21643962, 0.976296008, 0, 0, 0, 1)
    },
    {
        ["Size"] = Vector3.new(0.14999999, 0.484, 0.14999999),
        ["CF"] = CFrame.new(0.184808061, -0.227846891, 0, 0.936672151, -0.350207388, 0, 0.350207388, 0.936672151, 0, 0, 0, 1)
    },
    {
        ["Size"] = Vector3.new(0.14999999, 0.484, 0.14999999),
        ["CF"] = CFrame.new(-0.0650000051, -0.228, 0, 0.936672211, 0.350207388, 0, -0.350207388, 0.936672211, 0, 0, 0, 1)
    },
    {
        ["Size"] = Vector3.new(0.14999999, 0.484, 0.14999999),
        ["CF"] = CFrame.new(0.059904024, -0.228, -0.124904029, 0, 0, -1, -0.350207388, 0.936672211, 0, 0.936672211, 0.350207388, 0)
    },
    {
        ["Size"] = Vector3.new(0.14999999, 0.484, 0.14999999),
        ["CF"] = CFrame.new(0.059904024, -0.227846891, 0.124904037, 0, 0, -1, 0.350207388, 0.936672151, 0, 0.936672151, -0.350207388, 0)
    },
    {
        ["Size"] = Vector3.new(0.11214511, 0.474, 0.11214511),
        ["CF"] = CFrame.new(0.111227341, -1.14949274, 0, 0.986285567, -0.165047616, 0, 0.165047616, 0.986285567, 0, 0, 0, 1)
    },
    {
        ["Size"] = Vector3.new(0.09794953, 0.414, 0.09794953),
        ["CF"] = CFrame.new(0.0512273423, -0.86986208, -0.06030697, 1, 0, 0, 0, 0.981627166, -0.190809011, 0, 0.190809011, 0.981627166)
    },
    {
        ["Size"] = Vector3.new(0.09794953, 0.414, 0.09794953),
        ["CF"] = CFrame.new(0.050999999, -0.870000005, 0.0700000003, 1, 0, 0, 0, 0.981627166, 0.190809011, 0, -0.190809011, 0.981627166)
    },
    {
        ["Size"] = Vector3.new(0.10351239, 0.33400002, 0.10351239),
        ["CF"] = CFrame.new(-0.320766985, 0.777911782, 0, 0.258819044, 0.965925813, 0, -0.965925813, 0.258819044, 0, 0, 0, 1)
    },
    {
        ["Size"] = Vector3.new(0.10351239, 0.33400002, 0.10351239),
        ["CF"] = CFrame.new(0.442314476, 0.98237884, 0, 0.258819044, -0.965925813, 0, -0.965925813, -0.258819044, 0, 0, 0, -1)
    },
    {
        ["Size"] = Vector3.new(0.10351239, 0.33400002, 0.10351239),
        ["CF"] = CFrame.new(-0.320766926, 0.982378781, 0, -0.258819044, 0.965925813, 0, -0.965925813, -0.258819044, 0, 0, 0, 1)
    },
    {
        ["Size"] = Vector3.new(0.10351239, 0.33400002, 0.10351239),
        ["CF"] = CFrame.new(0.442314416, 0.777911782, 0, -0.258819044, -0.965925813, 0, -0.965925813, 0.258819044, 0, 0, 0, -1)
    },
    {
        ["Size"] = Vector3.new(0.10351239, 0.33400002, 0.10351239),
        ["CF"] = CFrame.new(-0.218533278, 0.600838184, 0, 0.707106769, 0.707106709, 0, -0.707106709, 0.707106769, 0, 0, 0, 1)
    },
    {
        ["Size"] = Vector3.new(0.10351239, 0.33400002, 0.10351239),
        ["CF"] = CFrame.new(0.340080976, 1.15945244, 0, 0.707106769, -0.707106709, 0, -0.707106709, -0.707106769, 0, 0, 0, -1)
    },
    {
        ["Size"] = Vector3.new(0.10351239, 0.33400002, 0.10351239),
        ["CF"] = CFrame.new(-0.218533278, 1.15945244, 0, -0.707106709, 0.707106769, 0, -0.707106769, -0.707106709, 0, 0, 0, 1)
    },
    {
        ["Size"] = Vector3.new(0.10351239, 0.33400002, 0.10351239),
        ["CF"] = CFrame.new(0.340081006, 0.600838184, 0, -0.707106709, -0.707106769, 0, -0.707106769, 0.707106709, 0, 0, 0, -1)
    }
}
local v_u_5 = {}
function MakeWeld(p6, p7, p8)
    local v9 = Instance.new("Weld", p7)
    v9.Part0 = p7
    v9.Part1 = p6
    if p8 then
        v9.C1 = p8
    end
    return v9
end
v_u_5.KeyAppearance = {
    ["wooden key"] = { Enum.Material.WoodPlanks, BrickColor.new("CGA brown").Color },
    ["stone key"] = { Enum.Material.Sandstone, BrickColor.new("Earth blue").Color },
    ["silver key"] = { Enum.Material.Metal, BrickColor.new("Silver").Color },
    ["golden key"] = { Enum.Material.Metal, BrickColor.new("Gold").Color },
    ["diamond key"] = { Enum.Material.Glass, BrickColor.new("Tr. Blue").Color },
    ["winter key"] = { Enum.Material.Glacier, BrickColor.new("Transparent").Color },
    ["halloween key"] = { Enum.Material.CorrodedMetal, BrickColor.new("Really black").Color, function(p10, p11)
            -- upvalues: (copy) v_u_1
            local v12 = v_u_1:WaitForChild("Tools"):WaitForChild("Pumpkin"):Clone()
            local v13 = p10.Size.Y / 2.312
            v12.Parent = p10
            local v14 = Instance.new("Weld", v12)
            if p11 then
                v12.Size = v13 * Vector3.new(1.056, 0.945, 0.918)
                v14.C1 = CFrame.new(0, 0.85 * v13, 0)
            else
                v12.Size = v13 * Vector3.new(0.776, 0.695, 0.675)
                v14.C1 = CFrame.new(v13 * 0.116, -v13 * 0.059, 0) * CFrame.Angles(0, 0, -5443.099053742821)
            end
            v14.Part0 = v12
            v14.Part1 = p10
        end },
    ["red christmas key"] = { Enum.Material.SmoothPlastic, BrickColor.new("Crimson").Color, function(p15, _, p16)
            local v17 = p15.Size.Y / 2.312
            local v18 = script.UpperGiftPart:Clone()
            v18.CanCollide = false
            v18.CanTouch = false
            v18.CanQuery = false
            v18.Size = v17 * Vector3.new(1.232, 0.383, 1.232)
            v18.Material = Enum.Material.SmoothPlastic
            v18.Color = p16 or Color3.new(1, 0.8, 0)
            v18.Massless = true
            v18.Parent = p15
            local v19 = Instance.new("Weld", v18)
            v19.C1 = CFrame.new(v17 * Vector3.new(0.35, -0.15, 0)) * CFrame.Angles(0.7853981633974483, 0, -1.5707963267948966)
            v19.Part0 = v18
            v19.Part1 = p15
            local v20 = Instance.new("Part")
            v20.CanCollide = false
            v20.CanTouch = false
            v20.CanQuery = false
            v20.Size = v17 * Vector3.new(0.1, 0.25, 0.25)
            v20.Material = Enum.Material.SmoothPlastic
            v20.Shape = Enum.PartType.Cylinder
            v20.Color = p16 or Color3.new(1, 0.8, 0)
            v20.Massless = true
            v20.Parent = p15
            local v21 = Instance.new("Weld", v20)
            v21.C1 = CFrame.new(v17 * Vector3.new(0.05, -0.15, 0)) * CFrame.Angles(0, 0, 1.5707963267948966)
            v21.Part0 = v20
            v21.Part1 = p15
            local v22 = p16 and 0.35 or 0
            v18.Reflectance = v22
            v20.Reflectance = v22
            p15.Reflectance = v22
        end },
    ["green easter key"] = { Enum.Material.SmoothPlastic, Color3.fromRGB(80, 234, 23), function(p23, _)
            -- upvalues: (copy) v_u_1
            local v24 = p23.Size.Y / 2.312
            local v25 = v_u_1.DropParts.BlueEgg:Clone()
            v25.Parent = p23
            v25.Size = v24 * Vector3.new(0.611, 0.769, 0.611)
            v25.Massless = true
            v25.CanCollide = false
            v25.CanTouch = false
            v25.CanQuery = false
            local v26 = Instance.new("Weld", v25)
            v26.C1 = CFrame.new(v24 * Vector3.new(0.05, -0.062, 0)) * CFrame.fromOrientation(0, 0, 3.141592653589793)
            v26.Part0 = v25
            v26.Part1 = p23
        end },
    ["infinity key"] = { Enum.Material.SmoothPlastic, Color3.fromRGB(125, 129, 144), function(p27)
            -- upvalues: (copy) v_u_2
            p27.Transparency = 1
            local v28 = p27.Size.Y / 2.312
            local v29 = v_u_2.InfinityKey:Clone()
            v29.Size = v28 * Vector3.new(0.849, 0.495, 0.143)
            v29.Material = Enum.Material.SmoothPlastic
            v29.Color = Color3.fromRGB(125, 129, 144)
            v29.Parent = p27
            MakeWeld(p27, v29).C1 = CFrame.new(v28 * Vector3.new(-0.125, -0.735, 0)) * CFrame.fromOrientation(0, 3.141592653589793, 1.5707963267948966)
            local v30 = v_u_2.Infinity:Clone()
            v30.Size = v28 * Vector3.new(1.486, 0.25, 0.743)
            v30.Material = Enum.Material.Neon
            v30.Color = Color3.new(1, 1, 1)
            v30.Parent = p27
            MakeWeld(p27, v30).C1 = CFrame.new(v28 * Vector3.new(0.064, 0.352, 0.019)) * CFrame.fromOrientation(0, 1.5707963267948966, 1.5707963267948966)
        end },
    ["absolute infinity key"] = { Enum.Material.SmoothPlastic, Color3.fromRGB(125, 129, 144), function(p31)
            -- upvalues: (copy) v_u_2
            p31.Transparency = 1
            local v32 = p31.Size.Y / 3.775
            local v33 = v_u_2.InfinityKey:Clone()
            v33.Size = v32 * Vector3.new(1.386, 0.808, 0.233)
            v33.Material = Enum.Material.SmoothPlastic
            v33.Color = Color3.fromRGB(87, 33, 165)
            v33.Parent = p31
            MakeWeld(p31, v33).C1 = CFrame.new(v32 * Vector3.new(-0.204, -1.2, 0)) * CFrame.fromOrientation(0, 3.141592653589793, 1.5707963267948966)
            local v34 = v_u_2.OMEGA:Clone()
            v34.Size = v32 * Vector3.new(1.659, 0.575, 1.631)
            v34.Material = Enum.Material.Neon
            v34.Color = Color3.new(1, 1, 1)
            v34.Parent = p31
            MakeWeld(p31, v34).C1 = CFrame.new(v32 * Vector3.new(0.1, 1.05, 0)) * CFrame.fromOrientation(-1.5707963267948966, 0, 0)
            local v35 = v_u_2.OMEGA_Border:Clone()
            v35.Size = v32 * Vector3.new(1.691, 0.3, 1.666)
            v35.Material = Enum.Material.SmoothPlastic
            v35.Color = Color3.new()
            v35.Parent = p31
            MakeWeld(p31, v35).C1 = CFrame.new(v32 * Vector3.new(0.1, 1.05, 0)) * CFrame.fromOrientation(-1.5707963267948966, 0, 0)
            local v36 = Instance.new("Part", p31)
            v36.CanTouch = false
            v36.CanCollide = false
            v36.CanQuery = false
            v36.Massless = true
            v36.Shape = Enum.PartType.Cylinder
            v36.Size = v32 * Vector3.new(0.8, 0.25, 0.25)
            v36.Material = Enum.Material.SmoothPlastic
            v36.Color = Color3.fromRGB(87, 33, 165)
            v36.Parent = p31
            MakeWeld(p31, v36, CFrame.new(v32 * Vector3.new(0.085, 0.05, 0)) * CFrame.fromOrientation(0, 0, 1.5707963267948966))
            local v37 = v36:Clone()
            v37.Parent = p31
            v37.Size = v32 * Vector3.new(0.7, 0.3, 0.3)
            v37.Color = Color3.fromRGB()
            v37.Parent = p31
            MakeWeld(p31, v37, CFrame.new(v32 * Vector3.new(0.085, -0.35, 0)) * CFrame.fromOrientation(0, 0, 1.5707963267948966))
            local v38 = v36:Clone()
            v38.Parent = p31
            v38.Size = v32 * Vector3.new(0.6, 0.3, 0.3)
            v38.Color = Color3.fromRGB()
            v38.Parent = p31
            MakeWeld(p31, v38, CFrame.new(v32 * Vector3.new(0.085, 0.45, 0)))
        end },
    ["cyan christmas key"] = { Enum.Material.SmoothPlastic, Color3.new(0, 1, 1), function(p39, p40)
            -- upvalues: (copy) v_u_5
            v_u_5.KeyAppearance["red christmas key"][3](p39, p40, Color3.new(0.6, 0, 1))
        end },
    ["terminusfinity key"] = { Enum.Material.SmoothPlastic, Color3.fromRGB(27, 42, 53), function(p41, _)
            -- upvalues: (copy) v_u_2
            p41.Transparency = 1
            local v42 = p41.Size.Y / 1.51
            local v43 = v_u_2.InfinityKey:Clone()
            v43.Size = v42 * Vector3.new(0.554, 0.323, 0.093)
            v43.Material = Enum.Material.SmoothPlastic
            v43.Color = Color3.fromRGB(51, 88, 130)
            v43.Parent = p41
            MakeWeld(p41, v43).C1 = CFrame.new(v42 * Vector3.new(-0.082, -0.48, 0)) * CFrame.fromOrientation(0, 3.141592653589793, 1.5707963267948966)
            local v44 = v_u_2.TerminusfinitySymbol:Clone()
            v44.Size = v42 * Vector3.new(0.575, 0.122, 0.575)
            v44.Material = Enum.Material.Neon
            v44.Color = Color3.new(1, 1, 1)
            v44.Parent = p41
            MakeWeld(p41, v44).C1 = CFrame.new(v42 * Vector3.new(0.04, 0.482, 0)) * CFrame.fromOrientation(-1.5707963267948966, 0, 0)
            local v45 = Instance.fromExisting(v44)
            v45.Size = v42 * Vector3.new(0.5, 0.106, 0.5)
            v45.Parent = p41
            MakeWeld(p41, v45).C1 = CFrame.new(v42 * Vector3.new(0.04, -0.03, 0))
            local v46 = Instance.new("Part", p41)
            v46.CanTouch = false
            v46.CanCollide = false
            v46.CanQuery = false
            v46.Massless = true
            v46.Shape = Enum.PartType.Cylinder
            v46.Size = v42 * Vector3.new(0.37, 0.1, 0.1)
            v46.Material = Enum.Material.SmoothPlastic
            v46.Color = Color3.fromRGB(51, 88, 130)
            v46.Parent = p41
            MakeWeld(p41, v46, CFrame.new(v42 * Vector3.new(0.034, 0.045, 0)) * CFrame.fromOrientation(0, 0, 1.5707963267948966))
            local v47 = v46:Clone()
            v47.Parent = p41
            v47.Size = v42 * Vector3.new(0.38, 0.12, 0.12)
            v47.Color = Color3.fromRGB(27, 42, 53)
            v47.Parent = p41
            MakeWeld(p41, v47, CFrame.new(v42 * Vector3.new(0.034, -0.09, 0)) * CFrame.fromOrientation(0, 0, 1.5707963267948966))
        end },
    ["frozen key"] = { Enum.Material.Foil, Color3.fromRGB(135, 203, 203), function(p48, _)
            -- upvalues: (copy) v_u_4, (copy) v_u_3
            local v49 = p48.Size.Y / 2.51
            for _, v50 in pairs(v_u_4) do
                local v51 = v_u_3:Clone()
                v51.Size = v49 * v50.Size
                v51.Parent = p48
                MakeWeld(p48, v51, CFrame.new(v50.CF.Position * v49) * v50.CF.Rotation)
            end
        end }
}
function v_u_5.ApplyKeyAppearance(p52, p53, p54, p55)
    -- upvalues: (copy) v_u_5
    local v56 = v_u_5.KeyAppearance[p52]
    if v56 then
        if p55 then
            p53:ClearAllChildren()
        end
        p53.Material = v56[1]
        p53.Color = v56[2]
        p53.Transparency = 0
        if v56[3] then
            v56[3](p53, p54)
        end
    else
        warn("No appearance for the given key")
    end
end
return v_u_5
