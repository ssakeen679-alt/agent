
--========================================
-- ModuleScript : ReplicatedStorage.AllModules.DroppersAndUpgraders
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v2 = {
    ["Basic dropper"] = {
        ["DroppableList"] = { "SimplePart" },
        ["DropDelay"] = 4,
        ["TEPM"] = 210
    },
    ["Dropper"] = {
        ["DroppableList"] = {
            "GreenPart",
            "RedBrickPart",
            "YellowBrickPart",
            "GiantPart"
        },
        ["DropDelay"] = 4,
        ["TEPM"] = 500
    },
    ["Mega dropper"] = {
        ["DroppableList"] = { "Coin", "500" },
        ["DropDelay"] = 4,
        ["TEPM"] = 2000
    },
    ["Gold dropper"] = {
        ["DroppableList"] = { "Gold" },
        ["DropDelay"] = 5,
        ["TEPM"] = 12000
    },
    ["Cube dropper"] = {
        ["DroppableList"] = { "ShinyCube" },
        ["DropDelay"] = 5,
        ["TEPM"] = 45000
    },
    ["Friend dropper"] = {
        ["DroppableList"] = { "FriendNoob" },
        ["DropPartNumber"] = 2,
        ["DropDelay"] = 7.5,
        ["TEPM"] = 50000
    },
    ["Millionaire dropper"] = {
        ["DroppableList"] = { "Dollar" },
        ["DropDelay"] = 5,
        ["TEPM"] = 60000
    },
    ["Halloween dropper"] = {
        ["DroppableList"] = { "Pumpkin" },
        ["DropDelay"] = 5,
        ["TEPM"] = 48000
    },
    ["Firework dropper"] = {
        ["DroppableList"] = { "Fireworks" },
        ["DropDelay"] = 5,
        ["TEPM"] = 55000
    },
    ["Christmas dropper"] = {
        ["DroppableList"] = { "NormalGift" },
        ["DropDelay"] = 5,
        ["TEPM"] = 60000
    },
    ["Crate dropper"] = {
        ["DroppableList"] = { "SmallWoodenCrate" },
        ["DropDelay"] = 5,
        ["TEPM"] = 40000
    },
    ["Rare crate dropper"] = {
        ["DroppableList"] = { "GoldenCrate" },
        ["DropDelay"] = 5,
        ["TEPM"] = 110000
    },
    ["Key dropper"] = {
        ["DroppableList"] = { "WoodenKey" },
        ["DropDelay"] = 5,
        ["TEPM"] = 45000
    },
    ["Rare key dropper"] = {
        ["DroppableList"] = { "GoldenKey" },
        ["DropDelay"] = 5,
        ["TEPM"] = 120000
    },
    ["Zombie dropper"] = {
        ["DroppableList"] = { "WoodenHead" },
        ["DropDelay"] = 5,
        ["TEPM"] = 50000
    },
    ["Rare zombie dropper"] = {
        ["DroppableList"] = { "GoldenHead" },
        ["DropDelay"] = 5,
        ["TEPM"] = 130000
    },
    ["Snowball dropper"] = {
        ["DroppableList"] = { "Snowball" },
        ["DropPartNumber"] = 2,
        ["DropDelay"] = 7.5,
        ["TEPM"] = 70000
    },
    ["Thanksgiving dropper"] = {
        ["DroppableList"] = { "GreenPumpkin" },
        ["DropDelay"] = 7.5,
        ["TEPM"] = 80000
    },
    ["Heart dropper"] = {
        ["DroppableList"] = { "Heart" },
        ["DropDelay"] = 9,
        ["TEPM"] = 37500
    },
    ["Wooden crate dropper"] = {
        ["DroppableList"] = { "WoodenCrate" },
        ["DropDelay"] = 20,
        ["TEPM"] = 200000
    },
    ["Spring dropper"] = {
        ["DroppableList"] = { "Flower" },
        ["DropDelay"] = 7,
        ["TEPM"] = 60000
    },
    ["Waterfall dropper"] = {
        ["DropDelay"] = 30,
        ["TEPM"] = 130000
    },
    ["Leaf dropper"] = {
        ["DropDelay"] = 30,
        ["TEPM"] = 65000
    },
    ["Snowflake dropper"] = {
        ["DroppableList"] = { "Snowflake" },
        ["DropPartNumber"] = 2,
        ["DropDelay"] = 5,
        ["TEPM"] = 70000
    },
    ["Clone dropper"] = {
        ["DroppableList"] = { "HealingClone" },
        ["DropDelay"] = 10,
        ["TEPM"] = 90000
    },
    ["Dual clone dropper"] = {
        ["DroppableList"] = { "HealingClone" },
        ["DropPartNumber"] = 2,
        ["DropDelay"] = 10,
        ["TEPM"] = 180000
    },
    ["Stone crate dropper"] = {
        ["DroppableList"] = { "StoneCrate" },
        ["DropDelay"] = 25,
        ["TEPM"] = 240000
    },
    ["Code dropper"] = {
        ["DroppableList"] = { "CodePart" },
        ["DropDelay"] = 5,
        ["TEPM"] = 150000
    },
    ["Spin wheel dropper"] = {
        ["DroppableList"] = { "SpinWheel" },
        ["DropDelay"] = 5,
        ["TEPM"] = 245000
    },
    ["Flower dropper"] = {
        ["DroppableList"] = { "Flower" },
        ["DropDelay"] = 10,
        ["TEPM"] = 250000
    },
    ["Ice dropper"] = {
        ["DroppableList"] = { "IceCube" },
        ["DropDelay"] = 15,
        ["TEPM"] = 130000
    },
    ["Quest dropper"] = {
        ["DroppableList"] = { "Quest" },
        ["DropDelay"] = 8,
        ["TEPM"] = 100000
    },
    ["Laser barrier dropper"] = {
        ["DroppableList"] = { "LaserBarrier" },
        ["DropDelay"] = 6,
        ["TEPM"] = 150000
    },
    ["Silver crate dropper"] = {
        ["DroppableList"] = { "SilverCrate" },
        ["DropPartNumber"] = 3,
        ["DropDelay"] = 6,
        ["TEPM"] = 1600000
    },
    ["HP dropper"] = {
        ["DroppableList"] = { "HP" },
        ["DropDelay"] = 6,
        ["TEPM"] = 400000
    },
    ["Golden crate dropper"] = {
        ["DroppableList"] = { "GoldenCrate" },
        ["DropDelay"] = 20,
        ["TEPM"] = 825000
    },
    ["Billionaire dropper"] = {
        ["DroppableList"] = { "Dollar" },
        ["DropPartNumber"] = 4,
        ["DropDelay"] = 6,
        ["TEPM"] = 3250000
    },
    ["Gift dropper"] = {
        ["DroppableList"] = { "RedGiftCrate" },
        ["DropDelay"] = 6,
        ["TEPM"] = 1700000
    },
    ["Diamond crate dropper"] = {
        ["DroppableList"] = { "DiamondCrate" },
        ["DropPartNumber"] = 4,
        ["DropDelay"] = 6,
        ["TEPM"] = 9000000
    },
    ["Secondary clone dropper"] = {
        ["DroppableList"] = { "GreedyClone" },
        ["DropPartNumber"] = 3,
        ["DropDelay"] = 6,
        ["TEPM"] = 3000000
    },
    ["Infinity dropper"] = {
        ["DroppableList"] = { "Infinity" },
        ["DropPartNumber"] = 2,
        ["DropDelay"] = 6,
        ["TEPM"] = 25000000
    },
    ["\206\169 dropper"] = {
        ["DroppableList"] = { "OMEGA" },
        ["DropPartNumber"] = 2,
        ["DropDelay"] = 6,
        ["TEPM"] = 75000000
    },
    ["ExtraDropper"] = {
        ["DroppableList"] = { "Dollar" },
        ["DropDelay"] = 2,
        ["TEPM"] = 1920
    }
}
v1.Droppers = v2
for _, v3 in {
    "Yellow",
    "Orange",
    "Blue",
    "Purple",
    "Green",
    "Red"
} do
    v1.Droppers[v3 .. " egg dropper"] = {
        ["DroppableList"] = { v3 .. "Egg" },
        ["DropDelay"] = 7,
        ["TEPM"] = 40000
    }
end
for _, v4 in pairs(v1.Droppers) do
    v4.IncomeRate = v4.DropDelay
end
local v5 = {
    ["Basic upgrader"] = {
        ["Multiplier"] = 2
    },
    ["Upgrader"] = {
        ["Multiplier"] = 2.5
    },
    ["Gold upgrader"] = {
        ["Multiplier"] = 5.5
    }
}
v1.Upgraders = v5
v1.UpgraderNameToDroppersAffectedList = {
    ["Basic upgrader (1)"] = { "Basic dropper (1)", "Basic dropper (2)", "Basic dropper (3)" },
    ["Basic upgrader (2)"] = {
        "Basic dropper (1)",
        "Basic dropper (2)",
        "Basic dropper (3)",
        "Basic dropper (4)",
        "Basic dropper (5)",
        "Basic dropper (6)"
    },
    ["Basic upgrader (3)"] = {
        "Dropper (1)",
        "Dropper (2)",
        "Dropper (3)",
        "Basic dropper (7)",
        "Basic dropper (8)",
        "Basic dropper (9)"
    },
    ["Upgrader (1)"] = { "Dropper (1)", "Dropper (2)", "Basic dropper (7)" },
    ["Upgrader (2)"] = {
        "Dropper (4)",
        "Dropper (5)",
        "Dropper (6)",
        "Dropper (7)",
        "Dropper (8)"
    },
    ["Upgrader (3)"] = {
        "Dropper (4)",
        "Dropper (5)",
        "Dropper (6)",
        "Dropper (7)",
        "Dropper (8)"
    },
    ["Upgrader (4)"] = {
        "Dropper (9)",
        "Dropper (10)",
        "Mega dropper (1)",
        "Mega dropper (2)"
    },
    ["Upgrader (5)"] = {
        "Dropper (9)",
        "Dropper (10)",
        "Mega dropper (1)",
        "Mega dropper (2)"
    },
    ["Upgrader (6)"] = { "Mega dropper (3)", "Mega dropper (4)", "Mega dropper (5)" },
    ["Gold upgrader (1)"] = { "Gold dropper (1)", "Gold dropper (2)" },
    ["ExtraUpgrader"] = {
        "Basic dropper (1)",
        "Basic dropper (2)",
        "Basic dropper (3)",
        "Basic dropper (4)",
        "Basic dropper (5)",
        "Basic dropper (6)"
    }
}
if game:GetService("RunService"):IsStudio() and game:GetService("RunService"):IsServer() then
    local v6 = {
        "Silver crate dropper",
        "Billionaire dropper",
        "Infinity dropper",
        "Diamond crate dropper",
        "Secondary clone dropper",
        "\206\169 dropper",
        "Gift dropper"
    }
    for v7, v8 in pairs(v1.Droppers) do
        if v8.TEPM > v1.Droppers["\206\169 dropper"].TEPM then
            warn(v7, "has an income over the max")
        elseif v8.TEPM > 10000000 then
            if v7 ~= "Infinity dropper" and v7 ~= "\206\169 dropper" then
                warn("Too high income", v7, v8.TEPM)
            end
        elseif v8.TEPM > 1000000 and not table.find(v6, v7) then
            warn(v7, "has unexpected high income")
        end
    end
end
return v1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ItemAnimations
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Players").LocalPlayer
return {
    ["CollectItem"] = function(p2, p3, p4, p5, p6)
        -- upvalues: (copy) v_u_1
        local v7 = p4 or 0.8
        local v8 = p6 or 4
        local v9 = p2.Position - p3.Position
        local v10 = v9.Y + v8
        if v10 > 0 then
            local v11 = 2 / v7 * v8
            local v12 = v10 / v8
            local v13 = v11 * (math.sqrt(v12) + 1)
            local v14 = v13 ^ 2 / (4 * v8)
            local v15 = 0.5 * v13 / v14
            local v16 = Vector3.new(0, v14, 0)
            local v17 = -v9.X / v7
            local v18 = -v9.Z / v7
            local v19 = Vector3.new(v17, v13, v18)
            local v20 = math.random(30, 120)
            local v21 = 3.141592653589793 + math.rad(v20)
            local v22 = p2.CFrame.Rotation
            local v23 = Instance.new("Model", workspace)
            local v24 = p2:Clone()
            v24.Parent = v23
            v24.CanCollide = false
            v24.CanTouch = false
            v24.CanQuery = false
            for _, v25 in pairs(v24:GetDescendants()) do
                if v25:IsA("BasePart") then
                    v25.CanCollide = false
                    v25.CanTouch = false
                    v25.CanQuery = false
                end
            end
            v24.Anchored = true
            v24.Transparency = 0
            v23.PrimaryPart = v24
            local v26 = v24:FindFirstChildOfClass("Sound")
            if v26 then
                v26.PlaybackRegion = NumberRange.new(0, 0.2 + v_u_1.Stats.Upgrades.CloneHealOnKillLevel.Value / 37 * 0.8)
                v26:Play()
            end
            local v27 = p3.Position
            local v28 = 0
            while v28 < v7 do
                local v29 = CFrame.new(-v16 * v28 ^ 2 + v19 * v28 + v9 + v27)
                local v30 = CFrame.fromAxisAngle
                local v31 = 1.5707963267948966 * v28 / v7
                v23:PivotTo(v29 * v30(Vector3.new(0, 1, 0), v21 * math.sin(v31)) * v22)
                v28 = v28 + task.wait()
                if p3.Parent then
                    v27 = p3.Position
                end
                local v32
                if p5 then
                    local v33 = 1.5707963267948966 * v28 / v7
                    v32 = math.cos(v33)
                elseif v15 < v28 then
                    local v34 = 1.5707963267948966 * (v28 - v15) / (v7 - v15)
                    v32 = math.cos(v34) or 1
                else
                    v32 = 1
                end
                v23:ScaleTo((math.max(0.005, v32)))
            end
            if v26 and v26.IsPlaying then
                for _, v35 in pairs(v23:GetDescendants()) do
                    if v35:IsA("BasePart") then
                        v35.Transparency = 1
                    end
                end
                v26.Ended:Wait()
            end
            v23:Destroy()
        end
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.TeleportButton
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = v_u_4:WaitForChild("PlayerGui"):WaitForChild("MainGui")
local v_u_6 = v_u_5.TeleportButton
local v_u_7 = v_u_6.UIGradient
local v_u_8 = nil
local v_u_9 = workspace:WaitForChild("Camera")
local v_u_10 = require(v2.AllModules.KeyInputLabelMaker)
local v_u_11 = require(v_u_5.MainGuiScript.GetJumpButton)
local v_u_12 = require(v2.AllModules.InputManager)
local v_u_13 = UDim2.new(0.08, 25, 0.05, 0)
local v_u_14 = 0
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = game.SoundService:WaitForChild("Sound"):WaitForChild("ClickSound")
local v18 = {}
local v_u_19 = nil
function MakeGradientAtValue(p20)
    -- upvalues: (copy) v_u_7
    local v21
    if p20 > 0.5 then
        v21 = Color3.new(1, 1):Lerp(Color3.new(0, 1), (p20 - 0.5) / 0.5)
    else
        v21 = Color3.new(1):Lerp(Color3.new(1, 1), p20 / 0.5)
    end
    if p20 == 0 then
        v_u_7.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)) })
        return
    elseif p20 + 0.01 < 1 then
        v_u_7.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, v21),
            ColorSequenceKeypoint.new(p20, v21),
            ColorSequenceKeypoint.new(p20 + 0.01, Color3.new(1, 1, 1)),
            ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
        })
        return
    elseif p20 == 0 or p20 == 1 then
        v_u_7.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v21), ColorSequenceKeypoint.new(1, v21) })
    else
        v_u_7.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v21), ColorSequenceKeypoint.new(p20, v21), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)) })
    end
end
function TweenGradient(p22)
    -- upvalues: (ref) v_u_14
    local v23 = 0
    while v23 < 5 do
        local v24 = MakeGradientAtValue
        local v25 = v23 / 5 * 3.141592653589793 / 2
        v24(1 - math.sin(v25))
        v23 = v23 + task.wait()
        if p22 ~= v_u_14 then
            return
        end
    end
    MakeGradientAtValue(0)
end
function TeleportCharacterToPosition(p26, p27, p28)
    -- upvalues: (ref) v_u_14, (copy) v_u_4, (copy) v_u_9, (copy) v_u_17, (ref) v_u_19, (copy) v_u_3, (copy) v_u_6
    v_u_14 = v_u_14 + 1
    DisconnectAll()
    local v29 = v_u_14
    if v_u_4.Character then
        local v30 = v_u_4.Character:FindFirstChild("Humanoid")
        local v31 = v_u_4.Character:FindFirstChild("HumanoidRootPart")
        if v31 then
            v31.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            v31.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            local v32 = v31.Size / 2
            p26 = p26 + Vector3.new(0, v32, 0)
        end
        if v30 then
            local v33 = v30.HipHeight
            p26 = p26 + Vector3.new(0, v33, 0)
            if v30.Sit then
                v30:ChangeState(Enum.HumanoidStateType.Jumping)
                task.wait()
            end
        end
        v_u_4.Character:PivotTo(p26)
        local v34 = v_u_4.Character:FindFirstChild("Head")
        if v34 then
            v_u_9.CameraType = Enum.CameraType.Scriptable
            v_u_9.CFrame = CFrame.lookAt((p26 * CFrame.new(0, 5, 15)).Position, v34.Position)
            v_u_9.CameraType = Enum.CameraType.Custom
        end
    end
    if p27 and p27:GetAttribute("ClientAskedAppearance") ~= p28 then
        p27:SetAttribute("ClientAskedAppearance", p28)
    end
    v_u_17:Play()
    v_u_19 = v_u_3:Create(v_u_6, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        ["Size"] = UDim2.fromOffset(3, 3)
    })
    v_u_19:Play()
    v_u_19.Completed:Wait()
    if v_u_14 == v29 then
        v_u_6.Visible = false
    end
end
function DisconnectAll()
    -- upvalues: (ref) v_u_15, (ref) v_u_16
    if v_u_15 and v_u_15.Connected then
        v_u_15:Disconnect()
    end
    if v_u_16 and v_u_16.Connected then
        v_u_16:Disconnect()
    end
end
function v18.EnableButton(p35, p_u_36, p_u_37, p_u_38)
    -- upvalues: (copy) v_u_4, (ref) v_u_14, (ref) v_u_19, (copy) v_u_6, (copy) v_u_13, (copy) v_u_11, (copy) v_u_5, (ref) v_u_16, (copy) v_u_12, (ref) v_u_15, (copy) v_u_1, (ref) v_u_8, (copy) v_u_10, (copy) v_u_3
    if v_u_4:DistanceFromCharacter(p_u_36.Position) < 60 then
        return
    else
        v_u_14 = v_u_14 + 1
        local v39 = v_u_14
        DisconnectAll()
        if v_u_19 and v_u_19.PlaybackState == Enum.PlaybackState.Playing then
            v_u_19:Cancel()
            v_u_19:Destroy()
        end
        MakeGradientAtValue(1)
        v_u_6.Text = p35
        local v40 = v_u_13
        local v41 = v_u_11()
        local v42 = _G.ConstantOffset or 0.013 * v_u_5.AbsoluteSize.Y
        if v41 and v41.Visible then
            v_u_6.AnchorPoint = Vector2.new(1, 0.5)
            v_u_6.Position = UDim2.fromOffset(v41.AbsolutePosition.X - v42, v41.AbsolutePosition.Y + v41.AbsoluteSize.Y / 2)
        else
            local v43 = v_u_5.LowerFrameContainer.ToolFrame.AbsoluteSize.Y
            v_u_6.Position = UDim2.fromScale(1, 1) + UDim2.fromOffset(-v42 * 2, v42 - v43)
            local v44 = UDim2.new
            local v45 = 0.6 * v43
            local v46 = v_u_5.AbsoluteSize.Y * 0.05
            v40 = v44(0.08, 25, 0, (math.min(v45, v46)))
        end
        v_u_6.Visible = true
        v_u_16 = v_u_6.Activated:Once(function()
            -- upvalues: (copy) p_u_36, (copy) p_u_37, (copy) p_u_38
            TeleportCharacterToPosition(p_u_36, p_u_37, p_u_38)
        end)
        if v_u_12.LastInputType == "Gamepad" then
            v_u_15 = v_u_1.InputBegan:Connect(function(p47, p48)
                -- upvalues: (copy) p_u_36, (copy) p_u_37, (copy) p_u_38
                if not p48 then
                    if p47.KeyCode == Enum.KeyCode.ButtonY then
                        TeleportCharacterToPosition(p_u_36, p_u_37, p_u_38)
                    end
                end
            end)
            local v49 = {
                ["Position"] = UDim2.new(0, -v42, 0.5, 0),
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                ["AnchorPoint"] = Vector2.new(1, 0.5)
            }
            v_u_8 = v_u_10.ShowKeyInputImage(v_u_6, Enum.KeyCode.ButtonY, v49)
        elseif v_u_8 then
            v_u_8.Visible = false
        end
        v_u_6.Size = UDim2.fromOffset(3, 3)
        v_u_19 = v_u_3:Create(v_u_6, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["Size"] = v40
        })
        v_u_19:Play()
        v_u_19.Completed:Wait()
        task.wait(0.5)
        if v_u_14 == v39 then
            TweenGradient(v39)
            task.wait()
            if v_u_14 == v39 then
                v_u_19 = v_u_3:Create(v_u_6, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                    ["Size"] = UDim2.fromOffset(3, 3)
                })
                v_u_19:Play()
                v_u_19.Completed:Wait()
                if v_u_14 == v39 then
                    DisconnectAll()
                    v_u_6.Visible = false
                end
            else
                return
            end
        else
            return
        end
    end
end
return v18

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.CanEnterTower
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.Friends.ImprovedIsFriendWith)
function CanEnterTower(p2, p3)
    -- upvalues: (copy) v_u_1
    if p2 == p3 then
        return true
    end
    local v4 = p2.Settings.Permission.Value
    return v4 == 2 and true or (v4 == 1 and v_u_1(p3, p2.UserId) and true or false)
end
return CanEnterTower

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.GetStrokeColorFor
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
function GetStrokeColorFor(p1)
    return 0.2126 * p1.R + 0.7152 * p1.G + 0.0722 * p1.B >= 0.5 and Color3.new() or Color3.new(1, 1, 1)
end
return GetStrokeColorFor

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.IsHeadShot
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    "HairAttachment",
    "HatAttachment",
    "FaceFrontAttachment",
    "FaceCenterAttachment"
}
return function(p2)
    -- upvalues: (copy) v_u_1
    if not p2 then
        return false
    end
    for _, v3 in pairs(v_u_1) do
        if p2:FindFirstChild(v3) then
            return true
        end
    end
    return false
end

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.QuestDescription
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_4 = {
    ["QuestRewards"] = {
        ["respin"] = 2,
        ["wooden key"] = 5,
        ["stone key"] = 4,
        ["silver key"] = 3,
        ["golden key"] = 2,
        ["diamond key"] = 1
    },
    ["Quest"] = {
        ["wooden crate"] = 15,
        ["stone crate"] = 10,
        ["silver crate"] = 5,
        ["golden crate"] = 2,
        ["diamond crate"] = 1,
        ["Playtime"] = 900,
        ["Kills"] = 4,
        ["CodesUsed"] = 3
    },
    ["CanGetQuest"] = {
        ["Playtime"] = function(p1)
            return not table.find(p1.Stats.FloorOwnedSrtVal.Value:split("_"), "80")
        end,
        ["diamond crate"] = function(p2)
            return p2.leaderstats.Level.Value >= 200
        end,
        ["CodesUsed"] = function(p3)
            return p3.Stats.CodesUsed.Value >= 200
        end
    },
    ["AllQuestRewardNames"] = {},
    ["AllQuestName"] = {}
}
for v5, _ in pairs(v_u_4.QuestRewards) do
    local v6 = v_u_4.AllQuestRewardNames
    table.insert(v6, v5)
end
for v7, _ in pairs(v_u_4.Quest) do
    local v8 = v_u_4.AllQuestName
    table.insert(v8, v7)
end
function GetRandomIn(p9)
    local v10 = math.random(1, #p9)
    return p9[v10], v10
end
function v_u_4.GetNewQuestForPlayer(p11, p12)
    -- upvalues: (copy) v_u_4
    local v13 = table.clone(v_u_4.AllQuestName)
    for _, v14 in pairs(p12) do
        local v15 = table.find(v13, v14)
        if v15 then
            table.remove(v13, v15)
        end
    end
    for v16, v17 in pairs(v_u_4.CanGetQuest) do
        local v18 = table.find(v13, v16)
        if v18 and not v17(p11) then
            table.remove(v13, v18)
        end
    end
    local v19, v20 = GetRandomIn(v13)
    table.remove(v13, v20)
    local v21 = GetRandomIn(v13)
    table.clear(v13)
    return v19, v21
end
return v_u_4

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.GuiMark
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = script:WaitForChild("Mark")
local v_u_3 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, false, 6)
local v4 = {}
local v_u_5 = {}
v_u_5.__index = v_u_5
function v4.AddMark(p6, p7, p8, p9)
    -- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
    local v10 = v_u_5
    local v11 = setmetatable({}, v10)
    local v12 = v_u_2:Clone()
    v12.Parent = p6
    v11.MarkLabel = v12
    v11.MarkTween = v_u_1:Create(v12, v_u_3, {
        ["Rotation"] = v12.Rotation + 360
    })
    if p9 then
        v12.Position = p9
    end
    if p8 then
        v12.Size = p8
    end
    if p7 then
        v11:Show()
        return v11
    else
        v11:Hide()
        return v11
    end
end
function v_u_5.Show(p13)
    p13.MarkLabel.Visible = true
    p13.IsDisplayed = true
    p13.MarkTween:Play()
end
function v_u_5.Hide(p14)
    p14.MarkLabel.Visible = false
    p14.IsDisplayed = false
    p14.MarkTween:Pause()
end
function v_u_5.DeleteMark(p15)
    p15.MarkLabel:Destroy()
    table.clear(p15)
end
return v4

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.GetRestriction
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("SocialService")
local v_u_2 = game:GetService("PolicyService")
local v_u_3 = game.Players.LocalPlayer
local v_u_4 = {}
local v_u_5 = {
    ["CanInvitePlayers"] = function()
        -- upvalues: (copy) v_u_1, (copy) v_u_3
        return v_u_1:CanSendGameInviteAsync(v_u_3)
    end,
    ["ArePaidRandomItemsRestricted"] = function()
        -- upvalues: (copy) v_u_2, (copy) v_u_3
        return v_u_2:GetPolicyInfoForPlayerAsync(v_u_3).ArePaidRandomItemsRestricted
    end
}
return function(p6)
    -- upvalues: (copy) v_u_4, (copy) v_u_5
    if v_u_4[p6] then
        return v_u_4[p6]
    end
    local v7 = 0
    while true do
        local v8, v9 = pcall(v_u_5[p6])
        if v8 then
            v_u_4[p6] = v9
        else
            v7 = v7 + 1
            if v7 >= 10 then
                warn("Unable to load \"" .. p6 .. "\"")
                return false
            end
            task.wait(0.5)
        end
        if v_u_4[p6] ~= nil then
            return v_u_4[p6] or false
        end
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.GetEventNameFromEventFloorName
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = v_u_1[p2]
    if not v3 then
        v3 = (p2:find("Frozen") or p2:find("Snow")) and "Winter" or (p2 == "4th of july_Floor" and "4thOfJuly" or (p2 == "Gift_Floor" and "Christmas" or (p2 == "Flower_Floor" and "Spring" or p2:sub(1, -7))))
        v_u_1[p2] = v3
    end
    return v3
end

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.GetTowerForPlayer
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1, p2)
    local v3 = p2 and p1:WaitForChild("Tycoon", (1 / 0)) or p1:FindFirstChild("Tycoon")
    local v4
    if v3 then
        v4 = v3.Value
    else
        v4 = v3
    end
    if not v4 and p2 then
        while not v4 do
            v3:GetPropertyChangedSignal("Value"):Wait()
            v4 = v3.Value
        end
    end
    return v4
end

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.InputManager
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = {}
local v_u_3 = {
    ["Gamepad"] = {
        Enum.UserInputType.Gamepad1,
        Enum.UserInputType.Gamepad2,
        Enum.UserInputType.Gamepad3,
        Enum.UserInputType.Gamepad4,
        Enum.UserInputType.Gamepad5,
        Enum.UserInputType.Gamepad6,
        Enum.UserInputType.Gamepad7,
        Enum.UserInputType.Gamepad8
    },
    ["PC"] = {
        Enum.UserInputType.Keyboard,
        Enum.UserInputType.MouseMovement,
        Enum.UserInputType.MouseButton1,
        Enum.UserInputType.MouseButton2,
        Enum.UserInputType.MouseButton3,
        Enum.UserInputType.MouseWheel
    },
    ["Mobile"] = { Enum.UserInputType.Touch }
}
local v_u_4 = {}
function OnUserInputTypeChanged(p5)
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
    local v6 = false
    for v7, v8 in pairs(v_u_3) do
        if v7 ~= v_u_4.LastInputType and table.find(v8, p5) then
            v_u_4.LastInputType = v7
            v6 = true
            break
        end
    end
    if v6 then
        for _, v9 in pairs(v_u_2) do
            task.spawn(v9, v_u_4.LastInputType)
        end
    end
end
function v_u_4.ConnectToInputChanged(p10, p11, p12)
    -- upvalues: (copy) v_u_2, (copy) v_u_4
    if v_u_2[p11] then
        warn("InputManager: Label \'" .. tostring(p11) .. "\' was already used")
    end
    v_u_2[p11] = p10
    p10(v_u_4.LastInputType)
    if not p12 then
        task.spawn(p10, v_u_4.LastInputType)
    end
end
function v_u_4.Disconnect(p13, p14)
    -- upvalues: (copy) v_u_2
    if v_u_2[p13] then
        if p14 then
            v_u_2[p13]()
        end
        v_u_2[p13] = nil
    end
end
v1.LastInputTypeChanged:Connect(OnUserInputTypeChanged)
OnUserInputTypeChanged(v1:GetLastInputType())
return v_u_4

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.KeyInputLabelMaker
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("UserInputService")
local v_u_2 = script.InputFrame
return {
    ["ShowKeyInputImage"] = function(p3, p4, p5, p6)
        -- upvalues: (copy) v_u_2, (copy) v_u_1
        if p4 then
            local v7 = p3:FindFirstChild(p6 or "InputFrame")
            if not v7 then
                v7 = v_u_2:Clone()
                if p6 then
                    v7.Name = p6
                end
                v7.Parent = p3
                if p5 then
                    if p5.SizeConstraint then
                        v7.SizeConstraint = p5.SizeConstraint
                    end
                    if p5.AnchorPoint then
                        v7.AnchorPoint = p5.AnchorPoint
                    end
                    if p5.Position then
                        v7.Position = p5.Position
                    end
                    if p5.Size then
                        v7.Size = p5.Size
                    end
                end
            end
            v7.InputImage.Image = v_u_1:GetImageForKeyCode(p4)
            v7.Visible = true
            return v7
        end
    end,
    ["HideInputImage"] = function(_) end
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.BeamCreator
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ReplicatedStorage").Tools.KeyBeam
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_8 = {
    ["AllBeams"] = {},
    ["ShowBeam"] = function(p3, p4, p5)
        -- upvalues: (copy) v_u_8, (copy) v_u_1, (copy) v_u_2
        local v6 = v_u_8.AllBeams[p3]
        if not v6 then
            v6 = v_u_1:Clone()
            v_u_8.AllBeams[p3] = v6
            v6.Name = p3
            v6.Parent = workspace
        end
        local v7 = not p5 and v_u_2.Character
        if v7 then
            v7 = v_u_2.Character:FindFirstChild("HumanoidRootPart")
        end
        v6.Attachment1 = v7:FindFirstChild("RootRigAttachment")
        v6.Attachment0 = p4
        v6.Enabled = true
        return v6
    end
}
return v_u_8

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.InventoryModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("CollectionService")
local v_u_2 = require(game:GetService("ReplicatedStorage").AllModules.GetTowerForPlayer)
local v_u_3 = {}
local v_u_4 = { "Speed potion", "Size potion", "Jump potion" }
v_u_3.ListLevelToMaxNumber = {
    { 0, 2 },
    { 6, 3 },
    { 25, 4 },
    { 50, 5 },
    { 100, 6 },
    { 200, 7 },
    { 400, 8 },
    { 1000, 9 }
}
function v_u_3.GetAllowedItemFor(p5)
    -- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_1
    local v6 = v_u_2(p5)
    if v6 then
        if not v6:GetAttribute("IsBuilding") then
            local v7 = p5.leaderstats.Level.Value >= 6 and table.clone(v_u_4) or {}
            for _, v8 in pairs(v_u_1:GetTagged("ToolGiver")) do
                if v8:IsDescendantOf(v6) then
                    local v9 = v8:GetAttribute("GiveItem")
                    if not table.find(v7, v9) then
                        table.insert(v7, v9)
                    end
                end
            end
            return v7
        end
    end
end
function v_u_3.GetMaxNumberOfAutoEqquipTool(p10)
    -- upvalues: (copy) v_u_3
    local v11 = p10.leaderstats.Level.Value
    local v12 = p10.Stats.AdditionalPreset.Value
    for v13, v14 in pairs(v_u_3.ListLevelToMaxNumber) do
        if v11 < v14[1] then
            return v_u_3.ListLevelToMaxNumber[v13 - 1][2] + v12, v_u_3.ListLevelToMaxNumber[v13][1]
        end
    end
    return v_u_3.ListLevelToMaxNumber[#v_u_3.ListLevelToMaxNumber][2] + v12
end
return v_u_3

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.GetClonePrice
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.CloneUpgrades)
local v_u_2 = {
    "CloneAccuracy",
    "CloneHealth",
    "CloneWalkSpeed",
    "CloneRegen",
    "CloneRespawnTime",
    "CloneWeapon",
    "CloneHeadshot"
}
function GetClonePrice(p3)
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    local v4 = p3.Stats.CloneStats
    local v5 = 0
    for _, v6 in pairs(v_u_2) do
        local v7 = v4[v6]
        local v8 = string.sub(v6, 6, -1)
        for v9 = 0, v7.Value do
            v5 = v5 + v_u_1[v8][v9][2]
        end
    end
    return v5
end
return GetClonePrice

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.LoadGPDescription
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("MarketplaceService")
return function(p_u_2)
    -- upvalues: (copy) v_u_1
    local v_u_3 = nil
    local v_u_4 = nil
    for _ = 1, 5 do
        local v6, _ = pcall(function()
            -- upvalues: (ref) v_u_1, (copy) p_u_2, (ref) v_u_3, (ref) v_u_4
            local v5 = v_u_1:GetProductInfo(p_u_2, Enum.InfoType.GamePass)
            v_u_3 = v5.IconImageAssetId
            v_u_4 = v5.PriceInRobux
        end)
        if v6 and (v_u_4 and v_u_4 ~= 0) then
            break
        end
        task.wait(0.5)
    end
    return v_u_4, v_u_3
end

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.UnlockFloorActions
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("SocialService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("GroupService")
local v_u_4 = require(v_u_2.AllModules.GetEventNameFromEventFloorName)
local v5 = require(v_u_2.AllModules.UnlockFloorFunctions)
local v_u_6 = require(v_u_2.AllModules.ConvertVal)
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
local v16 = {
    ["Community_Floor"] = {
        ["UnlockDescription"] = "Join our community <font color=\"rgb(255, 255, 50)\">Shiny Cube Studios</font> (link in the description)",
        ["DescImage"] = "rbxassetid://17789689603",
        ["CanAccessFloor"] = v5.CommunityAccess,
        ["TimeRequired"] = true,
        ["ButtonFunction"] = function(_)
            -- upvalues: (copy) v_u_3
            local v14, v15 = pcall(v_u_3.PromptJoinAsync, v_u_3, 34430086)
            if not v14 then
                print(v15)
            end
        end,
        ["UnlockButtonTxt"] = " Join! "
    }
}
local v20 = {
    ["GetUnlockDescription"] = function(p17, _)
        -- upvalues: (copy) v_u_6
        return "Buy access for <font color=\"rgb(255, 255, 50)\">$" .. v_u_6.SimpleConversion(p17) .. "</font>"
    end,
    ["DescImage"] = "rbxassetid://17300756798",
    ["CanAccessFloor"] = v5.PaidAccess,
    ["GetClaimButtonTxt"] = function(p18, p19)
        -- upvalues: (copy) v_u_6
        return "Claim $" .. v_u_6.SimpleConversion(p18.leaderstats.Cash.Value) .. "/" .. v_u_6.SimpleConversion(p19)
    end
}
local v27 = {
    ["GetUnlockDescription"] = function(p21, _)
        -- upvalues: (copy) v_u_6
        return "Spend at least <font color=\"rgb(255, 255, 50)\">$" .. v_u_6.SimpleConversion(p21) .. "</font> on clone upgrades."
    end,
    ["CanAccessFloor"] = v5.CloneAccess,
    ["DescImage"] = "rbxassetid://7114263327",
    ["ImageAspectRatio"] = 0.7272,
    ["UnlockButtonTxt"] = "Upgrade clone",
    ["ButtonFunction"] = function(p22)
        -- upvalues: (ref) v_u_7, (ref) v_u_10
        if not v_u_7 then
            v_u_10 = p22.PlayerGui.MainGui
            v_u_7 = require(v_u_10.MainGuiScript.ToggleFrameModule)
        end
        v_u_7.ToggleFrame("CloneFrame", true)
    end,
    ["HideUnlockButtonF"] = function(p23)
        -- upvalues: (ref) v_u_9, (copy) v_u_2
        if not v_u_9 then
            v_u_9 = require(v_u_2.AllModules.GetTowerForPlayer)
        end
        local v24 = v_u_9(p23)
        return not (v24 and (v24:FindFirstChild("AllModels") and v24.AllModels:FindFirstChild("Clone")))
    end,
    ["GetClaimButtonTxt"] = function(p25, p26)
        -- upvalues: (ref) v_u_8, (copy) v_u_2, (copy) v_u_6
        if not v_u_8 then
            v_u_8 = require(v_u_2.AllModules.GetClonePrice)
        end
        return "Claim $" .. v_u_6.SimpleConversion(v_u_8(p25)) .. "/" .. v_u_6.SimpleConversion(p26)
    end
}
v16.Clone_Floor = v27
v16["Secondary clone_Floor"] = v27
v16.Millionaire_Floor = v20
v16.Billionaire_Floor = v20
v16.Gift_Floor = {
    ["UnlockDescription"] = "Kill 10 <font color=\"rgb(255, 50, 50)\">Santa zombies</font>",
    ["DescImage"] = "rbxassetid://115555288271083",
    ["CanAccessFloor"] = v5.GiftAccess,
    ["GetClaimButtonTxt"] = function(p28)
        local v29 = p28.Stats.Kills
        local v30 = v29["Red santa zombie"].Value + v29["Cyan santa zombie"].Value
        return "Claim" .. (v30 >= 10 and "" or " " .. v30 .. "/10")
    end
}
v16.Laser_Floor = {
    ["UnlockDescription"] = "Deal 500 damage with your laser door!",
    ["DescImage"] = "rbxassetid://128008271374569",
    ["CanAccessFloor"] = v5.LaserAccess,
    ["GetClaimButtonTxt"] = function(p31)
        local v32 = p31.Stats.LaserDoorDamage.Value
        return "Claim" .. (v32 >= 500 and "" or " " .. v32 .. "/500")
    end
}
v16.Spin_Floor = {
    ["ButtonFunction"] = function(p33)
        -- upvalues: (ref) v_u_7, (ref) v_u_10
        if not v_u_7 then
            v_u_10 = p33.PlayerGui.MainGui
            v_u_7 = require(v_u_10.MainGuiScript.ToggleFrameModule)
        end
        v_u_7.ToggleFrame("SpinFrame", true)
    end,
    ["UnlockButtonTxt"] = "Spin!",
    ["UnlockDescription"] = "Spin the wheel at least <font color=\"rgb(255, 255, 100)\">5 times</font>",
    ["DescImage"] = "rbxassetid://13696857957",
    ["CanAccessFloor"] = v5.SpinAccess,
    ["GetClaimButtonTxt"] = function(p34)
        local v35 = p34.Stats.DailySpinStats.TotalDailySpin.Value
        return "Claim" .. (v35 >= 5 and "" or " " .. v35 .. "/5")
    end
}
v16.Friend_Floor = {
    ["HideUnlockButtonF"] = function(_)
        -- upvalues: (ref) v_u_11, (copy) v_u_2
        if v_u_11 ~= nil then
            return not v_u_11
        end
        v_u_11 = require(v_u_2.AllModules.GetRestriction)("CanInvitePlayers")
        return not v_u_11
    end,
    ["ButtonFunction"] = function(p36)
        -- upvalues: (copy) v_u_1
        v_u_1:PromptGameInvite(p36)
    end,
    ["UnlockButtonTxt"] = "Invite friends",
    ["UnlockDescription"] = "Play with a <font color=\"rgb(100, 100, 255)\">friend</font>",
    ["DescImage"] = "rbxassetid://10885655986",
    ["CanAccessFloor"] = v5.FriendAccess,
    ["TimeRequired"] = true
}
v16.Quest_Floor = {
    ["UnlockDescription"] = "Complete <font color=\"rgb(255, 255, 50)\">3 daily quests</font>",
    ["DescImage"] = "rbxassetid://117825441170210",
    ["CanAccessFloor"] = v5.QuestAccess,
    ["ButtonFunction"] = function(p37)
        -- upvalues: (ref) v_u_7, (ref) v_u_10, (ref) v_u_13, (ref) v_u_12
        if not v_u_7 then
            v_u_10 = p37.PlayerGui.MainGui
            v_u_7 = require(v_u_10.MainGuiScript.ToggleFrameModule)
        end
        if not v_u_13 then
            local v38 = v_u_10.StatsFrame.FrameForPages
            v_u_12 = v38.UIPageLayout
            v_u_13 = v38.QuestFrame
        end
        v_u_7.ToggleFrame("StatsFrame", true)
        v_u_12:JumpTo(v_u_13)
    end,
    ["UnlockButtonTxt"] = "Show daily quests",
    ["GetClaimButtonTxt"] = function(p39)
        return "Claim " .. p39.Stats.DailyQuest.TotalDailyQuestCompleted.Value .. "/3"
    end
}
v16.Code_Floor = {
    ["ButtonFunction"] = function(p40)
        -- upvalues: (ref) v_u_7, (ref) v_u_10
        if not v_u_7 then
            v_u_10 = p40.PlayerGui.MainGui
            v_u_7 = require(v_u_10.MainGuiScript.ToggleFrameModule)
        end
        v_u_7.ToggleFrame("RedeemCode", true)
    end,
    ["UnlockDescription"] = "Redeem <font color=\"rgb(255, 255, 50)\">4 codes</font>. Find some in the game description.",
    ["UnlockButtonTxt"] = "Redeem code",
    ["CanAccessFloor"] = v5.CodeAccess,
    ["GetClaimButtonTxt"] = function(p41)
        return "Claim " .. p41.Stats.CodesUsed.Value .. "/4"
    end
}
v16.Crate_Floor = {
    ["UnlockDescription"] = "Find <font color=\"rgb(255, 255, 50)\">25 crates</font>.",
    ["CanAccessFloor"] = v5.CrateAccess,
    ["DescImage"] = "rbxassetid://10339105771",
    ["GetClaimButtonTxt"] = function(p42)
        return "Claim " .. p42.Stats.Crates:GetAttribute("Total") .. "/25"
    end
}
v16.Key_Floor = {
    ["UnlockDescription"] = "Find <font color=\"rgb(255, 255, 50)\">5 keys</font>.",
    ["CanAccessFloor"] = v5.KeyAccess,
    ["DescImage"] = "rbxassetid://14715875143",
    ["GetClaimButtonTxt"] = function(p43)
        return "Claim " .. p43.Stats.Keys:GetAttribute("Total") .. "/5"
    end
}
v16.Zombie_Floor = {
    ["UnlockDescription"] = "Kill <font color=\"rgb(255, 255, 50)\">10 zombies</font>.",
    ["CanAccessFloor"] = v5.ZombieAccess,
    ["DescImage"] = "rbxassetid://13951470742",
    ["GetClaimButtonTxt"] = function(p44)
        local v45 = 0
        for _, v46 in pairs(p44.Stats.Kills:GetChildren()) do
            v45 = v45 + v46.Value
        end
        return "Claim " .. v45 .. "/10"
    end
}
v16.HP_Floor = {
    ["UnlockDescription"] = "Upgrade the <font color=\"rgb(75, 255, 25)\"> medkit </font> at least <font color=\"rgb(255, 255, 0)\">10 times</font>.",
    ["CanAccessFloor"] = v5.HPAccess,
    ["DescImage"] = "rbxassetid://13888579862",
    ["GetClaimButtonTxt"] = function(p47)
        return "Claim " .. p47.Stats.MedkitLevel.Value .. "/10"
    end
}
v16.Event = {
    ["GetUnlockDescription"] = function(_, p48)
        -- upvalues: (copy) v_u_4
        return "Build the floor during the <font color=\"rgb(255, 255, 50)\">" .. v_u_4(p48):lower() .. " event</font>"
    end,
    ["CantBeClaimed"] = true
}
v16.Normal = {
    ["CantBeClaimed"] = true
}
return v16

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.A_Or_An
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    "a",
    "i",
    "e",
    "o",
    "u",
    "y"
}
return function(p2, p3, p4)
    -- upvalues: (copy) v_u_1
    local v5 = table.find(v_u_1, p2:sub(1, 1):lower()) and "An" or "A"
    local v6 = p3 and v5 and v5 or v5:lower()
    if p4 then
        return v6
    else
        return v6 .. " " .. p2
    end
end

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.TicketsDescription
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    ["Dropper"] = {
        ["Boost"] = 30,
        ["Duration"] = 900,
        ["MaxTickets"] = 5
    },
    ["Button"] = {
        ["Boost"] = 20,
        ["Duration"] = 720,
        ["MaxTickets"] = 3
    }
}
local v_u_2 = v_u_1.Button.Boost / 100
local v_u_3 = v_u_1.Dropper.Boost / 100
function v_u_1.Button.GetBonusValue(p4, p5)
    -- upvalues: (copy) v_u_2
    local v6 = #(p5 or p4.Stats.Tickets.ButtonTicketInUse).Value:split("_") - 1
    return 1 - math.max(0, v6) * v_u_2
end
function v_u_1.Dropper.GetBonusValue(p7, p8)
    -- upvalues: (copy) v_u_3
    local v9 = #(p8 or p7.Stats.Tickets.DropeprTicketInUse).Value:split("_") - 1
    return 1 + math.max(0, v9) * v_u_3
end
function v_u_1.Button.GetEffectString(p10)
    -- upvalues: (copy) v_u_1
    return "-" .. p10 * v_u_1.Button.Boost .. "%"
end
function v_u_1.Dropper.GetEffectString(p11)
    -- upvalues: (copy) v_u_1
    return "+" .. p11 * v_u_1.Dropper.Boost .. "%"
end
v_u_1.Dropper.TicketDescriptionText = v_u_1.Dropper.GetEffectString(1) .. " dropper income per ticket (" .. v_u_1.Dropper.Duration / 60 .. " min)"
v_u_1.Button.TicketDescriptionText = v_u_1.Button.GetEffectString(1) .. " build button cost per ticket (" .. v_u_1.Button.Duration / 60 .. " min)"
return v_u_1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.TycoonColors
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.Customization.AvialableMaterials)
local v_u_2 = {}
local v_u_3 = {
    "Color1Part",
    "Color2Part",
    "Color3Part",
    "Color4Part",
    "Color5Part",
    "Color6Part",
    "Color7Part",
    "Color8Part"
}
v_u_2.NumberOfColoredParts = #v_u_3
local v4 = Color3.fromRGB(163, 162, 165)
local v5 = Color3.fromRGB(175, 221, 255)
local v6 = Color3.fromRGB(17, 17, 17)
local v7 = Color3.fromRGB(202, 203, 209)
local v8 = Color3.new(1, 1, 1)
local v_u_9 = {
    ["RedZone"] = {
        Color3.fromRGB(255, 89, 89),
        Color3.fromRGB(91, 93, 105),
        v6,
        v5,
        v7,
        v4,
        v4,
        v8
    },
    ["BlackZone"] = {
        Color3.new(0.10588, 0.1647, 0.20784),
        Color3.new(0.972549, 0.972549, 0.972549),
        v6,
        v5,
        v7,
        v4,
        v4,
        v8
    },
    ["BlueZone"] = {
        Color3.new(0, 0, 1),
        Color3.new(0.1215, 0.50196, 0.1137),
        v6,
        v5,
        v7,
        v4,
        v4,
        v8
    },
    ["GreenZone"] = {
        Color3.new(0, 1, 0),
        Color3.new(0, 0, 1),
        v6,
        v5,
        v7,
        v4,
        v4,
        v8
    },
    ["OrangeZone"] = {
        Color3.new(1, 0.69019, 0),
        Color3.new(0.0666, 0.0666, 0.0666),
        v6,
        v5,
        v7,
        v4,
        v4,
        v8
    },
    ["YellowZone"] = {
        Color3.new(1, 1, 0),
        Color3.new(1, 0, 0),
        v6,
        v5,
        v7,
        v4,
        v4,
        v8
    }
}
local v_u_10 = {
    "Metal",
    "Brick",
    "Plastic",
    "Glass",
    "WoodPlanks",
    "Fabric",
    "DiamondPlate"
}
local v_u_11 = {}
function v_u_2.SetAppearanceToApplyToTycoon(p12)
    -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_10, (copy) v_u_9, (copy) v_u_11
    local v13 = p12.Name
    v_u_2.RemoveColorToApplyToTycoon(v13)
    local v14 = p12.Owner.Value
    if v14 then
        v14 = p12.Owner.Value.Stats.Custom
    end
    local v15, v16
    if v14 and v14.CustomColorsEnabled.Value then
        v15 = {}
        v16 = {}
        for v17 = 1, v_u_2.NumberOfColoredParts do
            local v18 = v14["Color" .. v17 .. "Part"]
            local v19 = v18.Value
            table.insert(v15, v19)
            local v20
            if v17 == 8 then
                v20 = false
            else
                v20 = v18["Material" .. v17 .. "Part"]
            end
            if v20 and v_u_1[v20.Value] then
                local v21 = v20.Value
                table.insert(v16, v21)
            else
                local v22 = v_u_10[v17]
                table.insert(v16, v22)
            end
        end
    else
        v15 = table.clone(v_u_9[v13])
        v16 = table.clone(v_u_10)
    end
    local v23 = {
        ["Colors"] = v15,
        ["Materials"] = v16
    }
    v_u_11[v13] = v23
    return v23
end
function SetPartAppearance(p24, p25, p26)
    -- upvalues: (copy) v_u_3
    local v27 = p26 or table.find(v_u_3, p24.Name)
    if v27 then
        p24.Color = p25.Colors[v27]
        if v27 ~= 8 then
            p24.Material = p25.Materials[v27]
        end
    end
end
function v_u_2.ColorModel(p28, p29, p30, p31)
    -- upvalues: (copy) v_u_11, (copy) v_u_2
    local v32 = p30 or (v_u_11[p29.Name] or v_u_2.SetAppearanceToApplyToTycoon(p29))
    for _, v33 in pairs(p28:GetDescendants()) do
        SetPartAppearance(v33, v32)
    end
    SetPartAppearance(p28, v32)
    if p31 then
        SetPartAppearance(p29.BasePart, v32, 5)
    end
end
function v_u_2.RemoveColorToApplyToTycoon(p34)
    -- upvalues: (copy) v_u_11
    local v35 = v_u_11[p34]
    if v35 then
        table.clear(v35.Colors)
        table.clear(v35.Materials)
        table.clear(v35)
        v_u_11[p34] = nil
    end
end
function v_u_2.GetAppliedAppearance(p36)
    -- upvalues: (copy) v_u_11, (copy) v_u_2
    return v_u_11[p36.Name] or v_u_2.SetAppearanceToApplyToTycoon(p36)
end
v_u_2.DefaultMaterial = v_u_10
v_u_2.TycoonColors = v_u_9
return v_u_2

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.CheckPosition
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_21 = {
    ["CheckIfIn"] = function(p1, p2, p3, p4, p5)
        local v6 = p4 or 0
        local v7 = p2.Position
        if p3 and p5 then
            v7 = v7 - Vector3.new(0, 1, 0) * p3 / 2
        end
        local v8 = p1 - v7
        local v9 = CFrame.Angles
        local v10 = p2.Orientation.Y
        local v11 = v9(0, -math.rad(v10), 0) * v8
        local v12 = p2.Size / 2 + v6 * Vector3.new(1, 1, 1)
        local v13 = v11.X
        if math.abs(v13) <= v12.X then
            local v14 = v11.Z
            if math.abs(v14) <= v12.Z and (not p3 or p3 and (v11.Y > 0 and v11.Y < p3)) then
                return true
            end
        end
        return false
    end,
    ["IsPlayerInContainer"] = function(p15, p16, p17)
        -- upvalues: (copy) v_u_21
        local v18 = p15.Character
        if not (v18 and v18.PrimaryPart) then
            return false
        end
        local v19 = p16.GndPart
        local v20 = (p16:FindFirstChild("ContourPart") or p16:FindFirstChild("Wall-1")).Size.Y
        return v_u_21.CheckIfIn(v18:GetPivot().Position, v19, v20, p17 or 0.5, false)
    end
}
return v_u_21

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.GetBadgeImageId
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("BadgeService")
local v_u_2 = {}
function GetImageForId(p_u_3, p4)
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    if v_u_2[p_u_3] then
        return v_u_2[p_u_3]
    end
    local v_u_5 = nil
    local v6 = p4 or 5
    local v7 = 0
    while true do
        local v8, v9 = pcall(function()
            -- upvalues: (ref) v_u_5, (ref) v_u_1, (copy) p_u_3
            v_u_5 = v_u_1:GetBadgeInfoAsync(p_u_3).IconImageId
        end)
        local v10 = v8 and v_u_5
        if v10 then
            v10 = v_u_5 ~= ""
        end
        if not v10 then
            v7 = v7 + 1
            task.wait(2)
            print(v9)
        end
        if v10 or v6 < v7 then
            if not v_u_5 or v_u_5 == "" then
                warn("To many fails when retrieving image id for BadgeId", p_u_3, "ImageId obtained:", v_u_5)
                return ""
            end
            v_u_5 = "rbxassetid://" .. v_u_5
            v_u_2[p_u_3] = v_u_5
            return v_u_5
        end
    end
end
return GetImageForId

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.FloorLevelComputation
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = workspace:GetAttribute("Tycoon_Y0_Position")
return {
    ["Ref_Y_Pos"] = v_u_1,
    ["GetFloorLevelFromYPosition"] = function(p2)
        -- upvalues: (copy) v_u_1
        return (p2 - v_u_1) // 11
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.GetPotionValueFromLevel
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1, p2)
    local v3 = nil
    local v4 = nil
    if p1 == "Spee" then
        local v5 = 75 - 2 * (p2 - 1)
        v3 = math.max(v5, 28)
        v4 = 125 + 8 * (p2 - 1)
    elseif p1 == "Size" then
        if tonumber(p2) <= 276 then
            v4 = 125 + 5 * (p2 - 1)
        else
            v4 = 1500 + 2.5 * (p2 - 276)
        end
        local v6 = 75 - 2 * (p2 - 1)
        v3 = math.max(v6, 35)
    elseif p1 == "Jump" then
        v4 = 140 + 10 * (p2 - 1)
        local v7 = 80 - 2 * (p2 - 1)
        v3 = math.max(v7, 35)
    elseif p1 == "Heal" then
        v3 = 150 + 30 * (p2 - 1)
        v4 = v3
    end
    return NumberRange.new(v3, v4)
end

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.LaserDoorSystemDescription
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_7 = {
    ["BaseNumberOfLaserDoors"] = 5,
    ["LevelLocked"] = {
        100,
        200,
        400,
        1000,
        2000,
        4000
    },
    ["GetMaxNumberOfLaserDoorsAtPlrLevel"] = function(p1)
        -- upvalues: (copy) v_u_7
        local v2 = v_u_7.BaseNumberOfLaserDoors
        for v3 = 1, #v_u_7.LevelLocked do
            if v_u_7.LevelLocked[v3] > p1 then
                break
            end
            v2 = v2 + 1
        end
        return v2
    end,
    ["GetNumberOfLaserDoors"] = function(p4)
        return #p4:split("_")
    end,
    ["GetLevelRequiredForNextDoor"] = function(p5)
        -- upvalues: (copy) v_u_7
        for _, v6 in pairs(v_u_7.LevelLocked) do
            if p5 < v6 then
                return v6
            end
        end
    end
}
return v_u_7

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.GetWorkingPlayerFromModel
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Players")
function GetWorkingForPlayer_OfModel(p2)
    -- upvalues: (copy) v_u_1
    if p2 then
        p2 = p2:GetAttribute("WorkingForPlrId")
    end
    if p2 then
        p2 = v_u_1:GetPlayerByUserId(p2)
    end
    return p2
end
return GetWorkingForPlayer_OfModel

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ConvertVal
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    "K",
    "M",
    "B",
    "T",
    "QD"
}
local v_u_54 = {
    ["SimpleConversion"] = function(p2)
        -- upvalues: (copy) v_u_1
        local v3
        if p2 < 0 then
            p2 = -p2
            v3 = "-"
        else
            v3 = ""
        end
        local v4 = 0
        while p2 / 10 ^ (v4 + 3) >= 1 do
            v4 = v4 + 3
        end
        local v5 = p2 / 10 ^ v4
        local v6 = math.floor(v5)
        local v7 = tostring(v6)
        local v8 = string.len(v7)
        local v9 = p2 / 10 ^ (v4 - (3 - v8))
        local v10 = math.floor(v9) / 10 ^ (3 - v8)
        local v11 = tostring(v10)
        if v4 == 0 then
            return v3 .. v11
        else
            return v3 .. v11 .. v_u_1[v4 / 3]
        end
    end,
    ["ConvertToReadableNumbers"] = function(p12)
        local v13
        if p12 < 0 then
            p12 = -p12
            v13 = "-"
        else
            v13 = ""
        end
        local v14 = math.floor(p12)
        local v15 = tostring(v14)
        local v16 = string.len(v15) - 1
        local v17 = v16 % 3
        local v18 = (v16 - v17) / 3
        local v19 = v17 + 1
        local v20 = string.sub(v15, 1, v19)
        local v21 = 0
        while v21 < v18 do
            local v22 = v17 + 2 + v21 * 3
            local v23 = v22 + 2
            v20 = v20 .. "," .. string.sub(v15, v22, v23)
            v21 = v21 + 1
        end
        return v13 .. v20
    end,
    ["PreciseRound"] = function(p24, p25)
        local v26 = p24 * 10 ^ p25
        local v27 = math.floor(v26)
        local v28 = tostring(v27)
        local v29 = ""
        if string.len(v28) - p25 <= 0 then
            v29 = "0"
        else
            for v30 = 1, string.len(v28) - p25 do
                v29 = v29 .. string.sub(v28, v30, v30)
            end
        end
        local v31 = v29 .. "."
        for v32 = string.len(v28) - p25 + 1, string.len(v28) do
            v31 = v31 .. string.sub(v28, v32, v32)
        end
        return v31
    end,
    ["FullConvertInDay"] = function(p33)
        local v34, v35, v36 = CompleteStr("", p33, 31536000, "y")
        _ = v36
        local v37 = v35 / 86400
        local v38 = math.floor(v37)
        local v39
        if v38 == 0 then
            if v34 == "" then
                v39 = "0d"
            else
                v39 = v34 .. "000d"
            end
        else
            if v34 ~= "" then
                if v38 < 100 then
                    v34 = v34 .. "0"
                elseif v38 < 10 then
                    v34 = v34 .. "00"
                end
            end
            v39 = v34 .. v38 .. "d"
            v35 = v35 - v38 * 86400
        end
        local v40 = v35 / 3600
        local v41 = math.floor(v40)
        local v42
        if v41 == 0 then
            v42 = v39 .. "00h"
        else
            if v41 < 10 then
                v41 = "0" .. v41
            end
            v42 = v39 .. v41 .. "h"
            v35 = v35 - v41 * 3600
        end
        local v43 = v35 / 60
        local v44 = math.floor(v43)
        local v45
        if v44 == 0 then
            v45 = v42 .. "00m"
        else
            if v44 < 10 then
                v44 = "0" .. v44
            end
            v45 = v42 .. v44 .. "m"
            v35 = v35 - v44 * 60
        end
        if v35 < 10 then
            v35 = "0" .. v35
        end
        return v45 .. v35 .. "s"
    end,
    ["ConvertInHour"] = function(p46)
        local v47 = ""
        local v48 = p46 / 3600
        local v49 = math.floor(v48)
        if v49 > 0 then
            v47 = v47 .. v49 .. "h"
            p46 = p46 - v49 * 3600
        end
        local v50 = p46 / 60
        local v51 = math.floor(v50)
        local v52
        if v51 == 0 then
            v52 = v47 .. "00m"
        else
            if v51 < 10 and v49 > 0 then
                v51 = "0" .. v51
            end
            v52 = v47 .. v51 .. "m"
            p46 = p46 - v51 * 60
        end
        if p46 < 10 then
            p46 = "0" .. p46
        end
        return v52 .. p46 .. "s"
    end,
    ["RoundedTimeConversion"] = function(p53)
        -- upvalues: (copy) v_u_54
        if p53 / 86400 >= 1 then
            return v_u_54.PreciseRound(p53 / 86400, 1) .. "d"
        elseif p53 / 3600 >= 1 then
            return v_u_54.PreciseRound(p53 / 3600, 1) .. "h"
        elseif p53 / 60 >= 1 then
            return v_u_54.PreciseRound(p53 / 60, 1) .. "m"
        else
            return p53 .. "s"
        end
    end
}
function CompleteStr(p55, p56, p57, p58)
    local v59 = false
    if p56 / p57 < 0 then
        return p55, p56, v59
    end
    local v60 = p56 / p57
    local v61 = math.floor(v60)
    local v62 = true
    if p55 == "" then
        if v61 > 0 then
            p55 = p55 .. v61 .. p58
            p56 = p56 - v61 * p57
        else
            v62 = false
        end
    else
        if v61 < 10 then
            p55 = p55 .. "0" .. v61 .. p58
        else
            p55 = p55 .. v61 .. p58
        end
        p56 = p56 - v61 * p57
    end
    return p55, p56, v62
end
function v_u_54.ConvertTimeInPart(p63, p64)
    local v65, v66, v67 = CompleteStr("", p63, 31536000, "y")
    if v67 then
        p64 = p64 - 1
        if p64 == 0 then
            return v65
        end
    end
    local v68, v69, v70 = CompleteStr(v65, v66, 86400, "d")
    if v70 then
        p64 = p64 - 1
        if p64 == 0 then
            return v68
        end
    end
    local v71, v72, v73 = CompleteStr(v68, v69, 3600, "h")
    if v73 then
        p64 = p64 - 1
        if p64 == 0 then
            return v71
        end
    end
    local v74, v75, v76 = CompleteStr(v71, v72, 60, "m")
    if v76 and p64 - 1 == 0 then
        return v74
    elseif v75 < 10 then
        if v74 == "" then
            return v75 .. "s"
        else
            return v74 .. "0" .. v75 .. "s"
        end
    else
        return v74 .. v75 .. "s"
    end
end
function v_u_54.GetTimeBeforeNextDay()
    local v77 = DateTime.now():ToUniversalTime()
    local v78 = 23 - v77.Hour
    local v79 = 59 - v77.Minute
    local v80 = tostring(v79)
    if string.len(v80) < 2 then
        v80 = "0" .. v80
    end
    local v81 = 59 - v77.Second
    local v82 = tostring(v81)
    if string.len(v82) < 2 then
        v82 = "0" .. v82
    end
    return v78 .. ":" .. v80 .. ":" .. v82
end
function v_u_54.RoundValueWithNonZeroDigit(p83, p84)
    local v85 = math.log10(p83)
    local v86 = math.floor(v85) - (p84 - 1)
    local v87 = p83 / 10 ^ v86
    return math.round(v87) * 10 ^ v86
end
function v_u_54.NotShowAfterPoint(p88, p89)
    local v90 = tostring(p88)
    local v91 = v90:find(".", nil, true)
    if v91 then
        v90 = v90:sub(1, v91 + p89)
        local v92 = v90:len()
        while v91 <= v92 do
            local v93 = v90:sub(v92, v92)
            if v93 ~= "0" and v93 ~= "." then
                break
            end
            v90 = v90:sub(1, v92 - 1)
            v92 = v92 - 1
        end
    end
    return v90
end
return v_u_54

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.BuyCash.BuyCashModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.UsefullFunction).GetEffectiveRewLevel
local v_u_2 = {}
listeMulipl = {
    1,
    3,
    6,
    15,
    32,
    65,
    140
}
v_u_2.SlotName = {
    "VerySmall",
    "Small",
    "Medium",
    "Large",
    "Huge",
    "Popular",
    "BestDeal"
}
listeBases = {
    [0] = 10000,
    [1] = 20000,
    [2] = 40000,
    [3] = 80000,
    [4] = 120000,
    [5] = 200000,
    [6] = 400000,
    [25] = 1000000,
    [50] = 2000000,
    [100] = 4500000,
    [200] = 10000000,
    [400] = 40000000,
    [1000] = 200000000,
    [2000] = 600000000
}
v_u_2.CashAtLevel = {}
for v3, v4 in listeBases do
    listeAtLevel = {}
    for v5 = 1, #listeMulipl do
        local v6 = v_u_2.SlotName[v5]
        listeAtLevel[v6] = v4 * listeMulipl[v5]
    end
    v_u_2.CashAtLevel[v3] = listeAtLevel
end
function v_u_2.GetCashFor(p7, p8)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v9 = v_u_1(p7)
    return v_u_2.CashAtLevel[v9][p8]
end
return v_u_2

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.BuyCash.RewardedAdModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(script.Parent.BuyCashModule)
local v_u_7 = {
    ["GetAdRewardForLevel"] = function(p2)
        -- upvalues: (copy) v_u_1
        return v_u_1.GetCashFor(p2, "VerySmall") * 0.4
    end,
    ["CanWatchAd"] = function(p3)
        -- upvalues: (copy) v_u_7
        return v_u_7.GetTimeBeforeCanWatchNextAd(p3) <= 0
    end,
    ["GetTimeBeforeCanWatchNextAd"] = function(p4)
        return 240 - (DateTime.now().UnixTimestamp - p4.Stats.Ads.TimeAdWatched_1.Value)
    end,
    ["SetStatsAfterAdWatched"] = function(p5)
        local v6 = p5.Stats.Ads.TotalAdWatched
        v6.Value = v6.Value + 1
        p5.Stats.Ads.TimeAdWatched_1.Value = p5.Stats.Ads.TimeAdWatched_2.Value
        p5.Stats.Ads.TimeAdWatched_2.Value = DateTime.now().UnixTimestamp
    end
}
return v_u_7

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Events.HalloweenRewards
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["Normal"] = {
        "respin",
        "halloween key",
        "stone key",
        "bomb",
        "halloween key",
        "bomb",
        "silver key",
        "halloween key",
        "bomb",
        "golden key",
        "halloween key",
        "bomb",
        "wooden key",
        "halloween key",
        "wooden key",
        "silver key",
        "halloween key",
        "stone key",
        "wooden key",
        "halloween key"
    },
    ["Legendary"] = {
        "infinity key",
        "absolute infinity key",
        "golden key",
        "respin",
        "diamond key",
        "halloween key",
        "DropperTicket",
        "golden key",
        "diamond key",
        "respin",
        "golden key",
        "diamond key",
        "DropperTicket",
        "halloween key",
        "golden key",
        "respin",
        "diamond key",
        "golden key",
        "bomb",
        "infinity key",
        "halloween key",
        "golden key",
        "diamond key",
        "respin",
        "DropperTicket",
        "golden key",
        "halloween key",
        "bomb",
        "diamond key",
        "respin",
        "golden key",
        "diamond key",
        "halloween key",
        "bomb",
        "respin",
        "DropperTicket",
        "golden key",
        "diamond key",
        "halloween key",
        "golden key"
    },
    ["NormalPrice"] = 5,
    ["LegendaryPrice"] = 25
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Events.EasterRewards
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = require(script.Parent.EggProbabilities)
local v2 = {}
local v3 = {
    ["EggsRequired"] = {
        ["GreenEgg"] = 4,
        ["BlueEgg"] = 3,
        ["PurpleEgg"] = 2,
        ["YellowEgg"] = 1
    },
    ["RewardName"] = "green easter key",
    ["Amount"] = 5
}
v2.Reward8 = v3
local v4 = {
    ["EggsRequired"] = {
        ["BlueEgg"] = 4,
        ["PurpleEgg"] = 4,
        ["YellowEgg"] = 3,
        ["OrangeEgg"] = 2,
        ["RedEgg"] = 2
    },
    ["RewardName"] = "respin",
    ["Amount"] = 1
}
v2.Reward7 = v4
for v5 = 1, 6 do
    local v6 = v1.OrderedEggColors[v5]
    local v7 = "Reward" .. v5
    local v8 = {
        ["EggsRequired"] = {
            [v6] = 3
        },
        ["RewardName"] = "VerySmall",
        ["IsCash"] = true,
        ["Amount"] = v1.EggProbability.Green / v1.EggProbability[v6:sub(1, -4)] * 0.25
    }
    v2[v7] = v8
end
return v2

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Events.EggProbabilities
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    ["OrderedEggColors"] = {
        "GreenEgg",
        "BlueEgg",
        "PurpleEgg",
        "YellowEgg",
        "OrangeEgg",
        "RedEgg"
    }
}
local v_u_2 = {
    ["Green"] = 0.3,
    ["Blue"] = 0.22,
    ["Purple"] = 0.19,
    ["Yellow"] = 0.14,
    ["Orange"] = 0.1,
    ["Red"] = 0.05
}
v_u_1.EggProbability = v_u_2
function v_u_1.GetARandomColor()
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    local v3 = math.random()
    local v4 = 0
    for v5, v6 in pairs(v_u_2) do
        v4 = v4 + v6
        if v3 <= v4 then
            return v5
        end
    end
    local v7 = warn("No egg foud")
    if v7 then
        v7 = v_u_1.OrderedEggColors[1]:sub(1, -4)
    end
    return v7
end
return v_u_1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Events.EggCannonUnlock
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["Green"] = 0,
    ["Blue"] = 5,
    ["Purple"] = 15,
    ["Yellow"] = 25,
    ["Orange"] = 30,
    ["Red"] = 40
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Events.ChristmasGetARandomKeyStats
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v2 = {
    ["KeyProbs"] = {
        {
            ["KeyName"] = "wooden key",
            ["Prob"] = 45
        },
        {
            ["KeyName"] = "red christmas key",
            ["Prob"] = 35
        },
        {
            ["KeyName"] = "cyan christmas key",
            ["Prob"] = 15
        },
        {
            ["KeyName"] = "infinity key",
            ["Prob"] = 5
        }
    },
    ["Price"] = 18
}
v1[1] = v2
v1.AnimationTime = 6
return v1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Events.Client_EventTracker
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    ["AllEvents"] = {}
}
local v_u_2 = {}
for v_u_3, v4 in pairs(workspace:GetAttributes()) do
    if v_u_3:sub(-5, -1) == "Event" then
        v_u_1.AllEvents[v_u_3] = v4
        workspace:GetAttributeChangedSignal(v_u_3):Connect(function()
            -- upvalues: (copy) v_u_3
            OnEventChanged(v_u_3, workspace:GetAttribute(v_u_3))
        end)
    end
end
function OnEventChanged(p5, p6)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    v_u_1.AllEvents[p5] = p6
    for _, v7 in pairs(v_u_2) do
        task.spawn(v7, p5, p6)
    end
end
function v_u_1.ConnectToEventChanged(p8, p9, p10)
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    if v_u_2[p9] then
        warn("Label", p9, "is already used")
    end
    v_u_2[p9] = p8
    if not p10 then
        for v11, v12 in pairs(v_u_1.AllEvents) do
            p8(v11, v12, true)
        end
    end
end
return v_u_1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Events.EventDescription
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v2 = {
    ["Color"] = Color3.fromRGB(229, 84, 0),
    ["Start"] = {
        ["day"] = 15,
        ["month"] = 10
    },
    ["End"] = {
        ["day"] = 3,
        ["month"] = 11
    }
}
v1.HalloweenEvent = v2
local v3 = {
    ["Color"] = Color3.fromRGB(229, 0, 0),
    ["Start"] = {
        ["day"] = 1,
        ["month"] = 12
    },
    ["End"] = {
        ["day"] = 27,
        ["month"] = 12
    }
}
v1.ChristmasEvent = v3
local v4 = {
    ["Color"] = Color3.fromRGB(185, 125, 175),
    ["EventId"] = "6104799925193409176",
    ["DisplayName"] = "Valentine\'s event",
    ["Start"] = {
        ["day"] = 5,
        ["month"] = 2
    },
    ["End"] = {
        ["day"] = 16,
        ["month"] = 2
    }
}
v1.ValentineEvent = v4
local v5 = {
    ["Color"] = Color3.fromRGB(53, 200, 45),
    ["Start"] = {
        ["day"] = 3,
        ["month"] = 4
    },
    ["End"] = {
        ["day"] = 23,
        ["month"] = 4
    }
}
v1.EasterEvent = v5
local v6 = {
    ["Color"] = Color3.fromRGB(53, 200, 45),
    ["Start"] = {
        ["day"] = 1,
        ["month"] = 7
    },
    ["End"] = {
        ["day"] = 11,
        ["month"] = 7
    }
}
v1["4thOfJulyEvent"] = v6
local v7 = {
    ["Color"] = Color3.fromRGB(155, 82, 46),
    ["Start"] = {
        ["day"] = 15,
        ["month"] = 11
    },
    ["End"] = {
        ["day"] = 30,
        ["month"] = 11
    }
}
v1.ThanksgivingEvent = v7
local v8 = {
    ["Color"] = Color3.fromRGB(0, 175, 0),
    ["EventId"] = "8523451721227960975",
    ["IsSeason"] = true,
    ["Start"] = {
        ["day"] = 1,
        ["month"] = 3
    },
    ["End"] = {
        ["day"] = 20,
        ["month"] = 6
    }
}
v1.SpringEvent = v8
local v9 = {
    ["Color"] = Color3.fromRGB(239, 199, 39),
    ["IsSeason"] = true,
    ["NoTrack"] = true,
    ["Start"] = {
        ["day"] = 20,
        ["month"] = 6
    },
    ["End"] = {
        ["day"] = 20,
        ["month"] = 9
    }
}
v1.SummerEvent = v9
local v10 = {
    ["Color"] = Color3.fromRGB(208, 139, 54),
    ["IsSeason"] = true,
    ["Start"] = {
        ["day"] = 20,
        ["month"] = 9
    },
    ["End"] = {
        ["day"] = 1,
        ["month"] = 12
    }
}
v1.FallEvent = v10
local v11 = {
    ["Color"] = Color3.fromRGB(198, 198, 198),
    ["IsSeason"] = true,
    ["Start"] = {
        ["day"] = 27,
        ["month"] = 12
    },
    ["End"] = {
        ["day"] = 1,
        ["month"] = 3
    }
}
v1.WinterEvent = v11
return v1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Events.Seasons.ChristmasSeasonDescription
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
local v2 = {
    {
        {
            ["ItemName"] = "wooden key",
            ["Amount"] = 3,
            ["Price"] = 10
        },
        {
            ["ItemName"] = "coin_VerySmall",
            ["Amount"] = 1,
            ["Price"] = 5
        },
        {
            ["ItemName"] = "red christmas key",
            ["Amount"] = 1,
            ["Price"] = 4
        },
        {
            ["ItemName"] = "respin",
            ["Amount"] = 1,
            ["Price"] = 15
        },
        {
            ["ItemName"] = "red christmas key",
            ["Amount"] = 2,
            ["Price"] = 7
        }
    },
    {
        {
            ["ItemName"] = "stone key",
            ["Amount"] = 3,
            ["Price"] = 20
        },
        {
            ["ItemName"] = "coin_VerySmall",
            ["Amount"] = 2,
            ["Price"] = 10
        },
        {
            ["ItemName"] = "red christmas key",
            ["Amount"] = 2,
            ["Price"] = 8
        },
        {
            ["ItemName"] = "wooden key",
            ["Amount"] = 5,
            ["Price"] = 10
        },
        {
            ["ItemName"] = "coin_Small",
            ["Amount"] = 3,
            ["Price"] = 20
        },
        {
            ["ItemName"] = "DropperTicket",
            ["Amount"] = 1,
            ["Price"] = 40
        }
    },
    {
        {
            ["ItemName"] = "silver key",
            ["Amount"] = 3,
            ["Price"] = 36
        },
        {
            ["ItemName"] = "respin",
            ["Amount"] = 2,
            ["Price"] = 30
        },
        {
            ["ItemName"] = "wooden key",
            ["Amount"] = 6,
            ["Price"] = 12
        },
        {
            ["ItemName"] = "coin_Medium",
            ["Amount"] = 1,
            ["Price"] = 18
        },
        {
            ["ItemName"] = "red christmas key",
            ["Amount"] = 5,
            ["Price"] = 20
        },
        {
            ["ItemName"] = "cyan christmas key",
            ["Amount"] = 1,
            ["Price"] = 20
        }
    },
    {
        {
            ["ItemName"] = "golden key",
            ["Amount"] = 3,
            ["Price"] = 60
        },
        {
            ["ItemName"] = "DropperTicket",
            ["Amount"] = 2,
            ["Price"] = 80
        },
        {
            ["ItemName"] = "coin_Large",
            ["Amount"] = 1,
            ["Price"] = 35
        },
        {
            ["ItemName"] = "red christmas key",
            ["Amount"] = 6,
            ["Price"] = 24
        },
        {
            ["ItemName"] = "cyan christmas key",
            ["Amount"] = 2,
            ["Price"] = 35
        }
    },
    {
        {
            ["ItemName"] = "diamond key",
            ["Amount"] = 3,
            ["Price"] = 100
        },
        {
            ["ItemName"] = "infinity key",
            ["Amount"] = 1,
            ["Price"] = 60
        },
        {
            ["ItemName"] = "ButtonTicket",
            ["Amount"] = 1,
            ["Price"] = 150
        },
        {
            ["ItemName"] = "coin_Huge",
            ["Amount"] = 1,
            ["Price"] = 50
        },
        {
            ["ItemName"] = "red christmas key",
            ["Amount"] = 8,
            ["Price"] = 30
        },
        {
            ["ItemName"] = "cyan christmas key",
            ["Amount"] = 3,
            ["Price"] = 45
        }
    },
    {
        {
            ["ItemName"] = "absolute infinity key",
            ["Amount"] = 2,
            ["Price"] = 150
        },
        {
            ["ItemName"] = "terminusfinity key",
            ["Amount"] = 2,
            ["Price"] = 275
        },
        {
            ["ItemName"] = "ButtonTicket",
            ["Amount"] = 2,
            ["Price"] = 290
        },
        {
            ["ItemName"] = "DropperTicket",
            ["Amount"] = 5,
            ["Price"] = 200
        },
        {
            ["ItemName"] = "coin_Popular",
            ["Amount"] = 1,
            ["Price"] = 75
        },
        {
            ["ItemName"] = "red christmas key",
            ["Amount"] = 15,
            ["Price"] = 50
        },
        {
            ["ItemName"] = "cyan christmas key",
            ["Amount"] = 10,
            ["Price"] = 100
        }
    }
}
local v3 = {
    [2] = {
        {
            ["Type"] = "Kill",
            ["Amount"] = 3,
            ["ValueName"] = "Red santa zombie"
        }
    },
    [3] = {
        {
            ["Type"] = "Kill",
            ["Amount"] = 7,
            ["ValueName"] = "Red santa zombie"
        }
    },
    [4] = {
        {
            ["Type"] = "Kill",
            ["Amount"] = 14,
            ["ValueName"] = "Red santa zombie"
        },
        {
            ["Type"] = "Kill",
            ["Amount"] = 3,
            ["ValueName"] = "Cyan santa zombie"
        }
    },
    [5] = {
        {
            ["Type"] = "Kill",
            ["Amount"] = 20,
            ["ValueName"] = "Red santa zombie"
        },
        {
            ["Type"] = "Kill",
            ["Amount"] = 8,
            ["ValueName"] = "Cyan santa zombie"
        }
    },
    [6] = {
        {
            ["Type"] = "Kill",
            ["Amount"] = 25,
            ["ValueName"] = "Red santa zombie"
        },
        {
            ["Type"] = "Kill",
            ["Amount"] = 15,
            ["ValueName"] = "Cyan santa zombie"
        }
    }
}
LevelRequirements = v3
v_u_1.LevelRequirements = LevelRequirements
v_u_1.NumberOfLevels = #v2
v_u_1.SeasonRewards = v2
v_u_1.SeasonBadgeId = 3615546469561664
function v_u_1.GetLastCompletedLevel(p4)
    -- upvalues: (copy) v_u_1
    for v5, v6 in pairs(p4:split("_")) do
        if v6:find("a") then
            return v5 - 1
        end
    end
    return v_u_1.NumberOfLevels
end
function v_u_1.CanAccessLevelWithRequirements(p7, p8)
    local v9 = LevelRequirements[p7]
    if not v9 then
        return true
    end
    for _, v10 in pairs(v9) do
        if v10.Amount > p8[v10.ValueName].Value then
            return false
        end
    end
    return true
end
v_u_1.CurrencyType = "ChristmasBells"
return v_u_1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.FiringWeaponModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = v2.AllModules
local v_u_4 = workspace.Camera
local v_u_5 = game.Players.LocalPlayer
local v_u_6 = v_u_5:GetMouse()
local v_u_7 = v_u_5.PlayerGui:WaitForChild("MainGui")
local v_u_8 = v_u_7:WaitForChild("GunFrame")
local v_u_9 = v_u_8:WaitForChild("GunName")
local v_u_10 = v_u_8:WaitForChild("State")
local v_u_11 = v_u_8:WaitForChild("FrameForButtons"):WaitForChild("FireBttn")
local v_u_12 = v_u_11.ActionIcon
local v13 = v2.RemoteEvent.WeaponEvent
local v_u_14 = v13.FireMovingPart
local v_u_15 = v13.NormalFire
local v_u_16 = require(v3.ToolModules.ToggleAimModule)
local v_u_17 = require(v3.InputManager)
local v_u_18 = require(v3.ToolButtons)
local v_u_19 = require(v3.WeaponStats)
local v_u_20 = {}
local v_u_21 = {}
for _, v22 in pairs(script:GetChildren()) do
    v_u_20[v22.Name] = v22
end
local v_u_23 = nil
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = 0
local v_u_31 = nil
local v_u_32 = nil
local v_u_33 = nil
local v_u_34 = nil
local v_u_35 = nil
local v_u_36 = nil
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = nil
local v_u_40 = nil
local v_u_41 = RaycastParams.new()
local v42 = {}
function Reload()
    -- upvalues: (ref) v_u_39, (ref) v_u_40, (copy) v_u_10, (ref) v_u_26, (ref) v_u_32, (ref) v_u_36, (copy) v_u_19
    local v43 = v_u_39
    if not v_u_39:GetAttribute("Reloading") and v_u_39:GetAttribute("CurrentAmmo") ~= v_u_40 then
        v_u_39:SetAttribute("Reloading", true)
        v_u_10.Text = "Reloading"
        local v44 = v43.Handle:FindFirstChild("ReloadSnd")
        if v44 then
            v44:Play()
        end
        if v_u_26 then
            v_u_26:Play(nil, nil, v_u_32 / v_u_36)
        end
        task.wait(v_u_36)
        if v44 and v44.Looped then
            v44:Stop()
        end
        v43:SetAttribute("CurrentAmmo", v_u_19[v43.Name].MaxAmmo)
        v43:SetAttribute("Reloading", false)
        if v43 == v_u_39 then
            v_u_10.Text = v_u_39:GetAttribute("CurrentAmmo") .. " / " .. v_u_40
        end
    end
end
function FireMovingPart()
    -- upvalues: (ref) v_u_39, (copy) v_u_14, (ref) v_u_31, (ref) v_u_28, (ref) v_u_33, (copy) v_u_10, (ref) v_u_34
    if not v_u_39 then
        return false
    end
    local v45 = v_u_39:FindFirstChild("Handle")
    if not v45 then
        return false
    end
    local v46 = GetFirePosition()
    if not v46 then
        return false
    end
    local v47 = v_u_39
    local v48 = v45:FindFirstChild("ForFireAtt")
    v_u_14:Fire(v48 and v48.WorldPosition or v45.Position, v46, v_u_39.Name, v_u_31)
    v_u_28:Play()
    if not v_u_33 then
        v47:SetAttribute("Reloading", true)
        v_u_10.Text = "Reloading"
    end
    task.wait(v_u_34)
    if not v_u_33 then
        if v47 == v_u_39 then
            v_u_10.Text = "1 / 1"
        end
        v47:SetAttribute("Reloading", false)
    end
    return true
end
function NormalFireFunction()
    -- upvalues: (ref) v_u_39, (copy) v_u_10, (ref) v_u_40, (copy) v_u_15, (ref) v_u_35, (ref) v_u_38, (ref) v_u_28
    local v49 = v_u_39:FindFirstChild("Handle")
    if v49 then
        if v_u_39:GetAttribute("Reloading") then
            return
        else
            local v50 = v_u_39:GetAttribute("CurrentAmmo")
            if v50 == 0 then
                local v51 = v49:FindFirstChild("NoAmmoSound")
                if v51 then
                    v51:Play()
                end
                task.spawn(Reload)
                return
            else
                local v52 = GetFirePosition()
                if v52 then
                    v_u_39:SetAttribute("CurrentAmmo", v50 - 1)
                    v_u_10.Text = v50 - 1 .. " / " .. v_u_40
                    v_u_15:Fire(v49:FindFirstChild("OnGunAtt"), v52, v_u_39.Name, v_u_35 and v_u_38 or nil, v_u_35)
                    if v_u_28 then
                        v_u_28:Play()
                    end
                end
            end
        end
    else
        return
    end
end
function GetFirePosition()
    -- upvalues: (copy) v_u_17, (copy) v_u_4, (copy) v_u_7, (copy) v_u_41, (copy) v_u_6
    if v_u_17.LastInputType ~= "Mobile" then
        return v_u_6.Hit.Position
    end
    local v53 = v_u_4:ScreenPointToRay(v_u_7.AbsoluteSize.X / 2, v_u_7.AbsoluteSize.Y / 2 - 23)
    local v54 = workspace:Raycast(v53.Origin, v53.Direction * 500000000, v_u_41)
    if v54 then
        v54 = v54.Position
    end
    return v54
end
function FireLoop(p55)
    -- upvalues: (ref) v_u_30, (ref) v_u_37, (ref) v_u_39, (ref) v_u_34, (ref) v_u_33
    v_u_30 = DateTime.now().UnixTimestampMillis
    v_u_37 = true
    local v56 = v_u_39
    if not v56 then
        return
    end
    if v56:GetAttribute("Firing") then
        return
    end
    v_u_39:SetAttribute("Firing", true)
    while v56 == v_u_39 do
        if not p55() then
            task.wait(v_u_34)
        end
        if v_u_33 then
            if not v_u_37 then
                break
            end
        else
            local v57 = DateTime.now().UnixTimestampMillis - v_u_30
            local v58 = v_u_34 * 1000
            if math.min(150, v58) < v57 then
                break
            end
        end
    end
    v56:SetAttribute("Firing", false)
end
function OnToolModeChanged(p59, p60)
    -- upvalues: (ref) v_u_31, (ref) v_u_34
    v_u_31 = p59:GetAttribute("ToolMode") or ""
    v_u_34 = p60[v_u_31] and p60[v_u_31].FiringDelay or p60.FiringDelay
end
function v42.Enable(p_u_61, p62, p63, p64, p65)
    -- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_19, (ref) v_u_38, (ref) v_u_33, (ref) v_u_36, (ref) v_u_35, (ref) v_u_40, (ref) v_u_39, (ref) v_u_28, (copy) v_u_41, (copy) v_u_5, (ref) v_u_25, (copy) v_u_10, (copy) v_u_20, (copy) v_u_21, (ref) v_u_27, (ref) v_u_29, (ref) v_u_26, (ref) v_u_32, (copy) v_u_17
    local v66 = p_u_61.Name
    v_u_8.Visible = true
    v_u_9.Text = v66
    local v_u_67 = v_u_19[v66]
    v_u_38 = v_u_67.SpreadAccuracy
    v_u_33 = v_u_67.AutomaticFire
    v_u_36 = v_u_67.ReloadTime
    v_u_35 = v_u_67.NumBullets
    v_u_40 = v_u_67.MaxAmmo
    v_u_39 = p_u_61
    v_u_28 = p63
    v_u_41.FilterDescendantsInstances = { v_u_5.Character }
    OnToolModeChanged(p_u_61, v_u_67)
    v_u_25 = p_u_61:GetAttributeChangedSignal("ToolMode"):Connect(function()
        -- upvalues: (copy) p_u_61, (copy) v_u_67
        OnToolModeChanged(p_u_61, v_u_67)
    end)
    if v_u_39:GetAttribute("Reloading") then
        v_u_10.Text = "Reloading"
    else
        if not p_u_61:GetAttribute("CurrentAmmo") then
            p_u_61:SetAttribute("CurrentAmmo", v_u_40)
        end
        v_u_10.Text = p_u_61:GetAttribute("CurrentAmmo") .. " / " .. v_u_40
    end
    if v_u_20[v66] then
        if not v_u_21[v66] then
            v_u_21[v66] = require(v_u_20[v66])
        end
        v_u_21[v66].Enable(p_u_61)
    end
    if p62 then
        v_u_27 = p62
        p62:Play()
    end
    v_u_29 = p_u_61:HasTag("MovingPartFire") and FireMovingPart or NormalFireFunction
    if p_u_61.Handle:FindFirstChild("EquipSnd") then
        p_u_61.Handle.EquipSnd:Play()
    end
    if p_u_61.Handle:FindFirstChild("LoopSnd") then
        p_u_61.Handle.LoopSnd:Play()
    end
    v_u_26 = p64
    v_u_32 = p65
    v_u_17.ConnectToInputChanged(MakeInputs, "FiringWeapon")
end
function DisconnectAll()
    -- upvalues: (ref) v_u_23, (ref) v_u_24, (copy) v_u_18
    if v_u_23 then
        v_u_23:Disconnect()
        v_u_23 = nil
    end
    if v_u_24 then
        v_u_24:Disconnect()
        v_u_24 = nil
    end
    v_u_18.DisableButton("FireBttn")
end
function MakeInputs(p68)
    -- upvalues: (copy) v_u_16, (ref) v_u_23, (copy) v_u_6, (ref) v_u_29, (ref) v_u_24, (ref) v_u_37, (copy) v_u_18, (copy) v_u_11, (copy) v_u_12, (ref) v_u_40
    DisconnectAll()
    v_u_16(p68 == "Mobile")
    if p68 == "PC" or p68 == "Gamepad" then
        v_u_23 = v_u_6.Button1Down:Connect(function()
            -- upvalues: (ref) v_u_29
            FireLoop(v_u_29)
        end)
        v_u_24 = v_u_6.Button1Up:Connect(function()
            -- upvalues: (ref) v_u_37
            v_u_37 = false
        end)
        if p68 == "Gamepad" then
            v_u_18.EnableButton("FireBttn", {
                ["Image"] = "rbxassetid://366895201"
            }, Enum.KeyCode.ButtonR2)
        end
    else
        v_u_11.Visible = true
        v_u_11.ActionIcon.Image = "rbxassetid://366895201"
        v_u_23 = v_u_11.InputBegan:Connect(function(p_u_69)
            -- upvalues: (ref) v_u_24, (ref) v_u_11, (ref) v_u_12, (ref) v_u_37, (ref) v_u_29
            if p_u_69.Delta.Magnitude <= 0 then
                if v_u_24 then
                    v_u_24:Disconnect()
                end
                v_u_11.ImageColor3 = Color3.new(0.7, 0.7, 0.7)
                v_u_12.ImageColor3 = Color3.new(0.7, 0.7, 0.7)
                v_u_24 = p_u_69:GetPropertyChangedSignal("UserInputState"):Connect(function()
                    -- upvalues: (copy) p_u_69, (ref) v_u_37, (ref) v_u_24
                    if p_u_69.UserInputState == Enum.UserInputState.End then
                        OnFireButtonReleased()
                        v_u_37 = false
                        v_u_24:Disconnect()
                    end
                end)
                FireLoop(v_u_29)
            end
        end)
    end
    if v_u_40 > 1 then
        EnableNormalReloadBttn(p68)
    end
end
function OnFireButtonReleased()
    -- upvalues: (copy) v_u_11, (copy) v_u_12
    v_u_11.ImageColor3 = Color3.new(1, 1, 1)
    v_u_12.ImageColor3 = Color3.new(1, 1, 1)
end
function EnableNormalReloadBttn(p70)
    -- upvalues: (copy) v_u_1, (copy) v_u_18
    local v71 = {
        ["Image"] = "rbxassetid://6011908706"
    }
    local v72 = nil
    if p70 == "Gamepad" then
        v72 = Enum.KeyCode.ButtonX
    elseif p70 == "PC" then
        v72 = Enum.KeyCode.R
        v71.Text = v_u_1:GetStringForKeyCode(v72)
    end
    v_u_18.EnableButton("ReloadBttn", v71, v72, Reload)
end
function v42.Disable(p73)
    -- upvalues: (copy) v_u_21, (ref) v_u_39, (ref) v_u_25, (copy) v_u_17, (ref) v_u_26, (ref) v_u_27, (copy) v_u_18, (copy) v_u_8, (copy) v_u_11, (copy) v_u_16, (ref) v_u_31, (ref) v_u_37
    if v_u_21[p73.Name] then
        v_u_21[p73.Name].Disable()
    end
    local v74 = v_u_39
    if v74 then
        v74 = v_u_39:FindFirstChild("Handle")
    end
    if v_u_25 then
        v_u_25:Disconnect()
    end
    v_u_17.Disconnect("FiringWeapon")
    DisconnectAll()
    if v_u_26 and v_u_26.IsPlaying then
        v_u_26:Stop()
    end
    if v_u_27 and v_u_27.IsPlaying then
        v_u_27:Stop()
    end
    if v74 then
        if v74:FindFirstChild("ReloadSnd") then
            v74.ReloadSnd:Stop()
        end
        if v74:FindFirstChild("LoopSnd") then
            v74.LoopSnd:Stop()
        end
    end
    v_u_18.DisableButton("ReloadBttn")
    v_u_8.Visible = false
    v_u_11.Visible = false
    if v_u_17.LastInputType == "Mobile" then
        OnFireButtonReleased()
        v_u_16(false)
    end
    v_u_31 = nil
    v_u_39 = nil
    v_u_37 = false
end
return v42

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.FiringWeaponModule.Egg cannon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("SoundService")
local v3 = game:GetService("Players").LocalPlayer
local v_u_4 = nil
local v_u_5 = require(v1.AllModules.Events.EggCannonUnlock)
local v_u_6 = require(v3.Storage)
local v_u_7 = v_u_6.EggCannonUnlock
local v8 = v3.PlayerGui:WaitForChild("MainGui")
local v_u_9 = script.EggCannonFrame
v_u_9.Parent = v8.LowerFrameContainer
local v10 = v_u_9.Left
local v11 = v_u_9.Right
local v12 = v_u_9.ForEggImage
local v_u_13 = v12.UIPageLayout
local v_u_14 = v_u_9.EggNameWhenLocked
local v_u_15 = v_u_9.UnlockButton
local v_u_16 = v_u_15.UIGradient
local v_u_17 = v_u_15.TextLabel
local v_u_18 = v_u_15.EggImage
local v_u_19 = v_u_18.UIGradient
local v_u_20 = v1.RemoteEvent.WeaponEvent.WeaponStateReplicator
local v_u_21 = v1.RemoteFunction.Events.EggCannonUnlockF
local v_u_22 = v2.Sound.ClickSound
local v_u_23 = v2.Sound.BuySound
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = v8:GetAttribute("BaseGreenGradient")
local v_u_28 = v8:GetAttribute("BaseGreyGradient")
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = 1
local v_u_32 = false
local v_u_33 = {
    {
        ["Page"] = v12.Green,
        ["Name"] = "Normal"
    },
    {
        ["Page"] = v12.Blue,
        ["Name"] = "Speedy"
    },
    {
        ["Page"] = v12.Purple,
        ["Name"] = "Push"
    },
    {
        ["Page"] = v12.Yellow,
        ["Name"] = "x1.5 damages"
    },
    {
        ["Page"] = v12.Orange,
        ["Name"] = "x2 damages"
    },
    {
        ["Page"] = v12.Red,
        ["Name"] = "Explosive"
    }
}
local v_u_34 = #v_u_33
function DisconnectAllBttnC()
    -- upvalues: (ref) v_u_25, (ref) v_u_24
    if v_u_25 then
        v_u_25:Disconnect()
    end
    if v_u_24 then
        v_u_24:Disconnect()
    end
end
function ChangeIndex(p35, p36)
    -- upvalues: (ref) v_u_31, (copy) v_u_34, (copy) v_u_33, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5, (ref) v_u_4, (copy) v_u_17, (copy) v_u_16, (copy) v_u_27, (copy) v_u_15, (ref) v_u_25, (copy) v_u_22, (ref) v_u_32, (copy) v_u_21, (copy) v_u_23, (copy) v_u_28, (copy) v_u_18, (copy) v_u_19, (copy) v_u_14, (ref) v_u_24, (ref) v_u_29, (copy) v_u_20, (ref) v_u_30, (copy) v_u_13
    DisconnectAllBttnC()
    if p35 then
        p36 = v_u_31 + p35
        if v_u_34 + 1 <= p36 then
            p36 = 1
        elseif p36 <= 0 then
            p36 = v_u_34
        end
    end
    local v37 = v_u_33[p36]
    local v38 = v37.Page
    local v_u_39 = v38.Name
    if v_u_7.Value:sub(p36, p36) == "a" then
        v38.LockedIcon.Visible = true
        v38.ImageColor3 = Color3.new(0.8, 0.8, 0.8)
        local v_u_40 = v_u_6[v_u_39 .. "Egg"]
        local v_u_41 = v_u_5[v_u_39]
        local function v42()
            -- upvalues: (ref) v_u_4, (ref) v_u_17, (copy) v_u_40, (copy) v_u_41, (ref) v_u_16, (ref) v_u_27, (ref) v_u_15, (ref) v_u_25, (ref) v_u_22, (ref) v_u_32, (ref) v_u_21, (copy) v_u_39, (ref) v_u_23, (ref) v_u_28
            if v_u_4 then
                v_u_17.Text = "Unlock: " .. v_u_40.Value .. "/" .. v_u_41
                if v_u_41 <= v_u_40.Value then
                    v_u_16.Color = v_u_27
                    v_u_15.AutoButtonColor = true
                    v_u_25 = v_u_15.Activated:Connect(function()
                        -- upvalues: (ref) v_u_22, (ref) v_u_32, (ref) v_u_21, (ref) v_u_39, (ref) v_u_23
                        v_u_22:Play()
                        if not v_u_32 then
                            v_u_32 = true
                            if v_u_21:InvokeServer(v_u_39) then
                                v_u_23:Play()
                            end
                            v_u_32 = false
                        end
                    end)
                else
                    v_u_15.AutoButtonColor = false
                    v_u_16.Color = v_u_28
                end
            else
                v_u_17.Text = "Unlock during\neaster event"
                v_u_15.AutoButtonColor = false
                v_u_16.Color = v_u_28
                return
            end
        end
        v_u_15.BackgroundTransparency = 0
        v_u_18.Visible = true
        v_u_19.Color = v38.UIGradient.Color
        v_u_14.Visible = true
        v_u_14.Text = v37.Name
        v_u_24 = v_u_40:GetPropertyChangedSignal("Value"):Connect(v42)
        v42()
    else
        v38.LockedIcon.Visible = false
        v38.ImageColor3 = Color3.new(1, 1, 1)
        v_u_29:SetAttribute("ToolMode", v_u_39)
        v_u_20:FireServer(v_u_29, {
            ["ToolMode"] = v_u_39
        })
        v_u_17.Text = v37.Name
        v_u_15.BackgroundTransparency = 1
        v_u_18.Visible = false
        v_u_14.Visible = false
        v_u_30 = p36
    end
    v_u_13:JumpTo(v38)
    v_u_31 = p36
end
v10.Activated:Connect(function()
    -- upvalues: (copy) v_u_22
    v_u_22:Play()
    ChangeIndex(-1)
end)
v11.Activated:Connect(function()
    -- upvalues: (copy) v_u_22
    v_u_22:Play()
    ChangeIndex(1)
end)
return {
    ["Enable"] = function(p43)
        -- upvalues: (ref) v_u_29, (ref) v_u_4, (ref) v_u_30, (copy) v_u_9, (ref) v_u_26, (copy) v_u_7
        v_u_29 = p43
        v_u_4 = workspace:GetAttribute("EasterEvent")
        if p43:GetAttribute("ToolMode") then
            ChangeIndex(nil, v_u_30)
        else
            ChangeIndex(nil, 1)
        end
        v_u_9.Visible = true
        v_u_26 = v_u_7:GetPropertyChangedSignal("Value"):Connect(function()
            ChangeIndex(0)
        end)
    end,
    ["Disable"] = function()
        -- upvalues: (ref) v_u_26, (ref) v_u_29, (copy) v_u_9
        if v_u_26 then
            v_u_26:Disconnect()
        end
        DisconnectAllBttnC()
        v_u_29 = nil
        v_u_9.Visible = false
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.FiringWeaponModule.Greedy clone cannon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = require(v1.AllModules.ToolModules.ToolDescriptionWriter)
local v_u_4 = require(v1.AllModules.WeaponStats)["Greedy clone cannon"].HitIncome / 1000 .. "K"
return {
    ["Enable"] = function(_)
        -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
        if v_u_2.leaderstats.Level.Value >= 600 then
            v_u_3.ShowDescription("Fire on clones to earn <font color=\"rgb(255, 255, 50)\">+$" .. v_u_4 .. "</font>")
        end
    end,
    ["Disable"] = function()
        -- upvalues: (copy) v_u_3
        v_u_3.HideDescription()
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.FiringWeaponModule.Pumpkin launcher
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
game:GetService("SoundService")
local v2 = game:GetService("Players")
local v_u_3 = v1.RemoteEvent.WeaponEvent.WeaponStateReplicator
local v_u_4 = v2.LocalPlayer.Stats.Kills["Jack-O\'"]
local v_u_5 = require(v1.AllModules.WeaponStats)["Pumpkin launcher"]
local v_u_6 = require(v1.AllModules.ToolModules.ToolDescriptionWriter)
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v10 = {}
function ChangeDisplay()
    -- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (ref) v_u_7, (copy) v_u_3
    local v11 = workspace:GetAttribute("HalloweenEvent")
    local v12 = v_u_4.Value
    local v13, v14 = v_u_5.GetCurrentLevelAndNextLevel(v12)
    local v15 = v13 == "" and 0 or (v13:sub(-1) or 0)
    local v16 = "Level: " .. v15 .. "/3\n"
    if v15 - 3 >= 0 then
        v_u_6.ShowDescription(v16 .. "<font color=\"rgb(190, 190, 190)\">Maxed out</font>")
    elseif v11 then
        v_u_6.ShowDescription(v16 .. "Upgrade: <font color=\"rgb(255, 255, 50)\">" .. v12 .. "/" .. v14 .. "</font><font color=\"rgb(255, 150, 20)\"> Jack-O\' </font> killed")
    else
        v_u_6.ShowDescription(v16 .. "Upgrade during the <font color=\"rgb(255, 150, 20)\">halloween event</font>!")
    end
    if v13 ~= v_u_7:GetAttribute("ToolMode") then
        v_u_7:SetAttribute("ToolMode", v13)
        v_u_3:FireServer(v_u_7, nil, true)
    end
end
function v10.Enable(p17)
    -- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_8, (copy) v_u_4
    v_u_7 = p17
    v_u_9 = workspace:GetAttributeChangedSignal("HalloweenEvent"):Connect(ChangeDisplay)
    v_u_8 = v_u_4:GetPropertyChangedSignal("Value"):Connect(ChangeDisplay)
    ChangeDisplay()
end
function v10.Disable()
    -- upvalues: (ref) v_u_9, (ref) v_u_8, (ref) v_u_7, (copy) v_u_6
    if v_u_9 then
        v_u_9:Disconnect()
    end
    if v_u_8 then
        v_u_8:Disconnect()
    end
    v_u_7 = nil
    v_u_6.HideDescription()
end
return v10

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.FiringWeaponModule.Gift cannon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
game:GetService("SoundService")
local v2 = game:GetService("Players")
local v_u_3 = v1.RemoteEvent.WeaponEvent.WeaponStateReplicator
local v_u_4 = v2.LocalPlayer.Stats.Kills["Cyan santa zombie"]
local v_u_5 = require(v1.AllModules.WeaponStats)["Gift cannon"]
local v_u_6 = require(v1.AllModules.ToolModules.ToolDescriptionWriter)
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v10 = {}
function ChangeDisplay()
    -- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (ref) v_u_7, (copy) v_u_3
    local v11 = workspace:GetAttribute("ChristmasEvent")
    local v12 = v_u_4.Value
    local v13, v14 = v_u_5.GetCurrentLevelAndNextLevel(v12)
    local v15 = v13 == "Red" and 1 or 2
    local v16 = "Level: " .. v15 .. "/2\n"
    if v15 - 2 >= 0 then
        v_u_6.ShowDescription(v16 .. "<font color=\"rgb(190, 190, 190)\">Maxed out</font>")
    elseif v11 then
        v_u_6.ShowDescription(v16 .. "Upgrade: <font color=\"rgb(255, 255, 50)\">" .. v12 .. "/" .. v14 .. "</font><font color=\"rgb(255, 150, 20)\"> Cyan santa zombie </font> killed")
    else
        v_u_6.ShowDescription(v16 .. "Upgrade during the <font color=\"rgb(255, 150, 20)\">Christmas event</font>!")
    end
    if v13 ~= v_u_7:GetAttribute("ToolMode") then
        v_u_7:SetAttribute("ToolMode", v13)
        v_u_3:FireServer(v_u_7, nil, true)
    end
end
function v10.Enable(p17)
    -- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_8, (copy) v_u_4
    v_u_7 = p17
    v_u_9 = workspace:GetAttributeChangedSignal("ChristmasEvent"):Connect(ChangeDisplay)
    v_u_8 = v_u_4:GetPropertyChangedSignal("Value"):Connect(ChangeDisplay)
    ChangeDisplay()
end
function v10.Disable()
    -- upvalues: (ref) v_u_9, (ref) v_u_8, (ref) v_u_7, (copy) v_u_6
    if v_u_9 then
        v_u_9:Disconnect()
    end
    if v_u_8 then
        v_u_8:Disconnect()
    end
    v_u_7 = nil
    v_u_6.HideDescription()
end
return v10

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.FiringWeaponModule.Heart cannon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.ToolModules.ToolDescriptionWriter)
return {
    ["Enable"] = function(_)
        -- upvalues: (copy) v_u_1
        v_u_1.ShowDescription("<font color=\"rgb(255, 50, 50)\">Damage</font> enemies and <font color=\"rgb(50, 255, 50)\">heal</font> allies")
    end,
    ["Disable"] = function()
        -- upvalues: (copy) v_u_1
        v_u_1.HideDescription()
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.HitWeaponModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1:WaitForChild("AllModules"):WaitForChild("WeaponStats"))
local v_u_4 = {}
local v_u_5 = {}
for _, v6 in pairs(script:GetChildren()) do
    v_u_4[v6.Name] = v6
end
local v_u_7 = nil
local _ = v2.LocalPlayer
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = v1.RemoteEvent.PunchEvent
local v_u_11 = nil
local v_u_12 = nil
local v13 = {}
function OnToolTouched(p14, p15)
    -- upvalues: (copy) v_u_10
    local v16 = p14:FindFirstAncestorOfClass("Model")
    if v16 and (v16:FindFirstChild("Humanoid") or v16:HasTag("DamageableInstance")) then
        p15.CanTouch = false
        v_u_10:FireServer(p14)
    elseif p14:HasTag("DamageableInstance") then
        p15.CanTouch = false
        v_u_10:FireServer(p14)
    end
end
function HitFunction(p17, p18, p19, p20, p21)
    -- upvalues: (ref) v_u_9, (copy) v_u_3
    if not (p17:GetAttribute("Hitting") or p17:GetAttribute("Eating")) then
        local v22 = v_u_9
        p17:SetAttribute("Hitting", true)
        p19:Play()
        local v23 = task.wait(0.1)
        if p21 then
            p21.Enabled = true
        end
        if p18:FindFirstChild("WooshSnd") then
            p18.WooshSnd:Play()
        end
        p20.CanTouch = true
        local v24 = v23 + task.wait(0.3)
        p20.CanTouch = false
        local v25 = v_u_3[v22]
        local v26 = p17:GetAttribute("ToolMode")
        local v27 = v25[v26] and v25[v26].FiringDelay or v25.FiringDelay
        task.wait(v27 - v24)
        if p21 then
            p21.Enabled = false
        end
        p17:SetAttribute("Hitting", false)
    end
end
function v13.Enable(p_u_28, p_u_29, p30)
    -- upvalues: (ref) v_u_8, (ref) v_u_9, (ref) v_u_11, (ref) v_u_12, (copy) v_u_4, (copy) v_u_5, (ref) v_u_7
    local v31 = p_u_28.Name
    v_u_8 = p_u_28
    v_u_9 = v31
    local v_u_32 = p_u_28.Handle
    local v_u_33 = v_u_32:FindFirstChild("HitBox") or v_u_32
    local v_u_34 = v_u_32:FindFirstChild("SlashTrail")
    if v_u_34 then
        v_u_34.Enabled = false
    end
    if v_u_32:FindFirstChild("EquipSound") then
        v_u_32.EquipSound:Play()
    end
    v_u_11 = p_u_28.Activated:Connect(function()
        -- upvalues: (copy) p_u_28, (copy) v_u_32, (copy) p_u_29, (copy) v_u_33, (copy) v_u_34
        HitFunction(p_u_28, v_u_32, p_u_29, v_u_33, v_u_34)
    end)
    v_u_33.CanTouch = false
    v_u_12 = v_u_33.Touched:Connect(function(p35)
        -- upvalues: (copy) v_u_33
        OnToolTouched(p35, v_u_33)
    end)
    if v_u_4[v_u_9] then
        if not v_u_5[v_u_9] then
            v_u_5[v_u_9] = require(v_u_4[v_u_9])
        end
        v_u_5[v_u_9].Enable(p_u_28, p30)
    end
    if p_u_28:HasTag("Consumable") then
        if not v_u_7 then
            v_u_7 = require(script.Consumable)
        end
        v_u_7.Enable(p_u_28, p30)
    end
end
function v13.Disable(p36)
    -- upvalues: (copy) v_u_5, (ref) v_u_9, (ref) v_u_7, (ref) v_u_12, (ref) v_u_11, (ref) v_u_8
    if v_u_5[v_u_9] then
        v_u_5[v_u_9].Disable()
    end
    if v_u_7 and p36:HasTag("Consumable") then
        v_u_7.Disable(p36)
    end
    if v_u_12 then
        v_u_12:Disconnect()
        v_u_12 = nil
    end
    if v_u_11 then
        v_u_11:Disconnect()
        v_u_11 = nil
    end
    v_u_9 = nil
    v_u_8 = nil
end
return v13

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.HitWeaponModule.Friend baton
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = v2.LocalPlayer
local v_u_4 = v1.RemoteEvent.WeaponEvent.WeaponStateReplicator
local v_u_5 = require(v1.AllModules.ToolModules.ToolDescriptionWriter)
local v_u_6 = require(v1.AllModules.WeaponStats)["Friend baton"]
local v_u_7 = v_u_6["5_friend"].Damages
local v_u_8 = nil
local v_u_9 = v2.MaxPlayers - 1
v3.PlayerGui:WaitForChild("MainGui")
local v_u_10 = nil
local v11 = {}
function OnToolModeChanged()
    -- upvalues: (ref) v_u_8, (copy) v_u_6, (copy) v_u_9, (copy) v_u_5, (copy) v_u_7
    local v12 = v_u_8:GetAttribute("Server_ToolMode")
    local v13, v14
    if v12 then
        v13 = tonumber(v12:sub(1, 1))
        v14 = v_u_6[v12].Damages
    else
        v14 = v_u_6.Damages
        v13 = 0
    end
    local v15 = 2 * v13 / 5
    local v16 = math.min(1, v15)
    local v17 = v13 < v_u_9 / 2 and 1 or 1 - (2 * v13 - v_u_9) / v_u_9
    local v18 = v_u_5.ShowDescription
    local v19 = "Friends: " .. v13 .. "/" .. v_u_9
    local v20 = v16 * 255
    local v21 = math.floor(v20)
    local v22 = v17 * 255
    local v23 = math.floor(v22)
    local v24 = v14 / v_u_7 * 100
    v18(v19, "Power: <font color=\"rgb(" .. v21 .. "," .. v23 .. ",50)\">" .. math.floor(v24) .. "%</font>", 0.8)
end
function v11.Enable(p25)
    -- upvalues: (copy) v_u_4, (ref) v_u_8, (ref) v_u_10
    v_u_4:FireServer(p25, nil, true)
    v_u_8 = p25
    v_u_10 = v_u_8:GetAttributeChangedSignal("Server_ToolMode"):Connect(OnToolModeChanged)
    OnToolModeChanged()
end
function v11.Disable(_)
    -- upvalues: (ref) v_u_8, (copy) v_u_5, (ref) v_u_10
    v_u_8 = nil
    v_u_5.HideDescription()
    if v_u_10 then
        v_u_10:Disconnect()
    end
end
return v11

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.HitWeaponModule.Refiller
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game:GetService("UserInputService")
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players").LocalPlayer
local v_u_3 = v1.RemoteFunction.RefillerF
local v4 = v2.PlayerGui:WaitForChild("MainGui")
local v_u_5 = script.QuestRefillFrame
v_u_5.Parent = v4.LowerFrameContainer
local v_u_6 = v_u_5.RefillImage
local v_u_7 = v_u_5.DescLabel
local v_u_8 = v_u_5.BarBttn
local v_u_9 = v_u_8.UIGradient
local v_u_10 = v_u_8.BarText
local v_u_11 = require(v1.AllModules.ConvertVal).SimpleConversion
local v_u_12 = v2.Stats.DamageWithRefiller
local v_u_13 = v2.leaderstats.Level
local v_u_14 = false
local v_u_15 = "/" .. v_u_11(10000)
local v_u_16 = "Deal <font color=\"rgb(255, 255, 50)\">" .. v_u_11(10000) .. " damage</font> to refill quests"
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = nil
local v20 = game:GetService("SoundService"):WaitForChild("Sound")
local v_u_21 = v20:WaitForChild("ClickSound")
local v_u_22 = v20:WaitForChild("BuySound")
local v23 = {}
function OnDamageValChanged()
    -- upvalues: (copy) v_u_12, (ref) v_u_19, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_15, (copy) v_u_8, (copy) v_u_21, (ref) v_u_14, (copy) v_u_3, (copy) v_u_22
    local v24 = v_u_12.Value
    if v24 < 10000 then
        if v_u_19 then
            v_u_19:Disconnect()
        end
        local v25 = v24 / 10000
        local v26 = v_u_9
        local v27 = ColorSequence.new
        local v28 = {}
        local v29 = ColorSequenceKeypoint.new(0, Color3.new(0, 1))
        local v30 = ColorSequenceKeypoint.new(v25, Color3.new(0, 1))
        local v31 = ColorSequenceKeypoint.new
        local v32 = v25 + 0.001
        __set_list(v28, 1, {v29, v30, v31(math.min(v32, 1), Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))})
        v26.Color = v27(v28)
        local v33 = v_u_9
        local v34 = NumberSequence.new
        local v35 = {}
        local v36 = NumberSequenceKeypoint.new(0, 0)
        local v37 = NumberSequenceKeypoint.new(v25, 0)
        local v38 = NumberSequenceKeypoint.new
        local v39 = v25 + 0.001
        __set_list(v35, 1, {v36, v37, v38(math.min(v39, 1), 0.6), NumberSequenceKeypoint.new(1, 0.6)})
        v33.Transparency = v34(v35)
        v_u_10.Text = v_u_11(v24) .. v_u_15
        v_u_8.AutoButtonColor = false
        v_u_8.Active = false
    else
        v_u_9.Color = ColorSequence.new(Color3.new(0, 1))
        v_u_9.Transparency = NumberSequence.new(0)
        v_u_8.AutoButtonColor = true
        v_u_8.Active = true
        v_u_10.Text = "Refill quests"
        if not (v_u_19 and v_u_19.Connected) then
            v_u_19 = v_u_8.Activated:Connect(function()
                -- upvalues: (ref) v_u_21, (ref) v_u_14, (ref) v_u_3, (ref) v_u_22
                v_u_21:Play()
                if not v_u_14 then
                    v_u_14 = true
                    if v_u_3:InvokeServer() then
                        v_u_22:Play()
                    end
                    v_u_14 = false
                end
            end)
        end
    end
end
function v23.Enable(p40)
    -- upvalues: (ref) v_u_17, (copy) v_u_5, (copy) v_u_13, (copy) v_u_6, (copy) v_u_7, (copy) v_u_16, (ref) v_u_18, (copy) v_u_12, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9
    v_u_17 = p40
    v_u_5.Visible = true
    if v_u_13.Value >= 80 then
        v_u_6.Visible = true
        v_u_7.Text = v_u_16
        v_u_18 = v_u_12.Changed:Connect(OnDamageValChanged)
        OnDamageValChanged()
    else
        v_u_6.Visible = false
        v_u_7.Text = "You must be <font color=\"rgb(255, 50, 50)\">level 80+</font> to refill quests"
        v_u_8.AutoButtonColor = false
        v_u_8.Active = false
        v_u_10.Text = "Level " .. v_u_13.Value .. "/80"
        v_u_9.Color = ColorSequence.new(Color3.new(0.7, 0.7, 0.7))
        v_u_9.Transparency = NumberSequence.new(0)
    end
end
function v23.Disable(_)
    -- upvalues: (ref) v_u_18, (ref) v_u_19, (copy) v_u_5
    if v_u_18 then
        v_u_18:Disconnect()
    end
    if v_u_19 then
        v_u_19:Disconnect()
    end
    v_u_5.Visible = false
end
return v23

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.HitWeaponModule.Code mace
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game:GetService("UserInputService")
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainGui")
local v_u_3 = require(v1.AllModules.ToolModules.ToolDescriptionWriter)
local v_u_4 = require(v2.MainGuiScript.ToggleFrameModule)
local v_u_5 = require(v1.AllModules.ConvertVal).ConvertTimeInPart
local v6 = require(v1.AllModules.WeaponStats)["Code mace"]
local v_u_7 = require(v1.AllModules.ToolButtons)
local v_u_8 = v6.DmgIcrement
local v_u_9 = v6.Damages
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = nil
local v16 = game:GetService("SoundService"):WaitForChild("Sound")
v16:WaitForChild("ClickSound")
v16:WaitForChild("BuySound")
local v17 = {}
function DisplayText()
    -- upvalues: (ref) v_u_12, (ref) v_u_11, (ref) v_u_13, (copy) v_u_5, (copy) v_u_3
    local v18 = "Code streak: <font color=\"rgb(255, 255, 50)\">" .. v_u_12 .. "</font>\nDamage: <font color=\"rgb(255, 150, 50)\">" .. v_u_11 .. "</font>"
    local v19
    if v_u_13 and v_u_13 > 0 then
        v19 = "<font color=\"rgb(255, 50, 50)\">Resets in " .. v_u_5(v_u_13, 2) .. "</font>"
    else
        v19 = nil
    end
    v_u_3.ShowDescription(v18, v19, 0.8)
end
function OnDamageChanged()
    -- upvalues: (ref) v_u_11, (ref) v_u_10, (copy) v_u_9, (ref) v_u_12, (copy) v_u_8
    v_u_11 = v_u_10:GetAttribute("Damage") or v_u_9
    v_u_12 = (v_u_11 - v_u_9) / v_u_8
    DisplayText()
end
function OnTimeChanged()
    -- upvalues: (ref) v_u_13, (ref) v_u_10
    v_u_13 = v_u_10:GetAttribute("TimeLeft") or 0
    DisplayText()
end
function v17.Enable(p20)
    -- upvalues: (ref) v_u_10, (ref) v_u_14, (ref) v_u_15, (copy) v_u_7, (copy) v_u_4
    v_u_10 = p20
    v_u_14 = p20:GetAttributeChangedSignal("Damage"):Connect(OnDamageChanged)
    v_u_15 = p20:GetAttributeChangedSignal("TimeLeft"):Connect(OnTimeChanged)
    OnDamageChanged()
    OnTimeChanged()
    v_u_7.EnableButton("MainToolButton", {
        ["Text"] = "Redeem code",
        ["TextLabelSize"] = 1.1
    }, nil, nil, nil, function()
        -- upvalues: (ref) v_u_4
        v_u_4.ToggleFrame("RedeemCode")
    end)
end
function v17.Disable(_)
    -- upvalues: (ref) v_u_14, (ref) v_u_15, (copy) v_u_3, (copy) v_u_7
    if v_u_14 then
        v_u_14:Disconnect()
    end
    if v_u_15 then
        v_u_15:Disconnect()
    end
    v_u_3.HideDescription()
    v_u_7.DisableButton("MainToolButton")
end
return v17

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.HitWeaponModule.Clone healer
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.ToolModules.ToolDescriptionWriter)
return {
    ["Enable"] = function(_)
        -- upvalues: (copy) v_u_1
        v_u_1.ShowDescription("<font color=\"rgb(50, 255, 50)\">Heal</font> a clone by hitting it")
    end,
    ["Disable"] = function()
        -- upvalues: (copy) v_u_1
        v_u_1.HideDescription()
    end
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.HitWeaponModule.Spin wheel mace
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("SoundService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("Players").LocalPlayer
local v6 = require(v2.AllModules.ConvertVal).SimpleConversion
local v7 = require(v2.AllModules.WeaponStats)["Spin wheel mace"]
local v_u_8 = require(v2.AllModules.KeyInputLabelMaker)
local v_u_9 = require(v2.AllModules.InputManager)
local v_u_10 = v2.RemoteFunction.SpinWheelWeaponF
local v11 = v_u_5.PlayerGui:WaitForChild("MainGui")
local v_u_12 = script.SpinWheelFrame
v_u_12.Parent = v11.LowerFrameContainer
local v_u_13 = v_u_12.DescriptionLabel
local v_u_14 = v_u_12.SpinButton
local v_u_15 = v_u_12.SpinImage
local v_u_16 = v_u_14.UIGradient
local v_u_17 = v_u_14.UIScale
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = v11:GetAttributes()
local v_u_24 = 0
local v_u_25 = Enum.KeyCode.ButtonY
local v_u_26 = TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v_u_27 = nil
local v28 = v3:WaitForChild("Sound")
local v_u_29 = v28:WaitForChild("ClickSound")
local v_u_30 = v28:WaitForChild("SpinTickSound"):Clone()
v_u_30.PlaybackSpeed = 2
v_u_30.Volume = 1
v_u_30.Name = "ForSpinWeaponSound"
v_u_30.Parent = v28
local v_u_31 = Instance.new("PitchShiftSoundEffect", v_u_30)
v_u_31.Octave = 2
local v32 = {}
local v_u_33 = v7.ModeList
local v_u_34 = {
    "<font color=\"rgb(255, 255, 50)\">+$" .. v6(v7.Coin1.HitIncome) .. "/hit</font>",
    "<font color=\"rgb(180, 180, 180)\">normal</font>",
    "<font color=\"rgb(255, 100, 100)\">2\195\151 damage</font>",
    "<font color=\"rgb(255, 255, 50)\">+$" .. v6(v7.Coin2.HitIncome) .. "/hit</font>",
    "<font color=\"rgb(83, 165, 255)\">4\195\151 damage</font> and <font color=\"rgb(83, 165, 255)\">+$" .. v6(v7.Blue.HitIncome) .. "/hit</font>",
    "<font color=\"rgb(255, 255, 50)\">+$" .. v6(v7.Coin3.HitIncome) .. "/hit</font>",
    "<font color=\"rgb(255, 100, 100)\">2\195\151 damage</font>",
    "<font color=\"rgb(180, 180, 180)\">normal</font>"
}
function GetAngleForMode(p35)
    -- upvalues: (copy) v_u_33
    return 22.5 + (table.find(v_u_33, p35) - 1) * 45
end
function GetModeForAngle(p36)
    -- upvalues: (copy) v_u_33
    return v_u_33[p36 % 360 // 45 + 1]
end
function ToggleSpinBttnAppearance(p37)
    -- upvalues: (copy) v_u_16, (copy) v_u_23, (copy) v_u_17
    if p37 then
        v_u_16.Color = v_u_23.BaseGreenGradient
        v_u_17:AddTag("SizableUI")
    else
        v_u_16.Color = v_u_23.BaseGreyGradient
        v_u_17:RemoveTag("SizableUI")
    end
end
function OnSpinBttnActivated()
    -- upvalues: (ref) v_u_22, (copy) v_u_29, (copy) v_u_10, (ref) v_u_27, (copy) v_u_4, (copy) v_u_15, (copy) v_u_26
    if v_u_22:GetAttribute("IsSpinning") then
        return
    else
        v_u_29:Play()
        v_u_22:SetAttribute("IsSpinning", true)
        ToggleSpinBttnAppearance(false)
        local v38 = v_u_22
        local v39 = v_u_10:InvokeServer()
        if v39 then
            v_u_27 = v_u_4:Create(v_u_15, v_u_26, {
                ["Rotation"] = (CurrentRotation // 360 + 8) * 360 + GetAngleForMode(v39)
            })
            v_u_27:Play()
            v_u_27.Completed:Wait()
            if v38:IsDescendantOf(game) then
                v38:SetAttribute("IsSpinning", false)
                ToggleSpinBttnAppearance(true)
            end
        else
            v_u_22:SetAttribute("IsSpinning", false)
            ToggleSpinBttnAppearance(true)
            return
        end
    end
end
function ChangeSection(p40)
    -- upvalues: (ref) v_u_24, (copy) v_u_13, (copy) v_u_34, (copy) v_u_30
    local v41 = CurrentRotation // 45
    if v41 ~= v_u_24 then
        v_u_24 = v41
        v_u_13.Text = "Mode: " .. v_u_34[v_u_24 % 8 + 1]
        if p40 then
            v_u_30:Play()
        end
    end
end
function OnRotationChanged()
    -- upvalues: (copy) v_u_15
    CurrentRotation = v_u_15.Rotation
    ChangeSection(true)
end
function DisconnectGamepadInputs()
    -- upvalues: (ref) v_u_21
    if v_u_21 then
        v_u_21:Disconnect()
    end
end
function MakeInputs(p42)
    -- upvalues: (ref) v_u_18, (copy) v_u_8, (copy) v_u_14, (copy) v_u_25, (ref) v_u_21, (copy) v_u_1
    DisconnectGamepadInputs()
    if p42 == "Gamepad" then
        v_u_18 = v_u_8.ShowKeyInputImage(v_u_14, v_u_25, {
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
            ["AnchorPoint"] = Vector2.new(0.5, 0.3),
            ["Position"] = UDim2.fromScale(1, 0),
            ["Size"] = UDim2.fromScale(0.85, 0.85)
        })
        v_u_21 = v_u_1.InputBegan:Connect(function(p43, p44)
            -- upvalues: (ref) v_u_25
            if not p44 then
                if p43.KeyCode == v_u_25 then
                    OnSpinBttnActivated()
                end
            end
        end)
    elseif v_u_18 then
        v_u_18.Visible = false
    end
end
function v32.Enable(p45)
    -- upvalues: (copy) v_u_5, (ref) v_u_22, (ref) v_u_27, (copy) v_u_15, (ref) v_u_19, (copy) v_u_14, (ref) v_u_20, (copy) v_u_9, (copy) v_u_12, (copy) v_u_31
    if v_u_5.leaderstats.Level.Value >= 70 then
        v_u_22 = p45
        if p45:GetAttribute("IsSpinning") then
            ToggleSpinBttnAppearance(false)
        else
            if v_u_27 and v_u_27.PlaybackState == Enum.PlaybackState.Playing then
                v_u_27:Cancel()
            end
            ToggleSpinBttnAppearance(true)
            CurrentRotation = GetAngleForMode(p45:GetAttribute("Server_ToolMode"))
            v_u_15.Rotation = CurrentRotation
            ChangeSection(false)
        end
        v_u_19 = v_u_14.Activated:Connect(OnSpinBttnActivated)
        v_u_20 = v_u_15:GetPropertyChangedSignal("Rotation"):Connect(OnRotationChanged)
        v_u_9.ConnectToInputChanged(MakeInputs, "SpinWheelMace")
        v_u_12.Visible = true
        v_u_31.Enabled = true
    end
end
function v32.Disable()
    -- upvalues: (ref) v_u_19, (ref) v_u_20, (copy) v_u_9, (copy) v_u_12, (ref) v_u_22
    if v_u_19 then
        v_u_19:Disconnect()
    end
    if v_u_20 then
        v_u_20:Disconnect()
    end
    DisconnectGamepadInputs()
    v_u_9.Disconnect("SpinWheelMace")
    v_u_12.Visible = false
    v_u_22 = nil
end
return v32

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.HitWeaponModule.Consumable
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players").LocalPlayer
local v_u_4 = v2.RemoteEvent.WeaponEvent.WeaponStateReplicator
local v_u_5 = v2.RemoteEvent.ToolEvent.ConsumableEvent
local v_u_6 = require(v2.AllModules.ToolModules.ToolDescriptionWriter)
local v7 = require(v2.AllModules.WeaponStats)
local v8 = v7["Turkey leg"]
local v_u_9 = v7["Candy cane"]
local v_u_10 = require(v2.AllModules.InputManager)
local v_u_11 = require(v2.AllModules.ToolButtons)
local v_u_12 = v8.DamageBoostByEat
local v_u_13 = v8.DamageBoostDuration
local v_u_14 = nil
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = false
local v_u_21 = nil
local v22 = {}
function EatCandy()
    -- upvalues: (ref) v_u_14, (ref) v_u_16, (ref) v_u_19, (copy) v_u_5
    if v_u_14 and (not v_u_14:GetAttribute("Hitting") and (not v_u_14:GetAttribute("Eating") and (v_u_14.Name ~= "Candy cane" or v_u_16.Health < v_u_16.MaxHealth))) then
        local v23 = v_u_14
        if v_u_14:GetAttribute("Left") >= 1 then
            v_u_14:SetAttribute("Eating", true)
            v_u_19:Play()
            v_u_14.Handle.Eat:Play()
            v_u_5:FireServer(v23.Name)
            v_u_19.Ended:Wait()
            v23:SetAttribute("Eating", false)
        end
    else
        return
    end
end
function OnInputChanged(p24)
    -- upvalues: (ref) v_u_14, (copy) v_u_1, (copy) v_u_11
    local v25 = {
        ["Image"] = v_u_14.TextureId,
        ["ImageSize"] = UDim2.fromScale(0.9, 0.9)
    }
    local v26 = nil
    if p24 == "Gamepad" then
        v26 = Enum.KeyCode.ButtonX
    elseif p24 == "PC" then
        v26 = Enum.KeyCode.F
        v25.Text = v_u_1:GetStringForKeyCode(v26)
    else
        v25.Text = "Eat"
    end
    v_u_11.EnableButton("MainToolButton", v25, v26, EatCandy)
end
function ShowCandyCaneDescription()
    -- upvalues: (ref) v_u_20, (ref) v_u_15, (copy) v_u_6, (copy) v_u_9, (ref) v_u_21
    if v_u_20 and v_u_15 then
        v_u_6.ShowDescription("Eat to <font color=\"rgb(50, 255, 50)\">regen</font> " .. v_u_9[v_u_15].PrctRegen .. "% of your health", v_u_21)
        return
    elseif v_u_21 then
        v_u_6.ShowDescription(v_u_21)
    else
        v_u_6.HideDescription()
    end
end
function EnableEating()
    -- upvalues: (ref) v_u_20, (copy) v_u_10
    v_u_20 = true
    v_u_10.ConnectToInputChanged(OnInputChanged, "Consumable")
    ShowCandyCaneDescription()
end
function DisableEating()
    -- upvalues: (ref) v_u_20, (copy) v_u_11, (copy) v_u_10
    if v_u_20 then
        v_u_20 = false
        ShowCandyCaneDescription()
        v_u_11.DisableButton("MainToolButton")
        v_u_10.Disconnect("Consumable")
    end
end
local function v_u_40(p27)
    -- upvalues: (ref) v_u_16, (ref) v_u_20, (ref) v_u_18, (ref) v_u_15, (copy) v_u_9, (copy) v_u_3, (ref) v_u_21, (ref) v_u_14, (copy) v_u_4, (copy) v_u_12, (copy) v_u_13, (copy) v_u_6, (ref) v_u_17
    if p27 == "Candy cane" then
        local function v28()
            -- upvalues: (ref) v_u_16, (ref) v_u_20
            if v_u_16.Health <= 0 or v_u_16.Health >= v_u_16.MaxHealth then
                DisableEating()
            elseif not v_u_20 then
                EnableEating()
            end
        end
        v_u_18 = v_u_16.HealthChanged:Connect(v28)
        if v_u_16.Health <= 0 or v_u_16.Health >= v_u_16.MaxHealth then
            DisableEating()
        elseif not v_u_20 then
            EnableEating()
        end
        local v29, v30, v31, _ = v_u_9.GetCurrentLevelAndNextLevel(v_u_3)
        v_u_15 = v29
        local v32 = "Level: " .. v_u_15:sub(4, 4) .. "/3\n"
        if v30 then
            if workspace:GetAttribute("ChristmasEvent") then
                v_u_21 = v32 .. "Upgrade: <font color=\"rgb(255, 255, 50)\">" .. v_u_3.Stats.Kills[v31].Value .. "/" .. v30 .. " " .. v31 .. "</font> killed"
            else
                v_u_21 = v32 .. "Upgrade during the <font color=\"rgb(255, 50, 50)\">chirstmas event!</font>"
            end
        else
            v_u_21 = v32 .. "<font color=\"rgb(190, 190, 190)\">Maxed out</font>"
        end
        if v_u_15 ~= v_u_14:GetAttribute("ToolMode") then
            v_u_14:SetAttribute("ToolMode", v_u_15)
            v_u_4:FireServer(v_u_14, nil, true)
        end
        ShowCandyCaneDescription()
        return
    elseif p27 == "Turkey leg" then
        if v_u_14:GetAttribute("Left") >= 1 then
            local function v36()
                -- upvalues: (ref) v_u_14, (ref) v_u_12, (ref) v_u_13, (ref) v_u_6
                local v33 = v_u_14:GetAttribute("CurrentEatNumber") or 0
                local v34 = "Eat to get <font color=\"rgb(255, 50, 50)\">+" .. v_u_12 .. "% damage</font> for <font color=\"rgb(255, 255, 50)\">" .. v_u_13 .. "s</font>"
                local v35
                if v33 > 0 then
                    v35 = "Current damage: <font color=\"rgb(255, 150, 50)\">+" .. v33 * v_u_12 .. "%</font>"
                else
                    v35 = nil
                end
                v_u_6.ShowDescription(v34, v35, 0.8)
            end
            v_u_17 = v_u_14:GetAttributeChangedSignal("CurrentEatNumber"):Connect(v36)
            local v37 = v_u_14:GetAttribute("CurrentEatNumber") or 0
            local v38 = "Eat to get <font color=\"rgb(255, 50, 50)\">+" .. v_u_12 .. "% damage</font> for <font color=\"rgb(255, 255, 50)\">" .. v_u_13 .. "s</font>"
            local v39
            if v37 > 0 then
                v39 = "Current damage: <font color=\"rgb(255, 150, 50)\">+" .. v37 * v_u_12 .. "%</font>"
            else
                v39 = nil
            end
            v_u_6.ShowDescription(v38, v39, 0.8)
            EnableEating()
        end
    else
        print("no enable function for", p27)
        return
    end
end
function v22.Enable(p41, p42)
    -- upvalues: (ref) v_u_14, (ref) v_u_19, (ref) v_u_16, (copy) v_u_3, (copy) v_u_40
    v_u_14 = p41
    v_u_19 = p42
    v_u_16 = v_u_3.Character.Humanoid
    v_u_40(p41.Name)
end
function v22.Disable(_)
    -- upvalues: (ref) v_u_18, (ref) v_u_17, (ref) v_u_21, (copy) v_u_6, (ref) v_u_14, (ref) v_u_15
    if v_u_18 then
        v_u_18:Disconnect()
        v_u_18 = nil
    end
    if v_u_17 then
        v_u_17:Disconnect()
        v_u_17 = nil
    end
    v_u_21 = nil
    DisableEating()
    v_u_6.HideDescription()
    v_u_14 = nil
    v_u_15 = nil
end
return v22

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.MedkitModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
HP_0 = 20
k_HP = 0.75
function v_u_1.LevelToHp(p2)
    local v3 = HP_0
    local v4 = k_HP * p2 ^ 2
    return v3 + math.floor(v4)
end
k_price = 100
function v_u_1.LevelToPrice(p5)
    if p5 < 4 then
        return p5 * 25
    else
        return k_price * (p5 - 3) ^ 3
    end
end
v_u_1.MaxLevel = 150
if not game["Run Service"]:IsClient() then
    return v_u_1
end
local v_u_6 = game:GetService("UserInputService")
local v7 = game:GetService("ReplicatedStorage")
local v_u_8 = game.Players.LocalPlayer
local v_u_9 = v_u_8.PlayerGui:WaitForChild("MainGui").GunFrame
local v_u_10 = v_u_9.GunName
local v_u_11 = v_u_9.State
local v_u_12 = v_u_9.UpgradeButton
local v_u_13 = v_u_8.Stats.MedkitLevel
local v_u_14 = Enum.KeyCode.F
local v_u_15 = Enum.KeyCode.ButtonY
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = v7.RemoteEvent.GuiEvent.GuiEventLocal
local v_u_19 = v7.RemoteFunction.MedkitF
local v20 = v7.AllModules
local v_u_21 = require(v20.KeyInputLabelMaker)
local v_u_22 = require(v20.InputManager)
local v_u_23 = require(v20.ToolButtons)
local v_u_24 = require(v20.ConvertVal)
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = nil
function PrintNormalValue()
    -- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_24, (copy) v_u_1, (copy) v_u_13
    v_u_10.Text = "Medkit"
    v_u_11.TextColor3 = Color3.fromRGB(0, 0, 0)
    v_u_11.Text = "+" .. v_u_24.SimpleConversion(v_u_1.LevelToHp(v_u_13.Value)) .. "HP"
    v_u_11.TextStrokeTransparency = 1
end
function PrintUpdatedValue()
    -- upvalues: (copy) v_u_11, (copy) v_u_24, (copy) v_u_1, (copy) v_u_13, (copy) v_u_10
    v_u_11.TextColor3 = Color3.fromRGB(0, 255, 0)
    v_u_11.TextStrokeTransparency = 0
    v_u_11.Text = "+" .. v_u_24.SimpleConversion(v_u_1.LevelToHp(v_u_13.Value + 1)) .. "HP"
    v_u_10.Text = "$" .. v_u_24.SimpleConversion(v_u_1.LevelToPrice(v_u_13.Value + 1))
end
function HealFctn()
    -- upvalues: (ref) v_u_16, (copy) v_u_8, (copy) v_u_19
    if not v_u_16:GetAttribute("AlreadyUsed") then
        if v_u_8.Character:FindFirstChild("Humanoid") and v_u_8.Character.Humanoid.Health == v_u_8.Character.Humanoid.MaxHealth then
            return
        end
        v_u_16:SetAttribute("AlreadyUsed", true)
        v_u_19:InvokeServer("Heal")
    end
end
function BlinkUpgradeBttn(_)
    -- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) v_u_24, (copy) v_u_1
    while v_u_13.Value + 1 <= 150 do
        v_u_12.Text = "Upgrade"
        wait(1.2)
        if v_u_13.Value >= 150 then
            return
        end
        v_u_12.Text = "$" .. v_u_24.SimpleConversion(v_u_1.LevelToPrice(v_u_13.Value + 1))
        wait(1.2)
    end
end
function UpgradeMedkit()
    -- upvalues: (ref) v_u_16, (copy) v_u_8, (copy) v_u_1, (copy) v_u_13, (copy) v_u_18, (copy) v_u_19, (ref) v_u_17, (copy) v_u_12, (copy) v_u_22, (copy) v_u_24
    if v_u_16:GetAttribute("AlreadyUsed") then
        return
    elseif v_u_8.leaderstats.Cash.Value < v_u_1.LevelToPrice(v_u_13.Value + 1) then
        v_u_18:Fire("WrongMessage", "Not enough cash!")
        return
    elseif v_u_16:GetAttribute("IsBuying") then
        return
    else
        game.SoundService.Sound.BuySound:Play()
        v_u_16:SetAttribute("IsBuying", true)
        local v30 = v_u_19:InvokeServer("Upgrade")
        v_u_16:SetAttribute("IsBuying", false)
        if v30 then
            if v_u_13.Value >= 150 then
                DisconnectUpgradeBttn()
                if v_u_17 then
                    v_u_17.Visible = false
                end
                v_u_12.AutoButtonColor = false
                v_u_12.Text = "Maxed out"
                PrintNormalValue()
            elseif v_u_22.LastInputType == "PC" then
                PrintUpdatedValue()
            else
                PrintNormalValue()
                local v31 = v_u_12.Text
                if tonumber(v31:sub(2, -2)) then
                    v_u_12.Text = "$" .. v_u_24.SimpleConversion(v_u_1.LevelToPrice(v_u_13.Value + 1))
                    return
                end
            end
        else
            return
        end
    end
end
function MakeInputs(p32)
    -- upvalues: (copy) v_u_14, (copy) v_u_6, (copy) v_u_13, (ref) v_u_27, (copy) v_u_15, (ref) v_u_17, (copy) v_u_21, (copy) v_u_12, (copy) v_u_23
    DisconnectKeyUpgrade()
    local v33 = {
        ["Image"] = "rbxassetid://13888579862",
        ["ImageSize"] = UDim2.fromScale(1.4, 1.4)
    }
    local v34 = nil
    if p32 == "PC" then
        v34 = v_u_14
        v33.Text = v_u_6:GetStringForKeyCode(v34)
    elseif p32 == "Gamepad" then
        v34 = Enum.KeyCode.ButtonX
        if v_u_13.Value < 150 then
            v_u_27 = v_u_6.InputBegan:Connect(function(p35, p36)
                -- upvalues: (ref) v_u_15
                if not p36 and p35.KeyCode == v_u_15 then
                    UpgradeMedkit()
                end
            end)
            if v_u_17 then
                v_u_17.Visible = true
            else
                v_u_17 = v_u_21.ShowKeyInputImage(v_u_12, v_u_15, {
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                    ["Position"] = UDim2.fromScale(-0.075, 0.5),
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Size"] = UDim2.fromScale(0.95, 0.95)
                })
            end
        end
    end
    v_u_23.EnableButton("ReloadBttn", v33, v34, HealFctn)
end
function v_u_1.Enable(p37)
    -- upvalues: (ref) v_u_16, (copy) v_u_12, (copy) v_u_9, (copy) v_u_10, (copy) v_u_22, (copy) v_u_18, (copy) v_u_6, (copy) v_u_14, (copy) v_u_1, (copy) v_u_13, (ref) v_u_25, (ref) v_u_26, (ref) v_u_29, (ref) v_u_28
    v_u_16 = p37
    local v38 = v_u_9
    v_u_12.Visible = true
    v38.Visible = true
    v_u_9.BackgroundColor3 = Color3.fromRGB(210, 210, 210)
    v_u_10.BackgroundColor3 = Color3.fromRGB(65, 255, 65)
    v_u_12.BackgroundColor3 = Color3.fromRGB(210, 210, 210)
    PrintNormalValue()
    if not p37:GetAttribute("AlreadyUsed") then
        if v_u_22.LastInputType == "PC" then
            v_u_18:Fire("Notification", "Press " .. v_u_6:GetStringForKeyCode(v_u_14) .. " to regen " .. v_u_1.LevelToHp(v_u_13.Value) .. " HP")
        end
        v_u_22.ConnectToInputChanged(MakeInputs, "Medkit")
    end
    if v_u_13.Value < 150 then
        v_u_25 = v_u_12.MouseEnter:Connect(PrintUpdatedValue)
        v_u_26 = v_u_12.MouseLeave:Connect(PrintNormalValue)
        if v_u_22.LastInputType ~= "PC" then
            v_u_29 = task.spawn(BlinkUpgradeBttn)
        end
        v_u_28 = v_u_12.Activated:Connect(UpgradeMedkit)
    else
        v_u_12.AutoButtonColor = false
        v_u_12.Text = "Maxed out"
    end
end
function DisconnectKeyUpgrade()
    -- upvalues: (ref) v_u_27, (ref) v_u_17
    if v_u_27 then
        v_u_27:Disconnect()
        v_u_27 = nil
    end
    if v_u_17 then
        v_u_17.Visible = false
    end
end
function DisconnectUpgradeBttn()
    -- upvalues: (ref) v_u_25, (ref) v_u_26, (ref) v_u_28
    if v_u_25 then
        v_u_25:Disconnect()
        v_u_26:Disconnect()
        v_u_25 = nil
        v_u_26 = nil
    end
    if v_u_28 then
        v_u_28:Disconnect()
        v_u_28 = nil
    end
    DisconnectKeyUpgrade()
end
function v_u_1.Disable()
    -- upvalues: (ref) v_u_16, (copy) v_u_9, (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (copy) v_u_23, (copy) v_u_22, (ref) v_u_29
    v_u_16 = nil
    v_u_9.Visible = false
    v_u_12.AutoButtonColor = true
    v_u_11.TextStrokeTransparency = 1
    v_u_12.Text = "Upgrade"
    local v39 = v_u_9
    v_u_12.Visible = false
    v39.Visible = false
    v_u_9.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    v_u_10.BackgroundColor3 = Color3.fromRGB(0, 157, 255)
    v_u_12.BackgroundColor3 = Color3.fromRGB(30, 30, 255)
    v_u_11.TextColor3 = Color3.fromRGB(0, 0, 0)
    v_u_23.DisableButton("ReloadBttn")
    v_u_22.Disconnect("Medkit")
    if v_u_29 then
        task.cancel(v_u_29)
        v_u_29 = nil
    end
    DisconnectUpgradeBttn()
end
return v_u_1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.SpringHandModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = v_u_4:GetMouse()
local v_u_6 = false
local v_u_7 = false
local v_u_8 = nil
local v_u_9 = Enum.KeyCode.R
local v_u_10 = Enum.KeyCode.ButtonX
local v11 = v2.AllModules
local v_u_12 = require(v11.KeyInputLabelMaker)
local v_u_13 = require(v11.InputManager)
local v_u_14 = require(v11.ToolButtons)
local v15 = v_u_4.PlayerGui:WaitForChild("MainGui")
local v_u_16 = script.SpringHandLabel
local v_u_17 = nil
v_u_16.Parent = v15
local v_u_18 = 0
local v_u_19 = v2.RemoteEvent.SpringHandEvent
local v_u_20 = RaycastParams.new()
v_u_20.FilterType = Enum.RaycastFilterType.Exclude
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = nil
local v_u_24 = nil
local v_u_25 = false
local v26 = {}
function SpringHandChecker(p27, p28)
    -- upvalues: (copy) v_u_4, (ref) v_u_20, (copy) v_u_19, (ref) v_u_6
    local v29 = { v_u_4.Character, workspace.Terrain:FindFirstChild("BordersParts") }
    local v30 = workspace.Camera:ScreenPointToRay(p27, p28)
    local v31 = 0
    while v31 < 50000 do
        v_u_20 = RaycastParams.new()
        v_u_20.FilterDescendantsInstances = v29
        local v32 = workspace:Raycast(v30.Origin + v30.Direction * v31, v30.Direction * 15000, v_u_20)
        if v32 and v32.Instance then
            v_u_19:FireServer("Fire", v32.Instance, (CFrame.new(v32.Position)))
            v_u_6 = true
            return true
        end
        v31 = v31 + 15000
    end
    return false
end
function TrackCursor()
    -- upvalues: (ref) v_u_7, (copy) v_u_16, (ref) v_u_6, (copy) v_u_5, (ref) v_u_18, (copy) v_u_3
    if not v_u_7 then
        v_u_7 = true
        v_u_16.Visible = true
        while v_u_6 do
            v_u_16.Position = UDim2.fromOffset(v_u_5.X, v_u_5.Y - v_u_18)
            v_u_3.RenderStepped:Wait()
        end
        v_u_7 = false
        v_u_16.Visible = false
    end
end
function DisconnectSpringHandFire_C()
    -- upvalues: (ref) v_u_21, (ref) v_u_24
    if v_u_21 and v_u_21.Connected then
        v_u_21:Disconnect()
    end
    if v_u_24 and v_u_24.Connected then
        v_u_24:Disconnect()
    end
end
function Release()
    -- upvalues: (copy) v_u_16, (ref) v_u_6, (copy) v_u_19, (copy) v_u_14, (copy) v_u_13, (ref) v_u_25
    v_u_16.Visible = false
    if v_u_6 then
        v_u_19:FireServer("Stop", nil, nil)
        v_u_14.DisableButton("MainToolButton")
        v_u_13.Disconnect("SpringHandRelease")
        v_u_6 = false
        v_u_25 = false
    end
end
function MakeReleaseInputs(p33)
    -- upvalues: (ref) v_u_8, (copy) v_u_16, (ref) v_u_17, (copy) v_u_1, (copy) v_u_9, (ref) v_u_18, (copy) v_u_10, (copy) v_u_12, (copy) v_u_14, (ref) v_u_25
    local v34 = {
        ["Image"] = v_u_8.TextureId
    }
    local v35 = nil
    if p33 == "Mobile" then
        v34.Text = "X"
        v34.TextColor3 = Color3.new(1)
        v_u_16.Visible = false
        if v_u_17 then
            v_u_17.Visible = false
        end
    elseif p33 == "PC" then
        v_u_16.Text = v_u_1:GetStringForKeyCode(v_u_9) .. "-Release"
        if v_u_17 then
            v_u_17.Visible = false
        end
        v35 = v_u_9
        v34.Text = v_u_1:GetStringForKeyCode("R")
        v_u_18 = 0
        task.spawn(TrackCursor)
    else
        v_u_16.Text = "-Release"
        v35 = v_u_10
        local v36 = {
            ["Position"] = UDim2.new(0, 0, 0.5, 0),
            ["Size"] = UDim2.fromScale(2, 2),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
            ["AnchorPoint"] = Vector2.new(1, 0.5)
        }
        v_u_17 = v_u_12.ShowKeyInputImage(v_u_16, v_u_10, v36)
        v_u_18 = 10
        task.spawn(TrackCursor)
    end
    v_u_14.EnableButton("MainToolButton", v34, v35, nil, nil, Release)
    v_u_25 = true
end
function MakeSpringHandFireInputs(p37)
    -- upvalues: (ref) v_u_21, (copy) v_u_1, (ref) v_u_24, (ref) v_u_8, (copy) v_u_5
    DisconnectSpringHandFire_C()
    if p37 == "Mobile" then
        v_u_21 = v_u_1.TouchStarted:Connect(function(p_u_38, p39)
            -- upvalues: (ref) v_u_24, (ref) v_u_1
            if not p39 then
                local v_u_40 = p_u_38.Position
                local v_u_41 = time()
                v_u_24 = v_u_1.TouchEnded:Connect(function(p42, p43)
                    -- upvalues: (copy) p_u_38, (copy) v_u_41, (copy) v_u_40
                    if p43 then
                        return
                    elseif p42 == p_u_38 then
                        if time() - v_u_41 <= 0.6 and (v_u_40 - p42.Position).Magnitude <= 10 then
                            SpringHandFire(p42.Position.X, p42.Position.Y)
                        end
                    else
                        return
                    end
                end)
            end
        end)
    else
        v_u_21 = v_u_8.Activated:Connect(function()
            -- upvalues: (ref) v_u_5
            SpringHandFire(v_u_5.X, v_u_5.Y)
        end)
    end
end
function SpringHandFire(p44, p45)
    -- upvalues: (ref) v_u_25, (copy) v_u_13
    if SpringHandChecker(p44, p45) and not v_u_25 then
        v_u_13.ConnectToInputChanged(MakeReleaseInputs, "SpringHandRelease")
    end
end
function v26.Enable(p46)
    -- upvalues: (ref) v_u_8, (copy) v_u_13, (ref) v_u_22, (ref) v_u_23
    v_u_8 = p46
    v_u_13.ConnectToInputChanged(MakeSpringHandFireInputs, "SpringHandFire")
    local v_u_47 = p46:FindFirstChild("SpringConstraint")
    if v_u_47 then
        v_u_22 = v_u_47:GetPropertyChangedSignal("Attachment1"):Connect(function()
            -- upvalues: (copy) v_u_47, (ref) v_u_23
            local v_u_48 = v_u_47.Attachment1
            if v_u_23 then
                v_u_23:Disconnect()
            end
            if not v_u_48 then
                Release()
            end
            v_u_23 = v_u_48.AncestryChanged:Connect(function()
                -- upvalues: (copy) v_u_48
                if not v_u_48:IsDescendantOf(workspace) then
                    Release()
                end
            end)
        end)
    end
end
function v26.Disable()
    -- upvalues: (ref) v_u_22, (ref) v_u_23, (copy) v_u_13
    DisconnectSpringHandFire_C()
    if v_u_22 and v_u_22.Connected then
        v_u_22:Disconnect()
    end
    if v_u_23 and v_u_23.Connected then
        v_u_23:Disconnect()
    end
    v_u_13.Disconnect("SpringHandFire")
    Release()
end
v_u_19.OnClientEvent:Connect(Release)
return v26

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.PotionModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("StarterPlayer")
local v4 = game:GetService("Players")
local v_u_5 = Enum.KeyCode.F
local v_u_6 = Enum.KeyCode.DPadRight
local v_u_7 = Enum.KeyCode.DPadLeft
local v_u_8 = v4.LocalPlayer
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = v2.RemoteEvent.SizeEvent
local v_u_12 = v_u_8.PlayerGui.MainGui.LowerFrameContainer.PotionFrame
local v_u_13 = v_u_12.ValueLabel
local v_u_14 = v_u_12.SelectFrame
local v_u_15 = v_u_14.SelectedValLabel
local v_u_16 = v_u_14.UIGradient
local v17 = v_u_12.Minus
local v18 = v_u_12.Plus
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = require(v2.AllModules.CharacterSize.GetSizeValue)
local v_u_22 = require(v2.AllModules.KeyInputLabelMaker)
local v_u_23 = require(v2.AllModules.ToolButtons)
local v_u_24 = require(v2.AllModules.InputManager)
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = nil
local v_u_32 = false
local v_u_33 = v3.CharacterWalkSpeed
local v_u_34 = v3.CharacterJumpHeight
local v_u_35 = v3.CameraMaxZoomDistance
local v_u_36 = nil
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = nil
local v_u_40 = nil
local v_u_41 = nil
local v_u_42 = nil
local v_u_43 = game:GetService("SoundService"):WaitForChild("Sound"):WaitForChild("ClickSound")
local v_u_44 = nil
function GetRatio(p45)
    -- upvalues: (copy) v_u_14
    local v46 = (p45.Position.X - v_u_14.AbsolutePosition.X) / v_u_14.AbsoluteSize.X
    return math.clamp(v46, 0, 1)
end
function ColorSequenceFromRatio(p47)
    if p47 <= 0 then
        return ColorSequence.new(Color3.fromRGB(255, 255, 255))
    end
    if p47 >= 1 then
        return ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0, 1, 0)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)) })
    end
    if p47 < 0.5 then
        local v48 = ColorSequence.new
        local v49 = {}
        local v50 = ColorSequenceKeypoint.new(0, Color3.new(0, 1, 0))
        local v51 = ColorSequenceKeypoint.new(p47, Color3.new(0, 1, 0):Lerp(Color3.new(1, 1, 0), p47 / 0.5))
        local v52 = ColorSequenceKeypoint.new
        local v53 = p47 + 0.001
        local v54 = v52(math.min(v53, 1), Color3.new(0, 0, 0))
        local v55 = ColorSequenceKeypoint.new
        local v56 = p47 + 0.013
        local v57 = v55(math.min(v56, 1), Color3.new(0, 0, 0))
        local v58 = ColorSequenceKeypoint.new
        local v59 = p47 + 0.014
        __set_list(v49, 1, {v50, v51, v54, v57, v58(math.min(v59, 1), Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))})
        return v48(v49)
    end
    local v60 = ColorSequence.new
    local v61 = {}
    local v62 = ColorSequenceKeypoint.new(0, Color3.new(0, 1, 0))
    local v63 = ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 0))
    local v64 = ColorSequenceKeypoint.new(p47, Color3.new(1, 1, 0):Lerp(Color3.new(1, 0, 0), (p47 - 0.5) / 0.5))
    local v65 = ColorSequenceKeypoint.new
    local v66 = p47 + 0.001
    local v67 = v65(math.min(v66, 1), Color3.new(0, 0, 0))
    local v68 = ColorSequenceKeypoint.new
    local v69 = p47 + 0.013
    local v70 = v68(math.min(v69, 1), Color3.new(0, 0, 0))
    local v71 = ColorSequenceKeypoint.new
    local v72 = p47 + 0.014
    __set_list(v61, 1, {v62, v63, v64, v67, v70, v71(math.min(v72, 1), Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))})
    return v60(v61)
end
local v_u_73 = 10
function OnPlusActivated()
    -- upvalues: (copy) v_u_43, (ref) v_u_37, (ref) v_u_39, (ref) v_u_73
    v_u_43:Play()
    local v74 = v_u_37
    local v75 = (v_u_39 // v_u_73 + 1) * v_u_73
    local v76 = math.min(v74, v75)
    local v77 = v_u_39 < 100 and v76 > 100 and 100 or v76
    PrintValueAndSelect(nil, true, v77)
end
function OnMinusActivated()
    -- upvalues: (copy) v_u_43, (ref) v_u_36, (ref) v_u_39, (ref) v_u_73
    v_u_43:Play()
    local v78 = v_u_36
    local v79 = (v_u_39 // v_u_73 - (v_u_39 % v_u_73 == 0 and 1 or 0)) * v_u_73
    local v80 = math.max(v78, v79)
    local v81 = v_u_39 > 100 and v80 < 100 and 100 or v80
    PrintValueAndSelect(nil, true, v81)
end
function OnPotionButtonActivated(p_u_82)
    -- upvalues: (ref) v_u_32, (ref) v_u_26, (copy) v_u_1, (ref) v_u_27
    if v_u_32 or p_u_82.UserInputType ~= Enum.UserInputType.Touch and p_u_82.UserInputType ~= Enum.UserInputType.MouseButton1 then
        return
    elseif p_u_82.UserInputType ~= Enum.UserInputType.Touch or p_u_82.Delta.Magnitude <= 0 then
        v_u_32 = true
        v_u_26 = v_u_1.InputChanged:Connect(function(p83)
            -- upvalues: (copy) p_u_82
            if p83 == p_u_82 or p83.UserInputType == Enum.UserInputType.MouseMovement then
                local v84 = GetRatio(p83)
                PrintValueAndSelect(v84, true)
            end
        end)
        v_u_27 = v_u_1.InputEnded:Connect(function(p85)
            -- upvalues: (copy) p_u_82, (ref) v_u_27, (ref) v_u_26, (ref) v_u_32
            if p85 == p_u_82 or p85.UserInputType == Enum.UserInputType.MouseButton1 then
                local v86 = GetRatio(p85)
                PrintValueAndSelect(v86, true)
                v_u_27:Disconnect()
                v_u_26:Disconnect()
                v_u_32 = false
            end
        end)
        local v87 = GetRatio(p_u_82)
        PrintValueAndSelect(v87, true)
    end
end
function PrintValueAndSelect(p88, p89, p90)
    -- upvalues: (ref) v_u_36, (ref) v_u_37, (copy) v_u_16, (ref) v_u_39, (copy) v_u_15
    local v91 = p88 or (math.floor(p90) - v_u_36) / (v_u_37 - v_u_36)
    v_u_16.Color = ColorSequenceFromRatio(v91)
    local v92 = p90 or v_u_36 + v91 * (v_u_37 - v_u_36)
    v_u_39 = math.floor(v92)
    if p89 then
        v_u_15.Text = GetSringForPrct(v_u_39)
    else
        v_u_15.Text = ""
    end
end
function MakeDrinkInputs(p93)
    -- upvalues: (ref) v_u_9, (ref) v_u_19, (ref) v_u_20, (copy) v_u_22, (copy) v_u_14, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5, (copy) v_u_1, (copy) v_u_23
    local v94 = {
        ["Image"] = v_u_9.TextureId,
        ["Size"] = UDim2.fromScale(0.8, 0.8)
    }
    local v95 = nil
    if p93 == "Mobile" then
        if v_u_19 then
            v_u_19.Visible = false
            v_u_20.Visible = false
        end
        v94.Text = "Drink"
    elseif p93 == "Gamepad" then
        v95 = Enum.KeyCode.ButtonX
        v94.Text = "Drink"
        if v_u_19 then
            local v96 = v_u_20
            v_u_19.Visible = true
            v96.Visible = true
        else
            v_u_19 = v_u_22.ShowKeyInputImage(v_u_14, v_u_7, {
                ["Size"] = UDim2.fromScale(1.35, 1.35),
                ["Position"] = UDim2.fromScale(0.02, 0.5),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
            }, "MinusFrame")
            v_u_20 = v_u_22.ShowKeyInputImage(v_u_14, v_u_6, {
                ["Size"] = UDim2.fromScale(1.35, 1.35),
                ["Position"] = UDim2.fromScale(0.98, 0.5),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
            }, "PlusFrame")
        end
    else
        if v_u_19 then
            v_u_19.Visible = false
            v_u_20.Visible = false
        end
        v95 = v_u_5
        v94.Text = v_u_1:GetStringForKeyCode(v_u_5)
    end
    v_u_23.EnableButton("DrinkBttn", v94, v95, AskToDrink)
end
function EnableDrinkButton()
    -- upvalues: (copy) v_u_24
    v_u_24.ConnectToInputChanged(MakeDrinkInputs, "DrinkPotion")
end
function DisableDrinkButton()
    -- upvalues: (copy) v_u_23, (copy) v_u_24
    v_u_23.DisableButton("DrinkBttn")
    v_u_24.Disconnect("DrinkPotion")
end
function DrinkBoost()
    -- upvalues: (ref) v_u_9, (ref) v_u_39, (ref) v_u_41, (ref) v_u_44, (ref) v_u_42, (copy) v_u_8
    v_u_9:SetAttribute("Drinking", true)
    DisableDrinkButton()
    local v97 = v_u_39
    local v98 = v_u_41()
    v_u_44:Play()
    local v99 = v_u_9
    local v100 = v_u_42
    task.wait(0.7)
    local v101 = v99:FindFirstChild("Handle")
    if v101 then
        v101 = v99.Handle:FindFirstChild("DrinkSound")
    end
    if v101 then
        v101:Play()
    end
    task.wait(1)
    local v102 = (v97 - v98) / 50
    for v103 = 1, 50 do
        v100(v98 + v103 * v102, v103 == 50)
        task.wait(0.04)
    end
    task.wait(0.5)
    v99:SetAttribute("Drinking", false)
    if v99.Parent == v_u_8.Character then
        EnableDrinkButton()
    end
end
function AskToDrink()
    -- upvalues: (ref) v_u_9, (ref) v_u_39, (ref) v_u_41, (ref) v_u_44
    if v_u_9:GetAttribute("Drinking") then
        return
    elseif v_u_39 ~= v_u_41() then
        local v104 = v_u_9.Unequipped:Once(function()
            -- upvalues: (ref) v_u_44
            if v_u_44.IsPlaying then
                v_u_44:Stop()
            end
        end)
        DrinkBoost()
        if v104 then
            v104:Disconnect()
        end
    end
end
local v105 = {}
function OnMinOrMaxChanged()
    -- upvalues: (ref) v_u_36, (ref) v_u_9, (ref) v_u_37, (ref) v_u_73, (ref) v_u_41
    v_u_36 = v_u_9:GetAttribute("Min")
    v_u_37 = v_u_9:GetAttribute("Max")
    local v106 = v_u_37 - v_u_36
    if v106 <= 100 then
        v_u_73 = 10
    else
        local v107 = v106 / 100
        local v108 = math.log(v107, 10)
        local v109 = math.floor(v108)
        local v110 = v106 / 10 ^ v109
        if v110 < 200 then
            v_u_73 = 10 ^ v109 * 10
        elseif v110 < 400 then
            v_u_73 = 10 ^ v109 * 20
        elseif v110 < 1000 then
            v_u_73 = 10 ^ v109 * 50
        end
    end
    PrintValueAndSelect(nil, nil, v_u_41())
end
function GetSringForPrct(p111)
    local v112 = p111 / 10
    return "\195\151" .. math.floor(v112) / 10
end
function PrintCurrentValue()
    -- upvalues: (copy) v_u_13, (ref) v_u_38, (ref) v_u_41
    v_u_13.Text = v_u_38 .. GetSringForPrct(v_u_41())
end
function v105.Enable(p113, p114)
    -- upvalues: (ref) v_u_44, (ref) v_u_9, (ref) v_u_10, (copy) v_u_8, (copy) v_u_12, (ref) v_u_38, (ref) v_u_31, (ref) v_u_41, (copy) v_u_33, (ref) v_u_42, (copy) v_u_34, (ref) v_u_40, (copy) v_u_21, (copy) v_u_11, (copy) v_u_35, (ref) v_u_28, (ref) v_u_29, (ref) v_u_25, (copy) v_u_14, (ref) v_u_30, (copy) v_u_1, (copy) v_u_7, (copy) v_u_6
    v_u_44 = p114
    v_u_9 = p113
    v_u_10 = v_u_8.Character.Humanoid
    v_u_12.Visible = true
    if p113.Name == "Speed potion" then
        v_u_38 = "Walk speed: "
        v_u_31 = v_u_10:GetPropertyChangedSignal("WalkSpeed"):Connect(PrintCurrentValue)
        v_u_41 = function()
            -- upvalues: (ref) v_u_10, (ref) v_u_33
            return v_u_10.WalkSpeed / v_u_33 * 100
        end
        v_u_42 = function(p115)
            -- upvalues: (ref) v_u_10, (ref) v_u_33
            v_u_10.WalkSpeed = p115 * v_u_33 / 100
        end
    elseif p113.Name == "Jump potion" then
        v_u_38 = "Jump height: "
        v_u_31 = v_u_10:GetPropertyChangedSignal("JumpHeight"):Connect(PrintCurrentValue)
        v_u_41 = function()
            -- upvalues: (ref) v_u_10, (ref) v_u_34
            return v_u_10.JumpHeight / v_u_34 * 100
        end
        v_u_42 = function(p116)
            -- upvalues: (ref) v_u_10, (ref) v_u_34
            v_u_10.JumpHeight = p116 * v_u_34 / 100
        end
    else
        v_u_38 = "Size: "
        v_u_40 = v_u_21(v_u_8.Character)
        if not v_u_40 then
            warn("No size value")
            return
        end
        v_u_41 = function()
            -- upvalues: (ref) v_u_40
            return v_u_40.Value * 100
        end
        v_u_31 = v_u_40.Changed:Connect(PrintCurrentValue)
        v_u_42 = function(p117, p118)
            -- upvalues: (ref) v_u_10, (ref) v_u_11, (ref) v_u_8, (ref) v_u_35
            if v_u_10.Health > 0 then
                v_u_11:FireServer(p117 / 100, p118)
                local v119 = v_u_8
                local v120 = p117 / 100
                v119.CameraMaxZoomDistance = math.sqrt(v120) * v_u_35
            end
        end
    end
    v_u_28 = p113:GetAttributeChangedSignal("Min"):Connect(OnMinOrMaxChanged)
    v_u_29 = p113:GetAttributeChangedSignal("Max"):Connect(OnMinOrMaxChanged)
    OnMinOrMaxChanged()
    PrintCurrentValue()
    if not p113:GetAttribute("Drinking") then
        EnableDrinkButton()
    end
    v_u_25 = v_u_14.InputBegan:Connect(OnPotionButtonActivated)
    v_u_30 = v_u_1.InputBegan:Connect(function(p121, p122)
        -- upvalues: (ref) v_u_7, (ref) v_u_6
        if p122 then
            return
        elseif p121.KeyCode == v_u_7 then
            OnMinusActivated()
        elseif p121.KeyCode == v_u_6 then
            OnPlusActivated()
        end
    end)
end
function v105.Disable()
    -- upvalues: (ref) v_u_25, (ref) v_u_30, (ref) v_u_31, (ref) v_u_28, (ref) v_u_29, (copy) v_u_12, (ref) v_u_32
    if v_u_25 then
        v_u_25:Disconnect()
        v_u_25 = nil
    end
    if v_u_30 then
        v_u_30:Disconnect()
        v_u_30 = nil
    end
    if v_u_31 then
        v_u_31:Disconnect()
        v_u_31 = nil
    end
    if v_u_28 then
        v_u_28:Disconnect()
        v_u_28 = nil
    end
    if v_u_29 then
        v_u_29:Disconnect()
        v_u_29 = nil
    end
    DisableDrinkButton()
    v_u_12.Visible = false
    v_u_32 = false
end
v18.Activated:Connect(OnPlusActivated)
v17.Activated:Connect(OnMinusActivated)
return v105

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.LaserWeapon
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = v1.RemoteEvent.LaserWeaponFireEvent
local v4 = v1.AllModules
local v_u_5 = require(v4.CharacterSize.GetCharacterScale)
local v_u_6 = require(v4.ToolModules.ToggleAimModule)
local v_u_7 = require(v4.ToolModules.LaserReplicator)
local v_u_8 = require(v4.InputManager)
local v_u_9 = require(v4.WeaponStats)
local v_u_10 = require(v4.ToolButtons)
local v_u_11 = nil
local v_u_12 = v2.LocalPlayer
local v_u_13 = v_u_12:GetMouse()
local v_u_14 = workspace.Camera
local v_u_15 = workspace.Terrain
local v_u_16 = v_u_12.PlayerGui:WaitForChild("MainGui")
local v_u_17 = v_u_16.GunFrame
local v_u_18 = v_u_17.GunName
local v_u_19 = v_u_17.State
local v20 = {}
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = nil
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = nil
local v_u_32 = nil
local v_u_33 = nil
local v_u_34 = 0
local v_u_35 = nil
function CastRay(p36)
    -- upvalues: (ref) v_u_31, (ref) v_u_25, (ref) v_u_29, (copy) v_u_5, (ref) v_u_33, (ref) v_u_30, (copy) v_u_15, (ref) v_u_26, (ref) v_u_24, (copy) v_u_7, (ref) v_u_34, (ref) v_u_35, (copy) v_u_3
    local v37 = nil
    v_u_31 = v_u_31 or v_u_25:FindFirstChild("OnGunAtt")
    if v_u_31 then
        if p36 then
            local v38 = v_u_31.WorldPosition
            local v39 = (p36 - v38).Unit * (v_u_29 and v_u_29 * v_u_5(v_u_33) or 2048)
            if p36 then
                local v40 = RaycastParams.new()
                v40.FilterDescendantsInstances = { v_u_33 }
                if v_u_29 and v_u_30 then
                    v40:AddToFilter({ workspace.ZombieFolder, workspace.CloneFolder })
                end
                v37 = workspace:Raycast(v38, v39, v40)
            end
            local v41, v42
            if v37 and (v37.Position and v37.Instance) then
                v41 = v37.Position
                v42 = v37.Instance
            else
                v41 = v38 + v39
                v42 = v_u_15
            end
            v_u_26 = v_u_26 or v_u_24:FindFirstChildOfClass("Beam")
            local v43 = v_u_7.AddPlrBeam(v_u_33, v41, v42, v_u_26, v_u_30)
            if v_u_35 < v_u_34 then
                v_u_34 = v_u_34 - v_u_35
                v_u_3:FireServer(v_u_24, v43.CFrame, v42)
                return
            end
        else
            v_u_7.RemovePlrAtt(v_u_33, v_u_24)
            v_u_3:FireServer(v_u_24)
        end
    end
end
function FireLoop()
    -- upvalues: (ref) v_u_28, (ref) v_u_34, (ref) v_u_35, (ref) v_u_33, (ref) v_u_32, (copy) v_u_8, (copy) v_u_14, (copy) v_u_16, (copy) v_u_13, (ref) v_u_24
    local v44 = workspace.DistributedGameTime
    local v45 = v_u_28.GetChargeForTime
    v_u_34 = v_u_35
    local v46 = RaycastParams.new()
    v46.FilterDescendantsInstances = { v_u_33 }
    while v_u_32 do
        if v_u_8.LastInputType == "Mobile" then
            local v47 = v_u_14:ScreenPointToRay(v_u_16.AbsoluteSize.X / 2, v_u_16.AbsoluteSize.Y / 2 - 23)
            local v48 = workspace:Raycast(v47.Origin, v47.Direction * 1000000, v46)
            local v49 = CastRay
            if v48 then
                v48 = v48.Position
            end
            v49(v48)
        else
            CastRay(v_u_13.Hit.Position)
        end
        v_u_34 = v_u_34 + task.wait()
        if v45 and v_u_32 then
            v_u_24:SetAttribute("Charge", v45(workspace.DistributedGameTime - v44))
        end
    end
end
function DisconnectInputs()
    -- upvalues: (copy) v_u_10, (ref) v_u_22
    v_u_10.DisableButton("ReloadBttn")
    if MouseUp_C then
        MouseUp_C:Disconnect()
        MouseUp_C = nil
    end
    if v_u_22 then
        v_u_22:Disconnect()
        v_u_22 = nil
    end
end
function MakeInputs(p50)
    -- upvalues: (copy) v_u_6, (copy) v_u_10, (ref) v_u_22, (copy) v_u_13
    DisconnectInputs()
    if p50 == "Mobile" then
        v_u_6(true)
        v_u_10.EnableButton("ReloadBttn", {
            ["Image"] = "rbxassetid://366895201"
        }, nil, StartFiring, StopFiring)
        return
    elseif p50 == "Gamepad" then
        v_u_10.EnableButton("ReloadBttn", {
            ["Image"] = "rbxassetid://366895201"
        }, Enum.KeyCode.ButtonR2, StartFiring, StopFiring)
    else
        v_u_22 = v_u_13.Button1Down:Connect(StartFiring)
        MouseUp_C = v_u_13.Button1Up:Connect(StopFiring)
    end
end
function v20.Enable(p51, p52)
    -- upvalues: (ref) v_u_24, (ref) v_u_33, (copy) v_u_12, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (ref) v_u_28, (copy) v_u_9, (ref) v_u_35, (ref) v_u_29, (ref) v_u_30, (ref) v_u_27, (copy) v_u_8, (ref) v_u_11
    v_u_24 = p51
    local v53 = p51.Name
    v_u_33 = v_u_12.Character
    v_u_17.Visible = true
    v_u_18.Text = p51.Name
    v_u_19.Text = "inf / inf"
    v_u_28 = v_u_9[v53]
    v_u_35 = v_u_28.FiringDelay
    v_u_29 = v_u_28.Range
    v_u_30 = v_u_28.Angle
    if p52 then
        v_u_27 = p52
        p52:Play()
    end
    v_u_8.ConnectToInputChanged(MakeInputs, "WaterGun")
    if v_u_28.GetChargeForTime then
        if not v_u_11 then
            v_u_11 = require(script.ChargeGui)
        end
        v_u_11.Enable(p51)
    end
end
function StartFiring()
    -- upvalues: (ref) v_u_32, (ref) v_u_24, (ref) v_u_28, (ref) v_u_25, (ref) v_u_31, (ref) v_u_23, (ref) v_u_21
    v_u_32 = true
    v_u_24:SetAttribute("Firing", true)
    if v_u_28.MinCharge then
        v_u_24:SetAttribute("Charge", v_u_28.MinCharge)
    end
    v_u_25 = v_u_24:FindFirstChild("Handle")
    local v54 = not v_u_31 and v_u_25
    if v54 then
        v54 = v_u_25:FindFirstChild("OnGunAtt")
    end
    v_u_31 = v54
    local v55 = not v_u_23 and v_u_31
    if v55 then
        v55 = v_u_31:FindFirstChildOfClass("ParticleEmitter")
    end
    v_u_23 = v55
    if v_u_23 then
        v_u_23.Enabled = true
    end
    v_u_21 = task.spawn(FireLoop)
end
function StopFiring()
    -- upvalues: (ref) v_u_32, (ref) v_u_24, (ref) v_u_28, (ref) v_u_23, (ref) v_u_21, (copy) v_u_7, (ref) v_u_33, (copy) v_u_3
    v_u_32 = false
    v_u_24:SetAttribute("Firing", false)
    if v_u_28.MinCharge then
        v_u_24:SetAttribute("Charge", v_u_28.MinCharge)
    end
    if v_u_23 then
        v_u_23.Enabled = false
    end
    if v_u_21 then
        task.cancel(v_u_21)
        v_u_21 = nil
    end
    v_u_7.RemovePlrAtt(v_u_33, v_u_24)
    v_u_3:FireServer(v_u_24)
end
function v20.Disable()
    -- upvalues: (ref) v_u_23, (ref) v_u_24, (ref) v_u_25, (ref) v_u_26, (ref) v_u_28, (ref) v_u_31, (ref) v_u_29, (ref) v_u_30, (copy) v_u_8, (ref) v_u_27, (copy) v_u_6, (copy) v_u_17, (ref) v_u_11
    StopFiring()
    v_u_23 = nil
    v_u_24 = nil
    v_u_25 = nil
    v_u_26 = nil
    v_u_28 = nil
    v_u_31 = nil
    v_u_29 = nil
    v_u_30 = nil
    v_u_8.Disconnect("WaterGun")
    DisconnectInputs()
    if v_u_27 then
        v_u_27:Stop()
        v_u_27 = nil
    end
    if v_u_8.LastInputType == "Mobile" then
        v_u_6(false)
    end
    v_u_17.Visible = false
    if v_u_11 then
        v_u_11.Disable()
    end
end
return v20

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.LaserWeapon.ChargeGui
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("Players").LocalPlayer
local v_u_2 = script.LaserChargeFrame
v_u_2.Parent = v1.PlayerGui:WaitForChild("MainGui").LowerFrameContainer
local v_u_3 = require(game:GetService("ReplicatedStorage").AllModules.WeaponStats)
local v4 = v_u_2.Line
local v_u_5 = v4.UIGradient
local v_u_6 = v4.CurrentCharge
local v_u_7 = v_u_2.ChargeNumTxt
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = Color3.fromRGB(152, 62, 225)
local v_u_13 = Color3.new(1, 1, 1)
local v14 = {}
function PrintCharge()
    -- upvalues: (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (copy) v_u_6, (copy) v_u_5, (copy) v_u_13, (copy) v_u_12, (copy) v_u_7
    local v15 = v_u_9 and v_u_9:GetAttribute("Charge") or v_u_10
    local v16 = (v15 - v_u_10) / (v_u_11 - v_u_10)
    local v17 = math.clamp(v16, 0, 1)
    v_u_6.Position = UDim2.fromScale(v17, 0.5)
    if v17 <= 0 then
        v_u_5.Color = ColorSequence.new(v_u_13)
    elseif v17 >= 0.99 then
        v_u_5.Color = ColorSequence.new(v_u_12)
    else
        v_u_5.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, v_u_12),
            ColorSequenceKeypoint.new(v17, v_u_12),
            ColorSequenceKeypoint.new(v17 + 0.01, v_u_13),
            ColorSequenceKeypoint.new(1, v_u_13)
        })
    end
    local v18 = v_u_7
    local v19 = v15 * 10
    v18.Text = "\195\151" .. math.floor(v19) / 10
end
function v14.Enable(p20)
    -- upvalues: (ref) v_u_9, (copy) v_u_2, (ref) v_u_10, (ref) v_u_11, (copy) v_u_3, (ref) v_u_8
    v_u_9 = p20
    v_u_2.Visible = true
    local v21 = v_u_3[p20.Name].MinCharge
    local v22 = v_u_3[p20.Name].MaxCharge
    v_u_10 = v21
    v_u_11 = v22
    v_u_8 = p20:GetAttributeChangedSignal("Charge"):Connect(PrintCharge)
    PrintCharge()
end
function v14.Disable()
    -- upvalues: (ref) v_u_9, (ref) v_u_8, (copy) v_u_2
    v_u_9 = nil
    if v_u_8 then
        v_u_8:Disconnect()
    end
    PrintCharge()
    v_u_2.Visible = false
end
return v14

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.ToggleAimModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = workspace:WaitForChild("Camera")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = require(game:GetService("ReplicatedStorage").AllModules.CharacterSize.GetCharacterScale)
local v_u_4 = v_u_2:WaitForChild("PlayerGui"):WaitForChild("MainGui").AimImage
function ToggleMobileAim(p5)
    -- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2, (copy) v_u_1
    v_u_4.Visible = p5
    if p5 then
        local v6 = v_u_3(v_u_2.Character)
        local v7 = v_u_2.Character.Humanoid
        local v8 = 2.5 * v6
        v7.CameraOffset = Vector3.new(v8, 0, 0)
        v_u_1.CameraType = Enum.CameraType.Follow
    else
        v_u_2.Character.Humanoid.CameraOffset = Vector3.new(0, 0, 0)
        v_u_1.CameraType = Enum.CameraType.Custom
    end
end
return ToggleMobileAim

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.LocalKeyModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game:GetService("CollectionService")
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game.Players.LocalPlayer
local v_u_3 = require(v_u_2.PlayerScripts.Client_CollectionScript.Client_OnDoorForKeyAdded)
local v_u_4 = require(v1.AllModules.BeamCreator)
local v_u_5 = v_u_2.PlayerGui:WaitForChild("MainGui").LowerFrameContainer.KeyLeftLabel
local v_u_6 = nil
local v_u_7 = nil
return {
    ["Enable"] = function(p8, p9)
        -- upvalues: (copy) v_u_2, (copy) v_u_3, (ref) v_u_6, (copy) v_u_4, (copy) v_u_5, (ref) v_u_7
        local v10 = p8.Name
        local v_u_11 = v_u_2.Stats.Keys[v10]:FindFirstChildOfClass("IntValue")
        local v12 = v_u_3.KeyNameToAtt[v10]
        v_u_6 = v_u_4.ShowBeam("KeyBeam", v12, p9)
        v_u_5.Visible = true
        v_u_5.Text = "Keys left: " .. v_u_11.Value
        v_u_7 = v_u_11.Changed:Connect(function()
            -- upvalues: (ref) v_u_5, (copy) v_u_11
            v_u_5.Text = "Keys left: " .. v_u_11.Value
        end)
        if table.find(v_u_3.MultipleAppearanceDoors, v10) and v12 then
            v_u_3.KeyNameToDoorForKey[v10]:SetAttribute("ClientAskedAppearance", v10)
        end
    end,
    ["Disable"] = function(p13)
        -- upvalues: (ref) v_u_6, (ref) v_u_7, (copy) v_u_5
        local _ = p13.Name
        if v_u_6 then
            v_u_6.Enabled = false
        end
        if v_u_7 then
            v_u_7:Disconnect()
        end
        v_u_5.Visible = false
    end
}
