
--========================================
-- LocalScript : Workspace.tower.sections.lobby.shop.Sale.Part.fusion.activeSkills
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.Library.Utility.stringListContains)
local v_u_2 = game.ReplicatedStorage.data:FindFirstChild(game.Players.LocalPlayer.UserId).activeskills
function update()
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    local v3 = v_u_2.Value
    local v4 = 0.3
    for v5, v6 in pairs({ 0.45, 0.55 }) do
        if v_u_1(v3, script.Parent.Name .. "/grav" .. v5) then
            v4 = math.max(v4, v6)
        end
    end
    script.Parent:WaitForChild("Gravity"):WaitForChild("gravityDecrease").Value = v4
    local v7 = 0
    for v8, v9 in pairs({ 6 }) do
        if v_u_1(v3, script.Parent.Name .. "/jump" .. v8) then
            v7 = math.max(v7, v9)
        end
    end
    script.Parent:WaitForChild("Gravity"):WaitForChild("jumpPowerIncrease").Value = v7
    local v10 = 1.2
    for v11, v12 in pairs({ 1.5, 2, 2.5 }) do
        if v_u_1(v3, script.Parent.Name .. "/speed" .. v11) then
            v10 = math.max(v10, v12)
        end
    end
    script.Parent:WaitForChild("Speed"):WaitForChild("speedMult").Value = v10
end
v_u_2.Changed:Connect(update)
script.Parent.Equipped:Connect(update)

--========================================
-- LocalScript : Workspace.tower.sections.lobby.shop.Sale.Part.fusion.SoundPlayer
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
function Equipped()
    local v1 = script.Parent.Handle:FindFirstChild("CoilSound")
    if v1 ~= nil then
        v1:Play()
    end
end
script.Parent.Equipped:connect(Equipped)

--========================================
-- LocalScript : Workspace.tower.sections.lobby.shop.Sale.Part.fusion.Gravity
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game:GetService("UserInputService")
local v_u_1 = game.Players.LocalPlayer
local v_u_2 = {}
local v_u_3 = 0
local function v_u_7()
    -- upvalues: (ref) v_u_3
    local v4 = script.Parent.Parent.Humanoid
    v4.JumpPower = v4.JumpPower - v_u_3 + script.jumpPowerIncrease.Value
    v_u_3 = script.jumpPowerIncrease.Value
    local v5 = script.Parent.Handle.Gravity
    local v6 = script.Parent.mass.Value * workspace.Gravity * script.gravityDecrease.Value
    v5.Force = Vector3.new(0, v6, 0)
end
script.Parent.Equipped:Connect(function()
    -- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_1
    v_u_7()
    local v8 = v_u_2
    local v9 = script.Parent.Parent.Humanoid.StateChanged
    local function v11(_, p10)
        -- upvalues: (ref) v_u_7
        if p10 == Enum.HumanoidStateType.Landed then
            v_u_7()
        end
    end
    table.insert(v8, v9:connect(v11))
    local function v13()
        -- upvalues: (ref) v_u_1, (ref) v_u_7
        if script.Parent.Parent == v_u_1.Character then
            local v12 = script.Parent.Parent.Humanoid:GetState()
            if v12 == Enum.HumanoidStateType.Running or (v12 == Enum.HumanoidStateType.RunningNoPhysics or (v12 == Enum.HumanoidStateType.Climbing or v12 == Enum.HumanoidStateType.Landed)) then
                v_u_7()
            end
        end
    end
    local v14 = v_u_2
    local v15 = script.gravityDecrease.Changed
    table.insert(v14, v15:Connect(v13))
    local v16 = v_u_2
    local v17 = script.jumpPowerIncrease.Changed
    table.insert(v16, v17:Connect(v13))
end)
function dequip()
    -- upvalues: (copy) v_u_2, (copy) v_u_1, (ref) v_u_3
    while v_u_2[1] do
        v_u_2[1]:Disconnect()
        table.remove(v_u_2, 1)
    end
    local v18 = v_u_1.Character.Humanoid
    v18.JumpPower = v18.JumpPower - v_u_3
    v_u_3 = 0
    script.Parent.Handle.Gravity.Force = Vector3.new()
end
script.Parent.Unequipped:Connect(dequip)
script.Parent.AncestryChanged:Connect(function()
    -- upvalues: (copy) v_u_1
    if script.Parent ~= v_u_1.Character then
        dequip()
    end
end)

--========================================
-- LocalScript : Workspace.tower.sections.lobby.shop.Sale.Part.fusion.Speed
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.Players.LocalPlayer
local v_u_2 = {}
local v_u_3 = 1
script.Parent.Equipped:Connect(function()
    -- upvalues: (ref) v_u_3, (copy) v_u_2, (copy) v_u_1
    script.Parent.Parent.Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
    v_u_3 = script.speedMult.Value
    local v4 = v_u_2
    local v5 = script.Parent.Parent.Humanoid.StateChanged
    local function v7(_, p6)
        -- upvalues: (ref) v_u_3
        if p6 == Enum.HumanoidStateType.Landed then
            script.Parent.Parent.Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
            v_u_3 = script.speedMult.Value
        end
    end
    table.insert(v4, v5:connect(v7))
    local v8 = v_u_2
    local v9 = script.Parent.Parent.Humanoid.Changed
    local function v11(p10)
        -- upvalues: (ref) v_u_3
        if p10 == "WalkSpeed" then
            script.Parent.Parent.Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
            v_u_3 = script.speedMult.Value
        end
    end
    table.insert(v8, v9:Connect(v11))
    local v12 = v_u_2
    local v13 = script.speedMult.Changed
    local function v15()
        -- upvalues: (ref) v_u_1, (ref) v_u_3
        if script.Parent.Parent == v_u_1.Character then
            local v14 = script.Parent.Parent.Humanoid:GetState()
            if v14 == Enum.HumanoidStateType.Running or (v14 == Enum.HumanoidStateType.RunningNoPhysics or (v14 == Enum.HumanoidStateType.Climbing or v14 == Enum.HumanoidStateType.Landed)) then
                script.Parent.Parent.Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
                v_u_3 = script.speedMult.Value
            end
        end
    end
    table.insert(v12, v13:Connect(v15))
end)
function dequip()
    -- upvalues: (copy) v_u_2, (copy) v_u_1, (ref) v_u_3
    while v_u_2[1] do
        v_u_2[1]:Disconnect()
        table.remove(v_u_2, 1)
    end
    v_u_1.Character.Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value
    v_u_3 = 1
end
script.Parent.Unequipped:Connect(dequip)
script.Parent.AncestryChanged:Connect(function()
    -- upvalues: (copy) v_u_1
    if script.Parent ~= v_u_1.Character then
        dequip()
    end
end)

--========================================
-- LocalScript : StarterPlayer.StarterCharacterScripts.ExtraJumper
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game.Players.LocalPlayer
local v_u_3 = 0
local v_u_4 = 0
script.Parent.Humanoid.StateChanged:connect(function(_, p5)
    -- upvalues: (ref) v_u_4, (ref) v_u_3
    if p5 == Enum.HumanoidStateType.Freefall then
        v_u_4 = script.multiJumpCount.Value
    elseif p5 == Enum.HumanoidStateType.Landed then
        v_u_3 = 0
        v_u_4 = 0
    end
end)
script:WaitForChild("multiJumpCount").Changed:Connect(function()
    -- upvalues: (copy) v_u_2, (ref) v_u_4
    if script.Parent.Parent == v_u_2.Character then
        local v6 = script.Parent.Parent.Humanoid:GetState()
        if v6 == Enum.HumanoidStateType.Running or (v6 == Enum.HumanoidStateType.RunningNoPhysics or (v6 == Enum.HumanoidStateType.Climbing or v6 == Enum.HumanoidStateType.Landed)) then
            v_u_4 = script.multiJumpCount.Value
        end
    end
end)
local v_u_7 = false
v1.JumpRequest:connect(function()
    -- upvalues: (ref) v_u_7, (ref) v_u_4, (ref) v_u_3
    if script:IsDescendantOf(workspace) then
        if v_u_7 then
            return
        else
            v_u_7 = true
            spawn(function()
                -- upvalues: (ref) v_u_7
                wait(0.15)
                v_u_7 = false
            end)
            local v8 = script.Parent
            if v8 and v8:FindFirstChild("Humanoid") then
                local v9 = v_u_4
                local v10 = script.multiJumpCount.Value
                if v_u_3 < math.min(v9, v10) then
                    v_u_3 = v_u_3 + 1
                    v8.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    require(script.spawnDoubleJumpParticleEffect)(v8)
                end
            end
        end
    else
        return
    end
end)
local v_u_11 = 0
local function v12()
    -- upvalues: (ref) v_u_11
    script.multiJumpCount.Value = script.multiJumpCount.Value + game.ReplicatedStorage.GameValues.globalJumps.Value - v_u_11
    v_u_11 = game.ReplicatedStorage.GameValues.globalJumps.Value
end
script.multiJumpCount.Value = script.multiJumpCount.Value + game.ReplicatedStorage.GameValues.globalJumps.Value - v_u_11
v_u_11 = game.ReplicatedStorage.GameValues.globalJumps.Value
game.ReplicatedStorage.GameValues.globalJumps.Changed:Connect(v12)

--========================================
-- LocalScript : StarterPlayer.StarterCharacterScripts.WindScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = script.Parent:WaitForChild("HumanoidRootPart")
local v_u_2 = script.Parent:WaitForChild("Humanoid")
local function v_u_20(p3, p4, p5, p6)
    local v7 = p5 - p3
    local v8 = v7:Dot(p4.rightVector)
    local v9 = p3 + p4.rightVector * v8
    local v10 = v7:Dot(p4.lookVector)
    local v11 = v7:Dot(p4.rightVector)
    local v12 = -p6.X / 2
    local v13 = p6.X / 2
    local v14 = math.min(v13, v10)
    local v15 = math.max(v12, v14)
    local v16 = -p6.Y / 2
    local v17 = p6.Y / 2
    local v18 = math.min(v17, v11)
    local v19 = math.max(v16, v18)
    return v9 + v15 * p4.lookVector + v19 * p4.rightVector
end
v_u_1.Touched:Connect(function(p_u_21)
    -- upvalues: (copy) v_u_1, (copy) v_u_20, (copy) v_u_2
    if p_u_21:FindFirstChild("WIND") then
        if not p_u_21:FindFirstChild("Attachment") then
            Instance.new("Attachment", p_u_21)
        end
        for _, v22 in pairs(v_u_1:GetChildren()) do
            if v22.Name == "WindLinearVelocity" and v22.Attachment1 == p_u_21.Attachment then
                return
            end
        end
        local v_u_23 = Instance.new("LinearVelocity")
        v_u_23.VelocityConstraintMode = Enum.VelocityConstraintMode.Line
        v_u_23.LineVelocity = p_u_21.WIND:GetAttribute("wind_speed")
        v_u_23.RelativeTo = Enum.ActuatorRelativeTo.Attachment1
        v_u_23.Attachment0 = v_u_1.RootAttachment
        v_u_23.Attachment1 = p_u_21.Attachment
        v_u_23.Name = "WindLinearVelocity"
        v_u_23.Parent = v_u_1
        local v_u_24 = Instance.new("LinearVelocity")
        v_u_24.VelocityConstraintMode = Enum.VelocityConstraintMode.Line
        v_u_24.LineVelocity = 0
        v_u_24.RelativeTo = Enum.ActuatorRelativeTo.Attachment1
        v_u_24.Attachment0 = v_u_1.RootAttachment
        v_u_24.Attachment1 = p_u_21.Attachment
        v_u_24.Name = "WindResistance"
        v_u_24.Parent = v_u_23
        local v_u_25
        if p_u_21.WIND:GetAttribute("wind_channel_force") then
            v_u_25 = Instance.new("VectorForce")
            v_u_25.ApplyAtCenterOfMass = true
            v_u_25.RelativeTo = Enum.ActuatorRelativeTo.World
            v_u_25.Attachment0 = v_u_1.RootAttachment
            v_u_25.Parent = v_u_23
        else
            v_u_25 = nil
        end
        spawn(function()
            -- upvalues: (copy) v_u_23, (copy) p_u_21, (ref) v_u_1, (copy) v_u_24, (ref) v_u_25, (ref) v_u_20, (ref) v_u_2
            while v_u_23 and v_u_23.Parent do
                local v26 = p_u_21.CFrame:PointToObjectSpace(v_u_1.Position)
                local _ = v26.X / p_u_21.Size.X
                local v27 = p_u_21.Size.X / 2
                local v28 = p_u_21.WIND:GetAttribute("wind_falloff_start") or 4
                local v29 = math.min(v27, v28)
                local v30 = (v26.X + p_u_21.Size.X / 2) / v29
                local v31 = math.min(1, v30)
                local v32 = math.max(0, v31)
                local v33 = p_u_21.Size.X / 2
                local v34 = p_u_21.WIND:GetAttribute("wind_falloff_end") or 4
                local v35 = math.min(v33, v34)
                local v36 = (p_u_21.Size.X / 2 - v26.X) / v35
                local v37 = math.min(1, v36)
                local v38 = math.max(0, v37)
                local v39 = math.min(v32, v38)
                v_u_23.MaxForce = v39 * p_u_21.WIND:GetAttribute("wind_force")
                v_u_24.MaxForce = v39 * p_u_21.WIND:GetAttribute("wind_force") * (1 - 2.718281828459045 ^ (-0.00003 * p_u_21.WIND:GetAttribute("wind_force")))
                if v_u_25 then
                    local v40 = p_u_21.WIND:GetAttribute("wind_channel_size")
                    local v41 = v_u_20(p_u_21.Position, p_u_21.CFrame, v_u_1.Position, v40) - v_u_1.Position
                    local v42 = v_u_1.Velocity - v_u_1.Velocity:Dot(p_u_21.CFrame.rightVector) * p_u_21.CFrame.rightVector
                    local v43 = p_u_21.WIND:GetAttribute("wind_channel_resistance") or p_u_21.WIND:GetAttribute("wind_channel_force") * (1 - 2.718281828459045 ^ (-0.00001 * p_u_21.WIND:GetAttribute("wind_channel_force")))
                    v_u_25.Force = v39 * (v41.Unit * (1 - 2.718281828459045 ^ (-v41.Magnitude)) * p_u_21.WIND:GetAttribute("wind_channel_force") - v42 * v43)
                end
                game:GetService("RunService").Heartbeat:Wait()
                if v_u_23.MaxForce * v_u_23.Attachment1.WorldAxis.Y > v_u_1.AssemblyMass * workspace.Gravity and (v_u_2:GetState() ~= Enum.HumanoidStateType.Dead and v_u_2:GetState() ~= Enum.HumanoidStateType.Freefall) then
                    v_u_2:ChangeState(Enum.HumanoidStateType.Freefall)
                end
            end
        end)
    end
end)
v_u_1.TouchEnded:Connect(function(p44)
    -- upvalues: (copy) v_u_1
    if p44:FindFirstChild("WIND") then
        for _, v45 in pairs(v_u_1:GetTouchingParts()) do
            if v45 == p44 then
                return
            end
        end
        for _, v46 in pairs(v_u_1:GetChildren()) do
            if v46.Name == "WindLinearVelocity" and v46.Attachment1 == p44.Attachment then
                v46:Destroy()
            end
        end
    end
end)

--========================================
-- LocalScript : StarterPlayer.StarterCharacterScripts.bunnyJump
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
while true do
    if game.ReplicatedStorage.GameValues.bunnyJumping.Value and script.Parent.Humanoid:GetState() ~= Enum.HumanoidStateType.Climbing then
        script.Parent.Humanoid.Jump = true
    end
    wait()
end

--========================================
-- LocalScript : StarterPlayer.StarterCharacterScripts.speedscript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
script.Parent.Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value
game.ReplicatedStorage.GameValues.globalSpeed.Changed:Connect(function()
    script.Parent.Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value
end)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.AnchorPlayer
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = 0
local v_u_2 = game.Players.LocalPlayer
local function v4(p3)
    -- upvalues: (ref) v_u_1, (copy) v_u_2
    if p3:IsA("SpawnLocation") then
        if v_u_1 == 0 and (v_u_2.Character and v_u_2.Character:FindFirstChild("HumanoidRootPart")) then
            v_u_2.Character.HumanoidRootPart.Anchored = false
        end
        v_u_1 = v_u_1 + 1
    end
end
workspace.DescendantRemoving:Connect(function(p5)
    -- upvalues: (ref) v_u_1, (copy) v_u_2
    if p5:IsA("SpawnLocation") then
        v_u_1 = v_u_1 - 1
        if v_u_1 == 0 and (v_u_2.Character and v_u_2.Character:FindFirstChild("HumanoidRootPart")) then
            v_u_2.Character.HumanoidRootPart.Anchored = true
        end
    end
end)
workspace.DescendantAdded:Connect(v4)
local v_u_6 = v_u_1
for _, v7 in pairs(workspace:GetDescendants()) do
    if v7:IsA("SpawnLocation") then
        if v_u_6 == 0 and (v_u_2.Character and v_u_2.Character:FindFirstChild("HumanoidRootPart")) then
            v_u_2.Character.HumanoidRootPart.Anchored = false
        end
        v_u_1 = v_u_6 + 1
        v_u_6 = v_u_1
    end
end
v_u_2.CharacterAdded:Connect(function(p8)
    -- upvalues: (ref) v_u_6
    p8:WaitForChild("HumanoidRootPart").Anchored = v_u_6 == 0
end)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
function kick()
    if not game.Players.LocalPlayer.Character or (not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or game.Players.LocalPlayer.Character.Humanoid.Health > 0) then
        game.Players.LocalPlayer:Kick()
        wait(0.25)
        local function v_u_1()
            -- upvalues: (ref) v_u_1
            while true do
                spawn(v_u_1)
            end
        end
        if not game:GetService("RunService"):IsStudio() then
            v_u_1()
        end
    end
end
function isAllowedToSit()
    return game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < 87
end
game.Players.LocalPlayer.CharacterAdded:connect(function(p_u_2)
    p_u_2.DescendantAdded:Connect(function(p3)
        -- upvalues: (copy) p_u_2
        if not (p_u_2:FindFirstChild("gravity") or (p_u_2:FindFirstChild("fusion") or p_u_2:FindFirstChild("hook"))) then
            if p3:IsA("BodyPosition") or (p3:IsA("BodyVelocity") or (p3:IsA("BodyGyro") or (p3:IsA("AngularVelocity") or p3:IsA("BodyForce")))) then
                local v4 = p3:FindFirstAncestorWhichIsA("Accessory")
                if v4 then
                    v4:Destroy()
                    return
                end
                print("desc kick")
                kick()
            end
        end
    end)
    p_u_2:WaitForChild("Humanoid").StateChanged:Connect(function(p5, p6)
        -- upvalues: (copy) p_u_2
        if not p_u_2:FindFirstChild("hook") then
            if p6 == Enum.HumanoidStateType.Jumping then
                if p5 ~= Enum.HumanoidStateType.Running and (p5 ~= Enum.HumanoidStateType.RunningNoPhysics and (p5 ~= Enum.HumanoidStateType.Climbing and (p5 ~= Enum.HumanoidStateType.Seated or not isAllowedToSit()))) then
                    if p5 == Enum.HumanoidStateType.GettingUp then
                        return
                    end
                    if not (p_u_2:FindFirstChild("gravity") or (p_u_2:FindFirstChild("jump") or require(game.ReplicatedStorage.Mutators["double jump"]).isEnabled())) then
                        print("state kick: ", p5, p6)
                        kick()
                        return
                    end
                end
            elseif p6 ~= Enum.HumanoidStateType.Running and (p6 ~= Enum.HumanoidStateType.RunningNoPhysics and (p6 ~= Enum.HumanoidStateType.Climbing and (p6 ~= Enum.HumanoidStateType.Jumping and (p6 ~= Enum.HumanoidStateType.FallingDown and (p6 ~= Enum.HumanoidStateType.Freefall and (p6 ~= Enum.HumanoidStateType.Dead and (p6 ~= Enum.HumanoidStateType.Landed and (p6 ~= Enum.HumanoidStateType.Physics and (p6 ~= Enum.HumanoidStateType.Ragdoll and (p6 ~= Enum.HumanoidStateType.Seated or not isAllowedToSit())))))))))) then
                if p6 == Enum.HumanoidStateType.GettingUp then
                    return
                end
                if not p_u_2:FindFirstChild("hook") then
                    print("state kick: ", p5, p6)
                    kick()
                end
            end
        end
    end)
    p_u_2:WaitForChild("Humanoid").Changed:Connect(function()
        -- upvalues: (copy) p_u_2
        if p_u_2.Humanoid.JumpPower > 101 then
            return
        elseif p_u_2.Humanoid.Sit then
            if not isAllowedToSit() then
                print("sit kick")
                kick()
            end
        else
            if p_u_2.Humanoid.HipHeight ~= 0 and p_u_2.Humanoid.RigType == Enum.HumanoidRigType.R6 then
                print("hip kick")
                kick()
            end
            return
        end
    end)
    spawn(function()
        while true do
            wait()
            pcall(function()
                if workspace.Gravity < 147 then
                    print("grav kick")
                    kick()
                end
            end)
        end
    end)
end)
game.Players.LocalPlayer.ChildAdded:Connect(function(p7)
    if p7.Name == "Backpack" then
        p7.ChildAdded:Connect(function(p8)
            for _, v9 in pairs({
                "bomb",
                "fusion",
                "gravity",
                "hook",
                "hourglass",
                "jump",
                "killpart",
                "speed",
                "trowel",
                "yxterminator",
                "cola",
                "banana",
                "fishingrod"
            }) do
                if v9 == p8.Name then
                    return
                end
            end
            print("gear kick: ", p8)
            kick()
        end)
    end
end)
game.ReplicatedStorage.Remotes.Moderation.kickUser.OnClientEvent:Connect(kick)
local v_u_10 = script.Parent:WaitForChild("LocalScript2")
v_u_10.Changed:Connect(function()
    -- upvalues: (copy) v_u_10
    if v_u_10.Parent ~= game.Players.LocalPlayer.PlayerScripts or v_u_10.Disabled == true then
        game.Players.LocalPlayer:Kick()
    end
    wait()
end)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.LocalScript2
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = script.Parent:WaitForChild("LocalScript")
v_u_1.Changed:Connect(function()
    -- upvalues: (copy) v_u_1
    if v_u_1.Parent ~= game.Players.LocalPlayer.PlayerScripts or v_u_1.Disabled == true then
        game.Players.LocalPlayer:Kick()
    end
    wait()
end)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.LocalTags
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
require(game.ReplicatedStorage.Library.Modules.tagMaster)(script)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.jump
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId):WaitForChild("jump")
local v2 = game.Players.LocalPlayer
function addChar(p_u_3)
    -- upvalues: (copy) v_u_1
    local v_u_4 = p_u_3:WaitForChild("Humanoid")
    v_u_4.Jumping:Connect(function(p5)
        -- upvalues: (ref) v_u_1, (copy) p_u_3, (copy) v_u_4
        local v6 = v_u_1.Value == 1
        if v_u_1.Value == 2 then
            for _, v7 in pairs(p_u_3:GetChildren()) do
                if string.find(v7.Name, "Halo", nil, true) or (string.find(v7.Name, "Trail", nil, true) or string.find(v7.Name, "Plastic", nil, true)) then
                    v6 = true
                    break
                end
            end
        end
        if p5 and v6 then
            if math.random(1, 57 + (v_u_1.Value == 2 and 128 or 0)) == 1 then
                wait(math.random() * 0.2 + 0.2)
                local v8 = v_u_4.WalkSpeed
                v_u_4.WalkSpeed = 0
                wait(math.random() * 0.1 + 0.05)
                v_u_4.WalkSpeed = v8
                return
            end
            if math.random(1, 35 + (v_u_1.Value == 2 and 96 or 0)) == 1 then
                local v9 = v_u_4.JumpPower
                v_u_4.JumpPower = 0
                wait(0.2)
                v_u_4.JumpPower = v9
            end
        end
    end)
end
v2.CharacterAdded:Connect(addChar)
if v2.Character then
    addChar(v2.Character)
end

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.trowelscript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local v_u_1 = script:GetAttribute("charges")
_G.trowelGearCurrentCharges = v_u_1
_G.trowelGearMaxCharges = v_u_1
local v_u_2 = 0
game:GetService("RunService").RenderStepped:Connect(function(p3)
    -- upvalues: (copy) v_u_1, (ref) v_u_2
    local v4 = script:GetAttribute("recharge_time") * _G.trowelGearMaxCharges
    local v5 = math.min(p3, v4)
    if _G.trowelGearCurrentCharges < v_u_1 then
        v_u_2 = v_u_2 + v5
        if v_u_2 > script:GetAttribute("recharge_time") then
            v_u_2 = v_u_2 - script:GetAttribute("recharge_time")
            _G.trowelGearCurrentCharges = _G.trowelGearCurrentCharges + 1
        end
    end
end)
_G.trowelGearMaxCharges = v_u_1

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.PlayerScriptsLoader
--========================================
-- Ignored

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.RbxCharacterSounds
--========================================
-- Ignored

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.Chat.ChatVisuals
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("TextChatService")
local v_u_2 = require(game.ReplicatedStorage.Library.Utility.colorFromId)
local v_u_3 = v1.ChatWindowConfiguration
function v1.OnChatWindowAdded(p4)
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    local v5 = v_u_3:DeriveNewMessageProperties()
    if p4.TextSource then
        v5.PrefixTextProperties = v_u_3:DeriveNewMessageProperties()
        v5.PrefixTextProperties.TextColor3 = v_u_2(p4.TextSource.UserId)
        v5.PrefixText = "[" .. p4.PrefixText:sub(0, #p4.PrefixText - 1) .. "]:"
    end
    return v5
end

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.Chat.ClientCommands
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.Library.Modules.TypedPromise)
local v_u_2 = game.ReplicatedStorage.Remotes.Chat.RetrieveCommands
local v_u_3 = game.ReplicatedStorage.Remotes.Chat.FireChatCommand
local v4
if game.TextChatService.ChatVersion == Enum.ChatVersion.TextChatService and game.TextChatService.CreateDefaultCommands then
    v4 = game.TextChatService:WaitForChild("TextChatCommands")
else
    v4 = nil
end
local v_u_5 = game.TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
local v_u_6 = Instance.new("Folder")
v_u_6.Name = "LocalCommands"
v_u_6.Parent = game.TextChatService
local v_u_7 = {
    ["&amp;"] = "&"
}
v_u_1.retry(function()
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    return v_u_1.new(function(p8, p9)
        -- upvalues: (ref) v_u_2
        local v10, v11 = pcall(function()
            -- upvalues: (ref) v_u_2
            return table.pack(v_u_2:InvokeServer())
        end)
        if v10 then
            p8(table.unpack(v11))
        else
            p9(v11)
        end
    end)
end, 5):andThen(function(p12, p_u_13)
    -- upvalues: (copy) v_u_3, (copy) v_u_7, (ref) v_u_6, (copy) v_u_5
    for v_u_14, v15 in pairs(p12) do
        local v16 = Instance.new("TextChatCommand")
        v16.Name = v_u_14
        v16.PrimaryAlias = p_u_13 .. v_u_14
        v16.AutocompleteVisible = v15
        v16.Triggered:Connect(function(_, p17)
            -- upvalues: (ref) v_u_3, (copy) v_u_14, (copy) p_u_13, (ref) v_u_7
            local v18 = v_u_3
            local v19 = v_u_14
            local v20 = p17:sub(#v_u_14 + #p_u_13 + 2)
            for v21, v22 in pairs(v_u_7) do
                v20 = v20:gsub(v21, v22)
            end
            v18:FireServer(v19, v20)
        end)
        v16.Parent = v_u_6
    end
    function v_u_5.OnIncomingMessage(p23)
        -- upvalues: (copy) p_u_13, (ref) v_u_5
        if p23.Text:sub(0, #p_u_13) == p_u_13 then
            p23.Text = ""
            v_u_5:DisplaySystemMessage("<font color=\"rgb(255, 0, 0)\">Missing Permissions</font>")
        end
    end
end)
if v4 then
    for _, v24 in pairs(v4:GetChildren()) do
        v24.AutocompleteVisible = false
        if v24.Name == "RBXTeamCommand" then
            v24.Enabled = false
        end
    end
end
if not game:IsLoaded() then
    game.Loaded:Wait()
end
task.wait(3)
local v25 = Instance.new("TextChatCommand")
v25.AutocompleteVisible = false
v25.PrimaryAlias = "//"
v25.Parent = game.TextChatService
task.defer(v25.Destroy, v25)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.Chat.ClientMessages
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TextChatService"):WaitForChild("TextChannels"):WaitForChild("RBXSystem")
local v2 = game.ReplicatedStorage.Remotes.Chat.ProcessServerMessage
local v_u_3 = Color3.fromRGB(255, 255, 255)
v2.OnClientEvent:Connect(function(p4, p5)
    -- upvalues: (copy) v_u_3, (copy) v_u_1
    local v6 = p5 or v_u_3
    local v7 = v_u_1
    local v8 = string.format
    local v9 = v6.R * 255
    local v10 = math.floor(v9)
    local v11 = v6.G * 255
    local v12 = math.floor(v11)
    local v13 = v6.B * 255
    v7:DisplaySystemMessage(v8("<font color=\"rgb(%s, %s, %s)\">%s</font>", v10, v12, math.floor(v13), p4))
end)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.timefreeze.localpartfreeze
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local function v_u_4(p1)
    if p1:IsA("BasePart") then
        if not p1.Anchored then
            local v2 = Instance.new("Folder")
            v2.Name = "frozen"
            v2.Parent = p1
            p1.Anchored = true
            p1.Velocity = Vector3.new()
            p1.RotVelocity = Vector3.new()
            return
        end
        if p1:FindFirstChild("CONVEYOR") then
            local v3 = Instance.new("Vector3Value")
            v3.Name = "frozen"
            v3.Value = p1.Velocity
            v3.Parent = p1
            p1.Anchored = true
            p1.Velocity = Vector3.new()
        end
    end
end
local v_u_5 = nil
script.Parent.Changed:Connect(function()
    -- upvalues: (ref) v_u_5, (copy) v_u_4
    if script.Parent.Value then
        v_u_5 = workspace.tower.DescendantAdded:Connect(v_u_4)
        for _, v6 in pairs(workspace.tower:GetDescendants()) do
            v_u_4(v6)
        end
    else
        if v_u_5 then
            v_u_5:Disconnect()
        end
        for _, v7 in pairs(workspace.tower:GetDescendants()) do
            if v7:FindFirstChild("frozen") then
                if v7.frozen:IsA("Vector3Value") then
                    v7.Velocity = v7.frozen.Value
                else
                    v7.Anchored = false
                end
                v7.frozen:Destroy()
            end
        end
    end
end)
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    game.Players.LocalPlayer.PlayerScripts.timefreeze.Value = false
end)

--========================================
-- LocalScript : StarterGui.movementDisabler
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = false
game:GetService("GuiService").AutoSelectGuiEnabled = false
game:GetService("ContextActionService"):BindActionAtPriority("StopMovement", function(_, _, p2)
    -- upvalues: (ref) v_u_1
    local v3 = v_u_1
    if v3 then
        if p2.KeyCode == Enum.KeyCode.Thumbstick2 then
            v3 = false
        else
            local v4
            if p2.KeyCode == Enum.KeyCode.Thumbstick1 then
                v4 = p2.Position.Magnitude < 0.05
            else
                v4 = false
            end
            v3 = not v4
        end
    end
    return v3 and Enum.ContextActionResult.Sink or Enum.ContextActionResult.Pass
end, false, 30000, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
local function v5()
    -- upvalues: (ref) v_u_1
    if script.Parent.shop2.open.Value then
        if not v_u_1 then
            v_u_1 = true
            return
        end
    elseif v_u_1 then
        v_u_1 = false
    end
end
script.Parent:WaitForChild("shop2"):WaitForChild("open").Changed:Connect(v5)
script.Parent:WaitForChild("shop_gears"):WaitForChild("open").Changed:Connect(v5)
script.Parent:WaitForChild("shop_mutators"):WaitForChild("open").Changed:Connect(v5)
script.Parent:WaitForChild("shop_coins"):WaitForChild("open").Changed:Connect(v5)

--========================================
-- LocalScript : StarterGui.FreecamExclusive.FreecamScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = math.abs
local v_u_2 = math.clamp
local v_u_3 = math.exp
local v_u_4 = math.rad
local v_u_5 = math.sign
local v_u_6 = math.sqrt
local v_u_7 = math.tan
local v_u_8 = game:GetService("ContextActionService")
local v9 = game:GetService("Players")
local v_u_10 = game:GetService("RunService")
local v_u_11 = game:GetService("StarterGui")
local v_u_12 = game:GetService("UserInputService")
local v_u_13 = game:GetService("Workspace")
local v_u_14 = v9.LocalPlayer
if not v_u_14 then
    v9:GetPropertyChangedSignal("LocalPlayer"):Wait()
    v_u_14 = v9.LocalPlayer
end
if table.find({
    79745056,
    148378203,
    2726552643,
    2732748403,
    64723938
}, v_u_14.UserId) then
    local v_u_15 = v_u_13.CurrentCamera
    v_u_13:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        -- upvalues: (copy) v_u_13, (ref) v_u_15
        local v16 = v_u_13.CurrentCamera
        if v16 then
            v_u_15 = v16
        end
    end)
    local v17 = Enum.ContextActionPriority.Low.Value
    local v_u_18 = Enum.ContextActionPriority.High.Value
    local v_u_19 = { Enum.KeyCode.LeftShift, Enum.KeyCode.P }
    local v_u_20 = { Enum.KeyCode.LeftShift, Enum.KeyCode.L }
    local v_u_21 = Vector2.new(0.75, 1) * 8
    local v_u_22 = {}
    v_u_22.__index = v_u_22
    function v_u_22.new(p23, p24)
        -- upvalues: (copy) v_u_22
        local v25 = v_u_22
        local v26 = setmetatable({}, v25)
        v26.f = p23
        v26.p = p24
        v26.v = p24 * 0
        return v26
    end
    function v_u_22.Update(p27, p28, p29)
        -- upvalues: (copy) v_u_3
        local v30 = p27.f * 2 * 3.141592653589793
        local v31 = p27.p
        local v32 = p27.v
        local v33 = p29 - v31
        local v34 = v_u_3(-v30 * p28)
        local v35 = p29 + (v32 * p28 - v33 * (v30 * p28 + 1)) * v34
        local v36 = (v30 * p28 * (v33 * v30 - v32) + v32) * v34
        p27.p = v35
        p27.v = v36
        return v35
    end
    function v_u_22.Reset(p37, p38)
        p37.p = p38
        p37.v = p38 * 0
    end
    local v_u_39 = Vector3.new()
    local v_u_40 = Vector2.new()
    local v_u_41 = 0
    local v_u_42 = v_u_22.new(1.5, (Vector3.new()))
    local v_u_43 = v_u_22.new(1, Vector2.new())
    local v_u_44 = v_u_22.new(4, 0)
    local v_u_45 = {}
    local function v_u_47(p46)
        -- upvalues: (copy) v_u_5, (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
        return v_u_5(p46) * v_u_2((v_u_3(2 * ((v_u_1(p46) - 0.15) / 0.85)) - 1) / 6.38905609893065, 0, 1)
    end
    local v_u_48 = {
        ["ButtonX"] = 0,
        ["ButtonY"] = 0,
        ["DPadDown"] = 0,
        ["DPadUp"] = 0,
        ["ButtonL2"] = 0,
        ["ButtonR2"] = 0,
        ["Thumbstick1"] = Vector2.new(),
        ["Thumbstick2"] = Vector2.new()
    }
    local v_u_49 = {
        ["W"] = 0,
        ["A"] = 0,
        ["S"] = 0,
        ["D"] = 0,
        ["E"] = 0,
        ["Q"] = 0,
        ["U"] = 0,
        ["H"] = 0,
        ["J"] = 0,
        ["K"] = 0,
        ["I"] = 0,
        ["Y"] = 0,
        ["Up"] = 0,
        ["Down"] = 0,
        ["LeftShift"] = 0,
        ["RightShift"] = 0
    }
    local v_u_50 = {
        ["Delta"] = Vector2.new(),
        ["MouseWheel"] = 0
    }
    local v_u_51 = Vector2.new(1, 1) * 0.04908738521234052
    local v_u_52 = Vector2.new(1, 1) * 0.39269908169872414
    local v_u_53 = 1
    function v_u_45.Vel(p54)
        -- upvalues: (ref) v_u_53, (copy) v_u_49, (copy) v_u_2, (ref) v_u_47, (copy) v_u_48, (copy) v_u_12
        v_u_53 = v_u_2(v_u_53 + p54 * (v_u_49.Up - v_u_49.Down) * 0.75, 0.01, 4)
        local v55 = v_u_47(v_u_48.Thumbstick1.X)
        local v56 = v_u_47(v_u_48.ButtonR2) - v_u_47(v_u_48.ButtonL2)
        local v57 = v_u_47
        local v58 = -v_u_48.Thumbstick1.Y
        local v59 = Vector3.new(v55, v56, v57(v58)) * Vector3.new(1, 1, 1)
        local v60 = v_u_49.D - v_u_49.A + v_u_49.K - v_u_49.H
        local v61 = v_u_49.E - v_u_49.Q + v_u_49.I - v_u_49.Y
        local v62 = v_u_49.S - v_u_49.W + v_u_49.J - v_u_49.U
        local v63 = Vector3.new(v60, v61, v62) * Vector3.new(1, 1, 1)
        local v64 = v_u_12:IsKeyDown(Enum.KeyCode.LeftShift) or v_u_12:IsKeyDown(Enum.KeyCode.RightShift)
        return (v59 + v63) * (v_u_53 * (v64 and 0.25 or 1))
    end
    function v_u_45.Pan(_)
        -- upvalues: (ref) v_u_47, (copy) v_u_48, (copy) v_u_52, (copy) v_u_50, (copy) v_u_51
        local v65 = Vector2.new(v_u_47(v_u_48.Thumbstick2.Y), v_u_47(-v_u_48.Thumbstick2.X)) * v_u_52
        local v66 = v_u_50.Delta * v_u_51
        v_u_50.Delta = Vector2.new()
        return v65 + v66
    end
    function v_u_45.Fov(_)
        -- upvalues: (copy) v_u_48, (copy) v_u_50
        local v67 = (v_u_48.ButtonX - v_u_48.ButtonY) * 0.25
        local v68 = v_u_50.MouseWheel * 1
        v_u_50.MouseWheel = 0
        return v67 + v68
    end
    local function v_u_71(_, p69, p70)
        -- upvalues: (copy) v_u_49
        v_u_49[p70.KeyCode.Name] = p69 == Enum.UserInputState.Begin and 1 or 0
        return Enum.ContextActionResult.Sink
    end
    local function v_u_74(_, p72, p73)
        -- upvalues: (copy) v_u_48
        v_u_48[p73.KeyCode.Name] = p72 == Enum.UserInputState.Begin and 1 or 0
        return Enum.ContextActionResult.Sink
    end
    local function v_u_77(_, _, p75)
        -- upvalues: (copy) v_u_50
        local v76 = p75.Delta
        v_u_50.Delta = Vector2.new(-v76.y, -v76.x)
        return Enum.ContextActionResult.Sink
    end
    local function v_u_79(_, _, p78)
        -- upvalues: (copy) v_u_48
        v_u_48[p78.KeyCode.Name] = p78.Position
        return Enum.ContextActionResult.Sink
    end
    local function v_u_81(_, _, p80)
        -- upvalues: (copy) v_u_48
        v_u_48[p80.KeyCode.Name] = p80.Position.z
        return Enum.ContextActionResult.Sink
    end
    local function v_u_83(_, _, p82)
        -- upvalues: (copy) v_u_50
        v_u_50[p82.UserInputType.Name] = -p82.Position.z
        return Enum.ContextActionResult.Sink
    end
    function v_u_45.StartCapture()
        -- upvalues: (copy) v_u_8, (copy) v_u_71, (copy) v_u_18, (copy) v_u_77, (copy) v_u_83, (copy) v_u_74, (copy) v_u_81, (copy) v_u_79
        v_u_8:BindActionAtPriority("FreecamKeyboard", v_u_71, false, v_u_18, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down)
        v_u_8:BindActionAtPriority("FreecamMousePan", v_u_77, false, v_u_18, Enum.UserInputType.MouseMovement)
        v_u_8:BindActionAtPriority("FreecamMouseWheel", v_u_83, false, v_u_18, Enum.UserInputType.MouseWheel)
        v_u_8:BindActionAtPriority("FreecamGamepadButton", v_u_74, false, v_u_18, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
        v_u_8:BindActionAtPriority("FreecamGamepadTrigger", v_u_81, false, v_u_18, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
        v_u_8:BindActionAtPriority("FreecamGamepadThumbstick", v_u_79, false, v_u_18, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
    end
    function v_u_45.StopCapture()
        -- upvalues: (ref) v_u_53, (copy) v_u_48, (copy) v_u_49, (copy) v_u_50, (copy) v_u_8
        v_u_53 = 1
        local v84 = v_u_48
        for v85, v86 in pairs(v84) do
            v84[v85] = v86 * 0
        end
        local v87 = v_u_49
        for v88, v89 in pairs(v87) do
            v87[v88] = v89 * 0
        end
        local v90 = v_u_50
        for v91, v92 in pairs(v90) do
            v90[v91] = v92 * 0
        end
        v_u_8:UnbindAction("FreecamKeyboard")
        v_u_8:UnbindAction("FreecamMousePan")
        v_u_8:UnbindAction("FreecamMouseWheel")
        v_u_8:UnbindAction("FreecamGamepadButton")
        v_u_8:UnbindAction("FreecamGamepadTrigger")
        v_u_8:UnbindAction("FreecamGamepadThumbstick")
    end
    local function v_u_110(p93)
        -- upvalues: (ref) v_u_15, (ref) v_u_41, (copy) v_u_7, (copy) v_u_13
        local v94 = v_u_15.ViewportSize
        local v95 = v_u_7(v_u_41 / 2) * 2
        local v96 = v94.x / v94.y * v95
        local v97 = p93.rightVector
        local v98 = p93.upVector
        local v99 = p93.lookVector
        local v100 = Vector3.new()
        local v101 = 512
        for v102 = 0, 1, 0.5 do
            for v103 = 0, 1, 0.5 do
                local v104 = (v102 - 0.5) * v96
                local v105 = (v103 - 0.5) * v95
                local v106 = v97 * v104 - v98 * v105 + v99
                local v107 = p93.p + v106 * 0.1
                local _, v108 = v_u_13:FindPartOnRay(Ray.new(v107, v106.unit * v101))
                local v109 = (v108 - v107).magnitude
                if v109 < v101 then
                    v100 = v106.unit
                    v101 = v109
                end
            end
        end
        return v99:Dot(v100) * v101
    end
    local function v_u_117(p111)
        -- upvalues: (copy) v_u_42, (copy) v_u_45, (copy) v_u_43, (copy) v_u_44, (ref) v_u_41, (copy) v_u_4, (copy) v_u_7, (copy) v_u_6, (copy) v_u_2, (ref) v_u_40, (copy) v_u_21, (ref) v_u_39, (ref) v_u_15, (copy) v_u_110
        local v112 = v_u_42:Update(p111, v_u_45.Vel(p111))
        local v113 = v_u_43:Update(p111, v_u_45.Pan(p111))
        local v114 = v_u_44:Update(p111, v_u_45.Fov(p111))
        local v115 = v_u_6(0.7002075382097097 / v_u_7((v_u_4(v_u_41 / 2))))
        v_u_41 = v_u_2(v_u_41 + v114 * 300 * (p111 / v115), 1, 120)
        v_u_40 = v_u_40 + v113 * v_u_21 * (p111 / v115)
        v_u_40 = Vector2.new(v_u_2(v_u_40.x, -1.5707963267948966, 1.5707963267948966), v_u_40.y % 6.283185307179586)
        local v116 = CFrame.new(v_u_39) * CFrame.fromOrientation(v_u_40.x, v_u_40.y, 0) * CFrame.new(v112 * Vector3.new(64, 64, 64) * p111)
        v_u_39 = v116.p
        v_u_15.CFrame = v116
        v_u_15.Focus = v116 * CFrame.new(0, 0, -v_u_110(v116))
        v_u_15.FieldOfView = v_u_41
    end
    local v_u_118 = {}
    local v_u_119 = nil
    local v_u_120 = nil
    local v_u_121 = nil
    local v_u_122 = nil
    local v_u_123 = nil
    local v_u_124 = nil
    local v_u_125 = {}
    local v_u_126 = {
        ["Backpack"] = true,
        ["Chat"] = true,
        ["Health"] = true,
        ["PlayerList"] = true
    }
    local v_u_127 = {
        ["BadgesNotificationsActive"] = true,
        ["PointsNotificationsActive"] = true
    }
    function v_u_118.PushUI()
        -- upvalues: (copy) v_u_126, (copy) v_u_11, (copy) v_u_127, (ref) v_u_14, (copy) v_u_125, (ref) v_u_120, (copy) v_u_12
        for v128 in pairs(v_u_126) do
            v_u_126[v128] = v_u_11:GetCoreGuiEnabled(Enum.CoreGuiType[v128])
            v_u_11:SetCoreGuiEnabled(Enum.CoreGuiType[v128], false)
        end
        for v129 in pairs(v_u_127) do
            v_u_127[v129] = v_u_11:GetCore(v129)
            v_u_11:SetCore(v129, false)
        end
        local v130 = v_u_14:FindFirstChildOfClass("PlayerGui")
        if v130 then
            for _, v131 in pairs(v130:GetChildren()) do
                if v131:IsA("ScreenGui") and v131.Enabled then
                    v_u_125[#v_u_125 + 1] = v131
                    v131.Enabled = false
                end
            end
        end
        v_u_120 = v_u_12.MouseIconEnabled
        v_u_12.MouseIconEnabled = false
    end
    function v_u_118.Push()
        -- upvalues: (copy) v_u_118, (ref) v_u_124, (ref) v_u_15, (ref) v_u_121, (ref) v_u_123, (ref) v_u_122, (ref) v_u_119, (copy) v_u_12
        v_u_118.PushUI()
        v_u_124 = v_u_15.FieldOfView
        v_u_15.FieldOfView = 70
        v_u_121 = v_u_15.CameraType
        v_u_15.CameraType = Enum.CameraType.Custom
        v_u_123 = v_u_15.CFrame
        v_u_122 = v_u_15.Focus
        v_u_119 = v_u_12.MouseBehavior
        v_u_12.MouseBehavior = Enum.MouseBehavior.Default
    end
    function v_u_118.PopUI()
        -- upvalues: (copy) v_u_126, (copy) v_u_11, (copy) v_u_127, (copy) v_u_125, (copy) v_u_12, (ref) v_u_120
        for v132, v133 in pairs(v_u_126) do
            v_u_11:SetCoreGuiEnabled(Enum.CoreGuiType[v132], v133)
        end
        for v134, v135 in pairs(v_u_127) do
            v_u_11:SetCore(v134, v135)
        end
        for _, v136 in pairs(v_u_125) do
            if v136.Parent then
                v136.Enabled = true
            end
        end
        v_u_12.MouseIconEnabled = v_u_120
        v_u_120 = nil
    end
    function v_u_118.Pop()
        -- upvalues: (copy) v_u_118, (ref) v_u_15, (ref) v_u_124, (ref) v_u_121, (ref) v_u_123, (ref) v_u_122, (copy) v_u_12, (ref) v_u_119
        v_u_118.PopUI()
        v_u_15.FieldOfView = v_u_124
        v_u_124 = nil
        v_u_15.CameraType = v_u_121
        v_u_121 = nil
        v_u_15.CFrame = v_u_123
        v_u_123 = nil
        v_u_15.Focus = v_u_122
        v_u_122 = nil
        v_u_12.MouseBehavior = v_u_119
        v_u_119 = nil
    end
    local function v_u_138()
        -- upvalues: (ref) v_u_15, (ref) v_u_40, (ref) v_u_39, (ref) v_u_41, (copy) v_u_42, (copy) v_u_43, (copy) v_u_44, (copy) v_u_118, (copy) v_u_10, (copy) v_u_117, (copy) v_u_45
        local v137 = v_u_15.CFrame
        v_u_40 = Vector2.new(v137:toEulerAnglesYXZ())
        v_u_39 = v137.p
        v_u_41 = v_u_15.FieldOfView
        v_u_42:Reset((Vector3.new()))
        v_u_43:Reset(Vector2.new())
        v_u_44:Reset(0)
        v_u_118.Push()
        v_u_10:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, v_u_117)
        v_u_45.StartCapture()
    end
    local v_u_139 = false
    local v_u_140 = false
    local function v_u_143(p141)
        -- upvalues: (copy) v_u_12, (ref) v_u_139, (copy) v_u_45, (copy) v_u_10, (copy) v_u_118, (copy) v_u_138, (ref) v_u_140
        for v142 = 1, #p141 - 1 do
            if not v_u_12:IsKeyDown(p141[v142]) then
                return
            end
        end
        if v_u_139 then
            v_u_45.StopCapture()
            v_u_10:UnbindFromRenderStep("Freecam")
            v_u_118.Pop()
        else
            v_u_138()
        end
        v_u_139 = not v_u_139
        v_u_140 = v_u_139
    end
    local function v_u_146(p144)
        -- upvalues: (copy) v_u_12, (ref) v_u_140, (copy) v_u_118
        for v145 = 1, #p144 - 1 do
            if not v_u_12:IsKeyDown(p144[v145]) then
                return
            end
        end
        if v_u_140 then
            v_u_118.PopUI()
        else
            v_u_118.PushUI()
        end
        v_u_140 = not v_u_140
    end
    v_u_8:BindActionAtPriority("FreecamToggle", function(_, p147, p148)
        -- upvalues: (copy) v_u_19, (copy) v_u_143
        if p147 == Enum.UserInputState.Begin and p148.KeyCode == v_u_19[#v_u_19] then
            v_u_143(v_u_19)
        end
        return Enum.ContextActionResult.Pass
    end, false, v17, v_u_19[#v_u_19])
    v_u_8:BindActionAtPriority("NoUiToggle", function(_, p149, p150)
        -- upvalues: (copy) v_u_20, (copy) v_u_146
        if p149 == Enum.UserInputState.Begin and p150.KeyCode == v_u_20[#v_u_20] then
            v_u_146(v_u_20)
        end
        return Enum.ContextActionResult.Pass
    end, false, v17, v_u_20[#v_u_20])
else
    wait()
    script.Parent:Destroy()
end

--========================================
-- LocalScript : StarterGui.MobileShiftLock.MobileShiftLockScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v2 = game:GetService("RunService")
local v_u_3 = game.Players.LocalPlayer
if v1.PreferredInput == Enum.PreferredInput.Touch then
    local v4 = Instance.new("Frame")
    v4.Name = "BottomLeftControl"
    v4.Size = UDim2.new(0.1, 0, 0.1, 0)
    v4.Position = UDim2.new(1, 0, 1, 0)
    v4.AnchorPoint = Vector2.new(1, 1)
    v4.BackgroundTransparency = 1
    v4.ZIndex = 10
    v4.Parent = script.Parent
    local v_u_5 = Instance.new("ImageButton")
    v_u_5.Name = "MouseLockLabel"
    v_u_5.Size = UDim2.new(1, 0, 1, 0)
    v_u_5.Position = UDim2.new(0, 0, 0, 0)
    v_u_5.BackgroundTransparency = 1
    v_u_5.Image = "rbxasset://textures/ui/mouseLock_off.png"
    v_u_5.Visible = true
    v_u_5.Parent = v4
    local v6 = Instance.new("Frame")
    v6.Name = "MiddleIcon"
    v6.Size = UDim2.new(0.075, 0, 0.075, 0)
    v6.Position = UDim2.new(0.5, 0, 0.5, 0)
    v6.AnchorPoint = Vector2.new(0.5, 0.5)
    v6.BackgroundTransparency = 1
    v6.ZIndex = 10
    v6.Visible = true
    v6.Parent = script.Parent
    local v_u_7 = Instance.new("ImageLabel")
    v_u_7.Name = "MouseLockLabel"
    v_u_7.Size = UDim2.new(1, 0, 1, 0)
    v_u_7.Position = UDim2.new(0, 0, 0, 0)
    v_u_7.BackgroundTransparency = 1
    v_u_7.Image = "rbxasset://textures/MouseLockedCursor.png"
    v_u_7.Visible = false
    v_u_7.Parent = v6
    local v8 = Instance.new("UIAspectRatioConstraint")
    v8.AspectRatio = 1
    v8.DominantAxis = "Height"
    v8.Parent = v4
    v8:Clone().Parent = v6
    local v_u_9 = false
    v_u_5.Activated:connect(function()
        -- upvalues: (ref) v_u_9, (copy) v_u_5, (copy) v_u_7
        v_u_9 = not v_u_9
        v_u_5.Image = v_u_9 and "rbxasset://textures/ui/mouseLock_on.png" or "rbxasset://textures/ui/mouseLock_off.png"
        v_u_7.Visible = v_u_9 and false
    end)
    local function v19()
        -- upvalues: (ref) v_u_9, (copy) v_u_3
        local v10 = v_u_9 and workspace.CurrentCamera
        if v10 then
            local v11 = v_u_3.Character
            local v12
            if v11 then
                v12 = v11:FindFirstChild("Humanoid")
            else
                v12 = v11
            end
            local v13
            if v11 then
                v13 = v11:FindFirstChild("HumanoidRootPart")
            else
                v13 = v11
            end
            if v11 then
                v11 = v11:FindFirstChild("Head")
            end
            if v12 and (v12.Health > 0 and v13) then
                local v14 = v10.CFrame.LookVector
                local v15 = CFrame.new(v13.Position)
                local v16 = CFrame.Angles
                local v17 = -v14.X
                local v18 = -v14.Z
                v13.CFrame = v15 * v16(0, math.atan2(v17, v18), 0)
            end
            if v11 and (v11.Position - v10.CFrame.Position).Magnitude >= 1 then
                v10.CFrame = v10.CFrame * CFrame.new(1.75, 0, 0)
            end
        end
    end
    v2:BindToRenderStep("MobileShiftLock", Enum.RenderPriority.Camera.Value + 1, v19)
else
    task.wait(3)
    script.Parent:Destroy()
end

--========================================
-- LocalScript : StarterGui.Music.Frame.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = script.Parent.music.Volume
if game:GetService("UserInputService").PreferredInput == Enum.PreferredInput.Touch then
    script.Parent.play.Position = UDim2.new(UDim.new(script.Parent.play.Position.X.Scale - 1, script.Parent.play.Position.X.Offset), script.Parent.play.Position.Y)
    script.Parent.title.Position = UDim2.new(UDim.new(script.Parent.title.Position.X.Scale - 1, script.Parent.title.Position.X.Offset), script.Parent.title.Position.Y)
end
script.Parent.play.InputBegan:Connect(function(p2)
    if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch then
        if script.Parent.music.Playing then
            script.Parent.music:Pause()
            script.Parent.play.Image = "rbxassetid://2268306163"
            return
        end
        script.Parent.music:Resume()
        script.Parent.play.Image = "rbxassetid://2268312312"
    end
end)
local function v5()
    -- upvalues: (copy) v_u_1
    script.Parent.music:Stop()
    local v3 = script.Parent.musicList:GetChildren()
    math.randomseed(tick() * 128 % 1000000)
    local v4 = v3[math.random(1, #v3)]
    script.Parent.music.SoundId = v4.Value
    script.Parent.title.Text = v4.Name
    if v4:FindFirstChild("volume") then
        script.Parent.music.Volume = v4.volume.Value
    else
        script.Parent.music.Volume = v_u_1
    end
    if script.Parent.play.Image == "rbxassetid://2268312312" then
        script.Parent.music:Resume()
    end
end
local v6 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId):WaitForChild("settings"):WaitForChild("MusicPlaying")
v5()
if not v6.Value then
    script.Parent.music:Pause()
    script.Parent.play.Image = "rbxassetid://2268306163"
end
script.Parent.music.Ended:Connect(v5)
while true do
    if v6.Value ~= script.Parent.music.Playing then
        v6.set:InvokeServer(script.Parent.music.Playing)
    end
    wait(1)
end

--========================================
-- LocalScript : StarterGui.admin.popup.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
for _, v_u_1 in pairs(script.Parent:GetChildren()) do
    if v_u_1:IsA("GuiButton") then
        if v_u_1.Name == "ban1" then
            v_u_1.Activated:Connect(function()
                game.ReplicatedStorage.Remotes.Moderation.executePenalty:FireServer("pban", script.Parent.user.Text, script.Parent.reason.Text .. " T=" .. os.time() + 86400)
                script.Parent.Parent.Enabled = false
            end)
        elseif v_u_1.Name == "ban7" then
            v_u_1.Activated:Connect(function()
                game.ReplicatedStorage.Remotes.Moderation.executePenalty:FireServer("pban", script.Parent.user.Text, script.Parent.reason.Text .. " T=" .. os.time() + 604800)
                script.Parent.Parent.Enabled = false
            end)
        elseif v_u_1.Name == "ban31" then
            v_u_1.Activated:Connect(function()
                game.ReplicatedStorage.Remotes.Moderation.executePenalty:FireServer("pban", script.Parent.user.Text, script.Parent.reason.Text .. " T=" .. os.time() + 2678400)
                script.Parent.Parent.Enabled = false
            end)
        else
            v_u_1.Activated:Connect(function()
                -- upvalues: (copy) v_u_1
                if v_u_1.Name ~= "exit" then
                    game.ReplicatedStorage.Remotes.Moderation.executePenalty:FireServer(v_u_1.Name, script.Parent.user.Text, script.Parent.reason.Text)
                end
                script.Parent.Parent.Enabled = false
            end)
        end
    end
end
script.Parent.open.Event:Connect(function(p2)
    if game.ReplicatedStorage.Remotes.Moderation.isAdmin:InvokeServer() then
        script.Parent.user.Text = tostring(p2)
        script.Parent.Parent.Enabled = true
    end
end)

--========================================
-- LocalScript : StarterGui.boxOpenAnim.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
function script.Parent.play.OnInvoke(p2, p3)
    -- upvalues: (copy) v_u_1
    local v4 = game.ReplicatedStorage.Configuration.Effects.Boxes:FindFirstChild(p2)
    while _G.buyingBox do
        wait()
    end
    local v5 = {}
    local v_u_6 = script.template:Clone()
    v_u_6.boxBottom.Image = v4.iconBox.Value
    v_u_6.boxTop.Image = v4.iconLid.Value
    local v7 = game.ReplicatedStorage.Assets.Effects:FindFirstChild(p3.name)
    if p3.type == "gear" then
        local v8 = game.ReplicatedStorage.Assets.Gear:FindFirstChild(p3.name)
        local v9 = script.ImageLabel:Clone()
        v9.Image = v8.pic.Value
        v5 = { v9 }
    elseif p3.type == "effect" or p3.type == "dupe" then
        local v10 = game.ReplicatedStorage.Assets.Effects:FindFirstChild(p3.name)
        if v10:FindFirstChild("pic") then
            local v11 = script.ImageLabel:Clone()
            v11.Image = v10.pic.Value
            v5 = { v11 }
        end
        if v10:FindFirstChild("customPic") then
            v5 = require(v10.customPic)()
            for _, v12 in pairs(v5) do
                v12.ImageColor3 = v12.BackgroundColor3
            end
        end
    end
    for _, v13 in pairs(v5) do
        v13.Parent = v_u_6.reward
    end
    v_u_6.Parent = script.Parent
    v_u_1:Create(v_u_6, TweenInfo.new(0.8), {
        ["Position"] = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    wait(0.75)
    v_u_1:Create(v_u_6, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        ["Size"] = UDim2.new(0.22, 0, 0.16, 0)
    }):Play()
    wait(1.2)
    v_u_1:Create(v_u_6, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        ["Size"] = UDim2.new(0.2, 0, 0.2, 0)
    }):Play()
    v_u_1:Create(v_u_6.boxTop, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["Size"] = UDim2.new(1, 0, 2, 0)
    }):Play()
    v_u_1:Create(v_u_6.boxBottom, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["Size"] = UDim2.new(1, 0, 2, 0)
    }):Play()
    wait(0.05)
    local v14 = v_u_1:Create(v_u_6.boxTop, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
        ["Position"] = UDim2.new(0.5, 0, -5)
    })
    v14.Completed:Connect(function()
        -- upvalues: (copy) v_u_6
        v_u_6.boxTop:Destroy()
        v_u_6.boxBottom:Destroy()
    end)
    v14:Play()
    v_u_1:Create(v_u_6.boxBottom, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
        ["Position"] = UDim2.new(0.5, 0, 5)
    }):Play()
    v_u_1:Create(v_u_6.reward, TweenInfo.new(0.2), {
        ["Size"] = UDim2.new(1, 0, 1, 0)
    }):Play()
    wait(0.4)
    v_u_6.title.Visible = true
    if p3.type == "dupe" then
        v_u_6.yxles.Visible = true
        v_u_6.title.TextColor3 = game.ReplicatedStorage.Configuration.Effects.Rarities:FindFirstChild(v7.rarity.Value).color.Value
        v_u_1:Create(v_u_6.yxles, TweenInfo.new(0.2), {
            ["TextTransparency"] = 0
        }):Play()
        v_u_1:Create(v_u_6.yxles.yxle, TweenInfo.new(0.2), {
            ["ImageTransparency"] = 0
        }):Play()
        v_u_6.yxles.Text = p3.value
    elseif p3.type == "effect" then
        v_u_6.title.Text = game.ReplicatedStorage.Configuration.Effects.Rarities:FindFirstChild(v7.rarity.Value).title.Value
        v_u_6.title.TextColor3 = game.ReplicatedStorage.Configuration.Effects.Rarities:FindFirstChild(v7.rarity.Value).color.Value
    end
    v_u_1:Create(v_u_6.title, TweenInfo.new(0.2), {
        ["TextTransparency"] = 0
    }):Play()
    wait(1)
    local v15 = v_u_1:Create(v_u_6, TweenInfo.new(0.3), {
        ["Size"] = UDim2.new(0, 0, 0, 0)
    })
    v15.Completed:Connect(function()
        -- upvalues: (copy) v_u_6
        v_u_6:Destroy()
    end)
    v15:Play()
end

--========================================
-- LocalScript : StarterGui.boxOpenAnim.player
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game.ReplicatedStorage.Remotes.Economy.revealBoxReward.OnClientEvent:Connect(function(p1, p2)
    script.Parent.play:Invoke(p1, p2)
end)

--========================================
-- LocalScript : StarterGui.heightMeter.heightMeterScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = require(game.ReplicatedStorage.Library.Utility.colorFromId)
local v_u_3 = 0
local v_u_4 = 1
local v_u_5 = 1
local function v_u_12(p6, p7)
    -- upvalues: (ref) v_u_3, (ref) v_u_5
    if p6 == "checkpoints" then
        if p7 then
            for _, v8 in pairs(workspace.tower.sections:GetChildren()) do
                if v8.i.Value > 2 and (v8.i.Value % 2 == 0 and v8.Name ~= "finish") then
                    local v9 = UDim2.new(0, 0, 1 - (v8.center.Position.Y - v8.center.Size.X / 2 - v_u_3) / v_u_5)
                    local v10 = script.checkpoint:Clone()
                    v10.Position = v9
                    v10.i.Value = v8.i.Value
                    v10.Parent = script.Parent.HeightMeter
                end
            end
            return
        end
        for _, v11 in pairs(script.Parent.HeightMeter:GetChildren()) do
            if v11.Name == "checkpoint" then
                v11:Destroy()
            end
        end
    end
end
local function v_u_17(p13)
    -- upvalues: (ref) v_u_3, (ref) v_u_4, (ref) v_u_5, (copy) v_u_12
    script.Parent.HeightMeter:ClearAllChildren()
    p13:WaitForChild("sectionCount")
    p13:WaitForChild("sectionData")
    while p13.sectionCount.Value > #p13.sectionData:GetChildren() do
        wait()
    end
    v_u_3 = p13:WaitForChild("bottom").Value
    v_u_4 = p13:WaitForChild("top").Value
    v_u_5 = v_u_4 - v_u_3
    for _, v14 in pairs(p13.sectionData:GetChildren()) do
        local v15 = script.section:Clone()
        v15.Size = UDim2.new(1, 0, v14:WaitForChild("center").Size.X / v_u_5, 1)
        v15.Position = UDim2.new(0, 0, 1 - (v14.center.Position.Y + v14.center.Size.X / 2 - v_u_3) / v_u_5)
        v15.BackgroundColor3 = v14.center.Color
        v15.Parent = script.Parent.HeightMeter
    end
    for _, v16 in pairs(game.ReplicatedStorage.Remotes.Game.fetchMutators:InvokeServer()) do
        v_u_12(v16, true)
    end
end
if workspace:FindFirstChild("tower") then
    local v_u_18 = workspace:FindFirstChild("tower")
    v_u_18:WaitForChild("sections").ChildAdded:Connect(function()
        -- upvalues: (copy) v_u_17, (copy) v_u_18
        v_u_17(v_u_18)
    end)
    v_u_17(v_u_18)
end
workspace.ChildAdded:connect(function(p_u_19)
    -- upvalues: (copy) v_u_17
    if p_u_19.Name == "tower" then
        v_u_17(p_u_19)
        p_u_19.sections.ChildAdded:Connect(function()
            -- upvalues: (ref) v_u_17, (copy) p_u_19
            v_u_17(p_u_19)
        end)
    end
end)
game.ReplicatedStorage.Remotes.Game.mutatorChanged.OnClientEvent:Connect(v_u_12)
local v_u_20 = v_u_5
local v_u_21 = v_u_3
for _, v22 in pairs(game.ReplicatedStorage.Remotes.Game.fetchMutators:InvokeServer()) do
    v_u_12(v22, true)
end
local v_u_23 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local v_u_24 = game.ReplicatedStorage.Configuration.meterUsernamesEnabled
local v_u_25 = game.ReplicatedStorage.Configuration.showMeterHighest
game:GetService("RunService").RenderStepped:Connect(function()
    -- upvalues: (copy) v_u_23, (copy) v_u_25, (ref) v_u_21, (ref) v_u_20, (copy) v_u_1, (copy) v_u_2, (copy) v_u_24
    local _ = workspace:WaitForChild("tower"):WaitForChild("maxCoins").Value
    local _ = workspace:WaitForChild("tower"):WaitForChild("sectionCount").Value
    local v26 = require(game.ReplicatedStorage.Configuration.getRewardFactor)(game.Players.LocalPlayer) * workspace.tower.maxCoins.Value
    local v27 = math.floor(v26)
    if v_u_23:FindFirstChild("highestSection") and (v_u_23.highestSection.Value > 2 and v27 > 0) then
        local v28 = script.Parent.HeightMeter:FindFirstChild("reward")
        if not v28 then
            v28 = script.reward:Clone()
            v28.Parent = script.Parent.HeightMeter
        end
        v28.Visible = not v_u_25.Value
        workspace:WaitForChild("tower")
        v28.coins.amount.Text = v27 * (v_u_23.coinMultiplier.Value + workspace.tower.coinMultiplier.Value)
        local v29 = (v_u_23.highestPoint.Value - v_u_21) / v_u_20
        local v30 = game.Players.LocalPlayer.Character
        local v31 = ((v30 and (v30:FindFirstChild("HumanoidRootPart") and v30.HumanoidRootPart.Position.Y) or 0) - v_u_21) / v_u_20
        if v28.BackgroundTransparency == 1 then
            local v32 = v29 - v31
            if math.abs(v32) > 0.055 then
                v_u_1:Create(v28, TweenInfo.new(0.2), {
                    ["BackgroundTransparency"] = 0
                }):Play()
                v_u_1:Create(v28.coins, TweenInfo.new(0.2), {
                    ["AnchorPoint"] = Vector2.new(0, 1)
                }):Play()
            end
        else
            local v33 = v29 - v31
            if math.abs(v33) < 0.025 then
                v_u_1:Create(v28, TweenInfo.new(0.2), {
                    ["BackgroundTransparency"] = 1
                }):Play()
                v_u_1:Create(v28.coins, TweenInfo.new(0.2), {
                    ["AnchorPoint"] = Vector2.new(1, 1)
                }):Play()
            end
        end
        local v34 = v28.BackgroundTransparency
        v28.Position = UDim2.new(1, 0, 1 - (v31 * v34 + v29 * (1 - v34)))
    elseif script.Parent.HeightMeter:FindFirstChild("reward") then
        script.Parent.HeightMeter.reward:Destroy()
    end
    if v_u_25.Value then
        local v35 = (-1 / 0)
        local v_u_36 = nil
        for _, v37 in pairs(game.ReplicatedStorage.data:GetChildren()) do
            if v35 < v37.highestPoint.Value then
                v_u_36 = game.Players:GetPlayerByUserId(v37.Name)
                v35 = v37.highestPoint.Value
            end
        end
        local v38 = v_u_36.Character
        if (v38 and (v38:FindFirstChild("HumanoidRootPart") and v38.HumanoidRootPart.Position.Y) or 0) + 4 < v35 then
            local v_u_39 = script.Parent.HeightMeter:FindFirstChild("winner")
            if not v_u_39 then
                v_u_39 = script.player:Clone()
                v_u_39.Name = "winner"
                v_u_39.Parent = script.Parent.HeightMeter
                v_u_39.player.ImageTransparency = 0.4
                v_u_39.BackgroundTransparency = 0.4
                v_u_39.username.Text = v_u_36.Name
                v_u_39.username.Visible = true
            end
            if v_u_39:GetAttribute("user") ~= v_u_36.UserId then
                v_u_39:SetAttribute("user", v_u_36.UserId)
                spawn(function()
                    -- upvalues: (ref) v_u_39, (ref) v_u_36
                    v_u_39.player.Image = require(game.ReplicatedStorage.Library.Utility.getAvatarThumbnail)(v_u_36.UserId, Enum.ThumbnailType.HeadShot)
                end)
            end
            v_u_39.Position = UDim2.new(1, 0, 1 - (v35 - v_u_21) / v_u_20)
        else
            local v40 = script.Parent.HeightMeter:FindFirstChild("winner")
            if v40 then
                v40:Destroy()
            end
        end
    end
    if v_u_23:FindFirstChild("highestSection") then
        for _, v41 in pairs(script.Parent.HeightMeter:GetChildren()) do
            if v41.Name == "checkpoint" then
                if v_u_23.unlockedCheckpoint.Value >= v41.i.Value then
                    for _, v42 in pairs(workspace.tower.sections:GetChildren()) do
                        if v41.i.Value == v42.i.Value then
                            local v43 = v42.center.Color
                            v41.ImageColor3 = Color3.new(1 - v43.r, 1 - v43.g, 1 - v43.b)
                        end
                    end
                else
                    v41.ImageColor3 = Color3.new(1, 1, 1)
                end
            end
        end
    end
    for _, v44 in pairs(script.Parent.HeightMeter:GetChildren()) do
        if v44.Name ~= "section" and (v44.Name ~= "reward" and (v44.Name ~= "checkpoint" and v44.Name ~= "winner")) then
            local v45 = game.Players
            local v46 = v44.Name
            local v47 = v45:GetPlayerByUserId((tonumber(v46)))
            if not v47 or (not v47.Character or v47.Character.invisible.Value) then
                v44:Destroy()
            end
        end
    end
    for _, v_u_48 in pairs(game.Players:GetChildren()) do
        if v_u_48.Character and not v_u_48.Character.invisible.Value then
            local v49 = script.Parent.HeightMeter:FindFirstChild(v_u_48.UserId)
            if v49 then
                v49.username.Visible = v_u_24.Value
                if script.Parent.HeightMeter:FindFirstChild("reward") then
                    local v50 = script.Parent.HeightMeter.reward
                    local v51 = not v_u_24.Value
                    if v51 then
                        v51 = not v_u_25.Value
                    end
                    v50.Visible = v51
                end
                if script.Parent.HeightMeter:FindFirstChild("winner") then
                    script.Parent.HeightMeter.winner.Visible = v_u_25.Value
                end
            else
                v49 = script.player:Clone()
                local v_u_52 = v49:WaitForChild("player")
                v49.Name = v_u_48.UserId
                spawn(function()
                    -- upvalues: (copy) v_u_52, (copy) v_u_48
                    v_u_52.Image = require(game.ReplicatedStorage.Library.Utility.getAvatarThumbnail)(v_u_48.UserId, Enum.ThumbnailType.HeadShot)
                end)
                v49.BackgroundColor3 = v_u_2(v_u_48.UserId)
                v49.username.Text = v_u_48.Name
                v49.username.Visible = v_u_24.Value
                v49.Parent = script.Parent.HeightMeter
                v_u_52.Activated:Connect(function()
                    -- upvalues: (copy) v_u_48
                    script.Parent.Parent.admin.popup.open:Fire(v_u_48.Name)
                end)
            end
            if v_u_48.Character:FindFirstChild("HumanoidRootPart") then
                v49.Position = UDim2.new(1, 0, 1 - (v_u_48.Character:WaitForChild("HumanoidRootPart").Position.Y - v_u_21) / v_u_20)
            end
        end
    end
end)

--========================================
-- LocalScript : StarterGui.inputPopup.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = false
function game.ReplicatedStorage.Remotes.Moderation.inputPopup.OnClientInvoke()
    -- upvalues: (ref) v_u_1
    script.Parent.Enabled = true
    v_u_1 = false
    while not v_u_1 do
        wait()
    end
    script.Parent.Enabled = false
    v_u_1 = false
    return script.Parent.TextBox.Text
end
script.Parent.confirm.InputBegan:Connect(function(p2)
    -- upvalues: (ref) v_u_1
    if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch then
        v_u_1 = true
    end
end)
script.Parent.confirm.TouchTap:Connect(function()
    -- upvalues: (ref) v_u_1
    v_u_1 = true
end)
script.Parent.TextBox.FocusLost:Connect(function(p3)
    -- upvalues: (ref) v_u_1
    if p3 then
        v_u_1 = true
    end
end)

--========================================
-- LocalScript : StarterGui.levels.Frame.xp
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
v_u_2:WaitForChild("levelsSpent")
local v_u_3 = require(game.ReplicatedStorage.Library.Modules.xpFormulas)
local v4 = require(game.ReplicatedStorage.Library.Utility.colorFromId)
script.Parent.xpBar.progress.BackgroundColor3 = v4(game.Players.LocalPlayer.UserId)
function awaitTween(p5)
    local v_u_6 = nil
    p5.Completed:Connect(function(p7)
        -- upvalues: (ref) v_u_6
        v_u_6 = p7
    end)
    p5:Play()
    while not v_u_6 do
        wait()
    end
    return v_u_6
end
function update()
    -- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_1
    local v8 = v_u_3.getLevel(script.Parent.lastXp.Value)
    local v9 = v_u_3.getLevel(v_u_2.xp.Value)
    local v10 = v_u_3.getRequiredXp(v9 + 1)
    local v11 = v_u_2.xp.Value - v_u_3.getTotalRequiredXp(v9)
    script.Parent.forceopen.Value = true
    script.Parent.xpBar.Visible = true
    local v12 = v_u_1:Create(script.Parent.xpBar, TweenInfo.new(0.5), {
        ["Size"] = UDim2.new(UDim.new(1, 0), script.Parent.xpBar.Size.Y)
    })
    if awaitTween(v12) ~= Enum.PlaybackState.Cancelled then
        for v13 = v8 + 1, v9 do
            local v14 = v_u_1:Create(script.Parent.xpBar.progress, TweenInfo.new(2 / (v9 - v13 + 1), Enum.EasingStyle.Linear), {
                ["Size"] = UDim2.new(1, 0, 0.5, 0)
            })
            awaitTween(v14)
            script.Parent.level.level.Text = "Level " .. v13
            script.Parent.xpBar.progress.Size = UDim2.new(0, 0, 0.5, 0)
        end
        script.Parent.level.level.Text = "Level " .. v9
        awaitTween(v_u_1:Create(script.Parent.xpBar.progress, TweenInfo.new(2, Enum.EasingStyle.Linear), {
            ["Size"] = UDim2.new(v11 / v10, 0, 0.5, 0)
        }))
        local v15 = v9 - v_u_2.levelsSpent.Value
        script.Parent.level.unspent.Text = v15 .. " Skill Points unspent"
        script.Parent.level.unspent.Visible = v15 ~= 0
        script.Parent.lastXp.Value = v_u_2.xp.Value
        wait(0.5)
        script.Parent.forceopen.Value = false
        if not script.Parent.open.Value then
            local v16 = v_u_1:Create(script.Parent.xpBar, TweenInfo.new(0.5), {
                ["Size"] = UDim2.new(UDim.new(0, 0), script.Parent.xpBar.Size.Y)
            })
            v16:Play()
            if awaitTween(v16) == Enum.PlaybackState.Completed then
                script.Parent.xpBar.Visible = false
            end
        end
    end
end
v_u_2.xp.Changed:Connect(update)
v_u_2.levelsSpent.Changed:Connect(function()
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    local v17 = v_u_3.getLevel(v_u_2.xp.Value) - v_u_2.levelsSpent.Value
    script.Parent.level.unspent.Text = v17 .. " Skill Points unspent"
    script.Parent.level.unspent.Visible = v17 ~= 0
end)
update()

--========================================
-- LocalScript : StarterGui.levels.Frame.toggler
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
function toggleSkills(p2, p3)
    -- upvalues: (copy) v_u_1
    if p2 == nil then
        p2 = not script.Parent.Parent.skills.open.Value
    end
    script.Parent.Parent.skills.open.Value = p2
    if p2 then
        toggleXpBar(p2)
    end
    if p2 then
        script.Parent.Parent.skills.Visible = true
        if p3 then
            script.Parent.Parent.skills.selected.Value = script.Parent.Parent.skills.speed.speed1
        end
    end
    local v4 = v_u_1:Create(script.Parent.Parent.skills, TweenInfo.new(0.5), {
        ["Size"] = p2 and UDim2.new(0.6, 0, 0.4, 0) or UDim2.new(0, 0, 0, 0)
    })
    if not p2 then
        v4.Completed:Connect(function(p5)
            if p5 == Enum.PlaybackState.Completed then
                script.Parent.Parent.skills.Visible = false
            end
        end)
    end
    v4:Play()
end
function toggleXpBar(p6)
    -- upvalues: (copy) v_u_1
    if p6 == nil then
        p6 = not script.Parent.open.Value
    end
    script.Parent.open.Value = p6
    local v7 = p6 or script.Parent.forceopen.Value
    if v7 then
        script.Parent.xpBar.Visible = true
    end
    local v8 = v_u_1:Create(script.Parent.xpBar, TweenInfo.new(0.5), {
        ["Size"] = UDim2.new(UDim.new(v7 and 1 or 0, 0), script.Parent.xpBar.Size.Y)
    })
    if not v7 then
        v8.Completed:Connect(function(p9)
            if p9 == Enum.PlaybackState.Completed then
                script.Parent.xpBar.Visible = false
            end
        end)
    end
    v8:Play()
end
script.Parent.level.level.InputBegan:Connect(function(p10)
    if p10.UserInputType == Enum.UserInputType.MouseMovement then
        toggleXpBar(true)
    elseif p10.UserInputType == Enum.UserInputType.MouseButton1 then
        toggleSkills()
    end
end)
script.Parent.InputEnded:Connect(function(p11)
    if p11.UserInputType == Enum.UserInputType.MouseMovement then
        toggleXpBar(false)
    end
end)
script.Parent.level.level.TouchTap:Connect(function()
    toggleXpBar()
    toggleSkills()
end)
game:GetService("UserInputService").InputBegan:Connect(function(p12)
    local v13 = game:GetService("VRService")
    if not (v13:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v13:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
        if p12.KeyCode == Enum.KeyCode.ButtonY and not script.Parent.Parent.Parent.shop2.open.Value then
            toggleSkills(nil, true)
        end
    end
end)
local v_u_14 = game.Players.LocalPlayer.PlayerGui:WaitForChild("shop2"):WaitForChild("controller")
v_u_14.Changed:Connect(function()
    -- upvalues: (copy) v_u_1, (copy) v_u_14
    v_u_1:Create(script.Parent.level.xbox, TweenInfo.new(0.35), {
        ["Size"] = v_u_14.Value and UDim2.new(0.6, 0, 0.6, 0) or UDim2.new(0, 0, 0, 0)
    }):Play()
end)

--========================================
-- LocalScript : StarterGui.levels.Frame.level.xbox.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.levels.skills.skills
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    [3] = Color3.fromRGB(197, 255, 62),
    [2] = Color3.fromRGB(156, 255, 249),
    [1] = Color3.fromRGB(156, 255, 249),
    [0] = Color3.new(1, 1, 1),
    [-1] = Color3.new(1, 1, 1)
}
local v_u_2 = game:GetService("TweenService")
local v_u_3 = require(game.ReplicatedStorage.Library.Utility.stringListContains)
local v_u_4 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local function v_u_17(p5, p6)
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_1, (copy) v_u_17
    if p5:FindFirstChild("unlocks") then
        if not p6 then
            for _, v7 in pairs(p5.unlocks:GetChildren()) do
                for _, v8 in pairs(v7:GetChildren()) do
                    if v_u_3(v_u_4.activeskills.Value, p5.Parent.Name .. "/" .. v8.Value) then
                        p6 = v7
                    end
                end
            end
        end
        for _, v9 in pairs(p5.unlocks:GetChildren()) do
            for _, v10 in pairs(v9:GetChildren()) do
                local v11 = v_u_3(v_u_4.activeskills.Value, p5.Parent.Name .. "/" .. v10.Value)
                local v12 = v11 or v_u_3(v_u_4.skills.Value, p5.Parent.Name .. "/" .. v10.Value)
                local v13
                if p6 then
                    v13 = v9 ~= p6
                else
                    v13 = p6
                end
                local v14 = 0
                if v11 then
                    v14 = 3
                else
                    if v12 then
                        v14 = v14 + 2
                    end
                    if v13 then
                        v14 = v14 - 1
                    end
                end
                local v15 = p5.Parent:FindFirstChild(v10.Value)
                v15.back.ImageColor3 = v_u_1[v14]
                for _, v16 in pairs(p5.Parent:GetChildren()) do
                    if string.find(v16.Name, p5.Name .. "-" .. v10.Value, 0, true) then
                        v16.BackgroundColor3 = v13 and Color3.new(0.7, 0.7, 0.7) or Color3.new(1, 1, 1)
                    end
                end
                v15.state.Value = v14
                v_u_17(v15, v13)
            end
        end
    end
end
local function v_u_20(p18)
    -- upvalues: (copy) v_u_3, (copy) v_u_4
    local v19 = p18.Parent.Name .. "/" .. p18.Name
    if v_u_3(v_u_4.activeskills.Value, v19) then
        game.ReplicatedStorage.Remotes.Skills.deactivateSkill:InvokeServer(v19)
        return
    elseif v_u_3(v_u_4.skills.Value, v19) then
        game.ReplicatedStorage.Remotes.Skills.activateSkill:InvokeServer(v19)
    else
        game.ReplicatedStorage.Remotes.Skills.buySkill:InvokeServer(v19)
        game.ReplicatedStorage.Remotes.Skills.activateSkill:InvokeServer(v19)
    end
end
local function v22()
    -- upvalues: (copy) v_u_17
    for _, v21 in pairs(script.Parent:GetChildren()) do
        if v21:IsA("Frame") and v21:FindFirstChild("base") then
            v_u_17(v21.base)
        end
    end
end
for _, v23 in pairs(script.Parent:GetChildren()) do
    if v23:IsA("Frame") and v23:FindFirstChild("base") then
        for _, v_u_24 in pairs(v23:GetChildren()) do
            if v_u_24:IsA("ImageLabel") and v_u_24.Name ~= "base" then
                local v25 = Instance.new("IntValue")
                v25.Name = "state"
                v25.Parent = v_u_24
                v_u_24.InputBegan:Connect(function(p26)
                    -- upvalues: (copy) v_u_20, (copy) v_u_24
                    if p26.UserInputType == Enum.UserInputType.MouseButton1 then
                        v_u_20(v_u_24)
                    elseif p26.UserInputType == Enum.UserInputType.MouseMovement then
                        if v_u_24:FindFirstChild("desc") then
                            script.Parent.desc.Text = v_u_24.desc.Value
                            return
                        end
                        script.Parent.desc.Text = ""
                    end
                end)
                v_u_24.TouchTap:Connect(function()
                    -- upvalues: (copy) v_u_24, (copy) v_u_20
                    if script.Parent.selected.Value == v_u_24 then
                        v_u_20(v_u_24)
                    else
                        script.Parent.selected.Value = v_u_24
                    end
                end)
            end
        end
    end
end
local v_u_27 = script.Parent.selected
local v_u_28 = nil
v_u_27.Changed:Connect(function()
    -- upvalues: (ref) v_u_28, (copy) v_u_2, (copy) v_u_27
    if v_u_28 then
        v_u_2:Create(v_u_28, TweenInfo.new(0.25), {
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }):Play()
    end
    if v_u_27.Value then
        v_u_2:Create(v_u_27.Value, TweenInfo.new(0.25), {
            ["Size"] = UDim2.new(1.2, 0, 1.2, 0)
        }):Play()
        script.Parent.desc.Text = v_u_27.Value.desc.Value
    else
        script.Parent.desc.Text = ""
    end
    v_u_28 = v_u_27.Value
end)
game:GetService("UserInputService").InputBegan:Connect(function(p29)
    -- upvalues: (copy) v_u_27, (copy) v_u_20
    if v_u_27.Value then
        local v30 = game:GetService("VRService")
        if not (v30:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v30:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
            if p29.KeyCode == Enum.KeyCode.DPadLeft then
                if v_u_27.Value.NextSelectionLeft then
                    v_u_27.Value = v_u_27.Value.NextSelectionLeft
                    return
                end
            elseif p29.KeyCode == Enum.KeyCode.DPadDown then
                if v_u_27.Value.NextSelectionDown then
                    v_u_27.Value = v_u_27.Value.NextSelectionDown
                    return
                end
            elseif p29.KeyCode == Enum.KeyCode.DPadRight then
                if v_u_27.Value.NextSelectionRight then
                    v_u_27.Value = v_u_27.Value.NextSelectionRight
                    return
                end
            elseif p29.KeyCode == Enum.KeyCode.DPadUp then
                if v_u_27.Value.NextSelectionUp then
                    v_u_27.Value = v_u_27.Value.NextSelectionUp
                    return
                end
            elseif p29.KeyCode == Enum.KeyCode.ButtonX then
                v_u_20(v_u_27.Value)
            end
        end
    else
        return
    end
end)
script.Parent:GetPropertyChangedSignal("Visible"):Connect(function()
    -- upvalues: (copy) v_u_27, (copy) v_u_2
    if not script.Parent.Visible then
        if v_u_27.Value then
            v_u_2:Create(v_u_27.Value, TweenInfo.new(0.4), {
                ["Size"] = UDim2.new(1, 0, 1, 0)
            }):Play()
        end
        script.Parent.desc.Text = ""
        v_u_27.Value = nil
    end
end)
v_u_4:WaitForChild("activeskills").Changed:Connect(v22)
v_u_4:WaitForChild("skills").Changed:Connect(v22)
v22()

--========================================
-- LocalScript : StarterGui.shop2.ShopScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v2 = game:GetService("UserInputService")
function toggle(p3)
    if p3 == nil then
        p3 = not script.Parent.open.Value
    end
    script.Parent.open.Value = p3
end
script.Parent.open.Changed:Connect(function()
    -- upvalues: (copy) v_u_1
    v_u_1:Create(script.Parent.shop, TweenInfo.new(0.5, Enum.EasingStyle.Bounce), {
        ["AnchorPoint"] = Vector2.new(script.Parent.open.Value and 0 or 1, 1),
        ["Position"] = UDim2.new(0, 0, 1, 0)
    }):Play()
end)
script.Parent.shop.yxle.InputBegan:connect(function(p4)
    if p4.UserInputType == Enum.UserInputType.MouseButton1 then
        toggle()
    end
end)
script.Parent.shop.yxle.TouchTap:Connect(function()
    toggle()
end)
function enableTab(p5)
    -- upvalues: (copy) v_u_1
    if p5 ~= nil then
        for _, v6 in pairs(script.Parent.shop.items:GetChildren()) do
            if v6:IsA("GuiBase") then
                v_u_1:Create(v6, TweenInfo.new(0.5), {
                    ["Position"] = UDim2.new(v6.LayoutOrder - p5.LayoutOrder)
                }):Play()
                if v6.Name == p5.Name then
                    script.Parent.tab.Value = v6
                end
            end
        end
    end
end
script.Parent.enableTab.OnInvoke = enableTab
for _, v_u_7 in pairs(script.Parent.shop.tabs:GetChildren()) do
    if v_u_7:IsA("GuiBase2d") then
        v_u_7.InputBegan:connect(function(p8)
            -- upvalues: (copy) v_u_7
            if p8.UserInputType == Enum.UserInputType.MouseButton1 then
                enableTab(v_u_7)
            end
        end)
        v_u_7.TouchTap:Connect(function()
            -- upvalues: (copy) v_u_7
            enableTab(v_u_7)
        end)
    end
end
v2.InputBegan:connect(function(p9, _)
    local v10 = game:GetService("VRService")
    if v10:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v10:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
        return
    elseif p9.KeyCode == Enum.KeyCode.ButtonSelect then
        return
    elseif script.Parent.open.Value and p9.KeyCode == Enum.KeyCode.ButtonL2 then
        enableTab(script.Parent.tab.Value.NextSelectionLeft)
    elseif script.Parent.open.Value and p9.KeyCode == Enum.KeyCode.ButtonR2 then
        enableTab(script.Parent.tab.Value.NextSelectionRight)
    end
end)
script.Parent.controller.Changed:Connect(function()
    -- upvalues: (copy) v_u_1
    local v11 = script.Parent.controller.Value
    local v12 = { v_u_1:Create(script.Parent.shop.yxle.xbox, TweenInfo.new(0.5), {
            ["Size"] = UDim2.new(v11 and 0.5 or 0, 0, v11 and 0.5 or 0, 0)
        }), v_u_1:Create(script.Parent.shop.xboxLeftTab, TweenInfo.new(0.5), {
            ["Size"] = UDim2.new(v11 and 0.1 or 0, 0, v11 and 0.1 or 0, 0)
        }), v_u_1:Create(script.Parent.shop.xboxRightTab, TweenInfo.new(0.5), {
            ["Size"] = UDim2.new(v11 and 0.1 or 0, 0, v11 and 0.1 or 0, 0)
        }) }
    if v11 then
        for _, v13 in pairs(v12) do
            v13.Instance.Visible = true
        end
    end
    if not v11 then
        for _, v_u_14 in pairs(v12) do
            v_u_14.Completed:connect(function(p15)
                -- upvalues: (copy) v_u_14
                if p15 == Enum.PlaybackState.Completed then
                    v_u_14.Instance.Visible = false
                end
            end)
        end
    end
    for _, v16 in pairs(v12) do
        v16:Play()
    end
end)
game:GetService("ContextActionService"):BindActionAtPriority("open_" .. script.Parent.Name, function(_, p17, _)
    if p17 == Enum.UserInputState.End then
        local v18 = game:GetService("VRService")
        if not (v18:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v18:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
            toggle()
        end
    else
        return
    end
end, false, 34000, Enum.KeyCode.ButtonSelect)

--========================================
-- LocalScript : StarterGui.shop2.style
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.Players.LocalPlayer.PlayerGui:WaitForChild("uiStyle")
local function v_u_3(p2)
    -- upvalues: (copy) v_u_1
    if p2.Name == "COLORbackground" then
        if p2.Value ~= "" then
            p2.Parent.BackgroundColor3 = v_u_1[p2.Value].Value
            return
        end
    elseif p2.Name == "COLORbackgroundtrans" then
        if p2.Value ~= "" then
            p2.Parent.BackgroundTransparency = v_u_1[p2.Value].Value
            return
        end
    elseif p2.Name == "COLORimage" then
        if p2.Value ~= "" then
            p2.Parent.ImageColor3 = v_u_1[p2.Value].Value
            return
        end
    elseif p2.Name == "COLORimagetrans" then
        if p2.Value ~= "" then
            p2.Parent.ImageTransparency = v_u_1[p2.Value].Value
            return
        end
    elseif p2.Name == "COLORtext" then
        if p2.Value ~= "" then
            p2.Parent.TextColor3 = v_u_1[p2.Value].Value
            return
        end
    elseif p2:IsA("ImageButton") then
        if not p2:FindFirstChild("COLORimage") then
            p2.ImageColor3 = v_u_1.ButtonColor.Value
            p2.ImageTransparency = v_u_1.ButtonTransparency.Value
            return
        end
    elseif p2:IsA("TextLabel") or p2:IsA("TextButton") then
        if not p2:FindFirstChild("COLORtext") then
            p2.TextColor3 = v_u_1.TextColor.Value
            return
        end
    elseif p2:IsA("ScrollingFrame") then
        p2.ScrollBarImageColor3 = v_u_1.AccentColor.Value
    end
end
local function v5()
    -- upvalues: (copy) v_u_1, (copy) v_u_3
    script.Parent.shop.BackgroundColor3 = v_u_1.BackgroundColor.Value
    script.Parent.shop.BackgroundTransparency = v_u_1.BackgroundTransparency.Value
    script.Parent.shop.tabsBackground.BackgroundColor3 = v_u_1.BackgroundColor.Value
    script.Parent.shop.tabsBackground.BackgroundTransparency = v_u_1.BackgroundTransparency.Value
    script.Parent.shop.tabsBackground.corner.ImageColor3 = v_u_1.BackgroundColor.Value
    script.Parent.shop.tabsBackground.corner.ImageTransparency = v_u_1.BackgroundTransparency.Value
    for _, v4 in pairs(script.Parent:GetDescendants()) do
        v_u_3(v4)
    end
end
v_u_1.update.Event:Connect(v5)
script.Parent.DescendantAdded:Connect(v_u_3)
v5()

--========================================
-- LocalScript : StarterGui.shop2.ControllerScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    script.Parent.controller.Value = v4
end
v1.InputBegan:connect(function(p6, _)
    updateController(p6)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.yxle.update
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v2 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local v3 = v2:WaitForChild("coins")
local v_u_4 = false
function update()
    -- upvalues: (ref) v_u_4, (copy) v_u_1
    if not v_u_4 then
        v_u_4 = true
        wait(0.1)
        local v5 = script.Parent.Frame.yxles
        if v5.Text == "loading" then
            v5.Text = require(game.ReplicatedStorage.Library.Modules.getRealCoins)(game.Players.LocalPlayer)
        else
            local v6 = require(game.ReplicatedStorage.Library.Modules.getRealCoins)(game.Players.LocalPlayer)
            local v7 = v5.Text - v6
            if v7 ~= 0 then
                local v8 = v5:Clone()
                v8.Parent = v5.Parent
                v8.Text = v6
                v5.Name = "oldyxles"
                v8.Position = UDim2.new(0, 0, 0.5 - math.sign(v7) * 1, 0)
                v_u_1:Create(v5, TweenInfo.new(0.5), {
                    ["Position"] = UDim2.new(0, 0, math.sign(v7) * 1 + 0.5, 0)
                }):Play()
                v_u_1:Create(v8, TweenInfo.new(0.5), {
                    ["Position"] = UDim2.new(0, 0, 0.5, 0)
                }):Play()
                game:GetService("Debris"):AddItem(v5, 0.5)
            end
        end
        v_u_4 = false
    end
end
v3.Changed:Connect(update)
v2:WaitForChild("highestSection").Changed:connect(update)
update()

--========================================
-- LocalScript : StarterGui.shop2.shop.yxle.xbox.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.tabs.credits.remover
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
script.Parent:Destroy()

--========================================
-- LocalScript : StarterGui.shop2.shop.tabs.appeal.remover
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
if game.PlaceId == 5253186791 then
    wait(1)
    script.Parent.Parent.Parent.Parent.enableTab:Invoke(script.Parent)
    script.Parent.Parent.Parent.Parent.open.Value = true
else
    script.Parent:Destroy()
end

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("GuiService")
local v2 = game:GetService("UserInputService")
local v_u_3 = script:FindFirstAncestorOfClass("ScreenGui")
local v4 = require(game.ReplicatedStorage.Library.Shared.PlacePermissions)
v1.AutoSelectGuiEnabled = false
local function v_u_5()
    game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.35), {
        ["CanvasPosition"] = Vector2.new(0, script.Parent.CanvasPosition.Y + script.Parent.selected.Value.AbsolutePosition.Y + script.Parent.selected.Value.AbsoluteSize.Y / 2 - script.Parent.AbsolutePosition.Y - script.Parent.AbsoluteSize.Y / 2)
    }):Play()
end
function selectUp()
    -- upvalues: (copy) v_u_5
    if script.Parent.selected.Value.NextSelectionUp then
        script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionUp
    else
        local v6 = script.Parent.selected.Value
        local v7 = v6.Parent.NextSelectionUp
        if v7 then
            local v8 = v6.AbsolutePosition.X
            local v9 = nil
            for _, v10 in pairs(v7:GetChildren()) do
                if v10:IsA("GuiBase") and v10.Visible then
                    local v11 = v10.AbsolutePosition.X - v8
                    if math.abs(v11) < 5 and (not v9 or v9.AbsolutePosition.Y < v10.AbsolutePosition.Y) then
                        v9 = v10
                    end
                end
            end
            if v9 then
                script.Parent.selected.Value = v9
            end
        end
    end
    v_u_5()
end
function selectDown()
    -- upvalues: (copy) v_u_5
    if script.Parent.selected.Value.NextSelectionDown then
        script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionDown
    else
        local v12 = script.Parent.selected.Value
        local v13 = v12.Parent.NextSelectionDown
        if v13 then
            local v14 = v12.AbsolutePosition.X
            local v15 = nil
            for _, v16 in pairs(v13:GetChildren()) do
                if v16:IsA("GuiBase") and v16.Visible then
                    local v17 = v16.AbsolutePosition.X - v14
                    if math.abs(v17) < 5 and (not v15 or v15.AbsolutePosition.Y > v16.AbsolutePosition.Y) then
                        v15 = v16
                    end
                end
            end
            if v15 then
                script.Parent.selected.Value = v15
            end
        end
    end
    v_u_5()
end
v2.InputBegan:Connect(function(p18)
    if script.Parent.open.Value then
        local v19 = game:GetService("VRService")
        if v19:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v19:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
            return
        elseif p18.UserInputType.Value >= 12 and (p18.UserInputType.Value <= 19 and not script.Parent.selected.Value) then
            script.Parent.selected.Value = script.Parent.mutators.speed
            return
        elseif p18.KeyCode == Enum.KeyCode.DPadDown then
            selectDown()
            return
        elseif p18.KeyCode == Enum.KeyCode.DPadUp then
            selectUp()
        elseif p18.KeyCode == Enum.KeyCode.DPadLeft then
            if script.Parent.selected.Value.NextSelectionLeft then
                script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft
                return
            end
        elseif p18.KeyCode == Enum.KeyCode.DPadRight and script.Parent.selected.Value.NextSelectionRight then
            script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight
        end
    else
        return
    end
end)
require(game.ReplicatedStorage.Library.Utility.thumbScroller2D)(Enum.KeyCode.Thumbstick1, function(p20, p21)
    if script.Parent.open.Value then
        if script.Parent.selected.Value then
            local v22 = game:GetService("VRService")
            if not (v22:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v22:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
                local v23 = p20.X
                for _ = 1, math.abs(v23) do
                    if p21.X == -1 then
                        if script.Parent.selected.Value.NextSelectionLeft then
                            script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft
                        end
                    elseif script.Parent.selected.Value.NextSelectionRight then
                        script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight
                    end
                end
                local v24 = p20.Y
                for _ = 1, math.abs(v24) do
                    if p21.Y == -1 then
                        selectDown()
                    else
                        selectUp()
                    end
                end
            end
        else
            script.Parent.selected.Value = script.Parent.mutators.speed
            return
        end
    else
        return
    end
end)
local function v27()
    -- upvalues: (copy) v_u_3
    local v25 = script.Parent.open
    local v26 = v_u_3.open.Value
    if v26 then
        v26 = v_u_3.tab.Value == script.Parent
    end
    v25.Value = v26
end
v_u_3.open.Changed:Connect(v27)
v_u_3.tab.Changed:Connect(v27)
if v4.GAME_MODE == "ttoh" then
    script.Parent.gears.Visible = false
    script.Parent.gearsLabel.Visible = false
    script.Parent.mutators.Visible = false
    script.Parent.mutatorsLabel.Visible = false
end

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.gears.ShopItemsScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = script:FindFirstAncestorOfClass("ScreenGui")
local v3 = nil
if script:GetAttribute("items") == "gears" then
    v3 = game.ReplicatedStorage.Assets.Gear
elseif script:GetAttribute("items") == "mutators" then
    v3 = game.ReplicatedStorage.Mutators
else
    error("No shop items category set")
end
local v_u_4 = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
function isOpen()
    local v5 = script
    while not v5:FindFirstChild("open") do
        v5 = v5.Parent
    end
    return v5.open.Value
end
local function v6()
    -- upvalues: (copy) v_u_4
    v_u_4(script.Parent)
end
for _, v7 in pairs(v3:GetChildren()) do
    if not v7.Configuration.hidden.Value then
        if v7.Configuration:FindFirstChild("price") then
            local v8 = script.template:Clone()
            v8.Name = v7.Name
            v8.method.Value = "regular"
            v8.item.Value = v7
            v8.Parent = script.Parent
            v8.Changed:Connect(v6)
        end
        if v7.Configuration:FindFirstChild("productId") then
            local v9 = script.template:Clone()
            v9.Name = v7.Name
            v9.method.Value = "product"
            v9.item.Value = v7
            v9.Parent = script.Parent
            v9.Changed:Connect(v6)
        end
        if v7.Configuration:FindFirstChild("subscriptionPrice") then
            local v10 = script.template:Clone()
            v10.Name = v7.Name
            v10.method.Value = "subscribed"
            v10.item.Value = v7
            v10.Parent = script.Parent
            v10.Changed:Connect(v6)
        end
    end
end
game:GetService("UserInputService").InputBegan:Connect(function(p11)
    local v12 = script.Parent.Parent.selected.Value
    local v13 = game:GetService("VRService")
    if not (v13:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v13:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
        if p11.KeyCode == Enum.KeyCode.ButtonX and (v12 and (v12.Parent == script.Parent and isOpen())) then
            v12.buy:Invoke()
        end
    end
end)
script.Parent.Parent.selected.Changed:Connect(function()
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v14 = script.Parent.Parent.selected.Value
    for _, v15 in pairs(script.Parent:GetChildren()) do
        if v15 ~= v14 and v15:IsA("GuiBase") then
            v_u_1:Create(v15.info, TweenInfo.new(0.5), {
                ["Position"] = UDim2.new(0, 0, 0, 0)
            }):Play()
            v15.info.xbox.Visible = false
        end
    end
    if v14 and v14.Parent == script.Parent then
        v_u_1:Create(v14.info, TweenInfo.new(0.5), {
            ["Position"] = UDim2.new(0, 0, -0.55, 0)
        }):Play()
        v14.info.xbox.Visible = v_u_2.controller.Value
    end
end)
script.Parent.DescendantAdded:Connect(v6)
script.Parent.DescendantRemoving:Connect(v6)
v_u_4(script.Parent)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.gears.ShopItemsScript.template.ShopItemScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = script:FindFirstAncestorOfClass("ScreenGui").Parent:WaitForChild("uiStyle")
local v_u_2 = script.Parent
local v_u_3 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
v_u_3:WaitForChild("subscription")
local v_u_4 = v_u_3:WaitForChild("coins")
local v_u_5 = script.Parent
while v_u_5.Name ~= "selected" do
    if v_u_5:FindFirstChild("selected") then
        v_u_5 = v_u_5.selected
    else
        v_u_5 = v_u_5.Parent
    end
end
local function v_u_9()
    local v6 = script.Parent.item.Value
    local v7 = script.Parent.method.Value
    local v8 = nil
    if v6.Parent == game.ReplicatedStorage.Assets.Gear then
        v8 = "gear"
    elseif v6.Parent == game.ReplicatedStorage.Mutators then
        v8 = "mutator"
    else
        error("Unknown item kind")
    end
    game.ReplicatedStorage.Remotes.Economy.buyShopItem:InvokeServer({
        ["kind"] = v8,
        ["item"] = v6.Name,
        ["method"] = v7,
        ["source"] = "ui-shop"
    })
end
script.Parent.buy.OnInvoke = v_u_9
local function v_u_20()
    -- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
    if script.Parent.item.Value then
        local v10 = script.Parent.item.Value
        local v11 = script.Parent.method.Value
        local v12 = nil
        if v10.Parent == game.ReplicatedStorage.Assets.Gear then
            v12 = "gear"
        elseif v10.Parent == game.ReplicatedStorage.Mutators then
            v12 = "mutator"
        else
            error("Unknown item kind")
        end
        local v13 = workspace:WaitForChild("tower"):WaitForChild("sectionCount").Value - 2
        local v14 = game.ReplicatedStorage.Configuration.maxTowerLength.Value
        local v15 = math.min(v13, v14)
        local v16 = v10.Configuration:FindFirstChild("price") or v_u_3.subscription.Value > os.time()
        if v11 == "product" then
            v_u_2.Visible = not v16
        elseif v11 == "subscribed" then
            local v17 = v10.Configuration.subscriptionPrice:IsA("ModuleScript") and require(v10.Configuration.subscriptionPrice)(v15) or v10.Configuration.subscriptionPrice.Value
            v_u_2.info.yxles.Text = v17
            if v16 then
                v_u_2.info.ImageLabel.ImageColor3 = v_u_1.AccentColor.Value
                v_u_2.info.ImageLabel.COLORimage.Value = "AccentColor"
                v_u_2.info.Frame.BackgroundColor3 = v_u_1.AccentColor.Value
                v_u_2.info.Frame.COLORbackground.Value = "AccentColor"
                v_u_2.info.nametext.TextColor3 = v_u_1.TextColor.Value
                v_u_2.info.nametext.COLORtext.Value = "TextColor"
                v_u_2.info.unsubscribedText.Visible = false
                v_u_2.Visible = true
            else
                v_u_2.info.ImageLabel.ImageColor3 = v_u_1.DisabledAccentColor.Value
                v_u_2.info.ImageLabel.COLORimage.Value = "DisabledAccentColor"
                v_u_2.info.Frame.BackgroundColor3 = v_u_1.DisabledAccentColor.Value
                v_u_2.info.Frame.COLORbackground.Value = "DisabledAccentColor"
                v_u_2.info.nametext.TextColor3 = v_u_1.DisabledTextColor.Value
                v_u_2.info.nametext.COLORtext.Value = "DisabledTextColor"
                v_u_2.info.unsubscribedText.Visible = true
                v_u_2.Visible = false
            end
        else
            local v18 = v_u_3:WaitForChild("prices"):WaitForChild(v12):WaitForChild(v10.Name).Value
            v_u_2.info.yxles.Text = v18
        end
        if v_u_2.info.yxles:FindFirstChild("yxle") then
            local v19 = v_u_2.info.yxles.Text
            if v16 and tonumber(v19) <= v_u_4.Value then
                v_u_2.info.yxles.TextColor3 = v_u_1.TextColor.Value
                v_u_2.info.yxles.COLORtext.Value = "TextColor"
                return
            end
            v_u_2.info.yxles.TextColor3 = v_u_1.DisabledTextColor.Value
            v_u_2.info.yxles.COLORtext.Value = "DisabledTextColor"
        end
    end
end
local function v27()
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_20, (ref) v_u_5, (copy) v_u_9
    if script.Parent.item.Value then
        local v_u_21 = script.Parent.item.Value
        local v22 = script.Parent.method.Value
        local v23 = nil
        if v_u_21.Parent == game.ReplicatedStorage.Assets.Gear then
            v23 = "gear"
        elseif v_u_21.Parent == game.ReplicatedStorage.Mutators then
            v23 = "mutator"
        else
            error("Unknown item kind")
        end
        v_u_2.info.nametext.Text = v_u_21.Configuration.itemName.Value
        v_u_2.info.ImageLabel.Image = v_u_21.Configuration.pic.Value
        v_u_2.info.desc.Text = v_u_21.Configuration.desc.Value
        v_u_2.LayoutOrder = v_u_21.Configuration.layoutOrder.Value
        if v22 == "subscribed" then
            v_u_2.LayoutOrder = v_u_2.LayoutOrder + 10000
        elseif v22 == "product" then
            v_u_2.LayoutOrder = v_u_2.LayoutOrder + 20000
            v_u_2.info.unsubscribedText:Destroy()
            v_u_2.info.yxles.yxle:Destroy()
            v_u_2.info.yxles.Size = UDim2.new(UDim.new(1, 0), v_u_2.info.yxles.Size.Y)
            v_u_2.info.yxles.TextColor3 = Color3.new(0, 1, 0)
            spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_21
                v_u_2.info.yxles.Text = game:GetService("MarketplaceService"):GetProductInfo(v_u_21.Configuration.productId.Value, Enum.InfoType.Product).PriceInRobux .. " R$"
            end)
        else
            v_u_2.info.unsubscribedText:Destroy()
            v_u_3:WaitForChild("prices"):WaitForChild(v23):WaitForChild(v_u_21.Name).Changed:Connect(v_u_20)
        end
        v_u_2.InputBegan:Connect(function(p24)
            -- upvalues: (ref) v_u_5, (ref) v_u_2, (ref) v_u_9
            if p24.UserInputType == Enum.UserInputType.MouseMovement then
                v_u_5.Value = v_u_2
            elseif p24.UserInputType == Enum.UserInputType.MouseButton1 then
                v_u_9()
            end
        end)
        v_u_2.InputEnded:Connect(function(p25)
            -- upvalues: (ref) v_u_5, (ref) v_u_2
            if p25.UserInputType == Enum.UserInputType.MouseMovement and v_u_5.Value == v_u_2 then
                v_u_5.Value = nil
            end
        end)
        v_u_2.TouchTap:Connect(function()
            -- upvalues: (ref) v_u_2, (ref) v_u_5, (ref) v_u_9
            local v26 = v_u_2.info.Position.Y.Scale * 100 + 0.5
            if math.floor(v26) == -55 then
                v_u_9()
            else
                v_u_5.Value = v_u_2
            end
        end)
    end
end
script.Parent.item.Changed:Connect(v27)
v27()
v_u_4.Changed:Connect(function()
    -- upvalues: (copy) v_u_20
    v_u_20()
end)
workspace.ChildAdded:Connect(function(p28)
    -- upvalues: (copy) v_u_20
    if p28.Name == "tower" then
        p28:WaitForChild("sectionCount")
        v_u_20()
    end
end)
v_u_20()
local v_u_29 = v_u_3.subscription.Value > os.time()
game:GetService("RunService").RenderStepped:Connect(function()
    -- upvalues: (ref) v_u_29, (copy) v_u_3, (copy) v_u_20
    if v_u_29 ~= (v_u_3.subscription.Value > os.time()) then
        v_u_20()
        v_u_29 = v_u_3.subscription.Value > os.time()
    end
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.gears.ShopItemsScript.template.info.xbox.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.mutators.ShopItemsScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = script:FindFirstAncestorOfClass("ScreenGui")
local v3 = nil
if script:GetAttribute("items") == "gears" then
    v3 = game.ReplicatedStorage.Assets.Gear
elseif script:GetAttribute("items") == "mutators" then
    v3 = game.ReplicatedStorage.Mutators
else
    error("No shop items category set")
end
local v_u_4 = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
function isOpen()
    local v5 = script
    while not v5:FindFirstChild("open") do
        v5 = v5.Parent
    end
    return v5.open.Value
end
local function v6()
    -- upvalues: (copy) v_u_4
    v_u_4(script.Parent)
end
for _, v7 in pairs(v3:GetChildren()) do
    if not v7.Configuration.hidden.Value then
        if v7.Configuration:FindFirstChild("price") then
            local v8 = script.template:Clone()
            v8.Name = v7.Name
            v8.method.Value = "regular"
            v8.item.Value = v7
            v8.Parent = script.Parent
            v8.Changed:Connect(v6)
        end
        if v7.Configuration:FindFirstChild("productId") then
            local v9 = script.template:Clone()
            v9.Name = v7.Name
            v9.method.Value = "product"
            v9.item.Value = v7
            v9.Parent = script.Parent
            v9.Changed:Connect(v6)
        end
        if v7.Configuration:FindFirstChild("subscriptionPrice") then
            local v10 = script.template:Clone()
            v10.Name = v7.Name
            v10.method.Value = "subscribed"
            v10.item.Value = v7
            v10.Parent = script.Parent
            v10.Changed:Connect(v6)
        end
    end
end
game:GetService("UserInputService").InputBegan:Connect(function(p11)
    local v12 = script.Parent.Parent.selected.Value
    local v13 = game:GetService("VRService")
    if not (v13:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v13:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
        if p11.KeyCode == Enum.KeyCode.ButtonX and (v12 and (v12.Parent == script.Parent and isOpen())) then
            v12.buy:Invoke()
        end
    end
end)
script.Parent.Parent.selected.Changed:Connect(function()
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v14 = script.Parent.Parent.selected.Value
    for _, v15 in pairs(script.Parent:GetChildren()) do
        if v15 ~= v14 and v15:IsA("GuiBase") then
            v_u_1:Create(v15.info, TweenInfo.new(0.5), {
                ["Position"] = UDim2.new(0, 0, 0, 0)
            }):Play()
            v15.info.xbox.Visible = false
        end
    end
    if v14 and v14.Parent == script.Parent then
        v_u_1:Create(v14.info, TweenInfo.new(0.5), {
            ["Position"] = UDim2.new(0, 0, -0.55, 0)
        }):Play()
        v14.info.xbox.Visible = v_u_2.controller.Value
    end
end)
script.Parent.DescendantAdded:Connect(v6)
script.Parent.DescendantRemoving:Connect(v6)
v_u_4(script.Parent)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.mutators.ShopItemsScript.template.ShopItemScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = script:FindFirstAncestorOfClass("ScreenGui").Parent:WaitForChild("uiStyle")
local v_u_2 = script.Parent
local v_u_3 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
v_u_3:WaitForChild("subscription")
local v_u_4 = v_u_3:WaitForChild("coins")
local v_u_5 = script.Parent
while v_u_5.Name ~= "selected" do
    if v_u_5:FindFirstChild("selected") then
        v_u_5 = v_u_5.selected
    else
        v_u_5 = v_u_5.Parent
    end
end
local function v_u_9()
    local v6 = script.Parent.item.Value
    local v7 = script.Parent.method.Value
    local v8 = nil
    if v6.Parent == game.ReplicatedStorage.Assets.Gear then
        v8 = "gear"
    elseif v6.Parent == game.ReplicatedStorage.Mutators then
        v8 = "mutator"
    else
        error("Unknown item kind")
    end
    game.ReplicatedStorage.Remotes.Economy.buyShopItem:InvokeServer({
        ["kind"] = v8,
        ["item"] = v6.Name,
        ["method"] = v7,
        ["source"] = "ui-shop"
    })
end
script.Parent.buy.OnInvoke = v_u_9
local function v_u_20()
    -- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
    if script.Parent.item.Value then
        local v10 = script.Parent.item.Value
        local v11 = script.Parent.method.Value
        local v12 = nil
        if v10.Parent == game.ReplicatedStorage.Assets.Gear then
            v12 = "gear"
        elseif v10.Parent == game.ReplicatedStorage.Mutators then
            v12 = "mutator"
        else
            error("Unknown item kind")
        end
        local v13 = workspace:WaitForChild("tower"):WaitForChild("sectionCount").Value - 2
        local v14 = game.ReplicatedStorage.Configuration.maxTowerLength.Value
        local v15 = math.min(v13, v14)
        local v16 = v10.Configuration:FindFirstChild("price") or v_u_3.subscription.Value > os.time()
        if v11 == "product" then
            v_u_2.Visible = not v16
        elseif v11 == "subscribed" then
            local v17 = v10.Configuration.subscriptionPrice:IsA("ModuleScript") and require(v10.Configuration.subscriptionPrice)(v15) or v10.Configuration.subscriptionPrice.Value
            v_u_2.info.yxles.Text = v17
            if v16 then
                v_u_2.info.ImageLabel.ImageColor3 = v_u_1.AccentColor.Value
                v_u_2.info.ImageLabel.COLORimage.Value = "AccentColor"
                v_u_2.info.Frame.BackgroundColor3 = v_u_1.AccentColor.Value
                v_u_2.info.Frame.COLORbackground.Value = "AccentColor"
                v_u_2.info.nametext.TextColor3 = v_u_1.TextColor.Value
                v_u_2.info.nametext.COLORtext.Value = "TextColor"
                v_u_2.info.unsubscribedText.Visible = false
                v_u_2.Visible = true
            else
                v_u_2.info.ImageLabel.ImageColor3 = v_u_1.DisabledAccentColor.Value
                v_u_2.info.ImageLabel.COLORimage.Value = "DisabledAccentColor"
                v_u_2.info.Frame.BackgroundColor3 = v_u_1.DisabledAccentColor.Value
                v_u_2.info.Frame.COLORbackground.Value = "DisabledAccentColor"
                v_u_2.info.nametext.TextColor3 = v_u_1.DisabledTextColor.Value
                v_u_2.info.nametext.COLORtext.Value = "DisabledTextColor"
                v_u_2.info.unsubscribedText.Visible = true
                v_u_2.Visible = false
            end
        else
            local v18 = v_u_3:WaitForChild("prices"):WaitForChild(v12):WaitForChild(v10.Name).Value
            v_u_2.info.yxles.Text = v18
        end
        if v_u_2.info.yxles:FindFirstChild("yxle") then
            local v19 = v_u_2.info.yxles.Text
            if v16 and tonumber(v19) <= v_u_4.Value then
                v_u_2.info.yxles.TextColor3 = v_u_1.TextColor.Value
                v_u_2.info.yxles.COLORtext.Value = "TextColor"
                return
            end
            v_u_2.info.yxles.TextColor3 = v_u_1.DisabledTextColor.Value
            v_u_2.info.yxles.COLORtext.Value = "DisabledTextColor"
        end
    end
end
local function v27()
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_20, (ref) v_u_5, (copy) v_u_9
    if script.Parent.item.Value then
        local v_u_21 = script.Parent.item.Value
        local v22 = script.Parent.method.Value
        local v23 = nil
        if v_u_21.Parent == game.ReplicatedStorage.Assets.Gear then
            v23 = "gear"
        elseif v_u_21.Parent == game.ReplicatedStorage.Mutators then
            v23 = "mutator"
        else
            error("Unknown item kind")
        end
        v_u_2.info.nametext.Text = v_u_21.Configuration.itemName.Value
        v_u_2.info.ImageLabel.Image = v_u_21.Configuration.pic.Value
        v_u_2.info.desc.Text = v_u_21.Configuration.desc.Value
        v_u_2.LayoutOrder = v_u_21.Configuration.layoutOrder.Value
        if v22 == "subscribed" then
            v_u_2.LayoutOrder = v_u_2.LayoutOrder + 10000
        elseif v22 == "product" then
            v_u_2.LayoutOrder = v_u_2.LayoutOrder + 20000
            v_u_2.info.unsubscribedText:Destroy()
            v_u_2.info.yxles.yxle:Destroy()
            v_u_2.info.yxles.Size = UDim2.new(UDim.new(1, 0), v_u_2.info.yxles.Size.Y)
            v_u_2.info.yxles.TextColor3 = Color3.new(0, 1, 0)
            spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_21
                v_u_2.info.yxles.Text = game:GetService("MarketplaceService"):GetProductInfo(v_u_21.Configuration.productId.Value, Enum.InfoType.Product).PriceInRobux .. " R$"
            end)
        else
            v_u_2.info.unsubscribedText:Destroy()
            v_u_3:WaitForChild("prices"):WaitForChild(v23):WaitForChild(v_u_21.Name).Changed:Connect(v_u_20)
        end
        v_u_2.InputBegan:Connect(function(p24)
            -- upvalues: (ref) v_u_5, (ref) v_u_2, (ref) v_u_9
            if p24.UserInputType == Enum.UserInputType.MouseMovement then
                v_u_5.Value = v_u_2
            elseif p24.UserInputType == Enum.UserInputType.MouseButton1 then
                v_u_9()
            end
        end)
        v_u_2.InputEnded:Connect(function(p25)
            -- upvalues: (ref) v_u_5, (ref) v_u_2
            if p25.UserInputType == Enum.UserInputType.MouseMovement and v_u_5.Value == v_u_2 then
                v_u_5.Value = nil
            end
        end)
        v_u_2.TouchTap:Connect(function()
            -- upvalues: (ref) v_u_2, (ref) v_u_5, (ref) v_u_9
            local v26 = v_u_2.info.Position.Y.Scale * 100 + 0.5
            if math.floor(v26) == -55 then
                v_u_9()
            else
                v_u_5.Value = v_u_2
            end
        end)
    end
end
script.Parent.item.Changed:Connect(v27)
v27()
v_u_4.Changed:Connect(function()
    -- upvalues: (copy) v_u_20
    v_u_20()
end)
workspace.ChildAdded:Connect(function(p28)
    -- upvalues: (copy) v_u_20
    if p28.Name == "tower" then
        p28:WaitForChild("sectionCount")
        v_u_20()
    end
end)
v_u_20()
local v_u_29 = v_u_3.subscription.Value > os.time()
game:GetService("RunService").RenderStepped:Connect(function()
    -- upvalues: (ref) v_u_29, (copy) v_u_3, (copy) v_u_20
    if v_u_29 ~= (v_u_3.subscription.Value > os.time()) then
        v_u_20()
        v_u_29 = v_u_3.subscription.Value > os.time()
    end
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.mutators.ShopItemsScript.template.info.xbox.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.coins.coins
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = script:FindFirstAncestorOfClass("ScreenGui")
local v_u_3 = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
function isOpen()
    local v4 = script
    while not v4:FindFirstChild("open") do
        v4 = v4.Parent
    end
    return v4.open.Value
end
local function v_u_6(p5)
    if p5:FindFirstChild("productId") then
        game.ReplicatedStorage.Remotes.Economy.buyDeveloperProduct:InvokeServer(p5.productId.Value)
    else
        game.ReplicatedStorage.Remotes.Economy.buyGamepass:InvokeServer(p5.gamepassId.Value)
    end
end
local function v7()
    -- upvalues: (copy) v_u_3
    v_u_3(script.Parent)
end
for _, v_u_8 in pairs(script.Parent:GetChildren()) do
    if v_u_8:IsA("GuiBase") then
        v_u_8.InputBegan:Connect(function(p9)
            -- upvalues: (copy) v_u_8, (copy) v_u_6
            if p9.UserInputType == Enum.UserInputType.MouseMovement then
                script.Parent.Parent.selected.Value = v_u_8
            elseif p9.UserInputType == Enum.UserInputType.MouseButton1 then
                v_u_6(v_u_8)
            end
        end)
        v_u_8.InputEnded:Connect(function(p10)
            -- upvalues: (copy) v_u_8
            if p10.UserInputType == Enum.UserInputType.MouseMovement and script.Parent.Parent.selected.Value == v_u_8 then
                script.Parent.Parent.selected.Value = nil
            end
        end)
        v_u_8.TouchTap:Connect(function()
            -- upvalues: (copy) v_u_8, (copy) v_u_6
            if v_u_8:FindFirstChild("info") then
                local v11 = v_u_8.info.Position.Y.Scale * 100 + 0.5
                if math.floor(v11) ~= -55 then
                    script.Parent.Parent.selected.Value = v_u_8
                    return
                end
            end
            v_u_6(v_u_8)
        end)
        spawn(function()
            -- upvalues: (copy) v_u_8
            local v12 = v_u_8:FindFirstChild("productId")
            local v13 = (v_u_8:FindFirstChild("info") or v_u_8).price
            if v12 then
                v13.Text = game:GetService("MarketplaceService"):GetProductInfo(v_u_8.productId.Value, Enum.InfoType.Product).PriceInRobux .. " R$"
            else
                v13.Text = game:GetService("MarketplaceService"):GetProductInfo(v_u_8.gamepassId.Value, Enum.InfoType.GamePass).PriceInRobux .. " R$"
            end
        end)
        v_u_8.Changed:Connect(v7)
    end
end
game:GetService("UserInputService").InputBegan:Connect(function(p14)
    -- upvalues: (copy) v_u_6
    local v15 = script.Parent.Parent.selected.Value
    local v16 = game:GetService("VRService")
    if not (v16:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v16:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
        if p14.KeyCode == Enum.KeyCode.ButtonX and (v15 and (v15.Parent == script.Parent and isOpen())) then
            v_u_6(script.Parent.Parent.selected.Value)
        end
    end
end)
script.Parent.Parent.selected.Changed:Connect(function()
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v17 = script.Parent.Parent.selected.Value
    for _, v18 in pairs(script.Parent:GetChildren()) do
        if v18 ~= v17 and v18:IsA("GuiBase") then
            if v18:FindFirstChild("info") then
                v_u_1:Create(v18.info, TweenInfo.new(0.5), {
                    ["Position"] = UDim2.new(0, 0, 0, 0)
                }):Play()
                v18.info.xbox.Visible = false
            else
                v18.yxles.yxle.Visible = true
                v18.yxles.box.Visible = false
            end
        end
    end
    if v17 and v17.Parent == script.Parent then
        if v17:FindFirstChild("info") then
            v_u_1:Create(v17.info, TweenInfo.new(0.5), {
                ["Position"] = UDim2.new(0, 0, -0.55, 0)
            }):Play()
            v17.info.xbox.Visible = v_u_2.controller.Value
            return
        end
        local v19 = v_u_2.controller.Value
        v17.yxles.yxle.Visible = not v19
        v17.yxles.box.Visible = v19
    end
end)
script.Parent.DescendantAdded:Connect(v7)
script.Parent.DescendantRemoving:Connect(v7)
v_u_3(script.Parent)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.coins.200 Coins.yxles.box.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.coins.500 Coins.yxles.box.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.coins.2K Coins.yxles.box.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.coins.double.info.xbox.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.coins.10K Coins.yxles.box.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.coins.skillreset.info.xbox.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.membershipLabel.status.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
function update()
    local v1 = os.time()
    local v2 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId):WaitForChild("subscription").Value
    if v2 < v1 then
        script.Parent.Text = ""
        return
    elseif v2 - v1 > 172800 then
        local v3 = os.date("*t", v2)
        script.Parent.Text = "Status:   Member until " .. v3.day .. "." .. v3.month .. "." .. v3.year
        return
    else
        local v4 = v2 - v1
        local v5 = v4 / 3600
        if v5 > 2 then
            script.Parent.Text = "Status:   " .. math.floor(v5) .. " Hours remaining"
            return
        else
            local v6 = v4 / 60
            if v6 > 2 then
                script.Parent.Text = "Status:   " .. math.floor(v6) .. " Minutes remaining"
            else
                script.Parent.Text = "Status:   " .. math.floor(v4) .. " Seconds remaining"
            end
        end
    end
end
while true do
    update()
    wait(1)
end

--========================================
-- LocalScript : StarterGui.shop2.shop.items.shop.membership.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = script.Parent.Parent.Parent.Parent.Parent
local v3 = v_u_2.Parent:WaitForChild("uiStyle")
v3:WaitForChild("AccentColor")
local v4 = {
    [998414382] = {
        ["length"] = "One Week",
        ["backpic"] = "rbxassetid://5151622718",
        ["pic"] = "rbxassetid://5151623472"
    },
    [998861127] = {
        ["length"] = "One Month",
        ["backpic"] = "rbxassetid://5152710246",
        ["pic"] = "rbxassetid://5152710338"
    }
}
local v_u_5 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
for v6, v7 in pairs(v4) do
    local v_u_8 = script.Template:Clone()
    v_u_8.Name = v6
    v_u_8.productId.Value = v6
    v_u_8.length.Text = v7.length
    v_u_8.ImageLabel.Image = v7.pic
    v_u_8.ImageLabelBack.Image = v7.backpic
    v_u_8.ImageLabelBack.ImageColor3 = v3.AccentColor.Value
    v_u_8.Parent = script.Parent
    v_u_8.InputBegan:Connect(function(p9)
        -- upvalues: (copy) v_u_8, (copy) v_u_5
        if p9.UserInputType == Enum.UserInputType.MouseMovement then
            script.Parent.Parent.selected.Value = v_u_8
        elseif p9.UserInputType == Enum.UserInputType.MouseButton1 then
            local v10 = v_u_8
            if v_u_5.subscription.Value - os.time() > 5259600 then
                return
            end
            game.ReplicatedStorage.Remotes.Economy.buyDeveloperProduct:InvokeServer(v10.productId.Value)
        end
    end)
    v_u_8.InputEnded:Connect(function(p11)
        -- upvalues: (copy) v_u_8
        if p11.UserInputType == Enum.UserInputType.MouseMovement and script.Parent.Parent.selected.Value == v_u_8 then
            script.Parent.Parent.selected.Value = nil
        end
    end)
    v_u_8.TouchTap:Connect(function()
        -- upvalues: (copy) v_u_8, (copy) v_u_5
        if v_u_8:FindFirstChild("info") then
            local v12 = v_u_8.info.Position.Y.Scale * 100 + 0.5
            if math.floor(v12) ~= -55 then
                script.Parent.Parent.selected.Value = v_u_8
                return
            end
        end
        local v13 = v_u_8
        if v_u_5.subscription.Value - os.time() <= 5259600 then
            game.ReplicatedStorage.Remotes.Economy.buyDeveloperProduct:InvokeServer(v13.productId.Value)
        end
    end)
    spawn(function()
        -- upvalues: (copy) v_u_8
        local v14 = v_u_8:FindFirstChild("productId")
        local v15 = (v_u_8:FindFirstChild("info") or v_u_8).price
        if v14 then
            v15.Text = game:GetService("MarketplaceService"):GetProductInfo(v_u_8.productId.Value, Enum.InfoType.Product).PriceInRobux .. " R$"
        else
            v15.Text = game:GetService("MarketplaceService"):GetProductInfo(v_u_8.gamepassId.Value, Enum.InfoType.GamePass).PriceInRobux .. " R$"
        end
    end)
end
game:GetService("UserInputService").InputBegan:Connect(function(p16)
    -- upvalues: (copy) v_u_2, (copy) v_u_5
    local v17 = script.Parent.Parent.selected.Value
    if p16.KeyCode == Enum.KeyCode.ButtonX and (v17 and (v17.Parent == script.Parent and (v_u_2.open.Value and v_u_2.tab.Value == script.Parent.Parent))) then
        local v18 = script.Parent.Parent.selected.Value
        if v_u_5.subscription.Value - os.time() > 5259600 then
            return
        end
        game.ReplicatedStorage.Remotes.Economy.buyDeveloperProduct:InvokeServer(v18.productId.Value)
    end
end)
script.Parent.Parent.selected.Changed:Connect(function()
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v19 = script.Parent.Parent.selected.Value
    for _, v20 in pairs(script.Parent:GetChildren()) do
        if v20 ~= v19 and v20:IsA("GuiBase") then
            if v20:FindFirstChild("info") then
                v_u_1:Create(v20.info, TweenInfo.new(0.5), {
                    ["Position"] = UDim2.new(0, 0, 0, 0)
                }):Play()
                v20.info.xbox.Visible = false
            else
                v20.length.box.Visible = false
            end
        end
    end
    if v19 and v19.Parent == script.Parent then
        if v19:FindFirstChild("info") then
            v_u_1:Create(v19.info, TweenInfo.new(0.5), {
                ["Position"] = UDim2.new(0, 0, -0.55, 0)
            }):Play()
            v19.info.xbox.Visible = v_u_2.controller.Value
            return
        end
        local v21 = script.Parent.Parent.Parent.Parent.Parent.controller.Value
        v19.length.box.Visible = v21
    end
end)
local v_u_22 = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
local function v23()
    -- upvalues: (copy) v_u_22
    v_u_22(script.Parent)
end
script.Parent.DescendantAdded:Connect(v23)
script.Parent.DescendantRemoving:Connect(v23)
v_u_22(script.Parent)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.credits.remover
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
script.Parent:Destroy()

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.controller
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = script.Parent.Parent.Parent.Parent
local v2 = game:GetService("UserInputService")
v2.InputBegan:Connect(function(p3)
    -- upvalues: (copy) v_u_1
    if v_u_1.open.Value and v_u_1.tab.Value == script.Parent then
        local v4 = game:GetService("VRService")
        if v4:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v4:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
            return
        elseif p3.UserInputType.Value >= 12 and (p3.UserInputType.Value <= 19 and not script.Parent.selected.Value) then
            script.Parent.selected.Value = script.Parent.killparthue
        elseif p3.KeyCode == Enum.KeyCode.DPadDown then
            if script.Parent.selected.Value.NextSelectionDown then
                script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionDown
                return
            end
        elseif p3.KeyCode == Enum.KeyCode.DPadUp and script.Parent.selected.Value.NextSelectionUp then
            script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionUp
        end
    else
        return
    end
end)
local v_u_5 = false
v2.InputChanged:Connect(function(p6)
    -- upvalues: (ref) v_u_5
    if p6.KeyCode == Enum.KeyCode.Thumbstick1 then
        local v7 = game:GetService("VRService")
        if v7:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v7:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
            return
        end
        local v8 = p6.Position.X
        if math.abs(v8) < 0.4 then
            if p6.Position.Y > 0.8 then
                if not v_u_5 then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionUp or script.Parent.selected.Value
                    v_u_5 = true
                    return
                end
            elseif p6.Position.Y < -0.8 then
                if not v_u_5 then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionDown or script.Parent.selected.Value
                    v_u_5 = true
                    return
                end
            else
                v_u_5 = false
            end
        end
    end
end)
local function v11()
    -- upvalues: (copy) v_u_1
    local v9 = script.Parent.open
    local v10
    if v_u_1.tab.Value == script.Parent then
        v10 = v_u_1.open.Value
    else
        v10 = false
    end
    v9.Value = v10
end
v_u_1.tab.Changed:Connect(v11)
v_u_1.open.Changed:Connect(v11)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.theme.theme
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game.Players.LocalPlayer
v1.PlayerGui:WaitForChild("uiStyle")
local v_u_2 = game.ReplicatedStorage.data:WaitForChild(v1.UserId)
local v_u_3 = script.Parent.Parent.Parent.Parent.Parent
local v4 = game:GetService("UserInputService")
local function v_u_9(p5)
    -- upvalues: (copy) v_u_2
    local v6 = v_u_2.settings.Theme
    for _, v7 in pairs(p5:WaitForChild("uiStyle"):GetChildren()) do
        local v8 = v6:FindFirstChild(v7.Name)
        if v8 then
            v8.Value = v7.Value
            v8.set:FireServer(v7.Value)
        end
    end
end
for _, v_u_10 in pairs(script.Parent.themes:GetChildren()) do
    if v_u_10:IsA("GuiButton") then
        v_u_10.InputBegan:Connect(function(p11)
            -- upvalues: (copy) v_u_9, (copy) v_u_10
            if p11.UserInputType == Enum.UserInputType.MouseButton1 then
                v_u_9(v_u_10)
            end
        end)
        v_u_10.TouchTap:Connect(function()
            -- upvalues: (copy) v_u_9, (copy) v_u_10
            v_u_9(v_u_10)
        end)
    end
end
function updateOpen()
    -- upvalues: (copy) v_u_3
    local v12
    if script.Parent.Parent.selected.Value == script.Parent then
        v12 = script.Parent.Parent.open.Value
    else
        v12 = false
    end
    for _, v13 in pairs(script.Parent.themes:GetChildren()) do
        if v13:FindFirstChild("xbox") then
            v13.xbox.Visible = false
        end
    end
    local v14 = script.Parent.selected.Value.xbox
    if v12 then
        v12 = v_u_3.controller.Value
    end
    v14.Visible = v12
end
script.Parent.Parent.selected.Changed:Connect(updateOpen)
script.Parent.Parent.open.Changed:Connect(updateOpen)
v_u_3.controller.Changed:Connect(updateOpen)
v4.InputBegan:Connect(function(p15)
    -- upvalues: (copy) v_u_9
    if script.Parent.Parent.selected.Value == script.Parent and script.Parent.Parent.open.Value then
        local v16 = game:GetService("VRService")
        if not (v16:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v16:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
            if p15.UserInputType.Value >= 12 and p15.UserInputType.Value <= 19 then
                if p15.KeyCode == Enum.KeyCode.ButtonX then
                    v_u_9(script.Parent.selected.Value)
                    return
                end
                if p15.KeyCode == Enum.KeyCode.DPadLeft then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft or script.Parent.selected.Value
                    updateOpen()
                    return
                end
                if p15.KeyCode == Enum.KeyCode.DPadRight then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight or script.Parent.selected.Value
                    updateOpen()
                end
            end
        end
    else
        return
    end
end)
local v_u_17 = false
v4.InputChanged:Connect(function(p18)
    -- upvalues: (ref) v_u_17
    if p18.KeyCode == Enum.KeyCode.Thumbstick1 and (script.Parent.Parent.selected.Value == script.Parent and script.Parent.Parent.open.Value) then
        local v19 = game:GetService("VRService")
        if v19:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v19:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
            return
        end
        local v20 = p18.Position.Y
        if math.abs(v20) < 0.4 then
            if p18.Position.X < -0.8 then
                if not v_u_17 then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft or script.Parent.selected.Value
                    updateOpen()
                    v_u_17 = true
                    return
                end
            elseif p18.Position.X > 0.8 then
                if not v_u_17 then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight or script.Parent.selected.Value
                    updateOpen()
                    v_u_17 = true
                    return
                end
            else
                v_u_17 = false
            end
        end
    end
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.theme.themes.dark.xbox.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.theme.themes.bright.xbox.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.theme.themes.transparent.xbox.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.killparthue.killparthue
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("CollectionService")
local v2 = game.Players.LocalPlayer
local v_u_3 = game.ReplicatedStorage.data:WaitForChild(v2.UserId)
local v_u_4 = script.Parent.Parent.Parent.Parent.Parent
wait(5)
local v_u_5 = v_u_3:WaitForChild("settings"):WaitForChild("KillpartHueShift")
local function v_u_12(p6)
    -- upvalues: (copy) v_u_5, (copy) v_u_1
    if not game.ReplicatedStorage.DenormalKillpartColorSections:FindFirstChild(p6.Name) then
        local v7, v8 = Color3.toHSV(p6:WaitForChild("center").Color)
        local v_u_9 = Color3.fromHSV((v7 + v_u_5.Value) % 1, v8, 0.7)
        for _, v10 in pairs(p6:GetDescendants()) do
            if v_u_1:HasTag(v10, "KillBrick") then
                v10.Color = v_u_9
            end
        end
        p6.DescendantAdded:Connect(function(p11)
            -- upvalues: (ref) v_u_1, (copy) v_u_9
            if v_u_1:HasTag(p11, "KillBrick") then
                p11.Color = v_u_9
            end
        end)
    end
end
local function v18()
    -- upvalues: (copy) v_u_5, (copy) v_u_1
    if workspace:FindFirstChild("tower") then
        for _, v13 in pairs(workspace.tower:WaitForChild("sections"):GetChildren()) do
            if game.ReplicatedStorage.DenormalKillpartColorSections:FindFirstChild(v13.Name) then
                return
            end
            local v14, v15 = Color3.toHSV(v13:WaitForChild("center").Color)
            local v16 = Color3.fromHSV((v14 + v_u_5.Value) % 1, v15, 0.7)
            for _, v17 in pairs(v13:GetDescendants()) do
                if v_u_1:HasTag(v17, "KillBrick") then
                    v17.Color = v16
                end
            end
        end
    end
end
workspace.ChildAdded:Connect(function(p19)
    -- upvalues: (copy) v_u_12
    if p19.Name == "tower" then
        for _, v20 in pairs(p19:WaitForChild("sections"):GetChildren()) do
            v_u_12(v20)
        end
        p19.sections.ChildAdded:Connect(function(p21)
            -- upvalues: (ref) v_u_12
            v_u_12(p21)
        end)
    end
end)
v_u_5.Changed:Connect(v18)
v18()
script.Parent.slider.hueChanged.Event:Connect(function(p22, p23)
    -- upvalues: (copy) v_u_3
    v_u_3.settings.KillpartHueShift.Value = p22
    if p23 then
        v_u_3.settings.KillpartHueShift.set:InvokeServer(p22)
    end
end)
script.Parent.slider.setHue:Fire(v_u_5.Value)
function updateOpen()
    -- upvalues: (copy) v_u_4
    local v24
    if script.Parent.Parent.selected.Value == script.Parent then
        v24 = script.Parent.Parent.open.Value
    else
        v24 = false
    end
    local v25 = script.Parent.xbox
    if v24 then
        v24 = v_u_4.controller.Value
    end
    v25.Visible = v24
    script.Parent.TextLabel.Position = UDim2.new(UDim.new(0, script.Parent.xbox.Visible and 28 or 8), script.Parent.TextLabel.Position.Y)
    local v26 = script.Parent.slider.open
    local v27
    if script.Parent.Parent.selected.Value == script.Parent then
        v27 = script.Parent.Parent.open.Value
    else
        v27 = false
    end
    v26.Value = v27
end
script.Parent.Parent.selected.Changed:Connect(updateOpen)
script.Parent.Parent.open.Changed:Connect(updateOpen)
v_u_4.controller.Changed:Connect(updateOpen)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.killparthue.slider.slider
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("UserInputService")
local v_u_2 = 0
local v_u_3 = nil
script.Parent.hue.InputBegan:Connect(function(p4)
    -- upvalues: (ref) v_u_3, (copy) v_u_1
    if p4.UserInputType == Enum.UserInputType.MouseButton1 or p4.UserInputType == Enum.UserInputType.Touch and p4.Delta == Vector3.new() then
        v_u_3 = true
        v_u_1.MouseIconEnabled = false
    end
end)
v_u_1.InputEnded:Connect(function(p5)
    -- upvalues: (ref) v_u_3, (copy) v_u_1, (ref) v_u_2
    if p5.UserInputType == Enum.UserInputType.MouseButton1 or p5.UserInputType == Enum.UserInputType.Touch then
        if v_u_3 then
            v_u_3 = false
            v_u_1.MouseIconEnabled = true
            script.Parent.hueChanged:Fire(v_u_2, true)
            return
        end
    elseif p5.UserInputType.Value >= 12 and (p5.UserInputType.Value <= 19 and (p5.KeyCode == Enum.KeyCode.ButtonX and script.Parent.open.Value)) then
        script.Parent.hueChanged:Fire(v_u_2, true)
    end
end)
local function v_u_6()
    -- upvalues: (ref) v_u_2
    script.Parent.hueMarker.Position = UDim2.new(0, v_u_2 * script.Parent.hue.Size.X.Offset, 0.5, -7) + script.Parent.hue.Position
    script.Parent.hueValue.Value = v_u_2
    script.Parent.hueChanged:Fire(v_u_2)
end
v_u_1.InputChanged:Connect(function(p7, _)
    -- upvalues: (ref) v_u_3, (ref) v_u_2, (copy) v_u_6
    if (p7.UserInputType == Enum.UserInputType.MouseMovement or p7.UserInputType == Enum.UserInputType.Touch) and v_u_3 then
        local v8 = (Vector2.new(p7.Position.X, p7.Position.Y) - script.Parent.hue.AbsolutePosition) / script.Parent.hue.AbsoluteSize
        local v9 = Vector2.new
        local v10 = v8.X
        local v11 = math.max(0, v10)
        local v12 = math.min(1, v11)
        local v13 = v8.Y
        local v14 = math.max(0, v13)
        v_u_2 = v9(v12, (math.min(1, v14))).X
        v_u_6()
    end
end)
require(game.ReplicatedStorage.Library.Utility.thumbScrollerSmooth)(Enum.KeyCode.Thumbstick1, "X", function(_, p15, _)
    -- upvalues: (ref) v_u_2, (copy) v_u_6
    if script.Parent.open.Value then
        local v16 = v_u_2
        local v17 = p15 ^ 2
        local v18 = v16 + math.max(0, v17) * math.sign(p15) * 0.005
        local v19 = math.max(0, v18)
        v_u_2 = math.min(1, v19)
        v_u_6()
    end
end, nil, 0.2)
script.Parent.setHue.Event:Connect(function(p20)
    -- upvalues: (ref) v_u_2, (copy) v_u_6
    v_u_2 = p20
    v_u_6()
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.killparthue.slider.numberUpdater
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
script.Parent.hueChanged.Event:Connect(function(p1)
    local v2 = p1 * 360
    local v3 = math.floor(v2)
    local v4 = (v3 == 69 and "nice" or v3) .. "\194\176"
    script.Parent.hueMarker.TextLabel.Text = v4
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.killparthue.xbox.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.vip.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game.ReplicatedStorage.Remotes.Game.fetchServerOwnerId:InvokeServer()
if v1 ~= 0 then
    if v1 == game.Players.LocalPlayer.UserId then
        script.Parent.Unavailable.Visible = false
        script.Parent.Parent.killparthue.NextSelectionDown = script.Parent.options.length
    else
        script.Parent.Unavailable.Text = "Only available to the VIP Server owner"
    end
end
if game.ReplicatedStorage.Remotes.Moderation.isAdmin:InvokeServer() then
    script.Parent.Parent.killparthue.NextSelectionDown = script.Parent.options.length
    script.Parent.Unavailable.Visible = false
end

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.vip.options.length.length
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game.Players.LocalPlayer
game.ReplicatedStorage.data:WaitForChild(v1.UserId)
local v_u_2 = script.Parent.Parent.Parent.Parent.Parent.Parent.Parent
script.Parent.slider.hueChanged.Event:Connect(function(p3, p4)
    local v5 = p3 * (script.Parent.maxLength.Value - script.Parent.minLength.Value) + script.Parent.minLength.Value
    local v6 = math.floor(v5)
    script.Parent.Parent.reward.update:Fire(v6)
    if p4 then
        game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/setlength " .. v6)
    end
end)
script.Parent.slider.setHue:Fire((game.ReplicatedStorage.Configuration.parts.Value - script.Parent.minLength.Value) / (script.Parent.maxLength.Value - script.Parent.minLength.Value))
function updateOpen()
    -- upvalues: (copy) v_u_2
    local v7
    if script.Parent.Parent.Parent.Parent.selected.Value == script.Parent then
        v7 = script.Parent.Parent.Parent.Parent.open.Value
    else
        v7 = false
    end
    local v8 = script.Parent.xbox
    local v9
    if v7 then
        v9 = v_u_2.controller.Value
    else
        v9 = v7
    end
    v8.Visible = v9
    script.Parent.TextLabel.Position = UDim2.new(UDim.new(0, script.Parent.xbox.Visible and 28 or 8), script.Parent.TextLabel.Position.Y)
    script.Parent.slider.open.Value = v7
end
script.Parent.Parent.Parent.Parent.selected.Changed:Connect(updateOpen)
script.Parent.Parent.Parent.Parent.open.Changed:Connect(updateOpen)
script.Parent.open.Changed:Connect(updateOpen)
v_u_2.controller.Changed:Connect(updateOpen)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.vip.options.length.slider.slider
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("UserInputService")
local v_u_2 = 0
local v_u_3 = nil
script.Parent.hue.InputBegan:Connect(function(p4)
    -- upvalues: (ref) v_u_3, (copy) v_u_1
    if p4.UserInputType == Enum.UserInputType.MouseButton1 or p4.UserInputType == Enum.UserInputType.Touch and p4.Delta == Vector3.new() then
        v_u_3 = true
        v_u_1.MouseIconEnabled = false
    end
end)
v_u_1.InputEnded:Connect(function(p5)
    -- upvalues: (ref) v_u_3, (copy) v_u_1, (ref) v_u_2
    if p5.UserInputType == Enum.UserInputType.MouseButton1 or p5.UserInputType == Enum.UserInputType.Touch then
        if v_u_3 then
            v_u_3 = false
            v_u_1.MouseIconEnabled = true
            script.Parent.hueChanged:Fire(v_u_2, true)
            return
        end
    elseif p5.UserInputType.Value >= 12 and (p5.UserInputType.Value <= 19 and (p5.KeyCode == Enum.KeyCode.ButtonX and script.Parent.open.Value)) then
        script.Parent.hueChanged:Fire(v_u_2, true)
    end
end)
local function v_u_6()
    -- upvalues: (ref) v_u_2
    script.Parent.hueMarker.Position = UDim2.new(0, v_u_2 * script.Parent.hue.Size.X.Offset, 0.5, -7) + script.Parent.hue.Position
    script.Parent.hueValue.Value = v_u_2
    script.Parent.hueChanged:Fire(v_u_2)
end
v_u_1.InputChanged:Connect(function(p7, _)
    -- upvalues: (ref) v_u_3, (ref) v_u_2, (copy) v_u_6
    if (p7.UserInputType == Enum.UserInputType.MouseMovement or p7.UserInputType == Enum.UserInputType.Touch) and v_u_3 then
        local v8 = (Vector2.new(p7.Position.X, p7.Position.Y) - script.Parent.hue.AbsolutePosition) / script.Parent.hue.AbsoluteSize
        local v9 = Vector2.new
        local v10 = v8.X
        local v11 = math.max(0, v10)
        local v12 = math.min(1, v11)
        local v13 = v8.Y
        local v14 = math.max(0, v13)
        v_u_2 = v9(v12, (math.min(1, v14))).X
        v_u_6()
    end
end)
require(game.ReplicatedStorage.Library.Utility.thumbScrollerSmooth)(Enum.KeyCode.Thumbstick1, "X", function(_, p15, _)
    -- upvalues: (ref) v_u_2, (copy) v_u_6
    if script.Parent.open.Value then
        local v16 = v_u_2
        local v17 = p15 ^ 2
        local v18 = v16 + math.max(0, v17) * math.sign(p15) * 0.005
        local v19 = math.max(0, v18)
        v_u_2 = math.min(1, v19)
        v_u_6()
    end
end, nil, 0.2)
script.Parent.setHue.Event:Connect(function(p20)
    -- upvalues: (ref) v_u_2, (copy) v_u_6
    v_u_2 = p20
    v_u_6()
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.vip.options.length.slider.numberUpdater
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
script.Parent.hueChanged.Event:Connect(function(p1)
    local v2 = p1 * (script.Parent.Parent.maxLength.Value - script.Parent.Parent.minLength.Value)
    local v3 = math.floor(v2) + script.Parent.Parent.minLength.Value
    script.Parent.hueMarker.TextLabel.Text = v3
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.vip.options.length.xbox.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.vip.options.reward.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    0,
    0,
    0,
    0.3,
    0.7,
    1,
    1.2,
    1.5,
    1.8,
    2.1,
    2.3,
    2.5,
    2.55,
    2.6,
    2.7,
    2.8,
    2.9,
    3
}
function update(p2)
    -- upvalues: (copy) v_u_1
    local v3 = script.Parent.TextLabel
    local v4 = v_u_1[math.min(p2, 18)] * game.ReplicatedStorage.Configuration.defaultCoins.Value
    v3.Text = "Reward: " .. math.floor(v4) .. " Coins"
end
script.Parent.update.Event:Connect(update)
update(game.ReplicatedStorage.Configuration.parts.Value)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.vip.options.buttons.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = script.Parent.Parent.Parent.Parent.Parent.Parent.Parent
local v_u_3 = false
script.Parent.skip.InputBegan:Connect(function(p4)
    -- upvalues: (ref) v_u_3
    if p4.UserInputType == Enum.UserInputType.MouseButton1 then
        if v_u_3 then
            return
        end
        v_u_3 = true
        game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/skip")
        wait(5)
        v_u_3 = false
    end
end)
script.Parent.skip.TouchTap:Connect(function()
    -- upvalues: (ref) v_u_3
    if not v_u_3 then
        v_u_3 = true
        game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/skip")
        wait(5)
        v_u_3 = false
    end
end)
local function v_u_5()
    if script.Parent.lock.TextLabel.Text == "Lock Shop" then
        script.Parent.lock.TextLabel.Text = "Unlock Shop"
        game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/lockshop")
    else
        script.Parent.lock.TextLabel.Text = "Lock Shop"
        game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/unlockShop")
    end
end
script.Parent.lock.InputBegan:Connect(function(p6)
    -- upvalues: (copy) v_u_5
    if p6.UserInputType == Enum.UserInputType.MouseButton1 then
        v_u_5()
    end
end)
script.Parent.lock.TouchTap:Connect(function()
    -- upvalues: (copy) v_u_5
    v_u_5()
end)
script.Parent.lock.TextLabel.Text = game.ReplicatedStorage.Configuration.shopLocked.Value and "Unlock Shop" or "Lock Shop"
function updateOpen()
    -- upvalues: (copy) v_u_2
    local v7
    if script.Parent.Parent.Parent.Parent.selected.Value == script.Parent then
        v7 = script.Parent.Parent.Parent.Parent.open.Value
    else
        v7 = false
    end
    for _, v8 in pairs(script.Parent:GetChildren()) do
        if v8:FindFirstChild("xbox") then
            v8.xbox.Visible = false
        end
    end
    local v9 = script.Parent.selected.Value.xbox
    if v7 then
        v7 = v_u_2.controller.Value
    end
    v9.Visible = v7
end
script.Parent.Parent.Parent.Parent.selected.Changed:Connect(updateOpen)
script.Parent.Parent.Parent.Parent.open.Changed:Connect(updateOpen)
v_u_2.controller.Changed:Connect(updateOpen)
v1.InputBegan:Connect(function(p10)
    -- upvalues: (copy) v_u_5
    if script.Parent.Parent.Parent.Parent.selected.Value == script.Parent and script.Parent.Parent.Parent.Parent.open.Value then
        local v11 = game:GetService("VRService")
        if not (v11:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v11:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
            if p10.UserInputType.Value >= 12 and p10.UserInputType.Value <= 19 then
                if p10.KeyCode == Enum.KeyCode.ButtonX then
                    if script.Parent.selected.Value == script.Parent.lock then
                        v_u_5()
                    else
                        game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/skip")
                    end
                end
                if p10.KeyCode == Enum.KeyCode.DPadLeft then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft or script.Parent.selected.Value
                    updateOpen()
                    return
                end
                if p10.KeyCode == Enum.KeyCode.DPadRight then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight or script.Parent.selected.Value
                    updateOpen()
                end
            end
        end
    else
        return
    end
end)
local v_u_12 = false
v1.InputChanged:Connect(function(p13)
    -- upvalues: (ref) v_u_12
    if p13.KeyCode == Enum.KeyCode.Thumbstick1 and (script.Parent.Parent.Parent.Parent.selected.Value == script.Parent and script.Parent.Parent.Parent.Parent.open.Value) then
        local v14 = game:GetService("VRService")
        if v14:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v14:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
            return
        end
        local v15 = p13.Position.Y
        if math.abs(v15) < 0.4 then
            if p13.Position.X < -0.8 then
                if not v_u_12 then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft or script.Parent.selected.Value
                    updateOpen()
                    v_u_12 = true
                    return
                end
            elseif p13.Position.X > 0.8 then
                if not v_u_12 then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight or script.Parent.selected.Value
                    updateOpen()
                    v_u_12 = true
                    return
                end
            else
                v_u_12 = false
            end
        end
    end
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.vip.options.buttons.skip.xbox.controllerIcon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("VRService")
function updateController(p3)
    -- upvalues: (copy) v_u_2
    local v4
    if p3.UserInputType.Value >= 12 and p3.UserInputType.Value <= 19 then
        v4 = true
    else
        if p3.UserInputType.Value > 8 then
            return
        end
        v4 = false
    end
    if v4 then
        local v5 = v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v_u_2:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
        v4 = not v5
    end
    if v4 then
        local v6 = Enum.KeyCode[script:GetAttribute("Button")]
        local v7 = game:GetService("UserInputService"):GetImageForKeyCode(v6)
        script.Parent.Image = v7
    end
end
v1.InputBegan:connect(function(p8, _)
    updateController(p8)
end)
