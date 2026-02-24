
--========================================
-- LocalScript : StarterGui.MainGui.KeyGenFrame.KeyGeneratorLocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ProximityPromptService")
local v_u_2 = game:GetService("MarketplaceService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("ReplicatedStorage")
local v5 = game:GetService("CollectionService")
local v6 = game:GetService("SoundService")
local v_u_7 = game:GetService("TweenService")
local v_u_8 = game:GetService("StarterGui")
local v_u_9 = game:GetService("Players").LocalPlayer
local v_u_10 = workspace.Camera
local v_u_11 = require(v_u_9.PlayerScripts:WaitForChild("PlayerModule")):GetControls()
local v_u_12 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local v_u_13 = v_u_4.RemoteEvent.GuiEvent.GuiEventLocal
local v_u_14 = v_u_4.RemoteEvent.PlaySoundEvent.PlaySoundEventLocal
local v_u_15 = v_u_4.RemoteFunction.UpgradeKeyGenF
local v16 = v_u_4.AllModules
local v_u_17 = require(v16.KeyInputLabelMaker)
local v_u_18 = require(v16.KeyGeneratorStats)
local v_u_19 = require(v16.InputManager)
local v_u_20 = require(v16.UsefullFunction)
local v_u_21 = require(v16.ConvertVal)
local v_u_22 = require(v16.ImageFromName)
local v_u_23 = script.Parent
local v_u_24 = v_u_23.Parent
local v_u_25 = v_u_24.LowerFrameContainer.ToolFrame
local v_u_26 = v_u_23.UIStroke
local v_u_27 = v_u_23.CloseBttn
local v_u_28 = v_u_23.StatsFrame
local v_u_29 = v_u_23.ForRareKeyBttn
local v_u_30 = v_u_29.RareKeyBttn
local v_u_31 = v_u_29.UIScale
local v_u_32 = v_u_23.UpgradeBttn
local v_u_33 = v_u_32.UIScale
local v_u_34 = v_u_23.Level
local v_u_35 = v_u_30.RareKeyLabel
local v_u_36 = v_u_23.AutoCollectBttn
local v37 = v_u_9:WaitForChild("Stats")
local v_u_38 = v37.KeyGenerator1Level
local v_u_39 = v_u_9.leaderstats.Cash
local v_u_40 = v37:WaitForChild("GamePass"):WaitForChild("AutoCollectKeys")
local v_u_41 = v37.GamePass:WaitForChild("OnlyRareKeys")
local v_u_42 = v_u_9:WaitForChild("leaderstats"):WaitForChild("Level")
local v_u_43 = v_u_23.Position
local _ = v_u_23.Size
local v_u_44 = v_u_18.MaxLevel
local v_u_45 = Enum.KeyCode.ButtonY
local v_u_46 = v6:WaitForChild("Sound"):WaitForChild("WhooshSoundBis")
local v_u_47 = v6.Sound.ClickSound
local v_u_48 = Color3.new(1)
local v_u_49 = Color3.new(0, 1)
local v_u_50 = Color3.new(0.75, 0.75, 0.75)
local v_u_51 = Color3.new(1, 1, 1)
local v_u_52 = {}
local v_u_53 = nil
local v_u_54 = nil
local v_u_55 = nil
local v_u_56 = false
local v_u_57 = nil
local v_u_58 = nil
local v_u_59 = nil
local v_u_60 = nil
local v_u_61 = nil
local v_u_62 = nil
local v_u_63 = nil
local v_u_64 = nil
local v_u_65 = nil
local v_u_66 = nil
local v_u_67 = nil
local v_u_68 = nil
local v_u_69 = nil
local v_u_70 = 0
local v_u_71 = nil
local v_u_72 = nil
local v_u_73 = nil
for v74, v75 in pairs(script:GetAttributes()) do
    local v76 = v74:find("_", nil, true)
    if v76 then
        v_u_52[v74:sub(1, v76 - 1) .. " " .. v74:sub(v76 + 1) .. " key"] = v75
    else
        v_u_52[v74 .. " key"] = v75
    end
end
function ScaleGui()
    -- upvalues: (copy) v_u_23, (copy) v_u_26, (copy) v_u_27
    if v_u_23.AbsoluteSize ~= nil then
        v_u_26.Thickness = 0.0302 * v_u_23.AbsoluteSize.X
        v_u_23.Title.UIStroke.Thickness = 0.01813 * v_u_23.AbsoluteSize.X
        v_u_27.UIStroke.Thickness = v_u_23.Title.UIStroke.Thickness
    end
end
local v_u_77 = Color3.new(1, 1, 0.3)
function AnimateGenSurfaceGui(p78, p_u_79)
    -- upvalues: (copy) v_u_22, (copy) v_u_21, (copy) v_u_49, (copy) v_u_77, (copy) v_u_18
    local v80 = p78:WaitForChild("CanvasGroup")
    local v_u_81 = v80:WaitForChild("KeyLabel")
    local v_u_82 = v80:WaitForChild("TimeLabel")
    local v83 = v80:WaitForChild("LoadingBar")
    local v_u_84 = v83:WaitForChild("Prct")
    local v_u_85 = v83:FindFirstChild("UIGradient") or Instance.new("UIGradient", v83)
    local v_u_86 = p78.Parent.Parent:WaitForChild("Base"):WaitForChild("Attachment"):WaitForChild("KeyEmitter")
    local v_u_87 = p_u_79.Stats.KeyGenerator1Level
    local v_u_88 = v_u_87.KeyGenCurrentKey
    local v_u_89 = v_u_87.KeyGenTimeLeft
    local v_u_90 = 1000
    local v_u_91 = ""
    local function v96()
        -- upvalues: (copy) v_u_89, (copy) v_u_82, (copy) v_u_84, (ref) v_u_91, (copy) v_u_86, (ref) v_u_22, (ref) v_u_21, (ref) v_u_90, (copy) v_u_85, (ref) v_u_49, (ref) v_u_77
        local v92
        if v_u_89.Value == 0 then
            v92 = 1
            v_u_82.Text = " 0s"
            v_u_84.Text = "100%"
            local v93 = v_u_91
            if v93 ~= "" then
                v_u_86.Enabled = true
                v_u_86.Texture = v_u_22[v93].Image
            end
        else
            if v_u_91 == "" then
                return
            end
            v_u_82.Text = " " .. v_u_21.ConvertInHour(v_u_89.Value)
            v92 = 1 - v_u_89.Value / v_u_90
            local v94 = v_u_84
            local v95 = 100 * v92
            v94.Text = math.floor(v95) .. "%"
        end
        if v92 + 0.001 >= 1 then
            v_u_85.Color = ColorSequence.new(v_u_49)
            return
        elseif v92 <= 0 then
            v_u_85.Color = ColorSequence.new(v_u_77)
        else
            v_u_85.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, v_u_49),
                ColorSequenceKeypoint.new(v92, v_u_49),
                ColorSequenceKeypoint.new(v92 + 0.001, v_u_77),
                ColorSequenceKeypoint.new(1, v_u_77)
            })
        end
    end
    local function v98()
        -- upvalues: (ref) v_u_91, (copy) v_u_88, (copy) v_u_81, (ref) v_u_18, (copy) p_u_79, (copy) v_u_87, (ref) v_u_90, (copy) v_u_86
        v_u_91 = v_u_88.Value
        if v_u_91 == "" then
            v_u_86.Enabled = false
            v_u_81.Text = "Loading..."
        else
            v_u_81.Text = v_u_91:sub(1, 1):upper() .. v_u_91:sub(2)
            local v97 = v_u_18.GetKeyGenLevelDescription(p_u_79, v_u_87)
            v_u_90 = v97.Time[table.find(v97.Keys, v_u_91)]
            if not v_u_90 or v_u_90 <= 0 then
                v_u_90 = 10000
                return
            end
        end
    end
    local v99 = v_u_88.Changed:Connect(v98)
    local v100 = v_u_89.Changed:Connect(v96)
    v98()
    v96()
    return v99, v100
end
function LeaveKeyGen(p101, p102)
    -- upvalues: (ref) v_u_73, (ref) v_u_59, (ref) v_u_53, (ref) v_u_66, (copy) v_u_33, (copy) v_u_11, (copy) v_u_10, (copy) v_u_1, (copy) v_u_8, (copy) v_u_23, (copy) v_u_27, (copy) v_u_25, (copy) v_u_9, (ref) v_u_54, (ref) v_u_63, (ref) v_u_71, (ref) v_u_72, (ref) v_u_67, (ref) v_u_57, (ref) v_u_55, (ref) v_u_58
    if v_u_73 and v_u_73.PlaybackState ~= Enum.PlaybackState.Completed then
        v_u_73:Cancel()
        v_u_59:Cancel()
        if v_u_53 then
            v_u_53:Cancel()
        end
    end
    if v_u_66 then
        v_u_66.Visible = false
    end
    v_u_33:RemoveTag("SizableUI")
    v_u_11:Enable()
    v_u_10.CameraType = Enum.CameraType.Custom
    v_u_1.Enabled = true
    p101.Enabled = true
    v_u_8:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
    v_u_8:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
    v_u_8:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
    v_u_23.Position = UDim2.fromOffset(-v_u_27.AbsoluteSize.X * 2 - v_u_23.AbsoluteSize.X)
    v_u_25.Visible = true
    if p102 ~= v_u_9 then
        p101.Parent.Parent.ProgressionPart.KeyGenSurfaceGui.Enabled = false
        p101.Parent.Parent.Base.Attachment.KeyEmitter.Enabled = false
    end
    if v_u_54 then
        v_u_54:Disconnect()
    end
    if v_u_63 then
        v_u_63:Disconnect()
    end
    if v_u_71 then
        v_u_71:Disconnect()
    end
    if v_u_72 then
        v_u_72:Disconnect()
    end
    if v_u_67 then
        v_u_67:Disconnect()
    end
    if v_u_57 then
        v_u_57:Disconnect()
    end
    if v_u_55 then
        v_u_55:Disconnect()
    end
    if v_u_58 then
        v_u_58:Disconnect()
    end
    AllUpgradeBttnsDisconnect(true)
end
function AllUpgradeBttnsDisconnect(p103)
    -- upvalues: (ref) v_u_68, (ref) v_u_65, (ref) v_u_64, (ref) v_u_61, (ref) v_u_69, (ref) v_u_62, (ref) v_u_60
    if v_u_68 and v_u_68.Connected then
        v_u_68:Disconnect()
    end
    if v_u_65 and v_u_65.Connected then
        v_u_65:Disconnect()
    end
    if v_u_64 and v_u_64.Connected then
        v_u_64:Disconnect()
    end
    if v_u_61 and v_u_61.Connected then
        v_u_61:Disconnect()
    end
    CurrentUpgradeF = nil
    if p103 then
        if v_u_69 and v_u_69.Connected then
            v_u_69:Disconnect()
        end
        if v_u_62 and v_u_62.Connected then
            v_u_62:Disconnect()
        end
        if v_u_60 and v_u_60.Connected then
            v_u_60:Disconnect()
        end
    end
end
function PrintPriceOrLevelRequiredOnBttn(_, p104)
    -- upvalues: (copy) v_u_42, (copy) v_u_32, (copy) v_u_50, (copy) v_u_21
    local v105 = p104.LevelRequired or 0
    if v_u_42.Value < v105 then
        v_u_32.Text = "Upgrade\nFloor " .. v_u_42.Value .. "/" .. v105
        v_u_32.BackgroundColor3 = v_u_50
    else
        v_u_32.Text = "Upgrade\n$" .. v_u_21.SimpleConversion(p104.Price)
    end
end
function PrintStats(p106, p107, p108)
    -- upvalues: (copy) v_u_18, (copy) v_u_28, (copy) v_u_21, (copy) v_u_52, (copy) v_u_22, (copy) v_u_49, (ref) v_u_70, (copy) v_u_35, (copy) v_u_44, (copy) v_u_32, (copy) v_u_9, (copy) v_u_34
    local v109, _ = v_u_18.GetKeyGenLevelDescription(p108, nil, p106)
    local v110 = v109.Keys
    local v111 = v109.Time
    local v112 = v109.Probs
    for v113 = 1, 5 do
        local v114 = v_u_28[v113]
        v114.Prct.Text = v112[v113] / 10 .. "%"
        v114.Prct.TextColor3 = p107
        v114.Time.Text = v_u_21.ConvertInHour(v111[v113])
        v114.Time.TextColor3 = p107
        local v115 = v110[v113]
        v114.UIGradient.Color = v_u_52[v115]
        v114.KeyImg.Image = v_u_22[v115].Image
    end
    if p107 == v_u_49 then
        if p106 == "Special" then
            if v_u_70 and v_u_70 ~= 0 then
                v_u_35.Text = utf8.char(57346) .. v_u_70
            else
                v_u_35.Text = "..."
            end
        else
            PrintPriceOrLevelRequiredOnBttn(p108, v109)
        end
    elseif p106 == "Special" then
        v_u_35.Text = "Only rare keys\nenabled"
    else
        v_u_35.Text = "Only rare keys"
        if v_u_44 <= tonumber(p106) then
            v_u_32.Text = "Max"
        elseif p108 == v_u_9 then
            local v116 = v_u_18.GetKeyGenLevelDescription(p108, nil, p106 + 1)
            PrintPriceOrLevelRequiredOnBttn(p108, v116)
        else
            v_u_32.Text = "Upgrade"
        end
    end
    if p106 == "Special" then
        v_u_34.Text = "Special"
    else
        v_u_34.Text = "Level:" .. (tonumber(p106) >= 10 and p106 and p106 or " " .. p106)
    end
    v_u_34.TextColor3 = p107
end
function OnKeyGenAdded(p_u_117)
    -- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_1, (copy) v_u_8, (copy) v_u_46, (copy) v_u_25, (copy) v_u_4, (ref) v_u_53, (copy) v_u_7, (copy) v_u_12, (ref) v_u_54, (ref) v_u_63, (copy) v_u_10, (ref) v_u_73, (copy) v_u_23, (copy) v_u_27, (copy) v_u_24, (ref) v_u_59, (copy) v_u_43, (copy) v_u_51, (ref) v_u_57, (copy) v_u_40, (copy) v_u_36, (copy) v_u_49, (copy) v_u_47, (copy) v_u_2, (copy) v_u_48, (ref) v_u_55, (copy) v_u_20, (copy) v_u_44, (copy) v_u_32, (copy) v_u_50, (copy) v_u_30, (copy) v_u_31, (ref) v_u_71, (copy) v_u_3, (copy) v_u_45, (ref) v_u_72, (ref) v_u_67, (ref) v_u_58
    local v118 = p_u_117:WaitForChild("Base")
    p_u_117:WaitForChild("ProgressionPart")
    local v_u_119 = v118:WaitForChild("ProximityPrompt")
    local v_u_120 = p_u_117:WaitForChild("GlassPart")
    local v_u_121 = p_u_117.Parent.Parent.Owner.Value
    local v_u_122 = nil
    v_u_119.Triggered:Connect(function()
        -- upvalues: (ref) v_u_9, (ref) v_u_11, (ref) v_u_1, (copy) v_u_119, (ref) v_u_8, (ref) v_u_46, (ref) v_u_25, (ref) v_u_122, (ref) v_u_4, (copy) p_u_117, (copy) v_u_121, (ref) v_u_53, (ref) v_u_7, (ref) v_u_12, (ref) v_u_54, (ref) v_u_63, (ref) v_u_10, (ref) v_u_73, (copy) v_u_120, (ref) v_u_23, (ref) v_u_27, (ref) v_u_24, (ref) v_u_59, (ref) v_u_43, (ref) v_u_51, (ref) v_u_57, (ref) v_u_40, (ref) v_u_36, (ref) v_u_49, (ref) v_u_47, (ref) v_u_2, (ref) v_u_48, (ref) v_u_55, (ref) v_u_20, (ref) v_u_44, (ref) v_u_32, (ref) v_u_50, (ref) v_u_30, (ref) v_u_31, (ref) v_u_71, (ref) v_u_3, (ref) v_u_45, (ref) v_u_72, (ref) v_u_67, (ref) v_u_58
        local v123 = v_u_9.Character
        if v123 then
            v123 = v_u_9.Character:FindFirstChild("Humanoid")
        end
        if v123 and v123.Health > 0 then
            v_u_11:Disable()
            v_u_1.Enabled = false
            v_u_119.Enabled = false
            v_u_8:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
            v_u_46:Play()
            v_u_25.Visible = false
            ScaleGui()
            if not v_u_122 then
                v_u_122 = v_u_4.KeyGenSurfaceGui:Clone()
                v_u_122.Parent = p_u_117:WaitForChild("ProgressionPart")
            end
            if v_u_121 ~= v_u_9 then
                v_u_122.CanvasGroup.GroupTransparency = 1
                v_u_122.Enabled = true
                v_u_53 = v_u_7:Create(v_u_122.CanvasGroup, v_u_12, {
                    ["GroupTransparency"] = 0
                })
                v_u_53:Play()
                local v124, v125 = AnimateGenSurfaceGui(v_u_122, v_u_121)
                v_u_54 = v124
                v_u_63 = v125
            end
            v_u_10.CameraType = Enum.CameraType.Scriptable
            v_u_73 = v_u_7:Create(v_u_10, v_u_12, {
                ["CFrame"] = CFrame.lookAt(v_u_120.CFrame * CFrame.new(0, 3, 10).Position, v_u_120.Position - Vector3.new(0, 1, 0))
            })
            v_u_73:Play()
            v_u_23.Position = UDim2.fromOffset(-v_u_27.AbsoluteSize.X * 2 - v_u_23.AbsoluteSize.X, v_u_24.AbsoluteSize.Y / 2)
            v_u_23.Visible = true
            v_u_59 = v_u_7:Create(v_u_23, v_u_12, {
                ["Position"] = v_u_43
            })
            v_u_59:Play()
            PrintStats(v_u_121.Stats.KeyGenerator1Level.Value, v_u_51, v_u_121)
            if v_u_121 == v_u_9 then
                ConnectOwnerUpgrades()
                local function v127()
                    -- upvalues: (ref) v_u_57, (ref) v_u_40, (ref) v_u_36, (ref) v_u_49, (ref) v_u_47, (ref) v_u_2, (ref) v_u_9, (ref) v_u_48
                    if v_u_57 and v_u_57.Connected then
                        v_u_57:Disconnect()
                    end
                    local v126 = v_u_40.Value
                    v_u_36.TextLabel.Text = "Auto collect keys:\n" .. (v126 and "ON" or "OFF")
                    v_u_36.AutoButtonColor = not v126
                    if v126 then
                        v_u_36.UIScale:RemoveTag("SizableUI")
                        v_u_36.UIGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 255, 160)), ColorSequenceKeypoint.new(0.725, Color3.fromRGB(118, 255, 118)), ColorSequenceKeypoint.new(1, v_u_49) })
                    else
                        v_u_36.UIScale:AddTag("SizableUI")
                        v_u_57 = v_u_36.Activated:Connect(function()
                            -- upvalues: (ref) v_u_47, (ref) v_u_2, (ref) v_u_9
                            v_u_47:Play()
                            v_u_2:PromptGamePassPurchase(v_u_9, 1101979139)
                        end)
                        v_u_36.UIGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 160, 160)), ColorSequenceKeypoint.new(0.725, Color3.fromRGB(255, 118, 118)), ColorSequenceKeypoint.new(1, v_u_48) })
                    end
                end
                v_u_55 = v_u_40.Changed:Connect(v127)
                v127()
                v_u_36.Visible = true
            else
                if v_u_20.HasGamePass(v_u_121, "OnlyRareKeys") then
                    ColorButtonForRareKeys()
                else
                    local v128 = v_u_121.Stats.KeyGenerator1Level.Value
                    if tonumber(v128) < v_u_44 then
                        local v129 = v_u_32
                        v_u_32.Active = false
                        v129.AutoButtonColor = false
                        v_u_32.BackgroundColor3 = v_u_50
                        local v130 = v_u_30
                        v_u_30.Active = false
                        v130.AutoButtonColor = false
                        v_u_30.BackgroundColor3 = v_u_50
                        v_u_31:RemoveTag("SizableUI")
                    else
                        MaxUpgradeButton()
                        local v131 = v_u_30
                        v_u_30.Active = false
                        v131.AutoButtonColor = false
                        v_u_30.BackgroundColor3 = v_u_50
                        v_u_31:RemoveTag("SizableUI")
                    end
                end
                v_u_36.Visible = false
            end
            v_u_71 = v_u_3.InputBegan:Connect(function(p132, p133)
                -- upvalues: (ref) v_u_119, (ref) v_u_121, (ref) v_u_45
                if p133 then
                    return
                elseif p132.KeyCode == Enum.KeyCode.X or (p132.KeyCode == Enum.KeyCode.Space or p132.KeyCode == Enum.KeyCode.ButtonB) then
                    LeaveKeyGen(v_u_119, v_u_121)
                elseif p132.KeyCode == v_u_45 and CurrentUpgradeF then
                    CurrentUpgradeF()
                end
            end)
            v_u_72 = v_u_27.Activated:Once(function()
                -- upvalues: (ref) v_u_47, (ref) v_u_119, (ref) v_u_121
                v_u_47:Play()
                LeaveKeyGen(v_u_119, v_u_121)
            end)
            v_u_67 = p_u_117.Destroying:Once(function()
                -- upvalues: (ref) v_u_119, (ref) v_u_121
                LeaveKeyGen(v_u_119, v_u_121)
            end)
            v_u_58 = v123.Died:Once(function()
                -- upvalues: (ref) v_u_119, (ref) v_u_121
                LeaveKeyGen(v_u_119, v_u_121)
            end)
        end
    end)
    if v_u_121 == v_u_9 then
        v_u_122 = v_u_4.KeyGenSurfaceGui:Clone()
        v_u_122.Parent = p_u_117:WaitForChild("ProgressionPart")
        AnimateGenSurfaceGui(v_u_122, v_u_9)
    end
end
function ConnectOwnerUpgrades()
    -- upvalues: (copy) v_u_41, (copy) v_u_38, (copy) v_u_44, (copy) v_u_32, (copy) v_u_18, (copy) v_u_9, (copy) v_u_42, (copy) v_u_50, (copy) v_u_39, (copy) v_u_49, (copy) v_u_48, (copy) v_u_19, (ref) v_u_66, (copy) v_u_17, (copy) v_u_45, (ref) v_u_56, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15, (copy) v_u_23, (copy) v_u_51, (ref) v_u_64, (ref) v_u_68, (ref) v_u_65, (copy) v_u_33, (ref) v_u_61, (ref) v_u_69, (ref) v_u_62, (copy) v_u_29, (ref) v_u_60, (copy) v_u_30, (copy) v_u_31
    if v_u_41.Value then
        ColorButtonForRareKeys()
    else
        local v134 = v_u_38.Value
        if tonumber(v134) < v_u_44 then
            local v135 = v_u_32
            v_u_32.Active = true
            v135.AutoButtonColor = false
            local v136 = v_u_18.GetKeyGenLevelDescription(v_u_9, nil, v_u_38.Value + 1)
            v_u_32.BackgroundColor3 = (v136.LevelRequired or 0) > v_u_42.Value and v_u_50 or (v_u_39.Value >= v136.Price and v_u_49 or v_u_48)
            local v_u_137 = false
            if v_u_19.LastInputType == "Gamepad" then
                if v_u_66 then
                    v_u_66.Visible = true
                else
                    v_u_66 = v_u_17.ShowKeyInputImage(v_u_32, v_u_45, {
                        ["Position"] = UDim2.fromScale(1, 1),
                        ["Size"] = UDim2.fromScale(0.45, 0.45),
                        ["AnchorPoint"] = Vector2.new(0.8, 0.8)
                    })
                end
            end
            function CurrentUpgradeF()
                -- upvalues: (ref) v_u_56, (ref) v_u_38, (ref) v_u_44, (ref) v_u_18, (ref) v_u_9, (ref) v_u_42, (ref) v_u_13, (ref) v_u_39, (ref) v_u_14, (ref) v_u_15, (ref) v_u_23, (ref) v_u_51, (ref) v_u_137, (ref) v_u_49
                if v_u_56 then
                    return
                else
                    local v138 = v_u_38.Value
                    if tonumber(v138) and v_u_44 > tonumber(v138) then
                        local v139 = v_u_18.GetKeyGenLevelDescription
                        local v140 = v_u_9
                        local v141 = v138 + 1
                        local v142 = v139(v140, nil, (tostring(v141)))
                        local v143 = v142.LevelRequired or 0
                        if v_u_42.Value < v143 then
                            v_u_13:Fire("WrongMessage", "Upgrade requires level " .. v143)
                            return
                        elseif v_u_39.Value < v142.Price then
                            v_u_14:Fire("Tycoon Error (Sound)")
                        else
                            v_u_56 = true
                            local v144, v145 = v_u_15:InvokeServer(v138 + 1)
                            v_u_56 = false
                            v_u_14:Fire("BuySound")
                            if v144 and v_u_23.Visible then
                                if v_u_44 <= tonumber(v145) then
                                    MaxUpgradeButton()
                                    AllUpgradeBttnsDisconnect(false)
                                    local v146 = v_u_44
                                    PrintStats(tostring(v146), v_u_51, v_u_9)
                                    return
                                end
                                if v_u_137 then
                                    local v147 = PrintStats
                                    local v148 = v145 + 1
                                    v147(tostring(v148), v_u_49, v_u_9)
                                    return
                                end
                                PrintStats(v145, v_u_51, v_u_9)
                            end
                        end
                    else
                        return
                    end
                end
            end
            v_u_64 = v_u_32.Activated:Connect(CurrentUpgradeF)
            local v149, v150
            if v_u_19.LastInputType == "Gamepad" then
                v149 = v_u_32.SelectionGained
                v150 = v_u_32.SelectionLost
            else
                v149 = v_u_32.MouseEnter
                v150 = v_u_32.MouseLeave
            end
            v_u_68 = v149:Connect(function()
                -- upvalues: (ref) v_u_137, (ref) v_u_38, (ref) v_u_49, (ref) v_u_9
                v_u_137 = true
                local v151 = PrintStats
                local v152 = v_u_38.Value + 1
                v151(tostring(v152), v_u_49, v_u_9)
            end)
            v_u_65 = v150:Connect(function()
                -- upvalues: (ref) v_u_137, (ref) v_u_38, (ref) v_u_51, (ref) v_u_9
                v_u_137 = false
                PrintStats(v_u_38.Value, v_u_51, v_u_9)
            end)
            v_u_33:AddTag("SizableUI")
            v_u_61 = v_u_39.Changed:Connect(function()
                -- upvalues: (ref) v_u_18, (ref) v_u_9, (ref) v_u_38, (ref) v_u_32, (ref) v_u_42, (ref) v_u_50, (ref) v_u_39, (ref) v_u_49, (ref) v_u_48
                local v153 = v_u_18.GetKeyGenLevelDescription
                local v154 = v_u_9
                local v155 = v_u_38.Value + 1
                local v156 = v153(v154, nil, (tostring(v155)))
                v_u_32.BackgroundColor3 = (v156.LevelRequired or 0) > v_u_42.Value and v_u_50 or (v_u_39.Value >= v156.Price and v_u_49 or v_u_48)
            end)
        else
            MaxUpgradeButton()
        end
        v_u_69 = v_u_41.Changed:Connect(function()
            -- upvalues: (ref) v_u_41, (ref) v_u_14, (ref) v_u_51, (ref) v_u_9, (ref) v_u_33, (ref) v_u_66
            if v_u_41.Value then
                AllUpgradeBttnsDisconnect(true)
                v_u_14:Fire("BuySound")
                PrintStats("Special", v_u_51, v_u_9)
                ColorButtonForRareKeys()
                v_u_33:RemoveTag("SizableUI")
                if v_u_66 then
                    v_u_66.Visible = false
                end
            end
        end)
        v_u_62 = v_u_29.MouseEnter:Connect(function()
            -- upvalues: (ref) v_u_49, (ref) v_u_9
            PrintStats("Special", v_u_49, v_u_9)
        end)
        v_u_60 = v_u_29.MouseLeave:Connect(function()
            -- upvalues: (ref) v_u_38, (ref) v_u_51, (ref) v_u_9
            PrintStats(v_u_38.Value, v_u_51, v_u_9)
        end)
        local v157 = v_u_30
        v_u_30.Active = true
        v157.AutoButtonColor = true
        v_u_30.BackgroundColor3 = v_u_49
        v_u_31:AddTag("SizableUI")
    end
end
function MaxUpgradeButton()
    -- upvalues: (copy) v_u_32, (copy) v_u_50
    local v158 = v_u_32
    v_u_32.Active = false
    v158.AutoButtonColor = false
    v_u_32.BackgroundColor3 = v_u_50
    v_u_32.Text = "Max"
end
function ColorButtonForRareKeys()
    -- upvalues: (copy) v_u_32, (copy) v_u_30, (copy) v_u_35, (copy) v_u_31
    local v159 = v_u_32
    v_u_32.Active = false
    v159.AutoButtonColor = false
    v_u_32.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    v_u_32.Text = "Rare keys"
    local v160 = v_u_30
    v_u_30.Active = false
    v160.AutoButtonColor = false
    v_u_30.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    v_u_35.Text = "Only rare keys\nenabled"
    v_u_31:RemoveTag("SizableUI")
end
v_u_30.Activated:Connect(function()
    -- upvalues: (copy) v_u_2, (copy) v_u_9
    v_u_2:PromptGamePassPurchase(v_u_9, 77670376)
end)
v5:GetInstanceAddedSignal("KeyGenerator"):Connect(OnKeyGenAdded)
for _, v161 in pairs(v5:GetTagged("KeyGenerator")) do
    OnKeyGenAdded(v161)
end
while not v_u_70 or v_u_70 == 0 do
    local v162, _ = pcall(function()
        -- upvalues: (copy) v_u_2, (ref) v_u_70
        v_u_70 = v_u_2:GetProductInfo(77670376, Enum.InfoType.GamePass).PriceInRobux
    end)
    if not v162 then
        task.wait(1)
    end
end

--========================================
-- LocalScript : StarterGui.MainGui.UnlockFloorFrame.UnlockFloorScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("SoundService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = v_u_4:WaitForChild("leaderstats").Level
local v_u_6 = v_u_4:WaitForChild("Stats"):WaitForChild("SpecialFloorClaimed")
local v7 = v_u_1.AllModules
local v_u_8 = require(v7.GetEventNameFromEventFloorName)
local v_u_9 = require(v7.UsefullFunction).HasPlayerTool
local v_u_10 = require(v7.UnlockFloorActions)
local v_u_11 = require(v7.GetTowerForPlayer)
local v12 = require(v7.GuiMark)
local v13 = v_u_1.BindableEvents.GuiEvents.ToggleUnlockFloorFrame
local v_u_14 = v_u_1.RemoteEvent.GuiEvent.GuiEventLocal
local v_u_15 = v_u_1.BindableEvents.EquipToolBE
local v16 = v_u_1.BindableFunctions.UnlockFloorsBF.FloorToGuiF
local v_u_17 = v_u_1.BindableFunctions.UnlockFloorsBF.GuiToFloorF
local v_u_18 = v_u_1.RemoteFunction.GetFloorBadgeF
local v_u_19 = v_u_1.RemoteFunction.ClaimFloorF
local v_u_20 = script.Parent
local v_u_21 = v_u_20.UIScale
local v_u_22 = v_u_20.Parent
local v_u_23 = v_u_20.FloorNameLabel
local _ = v_u_20.CloseBttn
local v_u_24 = v_u_20.ClaimFrame
local v_u_25 = v_u_20.BackBttn
local v_u_26 = v_u_20.FloorsOwned
local v27 = v_u_22.ButtonContainer.TowerFloorsBttn
local v_u_28 = v12.AddMark(v27, false)
local v_u_29 = v_u_24.ToUnclock
local v_u_30 = v_u_24.ClaimButton
local v_u_31 = v12.AddMark(v_u_30, false)
local v_u_32 = v_u_30.UIGradient
local v_u_33 = v_u_30.ClaimText
local v_u_34 = v_u_24.ClaimSection
local v_u_35 = v_u_24.TimeWarning
local v36 = v_u_24.FameForUnlockDescription
local v_u_37 = v36.UnclockButton
local v_u_38 = v36.UnclockDescription
local v_u_39 = v36.DescImage
local v_u_40 = v_u_20.LevelLocked
local v_u_41 = v_u_40.AdditionalUnclockDescription
local v_u_42 = v_u_40.YouNeedLevel
local v_u_43 = v_u_40.BadgeImage
local v_u_44 = v_u_43.LevelDisplay
local v_u_45 = v_u_40.Plus
local v_u_46 = v_u_20.CongratsFrame
local v_u_47 = v_u_46.ClaimBadgeButton
local v_u_48 = v_u_46.BadgeImage
local v_u_49 = v_u_46.Congratulation
local v_u_50 = v_u_46.FlexUrBadge
local v_u_51 = v_u_46.GoToFloorTxt
local v_u_52 = v_u_46.GotToFloor
local v_u_53 = v_u_20.BuildFrame
local v_u_54 = v_u_53.GoToFloorBttn
local v_u_55 = v12.AddMark(v_u_54, true)
local v_u_56 = v_u_53.BadgeImage
local v_u_57 = v_u_53.BuildTheFloor
local v_u_58 = v_u_53.GoToDesc
local v_u_59 = v_u_20.AllFloorScrollingFrame
local v_u_60 = v_u_59.FloorBttnTemplate
local v_u_61 = v_u_59.UIGridLayout
local v_u_62 = v_u_59.UIPadding
v_u_60.Parent = script
local v_u_63 = require(v_u_22.MainGuiScript.ToggleFrameModule)
local v_u_64 = v2:WaitForChild("Sound"):WaitForChild("ClickSound")
local v_u_65 = v2.Sound:WaitForChild("BuySound")
local v_u_66 = nil
local v_u_67 = nil
local v_u_68 = nil
local v_u_69 = nil
local v_u_70 = nil
local v_u_71 = nil
local v_u_72 = v_u_22:GetAttribute("BaseGreenGradient")
local v_u_73 = v_u_22:GetAttribute("BaseGreyGradient")
local v_u_74 = v_u_22:GetAttribute("BaseRedGradient")
local v_u_75 = nil
local v_u_76 = nil
local v_u_77 = false
local v_u_78 = nil
local v_u_79 = nil
function ScaleGui()
    -- upvalues: (copy) v_u_20, (copy) v_u_21, (ref) v_u_78, (copy) v_u_38, (copy) v_u_41, (copy) v_u_51, (copy) v_u_50, (copy) v_u_58, (copy) v_u_22, (copy) v_u_59, (copy) v_u_62, (copy) v_u_61
    local v80 = v_u_20.AbsoluteSize
    local v81 = v_u_21.Scale
    if v80 ~= v_u_78 then
        v_u_78 = v80
        local v82 = v_u_38.AbsoluteSize.Y / 3.1 / v81
        v_u_38.TextSize = v82
        v_u_41.TextSize = v82
        v_u_51.TextSize = v82
        v_u_50.TextSize = v82
        v_u_58.TextSize = v82
    end
    local v83 = 35 + v_u_22.AbsoluteSize.X / 35
    local v84 = math.clamp(v83, 60, 180)
    local v85 = v84 * 1.1111
    local v86 = v85 / 10
    local v87 = v84 / 6
    local v88 = v_u_59.AbsoluteSize.X / v81 - 5 - v_u_62.PaddingLeft.Offset - v_u_62.PaddingRight.Offset
    local v89 = v88 / (v88 // (v84 + v86) * (v84 + v86))
    local v90 = v84 * v89
    local v91 = v85 * v89
    local v92 = v86 * v89
    local v93 = v87 * v89
    v_u_61.CellSize = UDim2.fromOffset(v90, v91)
    v_u_61.CellPadding = UDim2.fromOffset(v92, v93)
end
function ChangeClaimButton(p94, p95)
    -- upvalues: (ref) v_u_77, (copy) v_u_31, (copy) v_u_32, (copy) v_u_73, (copy) v_u_33, (ref) v_u_75, (copy) v_u_4, (copy) v_u_72, (copy) v_u_74
    if v_u_77 then
        v_u_31:Hide()
        v_u_32.Color = v_u_73
        v_u_33.Text = "Claiming..."
        return
    else
        v_u_33.Text = p95 or "Claim"
        if v_u_75 and not v_u_75(v_u_4, p94) then
            v_u_31:Hide()
            v_u_32.Color = v_u_74
        else
            v_u_31:Show()
            v_u_32.Color = v_u_72
        end
    end
end
function TweenToNextFloorToUnlock(p96)
    -- upvalues: (copy) v_u_21, (copy) v_u_59, (copy) v_u_20, (copy) v_u_3
    local v97 = v_u_21.Scale
    v_u_59.CanvasPosition = Vector2.zero
    while true do
        task.wait()
        local v98 = v_u_21.Scale
        if v98 == v97 then
            break
        end
        v97 = v98
    end
    if v_u_20.Visible and v_u_59.Visible then
        v_u_3:Create(v_u_59, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            ["CanvasPosition"] = Vector2.new(0, p96.AbsolutePosition.Y - v_u_59.AbsolutePosition.Y - 0.1 * v_u_59.AbsoluteSize.Y)
        }):Play()
    end
end
local v_u_99 = {
    v_u_24,
    v_u_40,
    v_u_46,
    v_u_53,
    v_u_59
}
function ChangeSection(p100)
    -- upvalues: (copy) v_u_99, (copy) v_u_59, (copy) v_u_25, (copy) v_u_23, (copy) v_u_26, (copy) v_u_20
    for _, v101 in pairs(v_u_99) do
        v101.Visible = v101 == p100
    end
    if p100 == v_u_59 then
        v_u_25.Visible = false
        v_u_23.Text = "All floors"
        v_u_26.Visible = true
        local v102 = (1 / 0)
        local v103 = nil
        for _, v104 in pairs(AllFloorButtons) do
            local v105 = v104:FindFirstChild("Mark")
            if v105 and v105.Visible then
                local v106 = v104.AbsolutePosition.Y
                if v106 < v102 then
                    v103 = v104
                    v102 = v106
                end
            end
        end
        if v103 then
            task.spawn(TweenToNextFloorToUnlock, v103)
            return
        end
        if not v_u_20.Visible then
            v_u_59.CanvasPosition = Vector2.zero
            return
        end
    else
        v_u_25.Visible = true
        v_u_26.Visible = false
    end
end
function IsAssociatedEventActive(p107)
    -- upvalues: (copy) v_u_8
    return workspace:GetAttribute(v_u_8(p107) .. "Event")
end
function IsFloorAccessible(p108, p109, p110, p111)
    -- upvalues: (copy) v_u_6, (copy) v_u_4
    if p109 then
        if p109 == "Material" then
            return true
        elseif p109 == "Event" then
            return IsAssociatedEventActive(p108)
        else
            return p110 and v_u_6.Value:find(p108) and true or (not p110 and p111.CanAccessFloor(v_u_4, p108) and true or false)
        end
    else
        return false
    end
end
local v_u_112 = 0
function ShowFloorButton(p113, p114)
    -- upvalues: (ref) v_u_112, (ref) v_u_79, (copy) v_u_1
    v_u_112 = v_u_112 + 1
    local v115 = v_u_112
    local v116 = p114:FindFirstChild("HumanoidRootPart")
    local v117 = workspace.AllButtons:WaitForChild(p113:split("_")[1] .. "Floor", 0.2)
    if not v117 then
        print("No button")
        return
    end
    if v_u_112 ~= v115 then
        return
    end
    local v118 = v117:FindFirstChildOfClass("Attachment") or Instance.new("Attachment", v117)
    local v119 = v117.Position
    if not v_u_79 then
        v_u_79 = v_u_1.Tools.KeyBeam:Clone()
        v_u_79.Name = "FloorBeam"
        v_u_79.Parent = workspace
    end
    if not (v_u_79.Attachment1 and v_u_79.Attachment1:IsDescendantOf(p114)) then
        v_u_79.Attachment1 = v116:FindFirstChild("RootRigAttachment")
    end
    v_u_79.Attachment0 = v118
    v_u_79.Enabled = true
    while v115 == v_u_112 and (p114:IsDescendantOf(workspace) and v117:IsDescendantOf(workspace)) do
        local v120 = p114:GetPivot().Position - v119
        if v120.Magnitude > 65 then
            break
        end
        local v121 = v120.Y
        if math.abs(v121) > 11 then
            break
        end
        task.wait()
    end
    if v115 == v_u_112 then
        v_u_79.Attachment0 = nil
        v_u_79.Enabled = false
    end
end
function GoToFloor(p122, p123)
    -- upvalues: (copy) v_u_64, (copy) v_u_11, (copy) v_u_4, (copy) v_u_14
    v_u_64:Play()
    local v124 = v_u_11(v_u_4)
    if v124 then
        if v124:GetAttribute("IsBuilding") then
            v_u_14:Fire("WrongMessage", "Wait for the tower to load")
            return
        else
            local v125 = v_u_4.Character
            if v125 then
                local v126 = v125:FindFirstChild("Humanoid")
                if v126 and v126.Sit then
                    v126:ChangeState(Enum.HumanoidStateType.Jumping)
                    task.wait()
                end
                v125:PivotTo(v124:GetPivot() * CFrame.new(0, p122 * 11 + 5, 20) * CFrame.Angles(0, 3.141592653589793, 0))
                ShowFloorButton(p123, v125)
            end
        end
    else
        v_u_14:Fire("WrongMessage", "Build your tower first")
        return
    end
end
function WriteNewFloor(p_u_127, p_u_128, p_u_129, p_u_130, p_u_131, p_u_132, p_u_133, p134)
    -- upvalues: (copy) v_u_23, (copy) v_u_10, (copy) v_u_31, (copy) v_u_55, (copy) v_u_46, (copy) v_u_49, (copy) v_u_48, (ref) v_u_70, (copy) v_u_52, (copy) v_u_51, (ref) v_u_69, (copy) v_u_47, (copy) v_u_64, (copy) v_u_9, (copy) v_u_4, (copy) v_u_18, (copy) v_u_15, (copy) v_u_5, (copy) v_u_40, (copy) v_u_42, (copy) v_u_44, (copy) v_u_43, (copy) v_u_41, (copy) v_u_45, (copy) v_u_53, (copy) v_u_57, (copy) v_u_56, (copy) v_u_58, (copy) v_u_54, (copy) v_u_24, (copy) v_u_29, (copy) v_u_38, (ref) v_u_67, (copy) v_u_37, (copy) v_u_39, (ref) v_u_71, (ref) v_u_75, (copy) v_u_35, (copy) v_u_30, (copy) v_u_34, (ref) v_u_66
    local v135 = p_u_127:sub(1, 5) == "Floor" and p_u_127 and p_u_127 or p_u_127:sub(1, -7) .. " floor"
    v_u_23.Text = v135
    local v_u_136 = p_u_128 == "Event" and v_u_10.Event or (p_u_128 == "Normal" and v_u_10.Normal or v_u_10[p_u_127])
    local v137
    if v_u_136 then
        v137 = v_u_136.GetUnlockDescription and v_u_136.GetUnlockDescription(p_u_130, p_u_127) or v_u_136.UnlockDescription
    else
        v137 = v_u_136
    end
    v_u_31:Hide()
    v_u_55:Hide()
    if p_u_132 then
        ChangeSection(v_u_46)
        if p_u_129 <= 6 then
            v_u_49.Text = "Congratulations! You built " .. v135 .. "!"
        else
            v_u_49.Text = "Congratulations! You built the " .. v135 .. "!"
        end
        v_u_48.Image = p_u_131
        if v_u_70 then
            v_u_70:Disconnect()
        end
        v_u_52.Visible = p134
        v_u_51.Visible = p134
        if p134 then
            v_u_70 = v_u_52.Activated:Connect(function()
                -- upvalues: (copy) p_u_129, (copy) p_u_127
                GoToFloor(p_u_129, p_u_127)
            end)
        end
        if v_u_69 then
            v_u_69:Disconnect()
        end
        v_u_69 = v_u_47.Activated:Connect(function()
            -- upvalues: (ref) v_u_64, (ref) v_u_9, (copy) p_u_129, (ref) v_u_4, (ref) v_u_18, (ref) v_u_15
            v_u_64:Play()
            local v138 = v_u_9("Badge_" .. p_u_129, v_u_4) or v_u_18:InvokeServer(p_u_129)
            if v138 and v138.Parent ~= v_u_4.Character then
                v_u_15:Fire("Badge_" .. p_u_129)
            end
        end)
        return
    elseif p_u_129 and v_u_5.Value < p_u_129 then
        ChangeSection(v_u_40)
        v_u_42.Text = "Level " .. p_u_129 .. " required"
        v_u_44.Text = "Level\n" .. v_u_5.Value .. " / " .. p_u_129
        v_u_43.Image = p_u_131
        if v137 then
            if p_u_128 == "ClaimableEvent" then
                v137 = v_u_10.Event.GetUnlockDescription(p_u_130, p_u_127) .. "\n+\n" .. v137
            end
            v_u_43.Position = UDim2.fromScale(0.275, 0.6)
            v_u_41.Text = v137
            v_u_41.Visible = true
            v_u_45.Visible = true
        else
            v_u_43.Position = UDim2.fromScale(0.5, 0.6)
            v_u_41.Visible = false
            v_u_45.Visible = false
        end
    elseif IsFloorAccessible(p_u_127, p_u_128, p_u_133, v_u_136) then
        ChangeSection(v_u_53)
        v_u_57.Text = "\226\134\146 Go to floor " .. p_u_129 .. "\n\226\134\146 Build the " .. v135:lower() .. " and get the badge!"
        v_u_56.Image = p_u_131
        v_u_58.Text = "Build the " .. v135
        if v_u_70 then
            v_u_70:Disconnect()
        end
        v_u_70 = v_u_54.Activated:Connect(function()
            -- upvalues: (copy) p_u_129, (copy) p_u_127
            GoToFloor(p_u_129, p_u_127)
        end)
        v_u_55:Show()
        return
    else
        ChangeSection(v_u_24)
        v_u_24.Visible = true
        v_u_40.Visible = false
        v_u_29.Text = "To unlock the " .. v135:lower() .. ":"
        if p_u_128 == "ClaimableEvent" then
            v137 = v_u_10.Event.GetUnlockDescription(p_u_130, p_u_127) .. " + " .. (v137 or "")
        end
        v_u_38.Text = v137 or ""
        if v_u_67 then
            v_u_67:Disconnect()
        end
        local v139 = v_u_136.HideUnlockButtonF
        if v139 then
            v139 = v_u_136.HideUnlockButtonF(v_u_4)
        end
        if v139 or not v_u_136.UnlockButtonTxt then
            v_u_37.Visible = false
        else
            v_u_37.UnlockBttnTxt.Text = v_u_136.UnlockButtonTxt
            v_u_37.Visible = true
            v_u_67 = v_u_37.Activated:Connect(function()
                -- upvalues: (ref) v_u_64, (copy) v_u_136, (ref) v_u_4
                v_u_64:Play()
                v_u_136.ButtonFunction(v_u_4)
            end)
        end
        if v_u_136.DescImage then
            v_u_39.Image = v_u_136.DescImage
            v_u_39.Visible = true
            v_u_39.UIAspectRatioConstraint.AspectRatio = v_u_136.ImageAspectRatio or 1
        else
            v_u_39.Visible = false
        end
        if v_u_71 then
            task.cancel(v_u_71)
            v_u_71 = nil
        end
        v_u_75 = v_u_136.CanAccessFloor
        local v_u_140 = v_u_136.GetClaimButtonTxt and (v_u_136.GetClaimButtonTxt(v_u_4, p_u_130) or "Claim") or "Claim"
        if v_u_136.CantBeClaimed then
            v_u_35.Visible = false
            v_u_30.Visible = false
            v_u_34.Visible = false
            return
        else
            v_u_35.Visible = v_u_136.TimeRequired and true
            v_u_30.Visible = true
            v_u_34.Visible = true
            if v_u_75 then
                v_u_71 = task.spawn(function()
                    -- upvalues: (copy) p_u_130, (copy) v_u_140
                    while true do
                        ChangeClaimButton(p_u_130, v_u_140)
                        task.wait(1)
                    end
                end)
                if v_u_66 then
                    v_u_66:Disconnect()
                end
                v_u_66 = v_u_30.Activated:Connect(function()
                    -- upvalues: (copy) v_u_136, (copy) p_u_127, (copy) p_u_128, (copy) p_u_130, (copy) p_u_129, (copy) p_u_131, (copy) p_u_132, (copy) p_u_133
                    ClaimFloor(v_u_136.TimeRequired, p_u_127, p_u_128, p_u_130, p_u_129, p_u_131, p_u_132, p_u_133)
                end)
            else
                ChangeClaimButton(p_u_130, v_u_140)
            end
        end
    end
end
function OnVisibleChanged()
    -- upvalues: (ref) v_u_68, (copy) v_u_20, (copy) v_u_22, (copy) v_u_28, (ref) v_u_76, (ref) v_u_71, (copy) v_u_17
    if v_u_68 then
        v_u_68:Disconnect()
    end
    if v_u_20.Visible then
        v_u_68 = v_u_22:GetPropertyChangedSignal("AbsoluteSize"):Connect(ScaleGui)
        v_u_28:Hide()
    else
        v_u_76 = nil
        if v_u_71 then
            task.cancel(v_u_71)
            v_u_71 = nil
        end
        if v_u_17:Invoke() then
            v_u_28:Show()
        end
    end
    ScaleGui()
end
function ToggleUnlockFrame(p141, p142, p143, p144, p145, p146, p147, p148, p149)
    -- upvalues: (ref) v_u_76, (copy) v_u_20, (copy) v_u_59, (copy) v_u_64, (copy) v_u_63
    if p142 then
        if v_u_76 ~= p141 then
            return
        end
        if not v_u_20.Visible then
            return
        end
    end
    local v150 = not v_u_20.Visible
    if v_u_76 ~= p141 then
        v150 = true
        if p141 == "AllFloors" then
            ChangeSection(v_u_59)
        else
            WriteNewFloor(p141, p143, p144, p145, p146, p147, p148, p149)
            if v150 == v_u_20.Visible then
                v_u_64:Play()
            end
        end
    end
    v_u_76 = p141
    if v150 ~= v_u_20.Visible then
        v_u_63.ToggleFrame(v_u_20, v150)
    end
end
function ClaimFloor(p151, p152, p153, p154, p155, ...)
    -- upvalues: (ref) v_u_77, (copy) v_u_33, (ref) v_u_75, (copy) v_u_4, (copy) v_u_19, (copy) v_u_65, (copy) v_u_14
    if v_u_77 or not p152 then
        return
    else
        local v156 = v_u_33.Text
        v_u_77 = true
        ChangeClaimButton()
        local v157 = (p151 or not v_u_75) and true or v_u_75(v_u_4, p154)
        if v157 then
            v157 = v_u_19:InvokeServer(p152)
        end
        v_u_77 = false
        ChangeClaimButton(p154, v156)
        if v157 then
            v_u_65:Play()
            if p153 then
                WriteNewFloor(p152, p153, p155, p154, ...)
            else
                ToggleUnlockFrame(p152, true)
            end
        else
            v_u_14:Fire("WrongMessage", "Requirements not met!")
            return
        end
    end
end
AllFloorButtons = {}
function BuildFloorButton(p158, p159, p160)
    -- upvalues: (copy) v_u_60, (copy) v_u_59
    local v161 = v_u_60:Clone()
    v161.BadgeImage.Image = p160
    v161.LayoutOrder = p159
    v161.NameLabel.Text = p158:split("_")[1]
    v161.Parent = v_u_59
    local v162 = AllFloorButtons
    table.insert(v162, v161)
    return v161
end
function v16.OnInvoke(p163, ...)
    -- upvalues: (copy) v_u_20, (copy) v_u_28
    if p163 then
        if p163 == "ShowMark" and not v_u_20.Visible then
            v_u_28:Show()
        else
            v_u_28:Hide()
        end
    else
        return BuildFloorButton(...)
    end
end
v_u_20:GetPropertyChangedSignal("Visible"):Connect(OnVisibleChanged)
v13.Event:Connect(ToggleUnlockFrame)
v27.Activated:Connect(function()
    -- upvalues: (copy) v_u_64
    v_u_64:Play()
    ToggleUnlockFrame("AllFloors")
end)
v_u_25.Activated:Connect(function()
    -- upvalues: (copy) v_u_64
    v_u_64:Play()
    ToggleUnlockFrame("AllFloors")
end)
local v_u_164 = workspace.FloorsBuilding.ScreenModel.UpperScreenPart.SurfaceGui.NumOwnedLabel
function OnNumberChanged()
    -- upvalues: (copy) v_u_164, (copy) v_u_26
    if v_u_164.Text:find("?") then
        v_u_26.Text = "Loading\nfloors..."
    else
        v_u_26.Text = "Floors owned\n" .. v_u_164.Text
    end
end
v_u_164:GetPropertyChangedSignal("Text"):Connect(OnNumberChanged)
OnNumberChanged()

--========================================
-- LocalScript : StarterGui.MainGui.FloorSelection.SetElevatorLevelScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
game:GetService("CollectionService")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = v1.RemoteEvent.ElevatorEvents.SetElevatorLevel
local v_u_4 = v1.RemoteEvent.ChangeLaserDoorEvent
local v_u_5 = v1.RemoteEvent.GuiEvent.GuiEventLocal
local v_u_6 = script.Parent
local _ = v_u_6.UIScale
local v7 = v_u_6.Parent
local v_u_8 = v7.Parent
local _ = v_u_6.UIStroke
local v9 = v_u_6.CloseBttn
local v10 = v_u_6.ValidBttn
local v11 = v_u_6.UnselectBttn
local _ = v9.UIStroke
local _ = v10.UIStroke
local _ = v11.UIStroke
local _ = v_u_6.Title.UIStroke
local v_u_12 = v_u_6.OpenArgument
local v_u_13 = require(v7.MainGuiScript.ToggleFrameModule)
local v_u_14 = game:GetService("SoundService").Sound.ClickSound
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = nil
function FireNewValue()
    -- upvalues: (ref) v_u_15, (copy) v_u_14, (copy) v_u_6, (copy) v_u_13, (copy) v_u_5, (ref) v_u_16, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
    if v_u_15 then
        v_u_14:Play()
        if v_u_6.Text == "" then
            v_u_13.ToggleFrame(v_u_6, false)
            return
        else
            local v18 = v_u_6.Text
            local v19 = tonumber(v18)
            if v19 and v19 == math.floor(v19) then
                if v19 <= 0 then
                    v_u_5:Fire("WrongMessage", "Number too low")
                    return
                else
                    local v20
                    if v_u_16 == "Elevator" then
                        v20 = v_u_15.Parent.Parent.Parent.Owner.Value.leaderstats.Level.Value
                    else
                        if table.find(v_u_2.Settings.LaserProtectedFloors.Value:split("_"), (tostring(v19))) then
                            v_u_5:Fire("WrongMessage", "There is already a laser door on floor", v19)
                            return
                        end
                        v20 = v_u_2.leaderstats.Level.Value - 1
                    end
                    if v20 < v19 then
                        v_u_5:Fire("WrongMessage", "Max is " .. v20)
                    else
                        if v_u_16 == "Elevator" then
                            v_u_3:FireServer(v_u_15.Parent, v19)
                        else
                            v_u_4:FireServer(v19, true)
                        end
                        v_u_13.ToggleFrame(v_u_6, false)
                    end
                end
            else
                v_u_5:Fire("WrongMessage", "Invalid number")
                return
            end
        end
    else
        return
    end
end
local v_u_21 = 0
function TrackDistanceWithInteractiveObject()
    -- upvalues: (ref) v_u_21, (copy) v_u_6, (ref) v_u_15, (copy) v_u_2
    v_u_21 = v_u_21 + 1
    local v22 = v_u_21
    while v_u_6.Visible and (v_u_15 and v_u_15:IsDescendantOf(workspace)) do
        local v23 = v_u_2:DistanceFromCharacter(v_u_15.Position)
        if v23 > 20 or v23 == 0 then
            break
        end
        task.wait(0.1)
        if v22 ~= v_u_21 then
            return
        end
    end
    CloseTxtBox()
end
function OnStatsVisibleChanged()
    -- upvalues: (copy) v_u_6, (ref) v_u_15, (ref) v_u_21, (copy) v_u_12, (ref) v_u_16, (copy) v_u_8, (ref) v_u_17
    v_u_6.Text = ""
    v_u_15 = nil
    v_u_21 = v_u_21 + 1
    if v_u_6.Visible then
        v_u_15 = v_u_12.Value
        v_u_16 = v_u_15.Parent:HasTag("Elevator") and "Elevator" or "LaserDoorSystem"
        if v_u_16 == "Elevator" then
            v_u_6.PlaceholderText = v_u_8[v_u_15.Parent.Parent.Parent.Name .. "ElevatorGUI"].SelectionLabel.Text
        else
            v_u_6.PlaceholderText = ""
        end
        v_u_17 = task.defer(TrackDistanceWithInteractiveObject)
        v_u_6:CaptureFocus()
    end
end
function CloseTxtBox()
    -- upvalues: (copy) v_u_13, (copy) v_u_6
    v_u_13.ToggleFrame(v_u_6, false)
end
v_u_6.FocusLost:Connect(function(p24)
    if p24 then
        FireNewValue()
    end
end)
v10.Activated:Connect(FireNewValue)
v11.Activated:Connect(CloseTxtBox)
v_u_6:GetPropertyChangedSignal("Visible"):Connect(OnStatsVisibleChanged)
OnStatsVisibleChanged()

--========================================
-- LocalScript : StarterGui.MainGui.PresetInventoryFrame.InventoryPresetScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("MarketplaceService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("Players").LocalPlayer
local v5 = game:GetService("SoundService"):WaitForChild("Sound")
while not v_u_4:GetAttribute("DataFullyLoaded") do
    v_u_4:GetAttributeChangedSignal("DataFullyLoaded"):Wait()
end
local v_u_6 = v_u_4.Stats.InventoryPreset
local v_u_7 = v_u_4.Settings.EquipKeysFirst.Value
local v_u_8 = v_u_4.Stats.GamePass.UnlimitedPreset
local v9 = v_u_4.Stats.AdditionalPreset
local v_u_10 = v_u_8.Value
local v_u_11 = v_u_4.leaderstats.Level
local v_u_12 = v2.RemoteEvent.ChangeInventoryEvent
local v_u_13 = v2.RemoteEvent.LoadInventoryEvent
local v_u_14 = v2.RemoteEvent.SettingsEvent
local v_u_15 = script.Parent
local v_u_16 = v_u_15.Parent
local v_u_17 = v_u_15.ItemScrlF
local v_u_18 = v_u_15.PresetScrlF
local v_u_19 = v_u_15.InventoryTitle
local v_u_20 = v_u_15.EquipKeysFirst
local v_u_21 = v_u_15.LoadBttn
local v_u_22 = v_u_15.GamepassBttn
local v_u_23 = v_u_18.MoreSlotBttn
local v_u_24 = v_u_18.LockedFrame
local v_u_25 = v_u_24.LevelLabel
local v_u_26 = v_u_18.UIGridLayout
local v_u_27 = v_u_17.UIGridLayout
local v_u_28 = v2.ToolButtonTemplate:Clone()
local v_u_29 = require(v2.AllModules.InventoryModule)
local v_u_30 = require(v2.AllModules.ImageFromName).Tools
local v_u_31 = require(v_u_16.MainGuiScript.ImprovedUIDragger)
local v_u_32 = v5:WaitForChild("ClickSound")
local v_u_33 = v5:WaitForChild("BuySound")
local v_u_34 = nil
local v_u_35 = nil
local v_u_36 = nil
local v_u_37 = nil
local v_u_38 = {}
local v_u_39 = {}
local v_u_40 = nil
local v_u_41 = nil
local v_u_42 = 3
local v_u_43 = nil
local v_u_44 = { v_u_17, v_u_18 }
local v_u_45 = Color3.new(0, 1)
local v_u_46 = {}
v_u_28.UIStroke.Color = v_u_45
v_u_28.UIScale:SetAttribute("EndScale", 1.1)
function CreateMoveImage(p47, p48)
    -- upvalues: (copy) v_u_16, (copy) v_u_28, (ref) v_u_40
    local v49 = Instance.new("ImageLabel", v_u_16)
    v49.BackgroundTransparency = v_u_28.BackgroundTransparency
    v49.BackgroundColor3 = v_u_28.BackgroundColor3
    v49.Size = v_u_40
    v_u_28.UICorner:Clone().Parent = v49
    v49.AnchorPoint = Vector2.new(0.5, 0.5)
    if p48 then
        v49.Image = p48
    end
    if p47 then
        v49.Name = p47
    end
    return v49
end
function BuildEmptyImage(p50)
    -- upvalues: (copy) v_u_18
    if not v_u_18:FindFirstChild(p50) then
        local v51 = CreateMoveImage(p50)
        v51.Parent = v_u_18
        v51.LayoutOrder = p50
        local v52 = Instance.new("UIStroke", v51)
        v52.Color = Color3.new(0, 1, 0)
        v52.Transparency = 0
        v52.Thickness = 2
        v52.Enabled = false
    end
end
function RemoveEmptyImage(p53)
    -- upvalues: (copy) v_u_18
    local v54 = v_u_18:FindFirstChild(p53)
    if not v54 then
        return false
    end
    v54:Destroy()
    return true
end
function ChangeSelection(p55, p56)
    -- upvalues: (copy) v_u_17, (copy) v_u_18, (copy) v_u_45
    if p55 == v_u_17 or p55 == v_u_18 then
        p55.UIStroke.Transparency = p56 and 0 or 0.5
        p55.UIStroke.Color = p56 and v_u_45 or Color3.new()
    else
        p55.UIStroke.Enabled = p56
    end
end
function GetClosestTargettableThing(p57)
    -- upvalues: (copy) v_u_44, (copy) v_u_17, (copy) v_u_18, (ref) v_u_41
    local v58 = (1 / 0)
    local v59 = nil
    for _, v60 in pairs(v_u_44) do
        local v61 = v60.AbsoluteSize
        local v62 = (v60.AbsolutePosition + v61 / 2 - p57):Abs()
        if v60 == v_u_17 or v60 == v_u_18 then
            ::l4::
            local v63 = v62.Magnitude
            if v63 < v58 then
                v59 = v60
                v58 = v63
            end
        elseif v62.X <= v61.X / 2 + v_u_41 / 2 then
            if v62.Y <= v61.Y / 2 + v_u_41 / 2 then
                if v62.X < v61.X / 2 and v62.Y < v61.Y / 2 then
                    return v60
                end
                goto l4
            end
        end
    end
    return v59
end
function FireToServer(p64, p65, p66)
    -- upvalues: (copy) v_u_21, (copy) v_u_12
    v_u_21.Visible = true
    v_u_12:FireServer(p64, p65, p66)
end
function RemoveLastImagesWhenHavingGP(p67)
    -- upvalues: (ref) v_u_10, (copy) v_u_44, (copy) v_u_18
    if v_u_10 and p67 == #v_u_44 - 3 then
        for v68 = #v_u_44 - 3, 12, -1 do
            if not v_u_18:FindFirstChild(v68) then
                break
            end
            RemoveEmptyImage(v68 + 1)
        end
    end
end
function BuildButton(p69, p_u_70, p71)
    -- upvalues: (copy) v_u_46, (copy) v_u_28, (copy) v_u_30, (copy) v_u_17, (copy) v_u_18, (ref) v_u_10, (ref) v_u_42, (copy) v_u_44, (copy) v_u_31, (copy) v_u_38
    if not v_u_46[p_u_70] then
        local v_u_72 = v_u_28:Clone()
        v_u_72.Name = p_u_70
        v_u_72.Parent = p69
        v_u_72.Visible = true
        v_u_72.LayoutOrder = p71 or 0
        local v_u_73 = v_u_30[p_u_70] and (v_u_30[p_u_70].Image or "") or ""
        v_u_72.Image = v_u_73
        v_u_46[p_u_70] = v_u_72
        local v_u_74 = nil
        local v_u_75 = nil
        local v85 = v_u_31(v_u_72, nil, function(p76)
            -- upvalues: (ref) v_u_74, (copy) p_u_70, (copy) v_u_73, (ref) v_u_75
            if not v_u_74 then
                v_u_74 = CreateMoveImage(p_u_70, v_u_73)
            end
            v_u_74.Position = UDim2.fromOffset(p76.X, p76.Y)
            local v77 = GetClosestTargettableThing(p76)
            if v77 ~= v_u_75 then
                if v_u_75 then
                    ChangeSelection(v_u_75, false)
                end
                if v77 then
                    ChangeSelection(v77, true)
                end
                v_u_75 = v77
            end
        end, function(p78)
            -- upvalues: (ref) v_u_74, (ref) v_u_75, (copy) v_u_72, (ref) v_u_17, (ref) v_u_18, (ref) v_u_10, (ref) v_u_42, (copy) p_u_70, (ref) v_u_44
            if v_u_74 then
                v_u_74:Destroy()
                v_u_74 = nil
            end
            if v_u_75 and v_u_75.Parent then
                ChangeSelection(v_u_75, false)
            end
            local v79 = v_u_75
            v_u_75 = nil
            if not (p78 and v79) then
                return
            end
            if v79 == v_u_72 then
                return
            end
            local v80 = v_u_72.Parent
            if v80 == v_u_17 and v79 == v_u_17 then
                return
            end
            if v79 == v_u_18 then
                if v80 == v_u_18 then
                    return
                end
                v79 = nil
                for v81 = 1, v_u_10 and 2000 or v_u_42 do
                    local v82 = v_u_18:FindFirstChild(v81)
                    if v82 then
                        v79 = v82
                        break
                    end
                end
            end
            if v79 then
                local v83 = v_u_72.LayoutOrder
                local v84 = v79.LayoutOrder
                if v80 == v_u_18 then
                    FireToServer(false, v83, p_u_70)
                end
                if v79.Parent == v_u_18 then
                    if v80 == v_u_18 then
                        if v79:IsA("GuiButton") then
                            FireToServer(false, v84, v79.Name)
                            FireToServer(true, v83, v79.Name)
                        else
                            v79.Name = v83
                            if v84 < v83 then
                                RemoveLastImagesWhenHavingGP(v83)
                            end
                        end
                        v79.LayoutOrder = v83
                    else
                        v_u_72.Parent = v_u_18
                        if v79:IsA("GuiButton") then
                            FireToServer(false, v84, v79.Name)
                            v79.LayoutOrder = 0
                            v79.Parent = v_u_17
                        else
                            v79:Destroy()
                        end
                    end
                    FireToServer(true, v84, p_u_70)
                    v_u_72.LayoutOrder = v84
                    if v_u_10 and v84 == #v_u_44 - 2 then
                        BuildEmptyImage(v84 + 1)
                        return
                    end
                elseif v79 == v_u_17 then
                    v_u_72.Parent = v_u_17
                    v_u_72.LayoutOrder = 0
                    BuildEmptyImage(v83)
                    RemoveLastImagesWhenHavingGP(v83)
                end
            end
        end)
        local v86 = v_u_38
        table.insert(v86, v85)
        return v_u_72
    end
    v_u_46[p_u_70].Parent = p69
    v_u_46[p_u_70].LayoutOrder = p71 or 0
end
function UpdateTitle()
    -- upvalues: (copy) v_u_19, (copy) v_u_39, (ref) v_u_10, (ref) v_u_42
    v_u_19.Text = "Auto equip " .. #v_u_39 .. (v_u_10 and "" or "/" .. v_u_42)
end
function ScaleGui()
    -- upvalues: (copy) v_u_3, (copy) v_u_15, (copy) v_u_16, (ref) v_u_41, (ref) v_u_40, (copy) v_u_26, (copy) v_u_27, (copy) v_u_19, (copy) v_u_18, (copy) v_u_17
    local v87 = v_u_3.TopbarInset.Height
    v_u_15.Position = UDim2.new(0.5, 0, 0.5, -v87 / 2)
    v_u_15.Size = UDim2.new(0.65, 0, 0.65, v87 / 2)
    local v88 = v_u_16.AbsoluteSize.Y
    if v88 <= 350 then
        v_u_41 = 35
    elseif v88 <= 400 then
        v_u_41 = 40
    elseif v88 <= 800 then
        v_u_41 = 50
    else
        v_u_41 = 60
    end
    v_u_40 = UDim2.fromOffset(v_u_41, v_u_41)
    v_u_26.CellSize = v_u_40
    v_u_27.CellSize = v_u_40
    v_u_19.UIStroke.Thickness = 0.008 * v88
    v_u_15.ItemTitle.UIStroke.Thickness = 0.008 * v88
    v_u_18.UIStroke.Thickness = 0.008 * v88
    v_u_17.UIStroke.Thickness = 0.008 * v88
end
function RefreshInventoryDisplay()
    -- upvalues: (copy) v_u_29, (copy) v_u_4, (copy) v_u_15, (ref) v_u_42, (ref) v_u_43, (ref) v_u_10, (copy) v_u_25, (copy) v_u_24, (ref) v_u_37, (copy) v_u_23, (copy) v_u_1, (copy) v_u_6, (copy) v_u_18, (copy) v_u_39, (copy) v_u_17, (ref) v_u_36, (copy) v_u_11
    local v89 = v_u_29.GetAllowedItemFor(v_u_4)
    if not v89 then
        v_u_15.Visible = false
        return
    end
    local v90 = {}
    local v91, v92 = v_u_29.GetMaxNumberOfAutoEqquipTool(v_u_4)
    v_u_42 = v91
    v_u_43 = v92
    if v_u_10 or not v_u_43 then
        v_u_24.Visible = false
    else
        v_u_25.Text = "lvl. " .. v_u_43
        v_u_24.Visible = true
    end
    if v_u_37 then
        v_u_37:Disconnect()
    end
    if v_u_10 then
        v_u_23.Visible = false
    else
        v_u_23.Visible = true
        v_u_37 = v_u_23.Activated:Connect(function()
            -- upvalues: (ref) v_u_1, (ref) v_u_4
            v_u_1:PromptProductPurchase(v_u_4, 3296476296)
        end)
    end
    local v93 = 0
    for _, v94 in pairs(v_u_6.Value:split("_")) do
        if v94 ~= "" then
            local v95, v96 = table.unpack(v94:split(","))
            v90[v95] = v96
            v93 = v93 + 1
        end
    end
    local v97 = 0
    local v98 = 0
    for v99 = 1, v_u_10 and 2000 or v_u_42 do
        local v100 = v90[tostring(v99)]
        if v100 then
            BuildButton(v_u_18, v100, v99)
            RemoveEmptyImage(v99)
            v97 = v97 + 1
        else
            BuildEmptyImage(v99)
        end
        if v93 <= v97 and v_u_10 then
            local v101 = v99 + 1
            v98 = math.max(12, v101)
            for v102 = v99 + 1, v98 do
                BuildEmptyImage(v102)
            end
            break
        end
    end
    for v103 = (v_u_10 and v98 and v98 or v_u_42) + 1, #v_u_18:GetChildren() do
        local v104 = v_u_18:FindFirstChild(v103)
        if v104 then
            v104:Destroy()
        end
    end
    for v105, v106 in pairs(v89) do
        if not table.find(v_u_39, v106) then
            BuildButton(v_u_17, v106, v105)
        end
    end
    UpdateTitle()
    if v_u_36 then
        v_u_36:Disconnect()
    end
    v_u_36 = v_u_11:GetPropertyChangedSignal("Value"):Connect(function()
        -- upvalues: (ref) v_u_10, (ref) v_u_29, (ref) v_u_4, (ref) v_u_42
        if not v_u_10 then
            if v_u_29.GetMaxNumberOfAutoEqquipTool(v_u_4) ~= v_u_42 then
                RefreshInventoryDisplay()
            end
        end
    end)
end
function OnGamepassValChanged(p107)
    -- upvalues: (ref) v_u_10, (copy) v_u_8, (copy) v_u_22, (ref) v_u_35, (copy) v_u_16, (copy) v_u_15, (copy) v_u_33, (copy) v_u_1, (copy) v_u_4
    v_u_10 = v_u_8.Value
    v_u_22.AutoButtonColor = not v_u_10
    v_u_22.Selectable = not v_u_10
    v_u_22.Active = not v_u_10
    if v_u_35 then
        v_u_35:Disconnect()
    end
    if v_u_10 then
        v_u_22.UIGradient.Color = v_u_16:GetAttribute("BaseYellowGradient")
        v_u_22.UIScale:RemoveTag("SizableUI")
        if not p107 and v_u_15.Visible then
            v_u_33:Play()
        end
    else
        v_u_22.UIScale:AddTag("SizableUI")
        v_u_22.UIGradient.Color = v_u_16:GetAttribute("BaseGreenGradient")
        local function v108()
            -- upvalues: (ref) v_u_1, (ref) v_u_4
            v_u_1:PromptGamePassPurchase(v_u_4, 1239304574)
        end
        v_u_35 = v_u_22.Activated:Connect(v108)
    end
    if v_u_15.Visible then
        RefreshInventoryDisplay()
    end
end
OnGamepassValChanged(true)
function ChangeEquipKeysState(p109)
    -- upvalues: (ref) v_u_7, (copy) v_u_14, (copy) v_u_20
    if not p109 then
        v_u_7 = not v_u_7
        v_u_14:FireServer("EquipKeysFirst", v_u_7)
    end
    v_u_20.ButtonFrame.BackgroundColor3 = v_u_7 and Color3.new(0.1, 1, 0.1) or Color3.new(1, 1, 1)
end
v_u_15:GetPropertyChangedSignal("Visible"):Connect(function()
    -- upvalues: (copy) v_u_15, (ref) v_u_34, (copy) v_u_16, (ref) v_u_36, (copy) v_u_38
    if v_u_15.Visible then
        ScaleGui()
        v_u_34 = v_u_16:GetPropertyChangedSignal("AbsoluteSize"):Connect(ScaleGui)
        RefreshInventoryDisplay()
    else
        if v_u_34 then
            v_u_34:Disconnect()
        end
        if v_u_36 then
            v_u_36:Disconnect()
        end
        for _, v110 in pairs(v_u_38) do
            v110:Stop()
        end
    end
end)
v_u_18.ChildAdded:Connect(function(p111)
    -- upvalues: (copy) v_u_44, (copy) v_u_39
    if p111:IsA("GuiObject") then
        if not table.find(v_u_44, p111) then
            local v112 = v_u_44
            table.insert(v112, p111)
        end
        if p111:IsA("GuiButton") and not table.find(v_u_39, p111.Name) then
            local v113 = v_u_39
            local v114 = p111.Name
            table.insert(v113, v114)
            UpdateTitle()
        end
    end
end)
v_u_18.ChildRemoved:Connect(function(p115)
    -- upvalues: (copy) v_u_44, (copy) v_u_39
    local v116 = table.find(v_u_44, p115)
    if v116 then
        table.remove(v_u_44, v116)
    end
    local v117 = table.find(v_u_39, p115.Name)
    if v117 then
        table.remove(v_u_39, v117)
        UpdateTitle()
    end
end)
v_u_21.Activated:Connect(function()
    -- upvalues: (copy) v_u_32, (copy) v_u_13, (copy) v_u_21
    v_u_32:Play()
    v_u_13:FireServer()
    v_u_21.Visible = false
end)
v_u_20.Activated:Connect(function()
    -- upvalues: (copy) v_u_32, (copy) v_u_21
    v_u_32:Play()
    v_u_21.Visible = true
    ChangeEquipKeysState()
end)
ChangeEquipKeysState(true)
v_u_8:GetPropertyChangedSignal("Value"):Connect(OnGamepassValChanged)
v9:GetPropertyChangedSignal("Value"):Connect(function()
    -- upvalues: (copy) v_u_15, (copy) v_u_33
    if v_u_15.Visible then
        v_u_33:Play()
        RefreshInventoryDisplay()
    end
end)

--========================================
-- LocalScript : StarterGui.MainGui.UseTicketFrame.UseTicketScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players").LocalPlayer.Stats.Tickets
local v_u_3 = v2.DropperTicketInUse
local v_u_4 = v2.ButtonTicketInUse
local v_u_5 = script.Parent
local v_u_6 = v_u_5.Parent
local v_u_7 = v_u_5.UIStroke
local v_u_8 = v_u_5.CloseBttn.UIStroke
local v_u_9 = v_u_5.UIScale
local v_u_10 = v_u_5.Title.UIStroke
local v_u_11 = v_u_5.DropperTickets
local v_u_12 = v_u_11.UIStroke
local v_u_13 = v_u_11.AddTicketBttn
local v14 = v_u_11.Description
local v_u_15 = v_u_11.TicketButton
local v_u_16 = v_u_5.ButtonTickets
local v_u_17 = v_u_16.UIStroke
local v_u_18 = v_u_16.AddTicketBttn
local v19 = v_u_16.Description
local v_u_20 = v_u_16.TicketButton
local v_u_21 = UDim2.fromScale(0.175, 0.3)
local v_u_22, v_u_23 = UDim2.fromScale(1.06, 0.5)
Vector2.new(0, 0.5)
local v_u_24 = require(v_u_6.OwnedTickets.OwnedTicketGuiModule)
local v_u_25 = require(v1.AllModules.TicketsDescription)
local v_u_26 = require(script.ComfirmTicketUse)
local v_u_27 = require(v1.AllModules.ConvertVal)
local v_u_28 = game:GetService("SoundService"):WaitForChild("Sound"):WaitForChild("ClickSound")
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = nil
local v_u_32 = nil
v14.Text = v_u_25.Dropper.TicketDescriptionText
v19.Text = v_u_25.Button.TicketDescriptionText
function ScaleGui()
    -- upvalues: (copy) v_u_5, (ref) v_u_29, (copy) v_u_9, (copy) v_u_7, (copy) v_u_10, (copy) v_u_8, (copy) v_u_12, (copy) v_u_17, (copy) v_u_11, (copy) v_u_16, (copy) v_u_26
    local v33 = v_u_5.AbsoluteSize
    if v33 ~= v_u_29 then
        v_u_29 = v33
        local v34 = v_u_9.Scale
        local v35 = v33.Y / v34
        v_u_7.Thickness = 0.0222 * v35
        v_u_10.Thickness = 0.02 * v35
        v_u_5.BorderSizePixel = 0.0177 * v35
        v_u_8.Thickness = 0.01375 * v35
        local v36 = 0.015 * v35
        v_u_12.Thickness = v36
        v_u_17.Thickness = v36
        v_u_11.Position = UDim2.new(0.5, 0, 0.033, v36 / 2)
        v_u_16.Position = UDim2.new(0.5, 0, 0.517, v36 / 2)
        v_u_11.Size = UDim2.new(0.975, -v36, 0.45, -v36)
        v_u_16.Size = UDim2.new(0.975, -v36, 0.45, -v36)
        v_u_26.ScaleGui(v35)
    end
end
function PrintTickets(p37, p38, p39)
    -- upvalues: (copy) v_u_25, (copy) v_u_27, (copy) v_u_5
    local v40 = p38:split("_")
    local v41 = v_u_25[p39]
    local v42 = v41.MaxTickets
    local v43 = 0
    for v44 = 1, v42 do
        local v45 = v40[v44]
        local v46 = tonumber(v45)
        local v47 = p37["TicketImg" .. v44].Ticket
        local v48 = p37["Time" .. v44]
        if v46 then
            v48.Text = v_u_27.ConvertTimeInPart(v46, 2)
            v48.Visible = true
            v47.Visible = true
            v43 = v43 + 1
        else
            v48.Visible = false
            v47.Visible = false
        end
    end
    p37.TicketInUseLabel.Text = v43 .. "/" .. v42
    p37.Bonus.Text = v41.GetEffectString(v43)
    v_u_5[p39 .. "Tickets"].AddTicketBttn.Visible = v43 < v42
    v_u_5[p39 .. "Tickets"].TicketButton.Visible = v43 < v42
end
function PrintDropperTickets()
    -- upvalues: (copy) v_u_11, (copy) v_u_3
    PrintTickets(v_u_11, v_u_3.Value, "Dropper")
end
function PrintButtonTickets()
    -- upvalues: (copy) v_u_16, (copy) v_u_4
    PrintTickets(v_u_16, v_u_4.Value, "Button")
end
function OnVisibleStateChanged()
    -- upvalues: (ref) v_u_30, (ref) v_u_31, (ref) v_u_32, (copy) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_28, (copy) v_u_26, (copy) v_u_13, (copy) v_u_18, (copy) v_u_15, (copy) v_u_20, (copy) v_u_24, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23
    if v_u_30 then
        v_u_30:Disconnect()
    end
    if v_u_31 then
        v_u_31:Disconnect()
    end
    if v_u_32 then
        v_u_32:Disconnect()
    end
    if v_u_5.Visible then
        v_u_30 = v_u_6:GetPropertyChangedSignal("AbsoluteSize"):Connect(ScaleGui)
        v_u_31 = v_u_3.Changed:Connect(PrintDropperTickets)
        v_u_32 = v_u_4.Changed:Connect(PrintButtonTickets)
        PrintDropperTickets()
        PrintButtonTickets()
        local function v49()
            -- upvalues: (ref) v_u_28, (ref) v_u_26, (ref) v_u_3
            v_u_28:Play()
            v_u_26.PromptTicketUse("Dropper", v_u_3)
        end
        local function v50()
            -- upvalues: (ref) v_u_28, (ref) v_u_26, (ref) v_u_4
            v_u_28:Play()
            v_u_26.PromptTicketUse("Button", v_u_4)
        end
        v_u_13.Activated:Connect(v49)
        v_u_18.Activated:Connect(v50)
        v_u_15.Activated:Connect(v49)
        v_u_20.Activated:Connect(v50)
        ScaleGui()
        v_u_24.EnableGui(v_u_5, v_u_21, v_u_22, v_u_23, "BuyDevProductFrame")
    else
        v_u_24.DisableGui(v_u_5)
        v_u_26.CloseConfirmPrompt()
    end
end
v_u_5:GetPropertyChangedSignal("Visible"):Connect(OnVisibleStateChanged)
OnVisibleStateChanged()

--========================================
-- LocalScript : StarterGui.MainGui.BossHealthFrame.BossHealthScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = v1.RemoteEvent.TrackBossEvent
local v_u_3 = script.Parent
local v_u_4 = v_u_3.Parent
local v_u_5 = v_u_4.CashImgButton.FrameForChangingCash
local v_u_6 = v_u_3.HealthBar
local v_u_7 = v_u_3.Normal_ZombieImage
local v_u_8 = v_u_3.Santa_ZombieImage
local v_u_9 = v_u_3.NameLabel
local v_u_10 = v_u_6.UIGradient
local v_u_11 = v_u_6.HealthLabel
local v_u_12 = v1.BossEventImg
local v_u_13 = require(v1.AllModules.ConvertVal).ConvertToReadableNumbers
local v_u_14 = require(v_u_4.MainGuiScript.ToggleFrameModule.TweenSizeOnFrame)
local v_u_15 = require(v1.AllModules.GetStrokeColorFor)
local v_u_16 = Color3.new(0, 1)
local v_u_17 = Color3.new(1)
local v_u_18 = nil
local v_u_19 = 0
local v_u_20 = {}
v_u_20.__index = v_u_20
function MakeNewTracker(p21)
    -- upvalues: (copy) v_u_20, (copy) v_u_9, (copy) v_u_15, (copy) v_u_8, (copy) v_u_7, (copy) v_u_14, (copy) v_u_3, (ref) v_u_19, (copy) v_u_6, (copy) v_u_12
    local v22 = p21:WaitForChild("Humanoid", 10)
    if v22 and v22.Health > 0 then
        local v23 = p21.Name
        local v24 = v_u_20
        local v_u_25 = setmetatable({}, v24)
        v_u_25.Humanoid = v22
        v_u_25.MaxHealth = v22.MaxHealth
        v_u_25.TweenNumber = 0
        v_u_25.Health_C = v22.HealthChanged:Connect(function(p26)
            -- upvalues: (copy) v_u_25
            v_u_25:OnHealthChanged(p26, true)
        end)
        v_u_25:OnHealthChanged(v_u_25.MaxHealth, false)
        local v27 = p21:GetAttribute("NameColor")
        v_u_9.TextColor3 = v27
        v_u_9.UIStroke.Color = v_u_15(v27)
        v_u_9.Text = "[BOSS]\n" .. v23
        if v23:find("anta") then
            v_u_8.Visible = true
            v_u_7.Visible = false
            v_u_8.Image = p21:GetAttribute("ImgId")
        else
            v_u_8.Visible = false
            v_u_7.Visible = true
            v_u_7.Image = p21:GetAttribute("ImgId")
        end
        v_u_14(v_u_3, true)
        local v28 = p21:GetAttribute("NumOfSpecialBossEvent") or 0
        local _ = v_u_25.MaxHealth / (v28 + 1)
        for v29 = 1, v28 do
            local v30 = v29 <= v_u_19 and v_u_6["BossEvent" .. v29] or v_u_12:Clone()
            v30.Position = UDim2.fromScale(v29 / (v28 + 1), 0.5)
            v30.Parent = v_u_6
            v30.Name = "BossEvent" .. v29
        end
        for v31 = v28 + 1, v_u_19 do
            v_u_6["BossEvent" .. v31]:Destroy()
        end
        v_u_19 = v28
        return v_u_25
    end
end
function v_u_20.PrintRatio(p32, p33)
    -- upvalues: (copy) v_u_10, (copy) v_u_17, (copy) v_u_16
    if p33 <= 0 then
        v_u_10.Color = ColorSequence.new(v_u_17)
    elseif p33 + 0.001 >= 1 then
        v_u_10.Color = ColorSequence.new(v_u_16)
    else
        v_u_10.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, v_u_16),
            ColorSequenceKeypoint.new(p33, v_u_16),
            ColorSequenceKeypoint.new(p33 + 0.001, v_u_17),
            ColorSequenceKeypoint.new(1, v_u_17)
        })
    end
    p32.Printed_r = p33
end
function v_u_20.OnHealthChanged(p34, p35, p36)
    -- upvalues: (copy) v_u_11, (copy) v_u_13
    local v37 = p35 / p34.MaxHealth
    local v38 = p34.MaxHealth
    local v39 = math.clamp(0, v37, v38)
    if v39 == 0 then
        task.delay(1, p34.EndTracking, p34)
    end
    local v40 = p34.Printed_r or 1
    p34.Previous_r = v39
    p34.TweenNumber = p34.TweenNumber + 1
    v_u_11.Text = v_u_13(p35) .. " / " .. v_u_13(p34.MaxHealth)
    if p36 then
        local v41 = p34.TweenNumber
        local v42 = 0
        while v42 < 0.2 do
            p34:PrintRatio(v40 + v42 / 0.2 * (v39 - v40))
            v42 = v42 + task.wait()
            if not p34.TweenNumber or p34.TweenNumber ~= v41 then
                return
            end
        end
        p34:PrintRatio(v39)
    else
        p34:PrintRatio(v39)
    end
end
function v_u_20.EndTracking(p43)
    -- upvalues: (copy) v_u_14, (copy) v_u_3
    if p43.TweenNumber then
        v_u_14(v_u_3, false)
    end
    task.wait(2)
    p43:Clear()
end
function v_u_20.Clear(p44)
    -- upvalues: (ref) v_u_18
    if p44.Health_C then
        p44.Health_C:Disconnect()
    end
    if p44 == v_u_18 then
        v_u_18 = nil
    end
    table.clear(p44)
end
function OnBossAdded(p45)
    -- upvalues: (ref) v_u_18
    if v_u_18 then
        v_u_18:Clear()
    end
    local v46 = MakeNewTracker(p45)
    if v46 then
        v_u_18 = v46
    end
end
function OnSizeChanged()
    -- upvalues: (copy) v_u_5, (copy) v_u_3
    local v47 = v_u_5:FindFirstChild("AutoBuildBttn")
    local v48
    if v47 then
        v48 = v47.AbsolutePosition.Y + v47.AbsoluteSize.Y
    else
        v48 = v_u_5.AbsolutePosition.Y
    end
    local v49 = v48 + (_G.ConstantOffset or 7)
    v_u_3.Position = UDim2.new(0.5, 0, 0, v49)
end
local v_u_50 = nil
function OnVisibleStateChanged()
    -- upvalues: (ref) v_u_50, (copy) v_u_3, (copy) v_u_4
    if v_u_50 then
        v_u_50:Disconnect()
    end
    if v_u_3.Visible then
        v_u_50 = v_u_4:GetPropertyChangedSignal("AbsoluteSize"):Connect(OnSizeChanged)
        OnSizeChanged()
    end
end
v_u_3:GetPropertyChangedSignal("Visible"):Connect(OnVisibleStateChanged)
OnVisibleStateChanged()
v2.OnClientEvent:Connect(OnBossAdded)

--========================================
-- LocalScript : StarterGui.MainGui.SeasonFrame.SeasonScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players").LocalPlayer
while not v2:GetAttribute("DataFullyLoaded") do
    v2:GetAttributeChangedSignal("DataFullyLoaded"):Wait()
end
local v_u_3 = script:GetAttribute("SeasonName")
local v_u_4 = require(v1.AllModules.Events.Seasons[v_u_3 .. "SeasonDescription"])
local v_u_5 = require(v1.AllModules.BuyCash.BuyCashModule)
local v_u_6 = require(v1.AllModules.ImageFromName)
local v_u_7 = require(script.PositionAndSize)
local v_u_8 = require(v1.AllModules.ConvertVal)
local v_u_9 = require(v1.AllModules.GuiMark)
local v_u_10 = require(v2.Storage)
local v_u_11 = v_u_4.SeasonRewards
local v_u_12 = v2.Stats[v_u_3][v_u_3 .. "SeasonClaimedRewards"]
local v_u_13 = v_u_4.CurrencyType
local v_u_14 = v2.Stats[v_u_3][v_u_13]
local v_u_15 = v_u_14.Value
local v_u_16 = script.Parent
local v17 = v_u_16.Parent
local v_u_18 = v_u_16.RewardFrame
local v_u_19 = v_u_18.ItemButton_TEMPLATE
v_u_19.Parent = script
v_u_19.ClaimButton.CurrencyImage.Image = v_u_6[v_u_13].Image
local v20 = v_u_18.PrevButton
local v21 = v_u_18.NextButton
local v_u_22 = v_u_16.LevelLabel
local v_u_23 = v_u_18.LockedFrame
local v_u_24 = v_u_23.ToUnlock
local v_u_25 = v_u_23.RequirementsFrame
local v_u_26 = v_u_25.ClaimAll
local v27 = v17[v_u_3 .. "SeasonBttn"]
v_u_16.SeasonNameLabel.Text = v_u_3 .. " season " .. DateTime.now():FormatUniversalTime("YYYY", "en-us")
local v_u_28 = 0
local v_u_29 = v_u_9.AddMark(v27, false)
local v_u_30 = v1.RemoteEvent.GuiEvent.GuiEventLocal
local v_u_31 = v1.RemoteFunction.Events.ClaimSeasonItemF
local v_u_32 = nil
local v_u_33 = {}
local v_u_34 = {}
local v_u_35 = nil
local v_u_36 = v17:GetAttributes()
local v_u_37 = 0
local v_u_38 = 1
local v_u_39 = game:GetService("SoundService").Sound.ClickSound
local v_u_40 = {}
v_u_40.__index = v_u_40
function NewItemButton(p41, p42, p43)
    -- upvalues: (copy) v_u_40, (copy) v_u_19, (copy) v_u_18, (copy) v_u_6, (copy) v_u_8, (copy) v_u_5, (copy) v_u_10, (copy) v_u_9, (ref) v_u_15
    local v44 = v_u_40
    local v45 = setmetatable({}, v44)
    local v46 = v_u_19:Clone()
    v46.Parent = v_u_18
    v46.Size = p42
    v46.Position = p43
    local v47 = p41.ItemName
    v46.ItemImage.Image = v_u_6[v47].Image
    v46.ItemImage.UIAspectRatioConstraint.AspectRatio = v_u_6[v47].AspectRatio or 1
    if v47:find("coin") then
        local v48 = v46.AmountLabel
        local v49 = v_u_8.SimpleConversion
        local v50 = p41.Amount * v_u_5.GetCashFor(v_u_10.Level.Value, v47:sub(6))
        v48.Text = "$" .. v49((math.floor(v50)))
    else
        v46.AmountLabel.Text = "\195\151" .. p41.Amount
    end
    v45.Price = p41.Price
    v45.ItemButton = v46
    v45.Invoking = false
    v45.ClaimButton = v46.ClaimButton
    v45.ClaimText = v45.ClaimButton.ClaimText
    v45.PriceLabel = v45.ClaimButton.PriceLabel
    v45.PriceLabel.Text = v45.Price
    v45.Mark = v_u_9.AddMark(v45.ClaimButton, v_u_15 >= v45.Price)
    return v45
end
function v_u_40.OnActivated(p51)
    -- upvalues: (copy) v_u_39, (ref) v_u_15, (copy) v_u_30, (copy) v_u_13, (copy) v_u_3, (copy) v_u_31
    v_u_39:Play()
    if v_u_15 < p51.Price then
        v_u_30:Fire("WrongMessage", "You don\'t have enough " .. v_u_13:sub(v_u_3:len() + 1, -1):lower())
        return
    elseif p51.Invoking then
        return
    else
        p51.Invoking = true
        p51.Mark:Hide()
        p51:ChangeAppearance(false)
        local v52 = v_u_31:InvokeServer(v_u_3, p51.Level, p51.RewardNum)
        if p51.ItemButton then
            p51.Invoking = false
            p51:ChangeAppearance(v52)
        end
    end
end
function v_u_40.ChangeAppearance(p_u_53, p54)
    -- upvalues: (copy) v_u_36, (ref) v_u_38
    if p_u_53.Activated_C then
        p_u_53.Activated_C:Disconnect()
    end
    local v55 = not p54
    if v55 then
        v55 = not p_u_53.Invoking
    end
    p_u_53.ItemButton.CheckMark.Visible = p54
    p_u_53.ClaimButton.CurrencyImage.Visible = v55
    p_u_53.PriceLabel.Visible = v55
    if v55 then
        p_u_53.ClaimButton.UIGradient.Color = v_u_36.BaseGreenGradient
        p_u_53.ClaimText.Size = UDim2.fromScale(0.5, 0.8)
        p_u_53.ClaimText.Text = "Buy"
        if p_u_53.Level <= v_u_38 then
            p_u_53.ItemButton:AddTag("SizableUI")
            p_u_53.ItemButton.AutoButtonColor = true
            p_u_53.Activated_C = p_u_53.ItemButton.Activated:Connect(function()
                -- upvalues: (copy) p_u_53
                p_u_53:OnActivated()
            end)
        else
            p_u_53.ItemButton.AutoButtonColor = false
            p_u_53.ItemButton:RemoveTag("SizableUI")
        end
    else
        p_u_53.ItemButton.AutoButtonColor = false
        p_u_53.ClaimButton.UIGradient.Color = v_u_36.BaseGreyGradient
        p_u_53.ItemButton:RemoveTag("SizableUI")
        p_u_53.ClaimText.Size = UDim2.fromScale(1, 0.8)
        p_u_53.ClaimText.Text = p_u_53.Invoking and "Buying" or "Claimed"
        return
    end
end
function v_u_40.Delete(p56)
    if p56.Mark then
        p56.Mark:DeleteMark()
    end
    if p56.Activated_C then
        p56.Activated_C:Disconnect()
    end
    p56.ItemButton:Destroy()
    table.clear(p56)
end
function ChangeCheckImg(p57, p58)
    if p57 then
        p58.Image = "rbxassetid://149260637"
        p58.ImageColor3 = Color3.new(1, 1, 1)
    else
        p58.Image = "rbxassetid://103344771690872"
        p58.ImageColor3 = Color3.new(1)
    end
end
function DisplayLevel(p59)
    -- upvalues: (copy) v_u_29, (copy) v_u_33, (ref) v_u_38, (ref) v_u_37, (copy) v_u_4, (copy) v_u_10, (copy) v_u_23, (copy) v_u_24, (copy) v_u_26, (copy) v_u_25, (copy) v_u_22, (copy) v_u_34, (copy) v_u_11, (copy) v_u_12, (copy) v_u_7
    v_u_29:Hide()
    for _, v60 in pairs(v_u_33) do
        v60:Destroy()
    end
    table.clear(v_u_33)
    v_u_38 = v_u_37
    if v_u_4.CanAccessLevelWithRequirements(v_u_38 + 1, v_u_10) then
        v_u_38 = v_u_38 + 1
    end
    if v_u_38 < p59 then
        v_u_23.Visible = true
        v_u_24.Text = "To unlock level " .. p59 .. ":"
        v_u_26.Text = "Claim all level " .. p59 - 1 .. " items"
        ChangeCheckImg(p59 <= v_u_37 + 1, v_u_26.CheckImg)
        for v61, v62 in pairs(v_u_4.LevelRequirements[p59] or {}) do
            local v63 = v_u_26:Clone()
            v63.Parent = v_u_25
            local v64 = v62.Amount
            local v65 = v_u_10[v62.ValueName].Value
            if v62.Type == "Kill" then
                v63.Text = "Kill " .. v64 .. " " .. v62.ValueName:lower() .. (v64 > 1 and "s" or "") .. "\n  " .. v65 .. "/" .. v64 .. " killed"
                v63.Size = v63.Size + UDim2.fromScale(0, v63.Size.Y.Scale)
            end
            v63.LayoutOrder = v61
            ChangeCheckImg(v64 <= v65, v63.CheckImg)
            local v66 = v_u_33
            table.insert(v66, v63)
        end
    else
        v_u_23.Visible = false
    end
    v_u_22.Text = "Level " .. p59
    for _, v67 in pairs(v_u_34) do
        v67:Delete()
    end
    table.clear(v_u_34)
    local v68 = v_u_11[p59]
    local v69 = #v68
    local v70 = v_u_12.Value:split("_")[p59]
    local v71 = v_u_7[v69].Size
    local v72 = v_u_7[v69].Positions
    for v73, v74 in pairs(v68) do
        local v75 = NewItemButton(v74, v71, v72[v73])
        v75.Level = p59
        v75.RewardNum = v73
        local v76 = v_u_34
        table.insert(v76, v75)
        if v70:sub(v73, v73) == "a" then
            v75:ChangeAppearance(false)
        else
            v75:ChangeAppearance(true)
            v75.Mark:Hide()
        end
    end
end
function ChangeDisplayedLevel(p77)
    -- upvalues: (copy) v_u_4, (ref) v_u_35
    local v78 = v_u_4.NumberOfLevels
    local v79 = math.clamp(p77, 1, v78)
    v_u_35 = v79
    DisplayLevel(v79)
end
function OnSeasonStrValChanged(p80)
    -- upvalues: (copy) v_u_4, (copy) v_u_12, (ref) v_u_37
    local v81 = v_u_4.GetLastCompletedLevel(v_u_12.Value)
    if v81 ~= v_u_37 then
        v_u_37 = v81
        if p80 ~= true then
            ChangeDisplayedLevel(v_u_37 + 1)
        end
    end
end
function OnVisibleStateChanged()
    -- upvalues: (ref) v_u_32, (copy) v_u_16, (copy) v_u_12, (ref) v_u_37, (copy) v_u_4, (ref) v_u_28, (copy) v_u_10, (ref) v_u_15
    if v_u_32 then
        v_u_32:Disconnect()
    end
    if v_u_16.Visible then
        v_u_32 = v_u_12.Changed:Connect(OnSeasonStrValChanged)
        OnSeasonStrValChanged(true)
        ChangeDisplayedLevel(v_u_37 + 1)
        return
    else
        local v82 = v_u_12.Value
        local v83 = v_u_4.GetLastCompletedLevel(v82) + 1
        v_u_28 = (1 / 0)
        if v_u_4.NumberOfLevels >= v83 then
            local v84 = v_u_4.CanAccessLevelWithRequirements(v83, v_u_10)
            local v85 = v82:split("_")[v83]
            for v86, v87 in pairs(v_u_4.SeasonRewards[v83]) do
                if v85:sub(v86, v86) == "a" and (not v84 or v87.Price > v_u_15) and v_u_28 > v87.Price then
                    v_u_28 = v87.Price
                end
            end
        end
    end
end
function OnCurrencyValChanged()
    -- upvalues: (ref) v_u_15, (copy) v_u_14, (copy) v_u_16, (copy) v_u_34, (copy) v_u_12, (copy) v_u_4, (copy) v_u_29, (copy) v_u_10, (ref) v_u_28
    v_u_15 = v_u_14.Value
    if v_u_16.Visible then
        for _, v88 in pairs(v_u_34) do
            if v_u_15 < v88.Price then
                v88.Mark:Hide()
            elseif not v88.Mark.IsDisplayed and v88.ClaimText.Text == "Buy" then
                v88.Mark:Show()
            end
        end
        return
    else
        local v89 = v_u_12.Value
        local v90 = v_u_4.GetLastCompletedLevel(v89) + 1
        if v_u_4.NumberOfLevels < v90 then
            v_u_29:Hide()
            return
        elseif v_u_4.CanAccessLevelWithRequirements(v90, v_u_10) then
            if v_u_15 < v_u_28 then
                return v_u_29:Hide()
            end
            local v91 = v_u_12.Value:split("_")[v90]
            for v92, v93 in pairs(v_u_4.SeasonRewards[v90]) do
                if v91:sub(v92, v92) == "a" and v_u_15 >= v93.Price then
                    v_u_29:Show()
                end
            end
        else
            v_u_29:Hide()
        end
    end
end
OnCurrencyValChanged()
OnVisibleStateChanged()
v_u_14.Changed:Connect(OnCurrencyValChanged)
v_u_16:GetPropertyChangedSignal("Visible"):Connect(OnVisibleStateChanged)
v20.Activated:Connect(function()
    -- upvalues: (copy) v_u_39, (ref) v_u_35
    v_u_39:Play()
    ChangeDisplayedLevel(v_u_35 - 1)
end)
v21.Activated:Connect(function()
    -- upvalues: (copy) v_u_39, (ref) v_u_35
    v_u_39:Play()
    ChangeDisplayedLevel(v_u_35 + 1)
end)

--========================================
-- LocalScript : StarterGui.MainGui.SeasonFrame.SeasonTrackForSeasonScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage").AllModules.Events
local v_u_2 = v1.Seasons
local v3 = require(v1.Client_EventTracker)
local v_u_4 = script.Parent.SeasonScript
function ToggleSeason(p5, p6)
    -- upvalues: (copy) v_u_4
    v_u_4.Enabled = false
    if p6 then
        v_u_4:SetAttribute("SeasonName", p5)
        task.wait()
        v_u_4.Enabled = true
    else
        v_u_4:SetAttribute("SeasonName", nil)
    end
end
function OnEventChanged(p7, p8, p9)
    -- upvalues: (copy) v_u_2, (copy) v_u_4
    if p9 and not p8 then
        return
    else
        local v10 = p7:sub(1, -6)
        if v_u_2:FindFirstChild(v10 .. "SeasonDescription") then
            local v11 = v_u_4:GetAttribute("SeasonName")
            if v11 and (v11 ~= "" and v11 ~= v10) then
                if p8 then
                    ToggleSeason(v10, true)
                end
            else
                ToggleSeason(v10, p8)
                return
            end
        else
            return
        end
    end
end
v3.ConnectToEventChanged(OnEventChanged, "Season")

--========================================
-- LocalScript : StarterGui.MessageGUI.MessageLocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("SoundService")
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("Players")
game:GetService("Debris")
local v_u_5 = v4.LocalPlayer
local v_u_6 = v_u_5:WaitForChild("Settings")
local v_u_7 = v_u_6:WaitForChild("NotificationsVisual")
local v_u_8 = v_u_6:WaitForChild("NotificationsSounds")
local v9 = v1:WaitForChild("RemoteEvent"):WaitForChild("GuiEvent")
local v10 = v9:WaitForChild("GuiEventLocal")
local v_u_11 = require(script:WaitForChild("SendNotification"))
local v_u_12 = require(script:WaitForChild("WinAnimation"))
local v_u_13 = require(script:WaitForChild("WriteMessage"))
local v_u_14 = nil
local v_u_15 = script.Parent
local v_u_16 = v_u_15:WaitForChild("WrongLabel"):Clone()
local v17 = v2:WaitForChild("Sound")
local v_u_18 = v17.BipWrong
local v_u_19 = v17.BipSound
local v_u_20 = TweenInfo.new(1, Enum.EasingStyle.Linear)
function MessagePlr(p21, p22, p23, p24)
    -- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_8, (copy) v_u_19, (copy) v_u_11, (copy) v_u_12, (copy) v_u_15, (copy) v_u_16, (copy) v_u_18, (copy) v_u_3, (copy) v_u_20, (copy) v_u_6, (copy) v_u_13, (ref) v_u_14
    if p21 == "BasicInfo" then
        local v25 = p23 or {}
        if v_u_7.Value == "OFF" then
            return
        elseif v_u_7.Value ~= "ON_1" or (table.find(v25, v_u_5) or table.find(v25, "Server")) then
            if v_u_8.Value == "ON" or v_u_8.Value == "ON_1" and (table.find(v25, v_u_5) or table.find(v25, "Server")) then
                v_u_19:Play()
            end
            v_u_11(p22, table.find(v25, v_u_5) and Color3.new(0.392157, 0.898039, 1) or Color3.new(1, 1, 1))
        end
    elseif p21 == "KeyAnim" then
        v_u_12(p22, p23, p24)
        return
    elseif p21 == "WrongMessage" then
        local v26 = v_u_15:FindFirstChild("WrongLabel")
        if v26 then
            v26:Destroy()
        end
        local v27 = v_u_16:Clone()
        v27.Position = UDim2.new(-0.4, 0, 1, -75)
        v27.Parent = v_u_15
        v27.Text = p22
        v27:TweenPosition(UDim2.new(0.5, 0, 1, -75), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5)
        v_u_18:Play()
        task.wait(3)
        if v27.Parent then
            local v28 = v_u_3:Create(v27, v_u_20, {
                ["TextTransparency"] = 1,
                ["TextStrokeTransparency"] = 1
            })
            v28:Play()
            v28.Completed:Wait()
            if v27.Parent then
                v27:Destroy()
            end
        else
            return
        end
    elseif p21 == "Notification" then
        v_u_13(p22, v_u_6.NotificationsSounds.Value ~= "OFF")
    elseif p21 == "Badge" then
        if not v_u_14 then
            v_u_14 = require(script.BadgeAnimation)
        end
        v_u_14(p22)
    end
end
v10.Event:Connect(MessagePlr)
v9.OnClientEvent:Connect(MessagePlr)
