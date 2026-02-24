
--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.PlayerMusicAndSound.GetMusics
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game:GetService("ReplicatedStorage").AllModules.Events.Client_EventTracker)
local v2 = game:GetService("SoundService")
local v_u_3 = Instance.new("Folder", v2)
local v_u_4 = {
    ["Normal"] = {
        { "rbxassetid://9048375035", 0.3 },
        { "rbxassetid://1842976958", 0.3 },
        { "rbxassetid://1843497734", 0.3 },
        { "rbxassetid://1836568890", 0.5 },
        { "rbxassetid://5409360995", 0.2 },
        { "rbxassetid://1842559618", 0.3 },
        { "rbxassetid://7023887630", 0.3 },
        { "rbxassetid://1847017999", 0.3 },
        { "rbxassetid://1842898857", 0.3 },
        { "rbxassetid://7024220835", 0.3 },
        { "rbxassetid://1839525927", 0.3 }
    },
    ["HalloweenEvent"] = {
        { "rbxassetid://1836009584", 0.8 },
        { "rbxassetid://1838592691", 0.6 },
        { "rbxassetid://1835766936", 0.4 },
        { "rbxassetid://1838007207", 0.6 },
        { "rbxassetid://1836009643", 0.6 },
        { "rbxassetid://1842942838", 0.6 },
        { "rbxassetid://1838605065", 0.6 },
        { "rbxassetid://1837467285", 0.7 },
        { "rbxassetid://1841601539", 0.7 }
    },
    ["ChristmasEvent"] = {
        { "rbxassetid://9046740461", 0.25 },
        { "rbxassetid://1837466718", 0.35 },
        { "rbxassetid://1837101393", 0.35 },
        { "rbxassetid://1841342574", 0.15 },
        { "rbxassetid://1838667680", 0.25 },
        { "rbxassetid://1838667764", 0.35 },
        { "rbxassetid://1838667168", 0.35 },
        { "rbxassetid://9040675850", 0.35 },
        { "rbxassetid://7023749823", 0.35 },
        { "rbxassetid://9038473826", 0.35 },
        { "rbxassetid://1841446876", 0.35 }
    }
}
local v_u_5 = nil
return function()
    -- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_3, (ref) v_u_5
    local v6 = v_u_4.Normal
    local v7 = "Normal"
    for v8, v9 in pairs(v_u_4) do
        if v8 ~= "Normal" and v_u_1.AllEvents[v8] then
            v6 = v9
            v7 = v8
        end
    end
    local v10 = v_u_3:FindFirstChild(v7)
    if not v10 then
        v10 = Instance.new("Folder", v_u_3)
        v10.Name = v7
        for _, v11 in pairs(v6) do
            local v12 = Instance.new("Sound", v10)
            v12.SoundId = v11[1]
            v12.Volume = v11[2]
        end
    end
    local v13 = v_u_5
    if v13 then
        v13 = v_u_5 ~= v7
    end
    v_u_5 = v7
    return v10:GetChildren(), v13
end

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.OnJoinScript.ShowAdButton
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Players").LocalPlayer
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("AdService")
local v_u_4 = v2.RemoteEvent.RewardedAdEvent
local v_u_5 = require(v2.AllModules.BuyCash.RewardedAdModule)
local v_u_6 = require(v2.AllModules.ConvertVal)
local v_u_7 = script.AdScreenPart
local v_u_8 = v_u_7.AdSurfaceGui
local v_u_9 = v_u_8.BackgroundBttn
local v_u_10 = v_u_9.AddRewardAmount
local v_u_11 = v_u_9.WatchFrame
local v_u_12 = v_u_9.Ad
local v_u_13 = v_u_11.UIGradient
v_u_8:AddTag("SurfaceGuiForPGui")
local v_u_14 = v_u_13.Color
GreyGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.7, 0.7, 0.7)), ColorSequenceKeypoint.new(0.7, Color3.new(0.6, 0.6, 0.6)), ColorSequenceKeypoint.new(1, Color3.new(0.45, 0.45, 0.45)) })
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = v_u_1:WaitForChild("leaderstats"):WaitForChild("Level")
local v_u_18 = v_u_1:WaitForChild("Stats"):WaitForChild("Playtime")
local v_u_19 = nil
local v20 = {}
local v_u_21 = {
    Enum.AdAvailabilityResult.PlayerIneligible,
    Enum.AdAvailabilityResult.DeviceIneligible,
    Enum.AdAvailabilityResult.PublisherIneligible,
    Enum.AdAvailabilityResult.ExperienceIneligible
}
function CheckIfIsEligible(p22)
    -- upvalues: (copy) v_u_21
    return not table.find(v_u_21, p22)
end
function CheckAdAvailability()
    -- upvalues: (ref) v_u_19, (copy) v_u_3
    if v_u_19 == false then
        return false
    else
        local v23, v24 = pcall(function()
            -- upvalues: (ref) v_u_3
            return v_u_3:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo)
        end)
        if v23 then
            v_u_19 = CheckIfIsEligible(v24.AdAvailabilityResult)
            if v_u_19 == false then
                return false
            else
                return v24.AdAvailabilityResult
            end
        else
            warn(v24)
            return false
        end
    end
end
v_u_4.OnClientEvent:Connect(function(_, _)
    CheckAdAvailabilityUntilFound()
end)
function OnLevelChanged()
    -- upvalues: (copy) v_u_17, (copy) v_u_10, (copy) v_u_6, (copy) v_u_5
    local v25 = v_u_17.Value
    v_u_10.Text = "$" .. v_u_6.SimpleConversion(v_u_5.GetAdRewardForLevel(v25))
end
function ToggleAdButtonVisibility(p26, p27, p28)
    -- upvalues: (copy) v_u_7, (copy) v_u_8, (ref) v_u_15, (ref) v_u_16, (copy) v_u_9, (copy) v_u_10, (copy) v_u_13, (copy) v_u_12, (copy) v_u_11, (copy) v_u_17, (copy) v_u_14, (copy) v_u_4
    v_u_7.Transparency = p26 and 0 or 1
    v_u_7.CanQuery = p26
    v_u_8.Enabled = p26
    if v_u_15 then
        v_u_15:Disconnect()
    end
    if v_u_16 then
        v_u_16:Disconnect()
    end
    if p26 then
        v_u_9.AutoButtonColor = not p27
        v_u_10.TextScaled = not p27
        if p27 then
            v_u_13.Color = GreyGradient
            v_u_12.Text = "Next ad:"
            v_u_11.ClaimText.Text = "Waiting"
            return
        end
        v_u_15 = v_u_17.Changed:Connect(OnLevelChanged)
        OnLevelChanged()
        if p28 then
            v_u_11.ClaimText.Text = "Unavailable"
            v_u_13.Color = GreyGradient
        else
            v_u_11.ClaimText.Text = "Watch"
            v_u_13.Color = v_u_14
            v_u_16 = v_u_9.Activated:Connect(function()
                -- upvalues: (ref) v_u_4
                v_u_4:FireServer()
                ToggleAdButtonVisibility(false)
            end)
        end
        v_u_12.Text = "Ad:"
    end
end
function CheckAdAvailabilityUntilFound()
    -- upvalues: (copy) v_u_18, (copy) v_u_5, (copy) v_u_1, (copy) v_u_10, (copy) v_u_6
    ToggleAdButtonVisibility(false)
    while v_u_18.Value <= 120 do
        v_u_18:GetPropertyChangedSignal("Value"):Wait()
    end
    ToggleAdButtonVisibility(true, true)
    local v29 = v_u_5.GetTimeBeforeCanWatchNextAd(v_u_1)
    while v29 > 0 do
        v_u_10.Text = v_u_6.ConvertTimeInPart(v29, 2)
        task.wait(1)
        v29 = v_u_5.GetTimeBeforeCanWatchNextAd(v_u_1)
    end
    ToggleAdButtonVisibility(false)
    local v30 = CheckAdAvailability()
    if v30 then
        ToggleAdButtonVisibility(true, false, true)
        while v30 == Enum.AdAvailabilityResult.NoFill do
            task.wait(120)
            v30 = CheckAdAvailability()
            if not v30 then
                return
            end
        end
        ToggleAdButtonVisibility(true)
    end
end
function v20.CheckForUserEligibilityAndShowAd(p31)
    -- upvalues: (copy) v_u_7
    while p31:GetAttribute("Animating") do
        p31:GetAttributeChangedSignal("Animating"):Wait()
    end
    local v32 = p31:WaitForChild("ScreenP")
    v_u_7.CFrame = v32.CFrame * CFrame.new(-4.8, 0, 0.25) * CFrame.Angles(0, -1.3962634015954636, 0)
    v_u_7.Parent = v32
    ToggleAdButtonVisibility(false)
    CheckAdAvailabilityUntilFound()
end
return v20

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.OverHeadGuis.OverHeadGuisModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Players")
local v_u_4 = v_u_3.LocalPlayer:WaitForChild("PlayerGui")
require(v1.AllModules.CharacterSize.GetCharacterScale)
local v_u_5 = require(v1.AllModules.ConvertVal).ConvertToReadableNumbers
local v_u_6 = require(v1.AllModules.CharacterSize.GetSizeValue)
local v_u_7 = require(v1.AllModules.TycoonColors).TycoonColors
local v_u_8 = require(v1.AllModules.GetStrokeColorFor)
local v_u_9 = script:WaitForChild("OverHeadGUI")
local v_u_10 = v_u_9.StudsOffset
local v_u_11 = v_u_9.MaxDistance
local v_u_12 = v_u_9.Size
local v_u_13 = v_u_9:WaitForChild("HealthFrame").Size.Y.Scale
local v_u_14 = v_u_12.Y.Scale / v_u_12.X.Scale
local v_u_15 = v1.BossEventImg
local v_u_16 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v_u_17 = TweenInfo.new(1, Enum.EasingStyle.Linear)
local v_u_18 = Color3.new(1)
local v_u_19 = Color3.new(0.35, 1, 0.35)
local v_u_20 = Color3.new(1, 0.8, 0)
local v_u_21 = Color3.new()
local v_u_22 = v_u_9.HealthFrame.RedBar.UIGradient.Color
local v_u_23 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.8, 0.8, 0.8)), ColorSequenceKeypoint.new(0.375, Color3.new(0.7, 0.7, 0.7)), ColorSequenceKeypoint.new(1, Color3.new(0.4, 0.4, 0.4)) })
local v24 = {}
local v_u_25 = {}
v24.AllOverHeadGui = v_u_25
local v_u_26 = {
    ["CharScale"] = 1
}
v_u_26.__index = v_u_26
function GetScaleForMaxHp(p27)
    return p27 < 25 and 0.25 or (1 - 0.7999999999999999 ^ ((p27 - 25) / 75)) * 0.75 + 0.25
end
function GetTowerColor(p28)
    -- upvalues: (copy) v_u_7
    local v29
    if p28 then
        v29 = p28.Owner.Value
    else
        v29 = p28
    end
    if v29 then
        local v30 = v29.Stats.Custom
        if v30.CustomColorsEnabled.Value then
            return v30.Color1Part.Value
        else
            return v_u_7[p28.Name][1]
        end
    else
        return Color3.new(0.95, 0.95, 0.95)
    end
end
function v_u_26.OnHealthChanged(p31, p32, p33)
    -- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_16
    if p31.IsImmune then
        return
    else
        p31.HealthLabel.Text = v_u_5((math.floor(p32))) .. " / " .. v_u_5(p31.MaxHealth)
        if p31.HealthTween and p31.HealthTween.PlaybackState == Enum.PlaybackState.Playing then
            p31.HealthTween:Cancel()
        end
        if p33 then
            p31.HealthBar.Size = UDim2.fromScale(p32 / p31.MaxHealth, 1)
        else
            p31.HealthTween = v_u_2:Create(p31.HealthBar, v_u_16, {
                ["Size"] = UDim2.fromScale(p32 / p31.MaxHealth, 1)
            })
            p31.HealthTween:Play()
        end
    end
end
function v_u_26.ConnectHealthChanged(p_u_34)
    -- upvalues: (copy) v_u_13, (copy) v_u_14
    local v_u_35 = p_u_34.Humanoid
    p_u_34.MaxHealth = v_u_35.MaxHealth
    local function v37()
        -- upvalues: (copy) p_u_34, (copy) v_u_35, (ref) v_u_13, (ref) v_u_14
        p_u_34.MaxHealth = v_u_35.MaxHealth
        local v36 = GetScaleForMaxHp(p_u_34.MaxHealth)
        p_u_34.HealthFrame.Size = UDim2.fromScale(v36, v_u_13)
        p_u_34.RedBar.Size = UDim2.fromScale(1 - v_u_14 * v_u_13 / v36 * 0.1, 0.9)
    end
    p_u_34.MaxHealthChanged = v_u_35:GetPropertyChangedSignal("MaxHealth"):Connect(v37)
    p_u_34.HealthChanged_C = v_u_35.HealthChanged:Connect(function(p38)
        -- upvalues: (copy) p_u_34
        p_u_34:OnHealthChanged(p38)
    end)
    p_u_34:OnHealthChanged(v_u_35.Health, true)
    v37()
end
function v_u_26.PlaceGui(p_u_39)
    if not p_u_39.Head:IsDescendantOf(workspace) then
        p_u_39.Head = p_u_39.Char:WaitForChild("Head")
    end
    local v40 = p_u_39.Head
    if p_u_39.OverHeadGui then
        local v41 = v40:FindFirstChild("HatAttachment") or (v40:FindFirstChild("HairAttachment") or v40)
        p_u_39.OverHeadGui.Adornee = v41
        if p_u_39.GuiAdoorneeChanged then
            p_u_39.GuiAdoorneeChanged:Disconnect()
        end
        p_u_39.GuiAdoorneeChanged = v41.AncestryChanged:Connect(function()
            -- upvalues: (copy) p_u_39
            p_u_39:PlaceGui()
        end)
    end
end
function v_u_26.DisplayDamages(p42, p43)
    -- upvalues: (copy) v_u_5, (copy) v_u_18, (copy) v_u_20, (copy) v_u_19, (copy) v_u_21, (copy) v_u_2, (copy) v_u_17
    local v44 = p42.DamageTxt
    if v44.Visible then
        p43 = p43 + (p42.PreviousDamages or 0)
        if p42.DamageTween then
            p42.DamageTween:Cancel()
        end
    else
        v44.Visible = true
    end
    p42.PreviousDamages = p43
    local v45 = v_u_5
    local v46 = math.abs(p43)
    v44.Text = v45((math.floor(v46)))
    if p43 >= 0 then
        v44.TextColor3 = v_u_18
        v44.TextStrokeColor3 = v_u_20
    else
        v44.TextColor3 = v_u_19
        v44.TextStrokeColor3 = v_u_21
    end
    v44.TextTransparency = 0
    v44.TextStrokeTransparency = 0
    task.wait(2)
    if p42.PreviousDamages then
        if p43 == p42.PreviousDamages then
            p42.DamageTween = p42.DamageTween or v_u_2:Create(v44, v_u_17, {
                ["TextTransparency"] = 1,
                ["TextStrokeTransparency"] = 1
            })
            p42.DamageTween:Play()
            p42.DamageTween.Completed:Wait()
            if p42.PreviousDamages then
                if p42.DamageTween.PlaybackState == Enum.PlaybackState.Completed then
                    p42.PreviousDamages = 0
                    v44.Visible = false
                end
            end
        else
            return
        end
    else
        return
    end
end
function v_u_26.RemoveGui(p47)
    -- upvalues: (copy) v_u_25
    p47.OverHeadGui:Destroy()
    if p47.CustomisationEnabled_C then
        p47.CustomisationEnabled_C:Disconnect()
    end
    if p47.GuiAdoorneeChanged then
        p47.GuiAdoorneeChanged:Disconnect()
    end
    if p47.MaxHealthChanged then
        p47.MaxHealthChanged:Disconnect()
    end
    if p47.HealthChanged_C then
        p47.HealthChanged_C:Disconnect()
    end
    if p47.TycoonChanged_C then
        p47.TycoonChanged_C:Disconnect()
    end
    if p47.ForceFieldAdded then
        p47.ForceFieldAdded:Disconnect()
    end
    if p47.SizeChangedC then
        p47.SizeChangedC:Disconnect()
    end
    if p47.Color1Part_C then
        p47.Color1Part_C:Disconnect()
    end
    p47.AncestryChanged_C:Disconnect()
    v_u_25[p47.Char] = nil
    table.clear(p47)
end
function ImprovedWaitForChild(p48, p49, p50)
    while p50 < 60 and p49:IsDescendantOf(workspace) do
        local v51 = p49:WaitForChild(p48, 0.5)
        if v51 then
            return p50, v51
        end
        p50 = p50 + 0.5
    end
    return p50
end
function v_u_26.AddOverHeadGui(p_u_52)
    -- upvalues: (copy) v_u_26, (copy) v_u_25, (copy) v_u_9, (copy) v_u_4, (copy) v_u_3, (copy) v_u_6, (copy) v_u_15, (copy) v_u_23, (copy) v_u_22
    if p_u_52 then
        local v53 = 0
        while not p_u_52:IsDescendantOf(workspace) do
            v53 = v53 + task.wait(0.5)
            if v53 > 60 then
                return
            end
        end
        local v54, v55 = ImprovedWaitForChild("Humanoid", p_u_52, v53)
        if v55 then
            local _, v56 = ImprovedWaitForChild("Head", p_u_52, v54)
            if v56 then
                local v57 = v_u_26
                local v_u_58 = setmetatable({}, v57)
                v_u_25[p_u_52] = v_u_58
                v_u_58.OverHeadGui = v_u_9:Clone()
                v_u_58.OverHeadGui.Parent = v_u_4
                local v59 = v_u_58.OverHeadGui.NameLabel
                v_u_58.NameLabel = v59
                v_u_58.DamageTxt = v_u_58.OverHeadGui.DamageTxt
                v_u_58.HealthFrame = v_u_58.OverHeadGui.HealthFrame
                v_u_58.HealthLabel = v_u_58.HealthFrame.HealthLabel
                v_u_58.RedBar = v_u_58.HealthFrame.RedBar
                v_u_58.HealthBar = v_u_58.RedBar.GreenHealthBar
                v_u_58.Char = p_u_52
                v_u_58.Humanoid = v55
                v_u_58.Head = v56
                v_u_58:PlaceGui()
                v_u_58.AncestryChanged_C = p_u_52.AncestryChanged:Connect(function()
                    -- upvalues: (copy) p_u_52, (ref) v_u_26, (copy) v_u_58
                    if p_u_52:IsDescendantOf(workspace) then
                        v_u_26:PlaceGui()
                    else
                        v_u_58:RemoveGui()
                    end
                end)
                local v60 = v_u_3:GetPlayerFromCharacter(p_u_52)
                v_u_58.FromPlayer = v60
                local v61 = ""
                if v60 then
                    v61 = v60.DisplayName
                    if v60.MembershipType == Enum.MembershipType.Premium then
                        v61 = utf8.char(57345) .. " " .. v61
                    end
                    if v60.HasVerifiedBadge then
                        v61 = v61 .. utf8.char(57344)
                    end
                    v_u_58:LinkToTycoonColorChanges(v60)
                    local v62 = v_u_6(p_u_52)
                    if v62 then
                        v_u_58.SizeValue = v62
                        v_u_58.SizeChangedC = v62:GetPropertyChangedSignal("Value"):Connect(function()
                            -- upvalues: (copy) v_u_58
                            v_u_58:ChangeGuiSize()
                        end)
                        v_u_58:ChangeGuiSize()
                    end
                elseif p_u_52:HasTag("Zombie") then
                    v61 = v_u_58.Humanoid.DisplayName
                    ChangeNameColor(p_u_52:GetAttribute("NameColor"), v59)
                    v_u_58:ChangeGuiSize()
                    local v63 = p_u_52:GetAttribute("NumOfSpecialBossEvent")
                    if v63 and v63 > 0 then
                        local _ = v55.MaxHealth / (v63 + 1)
                        for v64 = 1, v63 do
                            local v65 = v_u_15:Clone()
                            v65.Position = UDim2.fromScale(v64 / (v63 + 1), 0.5)
                            v65.Parent = v_u_58.RedBar
                        end
                    end
                elseif p_u_52:HasTag("Clone") then
                    local v66 = v_u_3:GetPlayerByUserId(p_u_52:GetAttribute("WorkingForPlrId"))
                    if not v66 then
                        return
                    end
                    v61 = v66.DisplayName .. "\'s clone" .. (p_u_52:GetAttribute("CloneNumber") == 2 and " 2" or "")
                    v_u_58:LinkToTycoonColorChanges(v66)
                    v_u_58.SizeChangedC = p_u_52.Changed:Connect(function(p67)
                        -- upvalues: (copy) v_u_58
                        if p67 == "ScaleFactor" then
                            v_u_58:ChangeGuiSize()
                        end
                    end)
                    v_u_58:ChangeGuiSize()
                end
                v59.Text = v61
                v_u_58:ConnectHealthChanged()
                v_u_58:ChangeFreezeState()
                local v_u_68 = nil
                local function v_u_70(p69)
                    -- upvalues: (copy) v_u_58, (ref) v_u_23, (copy) p_u_52, (ref) v_u_68, (ref) v_u_22
                    v_u_58.IsImmune = true
                    v_u_58.HealthBar.Visible = false
                    v_u_58.HealthLabel.Text = "Immune"
                    v_u_58.RedBar.UIGradient.Color = v_u_23
                    if v_u_58.ForceFieldAdded then
                        v_u_58.ForceFieldAdded:Disconnect()
                    end
                    while p69.Parent == p_u_52 do
                        p69.AncestryChanged:Wait()
                    end
                    if v_u_58.Char then
                        if not v_u_68() then
                            v_u_58.IsImmune = false
                            v_u_58.HealthBar.Visible = true
                            v_u_58:OnHealthChanged(v_u_58.Humanoid.Health)
                            v_u_58.RedBar.UIGradient.Color = v_u_22
                        end
                    end
                end
                v_u_68 = function()
                    -- upvalues: (copy) p_u_52, (copy) v_u_70, (copy) v_u_58
                    local v71 = nil
                    for _, v72 in pairs(p_u_52:GetChildren()) do
                        if v72.Name == "ForceField" then
                            v71 = v72
                            break
                        end
                    end
                    if v71 then
                        task.spawn(v_u_70, v71)
                        return v71
                    else
                        v_u_58.ForceFieldAdded = p_u_52.ChildAdded:Connect(function(p73)
                            -- upvalues: (ref) v_u_70
                            if p73.Name == "ForceField" then
                                v_u_70(p73)
                            end
                        end)
                        return v71
                    end
                end
                v_u_68()
                return v_u_58
            end
        end
    else
        warn("Not a character")
        return
    end
end
function v_u_26.ChangeFreezeState(p_u_74)
    p_u_74.FreezeWasDisplayed = false
    p_u_74.WasFreezeImmune = false
    local function v77()
        -- upvalues: (copy) p_u_74
        local v75 = p_u_74.Char:GetAttribute("FreezeAmount") or 0
        if v75 == 0 then
            if not p_u_74.FreezeWasDisplayed then
                return
            end
            p_u_74.FreezeWasDisplayed = false
            p_u_74.DamageTxt.Position = UDim2.fromScale(0.5, 0.28)
            p_u_74.NameLabel.Position = UDim2.fromScale(0.5, 0.68)
            p_u_74.HealthFrame.Position = UDim2.fromScale(0.5, 1)
            if p_u_74.FreezeFrame then
                p_u_74.FreezeFrame.Visible = false
                return
            end
        else
            if not p_u_74.FreezeWasDisplayed then
                p_u_74.FreezeWasDisplayed = true
                p_u_74.DamageTxt.Position = UDim2.fromScale(0.5, 0.03)
                p_u_74.NameLabel.Position = UDim2.fromScale(0.5, 0.43)
                p_u_74.HealthFrame.Position = UDim2.fromScale(0.5, 0.75)
                if not p_u_74.FreezeFrame then
                    p_u_74.FreezeFrame = script.FreezeFrame:Clone()
                    p_u_74.FreezeFrame.Parent = p_u_74.OverHeadGui
                end
                p_u_74.FreezeFrame.Visible = true
            end
            local v76 = v75 == -1
            if v76 ~= p_u_74.WasFreezeImmune then
                p_u_74.WasFreezeImmune = v76
                p_u_74.FreezeFrame.EffectImage.ForbiddenImage.Visible = v76
                p_u_74.FreezeFrame.UIAspectRatioConstraint.AspectRatio = v76 and 1 or script.FreezeFrame.UIAspectRatioConstraint.AspectRatio
                p_u_74.FreezeFrame.Amount.Text = ""
            end
            if not v76 then
                p_u_74.FreezeFrame.Amount.Text = math.round(v75) .. "%"
            end
        end
    end
    p_u_74.Char:GetAttributeChangedSignal("FreezeAmount"):Connect(v77)
    v77()
end
function v_u_26.LinkToTycoonColorChanges(p_u_78, p79)
    local v_u_80 = p79:WaitForChild("Tycoon")
    local function v81()
        -- upvalues: (copy) v_u_80, (copy) p_u_78
        ChangeNameColor(GetTowerColor(v_u_80.Value), p_u_78.NameLabel)
    end
    local v82 = p79.Stats.Custom
    local v83 = v82.Color1Part
    local v84 = v82.CustomColorsEnabled
    p_u_78.TycoonChanged_C = v_u_80:GetPropertyChangedSignal("Value"):Connect(v81)
    p_u_78.CustomisationEnabled_C = v84.Changed:Connect(v81)
    p_u_78.Color1Part_C = v83.Changed:Connect(v81)
    ChangeNameColor(GetTowerColor(v_u_80.Value), p_u_78.NameLabel)
end
function v_u_26.ChangeGuiSize(p85)
    -- upvalues: (copy) v_u_11, (copy) v_u_10, (copy) v_u_12
    if p85.FromPlayer then
        p85.CharScale = p85.SizeValue.Value
    else
        p85.CharScale = p85.Char and (p85.Char:GetScale() or 1) or 1
    end
    if p85.OverHeadGui then
        p85.OverHeadGui.MaxDistance = v_u_11 * p85.CharScale ^ 0.65
        p85.OverHeadGui.StudsOffset = v_u_10 * p85.CharScale
        p85.OverHeadGui.Size = UDim2.fromScale(v_u_12.X.Scale * p85.CharScale, v_u_12.Y.Scale * p85.CharScale)
    end
end
function ChangeNameColor(p86, p87)
    -- upvalues: (copy) v_u_8
    if p87 then
        p87.UIStroke.Color = v_u_8(p86)
        p87.TextColor3 = p86
    end
end
v24.BuildOverHeadGui = v_u_26.AddOverHeadGui
return v24

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.TowerBuildingAnimation.AnimateBuilding
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = {}
T_a = 0.22
T_b = 0.1
OvershootBase = 0.1
v_a = 1.5707963267948966 / T_a
v_b = 3.141592653589793 / T_b
v_u_2.AnimationTimeBase = T_a
v_u_2.AnimationTime_WithOvershoot = T_a + T_b
local v_u_3 = TweenInfo.new(T_a + T_b, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
function v_u_2.AnimateModel(p4, p5)
    local v6, v7 = p4:GetBoundingBox()
    local v8 = v7.Y / 2
    local v_u_9 = (v6 - Vector3.new(0, v8, 0)).Position
    local v_u_10 = {}
    local v_u_11 = 0.001
    local v12 = OvershootBase
    local v13 = v_a
    local v14 = T_a
    if not p5 then
        v13 = 1.5707963267948966 / (T_a + T_b)
        v12 = 0
    end
    local function v16()
        -- upvalues: (copy) v_u_10, (copy) v_u_9, (ref) v_u_11
        for _, v15 in pairs(v_u_10) do
            v15.Part.Position = v_u_9 + v15.OriginVec * v_u_11
            v15.Part.Size = v15.OriginSize * v_u_11
        end
    end
    for _, v17 in pairs(p4:GetDescendants()) do
        if v17:IsA("BasePart") then
            local v18 = {
                ["Part"] = v17,
                ["OriginVec"] = v17.Position - v_u_9,
                ["OriginSize"] = v17.Size
            }
            table.insert(v_u_10, v18)
        end
    end
    local v22 = p4.DescendantAdded:Connect(function(p19)
        -- upvalues: (copy) v_u_10, (copy) v_u_9
        if p19:IsA("BasePart") then
            local v20 = v_u_10
            local v21 = {
                ["Part"] = p19,
                ["OriginVec"] = p19.Position - v_u_9,
                ["OriginSize"] = p19.Size
            }
            table.insert(v20, v21)
        end
    end)
    v16()
    local v23 = 0
    while v23 < v14 do
        v23 = v23 + task.wait()
        local v24 = 1 + v12
        local v25 = v13 * v23
        v29 = v24 * math.sin(v25)
        v16()
    end
    if p5 then
        local v26 = v23 - T_a
        while v26 < T_b do
            v26 = v26 + task.wait()
            local v27 = v12 / 2
            local v28 = v26 * v_b
            v29 = 1 + v27 * (math.cos(v28) + 1)
            v16()
        end
    end
    v22:Disconnect()
    local v29 = 1
    v16()
end
function v_u_2.AnimateAllPartsInModel(p30)
    -- upvalues: (copy) v_u_1, (copy) v_u_3
    for _, v31 in pairs(p30:GetDescendants()) do
        if v31:IsA("BasePart") then
            local v32 = {
                ["Size"] = v31.Size,
                ["Position"] = v31.Position
            }
            local v33 = v31.Position
            local v34 = v31.Size.Y / 2
            v31.Position = v33 - Vector3.new(0, v34, 0)
            v31.Size = v31.Size / 100
            v_u_1:Create(v31, v_u_3, v32):Play()
        end
    end
end
function v_u_2.DeepAnimateModel(p35, p_u_36)
    -- upvalues: (copy) v_u_2
    for _, v_u_37 in pairs(p35:GetChildren()) do
        if v_u_37:IsA("Model") then
            if v_u_37:FindFirstChildOfClass("Model") then
                v_u_2.DeepAnimateModel(v_u_37)
            else
                task.defer(function()
                    -- upvalues: (ref) v_u_2, (copy) v_u_37, (copy) p_u_36
                    v_u_2.AnimateModel(v_u_37, p_u_36)
                end)
            end
        end
    end
end
return v_u_2

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.LocalButtonScript.AnimateButtonModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game:GetService("ReplicatedStorage")
local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("Debris")
local v_u_3 = game.Players.LocalPlayer
local v_u_4 = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local v_u_5 = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
local v_u_6 = TweenInfo.new(0.4, Enum.EasingStyle.Linear)
local v_u_7 = v_u_3:WaitForChild("Settings"):WaitForChild("AnimatedButtons")
local v_u_8 = v_u_7.Value
v_u_7:GetPropertyChangedSignal("Value"):Connect(function()
    -- upvalues: (ref) v_u_8, (copy) v_u_7
    v_u_8 = v_u_7.Value
end)
local v9 = {}
function IsDistOk(p10)
    -- upvalues: (copy) v_u_3
    local v11 = v_u_3.Character and v_u_3.Character:FindFirstChild("HumanoidRootPart")
    if v11 then
        v11 = v_u_3.Character.HumanoidRootPart.Position
    end
    return (p10 - (v11 or workspace.Camera.CFrame.Position)).Magnitude < 180
end
function v9.OnButtonBought(p12)
    -- upvalues: (ref) v_u_8, (copy) v_u_1, (copy) v_u_5, (copy) v_u_6, (copy) v_u_2
    if v_u_8 and IsDistOk(p12.Position) then
        local v13 = p12.BillboardGui
        local v14 = v13.Label
        p12.CanCollide = false
        p12.CanQuery = false
        local v15 = v_u_1:Create(p12, v_u_5, {
            ["Size"] = Vector3.new(0, 0, 0),
            ["Transparency"] = 1,
            ["Position"] = p12.Position + Vector3.new(0, 0.1, 0)
        })
        v_u_1:Create(v13, v_u_5, {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, 0, 0),
            ["Size"] = UDim2.fromScale(v13.Size.X.Scale)
        }):Play()
        v_u_1:Create(v14, v_u_6, {
            ["TextTransparency"] = 1,
            ["TextStrokeTransparency"] = 1
        }):Play()
        local v16 = v13:FindFirstChild("GamePassIcon")
        if v16 then
            v_u_1:Create(v16, v_u_6, {
                ["ImageTransparency"] = 1
            }):Play()
        end
        local v17 = v13:FindFirstChild("BonusFrame")
        if v17 and v17.Visible then
            v_u_1:Create(v17.TicketImg, v_u_5, {
                ["ImageTransparency"] = 1
            }):Play()
            v_u_1:Create(v17.TicketBonus, v_u_5, {
                ["TextTransparency"] = 1,
                ["TextStrokeTransparency"] = 1
            }):Play()
        end
        v15:Play()
        v_u_2:AddItem(p12, v_u_5.Time)
    else
        p12:Destroy()
    end
end
function v9.AddButton(p18, p19, p20, p21)
    -- upvalues: (ref) v_u_8, (copy) v_u_1, (copy) v_u_4, (copy) v_u_6
    local v22 = p18.Position
    if v_u_8 and IsDistOk(v22) then
        p18.Size = Vector3.new(0, 0, 0)
        p18.Transparency = 1
        p18.Position = p18.Position + Vector3.new(0, 0.1, 0)
        p19.StudsOffsetWorldSpace = Vector3.new(0, 0, 0)
        p20.TextTransparency = 1
        p20.TextStrokeTransparency = 1
        v_u_1:Create(p18, v_u_4, {
            ["Size"] = Vector3.new(0.2, 6, 6),
            ["Transparency"] = 0,
            ["Position"] = v22
        }):Play()
        v_u_1:Create(p20, v_u_6, {
            ["TextTransparency"] = 0,
            ["TextStrokeTransparency"] = 0
        }):Play()
        v_u_1:Create(p19, v_u_4, {
            ["StudsOffsetWorldSpace"] = Vector3.new(1.2, 0, 0)
        }):Play()
        local v23 = p19:FindFirstChild("BonusFrame")
        if v23 and v23.Visible then
            v23.TicketImg.ImageTransparency = 1
            v23.TicketBonus.TextTransparency = 1
            v23.TicketBonus.TextStrokeTransparency = 1
            v_u_1:Create(v23.TicketImg, v_u_4, {
                ["ImageTransparency"] = 0
            }):Play()
            v_u_1:Create(v23.TicketBonus, v_u_4, {
                ["TextTransparency"] = 0,
                ["TextStrokeTransparency"] = 0
            }):Play()
        end
        if not p21 then
            return
        end
        v_u_1:Create(p21, v_u_6, {
            ["ImageTransparency"] = 0
        }):Play()
    end
end
return v9

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.LocalButtonScript.ButtonHandler
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Players").LocalPlayer
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(v2.AllModules.GetTowerForPlayer)(v_u_1, true)
local v_u_4 = require(v2.AllModules.FloorLevelComputation).GetFloorLevelFromYPosition
local v_u_5 = require(script.Parent.AnimateButtonModule)
local v_u_6 = require(v2.AllModules.ConvertVal)
local v_u_7 = v_u_1.leaderstats:WaitForChild("Level")
local v_u_8 = v_u_7.Value
function OnLevelChanged()
    -- upvalues: (ref) v_u_8, (copy) v_u_7
    v_u_8 = v_u_7.Value
end
v_u_7:GetPropertyChangedSignal("Value"):Connect(OnLevelChanged)
local v_u_9 = v2.RemoteFunction.BuildF
local v_u_10 = v2.RemoteEvent.PlaySoundEvent.PlaySoundEventLocal
local v_u_11 = script.Parent.BonusFrame
local v_u_12 = script.Parent.Default
local v_u_13 = Color3.new(0, 1, 0)
local v_u_14 = Color3.new(1, 0, 0)
local v_u_15 = Instance.new("Folder", workspace)
v_u_15.Name = "AllButtons"
local v_u_16 = NumberRange.new(0)
local v_u_17 = 0
local v18 = (v3:GetPivot() * CFrame.new(0, 0, 22.5)).Position
Vector2.new(v18.X, v18.Y)
local v_u_19 = {}
local v_u_20 = {}
local v_u_21 = {}
local v_u_22 = {
    ["IsBonusDisabled"] = true,
    ["BonusString"] = "",
    ["CurrentCash"] = 0,
    ["Bonus"] = 1
}
local v_u_23 = {}
v_u_23.__index = v_u_23
function v_u_22.NewButton(p24)
    -- upvalues: (copy) v_u_19, (copy) v_u_23, (copy) v_u_6, (copy) v_u_4, (ref) v_u_16
    if v_u_19[p24.ButtonName] then
        warn("Button already exists")
    end
    local v25 = v_u_23
    setmetatable(p24, v25)
    p24.BasePriceString = "$" .. v_u_6.SimpleConversion(p24.Price)
    p24.CF = p24.CF * CFrame.Angles(0, 0, 1.5707963267948966)
    p24.Shown = false
    local v26 = v_u_4(p24.CF.Position.Y)
    p24.FloorYPos = v26
    if v26 <= 8 then
        p24:Show(true)
    else
        p24.Optimized = true
        if v_u_16.Min <= v26 and v26 <= v_u_16.Max then
            p24:Show(true)
        end
        AddButtonInFloors(p24)
    end
    v_u_19[p24.ButtonName] = p24
    return p24
end
function v_u_23.Show(p_u_27, p28)
    -- upvalues: (copy) v_u_20, (copy) v_u_12, (copy) v_u_15, (copy) v_u_22, (copy) v_u_10, (copy) v_u_1, (copy) v_u_5
    if not p_u_27.Shown then
        p_u_27.Shown = true
        v_u_20[p_u_27.ButtonName] = p_u_27
        local v29 = v_u_12:Clone()
        v29:PivotTo(p_u_27.CF)
        v29.Name = p_u_27.ButtonName
        p_u_27.ButtonPart = v29
        p_u_27.BGui = v29.BillboardGui
        p_u_27.Label = p_u_27.BGui.Label
        v29.Parent = v_u_15
        p_u_27:ChangePrice()
        p_u_27.Touch_C = v29.Touched:Connect(function(p30)
            -- upvalues: (ref) v_u_22, (copy) p_u_27, (ref) v_u_10, (ref) v_u_1
            if v_u_22.CurrentCash <= p_u_27.Price * v_u_22.Bonus then
                v_u_10:Fire("Tycoon Error (Sound)")
                return
            elseif v_u_1.Character and (v_u_1.Character:FindFirstChild("Humanoid") and v_u_1.Character.Humanoid.Health > 0) then
                if p30:IsDescendantOf(v_u_1.Character) then
                    p_u_27:TryToBuy()
                end
            else
                return
            end
        end)
        if p28 then
            v_u_5.AddButton(v29, p_u_27.BGui, p_u_27.Label)
        end
    end
end
function v_u_23.Hide(p31, p32)
    -- upvalues: (copy) v_u_20, (copy) v_u_5
    if p31.Shown then
        p31.Shown = false
        v_u_20[p31.ButtonName] = nil
        p31.Touch_C:Disconnect()
        p31.Touch_C = nil
        if p32 then
            v_u_5.OnButtonBought(p31.ButtonPart)
        else
            p31.ButtonPart:Destroy()
        end
        p31.ButtonPart = nil
        p31.BGui = nil
        p31.Label = nil
        p31.BonusFrame = nil
    end
end
function v_u_23.TryToBuy(p33)
    -- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_13, (copy) v_u_22
    if p33.ButtonPart then
        p33.ButtonPart.CanTouch = false
    end
    local v34 = v_u_9:InvokeServer(p33.ButtonName)
    if not v34 then
        if p33.ButtonPart then
            p33.ButtonPart.CanTouch = true
        end
        return v34
    end
    v_u_10:Fire("BuySound")
    if p33.ButtonPart then
        p33.ButtonPart.Color = v_u_13
    end
    v_u_22.RemoveButton(p33.ButtonName, true)
    return v34
end
function v_u_23.ChangePrice(p35)
    -- upvalues: (copy) v_u_22, (copy) v_u_6, (copy) v_u_11
    if p35.Shown then
        local v36 = p35.Label
        local v37 = p35.ModelName
        local v38 = "\n"
        local v39 = v_u_22.IsBonusDisabled and p35.BasePriceString
        if not v39 then
            local v40 = p35.BasePriceString
            local v41 = v_u_6.SimpleConversion
            local v42 = p35.Price * v_u_22.Bonus
            v39 = "<i><s>" .. v40 .. "</s></i> \226\134\146 $" .. v41((math.floor(v42)))
        end
        v36.Text = v37 .. v38 .. v39
        if v_u_22.IsBonusDisabled then
            if p35.BonusFrame then
                p35.BonusFrame.Visible = false
            end
        else
            if not p35.BonusFrame then
                p35.BonusFrame = v_u_11:Clone()
                p35.BonusFrame.Parent = p35.BGui
                p35.TicketBonus = p35.BonusFrame.TicketBonus
            end
            p35.TicketBonus.Text = v_u_22.BonusString
            p35.BonusFrame.Visible = true
        end
        p35:ChangeColor()
    end
end
function v_u_23.ChangeColor(p43)
    -- upvalues: (copy) v_u_22, (copy) v_u_13, (copy) v_u_14
    if p43.Shown then
        p43.ButtonPart.Color = v_u_22.CurrentCash >= p43.Price * v_u_22.Bonus and v_u_13 or v_u_14
    end
end
function AddButtonInFloors(p44)
    -- upvalues: (copy) v_u_21
    local v45 = v_u_21[p44.FloorYPos]
    if v45 then
        table.insert(v45, p44)
    else
        v_u_21[p44.FloorYPos] = { p44 }
    end
end
function RemoveButtonInFloors(p46)
    -- upvalues: (copy) v_u_21
    local v47 = v_u_21[p46.FloorYPos]
    if v47 then
        local v48 = table.find(v47, p46)
        if v48 then
            table.remove(v47, v48)
            if #v47 <= 0 then
                v_u_21[p46.FloorYPos] = nil
                return
            end
        else
            warn("Button list for given floor", p46.FloorYPos, "but asked to remove bttn", p46.ButtonName)
        end
    else
        warn("No button list for given floor", p46.FloorYPos, "but asked to remove bttn", p46.ButtonName)
    end
end
function v_u_22.RemoveButton(p49, p50)
    -- upvalues: (copy) v_u_19
    local v51 = v_u_19[p49]
    if v51 then
        if v51.Optimized then
            RemoveButtonInFloors(v51)
        end
        v51:Hide(p50)
        table.clear(v51)
        v_u_19[p49] = nil
    else
        warn("Asked to remove button", p49, "but not found")
    end
end
function GetCharacterVelocity()
    -- upvalues: (copy) v_u_1
    local v52 = v_u_1.Character
    if not v52 then
        return 0
    end
    local v53 = v52:FindFirstChild("Head")
    if not v53 then
        return 0
    end
    local v54 = v53.AssemblyLinearVelocity.Y
    return math.abs(v54)
end
function v_u_22.SetCameraYFloor(_, p55)
    -- upvalues: (ref) v_u_17, (ref) v_u_8, (ref) v_u_16, (copy) v_u_21
    if p55 == v_u_17 then
        return
    else
        local v56
        if GetCharacterVelocity() > 200 then
            v56 = NumberRange.new(v_u_8)
        elseif v_u_8 <= p55 - 7 then
            v56 = NumberRange.new(v_u_8)
        else
            v56 = NumberRange.new(p55 - 7, p55 + 1)
        end
        if v56 ~= v_u_16 then
            v_u_17 = p55
            local v57 = v56.Min
            for v58 = math.max(v57, 9), v56.Max do
                if v_u_16.Min > v58 or v58 > v_u_16.Max then
                    local v59 = v_u_21[v58]
                    if v59 then
                        for _, v60 in pairs(v59) do
                            v60:Show(false)
                        end
                    end
                end
            end
            local v61 = v_u_16.Min
            for v62 = math.max(v61, 9), v_u_16.Max do
                if v56.Min > v62 or v62 > v56.Max then
                    local v63 = v_u_21[v62]
                    if v63 then
                        for _, v64 in pairs(v63) do
                            v64:Hide()
                        end
                    end
                end
            end
            v_u_16 = v56
        end
    end
end
v_u_22.AllBttnObj = v_u_19
v_u_22.AllShownButton = v_u_20
v_u_22.ButtonsByFloors = v_u_21
return v_u_22

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnElevatorAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("MarketplaceService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("Players")
local v_u_6 = v_u_5.LocalPlayer
local v_u_7 = require(v2.AllModules.CharacterSize.GetCharacterScale)
local v8 = v2.RemoteEvent.ElevatorEvents
local v9 = v8.ElevatorEvent
local v_u_10 = v8.FastElevatorEvent
local v_u_11 = v2.RemoteFunction.SitInElevatorF
local v_u_12 = TweenInfo.new(3.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false)
local v_u_13 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false)
function MoveDoors(p_u_14, p_u_15, p16, p17)
    -- upvalues: (copy) v_u_6, (copy) v_u_13, (copy) v_u_12, (copy) v_u_3
    if p16 or not p_u_14:GetAttribute("Tweening") then
        if not p_u_15 then
            if p_u_14:GetAttribute("AlreadyClosed") then
                return
            end
            p_u_14:SetAttribute("AlreadyClosed", true)
        end
        local v18 = v_u_6.Character
        if v18 then
            v18 = v_u_6.Character:GetPivot().Position
        end
        if p16 then
            if v18 then
                v18 = (v18 - p_u_14.LMain.Position).Magnitude < 125
            end
        else
            v18 = p16
        end
        local v_u_19 = p_u_15 and 1 or -1
        if v18 then
            p_u_14:SetAttribute("Tweening", true)
            local v_u_20
            if p17 then
                v_u_20 = v_u_13
            else
                v_u_20 = v_u_12
            end
            local v_u_21 = DateTime.now().UnixTimestampMillis
            local v_u_22 = v_u_3:Create(p_u_14.LMain, v_u_20, {
                ["CFrame"] = p_u_14.LMain.CFrame * CFrame.new(-3.8 * v_u_19, 0, 0)
            })
            local v_u_23 = v_u_3:Create(p_u_14.LCloseDoor, v_u_20, {
                ["CFrame"] = p_u_14.LCloseDoor.CFrame * CFrame.new(-3.8 * v_u_19, 0, 0)
            })
            local v_u_24 = v_u_3:Create(p_u_14.RCloseDoor, v_u_20, {
                ["CFrame"] = p_u_14.RCloseDoor.CFrame * CFrame.new(3.8 * v_u_19, 0, 0)
            })
            local v_u_25 = v_u_3:Create(p_u_14.RMain, v_u_20, {
                ["CFrame"] = p_u_14.RMain.CFrame * CFrame.new(3.8 * v_u_19, 0, 0)
            })
            v_u_22:Play()
            v_u_23:Play()
            v_u_24:Play()
            v_u_25:Play()
            local v33 = p_u_14.LMain:GetPropertyChangedSignal("Size"):Once(function()
                -- upvalues: (copy) v_u_22, (copy) v_u_23, (copy) v_u_24, (copy) v_u_25, (ref) v_u_20, (copy) v_u_21, (copy) p_u_15, (copy) p_u_14, (ref) v_u_3, (copy) v_u_19
                v_u_22:Cancel()
                v_u_23:Cancel()
                v_u_24:Cancel()
                v_u_25:Cancel()
                local v26 = TweenInfo.new(v_u_20.Time - (DateTime.now().UnixTimestampMillis - v_u_21) / 1000, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false)
                local v27 = v26.Time / v_u_20.Time * 3.8
                local v28
                if p_u_15 then
                    v28 = 3.8 - v27 or v27
                else
                    v28 = v27
                end
                local v29 = p_u_14.LMain
                v29.CFrame = v29.CFrame * CFrame.new(-v28, 0, 0)
                local v30 = p_u_14.LCloseDoor
                v30.CFrame = v30.CFrame * CFrame.new(-v28, 0, 0)
                local v31 = p_u_14.RCloseDoor
                v31.CFrame = v31.CFrame * CFrame.new(v28, 0, 0)
                local v32 = p_u_14.RMain
                v32.CFrame = v32.CFrame * CFrame.new(v28, 0, 0)
                v_u_3:Create(p_u_14.LMain, v26, {
                    ["CFrame"] = p_u_14.LMain.CFrame * CFrame.new(-v27 * v_u_19, 0, 0)
                }):Play()
                v_u_3:Create(p_u_14.LCloseDoor, v26, {
                    ["CFrame"] = p_u_14.LCloseDoor.CFrame * CFrame.new(-v27 * v_u_19, 0, 0)
                }):Play()
                v_u_3:Create(p_u_14.RCloseDoor, v26, {
                    ["CFrame"] = p_u_14.RCloseDoor.CFrame * CFrame.new(v27 * v_u_19, 0, 0)
                }):Play()
                v_u_3:Create(p_u_14.RMain, v26, {
                    ["CFrame"] = p_u_14.RMain.CFrame * CFrame.new(v27 * v_u_19, 0, 0)
                }):Play()
            end)
            v_u_22.Completed:Wait()
            v33:Disconnect()
            p_u_14:SetAttribute("Tweening", false)
        else
            local v34 = p_u_14.LMain
            v34.CFrame = v34.CFrame * CFrame.new(-3.8 * v_u_19, 0, 0)
            local v35 = p_u_14.LCloseDoor
            v35.CFrame = v35.CFrame * CFrame.new(-3.8 * v_u_19, 0, 0)
            local v36 = p_u_14.RCloseDoor
            v36.CFrame = v36.CFrame * CFrame.new(3.8 * v_u_19, 0, 0)
            local v37 = p_u_14.RMain
            v37.CFrame = v37.CFrame * CFrame.new(3.8 * v_u_19, 0, 0)
        end
    else
        return
    end
end
v9.OnClientEvent:Connect(MoveDoors)
local v38 = {}
local v_u_39 = nil
local v_u_40 = 0
local v_u_41 = nil
for _, v42 in {
    "RedZone",
    "BlueZone",
    "BlackZone",
    "OrangeZone",
    "YellowZone",
    "GreenZone"
} do
    local v43 = workspace.Zones:WaitForChild(v42):WaitForChild("AllModels")
    if v43:FindFirstChild("ElvD") and (v43:FindFirstChild("Elevator") and (v43.Elevator:GetAttribute("ElevatorState") + 1) % 4 <= 1) then
        MoveDoors(v43.ElvD, true, false)
    end
end
local v_u_44 = false
function SitInElevator(p45, p46, p47, p48)
    -- upvalues: (ref) v_u_44, (copy) v_u_6, (copy) v_u_5, (copy) v_u_11, (ref) v_u_39, (ref) v_u_40
    if v_u_44 then
        return
    else
        local v49 = v_u_6.Character
        if v49 then
            local v50 = v49:FindFirstChild("Humanoid")
            if v50 and v50.Health > 0 then
                local v51 = p48 and v49:FindFirstChild("Head")
                if v51 then
                    local v52 = v51.Position
                    local v53 = p46:IsA("Attachment") and p46.WorldPosition or p46.Position
                    local v54 = RaycastParams.new()
                    v54.FilterDescendantsInstances = { v49, p45 }
                    local v55 = workspace:Raycast(v52, v53 - v52, v54)
                    if v55 and (v55.Instance and not v_u_5:GetPlayerFromCharacter((v55.Instance:FindFirstAncestorOfClass("Model")))) then
                        return
                    end
                end
                v_u_44 = true
                v_u_11:InvokeServer(p45, p47)
                v_u_44 = false
                if v_u_39 then
                    v_u_39:Disconnect()
                end
                if v50.Sit then
                    v_u_39 = v50.Seated:Connect(function(p56)
                        -- upvalues: (ref) v_u_40, (ref) v_u_39
                        if not p56 then
                            v_u_40 = workspace.DistributedGameTime
                            v_u_39:Disconnect()
                        end
                    end)
                end
            end
        else
            return
        end
    end
end
function CreateElevatorPP(p_u_57, p_u_58)
    local v59 = Instance.new("ProximityPrompt", p_u_58)
    v59.ActionText = "Sit"
    v59.ObjectText = "Elevator"
    v59.MaxActivationDistance = 10
    v59.Triggered:Connect(function()
        -- upvalues: (copy) p_u_57, (copy) p_u_58
        SitInElevator(p_u_57, p_u_58, nil, true)
    end)
    return v59
end
function AddElevator(p_u_60)
    -- upvalues: (copy) v_u_6, (ref) v_u_40, (copy) v_u_7, (copy) v_u_4, (ref) v_u_41, (copy) v_u_10, (copy) v_u_1
    local v61 = p_u_60.Parent
    local v62 = CreateElevatorPP(p_u_60, v61:WaitForChild("Floor (1)"):WaitForChild("ForElevatorPart"):WaitForChild("ForElevatorAtt"))
    v62.UIOffset = Vector2.new(15, 50)
    v62.MaxActivationDistance = 25
    local v63 = p_u_60:WaitForChild("Bench")
    for v_u_64 = 1, 4 do
        local v_u_65 = v63:WaitForChild("Seat" .. v_u_64)
        v_u_65:WaitForChild("ProximityPrompt").Triggered:Connect(function()
            -- upvalues: (copy) p_u_60, (copy) v_u_65, (copy) v_u_64
            SitInElevator(p_u_60, v_u_65, v_u_64, true)
        end)
        v_u_65.Touched:Connect(function(p66)
            -- upvalues: (ref) v_u_6, (ref) v_u_40, (ref) v_u_7, (copy) p_u_60, (copy) v_u_65, (copy) v_u_64
            local v67 = v_u_6.Character
            local v68
            if v67 then
                v68 = v67:FindFirstChild("Humanoid")
            else
                v68 = v67
            end
            if v68 and not v68.Sit then
                if p66:IsDescendantOf(v67) then
                    if workspace.DistributedGameTime - v_u_40 < 3 then
                        return
                    elseif v_u_7(v67) <= 2.5 then
                        v_u_40 = workspace.DistributedGameTime
                        SitInElevator(p_u_60, v_u_65, v_u_64, true)
                    end
                else
                    return
                end
            else
                return
            end
        end)
    end
    local v_u_69 = p_u_60:WaitForChild("MainScreenPart")
    local v70 = v_u_69:WaitForChild("SurfaceGui")
    v70.Name = p_u_60.Parent.Parent.Name .. "ElevatorGUI"
    v70:AddTag("SurfaceGuiForPGui")
    local v71 = v70:WaitForChild("SelectionLabel")
    if v_u_4:IsTenFootInterface() then
        v71.AutoButtonColor = false
        v71.Selectable = false
    else
        v71.Activated:Connect(function()
            -- upvalues: (ref) v_u_41, (ref) v_u_6, (copy) v_u_69
            if not v_u_41 then
                v_u_41 = require(v_u_6.PlayerGui:WaitForChild("MainGui").MainGuiScript.ToggleFrameModule).ToggleFrame
            end
            local v72 = v_u_6:DistanceFromCharacter(v_u_69.Position)
            if v72 > 0 and v72 < 20 then
                v_u_41("FloorSelection", nil, nil, v_u_69)
            end
        end)
    end
    local v_u_73 = v70:WaitForChild("FastElevatorBttn")
    if p_u_60.Parent and v61.Parent.Owner.Value == v_u_6 then
        CreateElevatorPP(p_u_60, p_u_60:WaitForChild("Light"):WaitForChild("ContourPart"):WaitForChild("AttRoofPromt"))
        local v_u_74 = v_u_6.Stats.GamePass.FastElevator
        local v_u_75 = 0
        local v_u_76 = nil
        local function v77()
            -- upvalues: (ref) v_u_76, (copy) v_u_74, (copy) v_u_73, (ref) v_u_10, (copy) p_u_60, (ref) v_u_1, (ref) v_u_6, (ref) v_u_75
            if v_u_76 then
                v_u_76:Disconnect()
            end
            if v_u_74.Value then
                v_u_76 = v_u_73.Activated:Connect(function()
                    -- upvalues: (ref) v_u_10, (ref) p_u_60
                    v_u_10:FireServer(p_u_60)
                end)
                v_u_73.Visible = true
            else
                v_u_76 = v_u_73.Activated:Connect(function()
                    -- upvalues: (ref) v_u_1, (ref) v_u_6
                    v_u_1:PromptGamePassPurchase(v_u_6, 782894480)
                end)
                v_u_73.Visible = v_u_75 >= 4
            end
        end
        v_u_74.Changed:Connect(v77)
        v77()
        while v_u_75 < 4 do
            p_u_60:GetAttributeChangedSignal("ElevatorLevel"):Wait()
            v_u_75 = v_u_75 + 1
        end
        v77()
    else
        v_u_73.AutoButtonColor = false
    end
end
v38.OnInstanceAdded = AddElevator
return v38

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnSlidingDoorsAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = v1:WaitForChild("RemoteEvent"):WaitForChild("SlidingDoorEvent")
local v_u_4 = v1.RemoteEvent:WaitForChild("SettingsEvent")
local v_u_5 = v_u_2.LocalPlayer
local v_u_6 = require(game:GetService("ReplicatedStorage"):WaitForChild("AllModules"):WaitForChild("CanEnterTower"))
local v_u_7 = require(script:WaitForChild("SlideDoor"))
function OpenDoorForAll(p8)
    -- upvalues: (copy) v_u_3
    v_u_3:FireServer(p8)
    p8:SetAttribute("Opened", true)
end
function EnableButtons(p9)
    -- upvalues: (copy) v_u_4
    local v_u_10 = game:GetService("SoundService"):WaitForChild("Sound"):WaitForChild("ClickSound")
    local v11 = p9:WaitForChild("SurfaceGui")
    local v12 = v11:WaitForChild("BackgroundF")
    v11:AddTag("SurfaceGuiForPGui")
    for v_u_13, v14 in pairs({ "None", "Friends", "All" }) do
        local v15 = v12:WaitForChild(v14)
        local v16 = Instance.new("UIScale", v15)
        v16:SetAttribute("EndSize", 1.1)
        v16:AddTag("SizableUI")
        v15.AutoButtonColor = true
        v15.Activated:Connect(function()
            -- upvalues: (ref) v_u_4, (copy) v_u_13, (copy) v_u_10
            v_u_4:FireServer("Permission", v_u_13 - 1)
            v_u_10:Play()
        end)
    end
end
function SetDoor(p_u_17)
    -- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_6
    local v_u_18 = p_u_17.DetectPart
    local v_u_19 = p_u_17.Parent.Parent.Owner.Value
    v_u_18.CanTouch = true
    v_u_18.Touched:Connect(function(p20)
        -- upvalues: (ref) v_u_5, (ref) v_u_2, (copy) v_u_18, (ref) v_u_6, (copy) v_u_19, (copy) p_u_17
        if v_u_5 == v_u_2:GetPlayerFromCharacter(p20:FindFirstAncestorOfClass("Model")) then
            v_u_18.CanTouch = false
            if v_u_6(v_u_19, v_u_5) and not p_u_17:GetAttribute("Opened") then
                OpenDoorForAll(p_u_17)
            end
            task.wait(1)
            v_u_18.CanTouch = true
        end
    end)
    if v_u_19 == v_u_5 then
        EnableButtons(p_u_17)
    end
end
function OnSlidingDoorAdded(p_u_21)
    -- upvalues: (copy) v_u_7
    task.wait()
    while p_u_21:GetAttribute("Animating") do
        p_u_21:GetAttributeChangedSignal("Animating"):Wait()
    end
    p_u_21:WaitForChild("ForWeaponPart").CanQuery = false
    p_u_21:WaitForChild("DetectPart")
    v_u_7.ToggleCollistion(p_u_21, true)
    local v22 = {
        ["Position"] = 0,
        ["Opened"] = false,
        ["MoveNum"] = 0,
        ["MidPosition"] = (p_u_21:WaitForChild("RDoor"):GetPivot().Position + p_u_21:WaitForChild("LDoor"):GetPivot().Position) / 2
    }
    v_u_7.AllSlidingDoors[p_u_21] = v22
    p_u_21:GetAttributeChangedSignal("Opened"):Connect(function()
        -- upvalues: (copy) p_u_21, (ref) v_u_7
        local v23 = p_u_21:GetAttribute("Opened")
        if v_u_7.AllSlidingDoors[p_u_21].Opened ~= v23 then
            v_u_7.AllSlidingDoors[p_u_21].Opened = v23
            v_u_7.MoveDoors(p_u_21, v23)
        end
    end)
    SetDoor(p_u_21)
end
function OnSlidingDoorRemoved(p24)
    -- upvalues: (copy) v_u_7
    local v25 = v_u_7.AllSlidingDoors[p24]
    if v25 then
        v_u_7.AllSlidingDoors[p24] = nil
        table.clear(v25)
    end
end
return {
    ["OnInstanceAdded"] = OnSlidingDoorAdded,
    ["OnInstanceRemoved"] = OnSlidingDoorRemoved
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnSlidingDoorsAdded.SlideDoor
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.Players.LocalPlayer
local v_u_2 = v_u_1:WaitForChild("Settings"):WaitForChild("TycoonSounds")
local v_u_7 = {
    ["AllSlidingDoors"] = {},
    ["ToggleCollistion"] = function(p3, p4)
        local v5 = p3:WaitForChild("RDoor"):WaitForChild("Color4Part")
        local v6 = p3:WaitForChild("LDoor"):WaitForChild("Color4Part")
        v5.CanCollide = p4
        v5.CanTouch = p4
        v5.CanQuery = p4
        v6.CanCollide = p4
        v6.CanTouch = p4
        v6.CanQuery = p4
    end
}
function PlayOpenDoor(p8, p9)
    -- upvalues: (copy) v_u_2
    if v_u_2.Value then
        if p8.IsPlaying then
            p8:Stop()
        end
        p8.TimePosition = 2.8 - p9
        p8:Play()
    end
end
function IsDistOkForTween(p10)
    -- upvalues: (copy) v_u_1
    return not v_u_1.Character and true or (p10.Position - v_u_1.Character:GetPivot().Position).Magnitude < 220
end
function SetDoorPosition(p11, p12, p13, p14)
    p11:PivotTo((p11:GetPivot().Rotation + p13) * CFrame.new(p14, 0, 0))
    p12:PivotTo((p12:GetPivot().Rotation + p13) * CFrame.new(p14, 0, 0))
end
function v_u_7.MoveDoors(p15, p16)
    -- upvalues: (copy) v_u_7
    local v17 = v_u_7.AllSlidingDoors[p15]
    local v18 = v17.MoveNum + 1
    v17.MoveNum = v18
    v_u_7.ToggleCollistion(p15, not p16)
    local v19 = p16 and 7.45 or 0
    local v20 = p15.RDoor
    local v21 = p15.LDoor
    local v22 = v17.MidPosition
    local v23 = p15.DetectPart
    if IsDistOkForTween(v23) then
        local v24 = v19 - v17.Position
        local v25 = math.abs(v24) / 2.660714285714286
        PlayOpenDoor(v23.SlideSound, v25)
        local v26 = 0
        local v27 = p16 and 1 or -1
        while v26 < v25 do
            local v28 = task.wait()
            if not p15.Parent or v17.MoveNum ~= v18 then
                return
            end
            v17.Position = v17.Position + v27 * 2.660714285714286 * v28
            SetDoorPosition(v20, v21, v22, v17.Position)
            v26 = v26 + v28
        end
    end
    SetDoorPosition(v20, v21, v22, v19)
    v17.Position = v19
end
return v_u_7

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnLaserDoorAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = v1.RemoteEvent.PlacableEvent
local v_u_3 = require(v1.AllModules.CanEnterTower)
local v_u_4 = game:GetService("Players")
local v_u_5 = v_u_4.LocalPlayer
local v6 = {}
function ColorLaser(p7, p8, p9, p10)
    -- upvalues: (copy) v_u_3, (copy) v_u_5
    local v11 = p9 and p9.Value or 0
    local v12, v13
    if v11 == 2 then
        v12 = Color3.new(0, 1)
        v13 = p10 == "Tycoon" and 1 or 0
    elseif v11 == 1 then
        v12 = v_u_3(p8, v_u_5) and Color3.new(0, 1) or Color3.new(1)
        v13 = 0
    else
        v12 = Color3.new(1)
        v13 = 0
    end
    for _, v14 in pairs(p7) do
        v14.Transparency = v13
        v14.Color = v12
    end
end
function AddLaserModel(p15)
    -- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2
    local v_u_16 = v_u_4:GetPlayerByUserId(p15:GetAttribute("WorkingForPlrId"))
    local v_u_17
    if v_u_16 then
        v_u_17 = v_u_16.Settings.Permission
    else
        v_u_17 = v_u_16
    end
    local v_u_18 = true
    local v_u_19 = p15.Parent.Name == "AllModels" and "Tycoon" or "Placable"
    if v_u_19 == "Placable" and v_u_16 == v_u_5 then
        local v20 = Instance.new("ProximityPrompt", p15:WaitForChild("SelectionPart"))
        v20.ActionText = "Remove"
        v20.ObjectText = "Laser barrier"
        v20.HoldDuration = 1
        v20.Triggered:Connect(function()
            -- upvalues: (ref) v_u_2
            v_u_2:FireServer("Remove", "Laser barrier")
        end)
    end
    local v_u_21 = {}
    local v_u_22 = nil
    local function v25(p23)
        -- upvalues: (copy) v_u_21, (ref) v_u_18, (ref) v_u_22
        if p23.Name == "LaserPart" then
            local v24 = v_u_21
            table.insert(v24, p23)
            if not v_u_18 then
                v_u_22()
            end
        end
    end
    local v26 = v_u_22
    for _, v27 in pairs(p15:GetDescendants()) do
        if v27.Name == "LaserPart" then
            table.insert(v_u_21, v27)
            if not v_u_18 then
                v26()
            end
        end
    end
    v_u_22 = function()
        -- upvalues: (copy) v_u_21, (copy) v_u_16, (copy) v_u_17, (copy) v_u_19
        ColorLaser(v_u_21, v_u_16, v_u_17, v_u_19)
    end
    if v_u_17 then
        v_u_17.Changed:Connect(v_u_22)
    end
    v_u_22()
    local _ = false
    p15.DescendantAdded:Connect(v25)
end
v6.OnInstanceAdded = AddLaserModel
return v6

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnCameraAndLaserAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ProximityPromptService")
local v_u_2 = game:GetService("StarterGui")
local v_u_3 = game.Players.LocalPlayer
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v7 = {}
local v_u_8 = false
function LeaveSeat(p9)
    -- upvalues: (ref) v_u_8, (ref) v_u_5, (ref) v_u_4, (ref) v_u_6, (copy) v_u_2, (copy) v_u_1
    if v_u_8 then
        v_u_8 = false
        v_u_5.DisableCameraControls()
        v_u_4.RemoveCameraGui()
        v_u_6.StopCameraTween()
        ChangeCameraTransparency(p9, 0)
        v_u_2:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
        v_u_2:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
        v_u_2:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
        v_u_1.Enabled = true
    end
end
function OnPlayerSit(p10)
    -- upvalues: (copy) v_u_1, (ref) v_u_8, (ref) v_u_4, (copy) v_u_2, (ref) v_u_5, (ref) v_u_6
    v_u_1.Enabled = false
    v_u_8 = true
    local v11, v12 = v_u_4.DisplayCameraGui()
    v_u_2:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
    v_u_5.EnableCameraControls(p10, v11, v12)
    v_u_6.StartCameraTween(p10:WaitForChild("CameraPart"))
    ChangeCameraTransparency(p10, 1)
end
function ChangeCameraTransparency(p13, p14)
    p13.ToCamCylinderPart.Transparency = p14
    p13.OnCamSpherePart.Transparency = p14
    p13.MainDefensePart.Transparency = p14
    p13.BlackPrts.Transparency = p14
    p13.AimPart.Transparency = p14
    p13.LightPart.Transparency = p14 == 0 and 0.5 or 1
end
function v7.OnInstanceAdded(p15)
    -- upvalues: (copy) v_u_3, (ref) v_u_4, (ref) v_u_5, (ref) v_u_6
    if v_u_3 == p15.Parent.Parent.Owner.Value then
        v_u_4 = require(v_u_3.PlayerGui:WaitForChild("CameraGui"):WaitForChild("CameraGuiModule"))
        v_u_5 = require(script:WaitForChild("CameraControls"))
        v_u_6 = require(script:WaitForChild("CameraTween"))
        local v_u_16 = p15:WaitForChild("Camera")
        local v_u_17 = p15:WaitForChild("CameraSeat")
        v_u_17.Disabled = false
        local v18 = Instance.new("ProximityPrompt", p15:WaitForChild("Desk"):WaitForChild("DeskPart"))
        v18.UIOffset = Vector2.new(0, 5)
        v18.MaxActivationDistance = 15
        v18.ObjectText = "Camera"
        v18.ActionText = "Use"
        v18.Triggered:Connect(function()
            -- upvalues: (ref) v_u_3, (copy) v_u_17
            local v19 = v_u_3.Character
            if v19 then
                v19 = v_u_3.Character:FindFirstChild("Humanoid")
            end
            if v19 and v19.Health > 0 then
                v_u_17:Sit(v19)
            end
        end)
        v_u_17:GetPropertyChangedSignal("Occupant"):Connect(function()
            -- upvalues: (copy) v_u_17, (ref) v_u_3, (copy) v_u_16
            local v20 = v_u_17.Occupant
            if v20 and v20.Parent == v_u_3.Character then
                OnPlayerSit(v_u_16)
            else
                LeaveSeat(v_u_16)
            end
        end)
    else
        p15:WaitForChild("Computer"):WaitForChild("Screen"):WaitForChild("SurfaceGui"):Destroy()
    end
end
return v7

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnCameraAndLaserAdded.CameraTween
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = workspace.Camera
local v_u_3 = TweenInfo.new(1.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)
local v4 = {}
local v_u_5 = nil
local v_u_6 = false
function v4.StartCameraTween(p_u_7)
    -- upvalues: (ref) v_u_5, (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (ref) v_u_6
    if v_u_5 then
        v_u_5:Cancel()
    end
    v_u_5 = v_u_1:Create(v_u_2, v_u_3, {
        ["CFrame"] = p_u_7.CFrame
    })
    v_u_2.CameraType = Enum.CameraType.Scriptable
    v_u_5:Play()
    task.spawn(function()
        -- upvalues: (ref) v_u_5, (ref) v_u_6, (ref) v_u_2, (copy) p_u_7
        if v_u_5.Completed:Wait() == Enum.PlaybackState.Completed then
            v_u_6 = true
            while task.wait() and v_u_6 do
                v_u_2.CFrame = p_u_7.CFrame
            end
        end
    end)
end
function v4.StopCameraTween()
    -- upvalues: (ref) v_u_6, (copy) v_u_2, (ref) v_u_5
    v_u_6 = false
    v_u_2.CameraType = Enum.CameraType.Custom
    if v_u_5 then
        v_u_5:Cancel()
    end
end
return v4

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnCameraAndLaserAdded.CameraControls
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ContextActionService")
local v_u_2 = game:GetService("UserInputService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = require(v3.AllModules.InputManager)
local v_u_6 = v3.RemoteEvent.CameraFireEvent
local v_u_7 = v3.RemoteEvent.GuiEvent.GuiEventLocal
local v_u_8 = workspace.Camera
local v9 = game.Players.LocalPlayer
local v_u_10 = v9.Settings.AutoFireState
local v_u_11 = v9:GetMouse()
local v_u_12 = require(v9.PlayerScripts:WaitForChild("PlayerModule")):GetControls()
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = nil
local v_u_23 = nil
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v28 = {}
function MoveCamera(p29, p30)
    -- upvalues: (ref) v_u_24, (copy) v_u_2, (ref) v_u_25
    local v31 = p29 == Enum.UserInputState.Begin and true or p29 == Enum.UserInputState.Change
    if p30 == Enum.KeyCode.S then
        if v31 then
            v_u_24.AngularVelocity = 0.5235987755982988
            return
        elseif v_u_2:IsKeyDown(Enum.KeyCode.W) then
            v_u_24.AngularVelocity = -0.5235987755982988
        else
            v_u_24.AngularVelocity = 0
        end
    elseif p30 == Enum.KeyCode.W then
        if v31 then
            v_u_24.AngularVelocity = -0.5235987755982988
            return
        elseif v_u_2:IsKeyDown(Enum.KeyCode.S) then
            v_u_24.AngularVelocity = 0.5235987755982988
        else
            v_u_24.AngularVelocity = 0
        end
    elseif p30 == Enum.KeyCode.A then
        if v31 then
            v_u_25.AngularVelocity = 0.7853981633974483
            return
        elseif v_u_2:IsKeyDown(Enum.KeyCode.D) then
            v_u_25.AngularVelocity = -0.7853981633974483
        else
            v_u_25.AngularVelocity = 0
        end
    else
        if p30 == Enum.KeyCode.D then
            if v31 then
                v_u_25.AngularVelocity = -0.7853981633974483
                return
            end
            if v_u_2:IsKeyDown(Enum.KeyCode.A) then
                v_u_25.AngularVelocity = 0.7853981633974483
                return
            end
            v_u_25.AngularVelocity = 0
        end
        return
    end
end
local v_u_32 = false
function FireFunction(p33, p34)
    -- upvalues: (copy) v_u_10, (ref) v_u_32, (copy) v_u_8, (copy) v_u_6
    if v_u_10.Value then
        return
    elseif v_u_32 then
        return
    else
        v_u_32 = true
        local v35 = v_u_8:ScreenPointToRay(p33, p34)
        local v36 = workspace:Raycast(v35.Origin, v35.Direction * 10000)
        local v37
        if v36 then
            v37 = v36.Instance
        else
            v37 = v36
        end
        if v37 then
            v_u_6:FireServer(v37, v36.Position - v37.Position)
            task.wait(0.35)
            v_u_32 = false
        else
            v_u_32 = false
        end
    end
end
local v_u_38 = {
    ["LeftRotate"] = { Enum.KeyCode.A, "\226\134\144" },
    ["RightRotate"] = { Enum.KeyCode.D, "\226\134\146" },
    ["UpRotate"] = { Enum.KeyCode.W, "\226\134\145" },
    ["DownRotate"] = { Enum.KeyCode.S, "\226\134\147" }
}
local v_u_39 = nil
local v_u_40 = 70
local v_u_41 = TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
function TweenFieldOfView(p42)
    -- upvalues: (ref) v_u_40, (ref) v_u_39, (copy) v_u_4, (copy) v_u_8, (copy) v_u_41
    local v43 = v_u_40 + p42
    local v44 = math.max(20, v43)
    local v45 = math.min(70, v44)
    if v45 ~= v_u_40 then
        v_u_40 = v45
        if v_u_39 then
            v_u_39:Cancel()
        end
        v_u_39 = v_u_4:Create(v_u_8, v_u_41, {
            ["FieldOfView"] = v_u_40
        })
        v_u_39:Play()
    end
end
function OnInputTypeChanged(p46)
    -- upvalues: (ref) v_u_27, (ref) v_u_26, (copy) v_u_38, (copy) v_u_1, (ref) v_u_15, (copy) v_u_2, (ref) v_u_18, (copy) v_u_8, (ref) v_u_19, (ref) v_u_20, (ref) v_u_24, (ref) v_u_25, (copy) v_u_7, (copy) v_u_11, (ref) v_u_16, (ref) v_u_17, (ref) v_u_21, (ref) v_u_22
    DisconnectControls()
    local v47 = {
        ["LeftRotate"] = v_u_27 - UDim2.fromOffset(1.2 * v_u_26, 0),
        ["RightRotate"] = v_u_27 + UDim2.fromOffset(1.2 * v_u_26, 0),
        ["UpRotate"] = v_u_27 - UDim2.fromOffset(0, 1.2 * v_u_26),
        ["DownRotate"] = v_u_27
    }
    for v48, v49 in v_u_38 do
        local v_u_50 = v49[1]
        v_u_1:BindAction(v48, function(_, p51)
            -- upvalues: (copy) v_u_50
            MoveCamera(p51, v_u_50)
        end, true, v_u_50)
        v_u_1:SetTitle(v48, v49[2])
        v_u_1:SetPosition(v48, v47[v48])
    end
    if p46 == "Mobile" then
        v_u_15 = v_u_2.TouchTap:Connect(function(p52, p53)
            if not p53 then
                local v54 = p52[1]
                FireFunction(v54.X, v54.Y)
            end
        end)
        local v_u_55 = 70
        local v_u_56 = false
        local v_u_57 = 1
        v_u_18 = v_u_2.TouchPinch:Connect(function(_, p58, _, p59)
            -- upvalues: (ref) v_u_55, (ref) v_u_8, (ref) v_u_57, (ref) v_u_56
            if p59 == Enum.UserInputState.Begin then
                v_u_55 = v_u_8.FieldOfView
                v_u_57 = 1
                v_u_56 = true
            else
                if p59 == Enum.UserInputState.End then
                    v_u_56 = false
                end
                local v60 = v_u_55 / (p58 * v_u_57)
                local v61 = math.min(v60, 70)
                local v62 = math.max(20, v61)
                if v62 == 20 or v62 == 70 then
                    v_u_55 = v62
                    v_u_57 = 1 / (p58 * v_u_57)
                end
                v_u_8.FieldOfView = v62
            end
        end)
        local v_u_63 = nil
        v_u_19 = v_u_2.InputBegan:Connect(function(p_u_64, p65)
            -- upvalues: (ref) v_u_63, (ref) v_u_56, (ref) v_u_20, (ref) v_u_24, (ref) v_u_25, (ref) v_u_8
            if not p65 and (p_u_64.UserInputType == Enum.UserInputType.Touch and not (v_u_63 or v_u_56)) then
                v_u_63 = p_u_64.Position
                v_u_20 = p_u_64.Changed:Connect(function()
                    -- upvalues: (copy) p_u_64, (ref) v_u_56, (ref) v_u_24, (ref) v_u_25, (ref) v_u_63, (ref) v_u_20, (ref) v_u_8
                    if p_u_64.UserInputState == Enum.UserInputState.End or v_u_56 then
                        local v66 = v_u_25
                        v_u_24.AngularVelocity = 0
                        v66.AngularVelocity = 0
                        v_u_63 = nil
                        v_u_20:Disconnect()
                    elseif p_u_64.UserInputState == Enum.UserInputState.Change then
                        local v67 = p_u_64.Position - v_u_63
                        if v67.Magnitude <= 5 then
                            return
                        end
                        local v68 = v_u_25
                        local v69 = 6 * v67.X / v_u_8.ViewportSize.X
                        v68.AngularVelocity = math.min(3, v69) * -0.7853981633974483
                        local v70 = v_u_24
                        local v71 = 6 * v67.Y / v_u_8.ViewportSize.Y
                        v70.AngularVelocity = math.min(3, v71) * 0.5235987755982988
                    end
                end)
            end
        end)
    elseif p46 == "PC" then
        v_u_7:Fire("Notification", "Use the " .. v_u_2:GetStringForKeyCode(Enum.KeyCode.W) .. ", " .. v_u_2:GetStringForKeyCode(Enum.KeyCode.A) .. ", " .. v_u_2:GetStringForKeyCode(Enum.KeyCode.S) .. ", " .. v_u_2:GetStringForKeyCode(Enum.KeyCode.D) .. " keys to rotate the camera and click to fire")
        v_u_15 = v_u_11.Button1Down:Connect(function()
            -- upvalues: (ref) v_u_11
            FireFunction(v_u_11.X, v_u_11.Y)
        end)
        v_u_16 = v_u_11.WheelForward:Connect(function()
            TweenFieldOfView(-5)
        end)
        v_u_17 = v_u_11.WheelBackward:Connect(function()
            TweenFieldOfView(5)
        end)
    elseif p46 == "Gamepad" then
        v_u_21 = v_u_2.InputChanged:Connect(function(p72, p73)
            -- upvalues: (ref) v_u_24, (ref) v_u_25
            if p73 then
                return
            elseif p72.KeyCode == Enum.KeyCode.Thumbstick1 then
                local v74 = p72.Position
                local v75 = v_u_24
                local v76 = v74.Y
                v75.AngularVelocity = -0.5235987755982988 * (math.abs(v76) > 0.1 and (v74.Y or 0) or 0)
                local v77 = v_u_25
                local v78 = v74.X
                v77.AngularVelocity = -0.7853981633974483 * (math.abs(v78) > 0.1 and v74.X or 0)
            end
        end)
        v_u_22 = v_u_2.InputBegan:Connect(function(p79, p80)
            -- upvalues: (ref) v_u_11
            if p80 then
                return
            elseif p79.KeyCode == Enum.KeyCode.ButtonL1 then
                TweenFieldOfView(10)
                return
            elseif p79.KeyCode == Enum.KeyCode.ButtonR1 then
                TweenFieldOfView(-10)
            elseif p79.KeyCode == Enum.KeyCode.ButtonR2 then
                FireFunction(v_u_11.X, v_u_11.Y)
            end
        end)
    end
    table.clear(v47)
end
function v28.EnableCameraControls(p81, p82, p83)
    -- upvalues: (copy) v_u_12, (ref) v_u_23, (ref) v_u_24, (ref) v_u_25, (ref) v_u_13, (ref) v_u_14, (ref) v_u_26, (ref) v_u_27, (copy) v_u_5
    v_u_12:Disable()
    v_u_23 = p81.MainDefensePart.ElectricMotorSound
    v_u_24 = p81.Parent.XMotor
    v_u_25 = p81.Parent.YMotor
    local function v86()
        -- upvalues: (ref) v_u_24, (ref) v_u_25, (ref) v_u_23
        local v84 = v_u_24.AngularVelocity
        if math.abs(v84) <= 0 then
            local v85 = v_u_25.AngularVelocity
            if math.abs(v85) <= 0 then
                v_u_23:Stop()
                goto l5
            end
        end
        if not v_u_23.IsPlaying then
            v_u_23:Play()
            return
        end
        ::l5::
    end
    v_u_13 = v_u_24:GetPropertyChangedSignal("AngularVelocity"):Connect(v86)
    v_u_14 = v_u_25:GetPropertyChangedSignal("AngularVelocity"):Connect(v86)
    v_u_26 = p83
    v_u_27 = p82
    v_u_5.ConnectToInputChanged(OnInputTypeChanged, "Camera")
end
function DisconnectControls()
    -- upvalues: (ref) v_u_17, (ref) v_u_21, (ref) v_u_16, (ref) v_u_20, (ref) v_u_18, (ref) v_u_19, (ref) v_u_15, (ref) v_u_22
    if v_u_17 and v_u_17.Connected then
        v_u_17:Disconnect()
    end
    if v_u_21 and v_u_21.Connected then
        v_u_21:Disconnect()
    end
    if v_u_16 and v_u_16.Connected then
        v_u_16:Disconnect()
    end
    if v_u_20 and v_u_20.Connected then
        v_u_20:Disconnect()
    end
    if v_u_18 and v_u_18.Connected then
        v_u_18:Disconnect()
    end
    if v_u_19 and v_u_19.Connected then
        v_u_19:Disconnect()
    end
    if v_u_15 and v_u_15.Connected then
        v_u_15:Disconnect()
    end
    if v_u_22 and v_u_22.Connected then
        v_u_22:Disconnect()
    end
end
function v28.DisableCameraControls()
    -- upvalues: (copy) v_u_12, (copy) v_u_5, (ref) v_u_39, (copy) v_u_8, (ref) v_u_40, (ref) v_u_13, (ref) v_u_14, (ref) v_u_24, (ref) v_u_25, (ref) v_u_23, (copy) v_u_38, (copy) v_u_1
    v_u_12:Enable()
    v_u_5.Disconnect("Camera")
    if v_u_39 then
        v_u_39:Cancel()
    end
    v_u_8.FieldOfView = 70
    v_u_40 = 70
    DisconnectControls()
    v_u_13:Disconnect()
    v_u_14:Disconnect()
    v_u_24.AngularVelocity = 0
    v_u_25.AngularVelocity = 0
    v_u_23:Stop()
    for v87, _ in v_u_38 do
        local v88 = v_u_1:GetBoundActionInfo(v87)
        if v88.title then
            v_u_1:UnbindAction(v87)
        elseif game["Run Service"]:IsStudio() then
            warn("ContextActionService: does have a function for", v87)
        else
            print("ContextActionService: does have a function for", v87)
        end
        table.clear(v88)
    end
end
return v28

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnSizableUIAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("SoundService"):WaitForChild("Sound"):WaitForChild("ButtonHover")
local v_u_3 = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local v_u_4 = TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
local v_u_5 = {}
function SizeButtonOnMouseOver(p6)
    -- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_4, (copy) v_u_2, (copy) v_u_5
    if p6:IsDescendantOf(v_u_3) or p6:IsDescendantOf(workspace) then
        local v7 = p6:GetAttribute("ScaleChild")
        local v_u_8, v9
        if v7 then
            v_u_8 = p6:WaitForChild(v7):WaitForChild("UIScale")
            v9 = p6
        else
            v_u_8 = p6
            v9 = v_u_8.Parent
        end
        local v_u_10 = v_u_8:GetAttribute("BaseScale") or 1
        local v_u_11 = v_u_8:GetAttribute("EndScale") or 1.2
        if v9:IsA("GuiObject") then
            local v_u_12 = nil
            local function v13()
                -- upvalues: (ref) v_u_12, (ref) v_u_1, (ref) v_u_8, (ref) v_u_4, (copy) v_u_11, (ref) v_u_2
                if v_u_12 then
                    v_u_12:Cancel()
                end
                v_u_12 = v_u_1:Create(v_u_8, v_u_4, {
                    ["Scale"] = v_u_11
                })
                v_u_12:Play()
                v_u_2:Play()
            end
            local function v14()
                -- upvalues: (ref) v_u_12, (ref) v_u_1, (ref) v_u_8, (ref) v_u_4, (copy) v_u_10
                if v_u_12 then
                    v_u_12:Cancel()
                end
                v_u_12 = v_u_1:Create(v_u_8, v_u_4, {
                    ["Scale"] = v_u_10
                })
                v_u_12:Play()
            end
            v_u_5.AllSizableUI[p6] = {
                ["OnMouseLeave"] = v14,
                ["ConnectionsList"] = {
                    v9.MouseEnter:Connect(v13),
                    v9.MouseLeave:Connect(v14),
                    v9.SelectionGained:Connect(v13),
                    v9.SelectionLost:Connect(v14)
                },
                ["Tween"] = v_u_12
            }
        else
            print(v9, "is not a gui object!")
        end
    else
        return
    end
end
v_u_5.AllSizableUI = {}
v_u_5.OnInstanceAdded = SizeButtonOnMouseOver
function v_u_5.OnInstanceRemoved(p15)
    -- upvalues: (copy) v_u_5, (copy) v_u_4
    local v16 = v_u_5.AllSizableUI[p15]
    if v16 then
        v_u_5.AllSizableUI[v16] = nil
        v16.OnMouseLeave()
        for _, v17 in pairs(v16.ConnectionsList) do
            v17:Disconnect()
        end
        table.clear(v16.ConnectionsList)
        task.wait(v_u_4.Time)
        v16.Tween = nil
        table.clear(v16)
    end
end
return v_u_5

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnTycoonScreenAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Players").LocalPlayer
return {
    ["OnInstanceAdded"] = function(p2)
        -- upvalues: (copy) v_u_1
        if p2.Parent.Parent.Owner.Value == v_u_1 then
            local v3 = Instance.new("ClickDetector", p2:WaitForChild("ScreenPart"))
            local v_u_4 = game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):WaitForChild("WrtiteTextOnTycoonScreen")
            local v_u_5 = v_u_1:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("TextBoxForTycoonScreen")
            local v_u_6 = v_u_5:WaitForChild("Valid")
            local v_u_7 = v_u_5:WaitForChild("Cancel")
            v_u_6.Activated:Connect(function()
                -- upvalues: (copy) v_u_4, (copy) v_u_5
                v_u_5.Text = v_u_4:InvokeServer("Write", v_u_5.Text)
                v_u_5.Visible = false
            end)
            v_u_7.Activated:Connect(function()
                -- upvalues: (copy) v_u_5
                v_u_5.Visible = false
            end)
            v3.MouseClick:Connect(function()
                -- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_7, (copy) v_u_6
                if v_u_5.Visible then
                    v_u_5.Text = v_u_4:InvokeServer("Write", v_u_5.Text)
                    v_u_5.Visible = false
                else
                    v_u_5.Text = v_u_4:InvokeServer("Get")
                    v_u_7.Position = UDim2.new(1, -v_u_6.AbsoluteSize.X - v_u_6.BorderSizePixel, 0, -v_u_6.BorderSizePixel)
                    v_u_5.Visible = true
                end
            end)
        end
    end
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnTicketMachineAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = nil
local v_u_2 = game.Players.LocalPlayer
return {
    ["OnInstanceAdded"] = function(p3)
        -- upvalues: (copy) v_u_2, (ref) v_u_1
        if p3.Parent.Parent.Owner.Value == v_u_2 then
            local v4 = p3:WaitForChild("SurfaceGui"):WaitForChild("BackgoundBttn")
            v4:AddTag("SizableUI")
            v4.Activated:Connect(function()
                -- upvalues: (ref) v_u_1, (ref) v_u_2
                if not v_u_1 then
                    v_u_1 = require(v_u_2.PlayerGui:WaitForChild("MainGui"):WaitForChild("MainGuiScript"):WaitForChild("ToggleFrameModule"))
                end
                v_u_1.ToggleFrame("UseTicketFrame")
            end)
        end
    end
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnZombieAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
return {
    ["OnInstanceAdded"] = require(script.Parent.Parent:WaitForChild("OverHeadGuis"):WaitForChild("OverHeadGuisModule")).BuildOverHeadGui
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnCloneAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(script.Parent.Parent:WaitForChild("OverHeadGuis"):WaitForChild("OverHeadGuisModule"))
local v_u_2 = game:GetService("Players")
return {
    ["OnInstanceAdded"] = function(p3)
        -- upvalues: (copy) v_u_2, (copy) v_u_1
        local v4 = p3:GetAttribute("WorkingForPlrId")
        local v5 = nil
        while true do
            v5 = not p3:IsDescendantOf(workspace) or v_u_2:GetPlayerByUserId(v4)
            if v5 then
                break
            end
            task.wait(0.2)
        end
        if v5 then
            v_u_1.BuildOverHeadGui(p3)
        end
    end
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnAnimatedWeaponAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Players").LocalPlayer
local v_u_4 = require(v_u_1.AllModules.WeaponStats)
local v_u_5 = nil
local v_u_6 = v_u_1.RemoteEvent.WeaponEvent.WeaponStateReplicator
local v_u_7 = TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1)
local v_u_8 = {
    "Ice spike cannon",
    "Extra cannon",
    "Crate finder",
    "\206\169 laser"
}
local v_u_9 = { "Minigun", "Billionaire cannon" }
local v_u_10 = {
    "GoldenKey",
    "DiamondKey",
    "SilverKey",
    "StoneKey"
}
local v_u_11 = {}
local v_u_12 = {}
v_u_12.__index = v_u_12
function v_u_12.AnimateTool(p_u_13)
    -- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_7, (copy) v_u_9, (copy) v_u_10, (copy) v_u_6, (ref) v_u_5, (copy) v_u_1
    if table.find(v_u_8, p_u_13.Name) then
        if not p_u_13.RotateTween then
            local v14 = p_u_13.Tool:FindFirstChild("RotationWeld")
            if not v14 then
                print("not found and returned")
                return
            end
            v14.C1 = CFrame.new(0, 0, 0)
            local v15 = v_u_2
            local v16 = v_u_7
            local v17 = {
                ["C1"] = CFrame.Angles(3.141592653589793, 0, 0)
            }
            local v18
            if p_u_13.Name == "Crate finder" then
                v18 = CFrame.Angles(-3.141592653589793, 0, 0) or nil
            else
                v18 = nil
            end
            v17.C0 = v18
            p_u_13.RotateTween = v15:Create(v14, v16, v17)
            p_u_13.RotationWeld = v14
        end
        p_u_13.RotateTween:Play()
        if p_u_13.Name == "\206\169 laser" then
            p_u_13.FireStateChanged_C = p_u_13.Tool:GetAttributeChangedSignal(p_u_13.Prefix .. "Firing"):Connect(function()
                -- upvalues: (copy) p_u_13
                p_u_13:OnLaserStateChanged()
            end)
            p_u_13.ChargeValueChanged_C = p_u_13.Tool:GetAttributeChangedSignal(p_u_13.Prefix .. "Charge"):Connect(function()
                -- upvalues: (copy) p_u_13
                p_u_13:OnLaserStateChanged()
            end)
            p_u_13:OnLaserStateChanged()
            return
        end
    else
        if table.find(v_u_9, p_u_13.Name) then
            p_u_13.FireStateChanged_C = p_u_13.Tool:GetAttributeChangedSignal(p_u_13.Prefix .. "Firing"):Connect(function()
                -- upvalues: (copy) p_u_13
                p_u_13:OnWeaponStateChanged()
            end)
            p_u_13.ReloadStateChanged_C = p_u_13.Tool:GetAttributeChangedSignal(p_u_13.Prefix .. "Reloading"):Connect(function()
                -- upvalues: (copy) p_u_13
                p_u_13:OnWeaponStateChanged()
            end)
            p_u_13:OnWeaponStateChanged()
            return
        end
        if p_u_13.Name == "Twin keys" then
            local function v_u_25()
                -- upvalues: (copy) p_u_13, (ref) v_u_10, (ref) v_u_6
                local v19 = p_u_13.Tool:GetAttribute(p_u_13.Prefix .. "NumKeys")
                local v20 = p_u_13.Tool:GetAttribute(p_u_13.Prefix .. "DisplayedKeys")
                for v21, v22 in pairs(v_u_10) do
                    p_u_13[v22] = p_u_13[v22] or p_u_13.Handle:FindFirstChild(v22)
                    if p_u_13[v22] then
                        local v23 = v21 <= v19
                        for _, v24 in pairs(p_u_13[v22]:GetChildren()) do
                            if v24:IsA("BasePart") then
                                v24.Transparency = v23 and (v24:GetAttribute("OriginalTransparency") or 0) or 1
                            end
                        end
                        p_u_13[v22].Transparency = v23 and (p_u_13[v22]:GetAttribute("OriginalTransparency") or 0) or 1
                    end
                end
                if p_u_13.IsOwned then
                    v_u_6:FireServer(p_u_13.Tool, {
                        ["DisplayedKeys"] = v20,
                        ["NumKeys"] = v19
                    })
                end
            end
            local function v30()
                -- upvalues: (copy) p_u_13, (ref) v_u_5, (ref) v_u_1, (ref) v_u_10, (copy) v_u_25
                local v26 = p_u_13.Tool:GetAttribute(p_u_13.Prefix .. "DisplayedKeys")
                if not v_u_5 then
                    v_u_5 = require(v_u_1.AllModules.MaterialBase)
                end
                if v26 and v_u_5.KeyAppearance[v26] then
                    for _, v27 in pairs(v_u_10) do
                        p_u_13[v27] = p_u_13[v27] or p_u_13.Handle:FindFirstChild(v27)
                        if p_u_13[v27] then
                            for _, v28 in pairs(p_u_13[v27]:GetChildren()) do
                                if v28.Name ~= "OnKeyAtt" then
                                    v28:Destroy()
                                end
                            end
                            v_u_5.ApplyKeyAppearance(v26, p_u_13[v27])
                            p_u_13[v27]:SetAttribute("OriginalTransparency", p_u_13[v27].Transparency)
                            for _, v29 in pairs(p_u_13[v27]:GetChildren()) do
                                if v29:IsA("BasePart") then
                                    v29:SetAttribute("OriginalTransparency", v29.Transparency)
                                end
                            end
                        end
                    end
                    v_u_25()
                end
            end
            p_u_13.DisplayedKeys_C = p_u_13.Tool:GetAttributeChangedSignal(p_u_13.Prefix .. "DisplayedKeys"):Connect(v30)
            v30()
            p_u_13.NumKeys_C = p_u_13.Tool:GetAttributeChangedSignal(p_u_13.Prefix .. "NumKeys"):Connect(v_u_25)
            v_u_25()
            return
        end
        if p_u_13.Name == "Firework cannon" then
            p_u_13.ReloadStateChanged_C = p_u_13.Tool:GetAttributeChangedSignal(p_u_13.Prefix .. "Reloading"):Connect(function()
                -- upvalues: (copy) p_u_13
                ChangeTransparency(p_u_13.Tool, p_u_13.Prefix, p_u_13.IsOwned)
            end)
            ChangeTransparency(p_u_13.Tool, p_u_13.Prefix, p_u_13.IsOwned)
            return
        end
        if p_u_13.Name == "Spin wheel mace" then
            if not p_u_13.RotateTween then
                local v31 = p_u_13.Tool.SurfaceGui.SpinImage
                p_u_13.RotateTween = v_u_2:Create(v31, TweenInfo.new(2.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                    ["Rotation"] = v31.Rotation + 360
                })
            end
            p_u_13.RotateTween:Play()
        end
    end
end
function ChangeTransparency(p32, p33, p34)
    -- upvalues: (copy) v_u_6
    local v35 = p32:FindFirstChild("Handle")
    if v35 then
        local v36 = p32:GetAttribute(p33 .. "Reloading")
        local v37 = v36 and 1 or 0
        local v38 = v35:FindFirstChild("FireworkPart")
        if v38 then
            v38.Transparency = v37
            local v39 = v38:FindFirstChild("Decal_" .. 1)
            if v39 then
                v39.Transparency = v37
            end
            local v40 = v38:FindFirstChild("Decal_" .. 2)
            if v40 then
                v40.Transparency = v37
            end
            local v41 = v38:FindFirstChild("Decal_" .. 3)
            if v41 then
                v41.Transparency = v37
            end
            local v42 = v38:FindFirstChild("Decal_" .. 4)
            if v42 then
                v42.Transparency = v37
            end
        end
        local v43 = v35:FindFirstChild("FrontFireworkPart")
        if v43 then
            v43.Transparency = v37
        end
        if p34 then
            v_u_6:FireServer(p32, {
                ["Reloading"] = v36
            })
        end
    end
end
function v_u_12.OnLaserStateChanged(p44, p45, p46)
    -- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_7, (copy) v_u_6
    local v47 = p44.Tool:GetAttribute(p44.Prefix .. "Charge")
    local v48 = p44.Tool:GetAttribute(p44.Prefix .. "Firing")
    p44.ParticleEmitter = p44.ParticleEmitter or p44.Handle:FindFirstChild("ParticleEmitter", true)
    p44.ChargingLaser = p44.ChargingLaser or p44.Handle:FindFirstChild("ChargingLaser")
    p44.PointLight = p44.PointLight or p44.Handle:FindFirstChild("PointLight", true)
    p44.LightPart = p44.LightPart or p44.Handle:FindFirstChild("LightPart")
    p44.OMEGA_1 = p44.OMEGA_1 or p44.Tool:FindFirstChild("Omega_Main_1")
    p44.OMEGA_2 = p44.OMEGA_2 or p44.Tool:FindFirstChild("Omega_Main_2")
    local v49 = not p44.Sparks and p44.LightPart
    if v49 then
        v49 = p44.LightPart:FindFirstChild("Sparks")
    end
    p44.Sparks = v49
    local v50 = v48 and v47 and v47 or 1
    local v51 = Color3.new(1, 1, 1):Lerp(Color3.fromRGB(156, 85, 255), (v50 - 1) / (v_u_4["\206\169 laser"].MaxCharge - 1))
    if p44.ParticleEmitter then
        p44.ParticleEmitter.Color = ColorSequence.new(v51)
    end
    if p44.OMEGA_1 then
        p44.OMEGA_1.Color = v51
    end
    if p44.OMEGA_2 then
        p44.OMEGA_2.Color = v51
    end
    if p44.PointLight then
        p44.PointLight.Brightness = v50
        p44.PointLight.Color = v51
    end
    if p45 or not v48 then
        if p44.LightPart then
            p44.LightPart.Transparency = 1
        end
        if p44.Sparks then
            p44.Sparks.Enabled = false
        end
        if p44.RotateTween then
            p44.RotateTween:Cancel()
            p44.RotateTween = v_u_2:Create(p44.RotationWeld, v_u_7, {
                ["C1"] = p44.RotationWeld.C1 * CFrame.Angles(3.141278494324434, 0, 0)
            })
            p44.RotateTween:Play()
        end
        if p44.ChargingLaser then
            p44.ChargingLaser.Enabled = false
        end
    else
        local v52 = p44.Tool:GetScale()
        if p44.ChargingLaser then
            p44.ChargingLaser.Enabled = true
        end
        if p44.Sparks then
            p44.Sparks.Enabled = true
            p44.Sparks.Rate = 5 * v50
        end
        if p44.LightPart then
            p44.LightPart.Transparency = 0
            if v50 then
                p44.LightPart.Size = Vector3.new(1, 1, 1) * v50 * 0.3 * v52
            end
        end
        p44.LaserBeam = p44.LaserBeam or p44.Tool:FindFirstChild("Laser")
        if p44.LaserBeam then
            p44.LaserBeam.Width0 = v50 * v52
            p44.LaserBeam.Width1 = v50 * v52
        end
        p44.FireSnd = p44.FireSnd or p44.Handle:FindFirstChild("FireSnd-1")
        if p44.FireSnd then
            p44.FireSnd.PlaybackSpeed = 0.5 + v50 / 2
            p44.PitchShiftSoundEffect = p44.PitchShiftSoundEffect or p44.FireSnd:FindFirstChild("PitchShiftSoundEffect")
            if p44.PitchShiftSoundEffect then
                p44.PitchShiftSoundEffect.Octave = 0.5 + v50 / 2
            end
        end
        if p44.ParticleEmitter then
            p44.ParticleEmitter.Rate = 4 * v50
        end
        if p44.RotateTween then
            p44.RotateTween:Cancel()
            p44.RotateTween = v_u_2:Create(p44.RotationWeld, TweenInfo.new(v_u_7.Time / v50, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
                ["C1"] = p44.RotationWeld.C1 * CFrame.Angles(3.141278494324434, 0, 0)
            })
            p44.RotateTween:Play()
        end
    end
    if p44.IsOwned and not p46 then
        v_u_6:FireServer(p44.Tool, {
            ["Firing"] = v48
        })
    end
end
function v_u_12.OnWeaponStateChanged(p53, p54, p55)
    -- upvalues: (copy) v_u_2, (copy) v_u_6
    p53.Handle = p53.Handle or p53.Tool:FindFirstChild("Handle")
    if p53.Handle then
        p53.FireLoopSound = p53.FireLoopSoud or p53.Handle:FindFirstChild("FireLoop")
        p53.FireEndSound = p53.FireEndSound or p53.Handle:FindFirstChild("FireEnd")
        p53.OnGunAtt = p53.OnGunAtt or p53.Handle:FindFirstChild("OnGunAtt")
        if p53.OnGunAtt then
            p53.LoopFireEmitter = p53.LoopFireEmitter or p53.OnGunAtt:FindFirstChild("LoopFireEmitter")
        end
        p53.RotationWeld = p53.RotationWeld or p53.Handle:FindFirstChild("RotationWeld")
    end
    local v56 = p53.Tool:GetAttribute(p53.Prefix .. "Reloading")
    local v57 = p53.Tool:GetAttribute(p53.Prefix .. "Firing")
    if p54 or (not v57 or v56) then
        if p53.LoopFireEmitter then
            p53.LoopFireEmitter.Enabled = false
        end
        if p53.FireLoopSound and p53.FireLoopSound.IsPlaying then
            if p53.FireEndSound then
                p53.FireEndSound:Play()
            end
            p53.FireLoopSound:Stop()
        end
        if p53.RotationWeld and (p53.RotationTween and p53.RotationTween.PlaybackState == Enum.PlaybackState.Playing) then
            p53.RotationTween:Cancel()
            p53.RotationTween = v_u_2:Create(p53.RotationWeld, p53.RotationEndTwInfo, {
                ["C1"] = p53.RotationWeld.C1 * p53.RotationTarget
            })
            p53.RotationTween:Play()
        end
    else
        if p53.RotationWeld then
            if p53.RotationTween then
                p53.RotationTween:Cancel()
            end
            p53.RotationTween = v_u_2:Create(p53.RotationWeld, p53.RotationLoopTwInfo, {
                ["C1"] = p53.RotationWeld.C1 * p53.RotationTarget
            })
            p53.RotationTween:Play()
        end
        if p53.LoopFireEmitter then
            p53.LoopFireEmitter.Enabled = true
        end
        if p53.FireLoopSound then
            p53.FireLoopSound:Play()
        end
    end
    if p53.IsOwned and not p55 then
        v_u_6:FireServer(p53.Tool, {
            ["Firing"] = v57,
            ["Reloading"] = v56
        })
    end
end
function v_u_12.CancelAnimation(p58, p59)
    -- upvalues: (copy) v_u_8, (copy) v_u_9
    if p58.FireStateChanged_C then
        p58.FireStateChanged_C:Disconnect()
    end
    if p58.ReloadStateChanged_C then
        p58.ReloadStateChanged_C:Disconnect()
    end
    if p58.ChargeValueChanged_C then
        p58.ChargeValueChanged_C:Disconnect()
    end
    if p58.DisplayedKeys_C then
        p58.DisplayedKeys_C:Disconnect()
    end
    if p58.NumKeys_C then
        p58.NumKeys_C:Disconnect()
    end
    if table.find(v_u_8, p58.Name) then
        if p58.RotateTween then
            p58.RotateTween:Cancel()
        end
        if p58.Name == "\206\169 laser" then
            p58:OnLaserStateChanged(true, p59)
            return
        end
    else
        if table.find(v_u_9, p58.Name) then
            p58:OnWeaponStateChanged(true, p59)
            return
        end
        if p58.Name == "Spin wheel mace" and p58.RotateTween then
            p58.RotateTween:Cancel()
        end
    end
end
function v_u_12.Delete(p60)
    if p60.AncestryChanged_C then
        p60.AncestryChanged_C:Disconnect()
    end
    p60:CancelAnimation(true)
    table.clear(p60)
end
function MakeAnimatedWeapon(p_u_61)
    -- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_9, (copy) v_u_11
    local v62 = v_u_12
    local v_u_63 = setmetatable({}, v62)
    v_u_63.Tool = p_u_61
    v_u_63.Name = p_u_61.Name
    v_u_63.IsOwned = v_u_3.Character and p_u_61:IsDescendantOf(v_u_3.Character) or p_u_61:IsDescendantOf(v_u_3)
    v_u_63.Prefix = v_u_63.IsOwned and "" or "Server_"
    local function v64()
        -- upvalues: (copy) p_u_61, (copy) v_u_63
        if p_u_61:IsDescendantOf(workspace) then
            v_u_63:AnimateTool()
        else
            v_u_63:CancelAnimation()
        end
    end
    if table.find(v_u_9, v_u_63.Name) then
        if v_u_63.Name == "Minigun" then
            v_u_63.RotationTarget = CFrame.Angles(3.141592653589793, 0, 0)
            v_u_63.RotationLoopTwInfo = TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1)
            v_u_63.RotationEndTwInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        elseif v_u_63.Name == "Billionaire cannon" then
            v_u_63.RotationTarget = CFrame.Angles(0, 1.0471975511965976, 0)
            v_u_63.RotationLoopTwInfo = TweenInfo.new(0.33, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1)
            v_u_63.RotationEndTwInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        end
    end
    v_u_11[p_u_61] = v_u_63
    v_u_63.Handle = p_u_61:WaitForChild("Handle", 3)
    if v_u_63.Tool then
        v_u_63.AncestryChanged_C = p_u_61.AncestryChanged:Connect(v64)
        if p_u_61:IsDescendantOf(workspace) then
            v_u_63:AnimateTool()
        else
            v_u_63:CancelAnimation()
        end
    else
        return
    end
end
return {
    ["OnInstanceAdded"] = MakeAnimatedWeapon,
    ["OnInstanceRemoved"] = function(p65)
        -- upvalues: (copy) v_u_11
        if v_u_11[p65] then
            v_u_11[p65]:Delete()
            v_u_11[p65] = nil
        end
    end
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnCollectibleAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = v1.RemoteEvent.CollectibleEvent
local v_u_4 = v1.RemoteEvent.PlaySoundEvent.PlaySoundEventLocal
local v_u_5 = require(v1.AllModules.ItemAnimations)
local v_u_6 = v2.LocalPlayer
local v7 = {}
function CollectEgg(p8)
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
    local v9
    if p8:IsA("Model") then
        v9 = p8.PrimaryPart or p8
    else
        v9 = p8
    end
    v9.CanTouch = false
    v_u_3:FireServer(p8)
    if p8.Name:find("ell") then
        v_u_4:Fire("ChristmasBell")
    else
        v_u_4:Fire("CollectEgg")
    end
    local v10 = v_u_6.Character
    if v10 then
        v10 = v_u_6.Character:FindFirstChild("HumanoidRootPart")
    end
    if v10 then
        task.spawn(v_u_5.CollectItem, v9, v10, nil, true, 8)
    end
    p8:Destroy()
end
function v7.OnInstanceAdded(p_u_11)
    -- upvalues: (copy) v_u_6
    local v12
    if p_u_11:IsA("Model") then
        v12 = p_u_11.PrimaryPart or p_u_11
    else
        v12 = p_u_11
    end
    v12.Touched:Connect(function(p13)
        -- upvalues: (ref) v_u_6, (copy) p_u_11
        if p13:IsDescendantOf(v_u_6.Character) then
            CollectEgg(p_u_11)
        end
    end)
    local v14 = Instance.new("ClickDetector", p_u_11)
    v14.MaxActivationDistance = 20
    v14.MouseClick:Connect(function()
        -- upvalues: (copy) p_u_11
        CollectEgg(p_u_11)
    end)
end
return v7

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnSpecialFloorUnlockerAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = v1.BindableEvents.GuiEvents.ToggleUnlockFloorFrame
local v_u_4 = game:GetService("Players").LocalPlayer
local v_u_5 = workspace.Camera
local v_u_6 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true, 1)
return {
    ["OnInstanceAdded"] = function(p7)
        -- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2, (copy) v_u_6, (copy) v_u_5
        if p7.Parent.Parent.Owner.Value == v_u_4 then
            local v8 = p7:WaitForChild("ScreenPart")
            local v9 = v8.Position
            local v10 = p7:WaitForChild("SurfaceGui"):WaitForChild("UnlockButton")
            local v11 = v10:WaitForChild("LockedIcon")
            local v12 = v8:WaitForChild("Attachment"):WaitForChild("ProximityPrompt")
            local v13 = Instance.new("UIScale", v10)
            v13:SetAttribute("EndScale", 1.025)
            v13:AddTag("SizableUI")
            local v_u_14 = p7:GetAttribute("AmountToUnlock")
            local v_u_15 = p7:GetAttribute("UnclockFloorName")
            local function v16()
                -- upvalues: (ref) v_u_3, (copy) v_u_15, (copy) v_u_14
                v_u_3:Fire(v_u_15, nil, nil, nil, v_u_14)
            end
            v10.Activated:Connect(v16)
            v12.Triggered:Connect(v16)
            v12.ObjectText = v_u_15:sub(1, -7) .. " floor"
            local v17 = v_u_2:Create(v11, v_u_6, {
                ["ImageTransparency"] = 1
            })
            while p7:IsDescendantOf(workspace) do
                local v18 = (v9 - v_u_5.CFrame.Position).Magnitude
                if v18 > 100 then
                    local v19 = task.wait
                    local v20 = (v18 - 100) / 100
                    v19(math.min(v20) + 2, 5)
                else
                    v17:Play()
                    v17.Completed:Wait()
                end
            end
        end
    end
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnAnimatedDropperAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1)
return {
    ["OnInstanceAdded"] = function(p3)
        -- upvalues: (copy) v_u_1, (copy) v_u_2
        while p3:GetAttribute("Animating") do
            p3:GetAttributeChangedSignal("Animating"):Wait()
        end
        local v4 = p3:WaitForChild("ForRotatingPart"):WaitForChild("Weld")
        local v5 = p3:WaitForChild("RotatingPart")
        v5.Anchored = false
        v5:WaitForChild("RotatingInfinity_" .. 1).Anchored = false
        v5:WaitForChild("RotatingInfinity_" .. 2).Anchored = false
        v5:WaitForChild("RotatingInfinity_" .. 3).Anchored = false
        v5:WaitForChild("RotatingInfinity_" .. 4).Anchored = false
        local v6 = v_u_1
        local v7 = v_u_2
        local v8 = {
            ["C0"] = CFrame.Angles(1.5707963267948966, 0, 0)
        }
        v6:Create(v4, v7, v8):Play()
    end
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnRedeemCodeMachineAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.Players.LocalPlayer
local v_u_2 = nil
return {
    ["OnInstanceAdded"] = function(p3)
        -- upvalues: (copy) v_u_1, (ref) v_u_2
        if p3.Parent.Parent.Owner.Value == v_u_1 then
            if not v_u_2 then
                v_u_2 = require(v_u_1.PlayerGui:WaitForChild("MainGui").MainGuiScript.ToggleFrameModule)
            end
            local v4 = Instance.new("ProximityPrompt", p3:WaitForChild("Main"))
            v4.ObjectText = "Redeem code machine"
            v4.ActionText = "Use"
            v4.MaxActivationDistance = 16
            v4.Triggered:Connect(function()
                -- upvalues: (ref) v_u_2
                v_u_2.ToggleFrame("RedeemCode")
            end)
        end
    end
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnSurfaceGuiForPGuiAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
return {
    ["OnInstanceAdded"] = function(p2)
        -- upvalues: (copy) v_u_1
        local v3 = p2.Parent
        task.wait()
        p2.ResetOnSpawn = false
        if not p2.Adornee then
            if not (v3 and (v3:IsA("BasePart") or v3:IsA("Attachment"))) then
                warn("Parent of the given surface gui isn\'t a basepart/attachment and no adornee was set", p2.Name)
                return
            end
            p2.Adornee = v3
        end
        p2.Parent = v_u_1
    end
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnThingUpgraderAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v3 = game:GetService("SoundService").Sound
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = v1.RemoteEvent.GuiEvent.GuiEventLocal
local v_u_7 = v1.RemoteFunction.UpgradeThingF
local v_u_8 = false
local v_u_9 = v1.AllModules.Upgrader
local v_u_10 = v3:WaitForChild("BuySound")
local v_u_11 = v3:WaitForChild("ClickSound")
local v12 = {}
function LoadData(p13)
    -- upvalues: (ref) v_u_4, (copy) v_u_2, (ref) v_u_5, (copy) v_u_9
    if not v_u_4 then
        v_u_4 = v_u_2:WaitForChild("leaderstats"):WaitForChild("Cash")
        v_u_5 = v_u_2:WaitForChild("Stats"):WaitForChild("Upgrades")
    end
    local v14 = GetUpgradeEffectiveName(p13)
    local v_u_15 = require(v_u_9[v14 .. "s"])
    local v_u_16 = v_u_5:WaitForChild(v_u_15.ValueName or v14 .. "Level")
    local v_u_17 = v_u_15.MaxLevel
    local v_u_18
    if v_u_15.GamepassName then
        v_u_18 = v_u_2.Stats:WaitForChild("GamePass"):WaitForChild(v_u_15.GamepassName)
    else
        v_u_18 = nil
    end
    return function()
        -- upvalues: (ref) v_u_18, (copy) v_u_16, (copy) v_u_17
        local v19 = v_u_18
        if v19 then
            v19 = v_u_18.Value
        end
        local v20 = not v19
        if v20 then
            v20 = v_u_16.Value < v_u_17
        end
        return v20
    end, function()
        -- upvalues: (copy) v_u_15, (copy) v_u_16
        return v_u_15[v_u_16.Value + 1].Price
    end, function()
        -- upvalues: (copy) v_u_15, (copy) v_u_16
        return v_u_15[v_u_16.Value + 1].LevelRequired or 0
    end
end
function GetUpgradeEffectiveName(p21)
    local v22 = ""
    for _, v23 in pairs(p21:split(" ")) do
        v22 = v22 .. v23:sub(1, 1):upper() .. v23:sub(2)
    end
    return v22:sub(1, -2)
end
function Upgrade(p24, p25, p26, p27)
    -- upvalues: (copy) v_u_11, (ref) v_u_8, (copy) v_u_2, (copy) v_u_6, (ref) v_u_4, (copy) v_u_7, (copy) v_u_10
    if p25() then
        v_u_11:Play()
        if v_u_8 then
            return
        elseif p27 and p27() > v_u_2.leaderstats.Level.Value then
            v_u_6:Fire("WrongMessage", "Higher level required")
            return
        elseif p26() > v_u_4.Value then
            v_u_6:Fire("WrongMessage", "Not enough cash")
        else
            v_u_8 = true
            local v28 = v_u_7:InvokeServer(p24)
            v_u_8 = false
            if v28 then
                v_u_10:Play()
            end
        end
    else
        return
    end
end
function v12.OnInstanceAdded(p29)
    -- upvalues: (copy) v_u_2, (copy) v_u_11
    local v30 = p29:WaitForChild("UpgraderSGui")
    local v31 = v30:WaitForChild("UpgradeBttn")
    local v32 = v30:FindFirstChild("GamepassBttn")
    if p29.Parent.Parent.Owner.Value == v_u_2 then
        v30:AddTag("SurfaceGuiForPGui")
        local v_u_33 = p29.Name
        local v_u_34, v_u_35, v_u_36 = LoadData(v_u_33)
        v31.Activated:Connect(function()
            -- upvalues: (copy) v_u_33, (copy) v_u_34, (copy) v_u_35, (copy) v_u_36
            Upgrade(v_u_33, v_u_34, v_u_35, v_u_36)
        end)
        if v32 then
            v32.Activated:Connect(function()
                -- upvalues: (ref) v_u_11, (ref) v_u_2
                v_u_11:Play()
                game:GetService("MarketplaceService"):PromptGamePassPurchase(v_u_2, 1115537965)
            end)
        end
    else
        if v32 then
            v32:Destroy()
        end
        v31:Destroy()
    end
end
return v12

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnToggleGuiButtonAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local v_u_2 = nil
return {
    ["OnInstanceAdded"] = function(p3)
        -- upvalues: (copy) v_u_1, (ref) v_u_2
        if p3:IsDescendantOf(v_u_1) then
            local v_u_4 = p3:GetAttribute("ToggleFrameName")
            p3.Activated:Connect(function()
                -- upvalues: (ref) v_u_2, (ref) v_u_1, (copy) v_u_4
                if not v_u_2 then
                    v_u_2 = require(v_u_1:WaitForChild("MainGui").MainGuiScript.ToggleFrameModule)
                end
                if v_u_4 then
                    v_u_2.ToggleFrame(v_u_4)
                else
                    v_u_2.CloseOpenedFrame()
                end
            end)
        end
    end
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnMachineForGuiAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("Players").LocalPlayer
local v_u_2 = nil
return {
    ["OnInstanceAdded"] = function(p3)
        -- upvalues: (copy) v_u_1, (ref) v_u_2
        local v4 = p3.Parent.Parent
        if v4.Owner.Value == v_u_1 then
            while v4:GetAttribute("IsBuilding") do
                v4:GetAttributeChangedSignal("IsBuilding"):Wait()
            end
            if not v_u_2 then
                v_u_2 = require(v_u_1:WaitForChild("PlayerGui"):WaitForChild("MainGui").MainGuiScript.ToggleFrameModule)
            end
            local v5 = p3:WaitForChild("ForItemPart")
            local v6 = Instance.new("Attachment", v5)
            v6.WorldCFrame = v5.CFrame + Vector3.new(0, 1.5, 0)
            local v7 = Instance.new("ProximityPrompt", v6)
            v7.MaxActivationDistance = 10
            v7.ActionText = "Open"
            if p3.Name == "Inventory presets" then
                v7.ObjectText = "Preset inventory"
                v7.Triggered:Connect(function()
                    -- upvalues: (ref) v_u_2
                    v_u_2.ToggleFrame("PresetInventoryFrame")
                end)
            else
                v7.ObjectText = "Customize tower"
                v7.Triggered:Connect(function()
                    -- upvalues: (ref) v_u_2
                    v_u_2.ToggleFrame("CustomisationFrame")
                end)
            end
        else
            return
        end
    end
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnHealingBubbleAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v_u_3 = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In)
local v_u_4 = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local v5 = {}
local v_u_6 = {}
function v5.OnInstanceAdded(p7)
    -- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_6, (copy) v_u_4
    local v8 = p7:IsA("Attachment")
    local v9, v10, v11
    if v8 then
        v9 = script.HealingBubble:Clone()
        v9.Position = p7.WorldPosition
        v9.Size = Vector3.new(0, 0, 0)
        v9.Parent = workspace
        v10 = p7:GetAttribute("Radius")
        v11 = Vector3.new(1, 1, 1)
    else
        v10 = p7.Size.Y
        v9 = p7
        v11 = Vector3.new(1, 0.5, 1)
    end
    local v12 = v9:FindFirstChild("BubbleOn")
    if v12 then
        v12:Play()
    end
    local v13 = 2 * v11 * v10
    local v14 = v_u_1
    local v15 = v_u_2
    local v16 = {
        ["Size"] = v13 * 1.1
    }
    local v17
    if v8 then
        v17 = nil
    else
        v17 = v9.Position + Vector3.new(0, 0.05, 0) * v10 or nil
    end
    v16.Position = v17
    local v18 = v14:Create(v9, v15, v16)
    v18:Play()
    v_u_6[p7] = v9
    v18.Completed:Wait()
    if v_u_6[p7] then
        local v19 = v_u_1
        local v20 = v_u_4
        local v21 = {
            ["Size"] = 0.9 * v13
        }
        local v22
        if v8 then
            v22 = nil
        else
            v22 = v9.Position - Vector3.new(0, 0.1, 0) * v10 or nil
        end
        v21.Position = v22
        v19:Create(v9, v20, v21):Play()
    end
end
function v5.OnInstanceRemoved(p23)
    -- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_3
    local v24 = v_u_6[p23]
    if v24 then
        v_u_6[p23] = nil
        local v25 = v24:FindFirstChild("BubbleOff")
        if not v25 then
            return
        end
        v25:Play()
        v_u_1:Create(v24, v_u_3, {
            ["Size"] = Vector3.new(0, 0, 0)
        }):Play()
        v25.Ended:Wait()
        v24:Destroy()
    end
end
return v5

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnCrateAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("Players")
local v_u_4 = v1.RemoteEvent.CollectCrate
local v_u_5 = v1.RemoteEvent.PlaySoundEvent.PlaySoundEventLocal
local v_u_6 = require(v1.AllModules.ItemAnimations)
local v_u_7 = require(v1.AllModules.UsefullFunction).HasPlayerTool
local v_u_8 = v3.LocalPlayer
local v_u_9 = v_u_8.UserId
local v10 = {}
function CollectCrate(p11)
    -- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_2, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
    p11.CanTouch = false
    local v12 = v_u_7("Crate finder", v_u_8)
    if v12 then
        local v13
        if v12:GetAttribute("TargetCrate") == p11.Name then
            v12:SetAttribute("OnlyClientFoundCrate", true)
            v13 = Color3.new(0, 1)
        else
            v13 = Color3.new(1)
        end
        local v14 = v12:FindFirstChild("ColoredSphere", true)
        if v14 then
            v14.Color = v13
            v_u_2:Create(v14, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Color"] = Color3.new(1, 1, 1)
            }):Play()
        end
    end
    v_u_4:FireServer(p11)
    v_u_5:Fire("SellSound")
    local v15 = v_u_8.Character
    if v15 then
        v15 = v_u_8.Character:FindFirstChild("HumanoidRootPart")
    end
    if v15 then
        task.spawn(v_u_6.CollectItem, p11, v15, nil, true, 8)
    end
    p11:Destroy()
end
function v10.OnInstanceAdded(p_u_16)
    -- upvalues: (copy) v_u_9, (copy) v_u_8
    local v17 = p_u_16:GetAttribute("ExclusiveTo")
    if not v17 or v17 == v_u_9 then
        p_u_16.Touched:Connect(function(p18)
            -- upvalues: (ref) v_u_8, (copy) p_u_16
            if p18:IsDescendantOf(v_u_8.Character) then
                CollectCrate(p_u_16)
            end
        end)
        local v19 = Instance.new("ClickDetector", p_u_16)
        v19.MaxActivationDistance = 20
        v19.MouseClick:Connect(function()
            -- upvalues: (copy) p_u_16
            CollectCrate(p_u_16)
        end)
    end
end
return v10

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnAnimatedSpinWheelAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1)
return {
    ["OnInstanceAdded"] = function(p3)
        -- upvalues: (copy) v_u_1, (copy) v_u_2
        v_u_1:Create(p3, v_u_2, {
            ["Rotation"] = 360
        }):Play()
    end
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnModelWithOptimizedSGAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local _ = require(v1.AllModules.FloorLevelComputation).GetFloorLevelFromYPosition
local v_u_2 = require(v1.AllModules.GetPotionValueFromLevel)
local v3 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local v4 = script.Health_OptimizedSG
local v5 = script.Lights_OptimizedSG
local v6 = script.Potion_OptimizedSG
local v7 = v6:Clone()
local v8 = v6:Clone()
function PotionGiverPrint(p9, p10, p11)
    -- upvalues: (copy) v_u_2
    local v12 = v_u_2(p9:sub(1, 4), p10 - 5)
    if p9 == "Health" then
        p11.Text = v12.Max .. "% \226\134\146 " .. v12.Max .. "HP"
    else
        p11.Text = p9 .. " potion\n<font size=\"38\"> " .. v12.Min .. "% \226\134\146 " .. v12.Max .. "% </font>"
    end
end
local v_u_13 = {
    ["Lights"] = {
        ["PreviousAdornee"] = nil,
        ["SG"] = v5
    },
    ["Jump"] = {
        ["SG"] = v7,
        ["TxtLabel"] = v7.DescriptionLabel,
        ["PrintFunction"] = PotionGiverPrint
    },
    ["Size"] = {
        ["SG"] = v8,
        ["TxtLabel"] = v8.DescriptionLabel,
        ["PrintFunction"] = PotionGiverPrint
    },
    ["Speed"] = {
        ["SG"] = v6,
        ["TxtLabel"] = v6.DescriptionLabel,
        ["PrintFunction"] = PotionGiverPrint
    },
    ["Health"] = {
        ["SG"] = v4,
        ["TxtLabel"] = v4.DescriptionLabel,
        ["PrintFunction"] = PotionGiverPrint
    }
}
local v_u_14 = {}
local v15 = {}
for v16, v17 in pairs(v_u_13) do
    v17.SG.Parent = v3
    v17.SG.Name = v16 .. "_OptimizedSG"
end
function GetOptimisedListForAllModels(p18)
    -- upvalues: (copy) v_u_14
    local v19 = v_u_14[p18]
    if not v19 then
        v19 = {
            ["Health"] = {},
            ["Lights"] = {},
            ["Speed"] = {},
            ["Jump"] = {},
            ["Size"] = {}
        }
        v_u_14[p18] = v19
    end
    return v19
end
function ExctractDescription(p20, p21)
    local v22 = p20:split(" ")
    local v23 = v22[1]
    local v24 = v22[#v22]
    local v25 = tonumber(v24:sub(2, -2))
    local v26 = nil
    local v27
    if v23 == "Lights" then
        v27 = v25 - 1
        if p21 then
            return v23, v27, p21:WaitForChild("BttnModel"):WaitForChild("SupportPart")
        end
    else
        v27 = v25 + 5
        if p21 then
            v26 = p21:WaitForChild("GlassCollisionPart")
        end
    end
    return v23, v27, v26
end
function v15.OnInstanceAdded(p28)
    local v29, v30, v31 = ExctractDescription(p28.Name, p28)
    local v32 = p28.Parent
    if v32 then
        GetOptimisedListForAllModels(v32)[v29][v30] = v31
    end
end
function v15.OnInstanceRemoved(p33)
    local v34, v35, _ = ExctractDescription(p33.Name, p33)
    local v36 = p33.Parent
    if v36 then
        v36 = GetOptimisedListForAllModels(v36)[v34]
    end
    if v36[v35] then
        v36[v35] = nil
    end
end
function v15.ChangeDisplay(p37, p38, p39)
    -- upvalues: (copy) v_u_14, (copy) v_u_13
    local v40 = p38 + 1
    local v41 = math.min(v40, p39)
    if p37 then
        p37 = v_u_14[p37]
    end
    for v42, v43 in pairs(v_u_13) do
        local v44, v45
        if p37 then
            v44 = p37[v42][v41]
            if v44 then
                v45 = v41
            else
                v44 = p37[v42][v41 - 1]
                v45 = v41 - 1
            end
        else
            v44 = nil
            v45 = nil
        end
        if v44 ~= v43.PreviousAdornee then
            v43.PreviousAdornee = v44
            v43.SG.Adornee = v44
            if v44 and v43.PrintFunction then
                v43.PrintFunction(v42, v45, v43.TxtLabel)
            end
        end
    end
end
return v15

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnLaserDoorSystemAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.AllModules.LaserDoorSystemDescription)
local v_u_4 = nil
local v_u_5 = v1.RemoteEvent.ChangeLaserDoorEvent
local v_u_6 = v1.RemoteEvent.GuiEvent.GuiEventLocal
local v_u_7 = v2.LocalPlayer
local v_u_8 = game:GetService("SoundService").Sound.ClickSound
local v9 = {}
function OnFrameForLaserAdded(p10)
    -- upvalues: (copy) v_u_8, (copy) v_u_5
    local v11 = p10.Name
    local v_u_12 = tonumber(v11)
    if p10:IsA("Frame") and v_u_12 > 0 then
        local v13 = p10:WaitForChild("RemoveButton")
        v13.Activated:Once(function()
            -- upvalues: (ref) v_u_8, (ref) v_u_5, (copy) v_u_12
            v_u_8:Play()
            v_u_5:FireServer(v_u_12, false)
        end)
        v13.BackgroundColor3 = Color3.new(1)
        v13.AutoButtonColor = true
    end
end
function v9.OnInstanceAdded(p14)
    -- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (ref) v_u_4
    if p14.Parent.Parent.Owner.Value == v_u_7 then
        local v15 = p14:WaitForChild("ProtectYourFloors_SG")
        v15:AddTag("SurfaceGuiForPGui")
        local v16 = v15:WaitForChild("BackF")
        local v17 = v16:WaitForChild("ScrollingFrame")
        local v18 = v16:WaitForChild("FrameForSelection"):WaitForChild("AddLaserButton")
        local v_u_19 = p14:WaitForChild("ScreenPart")
        for _, v20 in pairs(v17:GetChildren()) do
            OnFrameForLaserAdded(v20)
        end
        v17.ChildAdded:Connect(OnFrameForLaserAdded)
        v18.AutoButtonColor = true
        v18.Activated:Connect(function()
            -- upvalues: (ref) v_u_3, (ref) v_u_7, (ref) v_u_6, (ref) v_u_4, (copy) v_u_19
            if v_u_3.GetNumberOfLaserDoors(v_u_7.Settings.LaserProtectedFloors.Value) >= v_u_3.GetMaxNumberOfLaserDoorsAtPlrLevel(v_u_7.leaderstats.Level.Value) then
                v_u_6:Fire("WrongMessage", "Too many laser doors!")
            else
                if not v_u_4 then
                    v_u_4 = require(v_u_7.PlayerGui.MainGui.MainGuiScript.ToggleFrameModule)
                end
                v_u_4.ToggleFrame("FloorSelection", nil, nil, v_u_19)
            end
        end)
    end
end
return v9

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnDoorForKeyAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("MarketplaceService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v4 = game:GetService("Workspace")
local v_u_5 = game:GetService("Players").LocalPlayer
local v6 = v4.ContainersBuilding
local v_u_7 = v_u_5:WaitForChild("Stats"):WaitForChild("GamePass"):WaitForChild("FastDoorOpening")
local v_u_8 = v_u_5.Stats:WaitForChild("Upgrades"):WaitForChild("DoorLevel")
local v_u_9 = v_u_5.Stats:WaitForChild("Keys")
local v_u_10 = v_u_7.Value
local v_u_11 = v6:WaitForChild("InstanKeyPart")
local v_u_12 = v_u_11:WaitForChild("SurfaceGui")
local v13 = v_u_12:WaitForChild("BuyButton")
local v_u_14 = v2.ForKeys
local v_u_15 = v_u_14.KeyTemplate
local v_u_16 = v2.AllModules
local v_u_17 = require(v_u_16.CheckPosition).IsPlayerInContainer
local v_u_18 = require(v_u_16.MaterialBase).ApplyKeyAppearance
local v_u_19 = require(script.ChangeDoorAppearance)
local v_u_20 = require(v_u_16.Upgrader.DoorUpgrades)
local v_u_21 = require(v_u_16.GetTowerForPlayer)
local v_u_22 = require(v_u_16.A_Or_An)
local v_u_23 = nil
local v_u_24 = v2.RemoteEvent.GuiEvent.GuiEventLocal
local v25 = v6.DoorEvent
local v_u_26 = v6.OpenContainer
local v_u_27 = {}
local v_u_28 = {}
local v_u_29 = {}
local v_u_30 = {}
local v_u_31 = {}
local v_u_32 = {}
local v33 = {}
local v_u_34 = 1
function SetDoorOpeningTime(p35, p36)
    -- upvalues: (copy) v_u_20, (ref) v_u_34
    p35.HoldDuration = v_u_20.OpeningTime[p36] * v_u_34
end
function OnDoorLevelChanged()
    -- upvalues: (ref) v_u_34, (ref) v_u_10, (copy) v_u_8, (copy) v_u_29
    v_u_34 = v_u_10 and 0 or 1 - v_u_8.Value / 100
    for v37, v38 in pairs(v_u_29) do
        SetDoorOpeningTime(v38, v37)
    end
end
function OnHasFastDoorOpeningChanged()
    -- upvalues: (ref) v_u_10, (copy) v_u_7, (copy) v_u_12, (copy) v_u_11
    v_u_10 = v_u_7.Value
    OnDoorLevelChanged()
    v_u_12.Enabled = not v_u_10
    v_u_11.Transparency = v_u_10 and 1 or 0
end
function v33.OnInstanceAdded(p_u_39)
    -- upvalues: (copy) v_u_31, (copy) v_u_30, (copy) v_u_32, (copy) v_u_28, (ref) v_u_10, (copy) v_u_9, (copy) v_u_24, (copy) v_u_22, (copy) v_u_5, (copy) v_u_26, (copy) v_u_29, (copy) v_u_19, (copy) v_u_27
    local v40 = v_u_31
    table.insert(v40, p_u_39)
    local v_u_41 = p_u_39:WaitForChild("Door")
    local v_u_42 = p_u_39:WaitForChild("CollisionPart")
    local v_u_43 = p_u_39:GetAttribute("AssociatedKey"):split("_")
    local v44 = v_u_41:WaitForChild("MainDoorPart"):WaitForChild("ForBeamAtt")
    for _, v45 in pairs(v_u_43) do
        v_u_30[v45] = p_u_39
        v_u_32[v45] = v44
        if #v45 > 1 and not table.find(v_u_28, v45) then
            local v46 = v_u_28
            table.insert(v46, v45)
        end
    end
    local v_u_47 = v_u_41:WaitForChild("LockPart"):WaitForChild("ProximityPrompt")
    local v_u_48 = v_u_43[1]
    local v_u_49 = nil
    v_u_47.ObjectText = v_u_48:sub(1, 1):upper() .. v_u_48:sub(2, -5) .. " door"
    v_u_47.ActionText = "Open"
    if v_u_10 then
        v_u_47.HoldDuration = 0
    end
    v_u_42.CanCollide = true
    v_u_47.Enabled = not p_u_39:GetAttribute("IsOpened")
    local function v_u_50()
        -- upvalues: (ref) v_u_49, (copy) v_u_43, (copy) v_u_48, (copy) p_u_39, (ref) v_u_9, (copy) v_u_47, (ref) v_u_24, (ref) v_u_22
        v_u_49 = #v_u_43 == 1 and v_u_48 or p_u_39:GetAttribute("AppliedApperance")
        if v_u_9[v_u_49]:FindFirstChildOfClass("IntValue").Value <= 0 then
            v_u_47.Enabled = false
            v_u_24:Fire("WrongMessage", "You need " .. v_u_22(v_u_49, false) .. " to open this door")
            task.wait(2)
            v_u_47.Enabled = not p_u_39:GetAttribute("IsOpened")
            return false
        else
            if not p_u_39:GetAttribute("IsOpened") then
                return true
            end
            v_u_47.Enabled = false
            task.wait(1)
            v_u_47.Enabled = not p_u_39:GetAttribute("IsOpened")
            return false
        end
    end
    local v51 = v_u_47.PromptButtonHoldBegan:Connect(v_u_50)
    local v54 = v_u_47.Triggered:Connect(function()
        -- upvalues: (ref) v_u_10, (copy) v_u_50, (ref) v_u_5, (ref) v_u_26, (copy) p_u_39, (ref) v_u_49, (copy) v_u_47, (copy) v_u_42, (copy) v_u_41
        if v_u_10 and not v_u_50() then
            return
        else
            local v52 = 1
            local v53 = v_u_5.Character
            if v53 then
                v53 = v_u_5.Character:FindFirstChild("Twin keys")
            end
            if v53 then
                v52 = v53:GetAttribute("NumKeys")
            end
            if v_u_26:InvokeServer(p_u_39, v_u_49, v52) then
                v_u_47.Enabled = false
                task.wait(1)
                v_u_47.Enabled = true
            else
                p_u_39.RoofPart.SurfaceLight.Enabled = true
                v_u_42.CanCollide = false
                v_u_42.CanQuery = false
                OpenDoor(v_u_41, v_u_49, v52)
            end
        end
    end)
    v_u_29[v_u_48] = v_u_47
    SetDoorOpeningTime(v_u_47, v_u_48)
    local v55, v56
    if #v_u_43 > 1 then
        p_u_39:SetAttribute("AppliedApperance", v_u_48)
        p_u_39:SetAttribute("ClientAskedAppearance", v_u_48)
        local function v58()
            -- upvalues: (copy) p_u_39, (ref) v_u_19
            local v57 = p_u_39:GetAttribute("ServerForcedAppearance") or p_u_39:GetAttribute("ClientAskedAppearance")
            if p_u_39:GetAttribute("AppliedApperance") ~= v57 then
                v_u_19.ApplyCustomAppearance(p_u_39, v57)
            end
        end
        v55 = p_u_39:GetAttributeChangedSignal("ServerForcedAppearance"):Connect(v58)
        v56 = p_u_39:GetAttributeChangedSignal("ClientAskedAppearance"):Connect(v58)
        local v59 = p_u_39:GetAttribute("ServerForcedAppearance") or p_u_39:GetAttribute("ClientAskedAppearance")
        if p_u_39:GetAttribute("AppliedApperance") ~= v59 then
            v_u_19.ApplyCustomAppearance(p_u_39, v59)
        end
    else
        v55 = nil
        v56 = nil
    end
    v_u_27[v_u_48] = {
        v51,
        v54,
        v55,
        v56
    }
end
function v33.OnInstanceRemoved(p60)
    -- upvalues: (copy) v_u_31, (copy) v_u_29, (copy) v_u_30, (copy) v_u_32, (copy) v_u_27
    local v61 = table.find(v_u_31, p60)
    if v61 then
        table.remove(v_u_31, v61)
    end
    local v62 = p60:GetAttribute("AssociatedKey"):split("_")[1]
    v_u_29[v62] = nil
    for v63, v64 in pairs(v_u_30) do
        if v64 == p60 then
            v_u_30[v63] = nil
            v_u_32[v63] = nil
        end
    end
    local v65 = v_u_27[v62]
    if v65 then
        for _, v66 in pairs(v65) do
            v66:Disconnect()
        end
        table.clear(v65)
        v_u_27[v62] = nil
    end
end
local v_u_67 = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
function MakeWeld(p68, p69, p70)
    local v71 = Instance.new("Weld", p68)
    v71.C0 = p70
    v71.Part0 = p68
    v71.Part1 = p69
    return v71
end
local v_u_72 = { CFrame.new(-1.3, -0.55, 0, -0.5, 0.866, 0, 0.866, 0.5, 0, 0, 0, -1), CFrame.new(-1.25, -0.55, -0.4) * CFrame.fromOrientation(0, 2.9670597283903604, 1.0471975511965976), CFrame.new(-1.25, -0.55, 0.4) * CFrame.fromOrientation(0, 3.3161255787892263, 1.0471975511965976) }
function OpenDoor(p73, p74, p75)
    -- upvalues: (copy) v_u_5, (copy) v_u_15, (copy) v_u_18, (copy) v_u_14, (copy) v_u_72, (copy) v_u_3, (copy) v_u_67
    local v76 = p73.LockPart
    local v77 = p73.Parent.DoorPivotAtt
    local v78 = p73:GetAttribute("TargetAngle") or 2.0943951023931953
    v76.ProximityPrompt.Enabled = false
    local v79 = v_u_5:DistanceFromCharacter(p73.MainDoorPart.Position)
    if v79 > 0 and v79 < 100 then
        local v80 = v_u_15:Clone()
        v80.Parent = p73
        v80.CFrame = v76.CFrame * CFrame.new(-2.5, 0, 0) * CFrame.Angles(0, 0, 1.5707963267948966)
        v_u_18(p74, v80, false)
        if p75 >= 2 then
            local v81 = {}
            for v82 = 1, p75 - 1 do
                v81[v82] = v80:Clone()
            end
            local v83 = v_u_14.RingForKey:Clone()
            v83.Parent = v80
            MakeWeld(v80, v83, CFrame.new(-0.421, 1.194, 0, 0.924, 0.383, 0, -0.383, 0.924, 0, 0, 0, 1))
            for v84 = 1, p75 - 1 do
                local v85 = v81[v84]
                v85.Parent = v80
                v85.Anchored = false
                MakeWeld(v83, v85, v_u_72[v84])
            end
            table.clear(v81)
        end
        local v86 = v_u_3:Create(v80, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            ["CFrame"] = v76.CFrame * CFrame.new(-0.8, 0, 0) * CFrame.Angles(0, 0, 1.5707963267948966)
        })
        v86:Play()
        v86.Completed:Wait()
        p73.MainDoorPart.DoorHandle:Play()
        p73.MainDoorPart.OpenDoor:Play()
        local v87 = v_u_3:Create(v80, v_u_67, {
            ["CFrame"] = v80.CFrame * CFrame.Angles(0, -1.4835298641951802, 0)
        })
        v_u_3:Create(v76, v_u_67, {
            ["CFrame"] = v76.CFrame * CFrame.Angles(1.4835298641951802, 0, 0)
        }):Play()
        v87:Play()
        v87.Completed:Wait()
        local v88 = v77.WorldCFrame
        local v89 = 0
        while v89 < 0.6 do
            v89 = v89 + task.wait()
            local v90 = CFrame.Angles
            local v91 = v78 / 2
            local v92 = 5.235987755982989 * v89
            p73:PivotTo(v88 * v90(0, v91 * (1 - math.cos(v92)), 0))
        end
    end
    p73:PivotTo(v77.WorldCFrame * CFrame.Angles(0, v78, 0))
end
function CloseDoor(p93, p94)
    -- upvalues: (copy) v_u_17, (copy) v_u_5, (copy) v_u_21, (ref) v_u_23, (copy) v_u_16
    local v_u_95 = p93.Door
    local v96 = v_u_95.LockPart
    local v97 = p93.DoorPivotAtt
    local v98 = v_u_95:FindFirstChild("KeyTemplate")
    local v99 = p93.CollisionPart
    v99.CanCollide = true
    v99.CanQuery = true
    p93.RoofPart.SurfaceLight.Enabled = false
    if p94 then
        if v_u_17(v_u_5, p93, 1) then
            local v100 = v99.CFrame * CFrame.new(-v99.Size.X / 2 - 10, -v99.Size.Y / 2, 0) * CFrame.Angles(0, -1.5707963267948966, 0)
            local v101 = v_u_5.Character:FindFirstChild("Humanoid")
            local v102 = v_u_5.Character:FindFirstChild("HumanoidRootPart")
            if v102 then
                v102.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                v102.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                local v103 = v102.Size / 2
                v100 = v100 + Vector3.new(0, v103, 0)
            end
            if v101 then
                local v104 = v101.HipHeight
                v100 = v100 + Vector3.new(0, v104, 0)
            end
            v_u_5.Character:PivotTo(v100)
        end
        task.spawn(function()
            -- upvalues: (ref) v_u_21, (ref) v_u_5, (copy) v_u_95, (ref) v_u_23, (ref) v_u_16
            local v105 = v_u_21(v_u_5)
            if v105 then
                local v106 = v_u_5:DistanceFromCharacter(v_u_95:GetPivot().Position)
                if v106 > 0 and v106 <= 60 then
                    if not v_u_23 then
                        v_u_23 = require(v_u_16:WaitForChild("TeleportButton"))
                    end
                    v_u_23.EnableButton("Back to plot", v105.SpawnLocation.CFrame)
                end
            else
                return
            end
        end)
    end
    local v107 = v_u_5:DistanceFromCharacter(v_u_95.MainDoorPart.Position)
    if v107 > 0 and v107 < 100 then
        v_u_95.MainDoorPart.DoorHandle:Play()
        local v108 = 0
        local v109 = v_u_95:GetAttribute("TargetAngle") or 2.0943951023931953
        local v110
        if v98 then
            v110 = v98:FindFirstChildWhichIsA("BasePart")
        else
            v110 = v98
        end
        local v111
        if v98 then
            v111 = v98:FindFirstChild("KeyTemplate")
        else
            v111 = v98
        end
        local v112
        if v98 then
            v112 = v98:FindFirstChild("RingForKey")
        else
            v112 = v98
        end
        local v113 = v97.WorldCFrame
        while v108 < 0.6 do
            v108 = v108 + task.wait()
            local v114 = CFrame.Angles
            local v115 = v109 / 2
            local v116 = 5.235987755982989 * v108
            v_u_95:PivotTo(v113 * v114(0, v115 * (math.cos(v116) + 1), 0))
            if v98 then
                local v117 = v108 / 0.6
                v98.Transparency = v117
                if v110 then
                    v110.Transparency = v117
                end
                if v112 then
                    v112.Transparency = v117
                end
                if v111 then
                    v111.Transparency = v117
                end
                local v118 = (1 - v117) * 85
                local v119 = v98.Orientation.Y
                v98.Orientation = Vector3.new(v118, v119, 90)
                local v120 = (1 - v117) * 85
                local v121 = v96.Orientation.Y
                v96.Orientation = Vector3.new(v120, v121, 0)
            end
        end
    else
        task.wait(0.6)
    end
    if v98 then
        v98:Destroy()
    end
    v_u_95:PivotTo(v97.WorldCFrame)
    v96.Orientation = Vector3.new(0, 0, 0)
    v96.ProximityPrompt.Enabled = true
end
v25.OnClientEvent:Connect(function(p122, p123, p124, p125)
    -- upvalues: (copy) v_u_5
    if p122 then
        CloseDoor(p123, p122 == v_u_5)
    else
        OpenDoor(p123.Door, p124, p125)
    end
end)
v13.Activated:Connect(function()
    -- upvalues: (copy) v_u_1, (copy) v_u_5
    v_u_1:PromptGamePassPurchase(v_u_5, 1115537965)
end)
v_u_7.Changed:Connect(OnHasFastDoorOpeningChanged)
v_u_8.Changed:Connect(OnDoorLevelChanged)
OnHasFastDoorOpeningChanged()
v33.MultipleAppearanceDoors = v_u_28
v33.KeyNameToDoorForKey = v_u_30
v33.KeyNameToAtt = v_u_32
local v_u_126 = nil
local v_u_127 = nil
for _ = 1, 10 do
    local v129, _ = pcall(function()
        -- upvalues: (copy) v_u_1, (ref) v_u_126, (ref) v_u_127
        local v128 = v_u_1:GetProductInfo(1115537965, Enum.InfoType.GamePass)
        v_u_126 = v128.IconImageAssetId
        v_u_127 = v128.PriceInRobux
    end)
    if v129 and (v_u_127 and v_u_127 ~= 0) then
        break
    end
    task.wait(0.5)
end
if v_u_127 and v_u_127 ~= 0 then
    v13.ImageLabel.Image = v_u_126 and "rbxassetid://" .. v_u_126 or ""
    v13.Price.Text = utf8.char(57346) .. v_u_127
else
    v13.Price.Text = "?"
end
return v33

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnDoorForKeyAdded.ChangeDoorAppearance
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.AllModules.MaterialBase)
local v3 = workspace.ContainersBuilding
local v_u_4 = v3.Keys.DiamondKey
local v_u_5 = v1.ForKeys
local v_u_6 = v3.EmitterPart.ParticleEmitter
local v_u_7 = {
    "Wall-1",
    "Wall-2",
    "Wall-3",
    "MainDoorPart",
    "WalkableUnion",
    "WalkablePart",
    "TopPart"
}
local v_u_8 = {
    "Border-1",
    "Border-2",
    "Border-3",
    "Border-4",
    "LockPart",
    "LowPolyHalfSphere",
    "ForDoorPart",
    "GndPart",
    "RoofPart",
    "WayBorderPart-1",
    "WayBorderPart-2",
    "WayBorderWedgePart-1",
    "WayBorderWedgePart-2",
    "MiddleLinePart",
    "MiddleLineWedge",
    "MainTopGift",
    "YellowThing"
}
local v_u_9 = {
    "CylinderForRSpherePart",
    "CylinderForLSpherePart",
    "LSpherePart",
    "RSpherePart"
}
function ChangeDoorTxt(p10, p11)
    p10.ScreenPart.SurfaceGui.TextLabel.Text = p11
    local v12, v13 = p11:find("\n", nil, true)
    if v12 then
        p11 = p11:sub(1, v12 - 1) .. " " .. p11:sub(v13 + 1, -1)
    end
    p10.Door.LockPart.ProximityPrompt.ObjectText = p11
end
function AddPartIn(p14, p15)
    local v16 = p15 and Instance.fromExisting(p15) or Instance.new("Part")
    v16.Parent = p14
    v16.CanTouch = false
    v16.CanCollide = false
    v16.CanQuery = false
    local v17 = Instance.new("Weld", v16)
    v17.Part0 = p14
    v17.Part1 = v16
    return v16, v17
end
local v18 = {}
local v_u_55 = {
    ["diamond key"] = function(p19)
        -- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_6
        ChangeAppearance(p19, { "MainDoorPart" }, Color3.fromRGB(9, 137, 207), 0.5, Enum.Material.Glass)
        ChangeAppearance(p19, { "GndPart" }, Color3.fromRGB(4, 175, 236), 0.5, Enum.Material.Glass)
        ChangeAppearance(p19, { "RoofPart" }, Color3.fromRGB(128, 187, 219), 0.5, Enum.Material.Glass)
        ChangeAppearance(p19, {
            "Wall-1",
            "Wall-2",
            "Wall-3",
            "Border-1",
            "Border-2",
            "Border-3",
            "Border-4",
            "LockPart",
            "ForDoorPart"
        }, Color3.fromRGB(16, 42, 220), 0.5, Enum.Material.Glass)
        local _ = p19.Door
        ChangeDoorTxt(p19, "Diamond door")
        p19.RoofPart.SurfaceLight.Brightness = 3
        v_u_2.ApplyKeyAppearance("diamond key", v_u_4, false, true)
        v_u_6.Color = ColorSequence.new(Color3.fromRGB(70, 252, 255))
    end,
    ["infinity key"] = function(p20)
        -- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
        ChangeAppearance(p20, { "GndPart", "MainDoorPart" }, Color3.fromRGB(125, 129, 144), 0, Enum.Material.Plastic)
        ChangeAppearance(p20, { "RoofPart" }, Color3.fromRGB(161, 167, 186), 0, Enum.Material.Plastic)
        ChangeAppearance(p20, {
            "Wall-1",
            "Wall-2",
            "Wall-3",
            "Border-1",
            "Border-2",
            "Border-3",
            "Border-4",
            "LockPart",
            "ForDoorPart"
        }, Color3.new(1, 1, 1), 0, Enum.Material.Plastic)
        local v21 = p20.Door
        ChangeDoorTxt(p20, "Infinity door")
        p20.RoofPart.SurfaceLight.Brightness = 1.5
        v_u_2.ApplyKeyAppearance("infinity key", v_u_4, false, true)
        v_u_6.Color = ColorSequence.new(Color3.new(0.8, 0.85, 0.8))
        local v22 = v21:FindFirstChild("Infinity")
        if v22 then
            v22.Transparency = 0
        else
            v22 = v_u_5.Infinity:Clone()
            v22.Size = Vector3.new(8, 1.1, 4)
            v22.Parent = v21
            local v23 = Instance.new("Weld", v22)
            v23.Part0 = v22
            v23.Part1 = v21.MainDoorPart
            v23.C0 = CFrame.fromOrientation(0, 1.5707963267948966, 1.5707963267948966)
            v23.C1 = CFrame.new(0, 3, 0)
        end
        local v24 = p20:FindFirstChild("Infinity")
        if v24 then
            v24.Transparency = 0
        else
            local v25 = v22:Clone()
            v25.Color = Color3.fromRGB(125, 129, 144)
            v25.Weld.Part1 = p20["Wall-3"]
            v25.Weld.C1 = CFrame.new(0, 2.5, 0)
            v25.Size = Vector3.new(8, 0.25, 4)
            v25.Parent = p20
        end
    end,
    ["absolute infinity key"] = function(p26)
        -- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
        ChangeAppearance(p26, {
            "Wall-1",
            "Wall-2",
            "Wall-3",
            "MainDoorPart"
        }, Color3.fromRGB(56, 14, 94), 0, Enum.Material.Plastic)
        ChangeAppearance(p26, { "RoofPart" }, Color3.fromRGB(87, 33, 165), 0, Enum.Material.Plastic)
        ChangeAppearance(p26, {
            "Border-1",
            "Border-2",
            "Border-3",
            "Border-4",
            "LockPart",
            "ForDoorPart",
            "GndPart"
        }, Color3.new(), 0, Enum.Material.Plastic)
        local v27 = p26.Door
        ChangeDoorTxt(p26, "Absolute infinity door")
        p26.RoofPart.SurfaceLight.Brightness = 2.5
        v_u_2.ApplyKeyAppearance("absolute infinity key", v_u_4, false, true)
        v_u_6.Color = ColorSequence.new(Color3.fromRGB(87, 33, 165))
        local v28 = v27:FindFirstChild("OMEGA")
        if v28 then
            v28.Transparency = 0
        else
            v28 = v_u_5.OMEGA:Clone()
            v28.Size = Vector3.new(5.528, 1.1, 5.433)
            v28.Material = Enum.Material.Neon
            v28.Color = Color3.new(1, 1, 1)
            v28.Parent = v27
            local v29 = Instance.new("Weld", v28)
            v29.Part0 = v28
            v29.Part1 = v27.MainDoorPart
            v29.C0 = CFrame.fromOrientation(0, 1.5707963267948966, 1.5707963267948966)
            v29.C1 = CFrame.new(0, 3, 0)
        end
        local v30 = p26:FindFirstChild("OMEGA")
        if v30 then
            v30.Transparency = 0
        else
            local v31 = v28:Clone()
            v31.Weld.Part1 = p26["Wall-3"]
            v31.Weld.C1 = CFrame.new(0, 2.5, 0)
            v31.Size = Vector3.new(5.528, 0.25, 5.433)
            v31.Parent = p26
        end
    end,
    ["terminusfinity key"] = function(p32)
        -- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
        ChangeAppearance(p32, {
            "Wall-1",
            "Wall-2",
            "Wall-3",
            "MainDoorPart"
        }, Color3.fromRGB(51, 88, 130), 0, Enum.Material.Plastic)
        ChangeAppearance(p32, {
            "Border-1",
            "Border-2",
            "Border-3",
            "Border-4",
            "LockPart",
            "ForDoorPart",
            "GndPart",
            "RoofPart"
        }, Color3.fromRGB(27, 42, 53), 0, Enum.Material.Plastic)
        local v33 = p32.Door
        ChangeDoorTxt(p32, "Terminusfinity door")
        p32.RoofPart.SurfaceLight.Brightness = 2.5
        v_u_2.ApplyKeyAppearance("terminusfinity key", v_u_4, false, true)
        v_u_6.Color = ColorSequence.new(Color3.fromRGB(51, 88, 130))
        local v34 = v33.MainDoorPart:FindFirstChild("TerminusfinitySymbol")
        if v34 then
            v34.Transparency = 0
        else
            local v35
            v34, v35 = AddPartIn(v33.MainDoorPart, v_u_5.TerminusfinitySymbol)
            v34.Size = Vector3.new(6, 1.1, 6)
            v34.Material = Enum.Material.Neon
            v34.Color = Color3.new(1, 1, 1)
            v35.C0 = CFrame.new(0, 2.2, 0)
            v35.C1 = CFrame.fromOrientation(0, 1.5707963267948966, 1.5707963267948966)
        end
        local v36 = p32["Wall-3"]:FindFirstChild("TerminusfinitySymbol")
        if v36 then
            v36.Transparency = 0
        else
            local v37, v38 = AddPartIn(p32["Wall-3"], v34)
            v37.Size = Vector3.new(6, 0.25, 6)
            v38.C0 = CFrame.new(0, 2.5, 0)
            v38.C1 = CFrame.fromOrientation(0, 1.5707963267948966, 1.5707963267948966)
        end
        local v39, v40 = AddPartIn(v33.MainDoorPart)
        v39.Shape = Enum.PartType.Cylinder
        v39.Material = Enum.Material.Neon
        v39.Size = Vector3.new(1.1, 1.2, 1.2)
        v39.Color = Color3.new(1, 1, 1)
        v39.Name = "CY1"
        v40.C0 = CFrame.new(0, -5.8, 4.5)
        local v41, v42 = AddPartIn(v33.MainDoorPart, v39)
        v41.Name = "CY2"
        v42.C0 = CFrame.new(0, -5.8, -4.6)
        local v43, v44 = AddPartIn(v33.MainDoorPart, v39)
        v43.Name = "CY3"
        v44.C0 = CFrame.new(0, 5.8, 4.5)
        local v45, v46 = AddPartIn(v33.MainDoorPart, v39)
        v45.Name = "CY4"
        v46.C0 = CFrame.new(0, 5.8, -4.6)
    end,
    ["red christmas key"] = function(p47)
        -- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_9, (copy) v_u_2
        ChangeAppearance(p47, { "MainUnion" }, Color3.fromRGB(255, 0, 0), 0, Enum.Material.SmoothPlastic)
        ChangeAppearance(p47, v_u_8, Color3.fromRGB(255, 200, 0), 0, Enum.Material.SmoothPlastic)
        ChangeAppearance(p47, v_u_7, Color3.fromRGB(151, 0, 0), 0, Enum.Material.SmoothPlastic)
        ChangeAppearance(p47, v_u_9, Color3.fromRGB(81, 255, 0), 0, Enum.Material.SmoothPlastic)
        v_u_2.ApplyKeyAppearance("red christmas key", p47.SantaClaus.ChristmasKey, nil, true)
        p47:FindFirstChild("BlueSurfaceLight", true).Brightness = 7.5
        p47:FindFirstChild("YellowSurfaceLight", true).Brightness = 2
        p47:FindFirstChild("GreenSurfaceLight", true).Brightness = 6
        ChangeDoorTxt(p47, "Red christmas\ndoor")
    end,
    ["cyan christmas key"] = function(p48)
        -- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_9, (copy) v_u_2
        ChangeAppearance(p48, { "MainUnion" }, Color3.new(0, 1, 1), 0.35, Enum.Material.SmoothPlastic)
        ChangeAppearance(p48, v_u_8, Color3.new(0.6, 0, 1), 0.35, Enum.Material.SmoothPlastic)
        ChangeAppearance(p48, v_u_7, Color3.fromRGB(34, 167, 255), 0.35, Enum.Material.SmoothPlastic)
        ChangeAppearance(p48, v_u_9, Color3.new(0.5, 0.05, 0.65), 0.35, Enum.Material.SmoothPlastic)
        v_u_2.ApplyKeyAppearance("cyan christmas key", p48.SantaClaus.ChristmasKey, nil, true)
        p48:FindFirstChild("BlueSurfaceLight", true).Brightness = 3.75
        p48:FindFirstChild("YellowSurfaceLight", true).Brightness = 1
        p48:FindFirstChild("GreenSurfaceLight", true).Brightness = 3
        ChangeDoorTxt(p48, "Cyan christmas\ndoor")
    end,
    ["winter key"] = function(p49)
        -- upvalues: (copy) v_u_2
        ChangeAppearance(p49, {
            "Border-1",
            "Border-2",
            "Border-3",
            "Border-4",
            "LockPart",
            "ForDoorPart",
            "LowPolyHalfSphere",
            "Wall-1",
            "Wall-2",
            "Wall-3",
            "RoofPart"
        }, Color3.fromRGB(95, 193, 220), 0, Enum.Material.Glacier)
        ChangeAppearance(p49, p49.LightBlueParts:GetChildren(), Color3.fromRGB(95, 193, 220), 0, Enum.Material.Glacier)
        ChangeAppearance(p49, p49.DarkBlueParts:GetChildren(), Color3.fromRGB(96, 138, 255), 0, Enum.Material.Snow)
        ChangeAppearance(p49, p49.Stairs:GetChildren(), Color3.fromRGB(96, 138, 255), 0, Enum.Material.Snow)
        ChangeAppearance(p49, p49.AllWalls:GetChildren(), Color3.new(1, 1, 1), 0, Enum.Material.Snow)
        ChangeAppearance(p49, { "MainDoorPart" }, Color3.fromRGB(213, 237, 255), 0, Enum.Material.Snow)
        ChangeAppearance(p49, { "GndPart" }, Color3.new(1, 1, 1), 0, Enum.Material.Snow)
        for _, v50 in pairs(p49.IceSpikes:GetDescendants()) do
            if v50:IsA("BasePart") then
                v50.Transparency = 1
            end
        end
        v_u_2.ApplyKeyAppearance("winter key", p49.Snowman.Key, false, true)
        ChangeDoorTxt(p49, "Winter door")
    end,
    ["frozen key"] = function(p51)
        -- upvalues: (copy) v_u_2
        local v52 = Color3.fromRGB(37, 251, 255)
        local v53 = Color3.fromRGB(183, 243, 255)
        ChangeAppearance(p51, {
            "Border-1",
            "Border-2",
            "Border-3",
            "Border-4",
            "LockPart",
            "ForDoorPart",
            "LowPolyHalfSphere",
            "Wall-1",
            "Wall-2",
            "Wall-3",
            "RoofPart"
        }, v52, 0, Enum.Material.Foil)
        ChangeAppearance(p51, p51.LightBlueParts:GetChildren(), Color3.fromRGB(37, 251, 255), 0, Enum.Material.Foil)
        ChangeAppearance(p51, p51.Stairs:GetChildren(), Color3.fromRGB(149, 204, 255), 0.5, Enum.Material.Foil)
        ChangeAppearance(p51, p51.AllWalls:GetChildren(), v53, 0.5, Enum.Material.Foil)
        ChangeAppearance(p51, p51.DarkBlueParts:GetChildren(), v52, 0.5, Enum.Material.Foil)
        ChangeAppearance(p51, { "MainDoorPart" }, v53, 0, Enum.Material.Snow)
        ChangeAppearance(p51, { "GndPart" }, Color3.fromRGB(183, 243, 255), 0.25, Enum.Material.Ice)
        for _, v54 in pairs(p51.IceSpikes:GetDescendants()) do
            if v54:IsA("BasePart") then
                v54.Transparency = 0
            end
        end
        v_u_2.ApplyKeyAppearance("frozen key", p51.Snowman.Key, false, true)
        ChangeDoorTxt(p51, "Frozen door")
    end
}
local v_u_68 = {
    ["infinity key"] = function(p56)
        local v57 = p56.Door:FindFirstChild("Infinity")
        if v57 then
            v57.Transparency = 1
        end
        local v58 = p56:FindFirstChild("Infinity")
        if v58 then
            v58.Transparency = 1
        end
    end,
    ["absolute infinity key"] = function(p59)
        local v60 = p59.Door:FindFirstChild("OMEGA")
        if v60 then
            v60.Transparency = 1
        end
        local v61 = p59:FindFirstChild("OMEGA")
        if v61 then
            v61.Transparency = 1
        end
    end,
    ["terminusfinity key"] = function(p62)
        local v63 = p62.Door.MainDoorPart
        local v64 = v63:FindFirstChild("TerminusfinitySymbol")
        if v64 then
            v64.Transparency = 1
        end
        local v65 = p62["Wall-3"]:FindFirstChild("TerminusfinitySymbol")
        if v65 then
            v65.Transparency = 1
        end
        for v66 = 1, 4 do
            local v67 = v63:FindFirstChild("CY" .. v66)
            if v67 then
                v67:Destroy()
            end
        end
    end
}
function ChangeAppearance(p69, p70, p71, p72, p73)
    for _, v74 in pairs(p70) do
        local v75
        if typeof(v74) == "string" then
            v75 = p69:FindFirstChild(v74, true) or v74
        else
            v75 = v74
        end
        if v75 then
            v75.Reflectance = p72
            v75.Material = p73
            v75.Color = p71
        else
            print("Not foud", v74)
        end
    end
end
function v18.ApplyCustomAppearance(p76, p77)
    -- upvalues: (copy) v_u_68, (copy) v_u_55
    local v78 = p76:GetAttribute("AppliedApperance")
    if v78 and v_u_68[v78] then
        v_u_68[v78](p76)
    end
    v_u_55[p77](p76, v78)
    p76:SetAttribute("AppliedApperance", p77)
end
return v18

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript.Client_OnBunnyEggAdded
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = require(game:GetService("ReplicatedStorage"):WaitForChild("AllModules"):WaitForChild("ItemAnimations"))
local v_u_3 = nil
local v_u_4 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v_u_5 = script.EggTrail
return {
    ["OnInstanceAdded"] = function(p6, p7)
        -- upvalues: (copy) v_u_1, (copy) v_u_4
        local v8 = p6.Size
        local v9 = p6.Position
        if not p7 then
            p6.Size = Vector3.new(0, 0, 0)
            local v10 = 1 + v8.Y / 2
            p6.Position = v9 - Vector3.new(0, v10, 0)
            v_u_1:Create(p6, v_u_4, {
                ["Size"] = v8,
                ["Position"] = v9
            }):Play()
        end
    end,
    ["OnInstanceRemoved"] = function(p11)
        -- upvalues: (copy) v_u_5, (ref) v_u_3, (copy) v_u_2
        p11:RemoveTag("BunnyEgg")
        local v12 = Instance.new("Attachment", p11)
        v12.Parent = p11
        v12.CFrame = CFrame.new(0, 2, 0)
        local v13 = Instance.new("Attachment", p11)
        v13.Parent = p11
        v13.CFrame = CFrame.new(0, -2, 0)
        local v14 = v_u_5:Clone()
        v14.Parent = p11
        v14.Attachment0 = v12
        v14.Attachment1 = v13
        v14.Color = ColorSequence.new(p11:GetAttribute("EggColor"))
        if not (v_u_3 and v_u_3:IsDescendantOf(workspace)) then
            local v15 = workspace.Terrain.EventOnlyTerrain:FindFirstChild("BunnyBuilding")
            if v15 then
                v15 = v15:FindFirstChild("SpawnPart")
            end
            v_u_3 = v15
        end
        v_u_2.CollectItem(p11, v_u_3, 1, nil, 10)
    end
}

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.WeaponFire.NormalFireModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1:WaitForChild("AllModules"):WaitForChild("CharacterSize"):WaitForChild("GetCharacterScale"))
local v_u_4 = require(v1.AllModules:WaitForChild("WeaponStats"))
local v_u_5 = require(script:WaitForChild("TrailModule"))
local v_u_6 = require(script:WaitForChild("Effects"))
local v_u_7 = v1.RemoteEvent.WeaponEvent.ReplicateHit
local v8 = {}
local v_u_9 = v_u_4.BulletLifeTime
function v8.AnimateFire(p10, p11, p12, p13, p14, p15)
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_9
    local v16 = RaycastParams.new()
    v16.FilterDescendantsInstances = { p12 }
    v16.FilterType = Enum.RaycastFilterType.Exclude
    v16.CollisionGroup = "FireGroup"
    local v17 = 0.25 + ((v_u_2:GetPlayerFromCharacter(p12) and v_u_3(p12) or p12:GetScale()) - 1) * 0.1
    local v18 = v_u_4[p13].Speed
    local v19 = 18 / v18
    local v20 = v_u_5.new(p10, v19, v17)
    if p15 then
        v20.Owned = true
        v20.UniqueId = p15
    end
    v20.ShowEffects = p14
    v20.RcP = v16
    local v21 = (p11 - v20.CurrentPosition).Unit
    local v22 = task.wait()
    local v23 = 0
    while v23 + v22 < v_u_9 and not v20.HasTouched do
        v23 = v23 + v22
        local v24 = v21 * v18 * v22
        CastRay(v20, v24)
        if v20.HasTouched then
            break
        end
        v20.CurrentPosition = v20.CurrentPosition + v21 * v18 * v22
        v20:MoveAttachments()
        v22 = task.wait()
    end
    task.wait(v19)
    v20:Clear()
end
function CastRay(p25, p26)
    local v27 = workspace:Raycast(p25.CurrentPosition, p26, p25.RcP)
    if v27 and v27.Normal then
        p25.CurrentPosition = v27.Position
        p25:MoveAttachments()
        p25.HasTouched = true
        OnHit(p25, v27)
    end
end
function IsDamageable(p28)
    if not p28 then
        return false
    end
    local v29 = p28:FindFirstAncestorOfClass("Model")
    return v29 and v29:FindFirstChild("Humanoid") and true or (p28:HasTag("DamageableInstance") and true or (v29 and v29:HasTag("DamageableInstance") and true or false))
end
function OnHit(p30, p31)
    -- upvalues: (copy) v_u_7, (copy) v_u_6
    local v32 = p31.Instance
    if IsDamageable(v32) then
        if p30.Owned and v32 then
            local v33 = p31.Position - v32.Position
            v_u_7:FireServer(p30.UniqueId, v32, v33)
        end
        if p30.ShowEffects then
            task.spawn(v_u_6.AddHitMark, v32, p31.Position)
        end
    else
        task.spawn(v_u_6.AddBulletHole, p31, p30.TrailSize)
        return
    end
end
return v8

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.WeaponFire.NormalFireModule.TrailModule
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = workspace.Terrain
local v_u_2 = {}
v_u_2.__index = v_u_2
local v_u_3 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 160)), ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 100)) })
local v_u_4 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.01, 0.25),
    NumberSequenceKeypoint.new(0.025, 0.5),
    NumberSequenceKeypoint.new(0.05, 0.85),
    NumberSequenceKeypoint.new(0.1, 1),
    NumberSequenceKeypoint.new(0.5, 0.75),
    NumberSequenceKeypoint.new(0.75, 0.4),
    NumberSequenceKeypoint.new(1, 0)
})
function v_u_2.new(p5, p6, p7)
    -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
    local v8 = v_u_2
    local v9 = setmetatable({}, v8)
    v9.CurrentPosition = p5
    v9.TrailSize = p7
    v9:BuildAttachments()
    local v10 = Instance.new("Trail", v_u_1)
    v10.Attachment0 = v9.TopAtt
    v10.Attachment1 = v9.LowAtt
    v10.Lifetime = p6
    v10.Brightness = 2
    v10.LightEmission = 0.5
    v10.FaceCamera = true
    v10.LightInfluence = 0
    v10.Color = v_u_3
    v10.WidthScale = v_u_4
    v9.Trail = v10
    return v9
end
function v_u_2.BuildAttachments(p11)
    -- upvalues: (copy) v_u_1
    local v12 = Instance.new("Attachment", v_u_1)
    local v13 = Instance.new("Attachment", v_u_1)
    p11.TopAtt = v12
    p11.LowAtt = v13
    p11:MoveAttachments()
end
function v_u_2.MoveAttachments(p14)
    local v15 = p14.TopAtt
    local v16 = p14.CurrentPosition
    local v17 = p14.TrailSize / 2
    v15.WorldPosition = v16 + Vector3.new(0, v17, 0)
    local v18 = p14.LowAtt
    local v19 = p14.CurrentPosition
    local v20 = p14.TrailSize / 2
    v18.WorldPosition = v19 - Vector3.new(0, v20, 0)
end
function v_u_2.Clear(p21)
    p21.TopAtt:Destroy()
    p21.LowAtt:Destroy()
    p21.Trail:Destroy()
    table.clear(p21)
end
return v_u_2

--========================================
-- ModuleScript : StarterPlayer.StarterPlayerScripts.WeaponFire.NormalFireModule.Effects
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("Debris")
local v_u_3 = require(game:GetService("ReplicatedStorage").AllModules.IsHeadShot)
local v_u_4 = script:WaitForChild("BulletHole")
local v_u_5 = workspace.Camera
local v_u_6 = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui")
local v_u_7 = script:WaitForChild("HitMark")
local v_u_8 = game:GetService("SoundService"):WaitForChild("Sound"):WaitForChild("Hitmark")
local v16 = {
    ["AddHitMark"] = function(p9, p_u_10)
        -- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (copy) v_u_1
        if v_u_8.IsPlaying then
            v_u_8:Stop()
        end
        v_u_8:Play()
        local v_u_11, v12 = v_u_5:WorldToScreenPoint(p_u_10)
        if v12 then
            local v_u_13 = v_u_7:Clone()
            if v_u_3(p9) then
                v_u_13.ImageColor3 = Color3.new(1, 0.2, 0.2)
            end
            v_u_13.Position = UDim2.fromOffset(v_u_11.X, v_u_11.Y)
            v_u_13.Parent = v_u_6
            local v14 = task.spawn(function()
                -- upvalues: (ref) v_u_11, (ref) v_u_5, (copy) p_u_10, (copy) v_u_13
                while task.wait() do
                    v_u_11 = v_u_5:WorldToScreenPoint(p_u_10)
                    v_u_13.Position = UDim2.fromOffset(v_u_11.X, v_u_11.Y)
                end
            end)
            task.wait(0.3)
            local v15 = v_u_1:Create(v_u_13, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
                ["ImageTransparency"] = 1
            })
            v15:Play()
            v15.Completed:Wait()
            v_u_13:Destroy()
            task.cancel(v14)
        end
    end
}
local v_u_17 = TweenInfo.new(1, Enum.EasingStyle.Linear)
function v16.AddBulletHole(p18, p19)
    -- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_1, (copy) v_u_17, (copy) v_u_2
    local v20 = p18.Instance
    if v20 then
        if (v_u_5.CFrame.Position - p18.Position).Magnitude <= 300 then
            local v21 = v_u_4:Clone()
            v21.Parent = v20
            v21.CFrame = CFrame.lookAlong(p18.Position, p18.Normal)
            v21.Size = p19 * 1.5 * Vector3.new(1, 1, 0) + Vector3.new(0, 0, 0.01)
            if not v20.Anchored then
                v21.Anchored = false
                local v22 = Instance.new("WeldConstraint", v21)
                v22.Part0 = v21
                v22.Part1 = v20
            end
            task.wait(2)
            local v23 = v21:FindFirstChild("bullethole")
            if v23 then
                v_u_1:Create(v23, v_u_17, {
                    ["Transparency"] = 1
                }):Play()
            end
            v_u_2:AddItem(v21, 1.5)
        end
    else
        return
    end
end
return v16
