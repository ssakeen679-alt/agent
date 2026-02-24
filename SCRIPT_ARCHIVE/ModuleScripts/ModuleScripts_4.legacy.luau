
--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.PlacablesModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("Workspace")
local v_u_4 = v_u_1.RemoteEvent.PlacableEvent
local v5 = v_u_1.AllModules
local v_u_6 = require(v5.ToolModules.ToolDescriptionWriter)
local v_u_7 = require(v5.CharacterSize.GetCharacterScale)
local v_u_8 = require(v5.ToolModules.ToggleAimModule)
local v_u_9 = require(v5.InputManager)
local v_u_10 = require(v5.ToolButtons)
local v_u_11 = require(v5.BeamCreator)
local v_u_12 = v_u_1.Tools.Placables
local v_u_13 = v_u_3.Camera
local v_u_14 = game.Players.LocalPlayer
local v_u_15 = workspace.Terrain.MainTerrainPart
local v_u_16 = v_u_14:GetMouse()
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = (-1 / 0)
local v_u_20 = false
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = game:GetService("SoundService").Sound.PlacementSound
local v_u_24 = v_u_14:WaitForChild("PlayerGui"):WaitForChild("MainGui")
local v_u_25 = script.MineLabel
v_u_25.Parent = v_u_24
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = nil
local v_u_32 = nil
local v_u_33 = nil
local v_u_34 = v_u_16.X
local v_u_35 = v_u_16.Y
local v_u_36 = nil
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = nil
local v40 = {}
local v_u_41 = 0
function PlaceLoop()
    -- upvalues: (ref) v_u_34, (ref) v_u_35, (ref) v_u_21
    while true do
        PlaceLocalMine(v_u_34, v_u_35, v_u_21)
        task.wait()
    end
end
function PlaceClickLabel()
    -- upvalues: (copy) v_u_25, (copy) v_u_16
    v_u_25.Visible = true
    while true do
        v_u_25.Position = UDim2.fromOffset(v_u_16.X, v_u_16.Y)
        task.wait()
    end
end
function PlaceLocalMine(p42, p43, p44)
    -- upvalues: (copy) v_u_13, (copy) v_u_3, (ref) v_u_39, (ref) v_u_18, (copy) v_u_1, (ref) v_u_41, (ref) v_u_38, (copy) v_u_15, (ref) v_u_17
    local v45 = v_u_13:ScreenPointToRay(p42, p43)
    local v46 = v_u_3:Raycast(v45.Origin, v45.Direction * 100, v_u_39)
    if v46 then
        local v47 = v46.Position
        v_u_18.Parent = workspace
        v_u_18:PivotTo(CFrame.lookAlong(v47, v46.Normal) * CFrame.Angles(0, 0, v_u_41))
        local v48 = IsDistOk(v47, p44)
        if v48 and v_u_38 == "Flower turret" then
            v48 = v46.Instance == v_u_15.Value
        end
        v_u_17.Color3 = v48 and Color3.new(0, 1, 0) or Color3.new(1)
    else
        v_u_18.Parent = v_u_1
    end
end
function IsDistOk(p49, p50)
    -- upvalues: (ref) v_u_20, (copy) v_u_7, (copy) v_u_14
    v_u_20 = Vector2.new(p49.X - p50.Position.X, p49.Z - p50.Position.Z).Magnitude < 15 * v_u_7(v_u_14.Character) ^ 0.8
    return v_u_20
end
function PlaceOnServer()
    -- upvalues: (ref) v_u_20, (ref) v_u_19, (copy) v_u_23, (copy) v_u_4, (ref) v_u_38, (ref) v_u_18
    if v_u_20 then
        local v51 = time()
        if v51 - v_u_19 >= 0.4 then
            v_u_19 = v51
            v_u_23:Play()
            v_u_4:FireServer("Place", v_u_38, v_u_18:GetPivot())
        end
    else
        return
    end
end
function ExplodeMineOnServer()
    -- upvalues: (copy) v_u_4, (ref) v_u_38
    v_u_4:FireServer("Explode", v_u_38)
end
function MakeExplodeInput(p52)
    -- upvalues: (copy) v_u_10, (ref) v_u_27, (ref) v_u_36, (ref) v_u_33
    DisconnectExplode()
    if p52 == "Mobile" then
        v_u_10.EnableButton("MainToolButton", {
            ["Image"] = "rbxassetid://42103748"
        }, nil, nil, nil, ExplodeMineOnServer)
    elseif p52 == "PC" then
        v_u_27 = v_u_36.Activated:Connect(ExplodeMineOnServer)
        if not v_u_33 then
            v_u_33 = task.spawn(PlaceClickLabel)
            return
        end
    elseif p52 == "Gamepad" then
        v_u_10.EnableButton("MainToolButton", {
            ["Image"] = "rbxassetid://42103748"
        }, Enum.KeyCode.ButtonX, ExplodeMineOnServer)
    end
end
function DisconnectExplode()
    -- upvalues: (ref) v_u_33, (copy) v_u_25, (copy) v_u_10, (ref) v_u_27
    if v_u_33 then
        task.cancel(v_u_33)
        v_u_33 = nil
    end
    v_u_25.Visible = false
    v_u_10.DisableButton("MainToolButton")
    if v_u_27 then
        v_u_27:Disconnect()
        v_u_27 = nil
    end
end
function DisableExplode()
    -- upvalues: (copy) v_u_9
    DisconnectExplode()
    v_u_9.Disconnect("ExplodeMine")
end
local v_u_53 = false
local v_u_54 = 0
function StartRotating()
    -- upvalues: (ref) v_u_53, (ref) v_u_54, (ref) v_u_41
    if not v_u_53 then
        v_u_53 = true
        local v55 = 0
        local v56 = 0
        while v_u_53 and v55 < 0.15 do
            local v57 = v55 / 0.15 * 3.141592653589793 / 2
            v_u_54 = 3.141592653589793 * math.sin(v57)
            v_u_41 = v_u_41 + v_u_54 * v56
            v56 = task.wait()
            v55 = v55 + v56
        end
        while v_u_53 do
            v_u_54 = 3.141592653589793
            v_u_41 = v_u_41 + v56 * 3.141592653589793
            v56 = task.wait()
        end
    end
end
function StopRotating(p58)
    -- upvalues: (ref) v_u_53, (ref) v_u_41, (ref) v_u_54
    if v_u_53 then
        if p58 == true then
            v_u_53 = false
        else
            local v59 = 0
            local v60 = 0
            v_u_53 = false
            while not v_u_53 and v59 < 0.25 do
                local v61 = v_u_41
                local v62 = v_u_54
                local v63 = v59 / 0.25 * 3.141592653589793 / 2
                v_u_41 = v61 + v62 * math.cos(v63) * v60
                v60 = task.wait()
                v59 = v59 + v60
            end
        end
    else
        return
    end
end
function MakePlacingInput(p64)
    -- upvalues: (copy) v_u_8, (ref) v_u_34, (ref) v_u_35, (copy) v_u_24, (copy) v_u_2, (ref) v_u_29, (copy) v_u_13, (copy) v_u_10, (ref) v_u_36, (copy) v_u_16, (copy) v_u_25, (ref) v_u_26, (ref) v_u_32
    DisconnectPlacing()
    local v65 = nil
    if p64 == "Mobile" then
        v_u_8(true)
        local v66 = v_u_24.AbsoluteSize.X / 2
        local v67 = v_u_24.AbsoluteSize.Y / 2 - v_u_2.TopbarInset.Height / 2
        v_u_34 = v66
        v_u_35 = v67
        v_u_29 = v_u_13:GetPropertyChangedSignal("ViewportSize"):Connect(function()
            -- upvalues: (ref) v_u_34, (ref) v_u_35, (ref) v_u_24, (ref) v_u_2
            local v68 = v_u_24.AbsoluteSize.X / 2
            local v69 = v_u_24.AbsoluteSize.Y / 2 - v_u_2.TopbarInset.Height / 2
            v_u_34 = v68
            v_u_35 = v69
        end)
        v_u_10.EnableButton("MainToolButton", {
            ["Image"] = v_u_36.TextureId
        }, nil, nil, nil, PlaceOnServer)
    else
        local v70 = v_u_16.X
        local v71 = v_u_16.Y
        v_u_34 = v70
        v_u_35 = v71
        v_u_29 = v_u_16.Move:Connect(function()
            -- upvalues: (ref) v_u_34, (ref) v_u_35, (ref) v_u_16, (ref) v_u_25
            local v72 = v_u_16.X
            local v73 = v_u_16.Y
            v_u_34 = v72
            v_u_35 = v73
            v_u_25.Position = UDim2.fromOffset(v_u_34, v_u_35)
        end)
        if p64 == "PC" then
            v65 = Enum.KeyCode.R
            v_u_26 = v_u_36.Activated:Connect(PlaceOnServer)
        else
            v65 = Enum.KeyCode.ButtonY
            v_u_10.EnableButton("MainToolButton", {
                ["Image"] = v_u_36.TextureId
            }, Enum.KeyCode.ButtonX, PlaceOnServer)
        end
    end
    local v74 = v_u_10.EnableButton
    local v75 = "SecondaryToolButton"
    local v76 = {
        ["Image"] = "rbxassetid://4343875656"
    }
    local v77
    if p64 == "PC" then
        v77 = v65.Name
    else
        v77 = false
    end
    v76.Text = v77
    v74(v75, v76, v65, StartRotating, StopRotating)
    if not v_u_32 then
        v_u_32 = task.spawn(PlaceLoop)
    end
end
function DisconnectPlacing()
    -- upvalues: (copy) v_u_10, (ref) v_u_26, (ref) v_u_29, (copy) v_u_8
    v_u_10.DisableButton("SecondaryToolButton")
    v_u_10.DisableButton("MainToolButton")
    if v_u_26 then
        v_u_26:Disconnect()
        v_u_26 = nil
    end
    if v_u_29 then
        v_u_29:Disconnect()
        v_u_29 = nil
    end
    v_u_8(false)
end
function DisablePlacing()
    -- upvalues: (ref) v_u_32, (copy) v_u_9
    DisconnectPlacing()
    StopRotating(true)
    if v_u_32 then
        task.cancel(v_u_32)
        v_u_32 = nil
    end
    v_u_9.Disconnect("Place")
end
function ToggleToPlaceMode(p78)
    -- upvalues: (ref) v_u_18, (ref) v_u_38, (copy) v_u_6, (copy) v_u_9, (copy) v_u_1, (ref) v_u_37, (ref) v_u_22, (copy) v_u_11, (ref) v_u_21
    if p78 then
        v_u_18.Parent = workspace
        if v_u_38 == "Mine" then
            DisableExplode()
        elseif v_u_38 == "Laser barrier" then
            v_u_6.HideDescription()
        end
        v_u_9.ConnectToInputChanged(MakePlacingInput, "Place")
        return
    else
        DisablePlacing()
        v_u_18.Parent = v_u_1
        if v_u_38 == "Mine" then
            v_u_9.ConnectToInputChanged(MakeExplodeInput, "ExplodeMine")
        elseif v_u_38 == "Laser barrier" then
            local v79 = v_u_37:FindFirstChild("Attachment") or Instance.new("Attachment", v_u_37)
            v79.WorldCFrame = v_u_37:GetPivot() * CFrame.new(0, 0, -2)
            v_u_22 = v_u_11.ShowBeam("PlacableBeam", v79, v_u_21)
            v_u_6.ShowDescription("Remove your <font color=\"rgb(255, 255, 75)\">laser barrier</font> to place another one")
        end
    end
end
function OnPlaced(p_u_80)
    -- upvalues: (ref) v_u_37, (ref) v_u_28
    v_u_37 = p_u_80
    if p_u_80 then
        ToggleToPlaceMode(false)
        if v_u_28 then
            v_u_28:Disconnect()
        end
        v_u_28 = p_u_80.AncestryChanged:Connect(function()
            -- upvalues: (copy) p_u_80, (ref) v_u_37
            if not p_u_80:IsDescendantOf(workspace) then
                v_u_37 = nil
                ToggleToPlaceMode(true)
            end
        end)
    else
        ToggleToPlaceMode(true)
    end
end
function v40.Enable(p81, p82)
    -- upvalues: (ref) v_u_21, (ref) v_u_36, (ref) v_u_38, (ref) v_u_18, (copy) v_u_12, (ref) v_u_17, (copy) v_u_14, (ref) v_u_39, (ref) v_u_31, (copy) v_u_3
    v_u_21 = p82
    v_u_36 = p81
    v_u_38 = p81.Name
    v_u_18 = v_u_12[v_u_38]:Clone()
    v_u_17 = Instance.new("SelectionBox", v_u_18)
    v_u_17.LineThickness = 0.1
    v_u_17.Adornee = v_u_18.SelectionPart
    local v_u_83 = v_u_14.UserId .. v_u_38
    v_u_39 = RaycastParams.new()
    v_u_39.FilterDescendantsInstances = { v_u_14.Character, v_u_18 }
    v_u_31 = v_u_3.ChildAdded:Connect(function(p84)
        -- upvalues: (copy) v_u_83
        if p84.Name == v_u_83 then
            OnPlaced(p84)
        end
    end)
    OnPlaced(v_u_3:FindFirstChild(v_u_83))
end
function v40.Disable()
    -- upvalues: (copy) v_u_6, (ref) v_u_22, (ref) v_u_28, (ref) v_u_30, (ref) v_u_31, (ref) v_u_18, (copy) v_u_25, (ref) v_u_37, (ref) v_u_36
    v_u_6.HideDescription()
    DisableExplode()
    DisablePlacing()
    if v_u_22 then
        v_u_22.Enabled = false
    end
    if v_u_28 then
        v_u_28:Disconnect()
        v_u_28 = nil
    end
    if v_u_30 then
        v_u_30:Disconnect()
        v_u_30 = nil
    end
    if v_u_31 then
        v_u_31:Disconnect()
        v_u_31 = nil
    end
    if v_u_18 then
        v_u_18:Destroy()
        v_u_18 = nil
    end
    if v_u_25 then
        v_u_25.Visible = false
    end
    v_u_37 = nil
    v_u_36 = nil
end
return v40

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.LaserReplicator
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Debris")
local v_u_3 = workspace.Terrain
local v4 = v1.Tools.Effects.Laser
local v_u_5 = require(v1.AllModules.Functions.ScaleNumberSequence)
local v_u_6 = {}
for _, v7 in pairs(v4:GetChildren()) do
    local v8 = {
        ["Instance"] = v7
    }
    if v7:IsA("ParticleEmitter") then
        v8.Size = v7.Size
        v8.Rate = v7.Rate
        v8.Speed = v7.Speed
    end
    v_u_6[v7.Name] = v8
end
local v_u_9 = {
    ["PlayerAttachment"] = {}
}
function PlayOrStopSoundOn(p10, p11)
    local v12 = 1
    while true do
        local v13 = p10:FindFirstChild("FireSnd-" .. v12, true)
        if not v13 then
            break
        end
        if p11 then
            if not v13.IsPlaying then
                v13:Play()
            end
        elseif v13.IsPlaying then
            v13:Stop()
        end
        v12 = v12 + 1
    end
end
function v_u_9.AddPlrBeam(p14, p15, p16, p17, p18)
    -- upvalues: (copy) v_u_9, (copy) v_u_6, (copy) v_u_5
    local v19
    if p14 then
        v19 = p14:FindFirstChildOfClass("Tool")
    else
        v19 = p14
    end
    if v19 then
        if not p17 then
            if v19 then
                p17 = v19:FindFirstChildOfClass("Beam")
            else
                p17 = v19
            end
        end
        if p17 then
            local v20 = v19.Name
            if v19 then
                PlayOrStopSoundOn(v19, true)
            end
            local v21 = v_u_9.PlayerAttachment[p14]
            if not (v21 and v21.Parent) then
                v21 = Instance.new("Attachment", p16)
                v_u_9.PlayerAttachment[p14] = v21
                local v22 = v_u_6[v20]
                if v22 then
                    v22 = v_u_6[v20].Instance
                end
                if v22 then
                    v22:Clone().Parent = v21
                end
            end
            local v23 = p17.Attachment0
            if v23 then
                v21.Parent = p16
                local v24 = v23.WorldPosition
                local v25 = CFrame.lookAt(v24, p15) * CFrame.Angles(1.5707963267948966, 0, -1.5707963267948966)
                v23.WorldCFrame = v25
                v21.WorldCFrame = CFrame.new(p15) * v25.Rotation
                if p18 then
                    local v26 = (v24 - p15).Magnitude * 2
                    local v27 = math.rad(p18)
                    p17.Width1 = v26 * math.tan(v27)
                end
            else
                v21.WorldPosition = p15
            end
            p17.Attachment1 = v21
            local v28 = v21:FindFirstChildOfClass("ParticleEmitter")
            if v28 then
                local v29 = v19:GetScale()
                local v30 = v19:GetAttribute("Server_Charge") or 1
                local v31 = v29 * (0.75 + 0.25 * v30)
                v28.Rate = v_u_6[v20].Rate * v30
                v28.Size = v_u_5(v_u_6[v20].Size, v30 * v29)
                v28.Speed = NumberRange.new(v_u_6[v20].Speed.Min * v31, v_u_6[v20].Speed.Max * v31)
            end
            return v21
        end
    else
        print("No tool in", p14)
    end
end
function v_u_9.RemovePlrAtt(p32, p33)
    -- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_2
    if p33 then
        PlayOrStopSoundOn(p33, false)
    end
    local v34
    if p32 then
        v34 = v_u_9.PlayerAttachment[p32]
    else
        v34 = p32
    end
    if v34 then
        v_u_9.PlayerAttachment[p32] = nil
        local v35 = v34:FindFirstChildOfClass("ParticleEmitter")
        if v35 then
            local v36 = Instance.new("Attachment", v_u_3)
            v36.WorldPosition = v34.WorldPosition
            v35.Parent = v36
            v35.Enabled = false
            v_u_2:AddItem(v36, v35.Lifetime.Max)
        end
        v34:Destroy()
    end
end
return v_u_9

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.TwinKeyModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ProximityPromptService")
local v_u_2 = game:GetService("UserInputService")
local v3 = game:GetService("Players").LocalPlayer
local v_u_4 = v3.PlayerGui
local v5 = game:GetService("ReplicatedStorage").AllModules
local v_u_6 = require(v5.ToolModules.ToolDescriptionWriter)
local v_u_7 = require(v5.KeyInputLabelMaker)
local v_u_8 = require(v5.ImageFromName)
local v_u_9 = require(v5.InputManager)
local v_u_10 = require(v5.ConvertVal)
local v_u_11 = require(v5.WeaponStats)["Twin keys"]
local v_u_12 = v3.Stats.Keys
local v_u_13 = nil
local v_u_14 = 2
local v_u_15 = 2
local v_u_16 = nil
local v_u_17 = Enum.KeyCode.DPadRight
local v_u_18 = Enum.KeyCode.DPadLeft
local v_u_19 = script.SelectNumKeyFrame
v_u_19.Parent = v_u_4.MainGui.LowerFrameContainer
local v20 = v_u_19.FrameForText
local v_u_21 = v20.AmountLabel
local v_u_22 = v20.DescLabel
local v_u_23 = v_u_19.Minus
local v_u_24 = v_u_19.Plus
local v_u_25 = v20.LockedIcon
local v_u_26 = nil
local v_u_27 = nil
v_u_23.UIScale:AddTag("SizableUI")
v_u_24.UIScale:AddTag("SizableUI")
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = game:GetService("SoundService").Sound.ClickSound
local v_u_32 = {
    "GoldenKey",
    "DiamondKey",
    "SilverKey",
    "StoneKey"
}
local v33 = {}
function OnNewPromptShown(p34)
    -- upvalues: (ref) v_u_16, (ref) v_u_13, (copy) v_u_12, (copy) v_u_6, (copy) v_u_8, (copy) v_u_10, (ref) v_u_15
    if v_u_16 then
        local v35 = p34.ObjectText
        if v35:sub(-4, -1) == "door" then
            local v36 = v35:sub(1, -6):lower() .. " key"
            v_u_13 = p34
            v_u_16:SetAttribute("DisplayedKeys", v36)
            local v37 = v_u_12[v36]:FindFirstChildOfClass("IntValue").Value
            v_u_6.ShowImage(v_u_8[v36].Image, v36:sub(1, 1):upper() .. v36:sub(2) .. " " .. v_u_10.SimpleConversion(v37) .. "/" .. v_u_15)
        end
    else
        return
    end
end
function OnPromptHidden(p38)
    -- upvalues: (ref) v_u_13, (copy) v_u_6
    if v_u_13 == p38 then
        v_u_13 = nil
        v_u_6.HideToolImage()
    end
end
function GetDisplayedPrompt()
    -- upvalues: (copy) v_u_4
    local v39 = v_u_4:FindFirstChild("ProximityPrompts")
    if v39 then
        for _, v40 in pairs(v39:GetChildren()) do
            local v41 = v40.Adornee:FindFirstChildOfClass("ProximityPrompt")
            if v41 and v41.Enabled then
                return v41
            end
        end
    end
end
function OnSelectedKeyNumberChanged()
    -- upvalues: (copy) v_u_21, (ref) v_u_14, (copy) v_u_11, (copy) v_u_12, (copy) v_u_22, (copy) v_u_25, (ref) v_u_15, (ref) v_u_16
    v_u_21.Text = v_u_14
    local v42 = v_u_11.UnlockWithNumberOfKeysFound[v_u_14]
    local v43 = v_u_12:GetAttribute("Total")
    if v43 < v_u_11.UnlockWithNumberOfKeysFound[v_u_14] then
        v_u_22.Text = "Keys found:\n" .. v43 .. "/" .. v42
        v_u_22.Visible = true
        v_u_25.Visible = true
    else
        v_u_15 = v_u_14
        v_u_25.Visible = false
        v_u_22.Visible = false
        v_u_16:SetAttribute("NumKeys", v_u_14)
    end
end
function ChangeSelectedKeyNumber(p44)
    -- upvalues: (copy) v_u_31, (ref) v_u_14, (copy) v_u_11
    v_u_31:Play()
    local v45 = v_u_14 + p44
    local v46 = #v_u_11.UnlockWithNumberOfKeysFound
    local v47 = math.clamp(v45, 1, v46)
    if v47 ~= v_u_14 then
        v_u_14 = v47
        OnSelectedKeyNumberChanged()
    end
end
function DisconnectAllInputC()
    -- upvalues: (ref) v_u_28
    if v_u_28 then
        v_u_28:Disconnect()
    end
end
function MakeInputs(p48)
    -- upvalues: (ref) v_u_26, (ref) v_u_27, (copy) v_u_7, (copy) v_u_23, (copy) v_u_18, (copy) v_u_24, (copy) v_u_17, (ref) v_u_28, (copy) v_u_2
    if v_u_26 then
        v_u_26.Visible = false
        v_u_27.Visible = false
    end
    DisconnectAllInputC()
    if p48 == "Gamepad" then
        if v_u_26 then
            local v49 = v_u_27
            v_u_26.Visible = true
            v49.Visible = true
        else
            v_u_26 = v_u_7.ShowKeyInputImage(v_u_23, v_u_18, {
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
            }, "MinusFrame")
            v_u_27 = v_u_7.ShowKeyInputImage(v_u_24, v_u_17, {
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
            }, "PlusFrame")
        end
        v_u_28 = v_u_2.InputBegan:Connect(function(p50, p51)
            -- upvalues: (ref) v_u_18, (ref) v_u_17
            if not p51 then
                if p50.KeyCode == v_u_18 then
                    ChangeSelectedKeyNumber(-1)
                end
                if p50.KeyCode == v_u_17 then
                    ChangeSelectedKeyNumber(1)
                end
            end
        end)
    end
end
function v33.Enable(p52)
    -- upvalues: (ref) v_u_16, (copy) v_u_6, (copy) v_u_19, (ref) v_u_14, (ref) v_u_15, (copy) v_u_9, (ref) v_u_30, (copy) v_u_1, (ref) v_u_29, (copy) v_u_32
    v_u_16 = p52
    v_u_6.ShowDescription("<font color=\"rgb(255, 255, 50)\">Hold</font> this while opening doors to <font color=\"rgb(255, 255, 50)\">use multiple keys</font> at once!", nil, nil, 0.9)
    v_u_19.Visible = true
    v_u_14 = p52:GetAttribute("Server_NumKeys")
    v_u_15 = v_u_14
    OnSelectedKeyNumberChanged()
    v_u_9.ConnectToInputChanged(MakeInputs, "TwinKeys")
    v_u_30 = v_u_1.PromptShown:Connect(OnNewPromptShown)
    v_u_29 = v_u_1.PromptHidden:Connect(OnPromptHidden)
    local v53 = GetDisplayedPrompt()
    if v53 then
        OnNewPromptShown(v53)
    end
    task.wait()
    if v_u_16 == p52 then
        local v54 = p52:FindFirstChild("Handle")
        if v54 then
            for _, v55 in pairs(v_u_32) do
                local v56 = v54:FindFirstChild(v55 .. "Att")
                if v56 then
                    local v57 = v54:FindFirstChild(v55)
                    if v57 then
                        v57:PivotTo(v56.WorldCFrame)
                        v57.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        v57.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    end
                end
            end
        end
    else
        return
    end
end
function v33.Disable(_)
    -- upvalues: (ref) v_u_29, (ref) v_u_30, (copy) v_u_19, (copy) v_u_6, (ref) v_u_16, (ref) v_u_13, (copy) v_u_9
    if v_u_29 then
        v_u_29:Disconnect()
    end
    if v_u_30 then
        v_u_30:Disconnect()
    end
    DisconnectAllInputC()
    v_u_19.Visible = false
    v_u_6.HideDescription()
    v_u_16 = nil
    if v_u_13 then
        OnPromptHidden(v_u_13)
    end
    v_u_9.Disconnect("TwinKeys")
end
v_u_24.Activated:Connect(function()
    ChangeSelectedKeyNumber(1)
end)
v_u_23.Activated:Connect(function()
    ChangeSelectedKeyNumber(-1)
end)
return v33

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.CrateFinder
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainGui")
local v_u_3 = script.CrateFinderFrame
v_u_3.Parent = v2.LowerFrameContainer
local v_u_4 = v_u_3.DescLabel
local v_u_5 = v_u_3.ResetInLabel
local v_u_6 = v_u_3.ShowButton
local v_u_7 = require(v_u_1.AllModules.ConvertVal).ConvertTimeInPart
local v_u_8 = require(v_u_1.AllModules.WeaponStats)["Crate finder"]
require(v2.MainGuiScript.ToggleFrameModule)
local v_u_9 = require(v_u_1.AllModules.A_Or_An)
local v_u_10 = nil
local v_u_11 = false
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = false
local v_u_15 = nil
local v_u_16 = v_u_1.RemoteEvent.CrateFinderEvent
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = game:GetService("SoundService"):WaitForChild("Sound"):WaitForChild("ClickSound")
local v23 = {}
function LoopedActions()
    -- upvalues: (ref) v_u_11, (ref) v_u_10, (ref) v_u_12, (copy) v_u_16
    v_u_11 = true
    while v_u_10 do
        if not (v_u_12 and workspace.CrateFolder:FindFirstChild(v_u_12)) then
            v_u_16:FireServer("Refresh")
        end
        task.wait(1)
    end
    v_u_11 = false
end
function GetStreakTxt(p24)
    return "Crate streak: <font color=\"rgb(50, 255, 50)\">" .. p24 .. "</font>"
end
function PrintCurrentTask()
    -- upvalues: (ref) v_u_10, (ref) v_u_12, (copy) v_u_8, (ref) v_u_14, (copy) v_u_4, (copy) v_u_9, (copy) v_u_6, (ref) v_u_11
    local v25 = v_u_10:GetAttribute("Streak") or 0
    v_u_12 = v_u_10:GetAttribute("TargetCrate")
    local v26 = v_u_8.GetBonusForCrateStreak(v25)
    local v27 = math.floor(v26)
    if v_u_14 or (not v_u_12 or v_u_12 == "") then
        v_u_6.Visible = false
        if v25 > 0 then
            v_u_4.Text = "Waiting for crates...\n" .. GetStreakTxt(v25)
        else
            v_u_4.Text = "Waiting for crates\n..."
        end
    else
        v_u_4.Text = "Find " .. v_u_9(v_u_12, false, true) .. " <font color=\"rgb(255, 175, 75)\">" .. v_u_12 .. "</font> and get <font color=\"rgb(255, 255, 50)\">+" .. v27 .. "% cash</font>\n" .. GetStreakTxt(v25)
        v_u_6.Visible = true
    end
    if not v_u_11 then
        task.spawn(LoopedActions)
    end
end
function OnTimeChanged()
    -- upvalues: (ref) v_u_10, (copy) v_u_5, (copy) v_u_7
    local v28 = v_u_10:GetAttribute("TimeLeft") or 0
    if v28 == 0 then
        v_u_5.Visible = false
    else
        v_u_5.Visible = true
        v_u_5.Text = "Resets in " .. v_u_7(v28, 2)
    end
end
function OnOnlyClientFoundCrateChanged()
    -- upvalues: (ref) v_u_14, (ref) v_u_10
    v_u_14 = v_u_10:GetAttribute("OnlyClientFoundCrate")
    PrintCurrentTask()
end
function ShowCrate()
    -- upvalues: (ref) v_u_13, (ref) v_u_15, (copy) v_u_1, (ref) v_u_10
    local v29 = v_u_13.Value
    if v29 then
        if not v_u_15 then
            v_u_15 = v_u_1.Tools.KeyBeam:Clone()
            v_u_15.Name = "CrateFinderBeam"
            v_u_15.Parent = workspace
        end
        v_u_15.Attachment0 = v29:FindFirstChildOfClass("Attachment") or Instance.new("Attachment", v29)
        v_u_15.Attachment1 = v_u_10:FindFirstChild("ForBeamAtt", true)
        v_u_15.Enabled = true
    elseif v_u_15 then
        v_u_15.Enabled = false
    end
end
v_u_6.Activated:Connect(function()
    -- upvalues: (copy) v_u_22, (ref) v_u_13, (ref) v_u_10, (copy) v_u_16
    v_u_22:Play()
    if v_u_13 then
        if not v_u_13.Value or (not v_u_13.Value:IsDescendantOf(workspace) or v_u_13.Value.Name ~= v_u_10:GetAttribute("CrateName")) then
            v_u_16:FireServer("Show")
        end
    else
        return
    end
end)
function v23.Enable(p30)
    -- upvalues: (ref) v_u_10, (copy) v_u_3, (ref) v_u_17, (ref) v_u_18, (ref) v_u_19, (ref) v_u_20, (ref) v_u_13, (ref) v_u_21
    v_u_10 = p30
    v_u_3.Visible = true
    v_u_17 = p30:GetAttributeChangedSignal("OnlyClientFoundCrate"):Connect(OnOnlyClientFoundCrateChanged)
    v_u_18 = p30:GetAttributeChangedSignal("TargetCrate"):Connect(PrintCurrentTask)
    v_u_19 = p30:GetAttributeChangedSignal("Streak"):Connect(PrintCurrentTask)
    v_u_20 = p30:GetAttributeChangedSignal("TimeLeft"):Connect(OnTimeChanged)
    v_u_13 = p30:FindFirstChild("ShowCrate")
    if v_u_13 then
        v_u_21 = v_u_13:GetPropertyChangedSignal("Value"):Connect(ShowCrate)
        ShowCrate()
    end
    OnOnlyClientFoundCrateChanged()
    PrintCurrentTask()
    OnTimeChanged()
end
function v23.Disable(_)
    -- upvalues: (ref) v_u_17, (ref) v_u_18, (ref) v_u_19, (ref) v_u_20, (ref) v_u_21, (copy) v_u_3, (ref) v_u_10, (ref) v_u_15
    if v_u_17 then
        v_u_17:Disconnect()
    end
    if v_u_18 then
        v_u_18:Disconnect()
    end
    if v_u_19 then
        v_u_19:Disconnect()
    end
    if v_u_20 then
        v_u_20:Disconnect()
    end
    if v_u_21 then
        v_u_21:Disconnect()
    end
    v_u_3.Visible = false
    v_u_10 = nil
    if v_u_15 then
        v_u_15.Enabled = false
    end
end
return v23

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.Zombieplicator
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = v_u_2:GetMouse()
local v_u_4 = v1.RemoteEvent.ToolEvent.ZombieplicatorEvent
local v_u_5 = v1.RemoteEvent.GuiEvent.GuiEventLocal
local v_u_6 = require(v1.AllModules.ToolModules.ToolDescriptionWriter)
local v_u_7 = require(v1.AllModules.WeaponStats).Zombieplicator.Cooldown
local v_u_8 = require(v1.AllModules.ToolModules.ToggleAimModule)
local v_u_9 = require(v1.AllModules.InputManager)
local v_u_10 = require(v1.AllModules.ToolButtons)
local v_u_11 = require(v1.AllModules.ConvertVal)
local v_u_12 = v_u_2:WaitForChild("PlayerGui"):WaitForChild("MainGui")
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = workspace.Camera
local v_u_16 = v_u_2.Stats.ZombieplicatorLastTimeUsed
local v_u_17 = ""
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = nil
local v21 = {}
function GetTargettedInstance()
    -- upvalues: (copy) v_u_9, (copy) v_u_15, (copy) v_u_12, (ref) v_u_18, (copy) v_u_3
    if v_u_9.LastInputType ~= "Mobile" then
        return v_u_3.Target
    end
    local v22 = v_u_15:ScreenPointToRay(v_u_12.AbsoluteSize.X / 2, v_u_12.AbsoluteSize.Y / 2 - 23)
    local v23 = workspace:Raycast(v22.Origin, v22.Direction * 500000000, v_u_18)
    if v23 then
        v23 = v23.Instance
    end
    return v23
end
function OnClick()
    -- upvalues: (copy) v_u_5, (ref) v_u_14, (copy) v_u_4
    if #workspace.ZombieFolder:GetChildren() >= 10 then
        v_u_5:Fire("WrongMessage", "Too many zombies")
        return
    elseif v_u_14 then
        if v_u_14:HasTag("Boss") then
            v_u_5:Fire("WrongMessage", "Unable to duplicate boss zombies")
        else
            v_u_4:FireServer(v_u_14)
        end
    else
        v_u_5:Fire("WrongMessage", "This is not a zombie")
        return
    end
end
function GetZombieFromBasePart(p24)
    local v25 = p24:FindFirstAncestorOfClass("Model")
    if v25 and (v25:HasTag("Zombie") and (v25:FindFirstChild("Humanoid") and v25.Humanoid.Health > 0)) then
        return v25
    end
end
local v_u_26 = false
local v_u_27 = false
function TrackMousePosition()
    -- upvalues: (copy) v_u_9, (copy) v_u_6, (ref) v_u_17, (copy) v_u_11, (copy) v_u_7, (ref) v_u_27, (ref) v_u_13, (ref) v_u_26, (ref) v_u_14
    v_u_9.ConnectToInputChanged(MakeInputs, "Zombieplicator")
    v_u_6.ShowDescription(v_u_17, "<font color=\"rgb(255, 50, 50)\">(cooldown: " .. v_u_11.ConvertTimeInPart(v_u_7, 2) .. ")</font>", 0.8)
    if not v_u_27 then
        v_u_27 = true
        local v28 = Instance.new("Highlight", script)
        v28.FillColor = Color3.new(0.2, 1, 0.2)
        while v_u_13 and not v_u_26 do
            local v29 = GetTargettedInstance()
            if v29 then
                v29 = GetZombieFromBasePart(v29)
            end
            v_u_14 = v29
            if v_u_14 then
                v28.Adornee = v_u_14
            else
                v28.Adornee = nil
            end
            task.wait()
        end
        v_u_27 = false
        v28:Destroy()
    end
end
function DisconnectInputs()
    -- upvalues: (ref) v_u_20, (copy) v_u_10
    if v_u_20 then
        v_u_20:Disconnect()
    end
    v_u_10.DisableButton("MainToolButton")
end
function MakeInputs(p30)
    -- upvalues: (copy) v_u_8, (ref) v_u_17, (copy) v_u_10, (ref) v_u_13, (ref) v_u_20, (copy) v_u_6
    DisconnectInputs()
    if p30 == "Mobile" then
        v_u_8(true)
        v_u_17 = "<font color=\"rgb(255, 255, 50)\">Aim</font> a zombie and press the button to <font color=\"rgb(255, 255, 50)\">duplicate</font> it!"
        v_u_10.EnableButton("MainToolButton", {
            ["Image"] = v_u_13.TextureId
        }, nil, nil, nil, OnClick)
    else
        v_u_8(false)
        v_u_20 = v_u_13.Activated:Connect(OnClick)
        v_u_17 = "<font color=\"rgb(255, 255, 50)\">Click</font> on a zombie to <font color=\"rgb(255, 255, 50)\">duplicate</font> it!"
    end
    v_u_6.ShowDescription(v_u_17)
end
function OnLastTimeChanged()
    -- upvalues: (ref) v_u_26, (copy) v_u_7, (copy) v_u_16, (copy) v_u_9, (copy) v_u_8, (ref) v_u_13, (copy) v_u_6, (copy) v_u_11
    if not v_u_26 then
        local v31 = v_u_7 - (DateTime.now().UnixTimestamp - v_u_16.Value)
        if v31 > 0 then
            v_u_9.Disconnect("Zombieplicator")
            v_u_8(false)
            DisconnectInputs()
            v_u_26 = true
            while v31 > 0 and v_u_13 do
                v_u_6.ShowDescription("Wait for the cooldown", "<font color=\"rgb(255, 50, 50)\">" .. v_u_11.ConvertTimeInPart(v31, 2) .. "</font>", 0.8)
                task.wait(1)
                v31 = v_u_7 - (DateTime.now().UnixTimestamp - v_u_16.Value)
            end
            v_u_26 = false
            if not v_u_13 then
                return
            end
        end
        task.spawn(TrackMousePosition)
    end
end
function v21.Enable(p32)
    -- upvalues: (ref) v_u_13, (ref) v_u_18, (copy) v_u_2, (ref) v_u_19, (copy) v_u_16
    v_u_13 = p32
    v_u_18 = RaycastParams.new()
    v_u_18:AddToFilter(v_u_2.Character)
    v_u_19 = v_u_16.Changed:Connect(OnLastTimeChanged)
    task.spawn(OnLastTimeChanged)
end
function v21.Disable()
    -- upvalues: (ref) v_u_13, (ref) v_u_19, (copy) v_u_8, (copy) v_u_6, (copy) v_u_9
    v_u_13 = nil
    if v_u_19 then
        v_u_19:Disconnect()
    end
    v_u_8(false)
    v_u_6.HideDescription()
    v_u_9.Disconnect("Zombieplicator")
    DisconnectInputs()
end
return v21

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.ToolModules.ToolDescriptionWriter
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainGui")
local v_u_2 = v_u_1.LowerFrameContainer.ToolDescriptionLabel
local v_u_3 = v_u_1.LowerFrameContainer.ToolImageFrame
local v_u_4 = v_u_3.Legend
local v_u_5 = v_u_3.Image
local v6 = {}
function GetTextSize()
    -- upvalues: (copy) v_u_1
    local v7 = (v_u_1.AbsoluteSize.Y - 319) * 15 / 761
    return math.min(v7, 15) + 20
end
function v6.ShowImage(p8, p9, p10)
    -- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
    v_u_3.Visible = true
    local v11 = GetTextSize()
    local v12 = 2.5 * v11
    v_u_5.Size = UDim2.fromOffset(v12, v12)
    v_u_5.Image = p8 or ""
    local v13 = p9 and (p10 or 0.8) * v11 or 0
    v_u_4.Text = p9 or ""
    v_u_4.TextSize = v13
    local v14 = v12 + v13
    v_u_3.Size = UDim2.fromOffset(0, v14)
end
function v6.ShowDescription(p15, p16, p17, p18)
    -- upvalues: (copy) v_u_2
    local v19 = GetTextSize()
    v_u_2.TextSize = v19 * (p18 or 1)
    if p16 then
        local v20 = v19 * (p17 or 0.8)
        p15 = ((p15 .. "\n<font size=\"" .. math.floor(v20) .. "\">") .. p16) .. "</font>"
    end
    v_u_2.Text = p15
    v_u_2.Visible = true
end
function v6.HideDescription()
    -- upvalues: (copy) v_u_2
    v_u_2.Visible = false
end
function v6.HideToolImage()
    -- upvalues: (copy) v_u_3
    v_u_3.Visible = false
end
return v6

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.CharacterSize.GetCharacterScale
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(script.Parent.GetSizeValue)
function GetCharacterScale(p2)
    -- upvalues: (copy) v_u_1
    if not p2 then
        return 1
    end
    local v3 = v_u_1(p2)
    return not v3 and 1 or v3.Value
end
return GetCharacterScale

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.CharacterSize.GetSizeValue
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {
    "HeadScale",
    "BodyDepthScale",
    "BodyWidthScale",
    "BodyHeightScale"
}
function GetSizeValue(p2)
    -- upvalues: (copy) v_u_1
    local v3 = p2:FindFirstChild("Humanoid")
    if v3 then
        local v4 = nil
        for _, v5 in pairs(v_u_1) do
            v4 = v3:FindFirstChild(v5)
            if v4 then
                break
            end
        end
        return v4
    end
end
return GetSizeValue

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Friends.IsCharAFriendlyUnit
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v_u_1.AllModules.GetWorkingPlayerFromModel)
local v_u_4 = nil
return function(p5, p6)
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (ref) v_u_4, (copy) v_u_1
    if not (p5 and p6) then
        return false
    end
    local v7 = v_u_2:GetPlayerFromCharacter(p6) or v_u_3(p6)
    if not v7 then
        return false
    end
    local v8 = v7 == p5
    if not v8 then
        if not v_u_4 then
            v_u_4 = require(v_u_1.AllModules.Friends.ImprovedIsFriendWith)
        end
        v8 = v_u_4(p5, v7.UserId)
    end
    return v8
end

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Friends.ImprovedIsFriendWith
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = {}
local function v_u_8(p_u_2, p_u_3)
    local v4 = 0
    local v_u_5 = false
    while true do
        v4 = v4 + 1
        local v6, v7 = pcall(function()
            -- upvalues: (ref) v_u_5, (copy) p_u_2, (copy) p_u_3
            v_u_5 = p_u_2:IsFriendsWith(p_u_3)
        end)
        if not v6 then
            print(v7)
            if v4 >= 10 then
                warn("Unable to run \"IsFriendWith\"")
                return false
            end
        end
        if v6 then
            return v_u_5
        end
    end
end
function ImprovedIsFriendWith(p_u_9, p_u_10)
    -- upvalues: (copy) v_u_1, (copy) v_u_8
    local v_u_11 = v_u_1[p_u_9]
    if not v_u_11 then
        v_u_11 = {}
        v_u_1[p_u_9] = v_u_11
    end
    if v_u_11[p_u_10] ~= nil then
        return v_u_11[p_u_10]
    end
    local v12 = v_u_8(p_u_9, p_u_10)
    v_u_11[p_u_10] = v12
    task.delay(5, function()
        -- upvalues: (ref) v_u_11, (copy) p_u_10, (ref) v_u_1, (copy) p_u_9
        -- failed to decompile
    end)
    return v12
end
return ImprovedIsFriendWith

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Upgrader.StartingHPUpgrades
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.ConvertVal).ConvertToReadableNumbers
local v_u_2 = require(script.Parent.UpgradesMaker)(10, {
    5,
    10,
    20,
    40,
    80,
    150
}, {
    30000,
    100000,
    1000000,
    5000000,
    15000000,
    20000000
}, {
    140,
    200,
    400,
    600,
    1000,
    2000
}, {
    ["EffectValue"] = 100,
    ["Price"] = 0,
    ["LevelRequired"] = 0
})
function v_u_2.GetDisplayedText(_, p3)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    return v_u_1(v_u_2[p3].EffectValue) .. "HP"
end
return v_u_2

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Upgrader.HealOnKillUpgrades
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.ConvertVal)
local v_u_3 = {
    [0] = {
        ["EffectValue"] = 5,
        ["Price"] = 0
    },
    [1] = {
        ["EffectValue"] = 7,
        ["Price"] = 1000
    },
    [2] = {
        ["EffectValue"] = 9,
        ["Price"] = 2500
    },
    [3] = {
        ["EffectValue"] = 11,
        ["Price"] = 5000
    },
    [4] = {
        ["EffectValue"] = 13,
        ["Price"] = 10000
    },
    [5] = {
        ["EffectValue"] = 15,
        ["Price"] = 20000
    },
    [6] = {
        ["EffectValue"] = 18,
        ["Price"] = 40000
    },
    [7] = {
        ["EffectValue"] = 21,
        ["Price"] = 60000
    },
    [8] = {
        ["EffectValue"] = 24,
        ["Price"] = 100000
    },
    [9] = {
        ["EffectValue"] = 27,
        ["Price"] = 150000
    },
    [10] = {
        ["EffectValue"] = 30,
        ["Price"] = 200000
    },
    [11] = {
        ["EffectValue"] = 33,
        ["Price"] = 400000
    },
    [12] = {
        ["EffectValue"] = 36,
        ["Price"] = 600000
    },
    [13] = {
        ["EffectValue"] = 39,
        ["Price"] = 800000
    },
    [14] = {
        ["EffectValue"] = 42,
        ["Price"] = 1000000
    },
    [15] = {
        ["EffectValue"] = 45,
        ["Price"] = 1500000
    },
    [16] = {
        ["EffectValue"] = 50,
        ["Price"] = 2000000
    },
    [17] = {
        ["EffectValue"] = 55,
        ["Price"] = 2500000
    },
    [18] = {
        ["EffectValue"] = 60,
        ["Price"] = 3000000
    },
    [19] = {
        ["EffectValue"] = 65,
        ["Price"] = 4000000
    },
    [20] = {
        ["EffectValue"] = 70,
        ["Price"] = 5000000
    },
    [21] = {
        ["EffectValue"] = 75,
        ["Price"] = 6000000
    },
    [22] = {
        ["EffectValue"] = 80,
        ["Price"] = 7000000
    },
    [23] = {
        ["EffectValue"] = 85,
        ["Price"] = 8000000
    },
    [24] = {
        ["EffectValue"] = 90,
        ["Price"] = 9000000
    },
    [25] = {
        ["EffectValue"] = 95,
        ["Price"] = 10000000
    },
    [26] = {
        ["EffectValue"] = 100,
        ["Price"] = 11000000
    },
    [27] = {
        ["EffectValue"] = 105,
        ["Price"] = 12000000,
        ["LevelRequired"] = 400
    },
    [28] = {
        ["EffectValue"] = 110,
        ["Price"] = 13000000,
        ["LevelRequired"] = 400
    },
    [29] = {
        ["EffectValue"] = 115,
        ["Price"] = 14000000,
        ["LevelRequired"] = 400
    },
    [30] = {
        ["EffectValue"] = 120,
        ["Price"] = 15000000,
        ["LevelRequired"] = 400
    },
    [31] = {
        ["EffectValue"] = 120,
        ["Price"] = 16000000,
        ["LevelRequired"] = 400
    },
    [32] = {
        ["EffectValue"] = 125,
        ["Price"] = 17000000,
        ["LevelRequired"] = 400
    },
    [33] = {
        ["EffectValue"] = 130,
        ["Price"] = 18000000,
        ["LevelRequired"] = 600
    },
    [34] = {
        ["EffectValue"] = 135,
        ["Price"] = 19000000,
        ["LevelRequired"] = 600
    },
    [35] = {
        ["EffectValue"] = 140,
        ["Price"] = 20000000,
        ["LevelRequired"] = 600
    },
    [36] = {
        ["EffectValue"] = 145,
        ["Price"] = 21000000,
        ["LevelRequired"] = 600
    },
    [37] = {
        ["EffectValue"] = 150,
        ["Price"] = 22000000,
        ["LevelRequired"] = 600
    },
    [38] = {
        ["EffectValue"] = 155,
        ["Price"] = 25000000,
        ["LevelRequired"] = 1000
    },
    [39] = {
        ["EffectValue"] = 160,
        ["Price"] = 30000000,
        ["LevelRequired"] = 1000
    },
    [40] = {
        ["EffectValue"] = 165,
        ["Price"] = 35000000,
        ["LevelRequired"] = 1000
    },
    [41] = {
        ["EffectValue"] = 170,
        ["Price"] = 40000000,
        ["LevelRequired"] = 1000
    },
    [42] = {
        ["EffectValue"] = 175,
        ["Price"] = 45000000,
        ["LevelRequired"] = 1000
    },
    [43] = {
        ["EffectValue"] = 180,
        ["Price"] = 50000000,
        ["LevelRequired"] = 1000
    },
    [44] = {
        ["EffectValue"] = 185,
        ["Price"] = 55000000,
        ["LevelRequired"] = 1000
    },
    [45] = {
        ["EffectValue"] = 190,
        ["Price"] = 60000000,
        ["LevelRequired"] = 1000
    },
    [46] = {
        ["EffectValue"] = 195,
        ["Price"] = 65000000,
        ["LevelRequired"] = 1000
    },
    [47] = {
        ["EffectValue"] = 200,
        ["Price"] = 70000000,
        ["LevelRequired"] = 1000
    },
    [48] = {
        ["EffectValue"] = 205,
        ["Price"] = 80000000,
        ["LevelRequired"] = 1000
    },
    [49] = {
        ["EffectValue"] = 210,
        ["Price"] = 90000000,
        ["LevelRequired"] = 1000
    },
    [50] = {
        ["EffectValue"] = 215,
        ["Price"] = 100000000,
        ["LevelRequired"] = 1000
    },
    [51] = {
        ["EffectValue"] = 220,
        ["Price"] = 120000000,
        ["LevelRequired"] = 1000
    },
    [52] = {
        ["EffectValue"] = 225,
        ["Price"] = 140000000,
        ["LevelRequired"] = 1000
    },
    [53] = {
        ["EffectValue"] = 230,
        ["Price"] = 160000000,
        ["LevelRequired"] = 1000
    },
    [54] = {
        ["EffectValue"] = 235,
        ["Price"] = 180000000,
        ["LevelRequired"] = 1000
    },
    [55] = {
        ["EffectValue"] = 240,
        ["Price"] = 200000000,
        ["LevelRequired"] = 1000
    },
    [56] = {
        ["EffectValue"] = 245,
        ["Price"] = 220000000,
        ["LevelRequired"] = 1000
    },
    [57] = {
        ["EffectValue"] = 250,
        ["Price"] = 240000000,
        ["LevelRequired"] = 1000
    },
    ["MaxLevel"] = 57,
    ["ValueName"] = "CloneHealOnKillLevel",
    ["GetDisplayedText"] = function(_, p2)
        -- upvalues: (copy) v_u_1, (copy) v_u_3
        return "+" .. v_u_1.SimpleConversion(v_u_3[p2].EffectValue) .. "HP<font size=\'8\'>on kill</font>"
    end
}
return v_u_3

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Upgrader.GreedyCloneUpgrades
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.ConvertVal).SimpleConversion
local v2 = {
    ["EffectValue"] = {
        ["CrateEarning"] = 15000,
        ["KillEarning"] = 75000,
        ["KeyEarning"] = 225000
    },
    ["Price"] = 0,
    ["LevelRequired"] = 0
}
local v_u_3 = require(script.Parent.UpgradesMaker)(35, { 15000, 15000 }, { 3500000, 4000000 }, { 600, 1000 }, v2, {
    ["CrateEarning"] = 1,
    ["KillEarning"] = 5,
    ["KeyEarning"] = 15
})
function v_u_3.GetDisplayedText(_, p4)
    -- upvalues: (copy) v_u_3, (copy) v_u_1
    local v5 = v_u_3[p4].EffectValue
    return "+<font color=\"rgb(170, 129, 40)\">$" .. v_u_1(v5.CrateEarning) .. "</font><font size=\"8\">/crate</font>\n" .. "+<font color=\"rgb(193, 146, 45)\">$" .. v_u_1(v5.KillEarning) .. "</font><font size=\"11\">/kill</font>\n" .. "+<font color=\"rgb(218, 162, 50)\">$" .. v_u_1(v5.KeyEarning) .. "</font><font size=\"12\">/key</font>"
end
v_u_3.ValueName = "CloneGreedyUpgradeLevel"
return v_u_3

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Upgrader.CrateValueUpgrades
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(script.Parent.UpgradesMaker)(15, {
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1
}, {
    2500,
    10000,
    50000,
    250000,
    1000000,
    2500000,
    10000000,
    30000000
}, {
    0,
    25,
    50,
    100,
    200,
    400,
    600,
    1000
}, {
    ["EffectValue"] = 0,
    ["Price"] = 1000,
    ["LevelRequired"] = 0
})
function v_u_1.GetDisplayedText(_, p2)
    -- upvalues: (copy) v_u_1
    return "+" .. v_u_1[p2].EffectValue .. "%"
end
return v_u_1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Upgrader.RegenHPUpgrades
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.ConvertVal)
local v_u_2 = require(script.Parent.UpgradesMaker)(10, {
    0.1,
    0.15,
    0.2,
    0.25,
    0.3,
    0.35
}, {
    30000,
    100000,
    1000000,
    5000000,
    15000000,
    20000000
}, {
    140,
    200,
    400,
    600,
    1000,
    2000
}, {
    ["EffectValue"] = 1,
    ["Price"] = 0,
    ["LevelRequired"] = 0
})
function v_u_2.GetDisplayedText(_, p3)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    return "+" .. v_u_1.NotShowAfterPoint(v_u_2[p3].EffectValue, 2) .. "HP/s"
end
return v_u_2

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Upgrader.ZombieValueUpgrades
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.ConvertVal).SimpleConversion
local v_u_2 = require(script.Parent.UpgradesMaker)(9, {
    500,
    1500,
    4000,
    6000,
    25000,
    75000,
    150000
}, {
    30000,
    100000,
    500000,
    3000000,
    10000000,
    25000000,
    100000000
}, {
    18,
    50,
    100,
    200,
    400,
    1000,
    2000
}, {
    ["EffectValue"] = 500,
    ["Price"] = 0,
    ["LevelRequired"] = 0
})
function v_u_2.GetDisplayedText(_, p3)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    return "+$" .. v_u_1(v_u_2[p3].EffectValue) .. "<font size=\'8\'>/kill</font>"
end
return v_u_2

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Upgrader.LaserDoorUpgrades
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.ConvertVal).SimpleConversion
local v_u_2 = require(script.Parent.UpgradesMaker)(10, {
    5,
    10,
    15,
    20,
    25,
    30,
    35
}, {
    100000,
    500000,
    3000000,
    10000000,
    25000000,
    100000000
}, {
    85,
    100,
    200,
    400,
    1000,
    2000
}, {
    ["EffectValue"] = 150,
    ["Price"] = 0,
    ["LevelRequired"] = 0
})
function v_u_2.GetDisplayedText(_, p3)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    return v_u_1(v_u_2[p3].EffectValue) .. "<font size=\'8\'>dmg/hit</font>"
end
return v_u_2

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Upgrader.LaserBarrierUpgrades
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.ConvertVal).SimpleConversion
local v2 = {
    ["EffectValue"] = {
        ["HitDamage"] = 5,
        ["MaxDamage"] = 250
    },
    ["Price"] = 0,
    ["LevelRequired"] = 0
}
local v_u_3 = require(script.Parent.UpgradesMaker)(10, {
    0.5,
    1,
    1,
    2,
    2,
    3,
    3
}, {
    100000,
    400000,
    1000000,
    3000000,
    10000000,
    20000000,
    50000000
}, {
    85,
    100,
    200,
    400,
    600,
    1000,
    2000
}, v2, {
    ["HitDamage"] = 1,
    ["MaxDamage"] = 50
})
function v_u_3.GetDisplayedText(_, p4)
    -- upvalues: (copy) v_u_3, (copy) v_u_1
    local v5 = v_u_3[p4].EffectValue
    return "<font color=\"rgb(255, 150, 25)\"> " .. v_u_1(v5.HitDamage) .. " <font size=\"8\">dmg/hit</font></font>" .. "\n<font color=\"rgb(255, 50, 50)\">" .. v_u_1(v5.MaxDamage) .. " <font size=\"8\">max dmg</font></font>"
end
return v_u_3

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Upgrader.UpgradesMaker
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
function MakeUpgradeList(p1, p2, p3, p4, p5, p6)
    local v7 = p5.Price
    local v8 = p5.EffectValue
    local v9 = typeof(v8) == "table" and table.clone(p5.EffectValue) or p5.EffectValue
    local v10 = { p5 }
    for v11, v12 in pairs(p3) do
        local v13 = p4[v11]
        local v14 = p2[v11]
        for v15 = (v11 - 1) * p1 + 1, p1 * v11 do
            v7 = v7 + v12
            local v16 = {
                ["Price"] = v7,
                ["LevelRequired"] = v13
            }
            if p6 then
                for v17, _ in pairs(v9) do
                    v9[v17] = v9[v17] + v14 * p6[v17]
                end
                v16.EffectValue = table.clone(v9)
            else
                v9 = v9 + v14
                v16.EffectValue = v9
            end
            v10[v15] = v16
        end
    end
    v10.MaxLevel = #p3 * p1
    return v10
end
return MakeUpgradeList

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Upgrader.DoorUpgrades
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local _ = require(game:GetService("ReplicatedStorage").AllModules.ConvertVal).SimpleConversion
local v1 = require(script.Parent.UpgradesMaker)(10, {
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1
}, {
    5000,
    15000,
    30000,
    50000,
    75000,
    90000,
    100000,
    150000
}, {
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
}, {
    ["EffectValue"] = 0,
    ["Price"] = 0,
    ["LevelRequired"] = 0
})
v1.ValueName = "DoorLevel"
v1.GamepassName = "FastDoorOpening"
function v1.GetDisplayedText(_, p2, p3)
    return (p3 and -100 or -p2) .. "%"
end
v1.OpeningTime = {
    ["wooden key"] = 1.5,
    ["stone key"] = 2,
    ["silver key"] = 2.5,
    ["golden key"] = 3,
    ["diamond key"] = 3.5,
    ["winter key"] = 2.5,
    ["halloween key"] = 2,
    ["red christmas key"] = 2,
    ["green easter key"] = 2
}
return v1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Customization.CustomisationUnlockedWithGP
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = {}
local v_u_2 = {
    ["Color1Part"] = {
        ["Materials"] = true
    },
    ["Color2Part"] = {
        ["Materials"] = 400
    },
    ["Color3Part"] = {
        ["Materials"] = 1000
    },
    ["Color4Part"] = {
        ["Materials"] = true,
        ["Colors"] = 200
    },
    ["Color5Part"] = {
        ["Materials"] = true,
        ["Colors"] = true
    },
    ["Color6Part"] = {
        ["Materials"] = true,
        ["Colors"] = 50
    },
    ["Color7Part"] = {
        ["Materials"] = true,
        ["Colors"] = 600
    },
    ["Color8Part"] = {
        ["Colors"] = 1500
    }
}
v1.UnlockedWithGPList = v_u_2
function v1.CanCustomize(p3, p4, p5, p6)
    -- upvalues: (copy) v_u_2
    if p5 or not v_u_2[p3][p4] then
        return true
    end
    local v7 = v_u_2[p3][p4]
    local v8 = tonumber(v7)
    return v8 and v8 <= p6 and true or false
end
return v1

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Customization.AvialableMaterials
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    [Enum.Material.DiamondPlate.Name] = "rbxassetid://10237720195",
    [Enum.Material.WoodPlanks.Name] = "rbxassetid://9920626778",
    [Enum.Material.Carpet.Name] = "rbxassetid://14108662587",
    [Enum.Material.Fabric.Name] = "rbxassetid://9920517696",
    [Enum.Material.Metal.Name] = "rbxassetid://9920574687",
    [Enum.Material.Brick.Name] = "rbxassetid://9920482813",
    [Enum.Material.Glass.Name] = "rbxassetid://9438868521",
    [Enum.Material.Wood.Name] = "rbxassetid://9920625290",
    [Enum.Material.Plastic.Name] = "",
    [Enum.Material.Neon.Name] = ""
}

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Functions.ScaleNumberSequence
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1, p2)
    local v3 = {}
    for _, v4 in pairs(p1.Keypoints) do
        local v5 = NumberSequenceKeypoint.new
        local v6 = v4.Time
        local v7 = v4.Value * p2
        local v8 = v4.Envelope * p2
        table.insert(v3, v5(v6, v7, v8))
    end
    return NumberSequence.new(v3)
end

--========================================
-- ModuleScript : ReplicatedStorage.AllModules.Functions.ScaleNumbeRange
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return function(p1, p2)
    return NumberRange.new(p1.Min * p2, p1.Max * p2)
end
