
--========================================
-- ModuleScript : StarterPlayer.StarterCharacterScripts.ExtraJumper.spawnDoubleJumpParticleEffect
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1)
    local v_u_2 = Instance.new("Part")
    v_u_2.Size = Vector3.new(2, 1, 2)
    v_u_2.CFrame = p1.HumanoidRootPart.CFrame - Vector3.new(0, 3, 0)
    v_u_2.Anchored = true
    v_u_2.CanCollide = false
    v_u_2.Transparency = 1
    local v_u_3 = Instance.new("ParticleEmitter")
    v_u_3.Texture = "rbxassetid://4473921733"
    v_u_3.Lifetime = NumberRange.new(0.3, 0.5)
    v_u_3.Rate = 2000
    v_u_3.EmissionDirection = Enum.NormalId.Front
    v_u_3.SpreadAngle = Vector2.new(0, 180)
    v_u_3.Speed = NumberRange.new(9, 11)
    v_u_3.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.1, 0.45), NumberSequenceKeypoint.new(1, 1.5) })
    v_u_3.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0.3), NumberSequenceKeypoint.new(1, 1) })
    v_u_3.LightInfluence = 0
    v_u_3.Parent = v_u_2
    v_u_2.Parent = workspace
    spawn(function()
        -- upvalues: (copy) v_u_3, (copy) v_u_2
        wait(0.1)
        v_u_3.Enabled = false
        game:GetService("Debris"):AddItem(v_u_2, 1)
    end)
end

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.LocalTags.ClientObject
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v_u_2 = game.Players.LocalPlayer
local v_u_3 = {}
local v_u_4 = "Default"
local function v_u_10(p5)
    -- upvalues: (ref) v_u_4, (copy) v_u_3
    local v_u_6 = p5:WaitForChild("Head", 5)
    if v_u_6 then
        v_u_4 = v_u_6.CollisionGroup
        for _, v7 in pairs(v_u_3) do
            v7.CollisionGroup = v_u_6.CollisionGroup
        end
        v_u_6:GetPropertyChangedSignal("CollisionGroup"):Connect(function()
            -- upvalues: (copy) v_u_6, (ref) v_u_4, (ref) v_u_3
            local v8 = v_u_6
            v_u_4 = v8.CollisionGroup
            for _, v9 in pairs(v_u_3) do
                v9.CollisionGroup = v8.CollisionGroup
            end
        end)
    end
end
v_u_2.CharacterAdded:Connect(function()
    -- upvalues: (copy) v_u_10, (copy) v_u_2
    v_u_10(v_u_2.Character)
end)
if v_u_2.Character then
    pcall(function()
        -- upvalues: (copy) v_u_10, (copy) v_u_2
        v_u_10(v_u_2.Character)
    end)
end
function v1.AddTagged(_, p_u_11)
    -- upvalues: (copy) v_u_3, (ref) v_u_4
    if p_u_11:IsA("Model") or p_u_11:IsA("BasePart") then
        if not p_u_11:GetAttribute("IsClonedClientObject") then
            local v_u_12 = p_u_11:Clone()
            v_u_12:SetAttribute("IsClonedClientObject", true)
            v_u_12.Parent = p_u_11.Parent
            p_u_11:SetAttribute("ServerStreamedObject", true)
            p_u_11.Parent = nil
            for _, v13 in pairs(v_u_12:GetDescendants()) do
                if v13:IsA("BasePart") then
                    local v14 = v_u_3
                    table.insert(v14, v13)
                    v13.CollisionGroup = v_u_4
                end
            end
            if v_u_12:IsA("PVInstance") and not v_u_12:GetAttribute("DisableServerSync") then
                while p_u_11:IsDescendantOf(workspace) and p_u_11.Name ~= "center" do
                    if p_u_11:FindFirstChild("center") and p_u_11.center == p_u_11.PrimaryPart then
                        p_u_11 = p_u_11.center
                    else
                        p_u_11 = p_u_11.Parent
                    end
                end
                if p_u_11.Name ~= "center" then
                    return
                end
                local v_u_15 = p_u_11.CFrame
                p_u_11:GetPropertyChangedSignal("CFrame"):Connect(function()
                    -- upvalues: (ref) p_u_11, (ref) v_u_15, (copy) v_u_12
                    local v16 = p_u_11.CFrame * v_u_15:Inverse()
                    v_u_15 = p_u_11.CFrame
                    v_u_12:PivotTo(v16 * v_u_12:GetPivot())
                end)
            end
        end
    else
        warn(p_u_11:GetFullName() .. " has ClientObject tag, but is not of class \'Model\' or \'BasePart\'. (" .. p_u_11.ClassName .. ")")
        return
    end
end
function v1.RemoveTagged(_, p17)
    -- upvalues: (copy) v_u_3
    for _, v18 in pairs(p17:GetDescendants()) do
        if v18:IsA("BasePart") then
            local v19 = table.find(v_u_3, v18)
            if v19 then
                table.remove(v_u_3, v19)
            end
        end
    end
    if not p17:GetAttribute("ServerStreamedObject") then
        p17:Destroy()
    end
end
return v1

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.LocalTags.Conveyor
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v_u_2 = game:GetService("CollectionService")
local v3 = game:GetService("RunService")
local v_u_4 = game.Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("timefreeze")
local v_u_5 = {}
local v_u_6 = workspace.DistributedGameTime
local v_u_7 = 0
v3.RenderStepped:Connect(function()
    -- upvalues: (copy) v_u_5, (ref) v_u_7, (copy) v_u_4, (ref) v_u_6
    for _, v_u_8 in pairs(v_u_5) do
        pcall(function()
            -- upvalues: (copy) v_u_8, (ref) v_u_7
            local v9 = v_u_8:FindFirstChild("ConveyorTexture")
            if v9 then
                v9.OffsetStudsV = -(v_u_7 * v_u_8:GetAttribute("ConveyorSpeed")) % v9.StudsPerTileV
            end
        end)
    end
    if not v_u_4.Value then
        v_u_7 = v_u_7 + (workspace.DistributedGameTime - v_u_6)
    end
    v_u_6 = workspace.DistributedGameTime
end)
v_u_4:GetPropertyChangedSignal("Value"):Connect(function()
    -- upvalues: (copy) v_u_2, (copy) v_u_4
    for _, v10 in v_u_2:GetTagged(script.Name) do
        if v_u_4.Value then
            v10.Velocity = Vector3.new(0, 0, 0)
        else
            v10.Velocity = v10:GetAttribute("ConveyorSpeed") * v10.CFrame.LookVector
        end
    end
end)
function v1.AddTagged(_, p11)
    -- upvalues: (copy) v_u_5
    if p11:IsA("BasePart") then
        if p11:WaitForChild("ConveyorTexture", 1) then
            local v12 = v_u_5
            table.insert(v12, p11)
        end
    else
        return
    end
end
function v1.RemoveTagged(_, p13)
    -- upvalues: (copy) v_u_5
    local v14 = table.find(v_u_5, p13)
    if v14 then
        table.remove(v_u_5, v14)
    end
end
return v1

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.LocalTags.DisappearingPlatform
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v2 = game:GetService("RunService")
local v_u_3 = game.Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("timefreeze")
local v_u_4 = {}
local v_u_5 = workspace.DistributedGameTime
local v_u_6 = 0
v2.RenderStepped:Connect(function()
    -- upvalues: (copy) v_u_4, (ref) v_u_6, (copy) v_u_3, (ref) v_u_5
    for _, v_u_7 in pairs(v_u_4) do
        pcall(function()
            -- upvalues: (copy) v_u_7, (ref) v_u_6
            local v8 = v_u_7:GetAttribute("Offset")
            local v9 = v_u_7:GetAttribute("OnTime")
            local v10 = v_u_7:GetAttribute("OnHold")
            local v11 = v_u_7:GetAttribute("OffTime")
            local v12 = v_u_7:GetAttribute("OffHold")
            local v13 = v9 + v10 + v11 + v12
            local v14 = (v_u_6 + v8) % v13
            if v14 < v9 then
                v_u_7.CanCollide = true
                v_u_7.Transparency = 1 - (v14 / v9) ^ 2
                return
            else
                local v15 = v14 - v9
                if v15 < v10 then
                    v_u_7.CanCollide = true
                    v_u_7.Transparency = 0
                    return
                else
                    local v16 = v15 - v10
                    if v16 < v11 then
                        v_u_7.CanCollide = true
                        v_u_7.Transparency = (v16 / v11) ^ 2
                    else
                        v_u_7.CanCollide = false
                        v_u_7.Transparency = 1
                    end
                end
            end
        end)
    end
    if not v_u_3.Value then
        v_u_6 = v_u_6 + (workspace.DistributedGameTime - v_u_5)
    end
    v_u_5 = workspace.DistributedGameTime
end)
function v1.AddTagged(_, p17)
    -- upvalues: (copy) v_u_4
    if p17:IsA("BasePart") then
        local v18 = v_u_4
        table.insert(v18, p17)
    end
end
function v1.RemoveTagged(_, p19)
    -- upvalues: (copy) v_u_4
    local v20 = table.find(v_u_4, p19)
    if v20 then
        table.remove(v_u_4, v20)
    end
end
return v1

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.LocalTags.KillBrick
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v_u_2 = game:GetService("CollectionService")
local v_u_3 = game.ReplicatedStorage.GameValues.killbricksDisabled
local v_u_4 = game:GetService("RunService"):IsStudio()
local v_u_5 = nil
local function v11(p6)
    -- upvalues: (ref) v_u_5, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
    v_u_5 = p6:WaitForChild("Humanoid")
    v_u_5.Touched:Connect(function(p7, p8)
        -- upvalues: (ref) v_u_2, (ref) v_u_3, (ref) v_u_5, (ref) v_u_4
        if workspace:FindFirstChild("KillbrickFlag") then
            return
        elseif v_u_2:HasTag(p7, "KillBrick") then
            local v9 = p7:GetAttribute("KillPriority")
            local v10 = p8:GetAttribute("KillPriority")
            if v9 and v10 then
                if v9 == 1 and v_u_3.Value then
                    return
                elseif v9 < v10 then
                    return
                elseif v_u_5.Health > 0 then
                    print((("Killed because %* touched a killing part. %*"):format(p8.Name, v_u_4 and ("(%*)"):format((p7:GetFullName())) or "")))
                    v_u_5.Health = 0
                end
            else
                return
            end
        else
            return
        end
    end)
end
if game.Players.LocalPlayer.Character then
    v_u_5 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    v_u_5.Touched:Connect(function(p12, p13)
        -- upvalues: (copy) v_u_2, (copy) v_u_3, (ref) v_u_5, (copy) v_u_4
        if workspace:FindFirstChild("KillbrickFlag") then
            return
        elseif v_u_2:HasTag(p12, "KillBrick") then
            local v14 = p12:GetAttribute("KillPriority")
            local v15 = p13:GetAttribute("KillPriority")
            if v14 and v15 then
                if v14 == 1 and v_u_3.Value then
                    return
                elseif v14 < v15 then
                    return
                elseif v_u_5.Health > 0 then
                    print((("Killed because %* touched a killing part. %*"):format(p13.Name, v_u_4 and ("(%*)"):format((p12:GetFullName())) or "")))
                    v_u_5.Health = 0
                end
            else
                return
            end
        else
            return
        end
    end)
end
game.Players.LocalPlayer.CharacterAdded:Connect(v11)
function v1.AddTagged(_, _) end
function v1.RemoveTagged(_, _) end
return v1

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.LocalTags.SlidingObject
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return require(game.ReplicatedStorage.Library.Shared.SlidingObjectBehavior)

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.BaseCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.BaseOcclusion
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraInput
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraToggleStateController
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.CameraUI
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
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.Invisicam
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.LegacyCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.MouseLockController
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.OrbitalCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.Poppercam
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.TransparencyController
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
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VRVehicleCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera.VehicleCameraConfig
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.CameraModule.VehicleCamera.VehicleCameraCore
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
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.BaseCharacterController
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.ClickToMoveController
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
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.Gamepad
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.Keyboard
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
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.TouchThumbstick
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.VRNavigation
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerModule.ControlModule.VehicleController
--========================================
-- Ignored

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.RbxCharacterSounds.AtomicBinding
--========================================
-- Ignored

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Spectral.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId]
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Transparent Gravity Coil.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Transparent Fusion Coil.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Transparent Speed Coil.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Easter Balloon.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId] or (v_u_1.mods[p2.UserId] or game:GetService("MarketplaceService"):PlayerOwnsAsset(p2, 12586954912))
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue Trail Tip.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v1.Image = "rbxassetid://4509719282"
    v1.ImageColor3 = script.Parent.color.Value
    v1.BackgroundColor3 = script.Parent.color.Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cyan Trail Tip.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v1.Image = "rbxassetid://4509719282"
    v1.ImageColor3 = script.Parent.color.Value
    v1.BackgroundColor3 = script.Parent.color.Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple Trail Tip.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v1.Image = "rbxassetid://4509719282"
    v1.ImageColor3 = script.Parent.color.Value
    v1.BackgroundColor3 = script.Parent.color.Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black Trail Tip.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v1.Image = "rbxassetid://4509719282"
    v1.ImageColor3 = script.Parent.color.Value
    v1.BackgroundColor3 = script.Parent.color.Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green Trail Tip.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v1.Image = "rbxassetid://4509719282"
    v1.ImageColor3 = script.Parent.color.Value
    v1.BackgroundColor3 = script.Parent.color.Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red Trail Tip.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v1.Image = "rbxassetid://4509719282"
    v1.ImageColor3 = script.Parent.color.Value
    v1.BackgroundColor3 = script.Parent.color.Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Yellow Trail Tip.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v1.Image = "rbxassetid://4509719282"
    v1.ImageColor3 = script.Parent.color.Value
    v1.BackgroundColor3 = script.Parent.color.Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange Trail Tip.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v1.Image = "rbxassetid://4509719282"
    v1.ImageColor3 = script.Parent.color.Value
    v1.BackgroundColor3 = script.Parent.color.Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.White Trail Tip.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v1.Image = "rbxassetid://4509719282"
    v1.ImageColor3 = script.Parent.color.Value
    v1.BackgroundColor3 = script.Parent.color.Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Genderqueer Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Pansexual Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Demigirl Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Pride Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Agender Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Omnisexual Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Asexual Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Pink Hat.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red-Orange Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red-White Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Carmine Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId] or game:GetService("BadgeService"):UserHasBadgeAsync(p2.UserId, 1118891334474135)
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Carmine Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Seren's Smaller Present.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(_, p1)
    local v2 = script.Parent.Name
    local v3 = string.sub(v2, 1, -16) .. "Present"
    local v4
    if os.time() > 1640386800 then
        v4 = string.find(p1.effects, ";" .. v3 .. ";")
    else
        v4 = false
    end
    return v4
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Gabe's Smaller Present.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(_, p1)
    local v2 = script.Parent.Name
    local v3 = string.sub(v2, 1, -16) .. "Present"
    local v4
    if os.time() > 1640386800 then
        v4 = string.find(p1.effects, ";" .. v3 .. ";")
    else
        v4 = false
    end
    return v4
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Tal's Smaller Present.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(_, p1)
    local v2 = script.Parent.Name
    local v3 = string.sub(v2, 1, -16) .. "Present"
    local v4
    if os.time() > 1640386800 then
        v4 = string.find(p1.effects, ";" .. v3 .. ";")
    else
        v4 = false
    end
    return v4
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Yellow-Blue Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Yellow-Cyan Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Yellow-Purple Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Yellow-Black Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Yellow-Green Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Yellow-Red Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Yellow-Orange Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Yellow-White Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange-Blue Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange-Cyan Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange-Purple Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Genderfluid Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Nonbinary Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Lesbian Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    -- upvalues: (copy) v_u_1
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v3.ZIndex + 1
    v2.Image = "rbxassetid://4507869909"
    v2.ImageColor3 = v_u_1
    v2.BackgroundColor3 = v_u_1
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    v3.ImageColor3 = Color3.new(0.6, 0.6, 0.6)
    return { v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Steaming.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Silver Radiance.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Gold Radiance.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Platinum Radiance.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Bronze Radiance.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Rainbow Radiance.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Translucent Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(_, _)
    return false
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Translucent Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Loading Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId]
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Loading Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Rainbow Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId]
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Rainbow Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Hot Head.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Hotter Head.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Smoking.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Spiral Ring.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId]
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Spiral Ring.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Lesbian Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Demiboy Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Pride Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Transgender Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Aromantic Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Bigender Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Asexual Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Polysexual Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Bigender Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Vincian Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Polysexual Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Pansexual Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Transgender Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Omnisexual Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Agender Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Genderqueer Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Nonbinary Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Vincian Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Bisexual Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Pangender Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Abrosexual Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Aromantic Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Abrosexual Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Bisexual Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Creator.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
return function(p2, p3)
    -- upvalues: (ref) v_u_1
    if typeof(p2) == "Instance" then
        for _, v4 in pairs(v_u_1) do
            if v4 == p2.UserId then
                return true
            end
        end
    else
        v_u_1 = p3
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Creator.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.Parent.text:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cat.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
return function(p2, p3)
    -- upvalues: (ref) v_u_1
    if typeof(p2) == "Instance" then
        for _, v4 in pairs(v_u_1) do
            if v4 == p2.UserId then
                return true
            end
        end
    else
        v_u_1 = p3
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cat.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.Parent.text:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Admin.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
return function(p2, p3)
    -- upvalues: (ref) v_u_1
    if typeof(p2) == "Instance" then
        for _, v4 in pairs(v_u_1) do
            if v4 == p2.UserId then
                return true
            end
        end
    else
        v_u_1 = p3
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Admin.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.Parent.text:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Custom.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
return function(p2, p3)
    -- upvalues: (ref) v_u_1
    if typeof(p2) == "Instance" then
        for _, v4 in pairs(v_u_1) do
            if v4 == p2.UserId then
                return true
            end
        end
    else
        v_u_1 = p3
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Custom.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.Parent.text:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Builder.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
return function(p2, p3)
    -- upvalues: (ref) v_u_1
    if typeof(p2) == "Instance" then
        for _, v4 in pairs(v_u_1) do
            if v4 == p2.UserId then
                return true
            end
        end
    else
        v_u_1 = p3
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Builder.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.Parent.text:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange-Black Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange-Green Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange-Red Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange-Yellow Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange-White Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.White-Blue Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.White-Cyan Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.White-Purple Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.White-Black Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.White-Green Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.White-Red Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.White-Yellow Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.White-Orange Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Fading Blue Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v2.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Fading Cyan Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v2.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Fading Purple Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v2.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Fading Green Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v2.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Fading Red Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v2.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Fading Yellow Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v2.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Fading Orange Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v2.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Fading White Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    v2.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4507869874"
    return { v1, v2 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Pyxl's Smaller Present.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(_, p1)
    local v2 = script.Parent.Name
    local v3 = string.sub(v2, 1, -16) .. "Present"
    local v4
    if os.time() > 1640386800 then
        v4 = string.find(p1.effects, ";" .. v3 .. ";")
    else
        v4 = false
    end
    return v4
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Triangle's Smaller Present.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(_, p1)
    local v2 = script.Parent.Name
    local v3 = string.sub(v2, 1, -16) .. "Present"
    local v4
    if os.time() > 1640386800 then
        v4 = string.find(p1.effects, ";" .. v3 .. ";")
    else
        v4 = false
    end
    return v4
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Nuyork's Smaller Present.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(_, p1)
    local v2 = script.Parent.Name
    local v3 = string.sub(v2, 1, -16) .. "Present"
    local v4
    if os.time() > 1640386800 then
        v4 = string.find(p1.effects, ";" .. v3 .. ";")
    else
        v4 = false
    end
    return v4
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Derg's Smaller Present.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(_, p1)
    local v2 = script.Parent.Name
    local v3 = string.sub(v2, 1, -16) .. "Present"
    local v4
    if os.time() > 1640386800 then
        v4 = string.find(p1.effects, ";" .. v3 .. ";")
    else
        v4 = false
    end
    return v4
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Lego's Smaller Present.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(_, p1)
    local v2 = script.Parent.Name
    local v3 = string.sub(v2, 1, -16) .. "Present"
    local v4
    if os.time() > 1640386800 then
        v4 = string.find(p1.effects, ";" .. v3 .. ";")
    else
        v4 = false
    end
    return v4
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Emerald Radiance.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Amethyst Radiance.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Sammy's Smaller Present.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(_, p1)
    local v2 = script.Parent.Name
    local v3 = string.sub(v2, 1, -16) .. "Present"
    local v4
    if os.time() > 1640386800 then
        v4 = string.find(p1.effects, ";" .. v3 .. ";")
    else
        v4 = false
    end
    return v4
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Pyx's Smaller Present.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(_, p1)
    local v2 = script.Parent.Name
    local v3 = string.sub(v2, 1, -16) .. "Present"
    local v4
    if os.time() > 1640386800 then
        v4 = string.find(p1.effects, ";" .. v3 .. ";")
    else
        v4 = false
    end
    return v4
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Genderfluid Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Demigirl Heart.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Pangender Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Demiboy Paw.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.icon:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Christmas Radiance.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green Wave Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red Wave Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.Yellow Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.Yellow Wave Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange Wave Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.White Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.White Wave Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue-Cyan Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue-Purple Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue-Black Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue-Green Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue-Red Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue-Yellow Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue-Orange Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue-White Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cyan-Blue Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cyan-Purple Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cyan-Black Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cyan-Green Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cyan-Red Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cyan-Yellow Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cyan-Orange Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cyan-White Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple-Blue Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple-Cyan Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple-Black Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple-Green Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple-Red Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple-Yellow Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple-Orange Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple-White Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black-Blue Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black-Cyan Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black-Purple Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black-Green Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black-Red Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black-Yellow Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black-Orange Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black-White Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green-Blue Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green-Cyan Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green-Purple Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green-Black Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green-Red Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green-Yellow Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green-Orange Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green-White Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red-Blue Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red-Cyan Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red-Purple Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red-Black Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red-Green Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red-Yellow Trail.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    v3.ZIndex = v1.ZIndex + 1
    v1.Image = "rbxassetid://4509719321"
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageTransparency = 0.25
    v2.Image = "rbxassetid://4509719282"
    v2.ImageColor3 = script.Parent.Color.Keypoints[2].Value
    v2.BackgroundColor3 = script.Parent.Color.Keypoints[2].Value
    v2.ImageTransparency = 0.25
    v3.Image = "rbxassetid://4507869874"
    return { v1, v2, v3 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cold Flames.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Toxic Smoke.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cinnabar Smoke.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Lapis Dust.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Radioactive Smoke.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Ruby Radiance.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Rainbow Smoke.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Spiral Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId]
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Spiral Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Glass Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId]
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Glass Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId] or game:GetService("MarketplaceService"):UserOwnsGamePassAsync(p2.UserId, 5290696)
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Green Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId] or v_u_1.mods[p2.UserId]
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Orange Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Gold Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId] or v_u_1.mods[p2.UserId]
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Gold Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Teal Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId] or game:GetService("BadgeService"):UserHasBadgeAsync(p2.UserId, 2124530161)
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Teal Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Silver Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.builders[p2.UserId]
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Silver Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p_u_2, _)
    -- upvalues: (copy) v_u_1
    if v_u_1.admins[p_u_2.UserId] then
        return true
    end
    for _, v_u_3 in pairs({
        2124505884,
        2124505885,
        2124505886,
        2124505887,
        2124512012,
        2124530161,
        2124530162,
        1118891334474135
    }) do
        local v4, v5 = pcall(function()
            -- upvalues: (copy) p_u_2, (copy) v_u_3
            return game:GetService("BadgeService"):UserHasBadgeAsync(p_u_2.UserId, v_u_3)
        end)
        if not (v4 and v5) then
            return false
        end
    end
    return true
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    local v3 = game.ReplicatedStorage.data:FindFirstChild(p2.UserId)
    return v_u_1.admins[p2.UserId] or (game:GetService("BadgeService"):UserHasBadgeAsync(p2.UserId, 2124518596) or v3.beat_ttoh.Value)
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Red Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Pink Halo.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId] or game:GetService("BadgeService"):UserHasBadgeAsync(p2.UserId, 2124512012)
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Pink Halo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Present.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = require(script.Parent.colors)(game.Players.LocalPlayer.UserId)
    local v2 = script.ImageLabel:Clone()
    local v3 = script.ImageLabel:Clone()
    local v4 = script.ImageLabel:Clone()
    v3.ZIndex = v2.ZIndex + 1
    v4.ZIndex = v2.ZIndex + 2
    v2.Image = "rbxassetid://8152213648"
    v2.ImageColor3 = v1.box
    v2.BackgroundColor3 = v1.box
    v3.Image = "rbxassetid://8152213447"
    v3.ImageColor3 = v1.lid
    v3.BackgroundColor3 = v1.lid
    v4.Image = "rbxassetid://8152213253"
    v4.ImageColor3 = v1.band
    v4.BackgroundColor3 = v1.band
    return { v2, v3, v4 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Present.colors
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    [126847247] = {
        ["band"] = Color3.fromRGB(202.2, 76, 168.6),
        ["box"] = Color3.fromRGB(235.6, 229.5, 200.3),
        ["lid"] = Color3.fromRGB(211.3, 188.6, 85.6)
    },
    [432880162] = {
        ["band"] = Color3.fromRGB(224, 160, 0),
        ["box"] = Color3.fromRGB(249, 243, 255),
        ["lid"] = Color3.fromRGB(136, 59, 153)
    }
}
function get_colors(p2)
    -- upvalues: (copy) v_u_1
    local v3 = v_u_1[p2]
    if not v3 then
        math.randomseed(p2 % 1073741824 + 6)
        local v4 = math.random()
        local v5 = math.random()
        local v6 = math.random()
        local v7 = v4 + 0.3333333333333333
        local v8 = v4 + 0.6666666666666666
        v3 = {
            ["band"] = Color3.fromHSV(v4, 0.8, 1),
            ["box"] = Color3.fromHSV(v7, v5 * v6, v6),
            ["lid"] = Color3.fromHSV(v8, v5 * (2 - v6) / 2, (2 - v6) / 2)
        }
    end
    return v3
end
return get_colors

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Present.customName
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return game.Players.LocalPlayer.DisplayName .. "\'s Present"
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Rainbow Flame.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
    v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Hottest Head.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cursed Flames.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black Ring.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Black Ring.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId]
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Dark Speed Coil.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Dark Fusion Coil.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Dark Gravity Coil.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Dinnerbone.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function()
    return { (script.Parent.text:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Dinnerbone.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ServerScriptService.Modules.admins)
return function(p2, _)
    -- upvalues: (copy) v_u_1
    return v_u_1.admins[p2.UserId] or v_u_1.mods[p2.UserId]
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Floating Crown.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Floating Crown.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(p1, _)
    local v_u_2 = game.ReplicatedStorage.data:FindFirstChild(p1.UserId)
    v_u_2.subscription.Changed:Connect(function()
        -- upvalues: (copy) v_u_2
        if v_u_2.subscription.Value > os.time() and not require(game.ReplicatedStorage.stringListContains)(v_u_2.effects.Value, script.Parent.Name) then
            v_u_2.effects.Value = v_u_2.effects.Value .. script.Parent.Name .. ";"
        end
    end)
    return v_u_2.subscription.Value > os.time()
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Crown.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(p1, _)
    local v_u_2 = game.ReplicatedStorage.data:FindFirstChild(p1.UserId)
    v_u_2.subscription.Changed:Connect(function()
        -- upvalues: (copy) v_u_2
        if v_u_2.subscription.Value > os.time() and not require(game.ReplicatedStorage.stringListContains)(v_u_2.effects.Value, script.Parent.Name) then
            v_u_2.effects.Value = v_u_2.effects.Value .. script.Parent.Name .. ";"
        end
    end)
    return v_u_2.subscription.Value > os.time()
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Crown.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.ImageLabel:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue Ring.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    local v1 = script.ImageLabel:Clone()
    v1.BackgroundColor3 = script.Parent.Handle.Color
    return { v1 }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Admin|Builder.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
return function(p2, p3)
    -- upvalues: (ref) v_u_1
    if typeof(p2) == "Instance" then
        for _, v4 in pairs(v_u_1) do
            if v4 == p2.UserId then
                return true
            end
        end
    else
        v_u_1 = p3
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Admin|Builder.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.Parent.text:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Sub to PinkLeaf.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
return function(p2, p3)
    -- upvalues: (ref) v_u_1
    if typeof(p2) == "Instance" then
        for _, v4 in pairs(v_u_1) do
            if v4 == p2.UserId then
                return true
            end
        end
    else
        v_u_1 = p3
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Sub to PinkLeaf.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.Parent.text:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Noob.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
return function(p2, p3)
    -- upvalues: (ref) v_u_1
    if typeof(p2) == "Instance" then
        for _, v4 in pairs(v_u_1) do
            if v4 == p2.UserId then
                return true
            end
        end
    else
        v_u_1 = p3
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Noob.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.Parent.text:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Member.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.Parent.text:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Member.customOwnership
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ServerScriptService.Modules.admins)
return function(p1, _)
    local v_u_2 = game.ReplicatedStorage.data:FindFirstChild(p1.UserId)
    v_u_2.subscription.Changed:Connect(function()
        -- upvalues: (copy) v_u_2
        if v_u_2.subscription.Value > os.time() and not require(game.ReplicatedStorage.Library.Utility.stringListContains)(v_u_2.effects.Value, script.Parent.Name) then
            v_u_2.effects.Value = v_u_2.effects.Value .. script.Parent.Name .. ";"
        end
    end)
    return v_u_2.subscription.Value > os.time()
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.uwu.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.Parent.text:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.owo.customPic
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function()
    return { (script.Parent.text:Clone()) }
end

--========================================
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.Blue Wave Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cyan Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.Cyan Wave Trail.customPic
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
-- ModuleScript : ReplicatedStorage.Assets.Effects.Purple Trail.customPic
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
