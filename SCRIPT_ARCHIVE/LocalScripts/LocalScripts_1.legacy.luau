
--========================================
-- LocalScript : StarterPlayer.StarterCharacterScripts.LocalToolScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players").LocalPlayer
local v_u_3 = v2:GetMouse()
local v4 = v2.Character or v2.CharacterAdded:Wait()
local v5 = v4:WaitForChild("Humanoid")
local v_u_6 = v4:WaitForChild("HumanoidRootPart")
local v_u_7 = v5:WaitForChild("Animator")
local v_u_8 = v1.Animation
v2.CameraMaxZoomDistance = game:GetService("StarterPlayer").CameraMaxZoomDistance
local v_u_9 = require(v1.AllModules.WeaponStats)
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = v1.AllModules.ToolModules
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
local v_u_24 = {}
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = nil
function LoadAnimationOn(p30)
    -- upvalues: (copy) v_u_9, (copy) v_u_24, (copy) v_u_8, (copy) v_u_7
    local v31 = v_u_9[p30].AnimationType or "Default"
    local v32 = v_u_24[v31]
    if not v32 then
        v32 = {}
        for _, v33 in pairs({ "Fire", "Equip", "Reload" }) do
            local v34 = v_u_8[v31]:FindFirstChild(v33 .. v31)
            if v34 then
                v34 = v_u_7:LoadAnimation(v34)
            end
            v32[v33] = v34
        end
        v_u_24[v31] = v32
    end
    return v32.Equip, v32.Fire, v32.Reload
end
v4.ChildAdded:Connect(function(p_u_35)
    -- upvalues: (ref) v_u_18, (copy) v_u_12, (copy) v_u_6, (ref) v_u_17, (ref) v_u_28, (copy) v_u_7, (copy) v_u_8, (ref) v_u_29, (ref) v_u_26, (ref) v_u_27, (ref) v_u_14, (copy) v_u_3, (ref) v_u_22, (ref) v_u_25, (ref) v_u_16, (ref) v_u_20, (ref) v_u_23, (ref) v_u_21, (ref) v_u_15, (ref) v_u_13, (ref) v_u_19, (ref) v_u_10, (ref) v_u_11
    if not p_u_35:IsA("Tool") then
        return
    end
    local v36 = p_u_35.Name
    if p_u_35:HasTag("KeyTool") then
        if not v_u_18 then
            v_u_18 = require(v_u_12.LocalKeyModule)
        end
        v_u_18.Enable(p_u_35, v_u_6)
    else
        if not p_u_35:HasTag("HitWeapon") then
            if not p_u_35:HasTag("FiringWeapon") then
                if v36:find("potion") then
                    if not v_u_22 then
                        v_u_22 = require(v_u_12.PotionModule)
                    end
                    if not v_u_25 then
                        v_u_25 = v_u_7:LoadAnimation(v_u_8.Drink)
                    end
                    v_u_22.Enable(p_u_35, v_u_25)
                elseif v36 == "Spring hand" then
                    if not v_u_16 then
                        v_u_16 = require(v_u_12.SpringHandModule)
                    end
                    v_u_16.Enable(p_u_35)
                elseif p_u_35:HasTag("PlacableTool") then
                    if not v_u_20 then
                        v_u_20 = require(v_u_12.PlacablesModule)
                    end
                    v_u_20.Enable(p_u_35, v_u_6)
                elseif v36 == "Medkit" then
                    if not v_u_23 then
                        v_u_23 = require(v_u_12.MedkitModule)
                    end
                    v_u_23.Enable(p_u_35)
                elseif v36 == "Twin keys" then
                    if not v_u_21 then
                        v_u_21 = require(v_u_12.TwinKeyModule)
                    end
                    v_u_21.Enable(p_u_35)
                elseif v36 == "Crate finder" then
                    if not v_u_15 then
                        v_u_15 = require(v_u_12.CrateFinder)
                    end
                    v_u_15.Enable(p_u_35)
                elseif v36 == "Zombieplicator" then
                    if not v_u_13 then
                        v_u_13 = require(v_u_12.Zombieplicator)
                    end
                    v_u_13.Enable(p_u_35)
                elseif p_u_35:HasTag("LaserWeapon") then
                    if not v_u_19 then
                        v_u_19 = require(v_u_12.LaserWeapon)
                    end
                    v_u_3.Icon = "http://www.roblox.com/asset?id=936803874"
                    local v37, _, _ = LoadAnimationOn(v36)
                    v_u_19.Enable(p_u_35, v37)
                end
                goto l7
            end
            if not v_u_14 then
                v_u_14 = require(v_u_12.FiringWeaponModule)
            end
            local v38, v39, v40 = LoadAnimationOn(v36)
            if v40 then
                if v36:find("M9") or v36 == "Minigun" then
                    v41 = 3
                    ::l35::
                    v_u_14.Enable(p_u_35, v38, v39, v40, v41)
                    v_u_3.Icon = "http://www.roblox.com/asset?id=936803874"
                    goto l7
                end
                if v36:find("AK") then
                    v41 = 1.9
                    goto l35
                end
            end
            local v41 = v36:find("shotgun") and 3
            goto l35
        end
        if not v_u_17 then
            v_u_17 = require(v_u_12.HitWeaponModule)
        end
        if v36:find("unch") then
            if not v_u_28 then
                v_u_28 = v_u_7:LoadAnimation(v_u_8.PunchAnim)
            end
            v_u_17.Enable(p_u_35, v_u_28)
        elseif v36 == "Axe" then
            if not v_u_29 then
                v_u_29 = v_u_7:LoadAnimation(v_u_8.AxeSlash)
            end
            v_u_17.Enable(p_u_35, v_u_29)
        else
            if not v_u_26 then
                v_u_26 = v_u_7:LoadAnimation(v_u_8.ToolSlashAnim)
            end
            if p_u_35:HasTag("Consumable") then
                if not v_u_27 then
                    v_u_27 = v_u_7:LoadAnimation(v_u_8.EatCandyCane)
                end
                v_u_17.Enable(p_u_35, v_u_26, v_u_27)
            else
                v_u_17.Enable(p_u_35, v_u_26)
            end
        end
    end
    ::l7::
    v_u_10 = p_u_35.Destroying:Once(function()
        -- upvalues: (copy) p_u_35
        OnToolUnequipped(p_u_35)
    end)
    v_u_11 = p_u_35.Unequipped:Once(function()
        -- upvalues: (copy) p_u_35
        OnToolUnequipped(p_u_35)
    end)
end)
function OnToolUnequipped(p42)
    -- upvalues: (ref) v_u_11, (ref) v_u_10, (ref) v_u_18, (ref) v_u_17, (ref) v_u_22, (ref) v_u_14, (copy) v_u_3, (ref) v_u_16, (ref) v_u_23, (ref) v_u_20, (ref) v_u_21, (ref) v_u_15, (ref) v_u_13, (ref) v_u_19
    v_u_11:Disconnect()
    v_u_10:Disconnect()
    local v43 = p42.Name
    if p42:HasTag("KeyTool") then
        v_u_18.Disable(p42)
        return
    elseif p42:HasTag("HitWeapon") then
        v_u_17.Disable(p42)
        return
    elseif v43:find("potion") then
        v_u_22.Disable()
        return
    elseif p42:HasTag("FiringWeapon") then
        v_u_14.Disable(p42)
        v_u_3.Icon = ""
        return
    elseif v43:find("Spring hand") then
        v_u_16.Disable()
        return
    elseif v43 == "Medkit" then
        v_u_23.Disable()
        return
    elseif p42:HasTag("PlacableTool") then
        v_u_20.Disable()
        return
    elseif v43 == "Twin keys" then
        v_u_21.Disable()
        return
    elseif v43 == "Crate finder" then
        v_u_15.Disable()
        return
    elseif v43 == "Zombieplicator" then
        v_u_13.Disable()
    elseif p42:HasTag("LaserWeapon") then
        v_u_3.Icon = ""
        v_u_19.Disable()
    end
end

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.PlayerMusicAndSound
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("SoundService")
local v3 = game:GetService("Players").LocalPlayer
while not v3:GetAttribute("DataFullyLoaded") do
    v3:GetAttributeChangedSignal("DataFullyLoaded"):Wait()
end
local v4 = v3:WaitForChild("Settings")
local v_u_5 = v4:WaitForChild("Music").Value
local v6 = v1.BindableEvents.SettingsEvent.Music
local v7 = require(game:GetService("ReplicatedStorage").AllModules.Events.Client_EventTracker)
local v_u_8 = require(script.GetMusics)
local v_u_9 = v2.Sound
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
function OnEventChanged()
    -- upvalues: (ref) v_u_12, (copy) v_u_8, (ref) v_u_10
    local v14, v15 = v_u_8()
    v_u_12 = v14
    if v15 and (v_u_10 and v_u_10.IsPlaying) then
        v_u_10.TimePosition = v_u_10.TimeLength - 0.1
    end
end
v7.ConnectToEventChanged(OnEventChanged, "MusicChanged", true)
OnEventChanged()
function PlayNextMusic()
    -- upvalues: (ref) v_u_10, (ref) v_u_12, (ref) v_u_11, (ref) v_u_13
    repeat
        v_u_10 = v_u_12[math.random(1, #v_u_12)]
    until v_u_10 ~= v_u_11
    v_u_11 = v_u_10
    v_u_10:Play()
    v_u_13 = v_u_10.Ended:Once(PlayNextMusic)
end
function StopMusic()
    -- upvalues: (ref) v_u_13, (ref) v_u_10
    if v_u_13 then
        v_u_13:Disconnect()
    end
    if v_u_10 then
        v_u_10:Stop()
    end
end
function OnMusicSettingChanged(p16)
    -- upvalues: (ref) v_u_5
    v_u_5 = p16
    if v_u_5 then
        PlayNextMusic()
    else
        StopMusic()
    end
end
OnMusicSettingChanged(v_u_5)
v6.Event:Connect(OnMusicSettingChanged)
local v17 = v1.RemoteEvent.PlaySoundEvent
local v18 = v17:WaitForChild("PlaySoundEventLocal")
local v_u_19 = v4:WaitForChild("TycoonSounds")
function PlaySound(p20, p21)
    -- upvalues: (copy) v_u_19, (copy) v_u_9
    if v_u_19.Value then
        local v22 = v_u_9:FindFirstChild(p20)
        if v22 then
            if v22.IsPlaying then
                if p21 then
                    return
                end
                v22:Stop()
            end
            v22:Play()
        else
            warn("No sound for " .. p20)
        end
    else
        return
    end
end
v17.OnClientEvent:Connect(PlaySound)
v18.Event:Connect(PlaySound)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.OnJoinScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("SoundService").Sound
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Players")
local v_u_5 = v_u_4.LocalPlayer
while not v_u_5:GetAttribute("DataFullyLoaded") do
    v_u_5:GetAttributeChangedSignal("DataFullyLoaded"):Wait()
end
local v6 = v_u_5:GetAttribute("AlreadyPlayed")
task.wait(2)
local v7 = v_u_5.PlayerGui:WaitForChild("MainGui")
local v_u_8 = v7.WelcomeLabel
local _ = v7.BuyDevProductFrame
local v_u_9 = workspace.Zones
local v10 = v2.RemoteEvent.GuiEvent.GuiEventLocal
local v_u_11 = nil
local v_u_12 = false
function GuiTransition(p13)
    -- upvalues: (ref) v_u_12, (ref) v_u_11, (copy) v_u_3
    if not v_u_12 then
        v_u_12 = true
        if v_u_11 then
            v_u_11:Disconnect()
            v_u_11 = nil
        end
        v_u_3:Create(p13, TweenInfo.new(1, Enum.EasingStyle.Linear), {
            ["TextTransparency"] = 1,
            ["TextStrokeTransparency"] = 1
        }):Play()
    end
end
local v_u_14 = nil
function FindClosestDoor(p15)
    -- upvalues: (ref) v_u_14, (copy) v_u_9
    if p15 then
        p15 = p15.Position
    end
    if not p15 then
        return nil
    end
    local v16 = (1 / 0)
    if v_u_14 then
        if v_u_14.Parent.Owner.Value then
            v_u_14 = nil
        else
            v16 = (v_u_14.Position - p15).Magnitude - 5
        end
    end
    for _, v17 in pairs(v_u_9:GetChildren()) do
        if v17.ClassName == "Model" and not v17.Owner.Value then
            local v18 = v17.TouchToClaimPart
            if v18 ~= v_u_14 then
                local v19 = (v18.Position - p15).Magnitude
                if v19 < v16 then
                    v_u_14 = v18
                    v16 = v19
                end
            end
        end
    end
end
local v_u_20 = v2.Tools.KeyBeam:Clone()
v_u_20.Name = "OnJoinBeam"
v_u_20.Parent = workspace
v_u_20.Enabled = true
v_u_8.Position = UDim2.fromScale(-0.2, 0.5)
v_u_8:TweenPosition(UDim2.fromScale(0.5, 0.5), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.8)
v_u_8.Visible = true
v_u_8.Text = "Welcome" .. (v6 and " back" or "") .. " to Infinite Tower Tycoon!"
v1.WhooshSound:Play()
local v21 = v_u_3:Create(v_u_8, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
    ["Position"] = UDim2.fromScale(0.5, 0.5)
})
v21:Play()
task.delay(6, GuiTransition, v_u_8)
v21.Completed:Wait()
v_u_11 = v_u_5:GetMouse().Button1Down:Connect(function()
    -- upvalues: (copy) v_u_8
    GuiTransition(v_u_8)
end)
if not v6 then
    v10:Fire("Notification", "Claim a tycoon and start building your tower")
end
local v22 = Instance.new("BillboardGui")
v22.Size = UDim2.fromScale(5, 1)
v22.ExtentsOffsetWorldSpace = Vector3.new(0, 0, 2)
local v23 = Instance.new("TextLabel", v22)
v23.TextColor3 = Color3.new(1, 1)
v23.Size = UDim2.fromScale(1, 1)
v23.Font = Enum.Font.FredokaOne
v23.TextStrokeTransparency = 0
v23.BackgroundTransparency = 1
v23.Text = "Touch to claim"
v23.TextScaled = true
local v24 = Instance.new("Attachment")
v24.CFrame = v24.CFrame - Vector3.new(0, 2, 0)
v_u_20.Attachment0 = v24
local v25 = v_u_14
while task.wait(0.1) and not v_u_5.Tycoon.Value do
    local v26 = v_u_5.Character
    if v26 then
        local v27 = v26:FindFirstChild("HumanoidRootPart")
        if v27 then
            v_u_20.Attachment1 = v27:FindFirstChild("RootRigAttachment")
            FindClosestDoor(v27, v25)
            if v25 then
                v24.Parent = v25
                v22.Parent = v25
            end
        end
    end
end
v22:Destroy()
v24:Destroy()
GuiTransition(v_u_8)
local v28 = require(v2.AllModules.GetTowerForPlayer)(v_u_5, true)
local v_u_29 = v28:WaitForChild("AllModels")
local v30 = v_u_29:WaitForChild("CashGiver")
if v_u_5:GetAttribute("AlreadyPlayed") then
    v_u_20:Destroy()
else
    local v_u_31 = nil
    local function v34()
        -- upvalues: (ref) v_u_31, (copy) v_u_5, (copy) v_u_20
        while not v_u_31() do
            local v32 = v_u_5.Character
            local v33 = v32 and v32:FindFirstChild("HumanoidRootPart")
            if v33 then
                v_u_20.Attachment1 = v33:FindFirstChild("RootRigAttachment") or v33:FindFirstChildOfClass("Attachment")
                task.wait(0.1)
            end
        end
    end
    v1.WhooshSound:Play()
    v10:Fire("Notification", "You claimed a tycoon. Now build the conveyor!")
    v_u_20.Attachment0 = Instance.new("Attachment", workspace.AllButtons:WaitForChild("Conveyor-1", 5))
    v_u_31 = function()
        -- upvalues: (copy) v_u_29
        return v_u_29:FindFirstChild("Conveyor (1)")
    end
    v34(v_u_31)
    v1.WhooshSound:Play()
    v10:Fire("Notification", "Build your first dropper to earn cash")
    v_u_31 = function()
        -- upvalues: (copy) v_u_29
        return v_u_29:FindFirstChild("Basic dropper (1)")
    end
    v_u_20.Attachment0 = Instance.new("Attachment", workspace.AllButtons:WaitForChild("BasicDropper-1", 5))
    v34(v_u_31)
    v1.WhooshSound:Play()
    v10:Fire("Notification", "You can now collect your cash")
    local v35 = v30.TouchPart
    v35.CanTouch = true
    local v_u_36 = false
    local v_u_37 = nil
    v_u_37 = v35.Touched:Connect(function(p38)
        -- upvalues: (copy) v_u_4, (copy) v_u_5, (ref) v_u_37, (ref) v_u_36
        if p38 and (p38.Parent and v_u_4:GetPlayerFromCharacter(p38.Parent) == v_u_5) then
            v_u_37:Disconnect()
            v_u_36 = true
        end
    end)
    v_u_20.Attachment0 = Instance.new("Attachment", v35)
    v_u_31 = function()
        -- upvalues: (ref) v_u_36
        return v_u_36
    end
    v34()
    v1.WhooshSound:Play()
    v10:Fire("Notification", "You can also grab crates to earn cash")
    local v_u_39 = script["wooden crate"]:Clone()
    v_u_20.Attachment0 = Instance.new("Attachment", v_u_39)
    v_u_39.Position = (v28.TouchToClaimPart.CFrame * CFrame.new(math.random(9, 25), 10, math.random(-15, 15))).Position
    v_u_39:AddTag("Crate")
    v_u_39.Parent = workspace
    v_u_31 = function()
        -- upvalues: (copy) v_u_39
        return not v_u_39:IsDescendantOf(workspace)
    end
    v34()
    v10:Fire("Notification", "You found a wooden crate: +$50")
    v2.RemoteEvent.FirstPlayEvent:FireServer("wooden crate")
    v_u_20:Destroy()
    v1.WhooshSound:Play()
    v10:Fire("Notification", "You can now build your tower and reach the highest possible level!")
end
local v40 = v30:WaitForChild("SurfaceGui"):WaitForChild("BackF")
local v_u_41 = require(v7.MainGuiScript.ToggleFrameModule)
local v_u_42 = v7.BuyDevProductFrame
script:WaitForChild("MoreCashFrame").Parent = v40
local v43 = Instance.new("TextButton", v40)
v43.Size = UDim2.fromScale(1, 1)
v43.BackgroundTransparency = 1
v43.Name = "MoreCashBttn"
v43.Text = ""
v40:SetAttribute("ScaleChild", "MoreCashFrame")
v40:AddTag("SizableUI")
v43.Activated:Connect(function()
    -- upvalues: (copy) v_u_41, (copy) v_u_42
    v_u_41.ToggleFrame(v_u_42, nil, nil, "BuyCashFrame")
end)
require(script.ShowAdButton).CheckForUserEligibilityAndShowAd(v30)
task.wait(6)
v_u_8:Destroy()

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.OverHeadGuis
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v2 = game:GetService("Players")
local v_u_3 = v2.LocalPlayer
local v_u_4 = require(script.OverHeadGuisModule)
v1.RemoteEvent.DamageAnimEvent.OnClientEvent:Connect(function(p5, p6)
    -- upvalues: (copy) v_u_4, (copy) v_u_3
    local v7 = v_u_4.AllOverHeadGui[p5]
    if v7 then
        v7:DisplayDamages(p6)
    elseif p5 ~= v_u_3.Character then
        warn("No damage gui found on", p5:GetFullName())
    end
end)
function OnPlayerAdded(p8)
    -- upvalues: (copy) v_u_3, (copy) v_u_4
    if p8 ~= v_u_3 then
        p8.CharacterAdded:Connect(function(p9)
            -- upvalues: (ref) v_u_4
            v_u_4.BuildOverHeadGui(p9)
        end)
        if p8.Character then
            v_u_4.BuildOverHeadGui(p8.Character)
        end
    end
end
v2.PlayerAdded:Connect(OnPlayerAdded)
for _, v10 in pairs(v2:GetPlayers()) do
    OnPlayerAdded(v10)
end

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.BackpackScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("StarterGui")
local v4 = game:GetService("Players")
v3:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
local v_u_5 = v4.LocalPlayer
local v_u_6 = false
local v_u_7 = nil
local v_u_8 = v_u_5.Character or v_u_5.CharacterAdded:Wait()
local v_u_9 = v_u_5:WaitForChild("Backpack")
v_u_5:GetMouse()
local v_u_10 = v_u_5:WaitForChild("PlayerGui"):WaitForChild("MainGui")
local v_u_11 = v_u_10.LowerFrameContainer.ToolFrame
local v_u_12 = v_u_10.BackpackFrame
local v_u_13 = v_u_12.ScrollingFrame
local v_u_14 = v_u_10.PresetInventoryFrame
local v_u_15 = v2.ToolButtonTemplate
local v_u_16 = v_u_11.BackpackBttn
local v_u_17 = v_u_16.NumLabel
local v_u_18 = script:WaitForChild("RedLabel")
local v19 = v_u_11.BackpackFunction
local v20 = v2.BindableEvents.EquipToolBE
local v_u_21 = require(v_u_10.MainGuiScript.ToggleFrameModule)
local v_u_22 = require(v_u_10.MainGuiScript.ImprovedUIDragger)
local v_u_23 = require(v2.AllModules.InputManager)
local v_u_24 = {}
local v_u_25 = nil
local v_u_26 = {
    Enum.KeyCode.One,
    Enum.KeyCode.Two,
    Enum.KeyCode.Three,
    Enum.KeyCode.Four,
    Enum.KeyCode.Five,
    Enum.KeyCode.Six,
    Enum.KeyCode.Seven,
    Enum.KeyCode.Eight,
    Enum.KeyCode.Nine,
    Enum.KeyCode.Zero
}
local v_u_27 = {}
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = nil
function OnToolBttnPressed(p31, p32)
    -- upvalues: (copy) v_u_11, (ref) v_u_9, (ref) v_u_8, (ref) v_u_25, (ref) v_u_6
    if v_u_11.Visible then
        local v33 = p32 or (v_u_9:FindFirstChild(p31.Name) or v_u_8:FindFirstChild(p31.Name))
        if v_u_25 == v33 then
            v33.Parent = v_u_9
            return
        elseif v_u_25 then
            v_u_25.Parent = v_u_9
            if v_u_6 then
                v_u_25 = v33
                p31.UIStroke.Enabled = true
                v33.Parent = v_u_8
            else
                v_u_25 = nil
            end
        elseif v_u_6 then
            v_u_25 = v33
            p31.UIStroke.Enabled = true
            v33.Parent = v_u_8
        end
    else
        return
    end
end
function AddKeyLabel(p34, p35)
    -- upvalues: (copy) v_u_26
    local v36 = p35 or p34.LayoutOrder
    if v_u_26[v36] then
        p34:WaitForChild("KeyLabel").Text = v36 % 10
    end
end
function PlaceMovedImageAtPosition(p37, p38)
    -- upvalues: (ref) v_u_30, (copy) v_u_15, (copy) v_u_10, (ref) v_u_29, (ref) v_u_28
    if not (v_u_30 and v_u_30.Parent) then
        v_u_30 = Instance.new("ImageLabel")
        v_u_30.Size = UDim2.fromOffset(p38.AbsoluteSize.X, p38.AbsoluteSize.Y)
        v_u_30.AnchorPoint = Vector2.new(0.5, 0.5)
        v_u_30.BackgroundColor3 = v_u_15.BackgroundColor3
        v_u_30.BackgroundTransparency = v_u_15.BackgroundTransparency
        v_u_30.Image = p38.Image
        v_u_15.UICorner:Clone().Parent = v_u_30
        v_u_30.Parent = v_u_10
        v_u_30.Name = p38.Name
    end
    v_u_30.Position = UDim2.fromOffset(p37.X, p37.Y)
    v_u_29 = GetClosestImg(p37)
    if v_u_28 ~= v_u_29 then
        ColorBttn(true)
        v_u_28 = v_u_29
    end
end
function CreateToolImg(p_u_39)
    -- upvalues: (ref) v_u_27, (copy) v_u_11, (copy) v_u_13, (copy) v_u_15, (copy) v_u_12, (copy) v_u_17, (copy) v_u_18, (copy) v_u_14, (ref) v_u_30, (ref) v_u_28, (ref) v_u_29, (copy) v_u_22, (copy) v_u_23, (copy) v_u_24
    local v40 = p_u_39:GetAttribute("PresetPosition")
    if v40 and v_u_27[v40] then
        v40 = nil
    end
    local v41 = v40 or GetFirstAvailablePosition()
    local v_u_42 = v_u_11:FindFirstChild((tostring(v41))) or (v_u_13:FindFirstChild((tostring(v41))) or v_u_15:Clone())
    v_u_42.Image = p_u_39.TextureId
    v_u_42.LayoutOrder = v41
    if v_u_42.LayoutOrder > MaxVisible then
        v_u_42.Parent = v_u_13
        if not v_u_12.Visible then
            v_u_17.Text = 1 + v_u_17.Text
            v_u_17.Visible = true
            v_u_18:Clone().Parent = v_u_42
        end
    else
        v_u_42.Parent = v_u_11
    end
    v_u_42.Visible = true
    v_u_42.Name = p_u_39.Name
    v_u_27[v41] = v_u_42
    v_u_42.Activated:Connect(function()
        -- upvalues: (copy) v_u_42, (copy) p_u_39
        if v_u_42:FindFirstChild("RedLabel") then
            v_u_42.RedLabel:Destroy()
        end
        OnToolBttnPressed(v_u_42, p_u_39)
    end)
    local function v43()
        -- upvalues: (ref) v_u_30, (copy) v_u_42, (ref) v_u_28, (ref) v_u_29
        if v_u_30 then
            v_u_30:Destroy()
            v_u_30 = nil
        end
        ChangeToolPositionFromImg(v_u_42)
        ColorBttn(false)
        v_u_28 = nil
        v_u_29 = nil
    end
    local v45 = v_u_22(v_u_42, function()
        -- upvalues: (copy) v_u_42, (ref) v_u_14, (ref) v_u_30
        if v_u_42:FindFirstChild("RedLabel") then
            v_u_42.RedLabel:Destroy()
        end
        local v44 = not v_u_14.Visible
        if v44 then
            v44 = not (v_u_30 and v_u_30.Parent)
        end
        return v44
    end, PlaceMovedImageAtPosition, v43, v_u_42)
    if v_u_23.LastInputType == "PC" then
        AddKeyLabel(v_u_42)
    end
    local v46 = v_u_24
    table.insert(v46, v45)
    return v_u_42, v45
end
function ConnectToolAction(p_u_47)
    -- upvalues: (ref) v_u_25, (copy) v_u_11, (copy) v_u_13, (ref) v_u_29, (ref) v_u_28, (copy) v_u_24, (ref) v_u_30, (copy) v_u_12
    if v_u_25 == p_u_47 then
        (v_u_11:FindFirstChild(p_u_47.Name) or v_u_13:FindFirstChild(p_u_47.Name)).UIStroke.Enabled = false
        if v_u_25.Name == p_u_47.Name then
            v_u_25 = nil
        end
    else
        local v_u_48, v_u_49 = CreateToolImg(p_u_47)
        p_u_47.Destroying:Connect(function()
            -- upvalues: (copy) v_u_48, (ref) v_u_29, (ref) v_u_28, (copy) v_u_49, (ref) v_u_24, (ref) v_u_30, (copy) p_u_47, (ref) v_u_12, (ref) v_u_25
            if v_u_48 == v_u_29 then
                v_u_29 = nil
            end
            if v_u_48 == v_u_28 then
                v_u_28 = nil
            end
            v_u_49:DisconnectAndClear()
            local v50 = table.find(v_u_24, v_u_49)
            if v50 then
                table.remove(v_u_24, v50)
            else
                print("failed to remove dragger obj")
            end
            if v_u_30 and v_u_30.Name == p_u_47.Name then
                v_u_30:Destroy()
                v_u_30 = nil
                if v_u_29 and v_u_29.Parent then
                    if v_u_29 == v_u_12 then
                        v_u_12.UIStroke.Transparency = 0.5
                        v_u_12.UIStroke.Color = Color3.new(0, 0, 0)
                    else
                        v_u_29.UIStroke.Color = Color3.fromRGB(27, 163, 213)
                        v_u_29.UIStroke.Enabled = false
                    end
                end
            end
            RemoveToolFromPostionList(v_u_48)
            if v_u_12.Visible and v_u_48.LayoutOrder <= MaxVisible then
                CreateEmptyImageAtPos(v_u_48.LayoutOrder)
            end
            v_u_48:Destroy()
            if v_u_25 and v_u_25.Name == p_u_47.Name then
                v_u_25 = nil
            end
        end)
    end
end
function ClearPreviousBackpack()
    -- upvalues: (copy) v_u_11, (copy) v_u_16, (copy) v_u_13, (copy) v_u_17, (ref) v_u_27, (ref) v_u_30, (ref) v_u_25, (ref) v_u_28, (ref) v_u_29
    for _, v51 in pairs(v_u_11:GetChildren()) do
        if v51:IsA("ImageButton") and v51 ~= v_u_16 then
            v51:Destroy()
        end
    end
    for _, v52 in pairs(v_u_13:GetChildren()) do
        if v52:IsA("ImageButton") then
            v52:Destroy()
        end
    end
    v_u_17.Text = 0
    v_u_17.Visible = false
    v_u_27 = {}
    if v_u_30 then
        v_u_30:Destroy()
    end
    v_u_25 = nil
    v_u_28 = nil
    v_u_29 = nil
    v_u_30 = nil
    ColorBttn(false)
end
function ConnectBackpack()
    -- upvalues: (ref) v_u_9, (copy) v_u_5
    if not v_u_9.Parent then
        v_u_9 = v_u_5:WaitForChild("Backpack")
    end
    v_u_9.ChildAdded:Connect(function(p53)
        ConnectToolAction(p53)
    end)
    for _, v54 in pairs(v_u_9:GetChildren()) do
        ConnectToolAction(v54)
    end
end
function GetFirstAvailablePosition()
    -- upvalues: (ref) v_u_27
    local v55 = 1
    while v_u_27[v55] do
        v55 = v55 + 1
    end
    return v55
end
function ToggleBackpack()
    -- upvalues: (copy) v_u_12, (copy) v_u_11, (copy) v_u_13, (ref) v_u_29, (ref) v_u_28, (copy) v_u_17, (ref) v_u_27
    if v_u_12.Visible then
        v_u_12.Visible = false
        for v56 = 1, MaxVisible do
            if v_u_11:FindFirstChild(v56) then
                v_u_11[v56]:Destroy()
            end
        end
        for _, v57 in pairs(v_u_13:GetChildren()) do
            if v57:FindFirstChild("RedLabel") then
                v57.RedLabel:Destroy()
            end
        end
        if v_u_29 then
            local v58 = v_u_29.Name
            if tonumber(v58) then
                v_u_29 = nil
            end
        end
        if v_u_28 then
            local v59 = v_u_28.Name
            if tonumber(v59) then
                v_u_28 = nil
                return
            end
        end
    else
        v_u_12.Visible = true
        local v60 = v_u_17
        v_u_17.Text = 0
        v60.Visible = false
        for v61 = 1, MaxVisible do
            if not v_u_27[v61] then
                CreateEmptyImageAtPos(v61)
            end
        end
    end
end
function ColorBttn(p62)
    -- upvalues: (ref) v_u_29, (ref) v_u_28, (copy) v_u_12, (copy) v_u_16, (ref) v_u_25, (ref) v_u_27, (copy) v_u_11
    if p62 then
        v_u_29.UIStroke.Color = Color3.fromRGB(46, 189, 24)
        v_u_29.UIStroke.Transparency = 0
        v_u_29.UIStroke.Enabled = true
        if v_u_28 then
            if v_u_28 == v_u_12 or v_u_28 == v_u_16 then
                if v_u_28 == v_u_16 then
                    v_u_16.UIStroke.Color = Color3.fromRGB(120, 120, 120)
                    v_u_16.UIStroke.Transparency = 0.6
                else
                    v_u_12.UIStroke.Color = Color3.fromRGB(0, 0, 0)
                    v_u_12.UIStroke.Transparency = 0.5
                end
            end
            v_u_28.UIStroke.Color = Color3.fromRGB(27, 163, 213)
            if not v_u_25 or v_u_25.Name ~= v_u_28.Name then
                v_u_28.UIStroke.Enabled = false
                return
            end
        end
    else
        v_u_12.UIStroke.Color = Color3.new(0, 0, 0)
        v_u_12.UIStroke.Transparency = 0.5
        v_u_16.UIStroke.Color = Color3.fromRGB(120, 120, 120)
        v_u_16.UIStroke.Transparency = 0.6
        for _, v63 in pairs(v_u_27) do
            if v63 and v63:IsA("ImageButton") then
                v63.UIStroke.Color = Color3.fromRGB(27, 163, 213)
                if v_u_25 and v_u_25.Name == v63.Name then
                    v63.UIStroke.Enabled = true
                else
                    v63.UIStroke.Enabled = false
                end
            end
        end
        for v64 = 1, MaxVisible do
            local v65 = v_u_11:FindFirstChild((tostring(v64)))
            if v65 then
                v65.UIStroke.Enabled = false
            end
        end
    end
end
function CreateEmptyImageAtPos(p66, p67)
    -- upvalues: (copy) v_u_15, (copy) v_u_11, (copy) v_u_23
    local v68 = v_u_15:Clone()
    v68.LayoutOrder = p66
    v68.AutoButtonColor = false
    v68.Name = p66
    v68.Parent = p67 or v_u_11
    v68.Visible = true
    if v_u_23.LastInputType == "PC" and p66 <= 10 then
        AddKeyLabel(v68, p66)
    end
    return v68
end
function RemoveToolFromPostionList(p69)
    -- upvalues: (ref) v_u_27
    for v70, v71 in pairs(v_u_27) do
        if v71 == p69 then
            v_u_27[v70] = false
        end
    end
end
function ChangeToolPositionFromImg(p72)
    -- upvalues: (ref) v_u_29, (copy) v_u_12, (copy) v_u_16, (ref) v_u_27, (copy) v_u_13, (copy) v_u_23, (copy) v_u_11
    if v_u_29 then
        if v_u_29 == v_u_12 or v_u_29 == v_u_16 then
            local v73 = 0
            for v74, v75 in pairs(v_u_27) do
                if v75 and v73 < v74 then
                    v73 = v74
                end
            end
            local v76 = CreateEmptyImageAtPos
            local v77 = v73 + 1
            local v78 = MaxVisible + 1
            v_u_29 = v76(math.max(v77, v78), v_u_13)
            v_u_12.UIStroke.Color = Color3.new(0, 0, 0)
            v_u_12.UIStroke.Transparency = 0.5
        end
        if v_u_29.Name ~= p72.Name then
            if v_u_29:FindFirstChild("RedLabel") then
                v_u_29.RedLabel:Destroy()
            end
            local v79 = v_u_27
            local v80 = v_u_29.LayoutOrder
            local v81 = v_u_27
            local v82 = p72.LayoutOrder
            local v83 = v_u_27[p72.LayoutOrder]
            local v84 = v_u_27[v_u_29.LayoutOrder] or false
            v79[v80] = v83
            v81[v82] = v84
            local v85 = v_u_29
            local v86 = p72.LayoutOrder
            local v87 = v_u_29.LayoutOrder
            v85.LayoutOrder = v86
            p72.LayoutOrder = v87
            local v88 = v_u_29
            local v89 = p72.Parent
            local v90 = v_u_29.Parent
            v88.Parent = v89
            p72.Parent = v90
            local v91 = v_u_29.Name
            if tonumber(v91) then
                v_u_29.Name = v_u_29.LayoutOrder
            end
            if v_u_23.LastInputType == "PC" then
                local v92 = v_u_29.KeyLabel
                local v93 = p72.KeyLabel
                local v94 = p72.KeyLabel.Text
                local v95 = v_u_29.KeyLabel.Text
                v92.Text = v94
                v93.Text = v95
            end
            if v_u_29.Parent == v_u_13 then
                local v96 = v_u_29.Name
                if tonumber(v96) then
                    v_u_29:Destroy()
                    return
                end
            end
            if v_u_29.Parent == v_u_11 and not v_u_12.Visible then
                local v97 = v_u_29.Name
                if tonumber(v97) then
                    v_u_29:Destroy()
                end
            end
        end
    end
end
function GetClosestImg(p98)
    -- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_13
    local v99 = (1 / 0)
    local v100 = nil
    for _, v101 in pairs(v_u_11:GetChildren()) do
        if typeof(v101) == "Instance" and v101:IsA("ImageButton") then
            local v102 = (v101.AbsolutePosition + v101.AbsoluteSize / 2 - p98).Magnitude
            if v102 < v99 then
                v100 = v101
                v99 = v102
            end
        end
    end
    if v_u_12.Visible then
        if p98.X > v_u_12.AbsolutePosition.X and (p98.Y > v_u_12.AbsolutePosition.Y and (p98.X < v_u_12.AbsolutePosition.X + v_u_12.AbsoluteSize.X and p98.Y < v_u_12.AbsolutePosition.Y + v_u_12.AbsoluteSize.Y)) then
            v100 = v_u_12
            v99 = 0.9 * v_u_11.AbsoluteSize.Y
        end
        for _, v103 in pairs(v_u_13:GetChildren()) do
            if typeof(v103) == "Instance" and v103:IsA("ImageButton") then
                local v104 = (v103.AbsolutePosition + v103.AbsoluteSize / 2 - p98).Magnitude
                if v104 < v99 then
                    v100 = v103
                    v99 = v104
                end
            end
        end
    end
    return v100
end
v_u_10:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
    -- upvalues: (copy) v_u_10, (copy) v_u_16, (copy) v_u_11, (copy) v_u_13
    MaxVisible = (0.5 * v_u_10.AbsoluteSize.X - v_u_16.AbsoluteSize.X) // (5 + v_u_11.AbsoluteSize.Y)
    v_u_13:WaitForChild("UIGridLayout").CellSize = UDim2.fromOffset(v_u_11.AbsoluteSize.Y, v_u_11.AbsoluteSize.Y)
end)
MaxVisible = (0.5 * v_u_10.AbsoluteSize.X - v_u_16.AbsoluteSize.X) // (5 + v_u_11.AbsoluteSize.Y)
v_u_13:WaitForChild("UIGridLayout").CellSize = UDim2.fromOffset(v_u_11.AbsoluteSize.Y, v_u_11.AbsoluteSize.Y)
v_u_5.ChildAdded:Connect(function(p105)
    -- upvalues: (ref) v_u_9
    if p105:IsA("Backpack") then
        ClearPreviousBackpack()
        v_u_9 = p105
        ConnectBackpack()
    end
end)
function StopDraggers()
    -- upvalues: (copy) v_u_24
    for _, v106 in pairs(v_u_24) do
        v106:Stop()
    end
end
v_u_11:GetPropertyChangedSignal("Visible"):Connect(function()
    -- upvalues: (copy) v_u_11, (ref) v_u_7, (ref) v_u_30, (copy) v_u_12
    if not v_u_11.Visible then
        v_u_7:UnequipTools()
        if v_u_30 then
            v_u_30:Destroy()
            v_u_30 = nil
        end
        StopDraggers()
        if v_u_12.Visible then
            ToggleBackpack()
        end
        ColorBttn(false)
    end
end)
v_u_14:GetPropertyChangedSignal("Visible"):Connect(StopDraggers)
v19.OnInvoke = ToggleBackpack
v_u_13.ChildAdded:Connect(function()
    -- upvalues: (copy) v_u_13
    v_u_13.CanvasSize = UDim2.fromOffset(0, v_u_13.UIGridLayout.AbsoluteContentSize.Y + 20)
end)
function OnCharacterAdded(p107)
    -- upvalues: (ref) v_u_6, (ref) v_u_8, (ref) v_u_7
    v_u_6 = true
    v_u_8 = p107
    v_u_7 = v_u_8:WaitForChild("Humanoid")
    v_u_7.Died:Once(OnDeath)
end
function OnDeath()
    -- upvalues: (ref) v_u_6, (ref) v_u_7, (ref) v_u_25
    v_u_6 = false
    v_u_7:UnequipTools()
    v_u_25 = nil
    ColorBttn(false)
end
OnCharacterAdded(v_u_8)
v_u_5.CharacterAdded:Connect(OnCharacterAdded)
ConnectBackpack()
function GetEquippedToolIndex()
    -- upvalues: (ref) v_u_25, (ref) v_u_27
    if v_u_25 then
        local v108 = v_u_25.Name
        for v109, v110 in pairs(v_u_27) do
            if v110 and v108 == v110.Name then
                return v109, v110
            end
        end
    end
end
function GetLastImgBttnIndex()
    -- upvalues: (ref) v_u_27
    local v111 = nil
    for v112, _ in pairs(v_u_27) do
        if v111 then
            v111 = math.max(v112, v111) or v112
        else
            v111 = v112
        end
    end
    return MaxVisible
end
function HideKeyLabel()
    -- upvalues: (ref) v_u_27
    for _, v113 in pairs(v_u_27) do
        if v113 then
            v113.KeyLabel.Text = ""
        end
    end
end
v20.Event:Connect(function(p114)
    -- upvalues: (ref) v_u_27
    for _, v115 in pairs(v_u_27) do
        if typeof(v115) == "Instance" and v115.Name == p114 then
            OnToolBttnPressed(v115)
            return
        end
    end
end)
local v_u_116 = nil
v_u_23.ConnectToInputChanged(function(p117)
    -- upvalues: (ref) v_u_116, (ref) v_u_27, (copy) v_u_1, (copy) v_u_11, (copy) v_u_21, (copy) v_u_12, (copy) v_u_26
    if v_u_116 then
        v_u_116:Disconnect()
    end
    if p117 == "PC" then
        for v118, v119 in pairs(v_u_27) do
            if v119 then
                AddKeyLabel(v119, v118)
            end
        end
        v_u_116 = v_u_1.InputBegan:Connect(function(p120, p121)
            -- upvalues: (ref) v_u_11, (ref) v_u_21, (ref) v_u_12, (ref) v_u_26, (ref) v_u_27
            if p121 or not v_u_11.Visible then
                return
            elseif p120.KeyCode == Enum.KeyCode.Backquote then
                v_u_21.ToggleFrame(v_u_12, not v_u_12.Visible)
                return
            else
                local v122 = table.find(v_u_26, p120.KeyCode)
                if v122 then
                    local v123 = v_u_27[v122]
                    if v123 then
                        OnToolBttnPressed(v123)
                    end
                else
                    return
                end
            end
        end)
        return
    elseif p117 == "Gamepad" then
        HideKeyLabel()
        v_u_116 = v_u_1.InputBegan:Connect(function(p124, p125)
            -- upvalues: (ref) v_u_11, (ref) v_u_27
            if not p125 and v_u_11.Visible then
                if p124.KeyCode == Enum.KeyCode.ButtonL1 then
                    local v126 = GetLastImgBttnIndex()
                    if not v126 then
                        return
                    end
                    local v127, v128 = GetEquippedToolIndex()
                    if v127 then
                        v126 = v127 - 1 or v126
                    end
                    for v129 = v126, 1, -1 do
                        if v_u_27[v129] then
                            OnToolBttnPressed(v_u_27[v129])
                            return
                        end
                    end
                    if v128 then
                        OnToolBttnPressed(v128)
                        return
                    end
                elseif p124.KeyCode == Enum.KeyCode.ButtonR1 then
                    local v130 = GetLastImgBttnIndex()
                    if not v130 then
                        return
                    end
                    local v131, v132 = GetEquippedToolIndex()
                    for v133 = v131 and v131 + 1 or 1, v130 do
                        if v_u_27[v133] then
                            OnToolBttnPressed(v_u_27[v133])
                            return
                        end
                    end
                    if v132 then
                        OnToolBttnPressed(v132)
                    end
                end
            end
        end)
    elseif p117 == "Mobile" then
        HideKeyLabel()
    end
end, "Backpack")

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.TowerBuildingAnimation
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game:GetService("Players")
local v1 = require(game:GetService("ReplicatedStorage").AllModules.GetTowerForPlayer)
local v2 = game:GetService("Players").LocalPlayer
local v_u_3 = v2:WaitForChild("Settings"):WaitForChild("AnimatedButtons")
local v_u_4 = v1(v2, true)
local v5 = v_u_4:WaitForChild("AllModels")
while v_u_4:GetAttribute("IsBuilding") do
    v_u_4:GetAttributeChangedSignal("IsBuilding"):Wait()
end
local v_u_6 = require(script.AnimateBuilding)
v5.ChildAdded:Connect(function(p7)
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_6
    if v_u_3.Value and not v_u_4:GetAttribute("IsBuilding") then
        if p7:IsA("Model") then
            local v8 = p7:GetAttribute("Animated")
            p7:SetAttribute("Animating", true)
            task.wait()
            if v8 == 0 then
                v_u_6.AnimateModel(p7, true)
            elseif v8 == -1 then
                v_u_6.AnimateModel(p7, false)
            elseif v8 == 1 then
                v_u_6.AnimateAllPartsInModel(p7)
            elseif v8 == 2 then
                v_u_6.DeepAnimateModel(p7, true)
                task.wait(v_u_6.AnimationTime_WithOvershoot)
            elseif v8 == 3 then
                v_u_6.DeepAnimateModel(p7, false)
                task.wait(v_u_6.AnimationTimeBase)
            end
            p7:SetAttribute("Animating", false)
        end
    else
        return
    end
end)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.AnimateItemScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = require(v1.AllModules.ItemAnimations)
local v_u_4 = v1.GreenCross
v1.RemoteEvent.AnimateItemEvent.OnClientEvent:Connect(function(p5, p6, p7)
    -- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
    local v8
    if p7 then
        p5 = v_u_4
        p5.Position = p7
        v8 = 0.6
    else
        v8 = nil
    end
    if p5 and (p5.Parent and (p6 and p6.Parent)) then
        local v9 = v_u_2.Character
        if v9 then
            v9 = v_u_2.Character.PrimaryPart
        end
        if v9 and (v9.Position - p5.Position).Magnitude <= 100 then
            v_u_3.CollectItem(p5, p6, v8)
        end
    else
        return
    end
end)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.LocalButtonScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("MarketplaceService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players").LocalPlayer
local v_u_4 = require(v2.AllModules.TicketsDescription)
local v_u_5 = require(v2.AllModules.LoadGPDescription)
local v_u_6 = require(script.AnimateButtonModule)
local v_u_7 = require(script.ButtonHandler)
local v8 = v_u_3:WaitForChild("Stats"):WaitForChild("GamePass")
local v_u_9 = v_u_3.Stats:WaitForChild("Tickets"):WaitForChild("ButtonTicketInUse")
local v_u_10 = script:WaitForChild("Default")
Color3.new(0, 0, 1)
local v_u_11 = {}
local v_u_12 = Instance.new("Folder", workspace)
v_u_12.Name = "RobuxButtons"
local v_u_13 = v_u_3:WaitForChild("leaderstats"):WaitForChild("Cash")
local v14 = v_u_3:WaitForChild("Stats"):WaitForChild("GamePass"):WaitForChild("AutoBuild")
local v15 = v2.RemoteEvent.TycoonEvent.RemoveButtonEvent
local v16 = v2.RemoteEvent.TycoonEvent.AddButtonEvent
local _ = v2.RemoteEvent.PlaySoundEvent.PlaySoundEventLocal
local v_u_17 = 1
local v_u_18 = nil
local v_u_19 = v_u_13.Value
function OnBttnTicketValChanged()
    -- upvalues: (ref) v_u_17, (copy) v_u_4, (copy) v_u_9, (ref) v_u_18, (copy) v_u_7
    v_u_17 = v_u_4.Button.GetBonusValue(nil, v_u_9)
    if v_u_17 ~= v_u_18 then
        local v20 = v_u_7
        local v21 = (1 - v_u_17) * 100
        v20.BonusString = "-" .. math.round(v21) .. "%"
        v_u_7.IsBonusDisabled = v_u_17 == 1
        v_u_7.Bonus = v_u_17
        for _, v22 in pairs(v_u_7.AllShownButton) do
            v22:ChangePrice()
        end
        v_u_18 = v_u_17
    end
end
for _, v_u_23 in pairs(v8:GetChildren()) do
    if v_u_23:IsA("BoolValue") then
        local v_u_24 = v_u_23.Name
        if v_u_24 ~= "AreGamePassBooleanFullyLoaded" then
            v_u_23:GetPropertyChangedSignal("Value"):Connect(function()
                -- upvalues: (copy) v_u_23, (copy) v_u_11, (copy) v_u_24, (copy) v_u_6
                if v_u_23.Value then
                    local v25 = v_u_11[v_u_24]
                    if v25 then
                        v_u_11[v_u_24] = nil
                        v25.CanTouch = false
                        v_u_6.OnButtonBought(v25)
                    end
                else
                    return
                end
            end)
        end
    end
end
function AddRobuxPart(p26, p_u_27, p28, p29)
    -- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_3, (copy) v_u_1, (copy) v_u_12, (copy) v_u_11, (copy) v_u_6
    local v30 = v_u_10:Clone()
    v30.Name = p26
    local v31 = v30.BillboardGui
    local v32 = v31.Label
    v30:PivotTo(p28 * CFrame.Angles(0, 0, 1.5707963267948966))
    local v33, v34 = v_u_5(p_u_27)
    if v33 and v33 ~= 0 then
        v32.Text = p29 .. "\n" .. utf8.char(57346) .. (v33 or "")
    else
        warn("No price on robux button")
        v32.Text = p29 .. "\n" .. utf8.char(57346)
    end
    local v35
    if v34 and v34 ~= "" then
        v35 = Instance.new("ImageLabel", v31)
        v35.AutoLocalize = false
        v35.SizeConstraint = Enum.SizeConstraint.RelativeYY
        v35.ImageColor3 = Color3.new(0.8, 0.8, 0.8)
        v35.Size = UDim2.fromScale(0.48, 0.48)
        v35.Position = UDim2.fromScale(0.5, 0)
        v35.AnchorPoint = Vector2.new(0.5, 0)
        v35.Image = "rbxassetid://" .. v34
        v35.BackgroundTransparency = 1
        v35.ImageTransparency = 1
        v35.Name = "GamePassIcon"
    else
        v35 = nil
    end
    v30.Touched:Connect(function(p36)
        -- upvalues: (ref) v_u_3, (ref) v_u_1, (copy) p_u_27
        if v_u_3.Character and (v_u_3.Character:FindFirstChild("Humanoid") and v_u_3.Character.Humanoid.Health > 0) then
            if p36:IsDescendantOf(v_u_3.Character) then
                v_u_1:PromptGamePassPurchase(v_u_3, p_u_27)
            end
        else
            return
        end
    end)
    v30.Parent = v_u_12
    v30.Color = Color3.new(0, 0, 1)
    v_u_11[p26] = v30
    v_u_6.AddButton(v30, v31, v32, v35)
end
v15.OnClientEvent:Connect(v_u_7.RemoveButton)
v16.OnClientEvent:Connect(function(p37, p38, ...)
    -- upvalues: (copy) v_u_7
    if p38 then
        AddRobuxPart(p37, p38, ...)
    else
        for v39, v40 in pairs(p37) do
            v_u_7.NewButton(v40)
            if v39 == 2000 then
                task.wait()
            end
        end
        table.clear(p37)
    end
end)
function OnCashChanged()
    -- upvalues: (ref) v_u_19, (copy) v_u_13, (copy) v_u_7
    v_u_19 = v_u_13.Value
    v_u_7.CurrentCash = v_u_19
    for _, v41 in pairs(v_u_7.AllShownButton) do
        v41:ChangeColor()
    end
end
v_u_13.Changed:Connect(OnCashChanged)
v_u_9.Changed:Connect(OnBttnTicketValChanged)
OnCashChanged()
while not v14.Value do
    v14:GetPropertyChangedSignal("Value"):Wait()
end
script:WaitForChild("AutoBuildScript").Enabled = true

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.LocalButtonScript.AutoBuildScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players").LocalPlayer
local v3 = v2:WaitForChild("Settings")
local v4 = v3:WaitForChild("AutoBuild_Enabled")
local v_u_5 = v3:WaitForChild("AutoBuild_DroppersFirst")
local v_u_6 = v3:WaitForChild("AutoBuild_OnlyWalls")
local v_u_7 = v1.RemoteEvent.SettingsEvent
local v_u_8 = v4.Value
local v_u_9 = v2:WaitForChild("leaderstats"):WaitForChild("Cash")
local v10 = require(v1.AllModules.GetTowerForPlayer)
local v_u_11 = require(script.Parent.ButtonHandler)
local v_u_12 = script.AutoBuildBttn
local v_u_13 = v2.PlayerGui:WaitForChild("MainGui").CashImgButton
v_u_12.Parent = v_u_13:WaitForChild("FrameForChangingCash")
local v14 = Instance.new("UIScale", v_u_12)
v14:SetAttribute("EndScale", 1.05)
v14:AddTag("SizableUI")
local v_u_15 = game:GetService("SoundService").Sound.ClickSound
function SizeButton()
    -- upvalues: (copy) v_u_12, (copy) v_u_13
    v_u_12.TextSize = 0.5 * v_u_13.AbsoluteSize.Y
end
v_u_13:GetPropertyChangedSignal("Size"):Connect(SizeButton)
SizeButton()
local v_u_16 = false
local v_u_17 = {
    "dropper",
    "conveyor",
    "upgrader",
    "collector"
}
local v_u_18 = {
    "wall",
    "floor",
    "windows",
    "elevator",
    "stairs"
}
function GetCheapestButton(p19, p20)
    -- upvalues: (copy) v_u_11, (copy) v_u_17, (copy) v_u_18, (copy) v_u_9
    local v21 = false
    local v22 = (1 / 0)
    local v23 = nil
    for _, v24 in pairs(v_u_11.AllBttnObj) do
        local v25 = v24.Price * v_u_11.Bonus
        if v25 and v25 > 0 then
            if p19 then
                local v26 = FindNameInList(v24.ButtonName:lower(), v_u_17)
                if not v21 or v26 then
                    if not v21 and v26 then
                        v21 = true
                        v22 = (1 / 0)
                    end
                    goto l6
                end
            else
                ::l6::
                if (not p20 or (v21 or FindNameInList(v24.ButtonName:lower(), v_u_18))) and v25 < v22 then
                    v23 = v24
                    v22 = v25
                end
            end
        end
    end
    if v23 and v_u_9.Value >= v22 then
        return v23
    end
end
function FindNameInList(p27, p28)
    for _, v29 in pairs(p28) do
        if p27:find(v29) then
            return true
        end
    end
    return false
end
function AutoBuildLoop()
    -- upvalues: (ref) v_u_16, (ref) v_u_8, (copy) v_u_5, (copy) v_u_6
    v_u_16 = true
    while v_u_8 do
        local v30 = GetCheapestButton(v_u_5.Value, v_u_6.Value)
        local v31 = 3
        if v30 then
            local v32 = time()
            local v33, v34 = pcall(v30.TryToBuy, v30)
            if not v33 then
                warn("Autobuild failed:", v34)
            end
            if v34 then
                local v35 = 0.2 - (time() - v32)
                v31 = math.max(0, v35)
            end
        end
        task.wait(v31)
    end
    v_u_16 = false
end
local v_u_36 = nil
function SetAutobuildState(p37)
    -- upvalues: (ref) v_u_8, (copy) v_u_12, (ref) v_u_36, (ref) v_u_16
    v_u_8 = p37
    if v_u_8 then
        v_u_12.Text = " Auto build: ON "
        v_u_12.UIGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.4, 1, 0.4)), ColorSequenceKeypoint.new(1, Color3.new(0, 0.9, 0)) })
        if v_u_36 then
            v_u_36.BackgroundTransparency = 0
        end
    else
        v_u_12.Text = " Auto build: OFF "
        v_u_12.UIGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0.4, 0.4)), ColorSequenceKeypoint.new(1, Color3.new(0.9, 0, 0)) })
        if v_u_36 then
            v_u_36.BackgroundTransparency = 1
        end
    end
    if v_u_8 and not v_u_16 then
        AutoBuildLoop()
    end
end
function OnEnableBttnPressed()
    -- upvalues: (copy) v_u_15, (ref) v_u_8, (copy) v_u_7
    v_u_15:Play()
    v_u_8 = not v_u_8
    v_u_7:FireServer("AutoBuild_Enabled", v_u_8)
    SetAutobuildState(v_u_8)
end
v_u_12.Activated:Connect(OnEnableBttnPressed)
task.spawn(SetAutobuildState, v_u_8)
local v38 = v10(v2, true):WaitForChild("AllModels"):WaitForChild("AutoBuildModel", (1 / 0)):WaitForChild("SurfaceGui")
v38:AddTag("SurfaceGuiForPGui")
local v39 = v38:WaitForChild("BackgroundF")
local v40 = v39:WaitForChild("Enabled")
v40.Activated:Connect(OnEnableBttnPressed)
v_u_36 = v40:WaitForChild("Frame")
v_u_36.BackgroundTransparency = v_u_8 and 0 or 1
for v_u_41, v42 in pairs({
    ["DroppersFirst"] = v_u_5,
    ["OnlyWalls"] = v_u_6
}) do
    local v43 = v39:WaitForChild(v_u_41)
    local v_u_44 = v43:WaitForChild("Frame")
    local v_u_45 = v42.Value
    v_u_44.BackgroundTransparency = v_u_45 and 0 or 1
    v43.Activated:Connect(function()
        -- upvalues: (copy) v_u_15, (ref) v_u_45, (copy) v_u_44, (copy) v_u_7, (copy) v_u_41
        v_u_15:Play()
        v_u_45 = not v_u_45
        v_u_44.BackgroundTransparency = v_u_45 and 0 or 1
        v_u_7:FireServer("AutoBuild_" .. v_u_41, v_u_45)
    end)
end

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.Client_CollectionScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("CollectionService")
function OnTagModuleAdded(p2)
    -- upvalues: (copy) v_u_1
    local v3 = p2.Name:sub(10, -6)
    local v4 = require(p2)
    v_u_1:GetInstanceAddedSignal(v3):Connect(v4.OnInstanceAdded)
    if v4.OnInstanceRemoved then
        v_u_1:GetInstanceRemovedSignal(v3):Connect(v4.OnInstanceRemoved)
    end
    for _, v5 in pairs(v_u_1:GetTagged(v3)) do
        task.spawn(v4.OnInstanceAdded, v5, true)
    end
end
script.ChildAdded:Connect(OnTagModuleAdded)
for _, v6 in pairs(script:GetChildren()) do
    task.spawn(OnTagModuleAdded, v6)
end

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.WeaponFire
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("HttpService")
local v3 = game:GetService("Players")
local v_u_4 = require(script:WaitForChild("CheckFiringThroughtWalls"))
local v_u_5 = require(script:WaitForChild("MovingFireModule"))
local v_u_6 = require(script:WaitForChild("NormalFireModule"))
local v7 = v1:WaitForChild("RemoteEvent"):WaitForChild("WeaponEvent")
local v_u_8 = v7:WaitForChild("ReplicateMovingFire")
local v9 = v7:WaitForChild("ReplicateHit")
local v10 = v7:WaitForChild("NormalFire")
local v11 = v7:WaitForChild("FireMovingPart")
local v_u_12 = v3.LocalPlayer
function MakeOtherCharacter_NormalFire(p13, p14, p15)
    local v16 = p15:FindFirstChild(p14)
    if v16 and v16:IsA("Tool") then
        v16 = v16:FindFirstChild("Handle")
    end
    if v16 then
        local v17 = v16:FindFirstChild("OnGunAtt")
        if v17 then
            OnNormalFire(v17, p13, p14, p15, false)
        end
    else
        return
    end
end
function MakeFireEffectOnAttachment(p18)
    local v19 = p18:FindFirstChild("Flash")
    local v_u_20 = p18:FindFirstChild("FlashLight")
    local v21 = p18:FindFirstChild("FireSnd")
    if v21 then
        if v21.IsPlaying then
            v21:Stop()
        end
        v21:Play()
    end
    if v19 then
        v19:Emit(1)
    end
    if v_u_20 then
        v_u_20.Enabled = true
        task.delay(0.1, function()
            -- upvalues: (copy) v_u_20
            v_u_20.Enabled = false
        end)
    end
end
function OnNormalFire(p22, p23, p24, p25, p26, p27)
    -- upvalues: (copy) v_u_6
    MakeFireEffectOnAttachment(p22)
    local v28 = p22.WorldPosition
    if typeof(p23) == "Vector3" then
        v_u_6.AnimateFire(v28, p23, p25, p24, p26, p27)
    else
        for v29, v30 in pairs(p23) do
            local v31
            if p27 then
                v31 = p27[v29]
            else
                v31 = p27
            end
            task.spawn(v_u_6.AnimateFire, v28, v30, p25, p24, p26, v31)
        end
    end
end
v10.Event:Connect(function(p32, p33, p34, p35, p36)
    -- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_8, (copy) v_u_12
    if p32 then
        local v37 = v_u_4(p32) or p33
        local v38 = p32.WorldPosition
        local v39, v40
        if p36 then
            v39 = {}
            v40 = {}
            for _ = 1, p36 do
                local v41 = (v38 - v37).Magnitude
                local v42 = Random.new():NextNumber() * p35 * v41 / 1000
                local v43 = math.random(0, 360)
                local v44 = math.rad(v43)
                local v45 = (CFrame.lookAt(v37, v38) * CFrame.new(v42 * math.sin(v44), v42 * math.cos(v44), 0)).Position
                local v46 = v_u_2
                table.insert(v39, v46:GenerateGUID(false))
                table.insert(v40, v45)
            end
        else
            v39 = v_u_2:GenerateGUID(false)
            v40 = v37
        end
        v_u_8:FireServer(v38, v40, v39)
        OnNormalFire(p32, v40, p34, v_u_12.Character, true, v39)
    end
end)
function MakeOtherCharacter_MovingFire(p47, p48, p49, p50, p51, p52, p53)
    -- upvalues: (copy) v_u_12, (copy) v_u_5
    local v54 = v_u_12:GetNetworkPing()
    local v55 = p51 and p51:FindFirstChild(p49)
    if v55 then
        v55 = p51[p49]:FindFirstChild("ForFireAtt", true)
    end
    if v55 then
        MakeFireEffectOnAttachment(v55)
    end
    v_u_5.Fire(p47, p49, p48, p51, p52, v54, p50, p53)
end
v11.Event:Connect(function(p56, p57, p58, p59)
    -- upvalues: (copy) v_u_2, (copy) v_u_12, (copy) v_u_4, (copy) v_u_8, (copy) v_u_5
    local v60 = v_u_2:GenerateGUID(false)
    local v61 = v_u_12.Character
    local v62 = v61:FindFirstChild(p58)
    if v62 then
        v62 = v61[p58]:FindFirstChild("ForFireAtt", true)
    end
    if v62 then
        MakeFireEffectOnAttachment(v62)
    end
    local v63 = v_u_4(v62) or p57
    v_u_8:FireServer(p56, v63, v60)
    v_u_5.Fire(p56, p58, v63, v61, v60, nil, nil, p59)
end)
v9.OnClientEvent:Connect(function(p64, p65)
    -- upvalues: (copy) v_u_5
    if v_u_5.AllFireParts[p64] then
        v_u_5.ServerHit(p64, p65)
    end
end)
v_u_8.OnClientEvent:Connect(function(p66, ...)
    if p66 then
        MakeOtherCharacter_NormalFire(...)
    else
        MakeOtherCharacter_MovingFire(...)
    end
end)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.LaserReplication
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.AllModules.ToolModules.LaserReplicator)
v1.RemoteEvent.LaserWeaponFireEvent.OnClientEvent:Connect(function(p3, p4, p5, p6, p7)
    -- upvalues: (copy) v_u_2
    if p4 and (p5 and p5:IsDescendantOf(workspace)) then
        v_u_2.AddPlrBeam(p3, (p5.CFrame * p4).Position, p5, nil, p7)
    else
        v_u_2.RemovePlrAtt(p3, p6)
    end
end)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.LocalDropPart
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local v3 = game:GetService("Players")
local v_u_4 = game:GetService("Debris")
local v5 = v3.LocalPlayer
local v_u_6 = nil
local v_u_7 = v1.DropParts
local v_u_8 = v5:WaitForChild("Settings"):WaitForChild("Droppers")
local v_u_9 = workspace:WaitForChild("Camera")
local v_u_10 = workspace.Zones
local v_u_11 = {}
local v_u_12 = require(v1.AllModules.DroppersAndUpgraders).Droppers
local v13 = require(v1.AllModules.GetTowerForPlayer)
function EnableDropperLoop(p14, p15)
    -- upvalues: (copy) v_u_12, (copy) v_u_9, (copy) v_u_7, (copy) v_u_4
    local _ = p14.Name
    local v16 = v_u_12[p14.Name:split(" (")[1]]
    local v17 = v16.DroppableList
    if v17 then
        if p15 == 0 then
            task.wait()
        end
        task.wait(p15)
        local v18 = p14.Parent.Parent:WaitForChild("DropPartsFolder")
        local v19 = (p14:GetAttribute("MovingTime") or 1) + 0.5
        local v20 = {}
        local v21 = v16.DropPartNumber or 1
        if v21 == 1 then
            local v22 = p14:WaitForChild("DropPart").Position
            table.insert(v20, v22)
        else
            for v23 = 1, v21 do
                local v24 = p14:WaitForChild("DropPart-" .. v23).Position
                table.insert(v20, v24)
                if not p14.Parent then
                    return
                end
            end
        end
        if p14.Parent then
            local v25 = v16.DropDelay
            while true do
                for _, v26 in pairs(v20) do
                    if not p14.Parent then
                        return
                    end
                    local v27 = v_u_9.CFrame.Position
                    local v28 = v_u_9.CFrame.Position.Y - v26.Y
                    if math.abs(v28) < 30 and (v27 - v26).Magnitude < 225 then
                        local v29 = v_u_7[v17[math.random(1, #v17)]]:Clone()
                        v29:PivotTo(CFrame.new(v26))
                        v29.Parent = v18
                        v_u_4:AddItem(v29, v19)
                    end
                    task.wait(v25)
                end
            end
        else
            return
        end
    else
        return
    end
end
function AddDropper(p30, p31)
    -- upvalues: (ref) v_u_6, (copy) v_u_11
    if DropperSetting == "OFF" then
        return
    elseif DropperSetting ~= "ON_Limited" or p30.Parent.Parent == v_u_6 then
        v_u_11[p30] = task.spawn(EnableDropperLoop, p30, p31)
    end
end
v_u_2:GetInstanceAddedSignal("Dropper"):Connect(function(p32)
    AddDropper(p32, 1)
end)
v_u_2:GetInstanceRemovedSignal("Dropper"):Connect(function(p33)
    -- upvalues: (copy) v_u_11
    if v_u_11[p33] then
        task.cancel(v_u_11[p33])
    end
    v_u_11[p33] = nil
end)
DropperSetting = v_u_8.Value
v_u_8.Changed:Connect(function()
    -- upvalues: (copy) v_u_8, (copy) v_u_10, (ref) v_u_6, (copy) v_u_11, (copy) v_u_2
    DropperSetting = v_u_8.Value
    if DropperSetting == "ON" then
        for _, v34 in pairs(v_u_2:GetTagged("Dropper")) do
            AddDropper(v34, math.random(0, 4))
        end
    else
        for _, v35 in pairs(v_u_10:GetChildren()) do
            if (v35 ~= v_u_6 or DropperSetting ~= "ON_Limited") and v35:FindFirstChild("DropPartsFolder") then
                v35.DropPartsFolder:ClearAllChildren()
            end
        end
        for v36, v37 in pairs(v_u_11) do
            if v36.Parent.Parent ~= v_u_6 or DropperSetting ~= "ON_Limited" then
                task.cancel(v37)
                v_u_11[v36] = nil
            end
        end
    end
end)
if DropperSetting ~= "OFF" then
    for _, v38 in pairs(v_u_2:GetTagged("Dropper")) do
        AddDropper(v38, math.random(0, 4))
    end
end
v_u_6 = v13(v5, true)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.ExplosionReplicator
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage").RemoteEvent.WeaponEvent.ExplosionReplicator
local v2 = require(script.AnimateExplosion)
v1.OnClientEvent:Connect(v2)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.BossSpawnScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = workspace.Terrain.BossSpawn
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = require(game:GetService("ReplicatedStorage").AllModules.CheckPosition).CheckIfIn
local v_u_4 = v_u_1.CollisionPart
local v_u_5 = v_u_4.DoorSlideSound
local v6 = v_u_1.LDoor
local v_u_7 = v6.Border
local v_u_8 = v6.MainDoor
local v9 = v_u_1.RDoor
local v_u_10 = v9.Border
local v_u_11 = v9.MainDoor
local v_u_12 = false
local v_u_13 = 0
local v_u_14 = 0
function MoveDoors(p15)
    -- upvalues: (ref) v_u_13, (copy) v_u_8, (copy) v_u_7, (copy) v_u_11, (copy) v_u_10
    local v16 = p15 - v_u_13
    v_u_13 = p15
    local v17 = v_u_8
    v17.CFrame = v17.CFrame * CFrame.new(v16 / 2, 0, 0)
    local v18 = v_u_8
    v18.Size = v18.Size - v16 * Vector3.new(1, 0, 0)
    local v19 = v_u_7
    v19.CFrame = v19.CFrame * CFrame.new(v16, 0, 0)
    local v20 = v_u_11
    v20.CFrame = v20.CFrame * CFrame.new(-v16 / 2, 0, 0)
    local v21 = v_u_11
    v21.Size = v21.Size - v16 * Vector3.new(1, 0, 0)
    local v22 = v_u_10
    v22.CFrame = v22.CFrame * CFrame.new(-v16, 0, 0)
end
function ToggleDoors(_)
    -- upvalues: (copy) v_u_1, (ref) v_u_12, (copy) v_u_5, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (ref) v_u_14, (ref) v_u_13
    local v23 = v_u_1:GetAttribute("Opened")
    if v_u_12 ~= v23 then
        v_u_12 = v23
        v_u_5:Play()
        if not v23 then
            local v24 = v_u_2.Character
            if v24 and v_u_3(v24:GetPivot(), v_u_4, v_u_4.Size.Y, 2, true) then
                v24:PivotTo(v_u_4.CFrame * CFrame.new(0, 0, -50))
            end
        end
        v_u_14 = v_u_14 + 1
        local v25 = v_u_14
        local v26 = v_u_12 and 10 or 0
        local v27 = v26 - v_u_13
        local v28 = math.sign(v27)
        local v29 = 0
        local v30 = 0
        while v_u_13 ~= v26 do
            local v31 = v_u_13 + v28 * v29 * 8
            local v32 = math.clamp(v31, 0, 10)
            MoveDoors(v32)
            v29 = task.wait()
            if v25 ~= v_u_14 then
                return
            end
            v30 = v30 + v29
        end
    end
end
v_u_1:GetAttributeChangedSignal("Opened"):Connect(ToggleDoors)

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.TowerOptimization
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("CollectionService")
local v3 = game:GetService("Players").LocalPlayer
local v_u_4 = v_u_1.RemoteEvent.ElevatorEvents.CallElevatorEvent
local v_u_5 = nil
local v6 = require(script.Parent:WaitForChild("Client_CollectionScript").Client_OnModelWithOptimizedSGAdded).ChangeDisplay
local v_u_7 = require(v_u_1.AllModules.FloorLevelComputation).GetFloorLevelFromYPosition
local v_u_8 = require(script.AddElevatorDoorButtonGui)
local v_u_9 = require(v_u_1.AllModules.TycoonColors)
local v_u_10 = v_u_9.ColorModel
local v_u_11 = workspace.Camera
local v_u_12 = v_u_1.TowerMesh
local v_u_13 = v_u_12.Color1Part
local v14 = workspace.Zones
local v_u_15 = nil
local v_u_16 = 0
local v_u_17 = {}
local v18 = v_u_1.RemoteEvent.ClientCustomizationEvent
local v_u_19 = {}
v_u_19.__index = v_u_19
function SetCameraYPos()
    -- upvalues: (ref) v_u_15, (copy) v_u_11, (ref) v_u_16, (copy) v_u_7
    v_u_15 = v_u_11.CFrame.Position
    v_u_16 = v_u_7(v_u_15.Y)
end
function v_u_19.Initialize(p20)
    p20.OptimizationModel:PivotTo(p20.Pivot * CFrame.new(Vector3.new(0, 66, 0)))
    p20.LastYPos = 6
    p20.CurrentNumFloorBuilt = 0
end
function v_u_19.BuildWall(p21)
    -- upvalues: (copy) v_u_13, (copy) v_u_10
    if p21.NumFullyBuiltWalls < 6 then
        return
    elseif p21.CurrentNumFloorBuilt - 6 > 200 then
        SetCameraYPos()
        p21:MoveOptimized()
        return
    elseif p21.CurrentNumFloorBuilt < p21.NumFullyBuiltWalls then
        local v22 = p21.CurrentNumFloorBuilt == 0
        local v23
        if v22 then
            v23 = v_u_13:Clone()
            v_u_10(v23, p21.Tower)
        else
            v23 = nil
        end
        local v24 = p21.CurrentNumFloorBuilt + 1
        local v25 = math.max(6, v24)
        local v26 = p21.NumFullyBuiltWalls
        for v27 = v25, math.min(206, v26) do
            local v28
            if v22 then
                v28 = v23:Clone()
            else
                v28 = v_u_13:Clone()
                v_u_10(v28, p21.Tower)
            end
            v28:PivotTo(p21.Pivot * CFrame.new(Vector3.new(0, 11, 0) * v27))
            v28.Parent = p21.OptimizationModel
            local v29 = p21.OrderedWallParts
            table.insert(v29, v28)
        end
        p21.CurrentNumFloorBuilt = p21.NumFullyBuiltWalls
    end
end
function v_u_19.OnOwnerChanged(p_u_30)
    p_u_30.CurrentOwner = p_u_30.OwnerVal.Value
    if p_u_30.MaxBuildWall_C then
        p_u_30.MaxBuildWall_C:Disconnect()
    end
    if p_u_30.CurrentOwner then
        p_u_30.MaxBuildWall_C = p_u_30.Tower:GetAttributeChangedSignal("NumFullyBuiltWalls"):Connect(function()
            -- upvalues: (copy) p_u_30
            p_u_30:OnNumFullyBuiltWallsChanged()
        end)
        p_u_30:OnNumFullyBuiltWallsChanged()
        p_u_30:BuildWall()
    else
        table.clear(p_u_30.OrderedWallParts)
        p_u_30.OptimizationModel:ClearAllChildren()
        p_u_30:Initialize()
    end
end
function v_u_19.OnNumFullyBuiltWallsChanged(p31)
    p31.NumFullyBuiltWalls = p31.Tower:GetAttribute("NumFullyBuiltWalls") or 0
    if p31.CurrentOwner then
        p31:BuildWall()
    end
end
function v_u_19.MoveOptimized(p32)
    -- upvalues: (ref) v_u_16
    if p32.CurrentNumFloorBuilt - 6 <= 200 then
        return
    else
        local v33 = p32.NumFullyBuiltWalls - 200
        if v33 < 6 then
            warn("MaxYPos too low. MaxYPos:", v33, "NumFullyBuiltWalls", p32.NumFullyBuiltWalls, "CurrentNumFloorBuilt", p32.CurrentNumFloorBuilt)
            v33 = 6
        end
        local v34 = v_u_16 - 100
        local v35 = math.clamp(v34, 6, v33)
        local v36 = v35 - p32.LastYPos
        if p32.LastYPos == v35 or math.abs(v36) < 1 and (v35 ~= 6 and v35 ~= v33) then
            return
        else
            p32.LastYPos = v35
            local v37 = p32.Pivot * CFrame.new(Vector3.new(0, 1, 0) * v35 * 11)
            if math.abs(v36) >= 180 then
                p32.OptimizationModel:PivotTo(v37)
            else
                if v36 > 0 then
                    for v38 = 1, v36 do
                        local v39 = p32.OrderedWallParts[1]
                        v39:PivotTo(v37 * CFrame.new(Vector3.new(0, 1, 0) * (200 - v36 + v38) * 11))
                        table.remove(p32.OrderedWallParts, 1)
                        local v40 = p32.OrderedWallParts
                        table.insert(v40, v39)
                    end
                else
                    for v41 = 1, -v36 do
                        local v42 = p32.OrderedWallParts[201]
                        v42:PivotTo(v37 * CFrame.new(-(v36 + v41) * Vector3.new(0, 1, 0) * 11))
                        table.remove(p32.OrderedWallParts, 201)
                        local v43 = p32.OrderedWallParts
                        table.insert(v43, 1, v42)
                    end
                end
                p32.OptimizationModel.WorldPivot = v37
            end
        end
    end
end
function v_u_19.ChangeButtonColor(p44)
    if p44.IsCallButtonDisplayed then
        local v45
        if p44.ElevatorState == 1 or p44.ElevatorState == 2 then
            if p44.ElevatorTarget == p44.CallButtonFloorPos then
                v45 = Color3.new(0, 0, 1)
            else
                v45 = Color3.new(1, 1, 0)
            end
        elseif p44.ElevatorLevel == p44.CallButtonFloorPos then
            v45 = Color3.new(0, 1, 0)
        else
            v45 = Color3.new(1, 0, 0)
        end
        if p44.AppliedColor ~= v45 then
            p44.FloorLabel.TextStrokeColor3 = v45
            p44.CallBttn.Color = v45
            p44.AppliedColor = v45
        end
    else
        return
    end
end
function v_u_19.MoveAndChangeCallBttn(p46)
    -- upvalues: (copy) v_u_1, (ref) v_u_16
    local v47 = p46.LastElvdBuilt >= 1
    if p46.IsCallButtonDisplayed ~= v47 then
        if v47 then
            p46.CallButtonModel.Parent = p46.AllModels
        else
            p46.CallButtonModel.Parent = v_u_1
        end
        p46.IsCallButtonDisplayed = v47
    end
    if p46.IsCallButtonDisplayed then
        local v48 = v_u_16
        local v49 = p46.LastElvdBuilt
        local v50 = math.clamp(v48, 1, v49)
        if v50 == p46.CallButtonFloorPos then
            return
        end
        p46.CallButtonFloorPos = v50
        p46.CallButtonModel:PivotTo(p46.Pivot + Vector3.new(0, 11, 0) * v50)
        p46.FloorLabel.Text = v50
        p46:ChangeButtonColor()
    end
end
function v_u_19.OnLastElevatorDoorLevelChanged(p51)
    p51.LastElvdBuilt = p51.Tower:GetAttribute("LastElvDLevel")
    p51:MoveAndChangeCallBttn()
end
function v_u_19.OnElevaltorAddedOrRemoved(p_u_52, p_u_53)
    p_u_52.Elevator = p_u_53
    if p_u_53 then
        for _, v_u_54 in pairs({ "ElevatorState", "ElevatorLevel", "ElevatorTarget" }) do
            p_u_53:GetAttributeChangedSignal(v_u_54):Connect(function()
                -- upvalues: (copy) p_u_52, (copy) v_u_54, (copy) p_u_53
                p_u_52[v_u_54] = p_u_53:GetAttribute(v_u_54)
                p_u_52:ChangeButtonColor()
            end)
            p_u_52[v_u_54] = p_u_53:GetAttribute(v_u_54)
        end
    else
        p_u_52.ElevatorState = 0
        p_u_52.ElevatorLevel = 1
        p_u_52.ElevatorTarget = 1
    end
    p_u_52:ChangeButtonColor()
end
function MakeNewOptimizedTower(p_u_55)
    -- upvalues: (copy) v_u_19, (copy) v_u_12, (copy) v_u_4, (copy) v_u_8, (copy) v_u_17
    local v56 = v_u_19
    local v_u_57 = setmetatable({}, v56)
    v_u_57.Tower = p_u_55
    v_u_57.OwnerVal = p_u_55:WaitForChild("Owner")
    v_u_57.Pivot = p_u_55:GetPivot()
    v_u_57.Pos_2D = Vector2.new(v_u_57.Pivot.Position.X, v_u_57.Pivot.Position.Z)
    if not Ref_Y_Pos then
        Ref_Y_Pos = v_u_57.Pivot.Position.Y
    end
    v_u_57.AllModels = p_u_55:WaitForChild("AllModels")
    local v58 = Instance.new("Model", v_u_57.AllModels)
    v_u_57.OptimizationModel = v58
    v58.Name = "OptimizationModel"
    v_u_57.OrderedWallParts = {}
    v_u_57:Initialize()
    v_u_57.OwnerVal:GetPropertyChangedSignal("Value"):Connect(function()
        -- upvalues: (copy) v_u_57
        v_u_57:OnOwnerChanged()
    end)
    v_u_57:OnOwnerChanged()
    v_u_57.CallButtonModel = v_u_12.CallButtonModel:Clone()
    v_u_57.CallButtonFloorPos = 0
    v_u_57.IsCallButtonDisplayed = false
    v_u_57.LastElvdBuilt = 0
    v_u_57.CallBttn = v_u_57.CallButtonModel.CallButton
    v_u_57.FloorLabel = v_u_57.CallButtonModel.SurfaceGui.Level
    p_u_55:GetAttributeChangedSignal("LastElvDLevel"):Connect(function()
        -- upvalues: (copy) v_u_57
        v_u_57:OnLastElevatorDoorLevelChanged()
    end)
    v_u_57:OnLastElevatorDoorLevelChanged()
    v_u_57.CallBttn.ClickDetector.MouseClick:Connect(function()
        -- upvalues: (copy) v_u_57, (ref) v_u_4, (ref) v_u_8, (copy) p_u_55
        if v_u_57.Elevator and v_u_57.IsCallButtonDisplayed then
            if v_u_57.ElevatorState <= 0 and v_u_57.ElevatorLevel ~= v_u_57.CallButtonFloorPos then
                v_u_4:FireServer(v_u_57.Elevator, v_u_57.CallButtonFloorPos)
                v_u_8(v_u_57.CallBttn, v_u_57.CallButtonFloorPos, v_u_57.Elevator, v_u_57.ElevatorState, p_u_55)
            end
        else
            return
        end
    end)
    v_u_57:OnElevaltorAddedOrRemoved(v_u_57.AllModels:FindFirstChild("Elevator"))
    v_u_17[p_u_55] = v_u_57
end
v18.OnClientEvent:Connect(function(p59, p60)
    -- upvalues: (copy) v_u_9, (copy) v_u_17, (copy) v_u_10
    v_u_9.RemoveColorToApplyToTycoon(p59.Name)
    if p60 and v_u_17[p59] then
        v_u_10(v_u_17[p59].OptimizationModel, p59)
    end
end)
local v61 = v_u_16
local v_u_62 = v_u_15
for _, v63 in pairs(v14:GetChildren()) do
    MakeNewOptimizedTower(v63)
    task.wait()
end
v14.ChildAdded:Connect(MakeNewOptimizedTower)
local v_u_64 = v3:WaitForChild("Tycoon")
local v_u_65 = v_u_64.Value
task.spawn(function()
    -- upvalues: (ref) v_u_65, (copy) v_u_64, (ref) v_u_5
    while not v_u_65 do
        v_u_64:GetPropertyChangedSignal("Value"):Wait()
        v_u_65 = v_u_64.Value
    end
    v_u_5 = require(script.Parent:WaitForChild("LocalButtonScript"):WaitForChild("ButtonHandler"))
end)
function AddOrRemoveElevator(p66, p67)
    -- upvalues: (copy) v_u_17
    local v68 = p66.Parent.Parent
    for v69, v70 in pairs(v_u_17) do
        if v68 == v69 then
            v70:OnElevaltorAddedOrRemoved(p67 and p66 and p66 or nil)
            return
        end
    end
end
v2:GetInstanceAddedSignal("Elevator"):Connect(function(p71)
    AddOrRemoveElevator(p71, true)
end)
v2:GetInstanceRemovedSignal("Elevator"):Connect(function(p72)
    AddOrRemoveElevator(p72, false)
end)
function GetClosestTower()
    -- upvalues: (copy) v_u_17, (ref) v_u_62
    local v73 = (1 / 0)
    local v74 = nil
    for _, v75 in pairs(v_u_17) do
        local v76 = (Vector2.new(v_u_62.X, v_u_62.Z) - v75.Pos_2D).Magnitude
        if v76 < v73 then
            v74 = v75
            v73 = v76
        end
    end
    return v74
end
local v77 = nil
while task.wait(0.2) do
    if Ref_Y_Pos then
        SetCameraYPos()
        local v78 = GetClosestTower()
        if v61 ~= v77 then
            v77 = v61
            for _, v79 in pairs(v_u_17) do
                local v80, v81 = pcall(v79.MoveOptimized, v79)
                if not v80 then
                    warn(v81)
                end
                local v82, v83 = pcall(v79.MoveAndChangeCallBttn, v79)
                if not v82 then
                    warn(v83)
                end
            end
        end
        if v_u_5 then
            local v84, v85 = pcall(v_u_5.SetCameraYFloor, v_u_62, v61)
            if not v84 then
                warn(v85)
            end
        end
        local v86, v87 = pcall(v6, v78.AllModels, v78.NumFullyBuiltWalls or 0, v61)
        if not v86 then
            warn(v87)
        end
    end
end

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.AssetPreloader
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ContentProvider")
local v2 = { game.ReplicatedStorage.TowerMesh.Color1Part }
local v3 = 1
while v3 > 0 do
    v1:PreloadAsync(v2)
    v3 = 0
end

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.RbxCharacterSounds
--========================================
-- Ignored

--========================================
-- LocalScript : StarterPlayer.StarterPlayerScripts.PlayerScriptsLoader
--========================================
-- Ignored

--========================================
-- LocalScript : StarterGui.MainGui.MainGuiScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("ContextActionService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("UserInputService")
game:GetService("Workspace")
local v4 = game:GetService("Players")
local _ = v4.LocalPlayer
local v_u_5 = script.Parent
local v_u_6 = require(script.GetJumpButton)
local v_u_7 = require(script.CashButtonModule)
local v_u_8 = require(script.ToggleFrameModule)
local v9 = require(v2.AllModules.GetRestriction)("CanInvitePlayers")
local v_u_10 = v4.LocalPlayer
local _ = v_u_10.PlayerGui
local v11 = v_u_5.ButtonContainer.InviteBttn
local v_u_12 = v_u_5.LowerFrameContainer
local v_u_13 = v_u_12.ToolFrame
local v_u_14 = v_u_5:WaitForChild("GunFrame")
local v_u_15 = v_u_14:WaitForChild("UpgradeButton")
local v_u_16 = v_u_14:WaitForChild("FrameForButtons")
local v_u_17 = v_u_15:WaitForChild("UIStroke")
local v_u_18 = v_u_16:WaitForChild("UIGridLayout")
local v_u_19 = v_u_12.FrameForToolButtons.MainToolButton
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = nil
function PlaceGui()
    -- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_14, (copy) v_u_17, (copy) v_u_15, (copy) v_u_16, (copy) v_u_19, (ref) v_u_20, (copy) v_u_18, (copy) v_u_12, (ref) v_u_21, (ref) v_u_22, (copy) v_u_13
    local v23 = v_u_5.AbsoluteSize.Y
    local v24 = 0.013 * v23
    _G.ConstantOffset = v24
    local _ = 0.00629 * v23
    v_u_7.PlaceCash()
    local v25 = 0.0348 * v_u_14.AbsoluteSize.Y + 0.5
    local v26 = math.floor(v25)
    v_u_14.UIStroke.Thickness = v26
    v_u_17.Thickness = v26
    v_u_15.Position = UDim2.new(1, 0, 0, -v26)
    v_u_16.Position = UDim2.new(0, -v24 - v26, 0.5)
    local v27 = v_u_19.AbsoluteSize.X * (v_u_20 and v_u_20.Visible and 1.5 or 1)
    v_u_18.CellSize = UDim2.fromOffset(v27, v27)
    v_u_12.Position = UDim2.new(0.5, 0, 1, -v24)
    v_u_12.UIListLayout.Padding = UDim.new(0, 1.5 * v24)
    if v_u_20 and v_u_20.Visible then
        v_u_14.Position = UDim2.fromOffset(v_u_21.X + v_u_22 / 2, v_u_21.Y - 2 * v24)
        v_u_14.AnchorPoint = Vector2.new(0.5, 1)
    else
        v_u_14.AnchorPoint = Vector2.new(1, 1)
        v_u_14.Position = UDim2.new(1, -v24, 1, -v24 - v_u_13.AbsoluteSize.Y)
    end
end
task.defer(function()
    -- upvalues: (ref) v_u_20, (copy) v_u_6, (ref) v_u_21, (ref) v_u_22, (copy) v_u_1
    v_u_20 = v_u_6(15)
    if v_u_20 then
        v_u_1:BindAction("Test", function() end, true)
        local v28 = v_u_1:GetButton("Test").AbsoluteSize.X
        v_u_1:UnbindAction("Test")
        script:SetAttribute("CAS_Button_Size", v28)
        v_u_20.Changed:Connect(function(p29)
            -- upvalues: (ref) v_u_21, (ref) v_u_20, (ref) v_u_22
            if p29 ~= "Position" then
                v_u_21 = v_u_20.AbsolutePosition
                v_u_22 = v_u_20.AbsoluteSize.Y
                PlaceGui()
            end
        end)
        v_u_21 = v_u_20.AbsolutePosition
        v_u_22 = v_u_20.AbsoluteSize.Y
        PlaceGui()
    end
end)
if v9 then
    local v_u_30 = game:GetService("SocialService")
    v11.Activated:Connect(function()
        -- upvalues: (copy) v_u_30, (copy) v_u_10, (copy) v_u_8
        v_u_30:PromptGameInvite(v_u_10)
        v_u_8.CloseOpenedFrame()
    end)
else
    v11.Visible = false
end
if v3.KeyboardEnabled or v3.GamepadEnabled then
    v3.InputBegan:Connect(function(p31, p32)
        -- upvalues: (copy) v_u_8
        if not p32 then
            if p31.KeyCode == Enum.KeyCode.X or p31.KeyCode == Enum.KeyCode.ButtonB then
                v_u_8.CloseOpenedFrame()
            end
        end
    end)
end
PlaceGui()
v_u_5:GetPropertyChangedSignal("AbsoluteSize"):Connect(PlaceGui)
task.delay(10, PlaceGui)

--========================================
-- LocalScript : StarterGui.MainGui.BuyDevProductFrame.DevProductFrame
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("MarketplaceService")
local v_u_2 = game.Players.LocalPlayer
local v_u_3 = v_u_2.leaderstats:WaitForChild("Level")
local v_u_4 = script.Parent
local v5 = v_u_4.Parent
local v6 = v_u_4.CanvasGroup
local v7 = v5.CashImgButton
local v_u_8 = v6.UIPageLayout
local v_u_9 = v6.BuyCashFrame
local v_u_10 = v6.BuyTickets
local v11 = v_u_10.ButtonTickets
local v12 = v_u_10.DropperTickets
local v_u_13 = {
    v12["1_Ticket"],
    v12["3_Ticket"],
    v12["5_Ticket"],
    v11["1_Ticket"],
    v11["3_Ticket"],
    v11["5_Ticket"]
}
local v_u_14 = {
    [v_u_9] = {
        ["AssociatedButton"] = v_u_4.CashButton,
        ["SelectedBttnSize"] = UDim2.fromScale(0.363, 0.132),
        ["StrokeThickness"] = 2
    },
    [v_u_10] = {
        ["AssociatedButton"] = v_u_4.TicketButton,
        ["SelectedBttnSize"] = UDim2.fromScale(0.385, 0.132),
        ["StrokeThickness"] = 2
    }
}
local v15 = game:GetService("ReplicatedStorage").AllModules
local v_u_16 = require(v15.BuyCash.BuyCashModule)
local v_u_17 = require(v5.MainGuiScript.ToggleFrameModule)
local v_u_18 = require(v15.ConvertVal).SimpleConversion
local v19 = require(v15.TicketsDescription)
local v_u_20 = require(v5.OwnedTickets.OwnedTicketGuiModule)
local v_u_21 = require(v15.GetTowerForPlayer)
local v_u_22 = v_u_16.SlotName
local v_u_23 = v_u_4.OpenArgument
local v_u_24 = false
local v_u_25 = game:GetService("SoundService"):WaitForChild("Sound"):WaitForChild("ClickSound")
v12.ForTitleFrame.DescriptionLabel.Text = v19.Dropper.TicketDescriptionText
v11.ForTitleFrame.DescriptionLabel.Text = v19.Button.TicketDescriptionText
function LoadAPrice(p_u_26)
    -- upvalues: (copy) v_u_1
    while true do
        local v27, v28 = pcall(function()
            -- upvalues: (ref) v_u_1, (copy) p_u_26
            return v_u_1:GetProductInfo(p_u_26, Enum.InfoType.Product).PriceInRobux
        end)
        if not v27 then
            print(v28)
            task.wait(0.5)
        end
        if v27 and (v28 and v28 ~= 0) then
            return v28
        end
    end
end
local v_u_29 = false
function LoadTicketPrices(p30)
    -- upvalues: (ref) v_u_29, (copy) v_u_13, (copy) v_u_25, (copy) v_u_1, (copy) v_u_2
    if not v_u_29 then
        v_u_29 = true
        for _, v31 in pairs(v_u_13) do
            local v_u_32 = v31:GetAttribute("DevProductId")
            local v33 = v31.FrameForPrice.Price
            local v34 = LoadAPrice(v_u_32)
            v33.Text = utf8.char(57346) .. v34
            if p30 then
                v31.Activated:Connect(function()
                    -- upvalues: (ref) v_u_25, (ref) v_u_1, (ref) v_u_2, (copy) v_u_32
                    v_u_25:Play()
                    v_u_1:PromptProductPurchase(v_u_2, v_u_32)
                end)
            end
        end
        v_u_29 = false
    end
end
function PlaceCashBuyButtons()
    -- upvalues: (ref) v_u_24, (copy) v_u_4, (copy) v_u_22, (copy) v_u_9, (copy) v_u_18, (copy) v_u_16, (copy) v_u_3
    v_u_24 = true
    local v35 = v_u_4.AbsoluteSize.Y / 258.48
    for v36, v37 in pairs(v_u_22) do
        local v38 = v_u_9[v37]
        if v36 <= 5 then
            v38.UIStroke.Thickness = v35 * 2
        else
            v38.UIStroke.Thickness = v35 * 3
        end
        v38.CoinVal.Text = v_u_18(v_u_16.GetCashFor(v_u_3.Value, v37))
    end
end
local v_u_39 = v_u_24
for _, v40 in pairs(v_u_22) do
    local v_u_41 = v_u_9[v40]
    local v_u_42 = v_u_41:GetAttribute("AssociatedProductId")
    v_u_41.Activated:Connect(function()
        -- upvalues: (copy) v_u_25, (copy) v_u_1, (copy) v_u_2, (copy) v_u_42
        v_u_25:Play()
        v_u_1:PromptProductPurchase(v_u_2, v_u_42)
    end)
    v_u_41.MouseEnter:Connect(function()
        -- upvalues: (copy) v_u_41
        v_u_41.ZIndex = 2
    end)
    v_u_41.MouseLeave:Connect(function()
        -- upvalues: (copy) v_u_41
        v_u_41.ZIndex = 1
    end)
    local v43 = LoadAPrice(v_u_42)
    v_u_41.RobuxVal.Text = utf8.char(57346) .. v_u_18(v43)
end
function OnPageChanged()
    -- upvalues: (copy) v_u_8, (copy) v_u_14, (copy) v_u_10, (copy) v_u_21, (copy) v_u_2, (copy) v_u_20, (copy) v_u_4
    local v44 = v_u_8.CurrentPage
    for v45, v46 in pairs(v_u_14) do
        local v47 = v46.AssociatedButton
        if v44 == v45 then
            v47.BackgroundColor3 = Color3.new(1, 1, 1)
            v47.UIStroke.Thickness = v46.StrokeThickness * 2
            v47.Size = v46.SelectedBttnSize
        else
            v47.BackgroundColor3 = Color3.new(0.6, 0.6, 0.6)
            v47.UIStroke.Thickness = v46.StrokeThickness
            v47.Size = UDim2.fromScale(v46.SelectedBttnSize.X.Scale * 0.7, v46.SelectedBttnSize.Y.Scale * 0.7)
        end
    end
    if v44 == v_u_10 then
        local v48 = v_u_21(v_u_2, false)
        local v49 = v48 and v48.AllModels:FindFirstChild("TicketMachine") and "UseTicketFrame" or nil
        v_u_20.EnableGui(v_u_4, UDim2.fromScale(0.175, 0.3), UDim2.fromScale(1.03, 0.5), Vector2.new(0, 0.5), v49)
    else
        v_u_20.DisableGui(v_u_4)
    end
end
function OnDevProductFrameVisibleChanged()
    -- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_23, (copy) v_u_14
    if not v_u_4.Visible then
        return
    end
    local v50 = v_u_8.CurrentPage
    local v51 = v_u_23.Value
    if v51 then
        for v52, _ in pairs(v_u_14) do
            if v52.Name == v51 then
                if v50.Name ~= v51 then
                    v_u_8:JumpTo(v52)
                    return
                end
                break
            end
        end
    end
    OnPageChanged()
end
for v_u_53, v54 in pairs(v_u_14) do
    v54.AssociatedButton.Activated:Connect(function()
        -- upvalues: (copy) v_u_25, (copy) v_u_8, (copy) v_u_53
        v_u_25:Play()
        v_u_8:JumpTo(v_u_53)
    end)
end
v7.Activated:Connect(function()
    -- upvalues: (ref) v_u_39, (copy) v_u_17, (copy) v_u_4, (copy) v_u_9
    if not v_u_39 then
        PlaceCashBuyButtons()
    end
    v_u_17.ToggleFrame(v_u_4, nil, nil, v_u_9.Name)
end)
v_u_3.Changed:Connect(PlaceCashBuyButtons)
PlaceCashBuyButtons()
v_u_4:GetPropertyChangedSignal("Visible"):Connect(OnDevProductFrameVisibleChanged)
v_u_8:GetPropertyChangedSignal("CurrentPage"):Connect(OnPageChanged)
OnDevProductFrameVisibleChanged()
task.spawn(LoadTicketPrices, true)

--========================================
-- LocalScript : StarterGui.MainGui.SpinFrame.SpinScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("MarketplaceService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("SoundService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("Players").LocalPlayer
local v_u_7 = script.Parent
local v_u_8 = v_u_7:WaitForChild("SpinButton")
local v9 = v_u_7.Parent.ButtonContainer.SpinBttn
local v_u_10 = v_u_7:WaitForChild("SpinImage")
local v_u_11 = v_u_7:WaitForChild("SpinAgainBttn")
local v_u_12 = v_u_7:WaitForChild("CloseBttn")
local v_u_13 = v2.RemoteFunction.DailyRewardF
local v14 = v2.AllModules
local v_u_15 = require(v14.GetRestriction)("ArePaidRandomItemsRestricted")
local v_u_16 = v_u_7:WaitForChild("PremiumButton")
local v_u_17 = require(v14.UsefullFunction)
local v_u_18 = require(v14.DailySpinReward)
local v_u_19 = require(v14.BuyCash.BuyCashModule).CashAtLevel
local v_u_20 = require(v14.ConvertVal)
local v_u_21 = require(v14.GuiMark).AddMark(v9)
local v_u_22 = v_u_6:WaitForChild("Stats").DailySpinStats.RemainingDailySpin
local v_u_23 = v_u_6.leaderstats.Level
local v_u_24 = false
local v_u_25 = v3.Sound.SpinTickSound
local v_u_26 = {
    v_u_10:WaitForChild("DiamondKeyLabel"),
    v_u_10:WaitForChild("WoodenKeyLabel"),
    v_u_10:WaitForChild("StoneKeyLabel"),
    v_u_10:WaitForChild("SilverKeyLabel"),
    v_u_10:WaitForChild("GoldenKeyLabel")
}
local v_u_27 = nil
function DisablePremiumButton()
    -- upvalues: (ref) v_u_27, (copy) v_u_16
    if v_u_27 then
        v_u_27:Disconnect()
    end
    v_u_16.Active = false
    v_u_16.AutoButtonColor = false
end
if v_u_6.MembershipType == Enum.MembershipType.Premium then
    DisablePremiumButton()
else
    v_u_27 = v_u_16.MouseButton1Click:Connect(function()
        -- upvalues: (ref) v_u_24, (copy) v_u_6, (copy) v_u_1
        if v_u_24 then
            return
        elseif v_u_6.MembershipType == Enum.MembershipType.Premium then
            DisablePremiumButton()
        else
            v_u_24 = true
            v_u_1:PromptPremiumPurchase(v_u_6)
            v_u_1.PromptPremiumPurchaseFinished:Wait()
            v_u_24 = false
            task.wait(0.2)
            if v_u_6.MembershipType == Enum.MembershipType.Premium then
                DisablePremiumButton()
            end
        end
    end)
end
function ScaleSpinBttn()
    -- upvalues: (copy) v_u_22, (copy) v_u_8
    if v_u_22.Value > 0 then
        v_u_8.TextSize = 0.38 * v_u_8.AbsoluteSize.X
    else
        v_u_8.TextSize = 0.27 * v_u_8.AbsoluteSize.X
    end
end
function ScaleText()
    -- upvalues: (copy) v_u_10, (copy) v_u_26, (copy) v_u_16, (copy) v_u_8
    local v28 = v_u_10.DiamondKeyLabel.AbsoluteSize.X
    for _, v29 in pairs(v_u_26) do
        v29.TextSize = 0.2 * v28
    end
    local v30 = v_u_16.AbsoluteSize.X
    v_u_16.TextSize = 0.203 * v30
    v_u_16:WaitForChild("UIStroke").Thickness = 0.01785 * v30
    local v31 = v_u_8.AbsoluteSize.X
    v_u_8:WaitForChild("UIStroke").Thickness = 0.0396 * v31
    v_u_10.Size = UDim2.new(1, -0.1 * v31, 1, -0.1 * v31)
    ScaleSpinBttn()
end
v_u_7:GetPropertyChangedSignal("Visible"):Connect(ScaleText)
ScaleText()
local v_u_32 = { v_u_10.Coin1Label, v_u_10.Coin2Label, v_u_10.Coin3Label }
local v_u_33 = { 180, 45, 270 }
function CoinRewUpdate()
    -- upvalues: (copy) v_u_17, (copy) v_u_23, (copy) v_u_19, (copy) v_u_32, (copy) v_u_33, (copy) v_u_18, (copy) v_u_20
    local v34 = v_u_19[v_u_17.GetEffectiveRewLevel(v_u_23.Value)]
    for v35, v36 in pairs(v_u_32) do
        local v37 = v_u_33[v35]
        local v38 = v_u_18[v37][1]:sub(6, -1)
        local v39 = v_u_18[v37][2]
        v36.Text = "$" .. v_u_20.SimpleConversion(v34[v38] * v39)
    end
end
v_u_23:GetPropertyChangedSignal("Value"):Connect(CoinRewUpdate)
CoinRewUpdate()
if v_u_15 then
    v_u_11.Visible = false
end
function IncreaseTime()
    -- upvalues: (copy) v_u_22, (copy) v_u_8, (copy) v_u_20, (copy) v_u_7
    while v_u_22.Value <= 0 do
        v_u_8.Text = "Next in\n" .. v_u_20.GetTimeBeforeNextDay()
        task.wait(1)
        if not v_u_7.Visible then
            v_u_7:GetPropertyChangedSignal("Visible"):Wait()
        end
    end
end
local v_u_40 = true
function BuyForSpin()
    -- upvalues: (ref) v_u_24, (copy) v_u_15, (copy) v_u_12, (copy) v_u_1, (copy) v_u_6, (copy) v_u_22
    if not (v_u_24 or v_u_15) then
        v_u_24 = true
        v_u_12.Visible = false
        v_u_1:PromptProductPurchase(v_u_6, 1555393231)
        v_u_1.PromptProductPurchaseFinished:Wait()
        v_u_24 = false
        v_u_12.Visible = true
        if v_u_22.Value > 0 then
            Spin()
        end
    end
end
v_u_11.Activated:Connect(BuyForSpin)
function UpdateSpinBttn()
    -- upvalues: (copy) v_u_22, (copy) v_u_8, (copy) v_u_15, (copy) v_u_11, (copy) v_u_21
    ScaleSpinBttn()
    if v_u_22.Value <= 0 then
        v_u_8.BackgroundColor3 = Color3.fromRGB(255, 76, 76)
        v_u_8.UIGreenGradient.Enabled = false
        v_u_8.UIRedGradient.Enabled = true
        v_u_8.Text = "Next in\n11h52m22s"
        if not v_u_15 then
            v_u_11.Visible = true
        end
        v_u_21:Hide()
        task.defer(IncreaseTime)
    else
        v_u_8.BackgroundColor3 = Color3.fromRGB(88, 255, 76)
        v_u_8.UIGreenGradient.Enabled = true
        v_u_8.UIRedGradient.Enabled = false
        v_u_8.Text = "Spin!\n" .. v_u_22.Value .. " left"
        v_u_11.Visible = false
        v_u_21:Show()
    end
end
v_u_22.Changed:Connect(UpdateSpinBttn)
UpdateSpinBttn()
function Spin()
    -- upvalues: (ref) v_u_40, (copy) v_u_13, (copy) v_u_10
    if v_u_40 then
        v_u_40 = false
        if not v_u_13:InvokeServer(v_u_10.Rotation) then
            warn("Problem with spin")
        end
        v_u_40 = true
    end
end
v_u_8.Activated:Connect(function()
    -- upvalues: (ref) v_u_40, (ref) v_u_24, (copy) v_u_22
    if v_u_40 and not v_u_24 then
        if v_u_22.Value > 0 then
            Spin()
        else
            BuyForSpin()
        end
    else
        return
    end
end)
local v_u_41 = TweenInfo.new(6.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
function v_u_13.OnClientInvoke(p42, p43)
    -- upvalues: (copy) v_u_10, (copy) v_u_4, (copy) v_u_41, (copy) v_u_25, (copy) v_u_5
    v_u_10.Rotation = p42
    local v_u_44 = v_u_4:Create(v_u_10, v_u_41, {
        ["Rotation"] = p43
    })
    v_u_44:Play()
    task.defer(function()
        -- upvalues: (ref) v_u_10, (ref) v_u_25, (copy) v_u_44, (ref) v_u_5
        local v45 = v_u_10.Rotation
        local _ = v_u_10.Rotation
        v_u_25.Volume = 4
        while v_u_44.PlaybackState == Enum.PlaybackState.Playing do
            local v46 = v_u_10.Rotation % 45
            if v46 < v45 then
                v_u_25:Play()
            end
            v_u_5.Heartbeat:Wait()
            v45 = v46
        end
    end)
    v_u_44.Completed:Wait()
    return true
end

--========================================
-- LocalScript : StarterGui.MainGui.ButtonContainer.MuteBttn.MuteBttnScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("SoundService")
local v3 = game:GetService("Players").LocalPlayer
local v4 = script.Parent
local v_u_5 = v4:WaitForChild("ImageLabel")
local v_u_6 = v4:WaitForChild("UIGradient")
local v_u_7 = v1:WaitForChild("BindableEvents"):WaitForChild("SettingsEvent"):WaitForChild("Music")
local v_u_8 = v2:WaitForChild("Sound"):WaitForChild("ClickSound")
while not v3:GetAttribute("DataFullyLoaded") do
    v3:GetAttributeChangedSignal("DataFullyLoaded"):Wait()
end
local v_u_9 = v3.Settings.Music.Value
local v_u_10 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 255, 25)), ColorSequenceKeypoint.new(0.7, Color3.fromRGB(100, 255, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(175, 255, 175)) })
local v_u_11 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 25, 25)), ColorSequenceKeypoint.new(0.7, Color3.fromRGB(255, 100, 100)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 175, 175)) })
function ChangeMuteButtonAppearance(p12)
    -- upvalues: (ref) v_u_9, (copy) v_u_5, (copy) v_u_6, (copy) v_u_10, (copy) v_u_11
    v_u_9 = p12
    if p12 then
        v_u_5.Image = "rbxassetid://470648206"
        v_u_6.Color = v_u_10
    else
        v_u_5.Image = "http://www.roblox.com/asset/?id=470648244"
        v_u_6.Color = v_u_11
    end
end
ChangeMuteButtonAppearance(v_u_9)
v_u_7.Event:Connect(ChangeMuteButtonAppearance)
v4.Activated:Connect(function()
    -- upvalues: (copy) v_u_8, (ref) v_u_9, (copy) v_u_7
    v_u_8:Play()
    v_u_9 = not v_u_9
    v_u_7:Fire(v_u_9)
end)

--========================================
-- LocalScript : StarterGui.MainGui.StatsFrame.StatsScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = script.Parent
local v_u_2 = v_u_1.UIStroke
local v3 = v_u_1.FrameForPages
local v_u_4 = v3.UIPageLayout
local v_u_5 = v_u_1.CloseBttn.UIStroke
local v_u_6 = v_u_1.UIScale
local v_u_7 = v3.ChallengesScrollingFrame
local v_u_8 = v_u_7.UIListLayout
local v_u_9 = v_u_7.UIPadding
local v10 = v3.QuestFrame
local v_u_11 = v10.UIPadding
local v12 = v10.RewardFrame
local v_u_13 = v10.QuestScrollingFrame
local v_u_14 = v12.ScrollingFrame
local v_u_15 = v10.UIListLayout
local v_u_16 = {
    [v10] = v_u_1.DailyQuestButton,
    [v_u_7] = v_u_1.ChallengesButton
}
local v_u_17 = v_u_1.Parent
local v_u_18 = v_u_16[v10].Size
local v_u_19 = UDim2.new(v_u_18.X.Scale * 0.75, v_u_18.X.Offset * 0.75, v_u_18.Y.Scale * 0.75, v_u_18.Y.Offset * 0.75)
local v_u_20 = game:GetService("SoundService"):WaitForChild("Sound"):WaitForChild("ClickSound")
local v_u_21 = nil
local v_u_22 = nil
function ScaleGui()
    -- upvalues: (copy) v_u_1, (ref) v_u_21, (copy) v_u_6, (copy) v_u_2, (copy) v_u_5, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_11, (copy) v_u_15, (copy) v_u_14, (copy) v_u_13
    local v23 = v_u_1.AbsoluteSize
    if v23 ~= v_u_21 then
        v_u_21 = v23
        local v24 = v_u_6.Scale
        local v25 = v23.Y
        v_u_2.Thickness = 0.0222 * v25 / v24
        v_u_1.BorderSizePixel = 0.0177 * v25 / v24
        v_u_5.Thickness = 0.01375 * v25 / v24
        local v26 = 0.025 * v23.X
        v_u_8.Padding = UDim.new(0, 0.0556 * v25 / v24)
        v_u_9.PaddingTop = UDim.new(0, v26 / v24)
        v_u_7.CanvasSize = UDim2.fromOffset(0, (v_u_8.AbsoluteContentSize.Y + v26 * 2) / v24)
        local v27 = UDim.new(0, v23.X * 0.02 / v24)
        v_u_11.PaddingBottom = v27
        v_u_11.PaddingRight = v27
        v_u_11.PaddingLeft = v27
        v_u_11.PaddingTop = v27
        v_u_15.Padding = v27
        local v28 = 0.45 * v_u_14.AbsoluteSize.Y
        v_u_14["Rew_" .. 1].Size = UDim2.fromOffset(0, v28 / v24)
        v_u_14["Rew_" .. 2].Size = UDim2.fromOffset(0, v28 / v24)
        local v29 = v_u_13["Quest_" .. 1]
        local v30 = nil or v29.AbsoluteSize.Y * 0.06 / v24
        v29.UIStroke.Thickness = v30
        local v31 = v_u_13["Quest_" .. 2]
        local v32 = v30 or v31.AbsoluteSize.Y * 0.06 / v24
        v31.UIStroke.Thickness = v32
        v_u_13.UIListLayout.Padding = UDim.new(0, v32 * 3.5)
    end
end
function OnPageChanged()
    -- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_16, (copy) v_u_18, (copy) v_u_19
    local v33 = v_u_4.CurrentPage
    local v34 = v_u_6.Scale
    for v35, v36 in pairs(v_u_16) do
        if v33 == v35 then
            v36.BackgroundColor3 = Color3.new(1, 1, 1)
            v36.UIStroke.Thickness = 5 / v34
            v36.Size = v_u_18
        else
            v36.BackgroundColor3 = Color3.new(0.6, 0.6, 0.6)
            v36.UIStroke.Thickness = 2 / v34
            v36.Size = v_u_19
        end
    end
end
function OnStatsVisibleChanged()
    -- upvalues: (ref) v_u_22, (copy) v_u_1, (copy) v_u_17
    if v_u_22 then
        v_u_22:Disconnect()
    end
    if v_u_1.Visible then
        v_u_22 = v_u_17:GetPropertyChangedSignal("AbsoluteSize"):Connect(ScaleGui)
    end
    ScaleGui()
end
for v_u_37, v38 in pairs(v_u_16) do
    v38.Activated:Connect(function()
        -- upvalues: (copy) v_u_20, (copy) v_u_4, (copy) v_u_37
        v_u_20:Play()
        v_u_4:JumpTo(v_u_37)
    end)
end
v_u_4:GetPropertyChangedSignal("CurrentPage"):Connect(OnPageChanged)
v_u_1:GetPropertyChangedSignal("Visible"):Connect(OnStatsVisibleChanged)
OnPageChanged()
OnStatsVisibleChanged()

--========================================
-- LocalScript : StarterGui.MainGui.StatsFrame.FrameForPages.QuestFrame.DailyQuestScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("MarketplaceService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Players").LocalPlayer
local v_u_4 = v2.RemoteFunction.ClaimQuestRewardF
local v_u_5 = script.Parent
local v6 = v_u_5.Parent.Parent.Parent
local v7 = v_u_5.Parent
local v_u_8 = v7.Parent
local v9 = v_u_8.DailyQuestButton
local v_u_10 = v7.UIPageLayout
local v_u_11 = v_u_5.RewardFrame
local v12 = v_u_11.ScrollingFrame
local v_u_13 = v12.Rew_1
local v_u_14 = v12.Rew_2
local v_u_15 = v_u_11.ClaimButton
local v_u_16 = v_u_15.ClaimText
local v_u_17 = v_u_15.UIGradient
local v_u_18 = v_u_5.QuestScrollingFrame
local v19 = v_u_18.FrameForRobuxButtons
local v_u_20 = v19.SkipToReward
local v21 = v19.Refill
local v_u_22 = v_u_18.ForTimeFrame.TimeLabel
local v23 = v2.AllModules
local v_u_24 = require(v23.GetRestriction)("ArePaidRandomItemsRestricted")
local v_u_25 = require(v23.UsefullFunction).GetEffectiveRewLevel
local v_u_26 = require(v23.ConvertVal)
local v_u_27 = require(v23.BuyCash.BuyCashModule)
local v_u_28 = require(v23.QuestDescription)
local v_u_29 = require(v23.ImageFromName)
local v30 = require(v23.GuiMark)
local v_u_31 = require(v_u_5.Parent.PrintProgression)
local v_u_32 = require(v_u_3:WaitForChild("Storage"))
local v33 = v_u_3:WaitForChild("Stats"):WaitForChild("DailyQuest")
local v_u_34 = v33:WaitForChild("DailyQuestReward_2")
local v_u_35 = v33:WaitForChild("WasDailyRewardClaimed")
local v_u_36 = { v33:WaitForChild("DailyQuest_1"), v33:WaitForChild("DailyQuest_2") }
local v_u_37 = v_u_3:WaitForChild("leaderstats"):WaitForChild("Level")
local v_u_38 = v30.AddMark(v_u_15, false, UDim2.new(0.6, 20, 0.6, 20), UDim2.fromScale(0.975, 0.1))
local v_u_39 = v30.AddMark(v9, UDim2.new(0.7, 20, 0.7, 20), UDim2.fromScale(1, 2))
local v_u_40 = v30.AddMark(v_u_8.Parent.ButtonContainer.StatsBttn)
local v41 = game:GetService("SoundService"):WaitForChild("Sound")
local v_u_42 = v41:WaitForChild("ClickSound")
local v_u_43 = v41:WaitForChild("BuySound")
local v_u_44 = {}
local v_u_45 = nil
local v_u_46 = nil
local v_u_47 = nil
local v_u_48 = nil
local v_u_49 = 0
local v_u_50 = false
local v_u_51 = false
local v_u_52 = v6:GetAttribute("BaseGreenGradient")
local v_u_53 = v6:GetAttribute("BaseRedGradient")
local v_u_54 = v6:GetAttribute("BaseGreyGradient")
function OnReward2Changed()
    -- upvalues: (copy) v_u_34, (copy) v_u_14, (copy) v_u_29, (copy) v_u_28
    local v55 = v_u_34.Value
    if v55 == "" then
        v_u_14.Visible = false
    else
        v_u_14.Visible = true
        v_u_14.RewardImg.Image = v_u_29[v55].Image
        v_u_14.DescLabel.Text = "\195\151" .. v_u_28.QuestRewards[v55]
    end
end
function OnStatsVisibilityChanged()
    -- upvalues: (copy) v_u_8, (copy) v_u_40, (ref) v_u_46, (copy) v_u_10
    if v_u_8.Visible then
        v_u_40:Hide()
        if not (v_u_46 and v_u_46.Connected) then
            v_u_46 = v_u_10:GetPropertyChangedSignal("CurrentPage"):Connect(OnPageChanged)
            OnPageChanged()
        end
    else
        v_u_40:Show()
        return
    end
end
function OnPageChanged()
    -- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_39
    if v_u_10.CurrentPage == v_u_5 then
        v_u_39:Hide()
    else
        v_u_39:Show()
    end
end
function DisconnectButton()
    -- upvalues: (ref) v_u_48, (copy) v_u_11, (copy) v_u_15
    if v_u_48 and v_u_48.Connected then
        v_u_48:Disconnect()
    end
    v_u_11:RemoveTag("SizableUI")
    v_u_15.AutoButtonColor = false
end
function EnableButton()
    -- upvalues: (ref) v_u_48, (copy) v_u_15, (copy) v_u_42, (ref) v_u_51, (ref) v_u_49, (copy) v_u_11
    if not (v_u_48 and v_u_48.Connected) then
        v_u_48 = v_u_15.Activated:Connect(function()
            -- upvalues: (ref) v_u_42, (ref) v_u_51, (ref) v_u_49
            v_u_42:Play()
            if not v_u_51 and v_u_49 >= 2 then
                ClaimReward()
            end
        end)
    end
    v_u_11:AddTag("SizableUI")
    v_u_15.AutoButtonColor = true
end
function ClaimReward()
    -- upvalues: (copy) v_u_16, (ref) v_u_51, (copy) v_u_4
    v_u_16.Text = "Claiming..."
    v_u_51 = true
    v_u_4:InvokeServer()
    v_u_51 = false
end
function ShowMark()
    -- upvalues: (copy) v_u_38, (ref) v_u_45, (copy) v_u_8
    v_u_38:Show()
    if not (v_u_45 and v_u_45.Connected) then
        v_u_45 = v_u_8:GetPropertyChangedSignal("Visible"):Connect(OnStatsVisibilityChanged)
        OnStatsVisibilityChanged()
    end
end
function HideMark()
    -- upvalues: (ref) v_u_46, (ref) v_u_45, (copy) v_u_39, (copy) v_u_40, (copy) v_u_38
    DisconnectButton()
    if v_u_46 then
        v_u_46:Disconnect()
    end
    if v_u_45 then
        v_u_45:Disconnect()
    end
    v_u_39:Hide()
    v_u_40:Hide()
    v_u_38:Hide()
end
function ToggleSkipAndClaimBttn(p56)
    -- upvalues: (ref) v_u_47, (copy) v_u_20, (copy) v_u_42, (copy) v_u_1, (copy) v_u_3
    if p56 then
        if not (v_u_47 and v_u_47.Connected) then
            v_u_47 = v_u_20.Activated:Connect(function()
                -- upvalues: (ref) v_u_42, (ref) v_u_1, (ref) v_u_3
                v_u_42:Play()
                v_u_1:PromptProductPurchase(v_u_3, 3233121380)
            end)
        end
    elseif v_u_47 then
        v_u_47:Disconnect()
    end
    v_u_20.Visible = p56
end
function ChangeClaimButton()
    -- upvalues: (ref) v_u_50, (copy) v_u_17, (copy) v_u_54, (ref) v_u_49, (copy) v_u_16, (copy) v_u_52, (copy) v_u_53
    if v_u_50 then
        v_u_17.Color = v_u_54
        ToggleSkipAndClaimBttn(false)
        DisconnectButton()
        HideMark()
        return
    else
        local v57 = v_u_49 >= 2
        ToggleSkipAndClaimBttn(not v57)
        if v57 then
            EnableButton()
            v_u_16.Text = "Claim"
            v_u_17.Color = v_u_52
            ShowMark()
        else
            v_u_16.Text = "Claim " .. v_u_49 .. "/2"
            v_u_17.Color = v_u_53
            HideMark()
        end
    end
end
function SetQuest()
    -- upvalues: (ref) v_u_49, (copy) v_u_44, (copy) v_u_36, (copy) v_u_18, (copy) v_u_29, (copy) v_u_28, (copy) v_u_32, (copy) v_u_31
    local v_u_58 = { 0, 0 }
    v_u_49 = 0
    for v_u_59 = 1, 2 do
        if v_u_44[v_u_59] then
            v_u_44[v_u_59]:Disconnect()
        end
        local v60 = v_u_36[v_u_59]
        local v_u_61 = v60:FindFirstChildOfClass("IntValue").Value
        local v62 = v60.Value
        local v_u_63 = v_u_18["Quest_" .. v_u_59]
        if v62 == "" then
            v_u_63.Visible = false
        else
            v_u_63.Visible = true
            v_u_63.DescImage.Image = v_u_29[v62].Image
            if v62 == "CodesUsed" then
                v_u_63.DescText.Text = "Redeem code"
            else
                v_u_63.DescText.Text = v62:sub(1, 1):upper() .. v62:sub(2)
            end
            local v_u_64 = v_u_28.Quest[v62]
            local v_u_65 = v_u_32[v62]
            local v_u_66 = v62 == "Playtime"
            local function v69()
                -- upvalues: (copy) v_u_65, (copy) v_u_61, (copy) v_u_64, (copy) v_u_58, (copy) v_u_59, (ref) v_u_31, (copy) v_u_63, (copy) v_u_66, (ref) v_u_49
                local v67 = v_u_65.Value - v_u_61
                local v68 = v67 < v_u_64
                v_u_58[v_u_59] = v68 and 0 or 1
                v_u_31(v_u_63, v67, v_u_64, v_u_66, nil, v68)
                v_u_49 = v_u_58[1] + v_u_58[2]
                ChangeClaimButton()
            end
            v_u_44[v_u_59] = v_u_65:GetPropertyChangedSignal("Value"):Connect(v69)
            local v70 = v_u_65.Value - v_u_61
            local v71 = v70 < v_u_64
            v_u_58[v_u_59] = v71 and 0 or 1
            v_u_31(v_u_63, v70, v_u_64, v_u_66, nil, v71)
            v_u_49 = v_u_58[1] + v_u_58[2]
            ChangeClaimButton()
        end
    end
end
function OnDailyQuestDoneStateChanged()
    -- upvalues: (ref) v_u_50, (copy) v_u_35
    v_u_50 = v_u_35.Value
    ChangeClaimButton()
end
v_u_34.Changed:Connect(OnReward2Changed)
OnReward2Changed()
SetQuest()
local v_u_72 = v_u_50
for _, v73 in pairs(v_u_36) do
    v73:GetPropertyChangedSignal("Value"):Connect(SetQuest)
    v73:FindFirstChildOfClass("IntValue"):GetPropertyChangedSignal("Value"):Connect(SetQuest)
end
v_u_35:GetPropertyChangedSignal("Value"):Connect(OnDailyQuestDoneStateChanged)
OnDailyQuestDoneStateChanged()
if v_u_24 then
    v21:Destroy()
else
    v21.Activated:Connect(function()
        -- upvalues: (copy) v_u_42, (copy) v_u_1, (copy) v_u_3
        v_u_42:Play()
        v_u_1:PromptProductPurchase(v_u_3, 3233098258)
    end)
end
function OnLevelChanged()
    -- upvalues: (copy) v_u_25, (copy) v_u_37, (copy) v_u_13, (copy) v_u_26, (copy) v_u_27, (copy) v_u_24
    local v74 = v_u_25(v_u_37.Value)
    v_u_13.DescLabel.Text = "$" .. v_u_26.SimpleConversion(v_u_27.CashAtLevel[v74].Medium * (v_u_24 and 2 or 1))
end
v_u_37:GetPropertyChangedSignal("Value"):Connect(OnLevelChanged)
OnLevelChanged()
function PrintTimeBeforeNext()
    -- upvalues: (copy) v_u_26, (ref) v_u_72, (copy) v_u_16, (copy) v_u_22, (copy) v_u_8
    while true do
        local v75 = v_u_26.GetTimeBeforeNextDay()
        if v_u_72 then
            v_u_16.Text = "Next in\n" .. v75
        end
        v_u_22.Text = "New quests in " .. v75
        task.wait(1)
        while not v_u_8.Visible do
            v_u_8:GetPropertyChangedSignal("Visible"):Wait()
        end
    end
end
task.spawn(PrintTimeBeforeNext)
v_u_1.PromptProductPurchaseFinished:Connect(function(p76, p77, p78)
    -- upvalues: (copy) v_u_3, (copy) v_u_43
    if p78 then
        if p76 == v_u_3.UserId then
            if p77 == 3233121380 then
                ClaimReward()
            elseif p77 == 3233098258 then
                v_u_43:Play()
            end
        else
            return
        end
    else
        return
    end
end)

--========================================
-- LocalScript : StarterGui.MainGui.StatsFrame.FrameForPages.ChallengesScrollingFrame.ChallengesScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
game:GetService("Workspace")
local v_u_2 = game.Players.LocalPlayer
local v_u_3 = require(v_u_2.Storage)
local v4 = v_u_3.Level
local v_u_5 = script.Parent
local v_u_6 = v_u_5.RewardFrame
local _ = v_u_6.BarFrame
v_u_6.Parent = nil
require(v1.AllModules.ConvertVal)
local v_u_7 = require(v1.AllModules.StatsRewards)
local v_u_8 = require(v1.AllModules.ImageFromName)
local v_u_9 = require(v_u_5.Parent.PrintProgression)
local v_u_10 = require(v1.AllModules.CratesValueModule)
local v11 = require(v1.AllModules.Events.Client_EventTracker)
local v_u_12 = {}
function OnValueChanged(p13, p14, p15)
    -- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_9
    local v16, v17 = v_u_7.GetStatsInfoFor(v_u_2, p15, p14, true)
    local v18 = p13.RewardLabel
    local v19 = p15 == "Playtime"
    if v16 then
        if p14 == v17 then
            local v20, v21 = v_u_7.GetStatsInfoFor(v_u_2, p15, p14 + 1, true)
            if v21 then
                v_u_9(p13, p14, v21, v19, v18, v20)
            else
                v_u_9(p13, p14, nil, v19, v18, nil)
            end
        else
            v_u_9(p13, p14, v17, v19, v18, v16)
            return
        end
    else
        v_u_9(p13, p14, nil, v19, v18, nil)
        return
    end
end
function AddChallengeLine(p22, p_u_23)
    -- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_8, (copy) v_u_3, (copy) v_u_7, (copy) v_u_12
    local v_u_24 = v_u_6:Clone()
    v_u_24.Parent = v_u_5
    v_u_24.LayoutOrder = p22 * 10
    v_u_24.Name = p_u_23
    if p_u_23 == "CodesUsed" then
        v_u_24.DescText.Text = "Redeem codes"
    else
        v_u_24.DescText.Text = p_u_23:sub(1, 1):upper() .. p_u_23:sub(2, -1) .. (p_u_23:find("crate") and "s" or "")
    end
    v_u_24.DescImage.Image = v_u_8[p_u_23].Image
    local v_u_25 = v_u_3[p_u_23]
    local v_u_26 = v_u_7.AllStatsReward[p_u_23].ShowOnlyIfMoreThan0
    local function v28()
        -- upvalues: (copy) v_u_25, (copy) v_u_26, (copy) v_u_24, (copy) p_u_23
        local v27 = v_u_25.Value
        if v_u_26 then
            v_u_24.Visible = v27 > 0
        end
        OnValueChanged(v_u_24, v27, p_u_23)
    end
    v_u_25:GetPropertyChangedSignal("Value"):Connect(v28)
    local v29 = v_u_25.Value
    if v_u_26 then
        v_u_24.Visible = v29 > 0
    end
    OnValueChanged(v_u_24, v29, p_u_23)
    if v_u_7.AllStatsReward[p_u_23].IsCrateStats then
        local v30 = v_u_12
        table.insert(v30, v28)
    end
end
for v31, v32 in {
    "Level",
    "wooden crate",
    "stone crate",
    "silver crate",
    "golden crate",
    "diamond crate",
    "infinity crate",
    "absolute infinity crate",
    "terminusfinity crate",
    "Kills",
    "Playtime",
    "CodesUsed"
} do
    AddChallengeLine(v31, v32)
end
v4.Changed:Connect(function()
    -- upvalues: (copy) v_u_12
    for _, v33 in pairs(v_u_12) do
        v33()
    end
end)
function OnEventChanged(p34, p35, p36)
    -- upvalues: (copy) v_u_10, (copy) v_u_5
    if p35 or not p36 then
        local v37 = v_u_10.EventNameToCrates[p34]
        if v37 then
            for _, v38 in pairs(v37) do
                local v39 = v_u_5:FindFirstChild(v38)
                if v39 then
                    v39.Visible = p35
                elseif p35 then
                    AddChallengeLine((v_u_5["terminusfinity crate"].LayoutOrder + 1) / 10, v38)
                end
            end
        end
    else
        return
    end
end
v11.ConnectToEventChanged(OnEventChanged, "Challenges")

--========================================
-- LocalScript : StarterGui.MainGui.SettingsFrame.SettingsScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("SoundService")
local v_u_3 = game:GetService("Lighting")
local v4 = game:GetService("Players").LocalPlayer
local v5 = v4.Settings
local v6 = require(script.SettingsModule)
local v_u_7 = v1.RemoteEvent.SettingsEvent
local v8 = v1.BindableEvents.SettingsEvent
local v9 = script.Parent.ScrollingFrame
local v10 = v9.Section_TEMPLATE
local v11 = v10.Setting_TEMPLATE
v11.Parent = script
v10.Parent = script
local v_u_12 = v2.Sound.ClickSound
local v_u_13 = v5.Shadows
function ChangeShadows()
    -- upvalues: (copy) v_u_13, (copy) v_u_3
    local v14 = v_u_13.Value
    v_u_3.GlobalShadows = v14
    v_u_3.Bloom.Intensity = v14 and 1 or 0.55
    v_u_3.Bloom.Size = v14 and 20 or 15
end
v_u_13.Changed:Connect(ChangeShadows)
ChangeShadows()
while not v4:GetAttribute("DataFullyLoaded") do
    v4:GetAttributeChangedSignal("DataFullyLoaded"):Wait()
end
for v15, v16 in pairs(v6.SettingSection) do
    local v17 = v16.Name
    local v18 = v10:Clone()
    v18.Parent = v9
    v18.LayoutOrder = v15
    v18.TitleLabel.Text = v17
    for v19, v20 in pairs(v16.AvialableSettings) do
        local v_u_21 = v20.ValueName
        local v22 = v11:Clone()
        v22.Parent = v18
        v22.LayoutOrder = v19
        v22.Desc.Text = v20.DisplayName or v20.ValueName
        local v_u_23 = v22.Button
        local v_u_24 = v8:FindFirstChild(v_u_21)
        local v25 = v6.SettingDescription[v_u_21]
        local v_u_26 = v25[1]
        local v_u_27 = v25[2]
        local v_u_28 = v25[3]
        local v_u_29 = #v25[1]
        local v_u_30 = v5[v_u_21].Value
        local v_u_31 = table.find(v_u_28, v_u_30)
        if not v_u_31 then
            v_u_31 = 1
            v_u_30 = v_u_28[v_u_31]
            v_u_7:FireServer(v_u_21, v_u_30)
        end
        local function v35(p32, p33, p34)
            -- upvalues: (copy) v_u_7, (copy) v_u_21, (ref) v_u_31, (copy) v_u_28, (ref) v_u_30, (copy) v_u_23, (copy) v_u_26, (copy) v_u_27
            if not p34 then
                v_u_7:FireServer(v_u_21, p32)
            end
            v_u_31 = p33 or table.find(v_u_28, p32)
            v_u_30 = p32
            v_u_23.Text = v_u_26[v_u_31]
            v_u_23.BackgroundColor3 = v_u_27[v_u_31]
        end
        local v36 = v_u_30
        v_u_31 = v_u_31 or table.find(v_u_28, v36)
        v_u_30 = v36
        v_u_23.Text = v_u_26[v_u_31]
        v_u_23.BackgroundColor3 = v_u_27[v_u_31]
        v_u_23.Activated:Connect(function()
            -- upvalues: (copy) v_u_12, (ref) v_u_31, (copy) v_u_29, (ref) v_u_30, (copy) v_u_28, (copy) v_u_24, (copy) v_u_7, (copy) v_u_21, (copy) v_u_23, (copy) v_u_26, (copy) v_u_27
            v_u_12:Play()
            if v_u_29 <= v_u_31 then
                v_u_31 = 1
            else
                v_u_31 = v_u_31 + 1
            end
            v_u_30 = v_u_28[v_u_31]
            if v_u_24 then
                v_u_24:Fire(v_u_30)
            else
                local v37 = v_u_30
                local v38 = v_u_31
                v_u_7:FireServer(v_u_21, v37)
                v_u_31 = v38 or table.find(v_u_28, v37)
                v_u_30 = v37
                v_u_23.Text = v_u_26[v_u_31]
                v_u_23.BackgroundColor3 = v_u_27[v_u_31]
            end
        end)
        if v_u_24 then
            v_u_24.Event:Connect(v35)
        end
    end
end

--========================================
-- LocalScript : StarterGui.MainGui.HealthBar.HealthScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v2 = game:GetService("StarterGui")
local v_u_3 = game:GetService("GuiService")
local v4 = game:GetService("Players")
local v_u_5 = require(game:GetService("ReplicatedStorage").AllModules.ConvertVal).ConvertToReadableNumbers
local v_u_6 = TweenInfo.new(0.55, Enum.EasingStyle.Linear)
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v10 = v4.LocalPlayer
local v_u_11 = script.Parent
local v_u_12 = v_u_11.HealthLabel
local v_u_13 = v_u_11.UIGradient
local v_u_14 = v_u_11.UIStroke
v2:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
local v_u_15 = 0
local v_u_16 = 1
function TweenBar(p17)
    -- upvalues: (ref) v_u_15, (ref) v_u_16
    v_u_15 = v_u_15 + 1
    local v18 = v_u_15
    local v19 = v_u_16
    local v20 = p17 - v19
    local v21 = 0
    while v21 < 0.25 and v18 == v_u_15 do
        local v22 = v20 * 0.5
        local v23 = 12.566370614359172 * v21
        v_u_16 = v19 + v22 * (1 - math.cos(v23))
        PrintBar()
        v21 = v21 + task.wait()
    end
    if v18 == v_u_15 then
        v_u_16 = p17
        PrintBar()
    end
end
function PrintBar()
    -- upvalues: (ref) v_u_16, (copy) v_u_13
    local v24
    if v_u_16 < 0.5 then
        v24 = Color3.new(1, 0):Lerp(Color3.new(1, 1), v_u_16 * 2)
    else
        v24 = Color3.new(1, 1):Lerp(Color3.new(0, 1), v_u_16 * 2 - 1)
    end
    v_u_13.Color = ColorSequence.new(v24)
    if v_u_16 <= 0 then
        v_u_13.Transparency = NumberSequence.new(0.8)
        return
    elseif v_u_16 + 0.001 < 1 then
        v_u_13.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(v_u_16, 0),
            NumberSequenceKeypoint.new(v_u_16 + 0.001, 0.8),
            NumberSequenceKeypoint.new(1, 0.8)
        })
    else
        v_u_13.Transparency = NumberSequence.new(0)
    end
end
function OnHumanoidHealthChanged(p25)
    -- upvalues: (ref) v_u_7, (ref) v_u_8, (ref) v_u_9, (copy) v_u_11, (copy) v_u_1, (copy) v_u_12, (copy) v_u_6, (copy) v_u_14, (copy) v_u_5
    local v26 = Humanoid.MaxHealth
    if v_u_7 and v_u_7.PlaybackState == Enum.PlaybackState.Playing then
        v_u_7:Cancel()
        v_u_8:Cancel()
        v_u_9:Cancel()
    end
    if p25 == v26 and v_u_11.BackgroundTransparency ~= 1 then
        v_u_8 = v_u_1:Create(v_u_12, v_u_6, {
            ["TextStrokeTransparency"] = 1,
            ["TextTransparency"] = 1
        })
        v_u_7 = v_u_1:Create(v_u_11, v_u_6, {
            ["BackgroundTransparency"] = 1
        })
        v_u_9 = v_u_1:Create(v_u_14, v_u_6, {
            ["Transparency"] = 1
        })
        v_u_8:Play()
        v_u_7:Play()
        v_u_9:Play()
    else
        v_u_11.BackgroundTransparency = 0
        v_u_12.TextStrokeTransparency = 0
        v_u_12.TextTransparency = 0
        v_u_14.Transparency = 0
    end
    v_u_12.Text = v_u_5((math.floor(p25))) .. " / " .. v_u_5(v26)
    TweenBar(p25 / v26)
end
function OnCharacterAdded(p27)
    if p27 then
        Humanoid = p27:WaitForChild("Humanoid")
        Humanoid.HealthChanged:Connect(OnHumanoidHealthChanged)
        OnHumanoidHealthChanged(Humanoid.MaxHealth)
    end
end
v10.CharacterAdded:Connect(OnCharacterAdded)
OnCharacterAdded(v10.Character)
function PlaceHealthBar()
    -- upvalues: (copy) v_u_3, (copy) v_u_11
    local v28 = v_u_3.TopbarInset.Height
    v_u_11.Position = UDim2.new(1, -0.2 * v28, 0, -0.8 * v28)
end
PlaceHealthBar()
v_u_3:GetPropertyChangedSignal("TopbarInset"):Connect(PlaceHealthBar)

--========================================
-- LocalScript : StarterGui.MainGui.CloneFrame.UpgradeCloneScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("MarketplaceService")
game:GetService("UserInputService")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("SoundService")
local v_u_4 = game:GetService("StarterPlayer")
local v_u_5 = game:GetService("TweenService")
game:GetService("StarterGui")
local v6 = game:GetService("Workspace")
local v7 = game:GetService("Players")
local v_u_8 = require(v2.AllModules.LoadGPDescription)
local v9 = require(v2.AllModules.GetTowerForPlayer)
local v_u_10 = require(v2.AllModules.CloneUpgrades)
local v11 = require(v2.AllModules.UsefullFunction)
local v_u_12 = require(v2.AllModules.ConvertVal)
local v_u_13 = v6.CurrentCamera
local v_u_14 = v7.LocalPlayer
local v_u_15 = v_u_14.Stats.CloneStats
local v_u_16 = v_u_14.leaderstats.Cash
local v_u_17 = v9(v_u_14, true).AllModels:FindFirstChild("Clone")
local v_u_18 = {}
local v_u_19 = false
local v_u_20 = false
local v_u_21 = nil
local v_u_22 = nil
local v23 = v_u_17.ForClonePart.Attachment.SettingsPrompt
local v_u_24 = { v23 }
local v_u_25 = require(v_u_14.PlayerScripts.PlayerModule):GetControls()
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = v_u_14.leaderstats.Level
local v_u_30 = v2.RemoteEvent.CloneEvent.ResetCloneEvent
local v31 = v2.RemoteEvent.CloneEvent.CloneSpawned
local v_u_32 = v2.RemoteFunction.UpdateCloneStats
local v_u_33 = nil
local v_u_34 = script.Parent
local v_u_35 = v_u_34.Parent
local v_u_36 = v_u_34.GiantCloneButton
local v37 = v_u_36.GiantCloneBttn
local v38 = v_u_35.ButtonContainer.CloneBttn
local v_u_39 = v_u_34.CloneAction
local v_u_40 = v_u_34.UISizeConstraint
local v_u_41 = v_u_35.LowerFrameContainer.ToolFrame
local v_u_42 = v_u_34.ScrollingFrame
local v_u_43 = v_u_42.CloneMode.TargetButton
local v_u_44 = v_u_42.CloneMode.ModeButton
local _ = v_u_34.CloseBttn
local v_u_45 = v_u_34.Title
local v46 = v_u_45.NextButton
local v47 = v_u_45.PrevButton
local v_u_48 = v_u_34.LockedFrame
local v_u_49 = v_u_34.Size
local v50 = v_u_34.CloseCloneFrameF
local v51 = v3.Sound
local v_u_52 = v51.WhooshSoundBis
local v_u_53 = v51.ClickSound
local v_u_54 = v51.BipWrong
local v_u_55 = v51.BuySound
local v_u_56 = {}
local v_u_57 = nil
local v_u_58 = nil
local v_u_59 = nil
local v_u_60 = {}
local v_u_61 = v11.HasGamePass(v_u_14, "GiantClone")
local v_u_62 = v_u_14.Stats.GamePass["2ndClone"]
function OnMouseOver(p63, p64, p65)
    -- upvalues: (ref) v_u_61
    local v66 = p64.Value + 1
    p65.PrintValue(p63, v66, Color3.fromRGB(0, 255, 0), v_u_61)
end
function ColorBttn(p67, p68)
    -- upvalues: (copy) v_u_56, (copy) v_u_16
    if v_u_56[p67.Parent.Name] then
        p67.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        return
    elseif v_u_16.Value < p68 then
        p67.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    else
        p67.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    end
end
function SetButton(p_u_69, p_u_70, p_u_71)
    -- upvalues: (copy) v_u_29, (copy) v_u_56, (copy) v_u_12
    local v72 = p_u_70[p_u_71.Value + 1]
    local v73
    if v72 then
        v73 = v72[2]
    else
        v73 = v72
    end
    if not v73 then
        p_u_69.BackgroundColor3 = Color3.fromRGB(188, 188, 188)
        p_u_69.Active = false
        p_u_69.AutoButtonColor = false
        p_u_69.Text = "Max"
        return false
    end
    local v_u_74 = v72[3]
    if not v_u_74 or v_u_29.Value >= v_u_74 then
        ColorBttn(p_u_69, v73)
        p_u_69.Text = "Upgrade\n$" .. v_u_12.SimpleConversion(v73)
        return v73
    end
    p_u_69.BackgroundColor3 = Color3.new(1, 0, 0)
    p_u_69.Text = "Locked\nlevel " .. v_u_74
    local v_u_75 = p_u_69.Parent.Name
    if v_u_56[v_u_75] then
        warn("Already connected !!")
        v_u_56[v_u_75]:Disconnect()
    end
    v_u_56[v_u_75] = v_u_29:GetPropertyChangedSignal("Value"):Connect(function()
        -- upvalues: (ref) v_u_29, (copy) v_u_74, (ref) v_u_56, (copy) v_u_75, (copy) p_u_69, (copy) p_u_70, (copy) p_u_71
        if v_u_74 <= v_u_29.Value then
            if v_u_56[v_u_75] then
                v_u_56[v_u_75]:Disconnect()
            end
            v_u_56[v_u_75] = nil
            SetButton(p_u_69, p_u_70, p_u_71)
        end
    end)
    return v73
end
function PrintTargetMode()
    -- upvalues: (copy) v_u_44, (ref) v_u_28, (copy) v_u_43, (ref) v_u_27
    v_u_44.Text = v_u_28.Value
    v_u_43.Text = v_u_27.Value
end
local v_u_76 = { v_u_42.Health, v_u_42.Regen, v_u_42.WalkSpeed }
function ForGamePassUpdate(p77, p78)
    -- upvalues: (copy) v_u_76, (copy) v_u_10, (copy) v_u_15, (ref) v_u_22
    for _, v79 in pairs(v_u_76) do
        local v80 = v_u_10[v79.Name]
        local v81 = v_u_15[v_u_22 .. v79.Name]
        v80.PrintValue(v79, v81.Value, p77, p78)
    end
end
local v_u_82 = false
local v_u_83 = false
function LoadLocked()
    -- upvalues: (ref) v_u_82, (ref) v_u_83, (copy) v_u_8, (copy) v_u_48, (ref) v_u_58, (copy) v_u_1, (copy) v_u_14
    if not (v_u_82 or v_u_83) then
        v_u_83 = true
        local v84, v85 = v_u_8(1273254469)
        v_u_48.GPImage.Image = v85 and v85 ~= "" and ("rbxassetid://" .. v85 or "") or ""
        v_u_48.ClaimButton.ClaimText.Text = utf8.char(57346) .. ((not v84 or (v84 == 0 or not v84)) and "" or v84)
        if v_u_58 then
            v_u_58:Disconnect()
        end
        v_u_58 = v_u_48.ClaimButton.Activated:Connect(function()
            -- upvalues: (ref) v_u_1, (ref) v_u_14
            v_u_1:PromptGamePassPurchase(v_u_14, 1273254469)
        end)
        if v84 and (v84 ~= 0 and (v85 and v85 ~= "")) then
            v_u_82 = true
        end
        v_u_83 = false
    end
end
function DisplayStats()
    -- upvalues: (ref) v_u_60, (copy) v_u_18, (copy) v_u_56, (copy) v_u_45, (ref) v_u_21, (copy) v_u_62, (copy) v_u_17, (copy) v_u_48, (ref) v_u_28, (copy) v_u_15, (ref) v_u_22, (ref) v_u_27, (copy) v_u_44, (copy) v_u_53, (copy) v_u_32, (copy) v_u_43, (ref) v_u_26, (copy) v_u_42, (copy) v_u_10, (ref) v_u_61, (ref) v_u_20, (copy) v_u_16, (copy) v_u_54, (copy) v_u_55
    for _, v86 in pairs(v_u_60) do
        v86:Disconnect()
    end
    table.clear(v_u_60)
    table.clear(v_u_18)
    for _, v87 in pairs(v_u_56) do
        v87:Disconnect()
    end
    table.clear(v_u_56)
    v_u_45.Text = "Clone " .. v_u_21 .. "\nsettings"
    if v_u_21 == 2 and not (v_u_62.Value or v_u_17:GetAttribute("SecondaryCloneActive")) then
        v_u_48.Visible = true
        StopWatchingClone()
        LoadLocked()
    else
        v_u_48.Visible = false
        v_u_28 = v_u_15[v_u_22 .. "Mode"]
        v_u_27 = v_u_15[v_u_22 .. "TargetMode"]
        PrintTargetMode()
        v_u_60 = {
            v_u_44.Activated:Connect(function()
                -- upvalues: (ref) v_u_53, (ref) v_u_32, (ref) v_u_21
                v_u_53:Play()
                v_u_32:InvokeServer("CloneMode", v_u_21)
            end),
            v_u_43.Activated:Connect(function()
                -- upvalues: (ref) v_u_53, (ref) v_u_32, (ref) v_u_21
                v_u_53:Play()
                v_u_32:InvokeServer("TargetMode", v_u_21)
            end),
            v_u_28:GetPropertyChangedSignal("Value"):Connect(PrintTargetMode),
            (v_u_27:GetPropertyChangedSignal("Value"):Connect(PrintTargetMode))
        }
        v_u_26 = v_u_17[v_u_22 .. "TimeBeforeRespawn"]
        local v88 = v_u_26.Changed:Connect(OnTimeChanged)
        OnTimeChanged()
        local v89 = v_u_60
        table.insert(v89, v88)
        for _, v_u_90 in pairs(v_u_42:GetChildren()) do
            if v_u_90:IsA("Frame") then
                local v_u_91 = v_u_90.Name
                if v_u_91 ~= "CloneMode" then
                    local v_u_92 = v_u_10[v_u_91]
                    local v_u_93 = v_u_90.Contextbutton
                    local v_u_94 = v_u_15[v_u_22 .. v_u_91]
                    v_u_92.PrintValue(v_u_90, v_u_94.Value, Color3.new(1, 1, 1), v_u_61)
                    local v_u_95 = SetButton(v_u_93, v_u_92, v_u_94)
                    if v_u_95 then
                        local v_u_96 = nil
                        local v_u_97 = nil
                        local v_u_98 = nil
                        local v_u_99 = false
                        v_u_18[v_u_91] = function()
                            -- upvalues: (copy) v_u_93, (ref) v_u_95
                            ColorBttn(v_u_93, v_u_95)
                        end
                        v_u_98 = v_u_93.MouseButton1Down:Connect(function()
                            -- upvalues: (ref) v_u_20, (ref) v_u_16, (ref) v_u_95, (ref) v_u_54, (ref) v_u_56, (copy) v_u_91, (ref) v_u_55, (ref) v_u_32, (ref) v_u_21, (copy) v_u_93, (copy) v_u_92, (copy) v_u_94, (ref) v_u_99, (copy) v_u_90, (ref) v_u_61, (ref) v_u_18, (ref) v_u_96, (ref) v_u_97, (ref) v_u_98
                            if v_u_20 then
                                return
                            elseif v_u_16.Value < v_u_95 then
                                v_u_54:Play()
                                return
                            elseif v_u_56[v_u_91] then
                                v_u_54:Play()
                            else
                                v_u_20 = true
                                v_u_55:Play()
                                local v100 = v_u_32:InvokeServer(v_u_91, v_u_21)
                                v_u_20 = false
                                if v100 then
                                    v_u_95 = SetButton(v_u_93, v_u_92, v_u_94)
                                    if v_u_95 then
                                        if v_u_99 then
                                            OnMouseOver(v_u_90, v_u_94, v_u_92)
                                        else
                                            v_u_92.PrintValue(v_u_90, v_u_94.Value, Color3.new(1, 1, 1), v_u_61)
                                        end
                                        v_u_18[v_u_91] = function()
                                            -- upvalues: (ref) v_u_93, (ref) v_u_95
                                            ColorBttn(v_u_93, v_u_95)
                                        end
                                        return
                                    end
                                    v_u_18[v_u_91] = nil
                                    v_u_92.PrintValue(v_u_90, v100, Color3.new(1, 1, 1), v_u_61)
                                    v_u_96:Disconnect()
                                    v_u_97:Disconnect()
                                    v_u_98:Disconnect()
                                end
                            end
                        end)
                        v_u_96 = v_u_93.MouseEnter:Connect(function()
                            -- upvalues: (ref) v_u_99, (copy) v_u_90, (copy) v_u_94, (copy) v_u_92
                            v_u_99 = true
                            OnMouseOver(v_u_90, v_u_94, v_u_92)
                        end)
                        v_u_97 = v_u_93.MouseLeave:Connect(function()
                            -- upvalues: (ref) v_u_99, (copy) v_u_92, (copy) v_u_90, (copy) v_u_94, (ref) v_u_61
                            v_u_99 = false
                            v_u_92.PrintValue(v_u_90, v_u_94.Value, Color3.new(1, 1, 1), v_u_61)
                        end)
                        local v101 = v_u_60
                        local v102 = v_u_96
                        table.insert(v101, v102)
                        local v103 = v_u_60
                        local v104 = v_u_97
                        table.insert(v103, v104)
                        local v105 = v_u_60
                        local v106 = v_u_98
                        table.insert(v105, v106)
                    end
                end
            end
        end
    end
end
v_u_16:GetPropertyChangedSignal("Value"):Connect(function()
    -- upvalues: (copy) v_u_18
    for _, v107 in pairs(v_u_18) do
        v107()
    end
end)
if v_u_61 then
    v_u_36.Visible = false
else
    v37.Activated:Connect(function()
        -- upvalues: (copy) v_u_1, (copy) v_u_14
        v_u_1:PromptGamePassPurchase(v_u_14, 208230158)
    end)
    local v_u_108 = v_u_36.MouseEnter:Connect(function()
        ForGamePassUpdate(Color3.fromRGB(0, 255, 0), true)
    end)
    local v_u_109 = v_u_36.MouseLeave:Connect(function()
        ForGamePassUpdate(Color3.fromRGB(255, 255, 255), false)
    end)
    local v_u_110 = v_u_14.Stats.GamePass.GiantClone
    v_u_110:GetPropertyChangedSignal("Value"):Connect(function()
        -- upvalues: (copy) v_u_110, (ref) v_u_61, (copy) v_u_55, (copy) v_u_36, (copy) v_u_108, (copy) v_u_109
        if v_u_110.Value then
            v_u_61 = true
            v_u_55:Play()
            v_u_36.Visible = false
            ForGamePassUpdate(Color3.fromRGB(255, 255, 255), true)
            v_u_108:Disconnect()
            v_u_109:Disconnect()
        end
    end)
end
function WatchClone(p111, p112)
    -- upvalues: (ref) v_u_19, (copy) v_u_13, (copy) v_u_14, (copy) v_u_25, (copy) v_u_40, (copy) v_u_35, (copy) v_u_34, (ref) v_u_33, (copy) v_u_5, (ref) v_u_59
    v_u_19 = true
    v_u_13.CameraType = Enum.CameraType.Attach
    local v113 = p111.Humanoid
    v_u_13.CameraSubject = v113
    v113.CameraOffset = Vector3.new(-7.5, 0, 0)
    v_u_14.CameraMinZoomDistance = 10
    v_u_14.CameraMaxZoomDistance = 10
    v_u_25:Disable()
    v_u_40.MaxSize = Vector2.new(0.72 * v_u_35.AbsoluteSize.X, 400)
    CancelTween()
    v_u_34.AnchorPoint = Vector2.new(0, 0.5)
    if p112 then
        v_u_33 = v_u_5:Create(v_u_34, TweenInfo.new(0.9, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            ["Size"] = p112,
            ["Position"] = UDim2.fromScale(0.05, 0.5)
        })
        v_u_33:Play()
    else
        v_u_34.Position = UDim2.fromScale(0.05, 0.5)
    end
    local v114 = v_u_14.Character
    local v115
    if v114 then
        v115 = v114:FindFirstChild("HumanoidRootPart")
    else
        v115 = v114
    end
    if v115 then
        v115.Anchored = true
    end
    if v114 then
        v114 = v114:FindFirstChild("Humanoid")
    end
    if v114 then
        v_u_59 = v114.Died:Connect(function()
            -- upvalues: (ref) v_u_25
            v_u_25:Enable()
        end)
    end
end
function TogglePPs(p116)
    -- upvalues: (copy) v_u_24
    for _, v117 in pairs(v_u_24) do
        v117.Enabled = p116
    end
end
function OpenCloneSetting()
    -- upvalues: (copy) v_u_34, (copy) v_u_41, (copy) v_u_10, (copy) v_u_14, (ref) v_u_21, (copy) v_u_49, (copy) v_u_40, (copy) v_u_35, (ref) v_u_33, (copy) v_u_5, (copy) v_u_52
    TogglePPs(false)
    CancelTween()
    v_u_34.Position = UDim2.fromScale(1.5, 0.75)
    v_u_34.Size = UDim2.fromOffset(60, 60)
    v_u_34.Visible = true
    v_u_41.Visible = false
    local v118 = v_u_10.GetPlayerClone(v_u_14, v_u_21)
    if v118 then
        WatchClone(v118, v_u_49)
    else
        v_u_40.MaxSize = Vector2.new(0.85 * v_u_35.AbsoluteSize.X, 400)
        v_u_34.AnchorPoint = Vector2.new(0.5, 0.5)
        v_u_33 = v_u_5:Create(v_u_34, TweenInfo.new(0.9, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            ["Size"] = v_u_49,
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        })
        v_u_33:Play()
    end
    v_u_52:Play()
end
function CloseCloneSettings()
    -- upvalues: (ref) v_u_21, (copy) v_u_17, (copy) v_u_34, (copy) v_u_53, (copy) v_u_41, (ref) v_u_19
    TogglePPs(true)
    if v_u_21 == 2 and not v_u_17:GetAttribute("SecondaryCloneActive") then
        ChangeCloneSelection(1)
    end
    if v_u_34.Visible then
        v_u_53:Play()
        v_u_41.Visible = true
        if v_u_19 then
            StopWatchingClone()
        end
        v_u_34.Visible = false
    end
end
function StopWatchingClone()
    -- upvalues: (ref) v_u_19, (copy) v_u_14, (copy) v_u_13, (copy) v_u_4, (copy) v_u_34, (copy) v_u_49, (copy) v_u_25, (ref) v_u_59
    v_u_19 = false
    local v119 = v_u_14.Character
    local v120
    if v119 then
        v120 = v119:FindFirstChild("HumanoidRootPart")
    else
        v120 = v119
    end
    if v120 then
        v120.Anchored = false
    end
    v_u_13.CameraType = Enum.CameraType.Custom
    local v121 = v_u_13
    if v119 then
        v119 = v119:FindFirstChild("Humanoid")
    end
    v121.CameraSubject = v119
    v_u_14.CameraMinZoomDistance = v_u_4.CameraMinZoomDistance
    v_u_14.CameraMaxZoomDistance = v_u_4.CameraMaxZoomDistance
    CancelTween()
    local v122 = v_u_34
    local v123 = v_u_34
    local v124 = v_u_49
    local v125 = UDim2.fromScale(0.5, 0.5)
    v122.Size = v124
    v123.Position = v125
    v_u_34.AnchorPoint = Vector2.new(0.5, 0.5)
    v_u_25:Enable()
    if v_u_59 then
        v_u_59:Disconnect()
    end
end
function ChangeCloneSelection(p126)
    -- upvalues: (ref) v_u_21, (ref) v_u_22, (copy) v_u_10
    if p126 == v_u_21 then
        return false
    end
    v_u_21 = p126
    v_u_22 = v_u_10.GetCloneIdentifiantStr(v_u_21)
    DisplayStats()
    return true
end
function CancelTween()
    -- upvalues: (ref) v_u_33
    if v_u_33 and v_u_33.PlaybackState ~= Enum.PlaybackState.Completed then
        v_u_33:Cancel()
        v_u_33 = nil
    end
end
v31.OnClientEvent:Connect(function(p127)
    -- upvalues: (copy) v_u_34, (ref) v_u_21, (copy) v_u_24
    local v_u_128 = p127.HumanoidRootPart.SettingsPrompt
    local v_u_129 = p127:GetAttribute("CloneNumber")
    if v_u_34.Visible then
        if v_u_129 == v_u_21 then
            WatchClone(p127, nil)
        end
    else
        v_u_128.Enabled = true
    end
    v_u_128.Triggered:Connect(function()
        -- upvalues: (copy) v_u_129, (ref) v_u_34
        if ChangeCloneSelection(v_u_129) and not v_u_34.Visible then
            OpenCloneSetting()
        else
            ToggleCloneSettings()
        end
    end)
    local v_u_130 = nil
    v_u_130 = v_u_128.AncestryChanged:Connect(function()
        -- upvalues: (copy) v_u_128, (ref) v_u_130, (ref) v_u_24
        if not v_u_128:IsDescendantOf(workspace) then
            v_u_130:Disconnect()
            table.remove(v_u_24, table.find(v_u_24, v_u_128))
        end
    end)
    local v131 = v_u_24
    table.insert(v131, v_u_128)
end)
function ToggleCloneSettings()
    -- upvalues: (copy) v_u_34
    if v_u_34.Visible then
        CloseCloneSettings()
    else
        OpenCloneSetting()
    end
end
v50.OnInvoke = ToggleCloneSettings
function OnTimeChanged()
    -- upvalues: (ref) v_u_57, (ref) v_u_26, (copy) v_u_39, (copy) v_u_30, (ref) v_u_21
    if v_u_57 then
        v_u_57:Disconnect()
    end
    if v_u_26.Value <= 0 then
        v_u_39.AutoButtonColor = true
        v_u_39.Text = "Reset clone"
        v_u_39.TextColor3 = Color3.fromRGB(255, 30, 50)
        v_u_57 = v_u_39.Activated:Connect(function()
            -- upvalues: (ref) v_u_30, (ref) v_u_21
            v_u_30:FireServer(v_u_21)
        end)
    else
        v_u_39.AutoButtonColor = false
        v_u_39.Text = "Respawn in " .. v_u_26.Value .. "s"
        v_u_39.TextColor3 = Color3.fromRGB(255, 255, 40)
    end
end
function TryToWatchClone()
    -- upvalues: (copy) v_u_10, (copy) v_u_14, (ref) v_u_21, (copy) v_u_34, (ref) v_u_19
    local v132 = v_u_10.GetPlayerClone(v_u_14, v_u_21)
    if v132 and v_u_34.Visible then
        WatchClone(v132)
    elseif v_u_19 then
        StopWatchingClone()
    end
end
v46.Activated:Connect(function()
    -- upvalues: (copy) v_u_53, (ref) v_u_21
    v_u_53:Play()
    local v133 = v_u_21 + 1
    local v134 = v133 > 2 and 1 or v133
    ChangeCloneSelection(v134)
    TryToWatchClone()
end)
v47.Activated:Connect(function()
    -- upvalues: (copy) v_u_53, (ref) v_u_21
    v_u_53:Play()
    local v135 = v_u_21 - 1
    local v136 = v135 < 1 and 2 or v135
    ChangeCloneSelection(v136)
    TryToWatchClone()
end)
v_u_62.Changed:Connect(function()
    -- upvalues: (copy) v_u_34, (ref) v_u_21, (copy) v_u_62, (ref) v_u_58, (copy) v_u_55, (copy) v_u_48
    if v_u_34.Visible and v_u_21 == 2 then
        if v_u_62.Value then
            if v_u_58 then
                v_u_55:Play()
                v_u_58:Disconnect()
            end
            v_u_48.Visible = false
            DisplayStats()
        else
            v_u_48.Visible = true
            LoadLocked()
        end
    else
        return
    end
end)
v38.Visible = true
v23.Enabled = true
v23.Triggered:Connect(ToggleCloneSettings)
ChangeCloneSelection(1)

--========================================
-- LocalScript : StarterGui.MainGui.CustomisationFrame.CustomizationScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("MarketplaceService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Players").LocalPlayer
while not v_u_4:GetAttribute("DataFullyLoaded") do
    v_u_4:GetAttributeChangedSignal("DataFullyLoaded"):Wait()
end
local v_u_5 = v_u_4.Stats.Custom.CustomColorsEnabled.Value
local v_u_6 = v_u_4.Stats.GamePass.AdvancedCustomization
local v_u_7 = v_u_4.leaderstats.Level
local v_u_8 = v_u_6.Value
local v_u_9 = v_u_7.Value
local v_u_10 = workspace.Camera
local v_u_11 = script.Parent
local v_u_12 = v_u_11.Parent
local v_u_13 = v_u_12.LowerFrameContainer.ToolFrame
local v_u_14 = v_u_11.ScrollingFrame
local v15 = v_u_14.CustomiseElementFrame_TEMPLATE
local v_u_16 = v_u_11.LockFrame
local v17 = v_u_16.StartCustomizationBttn
local v_u_18 = v_u_11.DefaultColorsBttn
local v_u_19 = {}
local v_u_20 = script.GPFrame
local v_u_21 = v_u_11.ForAdvancedCustomizationButton
local v22 = v_u_21.AdvancedCustomization
local v_u_23 = v_u_12.CustomConfirmFrame
local v24 = v_u_23.SaveButton
local v25 = v_u_23.CancelButton
local v_u_26 = require(v2.AllModules.GetTowerForPlayer)(v_u_4, true)
local v_u_27 = require(v_u_4.PlayerScripts:WaitForChild("PlayerModule")):GetControls()
local v_u_28 = require(v2.AllModules.Customization.CustomisationUnlockedWithGP)
local v_u_29 = require(v2.AllModules.Customization.AvialableMaterials)
local v_u_30 = require(script.CustomisationApplier)
local v_u_31 = require(script.SelectMaterialModule)
local v_u_32 = require(script.SelectColorModule)
local v33 = v_u_11.ToggleCustomizationF
local v_u_34 = false
local v_u_35 = v_u_30.OrderedPartName
local v36 = {
    ["Wall"] = "Color1Part",
    ["Wall base"] = "Color2Part",
    ["Window border"] = "Color3Part",
    ["Window"] = "Color4Part",
    ["Path"] = "Color6Part",
    ["Loadout pad"] = "Color7Part",
    ["Floor"] = "Color5Part",
    ["Lights"] = "Color8Part"
}
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = nil
local v_u_40 = false
local v_u_41 = nil
local v_u_42 = TweenInfo.new(1.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)
local v_u_43 = TweenInfo.new(0.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)
local v_u_44 = TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v_u_45 = nil
local v_u_46 = nil
local v_u_47 = nil
local v_u_48 = nil
local v_u_49 = game:GetService("SoundService").Sound
local v_u_50 = v_u_49.ClickSound
function MoveCameraTo(p51)
    -- upvalues: (ref) v_u_48, (ref) v_u_46, (copy) v_u_26, (copy) v_u_3, (copy) v_u_10, (copy) v_u_43, (copy) v_u_42
    if v_u_48 ~= p51 then
        if v_u_46 then
            v_u_46:Cancel()
        end
        local v52 = v_u_26:GetPivot()
        local v53
        if p51 == "Default" then
            v53 = CFrame.lookAt((v52 * CFrame.new(0, 35, 145)).Position, v52.Position + Vector3.new(0, 7.5, 0))
        else
            v53 = CFrame.lookAt((v52 * CFrame.new(48, 9, 76)).Position, (v52 * CFrame.new(0, 2, 40)).Position)
        end
        v_u_46 = v_u_3:Create(v_u_10, v_u_48 and v_u_43 or v_u_42, {
            ["CFrame"] = v53
        })
        v_u_46:Play()
        v_u_48 = p51
    end
end
function ToggleCustomization(p54)
    -- upvalues: (ref) v_u_34, (copy) v_u_27, (copy) v_u_13, (copy) v_u_10, (ref) v_u_41, (ref) v_u_5, (copy) v_u_11, (copy) v_u_23, (ref) v_u_47, (copy) v_u_3, (copy) v_u_44, (ref) v_u_45, (ref) v_u_46, (copy) v_u_4, (ref) v_u_48
    v_u_34 = not v_u_34
    if v_u_34 then
        v_u_27:Disable()
        v_u_13.Visible = false
        v_u_10.CameraType = Enum.CameraType.Scriptable
        v_u_41 = v_u_5
        v_u_11.Position = UDim2.fromScale(-0.1, 0.5)
        v_u_23.Position = UDim2.fromScale(0.5, 1)
        v_u_11.AnchorPoint = Vector2.new(1, 0.5)
        v_u_23.AnchorPoint = Vector2.new(0.5, 0)
        v_u_11.Visible = true
        v_u_23.Visible = true
        v_u_47 = v_u_3:Create(v_u_11, v_u_44, {
            ["Position"] = UDim2.fromScale(0.01, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5)
        })
        v_u_45 = v_u_3:Create(v_u_23, v_u_44, {
            ["Position"] = UDim2.fromScale(0.5, 0.975),
            ["AnchorPoint"] = Vector2.new(0.5, 1)
        })
        v_u_45:Play()
        v_u_47:Play()
        MoveCameraTo("Default")
        SetColors()
    else
        v_u_27:Enable()
        if v_u_46 and v_u_46.PlaybackState == Enum.PlaybackState.Playing then
            v_u_46:Cancel()
        end
        v_u_10.CameraType = Enum.CameraType.Custom
        local v55 = v_u_10
        local v56 = v_u_4.Character
        if v56 then
            v56 = v_u_4.Character:FindFirstChild("Humanoid")
        end
        v55.CameraSubject = v56
        v_u_13.Visible = true
        v_u_11.Visible = false
        v_u_23.Visible = false
        v_u_48 = nil
        ChangeSelection()
        if not p54 then
            ApplyCustomisationOnServer()
        end
    end
end
function ApplyCustomisationOnServer()
    -- upvalues: (ref) v_u_40, (copy) v_u_30, (ref) v_u_5
    v_u_40 = true
    v_u_30.SendCustomisationToServer(v_u_5)
    v_u_40 = false
end
function SetColors()
    -- upvalues: (copy) v_u_30, (ref) v_u_5, (copy) v_u_14, (copy) v_u_35, (copy) v_u_29
    local v57 = v_u_30.GetAppliedAppearanceAndResetCustomization(v_u_5)
    for v58, v59 in pairs(v57.Colors) do
        v_u_14[v_u_35[v58]].ColorButton.ColorFrame.BackgroundColor3 = v59
    end
    for v60, v61 in pairs(v57.Materials) do
        local v62 = v_u_14[v_u_35[v60]].MaterialButton.MaterialImage
        v62.Image = v_u_29[v61]
        v62:SetAttribute("CurrentMaterialName", v61)
    end
end
function ToggleDefaultColorMode(p63)
    -- upvalues: (copy) v_u_50, (ref) v_u_5, (copy) v_u_16, (copy) v_u_18
    if p63 ~= true then
        v_u_50:Play()
        v_u_5 = not v_u_5
        SetColors()
    end
    if v_u_5 then
        v_u_16.Visible = false
        v_u_18.ButtonFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    else
        v_u_16.Visible = true
        v_u_18.ButtonFrame.BackgroundColor3 = Color3.new(0.3, 1, 0.3)
        ChangeSelection()
    end
end
function ChangeSelection(p64, p65, p66, p67)
    -- upvalues: (ref) v_u_37, (copy) v_u_32, (ref) v_u_39, (copy) v_u_31, (ref) v_u_38
    local v68 = p64 and true or false
    if v_u_37 == p64 then
        p64 = nil
        p66 = nil
        p65 = nil
    end
    if v_u_37 then
        v_u_37.BorderSizePixel = 0
    end
    if p64 then
        v_u_37 = p64
        v_u_37.BorderSizePixel = 3
        if p66 == "Colors" then
            v_u_32.ShowAndSelect(p65, p67)
            if v_u_39 == "Materials" then
                v_u_31.Close()
            end
        elseif p66 == "Materials" then
            v_u_31.ShowAndSelect(p65, p67)
            if v_u_39 == "Colors" then
                v_u_32.Close()
            end
        end
    elseif v_u_39 == "Colors" then
        v_u_32.Close()
    elseif v_u_39 == "Materials" then
        v_u_31.Close()
    end
    v_u_38 = p65
    if v68 then
        if v_u_38 == "Loadout pad" or (v_u_38 == "Path" or (v_u_38 == "Floor" or v_u_38 == "Lights")) then
            MoveCameraTo("InTower")
        else
            MoveCameraTo("Default")
        end
    end
    v_u_39 = p66
    v_u_37 = p64
end
local v_u_69 = v_u_41
local v_u_70 = v_u_40
local v_u_71 = v_u_5
local v_u_72 = nil
for v73, v_u_74 in pairs(v_u_35) do
    local v75 = v15:Clone()
    v75.LayoutOrder = v73
    v75.PartLabel.Text = v_u_74
    v75.Parent = v_u_14
    v75.Name = v_u_74
    local v_u_76 = v75.ColorButton
    local v_u_77 = v36[v_u_74]
    v_u_76.Activated:Connect(function()
        -- upvalues: (ref) v_u_71, (copy) v_u_28, (copy) v_u_77, (ref) v_u_8, (ref) v_u_9, (copy) v_u_50, (copy) v_u_76, (copy) v_u_74
        if v_u_71 then
            if v_u_28.CanCustomize(v_u_77, "Colors", v_u_8, v_u_9) then
                v_u_50:Play()
                ChangeSelection(v_u_76, v_u_74, "Colors", v_u_76.ColorFrame)
            end
        else
            return
        end
    end)
    local v_u_78 = v75.MaterialButton
    if v73 == 8 then
        v_u_78:Destroy()
        v75.UIAspectRatioConstraint.AspectRatio = 2.9
        v_u_76.Position = UDim2.fromScale(0, 0.725)
    else
        v_u_78.Activated:Connect(function()
            -- upvalues: (ref) v_u_71, (copy) v_u_28, (copy) v_u_77, (ref) v_u_8, (ref) v_u_9, (copy) v_u_50, (copy) v_u_78, (copy) v_u_74
            if v_u_71 then
                if v_u_28.CanCustomize(v_u_77, "Materials", v_u_8, v_u_9) then
                    v_u_50:Play()
                    ChangeSelection(v_u_78, v_u_74, "Materials", v_u_78.MaterialImage)
                end
            else
                return
            end
        end)
    end
    local v79 = v_u_28.UnlockedWithGPList[v_u_77].Colors
    if v79 then
        if typeof(v79) == "number" then
            v_u_76:SetAttribute("LevelRequired", v79)
        end
        table.insert(v_u_19, v_u_76)
    end
    local v80 = v_u_28.UnlockedWithGPList[v_u_77].Materials
    if v73 ~= 8 and v80 then
        if typeof(v80) == "number" then
            v_u_78:SetAttribute("LevelRequired", v80)
        end
        table.insert(v_u_19, v_u_78)
    end
end
function RefreshButton()
    -- upvalues: (copy) v_u_19, (ref) v_u_8, (ref) v_u_9, (copy) v_u_20
    for _, v81 in pairs(v_u_19) do
        local v82 = v81:GetAttribute("LevelRequired")
        local v83 = v_u_8
        if not v83 then
            if v82 then
                v83 = v82 <= v_u_9
            else
                v83 = v82
            end
        end
        v81.AutoButtonColor = v83
        if v83 then
            v81:AddTag("SizableUI")
        else
            v81:RemoveTag("SizableUI")
        end
        local v84 = v81:FindFirstChild("GPFrame")
        if v84 then
            ::l12::
            v84.Visible = not v83
        elseif not v83 then
            v84 = v_u_20:Clone()
            v84.Parent = v81
            if v82 then
                local v85 = v84.CustomButtonLabel
                v85.Text = v85.Text .. " or lvl." .. v82
            end
            goto l12
        end
    end
end
function OnGPValChanged()
    -- upvalues: (ref) v_u_8, (copy) v_u_6, (copy) v_u_11, (copy) v_u_49, (copy) v_u_21
    v_u_8 = v_u_6.Value
    if v_u_8 and v_u_11.Visible then
        v_u_49.BuySound:Play()
    end
    v_u_21.Visible = not v_u_8
    RefreshButton()
end
function ScaleGui()
    -- upvalues: (copy) v_u_11, (copy) v_u_14
    local v86 = v_u_11.AbsoluteSize.Y
    local v87 = v_u_14
    local v88 = v86 * 0.03
    v87.ScrollBarThickness = math.min(14, v88)
    local v89 = v86 * 0.015
    v_u_14.UIListLayout.Padding = UDim.new(0, 3 * v89)
    local v90 = v_u_14.UIPadding
    v90.PaddingBottom = UDim.new(0, 2 * v89)
    v90.PaddingTop = UDim.new(0, 2 * v89)
    v90.PaddingRight = UDim.new(0, v89)
    v90.PaddingLeft = UDim.new(0, v89)
end
function OnVisibleStateChanged()
    -- upvalues: (ref) v_u_72, (copy) v_u_11, (copy) v_u_12
    if v_u_72 then
        v_u_72:Disconnect()
    end
    if v_u_11.Visible then
        v_u_72 = v_u_12:GetPropertyChangedSignal("AbsoluteSize"):Connect(ScaleGui)
        ScaleGui()
    end
end
v22.Activated:Connect(function()
    -- upvalues: (ref) v_u_71, (copy) v_u_50, (copy) v_u_1, (copy) v_u_4
    if v_u_71 then
        v_u_50:Play()
        pcall(v_u_1.PromptGamePassPurchase, v_u_1, v_u_4, 1510119557)
    end
end)
v15:Destroy()
v_u_14.CanvasSize = UDim2.fromScale(0, #v_u_35 * 0.33 + 0.125)
v25.Activated:Connect(function()
    -- upvalues: (copy) v_u_50, (ref) v_u_69, (ref) v_u_71, (copy) v_u_30
    v_u_50:Play()
    if v_u_69 ~= v_u_71 then
        ToggleDefaultColorMode()
    end
    local v91 = v_u_30.GetAppliedAppearanceAndResetCustomization(v_u_71)
    v_u_30.ApplyAppearance(v91)
    ToggleCustomization(true)
end)
v24.Activated:Connect(function()
    -- upvalues: (copy) v_u_50, (ref) v_u_70
    v_u_50:Play()
    if not v_u_70 then
        ToggleCustomization()
    end
end)
v_u_7:GetPropertyChangedSignal("Value"):Connect(function()
    -- upvalues: (ref) v_u_9, (copy) v_u_7
    v_u_9 = v_u_7.Value
    RefreshButton()
end)
ToggleDefaultColorMode(true)
v_u_6:GetPropertyChangedSignal("Value"):Connect(OnGPValChanged)
OnGPValChanged()
OnVisibleStateChanged()
v_u_11:GetPropertyChangedSignal("Visible"):Connect(OnVisibleStateChanged)
v17.Activated:Connect(ToggleDefaultColorMode)
v_u_18.Activated:Connect(ToggleDefaultColorMode)
v_u_32.UnselectOnCustomizeGui = ChangeSelection
v_u_31.UnselectOnCustomizeGui = ChangeSelection
v33.OnInvoke = ToggleCustomization

--========================================
-- LocalScript : StarterGui.MainGui.RedeemCode.RedeemCodeScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("SoundService")
local v_u_2 = script.Parent
local v_u_3 = v_u_2.UIScale
local v_u_4 = v_u_2.RedeemButton
local v_u_5 = v_u_2.CloseBttn
local v_u_6 = v1.Sound.TextWriteSound
local v_u_7 = v1.Sound.BipWrong
local v_u_8 = game.ReplicatedStorage.RemoteFunction.RedeemF
local v_u_9 = false
local v_u_10 = false
local v_u_11 = Color3.new(0, 1)
local v_u_12 = Color3.new()
local v_u_13 = v_u_2.MaxVisibleGraphemes
function EndWin(p14)
    -- upvalues: (ref) v_u_10, (copy) v_u_2, (copy) v_u_12
    if v_u_10 then
        v_u_2.TextColor3 = v_u_12
        v_u_10 = false
        v_u_2.ClearTextOnFocus = false
        if p14 then
            v_u_2.Text = ""
        end
    end
end
function PrintErr(p15)
    -- upvalues: (ref) v_u_9, (copy) v_u_2, (copy) v_u_6, (copy) v_u_7, (copy) v_u_12
    v_u_9 = true
    v_u_2.Text = p15
    v_u_2.MaxVisibleGraphemes = 0
    v_u_2.TextColor3 = Color3.fromRGB(230, 15, 15)
    v_u_6:Play()
    v_u_7:Play()
    local v16 = v_u_2.Focused:Once(function() end)
    for v17 = 1, p15:len() do
        task.wait(0.04)
        if not (v16.Connected and v_u_2.Visible) then
            break
        end
        v_u_2.MaxVisibleGraphemes = v17
    end
    v_u_6:Stop()
    for _ = p15:len() + 1, 65 do
        if not (v16.Connected and v_u_2.Visible) then
            break
        end
        task.wait(0.04)
    end
    v16:Disconnect()
    v_u_2.MaxVisibleGraphemes = -1
    v_u_2.TextColor3 = v_u_12
    v_u_9 = false
end
function FireCodeToServer()
    -- upvalues: (copy) v_u_2, (copy) v_u_13, (copy) v_u_4, (copy) v_u_8, (ref) v_u_10, (copy) v_u_11
    if v_u_2.TextEditable and (v_u_13 >= v_u_2.Text:len() and v_u_2.Text:len() > 0) then
        local v18 = v_u_4
        v_u_2.TextEditable = false
        v18.AutoButtonColor = false
        v_u_4.Text = "Redeeming..."
        local v19 = v_u_2.Text:lower()
        local v20, v21 = v_u_8:InvokeServer(v19)
        v_u_4.Text = "Redeem"
        local v22 = v_u_4
        v_u_2.TextEditable = true
        v22.AutoButtonColor = true
        if v20 or not v21 then
            if v20 then
                v_u_10 = true
                v_u_2.TextColor3 = v_u_11
                v_u_2.ClearTextOnFocus = true
                task.wait(2.5)
                EndWin(true)
            end
        else
            PrintErr(v21)
            if v_u_2.Visible then
                v_u_2.Text = v19
                return
            end
        end
    end
end
v_u_2:GetPropertyChangedSignal("Text"):Connect(function()
    -- upvalues: (ref) v_u_9, (copy) v_u_2, (copy) v_u_13
    if not v_u_9 then
        EndWin(false)
        local v23 = v_u_2.Text
        local v24 = v23:find(" ")
        if v24 then
            v_u_2.Text = v23:sub(1, v24 - 1) .. v23:sub(v24 + 1, -1)
        end
        if v_u_2.TextEditable and v_u_13 < v23:len() then
            v_u_2.Text = v23:sub(1, v_u_13)
        end
    end
end)
v_u_4.Activated:Connect(FireCodeToServer)
v_u_2.FocusLost:Connect(function(p25)
    if p25 then
        FireCodeToServer()
    end
end)
v_u_2:GetPropertyChangedSignal("Visible"):Connect(function()
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
    if v_u_2 then
        if v_u_2.Visible then
            local v26 = v_u_3.Scale
            local v27 = v_u_2.AbsoluteSize.X * 0.0142 / v26
            local v28 = 0.4 * v27
            v_u_2.TextSize = 2.5 * v_u_2.AbsoluteSize.X / 19 / v26
            v_u_2.UIStroke.Thickness = v27
            v_u_5.UIStroke.Thickness = v28
            v_u_4.UIStroke.Thickness = v28
            v_u_2.Title.UIStroke.Thickness = v28
        else
            v_u_2.Text = ""
        end
    else
        return
    end
end)
