
--========================================
-- LocalScript : StarterGui.shop2.shop.items.settings.vip.options.buttons.lock.xbox.controllerIcon
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
-- LocalScript : StarterGui.shop2.shop.items.appeal.remover
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
if game.PlaceId == 5253186791 then
    script.Parent.Parent.settings.NextSelectionRight = script.Parent
else
    script.Parent:Destroy()
end

--========================================
-- LocalScript : StarterGui.shop2.shop.items.appeal.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
wait(1)
function appeal()
    local v1 = {
        "cheating",
        "7 days",
        "reset",
        "progress",
        "agree"
    }
    local v2 = script.Parent.agreementBox.Text
    local v3 = 0
    for _, v4 in pairs(v1) do
        if v2:find(v4, nil, true) then
            v3 = v3 + 1
        end
    end
    if #v1 * 0.6 < v3 then
        game.ReplicatedStorage.Remotes.Moderation.appealBan:InvokeServer()
        for _, v5 in pairs(script.Parent:GetChildren()) do
            if v5.Name ~= "alreadyappealed" and v5.Name ~= "LocalScript" then
                v5:Destroy()
            end
        end
        script.Parent.alreadyappealed.Text = "Successfully appealed. Please wait 7 days to be unbanned"
        script.Parent.alreadyappealed.Visible = true
    end
end
function replace(p6, p7, p8)
    while true do
        local v9, v10 = string.find(p6, p7, nil, true)
        if not v9 then
            break
        end
        local v11 = v9 - 1
        local v12 = string.sub(p6, 1, v11)
        local v13 = v10 + 1
        p6 = v12 .. p8 .. string.sub(p6, v13, -1)
    end
    return p6
end
script.Parent.appeal.InputBegan:Connect(function(p14)
    if p14.UserInputType == Enum.UserInputType.MouseButton1 then
        appeal()
    end
end)
script.Parent.appeal.TouchTap:Connect(function()
    appeal()
end)
local v15 = game.ReplicatedStorage.Remotes.Moderation.getBans:InvokeServer()
if v15 then
    if #v15 > 1 then
        for _, v16 in pairs(script.Parent:GetChildren()) do
            if v16.Name ~= "alreadyappealed" and v16.Name ~= "LocalScript" then
                v16:Destroy()
            end
        end
        script.Parent.alreadyappealed.Text = "You are not allowed to appeal or already used yours"
        script.Parent.alreadyappealed.Visible = true
    elseif #v15 > 0 then
        local v17 = v15[#v15].Reason
        local v18 = replace(v17, "\n", " ")
        script.Parent.reason.Text = "Ban reason: " .. v18
    end
else
    warn("Ban status unverifiable. Server did not return \'UserBans\'")
    return
end

--========================================
-- LocalScript : StarterGui.shop2.shop.items.effects.controller
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = script.Parent.Parent.Parent.Parent
local _ = game.ReplicatedStorage.Configuration.Effects
local v_u_2 = script.Parent.selected
local function v_u_14()
    -- upvalues: (copy) v_u_2
    local v3 = v_u_2.Value.AbsolutePosition.Y - script.Parent.AbsolutePosition.Y + script.Parent.CanvasPosition.Y - script.Parent.AbsoluteSize.Y / 2 + v_u_2.Value.AbsoluteSize.Y / 2
    local v4 = script.Parent.AbsoluteSize.Y / 2 - v_u_2.Value.AbsoluteSize.Y * 1
    local v5 = game:GetService("TweenService")
    local v6 = script.Parent
    local v7 = TweenInfo.new(0.35)
    local v8 = {}
    local v9 = Vector2.new
    local v10 = script.Parent.CanvasPosition.Y
    local v11 = v3 + v4
    local v12 = math.min(v10, v11)
    local v13 = v3 - v4
    v8.CanvasPosition = v9(0, (math.max(v12, v13)))
    v5:Create(v6, v7, v8):Play()
end
local v_u_15 = {
    [Enum.KeyCode.DPadDown] = "NextSelectionDown",
    [Enum.KeyCode.DPadUp] = "NextSelectionUp",
    [Enum.KeyCode.DPadLeft] = "NextSelectionLeft",
    [Enum.KeyCode.DPadRight] = "NextSelectionRight"
}
local v_u_16 = {
    [Vector3.new(0, -1, 0)] = "NextSelectionDown",
    [Vector3.new(0, 1, 0)] = "NextSelectionUp",
    [Vector3.new(-1, 0, 0)] = "NextSelectionLeft",
    [Vector3.new(1, 0, 0)] = "NextSelectionRight"
}
local function v_u_20(p17)
    -- upvalues: (copy) v_u_2, (copy) v_u_14
    if v_u_2.Value then
        local v18 = v_u_2.value:IsDescendantOf(script.Parent.effects) and script.Parent.effects or script.Parent.boxes
        local v19 = v_u_2.Value[p17] or v18[p17]
        if v19 then
            v_u_2.Value = v19
        end
        v_u_14()
    else
        v_u_2.Value = script.Parent.boxes.boxFrame.Regular
    end
end
game:GetService("UserInputService").InputBegan:Connect(function(p21)
    -- upvalues: (copy) v_u_1, (copy) v_u_15, (copy) v_u_20
    if v_u_1.open.Value and v_u_1.tab.Value == script.Parent then
        local v22 = game:GetService("VRService")
        if not (v22:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v22:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
            if v_u_15[p21.KeyCode] then
                v_u_20(v_u_15[p21.KeyCode])
            end
        end
    else
        return
    end
end)
require(game.ReplicatedStorage.Library.Utility.thumbScroller2D)(Enum.KeyCode.Thumbstick1, function(p23, p24)
    -- upvalues: (copy) v_u_1, (copy) v_u_16, (copy) v_u_20
    if v_u_1.open.Value and v_u_1.tab.Value == script.Parent then
        local v25 = game:GetService("VRService")
        if not (v25:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v25:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
            if v_u_16[p24] then
                local v26 = p23.X
                local v27 = math.abs(v26)
                local v28 = p23.Y
                for _ = 1, v27 + math.abs(v28) do
                    v_u_20(v_u_16[p24])
                end
            end
        end
    else
        return
    end
end)
v_u_1.controller.Changed:Connect(function()
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    if v_u_1.controller.Value and not v_u_2.Value then
        v_u_2.Value = script.Parent.boxes.boxFrame.Regular
    end
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.effects.boxes.boxes
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = script.Parent.Parent.Parent.Parent.Parent
local v_u_2 = game.ReplicatedStorage:WaitForChild("Configuration"):WaitForChild("Effects")
local v_u_3 = script.Parent.Parent.selected
if not game:GetService("PolicyService"):GetPolicyInfoForPlayerAsync(game.Players.LocalPlayer).ArePaidRandomItemsRestricted then
    local function v_u_5(p4)
        if p4:FindFirstChild("productId") then
            game:GetService("MarketplaceService"):PromptProductPurchase(game.Players.LocalPlayer, p4.productId.Value)
            _G.buyingBox = true
        else
            game.ReplicatedStorage.Remotes.Economy.openBox:InvokeServer(p4.Name)
        end
    end
    for _, v_u_6 in pairs(v_u_2:WaitForChild("Boxes"):GetChildren()) do
        local v_u_7 = script.template:Clone()
        v_u_7.Name = v_u_6.Name
        if v_u_6:FindFirstChild("productId") then
            local v_u_8 = v_u_6:WaitForChild("productId").Value
            spawn(function()
                -- upvalues: (copy) v_u_8, (copy) v_u_7
                local v9 = game:GetService("MarketplaceService"):GetProductInfo(v_u_8, Enum.InfoType.Product)
                v_u_7.price.Text = v9.PriceInRobux .. "R$"
                v_u_7.price.yxle.ImageTransparency = 1
            end)
            Instance.new("StringValue", v_u_7.price).Name = "COLORtext"
            v_u_7.price.TextColor3 = Color3.new(0, 1, 0)
            v_u_7.LayoutOrder = 1
        else
            v_u_7.price.Text = v_u_6:WaitForChild("boxPrice").Value
        end
        v_u_7.boxImage.Image = v_u_6.iconBox.Value
        v_u_7.boxImage.lid.Image = v_u_6.iconLid.Value
        v_u_7.buy.InputBegan:Connect(function(p10)
            -- upvalues: (copy) v_u_5, (copy) v_u_6
            if p10.UserInputType == Enum.UserInputType.MouseButton1 then
                v_u_5(v_u_6)
            end
        end)
        v_u_7.buy.TouchTap:Connect(function()
            -- upvalues: (copy) v_u_5, (copy) v_u_6
            v_u_5(v_u_6)
        end)
        v_u_1.controller.Changed:Connect(function()
            -- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_7
            local v11 = v_u_3.Value == v_u_1
            local v12 = v_u_7.price.box
            local v13
            if v11 then
                v13 = v_u_1.controller.Value
            else
                v13 = v11
            end
            v12.Visible = v13
            v_u_7.price.yxle.Visible = not (v11 and v_u_1.controller.Value)
        end)
        v_u_7.Parent = script.Parent.boxFrame
    end
    script.Parent.boxFrame.Regular.NextSelectionDown = script.Parent.boxFrame.Premium
    script.Parent.boxFrame.Premium.NextSelectionUp = script.Parent.boxFrame.Regular
    script.Parent.Parent.effects.NextSelectionUp = script.Parent.boxFrame.Premium
    game:GetService("MarketplaceService").PromptProductPurchaseFinished:Connect(function()
        _G.buyingBox = false
    end)
    local v_u_14 = nil
    v_u_3.Changed:Connect(function()
        -- upvalues: (ref) v_u_14, (copy) v_u_1, (copy) v_u_3
        if v_u_14 and v_u_14.Parent == script.Parent.boxFrame then
            v_u_14.price.box.Visible = not v_u_1.controller.Value
            v_u_14.price.yxle.Visible = v_u_1.controller.Value
        end
        if v_u_3.Value.Parent == script.Parent.boxFrame then
            v_u_3.Value.price.box.Visible = true
            v_u_3.Value.price.yxle.Visible = false
        end
        v_u_14 = v_u_3.Value
    end)
    game:GetService("UserInputService").InputBegan:Connect(function(p15)
        -- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_5, (copy) v_u_2
        local v16 = game:GetService("VRService")
        if v16:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v16:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
            return
        elseif v_u_1.open.Value and v_u_1.tab.Value == script.Parent.Parent then
            if p15.KeyCode == Enum.KeyCode.ButtonX and v_u_3.Value.Parent == script.Parent.boxFrame then
                v_u_5(v_u_2.Boxes:FindFirstChild(v_u_3.Value.Name))
            end
        end
    end)
end

--========================================
-- LocalScript : StarterGui.shop2.shop.items.effects.boxes.boxes.template.price.box.controllerIcon
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
-- LocalScript : StarterGui.shop2.shop.items.effects.boxes.boxes.template.Frame.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
if script.Parent.Parent.Name ~= "template" then
    local v1 = game.ReplicatedStorage:WaitForChild("Configuration")
    for _, v2 in pairs(script.Parent:GetChildren()) do
        if v2:IsA("Frame") then
            local v3 = v1.Effects.Boxes:FindFirstChild(script.Parent.Parent.Name).Weights:FindFirstChild(v2.Name)
            local v4 = v1.Effects.Rarities:FindFirstChild(v2.Name)
            v2.chance.Text = v3.Value .. "%"
            v2.Frame.BackgroundColor3 = v4.color.Value
        end
    end
end

--========================================
-- LocalScript : StarterGui.shop2.shop.items.effects.effects.effects
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.Library.Utility.stringListContains)
game:GetService("TweenService")
local v2 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local v_u_3 = v2:WaitForChild("effects")
local v_u_4 = v2:WaitForChild("activeeffects")
local v_u_5 = script.Parent.Parent.Parent.Parent.Parent
local v_u_6 = game.ReplicatedStorage.Configuration.Effects
local v_u_7 = script.Parent.Parent.selected
local v_u_8 = {
    ["Appearance"] = 0,
    ["Halo"] = 3,
    ["Glass Halo"] = 3,
    ["Obrens Inferno"] = "4a",
    ["Crown"] = "4b",
    ["Label"] = 5,
    ["Ears"] = "7i",
    ["Tail"] = "7j",
    ["Plastic Coil"] = "9d",
    ["Coil Hat"] = "9f",
    ["Coil Fusion"] = "AF",
    ["Coil Gravity"] = "AG",
    ["Coil Speed"] = "AS",
    ["Hook"] = "AU",
    ["Trowel"] = "AW",
    ["Hourglass"] = "AY",
    ["Radiance"] = "BC",
    ["Flames"] = "BF",
    ["Smoke"] = "BI",
    ["Pride Trail"] = "CE",
    ["Special Trail"] = "CI",
    ["Solid Trail"] = "E",
    ["Fading Trail"] = "F",
    ["Wave Trail"] = "H",
    ["TwoColor Trail"] = "J"
}
local function v_u_25(p_u_9)
    -- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_8
    for _, v10 in pairs(script.Parent:GetChildren()) do
        if v10:FindFirstChild("id") and v10.id.Value == p_u_9.Name then
            return
        end
    end
    local v11 = v_u_6.Rarities:FindFirstChild(p_u_9.rarity.Value)
    local v_u_12 = script.template:Clone()
    local v_u_13 = (p_u_9:FindFirstChild("group") or p_u_9.type).Value
    local v14 = Instance.new("StringValue")
    v14.Name = "id"
    v14.Value = p_u_9.Name
    v14.Parent = v_u_12
    v_u_12.info.nametext.Text = p_u_9.Name
    if p_u_9:FindFirstChild("customName") then
        v_u_12.info.nametext.Text = require(p_u_9.customName)()
    end
    if p_u_9:FindFirstChild("pic") then
        v_u_12.info.ImageLabel.Image = p_u_9.pic.Value
    end
    if p_u_9:FindFirstChild("customPic") then
        for _, v15 in pairs(require(p_u_9.customPic)()) do
            v15.Parent = v_u_12.info.ImageLabel
        end
    end
    if p_u_9:FindFirstChild("group") and p_u_9.group.Value == "Coil Fusion" then
        v_u_12.info.requirement.icon.Image = game.ReplicatedStorage.Assets.Gear:FindFirstChild("fusion").Configuration.pic.Value
    elseif p_u_9:FindFirstChild("group") and p_u_9.group.Value == "Coil Speed" then
        v_u_12.info.requirement.icon.Image = game.ReplicatedStorage.Assets.Gear:FindFirstChild("speed").Configuration.pic.Value
    elseif p_u_9:FindFirstChild("group") and p_u_9.group.Value == "Coil Gravity" then
        v_u_12.info.requirement.icon.Image = game.ReplicatedStorage.Assets.Gear:FindFirstChild("gravity").Configuration.pic.Value
    elseif p_u_9:FindFirstChild("group") and p_u_9.group.Value == "Hourglass" then
        v_u_12.info.requirement.icon.Image = game.ReplicatedStorage.Assets.Gear:FindFirstChild("hourglass").Configuration.pic.Value
    elseif p_u_9:FindFirstChild("group") and p_u_9.group.Value == "Trowel" then
        v_u_12.info.requirement.icon.Image = game.ReplicatedStorage.Assets.Gear:FindFirstChild("trowel").Configuration.pic.Value
    elseif p_u_9.type.Value == "Trail Tip" then
        v_u_12.info.requirement.Position = UDim2.new(0.1, 0, 0.85, -16)
        v_u_12.info.requirement.AnchorPoint = Vector2.new(0, 1)
        for _, v16 in pairs(require(game.ReplicatedStorage.Assets.Effects.Trail.customPic)()) do
            v16.Parent = v_u_12.info.requirement.icon
        end
    else
        v_u_12.info.requirement.Visible = false
    end
    v_u_12.info.owned.Changed:Connect(function()
        -- upvalues: (ref) v_u_5, (copy) v_u_12, (ref) v_u_8, (copy) v_u_13, (copy) p_u_9, (ref) v_u_6
        v_u_5.Parent:WaitForChild("uiStyle"):WaitForChild("TextColor")
        v_u_5.Parent.uiStyle:WaitForChild("DisabledTextColor")
        v_u_12.Name = (v_u_12.info.owned.Value and "!" or "") .. (v_u_8[v_u_13] or v_u_13) .. "/" .. p_u_9.Name
        if v_u_12.info.owned.Value then
            v_u_12.LayoutOrder = v_u_12.LayoutOrder - 1000000000
            v_u_12.info.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
            for _, v17 in pairs(v_u_12.info.ImageLabel:GetChildren()) do
                if v17:IsA("ImageLabel") then
                    v17.ImageColor3 = v17.BackgroundColor3
                elseif v17:IsA("TextLabel") then
                    v17.TextColor3 = v17.BackgroundColor3
                end
            end
            v_u_12.info.nametext.TextColor3 = v_u_5.Parent.uiStyle.TextColor.Value
            v_u_12.info.nametext.COLORtext.Value = "TextColor"
            v_u_12.info.Frame.BackgroundColor3 = v_u_12.info.Frame.BorderColor3
            v_u_12.info.requirement.icon.ImageColor3 = Color3.new(1, 1, 1)
            v_u_12.info.requirement.TextLabel.TextColor3 = v_u_5.Parent.uiStyle.TextColor.Value
            v_u_12.info.requirement.TextLabel.COLORtext.Value = "TextColor"
            for _, v18 in pairs(v_u_12.info.requirement.icon:GetChildren()) do
                if v18:IsA("ImageLabel") then
                    v18.ImageColor3 = v18.BackgroundColor3
                elseif v18:IsA("TextLabel") then
                    v18.TextColor3 = v18.BackgroundColor3
                end
            end
        else
            v_u_12.LayoutOrder = v_u_12.LayoutOrder + 1000000000
            v_u_12.info.ImageLabel.ImageColor3 = Color3.new(0.2, 0.2, 0.2)
            for _, v19 in pairs(v_u_12.info.ImageLabel:GetChildren()) do
                if v19:IsA("ImageLabel") then
                    v19.ImageColor3 = Color3.new(v19.BackgroundColor3.R * 0.2, v19.BackgroundColor3.G * 0.2, v19.BackgroundColor3.B * 0.2)
                elseif v19:IsA("TextLabel") then
                    v19.TextColor3 = Color3.new(v19.BackgroundColor3.R * 0.2, v19.BackgroundColor3.G * 0.2, v19.BackgroundColor3.B * 0.2)
                end
            end
            v_u_12.info.nametext.TextColor3 = v_u_5.Parent.uiStyle.DisabledTextColor.Value
            v_u_12.info.nametext.COLORtext.Value = "DisabledTextColor"
            v_u_12.info.Frame.BackgroundColor3 = Color3.new(v_u_12.info.Frame.BorderColor3.R * 0.6, v_u_12.info.Frame.BorderColor3.G * 0.6, v_u_12.info.Frame.BorderColor3.B * 0.6)
            v_u_12.info.requirement.icon.ImageColor3 = Color3.new(0.2, 0.2, 0.2)
            v_u_12.info.requirement.TextLabel.TextColor3 = v_u_5.Parent.uiStyle.DisabledTextColor.Value
            v_u_12.info.requirement.TextLabel.COLORtext.Value = "DisabledTextColor"
            for _, v20 in pairs(v_u_12.info.requirement.icon:GetChildren()) do
                if v20:IsA("ImageLabel") then
                    v20.ImageColor3 = Color3.new(v20.BackgroundColor3.R * 0.2, v20.BackgroundColor3.G * 0.2, v20.BackgroundColor3.B * 0.2)
                elseif v20:IsA("TextLabel") then
                    v20.TextColor3 = Color3.new(v20.BackgroundColor3.R * 0.2, v20.BackgroundColor3.G * 0.2, v20.BackgroundColor3.B * 0.2)
                end
            end
        end
        for _, v21 in pairs(v_u_6.Boxes:GetChildren()) do
            if v_u_12.info.boxes:FindFirstChild(v21.Name) then
                local v22 = v_u_12.info.boxes:FindFirstChild(v21.Name)
                local v23 = not v_u_12.info.owned.Value
                if v23 then
                    v23 = require(v21.filter)(p_u_9)
                end
                v22.Visible = v23
            end
        end
    end)
    v_u_12.info.Frame.BorderColor3 = v11:FindFirstChild("color") and v11.color.Value or Color3.new(1, 1, 1)
    v_u_12.info.owned.Value = false
    v_u_12.Parent = script.Parent
    v_u_12.InputBegan:Connect(function(p24)
        -- upvalues: (copy) p_u_9
        if p24.UserInputType == Enum.UserInputType.MouseButton1 then
            game.ReplicatedStorage.Remotes.Cosmetics.activateEffect:InvokeServer(p_u_9.Name)
        end
    end)
    v_u_12.TouchTap:Connect(function()
        -- upvalues: (copy) p_u_9
        game.ReplicatedStorage.Remotes.Cosmetics.activateEffect:InvokeServer(p_u_9.Name)
    end)
    return v_u_12
end
local v_u_26 = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
local function v36()
    -- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_4, (copy) v_u_25, (copy) v_u_26
    for _, v27 in pairs(game.ReplicatedStorage.Assets.Effects:GetChildren()) do
        local v28 = v_u_1(v_u_3.Value, v27.Name)
        local v29 = v_u_1(v_u_4.Value, v27.Name)
        local v30 = nil
        for _, v31 in pairs(script.Parent:GetChildren()) do
            if v31:FindFirstChild("id") and v31.id.Value == v27.Name then
                v30 = v31
                break
            end
        end
        if v27:WaitForChild("rarity").Value < 9 or v28 then
            local v32 = v30 or v_u_25(v27)
            v32.info.equipped.Visible = v29
            v32.info.owned.Value = v28
        elseif v30 then
            v30:Destroy()
        end
    end
    v_u_26(script.Parent)
    local v33 = (1 / 0)
    local v34 = nil
    for _, v35 in pairs(script.Parent:GetChildren()) do
        if v35:IsA("TextButton") and (not v35.NextSelectionUp and v35.AbsolutePosition.X < v33) then
            v33 = v35.AbsolutePosition.X
            v34 = v35
        end
    end
    script.Parent.Parent.boxes.NextSelectionDown = v34
end
v36()
v_u_3.Changed:Connect(v36)
v_u_4.Changed:Connect(v36)
game.ReplicatedStorage.Assets.Effects.ChildAdded:Connect(v36)
local v_u_37 = nil
v_u_7.Changed:Connect(function()
    -- upvalues: (ref) v_u_37, (copy) v_u_7
    if v_u_37 and v_u_37.Parent == script.Parent then
        v_u_37.info.xbox.Visible = false
    end
    if v_u_7.Value.Parent == script.Parent then
        v_u_7.Value.info.xbox.Visible = v_u_7.Value.info.owned.Value
    end
    v_u_37 = v_u_7.Value
end)
game:GetService("UserInputService").InputBegan:Connect(function(p38)
    -- upvalues: (copy) v_u_5, (copy) v_u_7
    local v39 = game:GetService("VRService")
    if v39:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v39:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
        return
    elseif v_u_5.open.Value and v_u_5.tab.Value == script.Parent.Parent then
        if p38.KeyCode == Enum.KeyCode.ButtonX and v_u_7.Value.Parent == script.Parent then
            game.ReplicatedStorage.Remotes.Cosmetics.activateEffect:InvokeServer(v_u_7.Value.id.Value)
        end
    end
end)

--========================================
-- LocalScript : StarterGui.shop2.shop.items.effects.effects.effects.template.info.xbox.controllerIcon
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
-- LocalScript : StarterGui.shop2.shop.xboxLeftTab.controllerIcon
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
-- LocalScript : StarterGui.shop2.shop.xboxRightTab.controllerIcon
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
-- LocalScript : StarterGui.shop2.UIScale.scale
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
function update()
    local v1 = Vector2.new(0.3, 0.65)
    local v2 = script.Parent.Parent.AbsoluteSize
    local v3 = Vector2.new(script.Parent.Parent.shop.Size.X.Offset, script.Parent.Parent.shop.Size.Y.Offset)
    local v4 = v2 * v1 / v3
    local v5 = v4.X
    local v6 = v4.Y
    local v7 = math.min(v5, v6) / 0.25
    local v8 = math.floor(v7)
    print("Set scale to ", v8)
    if v8 < 3 then
        v8 = v8 + 1
    end
    local v9 = v8 * 0.25
    script.Parent.Scale = math.max(v9, 0.25)
end
script.Parent.Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
update()

--========================================
-- LocalScript : StarterGui.shop_coins.style
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
v_u_1.update.Event:Connect(function()
    -- upvalues: (copy) v_u_3
    for _, v4 in pairs(script.Parent:GetDescendants()) do
        v_u_3(v4)
    end
end)
script.Parent.DescendantAdded:Connect(v_u_3)
for _, v5 in pairs(script.Parent:GetDescendants()) do
    v_u_3(v5)
end

--========================================
-- LocalScript : StarterGui.shop_coins.ControllerScript
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
-- LocalScript : StarterGui.shop_coins.CloseScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game:GetService("TweenService")
game:GetService("UserInputService")
function toggle(p1)
    if p1 == nil then
        p1 = not script.Parent.open.Value
    end
    script.Parent.open.Value = p1
end
script.Parent.open.Changed:Connect(function()
    script.Parent.Enabled = script.Parent.open.Value
end)
script.Parent.shop.close.MouseButton1Click:connect(function(_)
    toggle(false)
end)
script.Parent.shop.close.TouchTap:Connect(function()
    toggle(false)
end)
game:GetService("ContextActionService"):BindActionAtPriority("open_" .. script.Parent.Name, function(_, p2, _)
    if not script.Parent.open.Value then
        return Enum.ContextActionResult.Pass
    end
    if p2 == Enum.UserInputState.End then
        toggle(false)
    end
    return Enum.ContextActionResult.Sink
end, false, 35000, Enum.KeyCode.ButtonSelect)

--========================================
-- LocalScript : StarterGui.shop_coins.shop.shop.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("GuiService")
local v2 = game:GetService("UserInputService")
v1.AutoSelectGuiEnabled = false
local function v_u_5()
    local v3 = nil
    for _, v4 in pairs(script.Parent:GetDescendants()) do
        if v4.Name == "selectable" and (not v4:FindFirstAncestorWhichIsA("LuaSourceContainer") and (not v3 or (v3.AbsolutePosition.Y > v4.Parent.AbsolutePosition.Y or v3.AbsolutePosition.Y == v4.Parent.AbsolutePosition.Y and v3.AbsolutePosition.X > v4.Parent.AbsolutePosition.X))) then
            v3 = v4.Parent
        end
    end
    script.Parent.selected.Value = v3
end
local function v_u_6()
    game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.35), {
        ["CanvasPosition"] = Vector2.new(0, script.Parent.CanvasPosition.Y + script.Parent.selected.Value.AbsolutePosition.Y + script.Parent.selected.Value.AbsoluteSize.Y / 2 - script.Parent.AbsolutePosition.Y - script.Parent.AbsoluteSize.Y / 2)
    }):Play()
end
function selectUp()
    -- upvalues: (copy) v_u_6
    if script.Parent.selected.Value.NextSelectionUp then
        script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionUp
    else
        local v7 = script.Parent.selected.Value
        local v8 = v7.Parent.NextSelectionUp
        if v8 then
            local v9 = v7.AbsolutePosition.X
            local v10 = v9 + v7.AbsoluteSize.X
            local v11 = nil
            for _, v12 in pairs(v8:GetChildren()) do
                if v12:IsA("GuiBase") then
                    local v13 = v12.AbsolutePosition.X
                    if v9 < v13 + v12.AbsoluteSize.X and (v13 < v10 and (not v11 or v11.AbsolutePosition.Y < v12.AbsolutePosition.Y)) then
                        v11 = v12
                    end
                end
            end
            if v11 then
                script.Parent.selected.Value = v11
            end
        end
    end
    v_u_6()
end
function selectDown()
    -- upvalues: (copy) v_u_6
    if script.Parent.selected.Value.NextSelectionDown then
        script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionDown
    else
        local v14 = script.Parent.selected.Value
        local v15 = v14.Parent.NextSelectionDown
        if v15 then
            local v16 = v14.AbsolutePosition.X
            local v17 = v16 + v14.AbsoluteSize.X
            local v18 = nil
            for _, v19 in pairs(v15:GetChildren()) do
                if v19:IsA("GuiBase") then
                    local v20 = v19.AbsolutePosition.X
                    if v16 < v20 + v19.AbsoluteSize.X and (v20 < v17 and (not v18 or v18.AbsolutePosition.Y > v19.AbsolutePosition.Y)) then
                        v18 = v19
                    end
                end
            end
            if v18 then
                script.Parent.selected.Value = v18
            end
        end
    end
    v_u_6()
end
v2.InputBegan:Connect(function(p21)
    -- upvalues: (copy) v_u_5
    if script:FindFirstAncestorOfClass("ScreenGui").open.Value and (not script:FindFirstAncestorOfClass("ScreenGui"):FindFirstChild("tab") or script:FindFirstAncestorOfClass("ScreenGui").tab.Value == script.Parent) then
        local v22 = game:GetService("VRService")
        if v22:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v22:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
            return
        elseif p21.UserInputType.Value >= 12 and (p21.UserInputType.Value <= 19 and not script.Parent.selected.Value) then
            v_u_5()
            return
        elseif p21.KeyCode == Enum.KeyCode.DPadDown then
            selectDown()
            return
        elseif p21.KeyCode == Enum.KeyCode.DPadUp then
            selectUp()
        elseif p21.KeyCode == Enum.KeyCode.DPadLeft then
            if script.Parent.selected.Value.NextSelectionLeft then
                script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft
                return
            end
        elseif p21.KeyCode == Enum.KeyCode.DPadRight and script.Parent.selected.Value.NextSelectionRight then
            script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight
        end
    else
        return
    end
end)
require(game.ReplicatedStorage.Library.Utility.thumbScroller2D)(Enum.KeyCode.Thumbstick1, function(p23, p24)
    -- upvalues: (copy) v_u_5
    if script.Parent.selected.Value then
        local v25 = p23.X
        for _ = 1, math.abs(v25) do
            if p24.X == -1 then
                if script.Parent.selected.Value.NextSelectionLeft then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft
                end
            elseif script.Parent.selected.Value.NextSelectionRight then
                script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight
            end
        end
        local v26 = p23.Y
        for _ = 1, math.abs(v26) do
            if p24.Y == -1 then
                selectDown()
            else
                selectUp()
            end
        end
    else
        v_u_5()
    end
end)

--========================================
-- LocalScript : StarterGui.shop_coins.shop.shop.items.coins
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = script:FindFirstAncestorOfClass("ScreenGui")
function isOpen()
    local v3 = script
    while not v3:FindFirstChild("open") do
        v3 = v3.Parent
    end
    return v3.open.Value
end
local function v_u_5(p4)
    if p4:FindFirstChild("productId") then
        game.ReplicatedStorage.Remotes.Economy.buyDeveloperProduct:InvokeServer(p4.productId.Value)
    else
        game.ReplicatedStorage.Remotes.Economy.buyGamepass:InvokeServer(p4.gamepassId.Value)
    end
end
for _, v_u_6 in pairs(script.Parent:GetChildren()) do
    if v_u_6:IsA("GuiBase") then
        v_u_6.InputBegan:Connect(function(p7)
            -- upvalues: (copy) v_u_6, (copy) v_u_5
            if p7.UserInputType == Enum.UserInputType.MouseMovement then
                script.Parent.Parent.selected.Value = v_u_6
            elseif p7.UserInputType == Enum.UserInputType.MouseButton1 then
                v_u_5(v_u_6)
            end
        end)
        v_u_6.InputEnded:Connect(function(p8)
            -- upvalues: (copy) v_u_6
            if p8.UserInputType == Enum.UserInputType.MouseMovement and script.Parent.Parent.selected.Value == v_u_6 then
                script.Parent.Parent.selected.Value = nil
            end
        end)
        v_u_6.TouchTap:Connect(function()
            -- upvalues: (copy) v_u_6, (copy) v_u_5
            if v_u_6:FindFirstChild("info") then
                local v9 = v_u_6.info.Position.Y.Scale * 100 + 0.5
                if math.floor(v9) ~= -55 then
                    script.Parent.Parent.selected.Value = v_u_6
                    return
                end
            end
            v_u_5(v_u_6)
        end)
        spawn(function()
            -- upvalues: (copy) v_u_6
            local v10 = v_u_6:FindFirstChild("productId")
            local v11 = (v_u_6:FindFirstChild("info") or v_u_6).price
            if v10 then
                v11.Text = game:GetService("MarketplaceService"):GetProductInfo(v_u_6.productId.Value, Enum.InfoType.Product).PriceInRobux .. " R$"
            else
                v11.Text = game:GetService("MarketplaceService"):GetProductInfo(v_u_6.gamepassId.Value, Enum.InfoType.GamePass).PriceInRobux .. " R$"
            end
        end)
    end
end
game:GetService("UserInputService").InputBegan:Connect(function(p12)
    -- upvalues: (copy) v_u_5
    local v13 = script.Parent.Parent.selected.Value
    if p12.KeyCode == Enum.KeyCode.ButtonX and (v13 and (v13.Parent == script.Parent and isOpen())) then
        v_u_5(script.Parent.Parent.selected.Value)
    end
end)
script.Parent.Parent.selected.Changed:Connect(function()
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v14 = script.Parent.Parent.selected.Value
    for _, v15 in pairs(script.Parent:GetChildren()) do
        if v15 ~= v14 and v15:IsA("GuiBase") then
            if v15:FindFirstChild("info") then
                v_u_1:Create(v15.info, TweenInfo.new(0.5), {
                    ["Position"] = UDim2.new(0, 0, 0, 0)
                }):Play()
                v15.info.xbox.Visible = false
            else
                v15.yxles.yxle.Visible = true
                v15.yxles.box.Visible = false
            end
        end
    end
    if v14 and v14.Parent == script.Parent then
        if v14:FindFirstChild("info") then
            v_u_1:Create(v14.info, TweenInfo.new(0.5), {
                ["Position"] = UDim2.new(0, 0, -0.55, 0)
            }):Play()
            v14.info.xbox.Visible = v_u_2.controller.Value
            return
        end
        local v16 = v_u_2.controller.Value
        v14.yxles.yxle.Visible = not v16
        v14.yxles.box.Visible = v16
    end
end)
local v_u_17 = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
local function v18()
    -- upvalues: (copy) v_u_17
    v_u_17(script.Parent)
end
script.Parent.DescendantAdded:Connect(v18)
script.Parent.DescendantRemoving:Connect(v18)
v_u_17(script.Parent)

--========================================
-- LocalScript : StarterGui.shop_coins.shop.yxle.update
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
-- LocalScript : StarterGui.shop_coins.UIScale.scale
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
function update()
    local v1 = Vector2.new(0.3, 0.65)
    local v2 = script.Parent.Parent.AbsoluteSize
    local v3 = Vector2.new(script.Parent.Parent.shop.Size.X.Offset, script.Parent.Parent.shop.Size.Y.Offset)
    local v4 = v2 * v1 / v3
    local v5 = v4.X
    local v6 = v4.Y
    local v7 = math.min(v5, v6) / 0.25
    local v8 = math.floor(v7)
    print("Set scale to ", v8)
    if v8 < 3 then
        v8 = v8 + 1
    end
    local v9 = v8 * 0.25
    script.Parent.Scale = math.max(v9, 0.25)
end
script.Parent.Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
update()

--========================================
-- LocalScript : StarterGui.shop_gears.style
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
v_u_1.update.Event:Connect(function()
    -- upvalues: (copy) v_u_3
    for _, v4 in pairs(script.Parent:GetDescendants()) do
        v_u_3(v4)
    end
end)
script.Parent.DescendantAdded:Connect(v_u_3)
for _, v5 in pairs(script.Parent:GetDescendants()) do
    v_u_3(v5)
end

--========================================
-- LocalScript : StarterGui.shop_gears.ControllerScript
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
-- LocalScript : StarterGui.shop_gears.CloseScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game:GetService("TweenService")
game:GetService("UserInputService")
function toggle(p1)
    if p1 == nil then
        p1 = not script.Parent.open.Value
    end
    script.Parent.open.Value = p1
end
script.Parent.open.Changed:Connect(function()
    script.Parent.Enabled = script.Parent.open.Value
end)
script.Parent.shop.close.MouseButton1Click:connect(function(_)
    toggle(false)
end)
script.Parent.shop.close.TouchTap:Connect(function()
    toggle(false)
end)
game:GetService("ContextActionService"):BindActionAtPriority("open_" .. script.Parent.Name, function(_, p2, _)
    if not script.Parent.open.Value then
        return Enum.ContextActionResult.Pass
    end
    if p2 == Enum.UserInputState.End then
        toggle(false)
    end
    return Enum.ContextActionResult.Sink
end, false, 35000, Enum.KeyCode.ButtonSelect)

--========================================
-- LocalScript : StarterGui.shop_gears.shop.shop.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("GuiService")
local v2 = game:GetService("UserInputService")
v1.AutoSelectGuiEnabled = false
local function v_u_5()
    local v3 = nil
    for _, v4 in pairs(script.Parent:GetDescendants()) do
        if v4.Name == "selectable" and (not v4:FindFirstAncestorWhichIsA("LuaSourceContainer") and (not v3 or (v3.AbsolutePosition.Y > v4.Parent.AbsolutePosition.Y or v3.AbsolutePosition.Y == v4.Parent.AbsolutePosition.Y and v3.AbsolutePosition.X > v4.Parent.AbsolutePosition.X))) then
            v3 = v4.Parent
        end
    end
    script.Parent.selected.Value = v3
end
local function v_u_6()
    game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.35), {
        ["CanvasPosition"] = Vector2.new(0, script.Parent.CanvasPosition.Y + script.Parent.selected.Value.AbsolutePosition.Y + script.Parent.selected.Value.AbsoluteSize.Y / 2 - script.Parent.AbsolutePosition.Y - script.Parent.AbsoluteSize.Y / 2)
    }):Play()
end
function selectUp()
    -- upvalues: (copy) v_u_6
    if script.Parent.selected.Value.NextSelectionUp then
        script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionUp
    else
        local v7 = script.Parent.selected.Value
        local v8 = v7.Parent.NextSelectionUp
        if v8 then
            local v9 = v7.AbsolutePosition.X
            local v10 = v9 + v7.AbsoluteSize.X
            local v11 = nil
            for _, v12 in pairs(v8:GetChildren()) do
                if v12:IsA("GuiBase") then
                    local v13 = v12.AbsolutePosition.X
                    if v9 < v13 + v12.AbsoluteSize.X and (v13 < v10 and (not v11 or v11.AbsolutePosition.Y < v12.AbsolutePosition.Y)) then
                        v11 = v12
                    end
                end
            end
            if v11 then
                script.Parent.selected.Value = v11
            end
        end
    end
    v_u_6()
end
function selectDown()
    -- upvalues: (copy) v_u_6
    if script.Parent.selected.Value.NextSelectionDown then
        script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionDown
    else
        local v14 = script.Parent.selected.Value
        local v15 = v14.Parent.NextSelectionDown
        if v15 then
            local v16 = v14.AbsolutePosition.X
            local v17 = v16 + v14.AbsoluteSize.X
            local v18 = nil
            for _, v19 in pairs(v15:GetChildren()) do
                if v19:IsA("GuiBase") then
                    local v20 = v19.AbsolutePosition.X
                    if v16 < v20 + v19.AbsoluteSize.X and (v20 < v17 and (not v18 or v18.AbsolutePosition.Y > v19.AbsolutePosition.Y)) then
                        v18 = v19
                    end
                end
            end
            if v18 then
                script.Parent.selected.Value = v18
            end
        end
    end
    v_u_6()
end
v2.InputBegan:Connect(function(p21)
    -- upvalues: (copy) v_u_5
    if script:FindFirstAncestorOfClass("ScreenGui").open.Value and (not script:FindFirstAncestorOfClass("ScreenGui"):FindFirstChild("tab") or script:FindFirstAncestorOfClass("ScreenGui").tab.Value == script.Parent) then
        local v22 = game:GetService("VRService")
        if v22:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v22:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
            return
        elseif p21.UserInputType.Value >= 12 and (p21.UserInputType.Value <= 19 and not script.Parent.selected.Value) then
            v_u_5()
            return
        elseif p21.KeyCode == Enum.KeyCode.DPadDown then
            selectDown()
            return
        elseif p21.KeyCode == Enum.KeyCode.DPadUp then
            selectUp()
        elseif p21.KeyCode == Enum.KeyCode.DPadLeft then
            if script.Parent.selected.Value.NextSelectionLeft then
                script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft
                return
            end
        elseif p21.KeyCode == Enum.KeyCode.DPadRight and script.Parent.selected.Value.NextSelectionRight then
            script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight
        end
    else
        return
    end
end)
require(game.ReplicatedStorage.Library.Utility.thumbScroller2D)(Enum.KeyCode.Thumbstick1, function(p23, p24)
    -- upvalues: (copy) v_u_5
    if script.Parent.selected.Value then
        local v25 = p23.X
        for _ = 1, math.abs(v25) do
            if p24.X == -1 then
                if script.Parent.selected.Value.NextSelectionLeft then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft
                end
            elseif script.Parent.selected.Value.NextSelectionRight then
                script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight
            end
        end
        local v26 = p23.Y
        for _ = 1, math.abs(v26) do
            if p24.Y == -1 then
                selectDown()
            else
                selectUp()
            end
        end
    else
        v_u_5()
    end
end)

--========================================
-- LocalScript : StarterGui.shop_gears.shop.shop.items.ShopItemsScript
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
function isOpen()
    local v4 = script
    while not v4:FindFirstChild("open") do
        v4 = v4.Parent
    end
    return v4.open.Value
end
for _, v5 in pairs(v3:GetChildren()) do
    if not v5.Configuration.hidden.Value then
        if v5.Configuration:FindFirstChild("price") then
            local v6 = script.template:Clone()
            v6.Name = v5.Name
            v6.method.Value = "regular"
            v6.item.Value = v5
            v6.Parent = script.Parent
        end
        if v5.Configuration:FindFirstChild("productId") then
            local v7 = script.template:Clone()
            v7.Name = v5.Name
            v7.method.Value = "product"
            v7.item.Value = v5
            v7.Parent = script.Parent
        end
        if v5.Configuration:FindFirstChild("subscriptionPrice") then
            local v8 = script.template:Clone()
            v8.Name = v5.Name
            v8.method.Value = "subscribed"
            v8.item.Value = v5
            v8.Parent = script.Parent
        end
    end
end
game:GetService("UserInputService").InputBegan:Connect(function(p9)
    local v10 = script.Parent.Parent.selected.Value
    if p9.KeyCode == Enum.KeyCode.ButtonX and (v10 and (v10.Parent == script.Parent and isOpen())) then
        v10.buy:Invoke()
    end
end)
script.Parent.Parent.selected.Changed:Connect(function()
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v11 = script.Parent.Parent.selected.Value
    for _, v12 in pairs(script.Parent:GetChildren()) do
        if v12 ~= v11 and v12:IsA("GuiBase") then
            v_u_1:Create(v12.info, TweenInfo.new(0.5), {
                ["Position"] = UDim2.new(0, 0, 0, 0)
            }):Play()
            v12.info.xbox.Visible = false
        end
    end
    if v11 and v11.Parent == script.Parent then
        v_u_1:Create(v11.info, TweenInfo.new(0.5), {
            ["Position"] = UDim2.new(0, 0, -0.55, 0)
        }):Play()
        v11.info.xbox.Visible = v_u_2.controller.Value
    end
end)
local v_u_13 = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
local function v14()
    -- upvalues: (copy) v_u_13
    v_u_13(script.Parent)
end
script.Parent.DescendantAdded:Connect(v14)
script.Parent.DescendantRemoving:Connect(v14)
v_u_13(script.Parent)

--========================================
-- LocalScript : StarterGui.shop_gears.shop.shop.items.ShopItemsScript.template.ShopItemScript
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
local function v_u_13()
    local v6 = script.Parent.item.Value
    local v7 = script.Parent.method.Value
    local v8 = script.Parent.sale.Value
    local v9 = v8 and "sale" or v7
    local v10 = nil
    if v6.Parent == game.ReplicatedStorage.Assets.Gear then
        v10 = "gear"
    elseif v6.Parent == game.ReplicatedStorage.Mutators then
        v10 = "mutator"
    else
        error("Unknown item kind")
    end
    local v11 = game.ReplicatedStorage.Remotes.Economy.buyShopItem
    local v12 = {
        ["kind"] = v10,
        ["item"] = v6.Name,
        ["method"] = v9
    }
    if v8 then
        v8 = v8.Name
    end
    v12.sale = v8
    v12.source = "physical-shop"
    v11:InvokeServer(v12)
end
script.Parent.buy.OnInvoke = v_u_13
local function v_u_27()
    -- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
    if script.Parent.item.Value then
        local v14 = script.Parent.item.Value
        local v15 = script.Parent.method.Value
        local v16 = script.Parent.sale.Value
        local v17 = nil
        if v14.Parent == game.ReplicatedStorage.Assets.Gear then
            v17 = "gear"
        elseif v14.Parent == game.ReplicatedStorage.Mutators then
            v17 = "mutator"
        else
            error("Unknown item kind")
        end
        local v18 = workspace:WaitForChild("tower"):WaitForChild("sectionCount").Value - 2
        local v19 = game.ReplicatedStorage.Configuration.maxTowerLength.Value
        local v20 = math.min(v18, v19)
        local v21 = v14.Configuration:FindFirstChild("price") or v_u_3.subscription.Value > os.time()
        if v15 == "product" then
            v_u_2.Visible = not v21
        elseif v15 == "subscribed" then
            local v22 = v14.Configuration.subscriptionPrice:IsA("ModuleScript") and require(v14.Configuration.subscriptionPrice)(v20) or v14.Configuration.subscriptionPrice.Value
            v_u_2.info.yxles.Text = v22
            if v21 then
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
            local v23 = v_u_3:WaitForChild("prices"):WaitForChild(v17):WaitForChild(v14.Name).Value
            local v24
            if v16 then
                local v25 = v16.factor.Value * v23
                v24 = math.round(v25)
            else
                v24 = v23
                v23 = nil
            end
            v_u_2.info.yxles.Text = v24
            if v23 then
                v_u_2.info.regularyxles.Text = v23
            end
        end
        if v_u_2.info.yxles:FindFirstChild("yxle") then
            local v26 = v_u_2.info.yxles.Text
            if v21 and tonumber(v26) <= v_u_4.Value then
                v_u_2.info.yxles.TextColor3 = v_u_1.TextColor.Value
                v_u_2.info.yxles.COLORtext.Value = "TextColor"
                return
            end
            v_u_2.info.yxles.TextColor3 = v_u_1.DisabledTextColor.Value
            v_u_2.info.yxles.COLORtext.Value = "DisabledTextColor"
        end
    end
end
local function v31()
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_27
    if script.Parent.item.Value then
        local v_u_28 = script.Parent.item.Value
        local v29 = script.Parent.method.Value
        local v30 = nil
        if v_u_28.Parent == game.ReplicatedStorage.Assets.Gear then
            v30 = "gear"
        elseif v_u_28.Parent == game.ReplicatedStorage.Mutators then
            v30 = "mutator"
        else
            error("Unknown item kind")
        end
        v_u_2.info.nametext.Text = v_u_28.Configuration.itemName.Value
        v_u_2.info.ImageLabel.Image = v_u_28.Configuration.pic.Value
        v_u_2.info.desc.Text = v_u_28.Configuration.desc.Value
        v_u_2.LayoutOrder = v_u_28.Configuration.layoutOrder.Value
        if v29 == "subscribed" then
            v_u_2.LayoutOrder = v_u_2.LayoutOrder + 10000
        elseif v29 == "product" then
            v_u_2.LayoutOrder = v_u_2.LayoutOrder + 20000
            v_u_2.info.unsubscribedText.Visible = false
            v_u_2.info.yxles.yxle:Destroy()
            v_u_2.info.yxles.Size = UDim2.new(UDim.new(1, 0), v_u_2.info.yxles.Size.Y)
            v_u_2.info.yxles.TextColor3 = Color3.new(0, 1, 0)
            spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_28
                v_u_2.info.yxles.Text = game:GetService("MarketplaceService"):GetProductInfo(v_u_28.Configuration.productId.Value, Enum.InfoType.Product).PriceInRobux .. " R$"
            end)
        else
            v_u_2.info.unsubscribedText.Visible = false
            v_u_3:WaitForChild("prices"):WaitForChild(v30):WaitForChild(v_u_28.Name).Changed:Connect(v_u_27)
        end
        v_u_27()
    end
end
v_u_2.InputBegan:Connect(function(p32)
    -- upvalues: (ref) v_u_5, (copy) v_u_2, (copy) v_u_13
    if p32.UserInputType == Enum.UserInputType.MouseMovement then
        v_u_5.Value = v_u_2
    elseif p32.UserInputType == Enum.UserInputType.MouseButton1 then
        v_u_13()
    end
end)
v_u_2.InputEnded:Connect(function(p33)
    -- upvalues: (ref) v_u_5, (copy) v_u_2
    if p33.UserInputType == Enum.UserInputType.MouseMovement and v_u_5.Value == v_u_2 then
        v_u_5.Value = nil
    end
end)
v_u_2.TouchTap:Connect(function()
    -- upvalues: (copy) v_u_2, (ref) v_u_5, (copy) v_u_13
    local v34 = v_u_2.info.Position.Y.Scale * 100 + 0.5
    if math.floor(v34) == -55 then
        v_u_13()
    else
        v_u_5.Value = v_u_2
    end
end)
script.Parent.item.Changed:Connect(v31)
script.Parent.sale.Changed:Connect(v31)
v_u_4.Changed:Connect(function()
    -- upvalues: (copy) v_u_27
    v_u_27()
end)
workspace.ChildAdded:Connect(function(p35)
    -- upvalues: (copy) v_u_27
    if p35.Name == "tower" then
        p35:WaitForChild("sectionCount")
        v_u_27()
    end
end)
local v_u_36 = v_u_3.subscription.Value > os.time()
game:GetService("RunService").RenderStepped:Connect(function()
    -- upvalues: (ref) v_u_36, (copy) v_u_3, (copy) v_u_27
    if v_u_36 ~= (v_u_3.subscription.Value > os.time()) then
        v_u_27()
        v_u_36 = v_u_3.subscription.Value > os.time()
    end
end)
v31()

--========================================
-- LocalScript : StarterGui.shop_gears.shop.shop.sale.sale.ShopItemScript
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
local function v_u_13()
    local v6 = script.Parent.item.Value
    local v7 = script.Parent.method.Value
    local v8 = script.Parent.sale.Value
    local v9 = v8 and "sale" or v7
    local v10 = nil
    if v6.Parent == game.ReplicatedStorage.Assets.Gear then
        v10 = "gear"
    elseif v6.Parent == game.ReplicatedStorage.Mutators then
        v10 = "mutator"
    else
        error("Unknown item kind")
    end
    local v11 = game.ReplicatedStorage.Remotes.Economy.buyShopItem
    local v12 = {
        ["kind"] = v10,
        ["item"] = v6.Name,
        ["method"] = v9
    }
    if v8 then
        v8 = v8.Name
    end
    v12.sale = v8
    v12.source = "physical-shop"
    v11:InvokeServer(v12)
end
script.Parent.buy.OnInvoke = v_u_13
local function v_u_27()
    -- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
    if script.Parent.item.Value then
        local v14 = script.Parent.item.Value
        local v15 = script.Parent.method.Value
        local v16 = script.Parent.sale.Value
        local v17 = nil
        if v14.Parent == game.ReplicatedStorage.Assets.Gear then
            v17 = "gear"
        elseif v14.Parent == game.ReplicatedStorage.Mutators then
            v17 = "mutator"
        else
            error("Unknown item kind")
        end
        local v18 = workspace:WaitForChild("tower"):WaitForChild("sectionCount").Value - 2
        local v19 = game.ReplicatedStorage.Configuration.maxTowerLength.Value
        local v20 = math.min(v18, v19)
        local v21 = v14:FindFirstChild("price") or v_u_3.subscription.Value > os.time()
        if v15 == "product" then
            v_u_2.Visible = not v21
        elseif v15 == "subscribed" then
            local v22 = v14.subscriptionPrice:IsA("ModuleScript") and require(v14.subscriptionPrice)(v20) or v14.subscriptionPrice.Value
            v_u_2.info.yxles.Text = v22
            if v21 then
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
            local v23 = v_u_3:WaitForChild("prices"):WaitForChild(v17):WaitForChild(v14.Name).Value
            local v24
            if v16 then
                local v25 = v16.factor.Value * v23
                v24 = math.round(v25)
            else
                v24 = v23
                v23 = nil
            end
            v_u_2.info.yxles.Text = v24
            if v23 then
                v_u_2.info.regularyxles.Text = v23
            end
        end
        if v_u_2.info.yxles:FindFirstChild("yxle") then
            local v26 = v_u_2.info.yxles.Text
            if v21 and tonumber(v26) <= v_u_4.Value then
                v_u_2.info.yxles.TextColor3 = v_u_1.TextColor.Value
                v_u_2.info.yxles.COLORtext.Value = "TextColor"
                return
            end
            v_u_2.info.yxles.TextColor3 = v_u_1.DisabledTextColor.Value
            v_u_2.info.yxles.COLORtext.Value = "DisabledTextColor"
        end
    end
end
local function v31()
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_27
    if script.Parent.item.Value then
        local v_u_28 = script.Parent.item.Value
        local v29 = script.Parent.method.Value
        local v30 = nil
        if v_u_28.Parent == game.ReplicatedStorage.Assets.Gear then
            v30 = "gear"
        elseif v_u_28.Parent == game.ReplicatedStorage.Mutators then
            v30 = "mutator"
        else
            error("Unknown item kind")
        end
        v_u_2.info.nametext.Text = v_u_28.Configuration.itemName.Value
        v_u_2.info.ImageLabel.Image = v_u_28.Configuration.pic.Value
        v_u_2.info.desc.Text = v_u_28.Configuration.desc.Value
        v_u_2.LayoutOrder = v_u_28.Configuration.layoutOrder.Value
        if v29 == "subscribed" then
            v_u_2.LayoutOrder = v_u_2.LayoutOrder + 10000
        elseif v29 == "product" then
            v_u_2.LayoutOrder = v_u_2.LayoutOrder + 20000
            v_u_2.info.unsubscribedText.Visible = false
            v_u_2.info.yxles.yxle:Destroy()
            v_u_2.info.yxles.Size = UDim2.new(UDim.new(1, 0), v_u_2.info.yxles.Size.Y)
            v_u_2.info.yxles.TextColor3 = Color3.new(0, 1, 0)
            spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_28
                v_u_2.info.yxles.Text = game:GetService("MarketplaceService"):GetProductInfo(v_u_28.Configuration.productId.Value, Enum.InfoType.Product).PriceInRobux .. " R$"
            end)
        else
            v_u_2.info.unsubscribedText.Visible = false
            v_u_3:WaitForChild("prices"):WaitForChild(v30):WaitForChild(v_u_28.Name).Changed:Connect(v_u_27)
        end
        v_u_27()
    end
end
v_u_2.InputBegan:Connect(function(p32)
    -- upvalues: (ref) v_u_5, (copy) v_u_2, (copy) v_u_13
    if p32.UserInputType == Enum.UserInputType.MouseMovement then
        v_u_5.Value = v_u_2
    elseif p32.UserInputType == Enum.UserInputType.MouseButton1 then
        v_u_13()
    end
end)
v_u_2.InputEnded:Connect(function(p33)
    -- upvalues: (ref) v_u_5, (copy) v_u_2
    if p33.UserInputType == Enum.UserInputType.MouseMovement and v_u_5.Value == v_u_2 then
        v_u_5.Value = nil
    end
end)
v_u_2.TouchTap:Connect(function()
    -- upvalues: (copy) v_u_13
    v_u_13()
end)
script.Parent.item.Changed:Connect(v31)
script.Parent.sale.Changed:Connect(v31)
v_u_4.Changed:Connect(function()
    -- upvalues: (copy) v_u_27
    v_u_27()
end)
workspace.ChildAdded:Connect(function(p34)
    -- upvalues: (copy) v_u_27
    if p34.Name == "tower" then
        p34:WaitForChild("sectionCount")
        v_u_27()
    end
end)
local v_u_35 = v_u_3.subscription.Value > os.time()
game:GetService("RunService").RenderStepped:Connect(function()
    -- upvalues: (ref) v_u_35, (copy) v_u_3, (copy) v_u_27
    if v_u_35 ~= (v_u_3.subscription.Value > os.time()) then
        v_u_27()
        v_u_35 = v_u_3.subscription.Value > os.time()
    end
end)
v31()

--========================================
-- LocalScript : StarterGui.shop_gears.shop.shop.sale.sale.ShopItemSaleScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.ReplicatedStorage.Sales:WaitForChild(script:GetAttribute("saleid"))
local function v2()
    -- upvalues: (copy) v_u_1
    if v_u_1.item.Value then
        script.Parent.Parent.Visible = true
        script.Parent.sale.Value = v_u_1
        script.Parent.item.Value = game.ReplicatedStorage.Assets.Gear:FindFirstChild(v_u_1.item.Value)
    else
        script.Parent.Parent.Visible = false
    end
end
v_u_1.Changed:Connect(v2)
v2()

--========================================
-- LocalScript : StarterGui.shop_gears.shop.yxle.update
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
-- LocalScript : StarterGui.shop_gears.UIScale.scale
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
function update()
    local v1 = Vector2.new(0.3, 0.65)
    local v2 = script.Parent.Parent.AbsoluteSize
    local v3 = Vector2.new(script.Parent.Parent.shop.Size.X.Offset, script.Parent.Parent.shop.Size.Y.Offset)
    local v4 = v2 * v1 / v3
    local v5 = v4.X
    local v6 = v4.Y
    local v7 = math.min(v5, v6) / 0.25
    local v8 = math.floor(v7)
    print("Set scale to ", v8)
    if v8 < 3 then
        v8 = v8 + 1
    end
    local v9 = v8 * 0.25
    script.Parent.Scale = math.max(v9, 0.25)
end
script.Parent.Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
update()

--========================================
-- LocalScript : StarterGui.shop_mutators.style
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
v_u_1.update.Event:Connect(function()
    -- upvalues: (copy) v_u_3
    for _, v4 in pairs(script.Parent:GetDescendants()) do
        v_u_3(v4)
    end
end)
script.Parent.DescendantAdded:Connect(v_u_3)
for _, v5 in pairs(script.Parent:GetDescendants()) do
    v_u_3(v5)
end

--========================================
-- LocalScript : StarterGui.shop_mutators.ControllerScript
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
-- LocalScript : StarterGui.shop_mutators.CloseScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game:GetService("TweenService")
game:GetService("UserInputService")
function toggle(p1)
    if p1 == nil then
        p1 = not script.Parent.open.Value
    end
    script.Parent.open.Value = p1
end
script.Parent.open.Changed:Connect(function()
    script.Parent.Enabled = script.Parent.open.Value
end)
script.Parent.shop.close.MouseButton1Click:connect(function(_)
    toggle(false)
end)
script.Parent.shop.close.TouchTap:Connect(function()
    toggle(false)
end)
game:GetService("ContextActionService"):BindActionAtPriority("open_" .. script.Parent.Name, function(_, p2, _)
    if not script.Parent.open.Value then
        return Enum.ContextActionResult.Pass
    end
    if p2 == Enum.UserInputState.End then
        toggle(false)
    end
    return Enum.ContextActionResult.Sink
end, false, 35000, Enum.KeyCode.ButtonSelect)

--========================================
-- LocalScript : StarterGui.shop_mutators.shop.shop.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("GuiService")
local v2 = game:GetService("UserInputService")
v1.AutoSelectGuiEnabled = false
local function v_u_5()
    local v3 = nil
    for _, v4 in pairs(script.Parent:GetDescendants()) do
        if v4.Name == "selectable" and (not v4:FindFirstAncestorWhichIsA("LuaSourceContainer") and (not v3 or (v3.AbsolutePosition.Y > v4.Parent.AbsolutePosition.Y or v3.AbsolutePosition.Y == v4.Parent.AbsolutePosition.Y and v3.AbsolutePosition.X > v4.Parent.AbsolutePosition.X))) then
            v3 = v4.Parent
        end
    end
    script.Parent.selected.Value = v3
end
local function v_u_6()
    game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.35), {
        ["CanvasPosition"] = Vector2.new(0, script.Parent.CanvasPosition.Y + script.Parent.selected.Value.AbsolutePosition.Y + script.Parent.selected.Value.AbsoluteSize.Y / 2 - script.Parent.AbsolutePosition.Y - script.Parent.AbsoluteSize.Y / 2)
    }):Play()
end
function selectUp()
    -- upvalues: (copy) v_u_6
    if script.Parent.selected.Value.NextSelectionUp then
        script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionUp
    else
        local v7 = script.Parent.selected.Value
        local v8 = v7.Parent.NextSelectionUp
        if v8 then
            local v9 = v7.AbsolutePosition.X
            local v10 = v9 + v7.AbsoluteSize.X
            local v11 = nil
            for _, v12 in pairs(v8:GetChildren()) do
                if v12:IsA("GuiBase") then
                    local v13 = v12.AbsolutePosition.X
                    if v9 < v13 + v12.AbsoluteSize.X and (v13 < v10 and (not v11 or v11.AbsolutePosition.Y < v12.AbsolutePosition.Y)) then
                        v11 = v12
                    end
                end
            end
            if v11 then
                script.Parent.selected.Value = v11
            end
        end
    end
    v_u_6()
end
function selectDown()
    -- upvalues: (copy) v_u_6
    if script.Parent.selected.Value.NextSelectionDown then
        script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionDown
    else
        local v14 = script.Parent.selected.Value
        local v15 = v14.Parent.NextSelectionDown
        if v15 then
            local v16 = v14.AbsolutePosition.X
            local v17 = v16 + v14.AbsoluteSize.X
            local v18 = nil
            for _, v19 in pairs(v15:GetChildren()) do
                if v19:IsA("GuiBase") then
                    local v20 = v19.AbsolutePosition.X
                    if v16 < v20 + v19.AbsoluteSize.X and (v20 < v17 and (not v18 or v18.AbsolutePosition.Y > v19.AbsolutePosition.Y)) then
                        v18 = v19
                    end
                end
            end
            if v18 then
                script.Parent.selected.Value = v18
            end
        end
    end
    v_u_6()
end
v2.InputBegan:Connect(function(p21)
    -- upvalues: (copy) v_u_5
    if script:FindFirstAncestorOfClass("ScreenGui").open.Value and (not script:FindFirstAncestorOfClass("ScreenGui"):FindFirstChild("tab") or script:FindFirstAncestorOfClass("ScreenGui").tab.Value == script.Parent) then
        local v22 = game:GetService("VRService")
        if v22:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or v22:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
            return
        elseif p21.UserInputType.Value >= 12 and (p21.UserInputType.Value <= 19 and not script.Parent.selected.Value) then
            v_u_5()
            return
        elseif p21.KeyCode == Enum.KeyCode.DPadDown then
            selectDown()
            return
        elseif p21.KeyCode == Enum.KeyCode.DPadUp then
            selectUp()
        elseif p21.KeyCode == Enum.KeyCode.DPadLeft then
            if script.Parent.selected.Value.NextSelectionLeft then
                script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft
                return
            end
        elseif p21.KeyCode == Enum.KeyCode.DPadRight and script.Parent.selected.Value.NextSelectionRight then
            script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight
        end
    else
        return
    end
end)
require(game.ReplicatedStorage.Library.Utility.thumbScroller2D)(Enum.KeyCode.Thumbstick1, function(p23, p24)
    -- upvalues: (copy) v_u_5
    if script.Parent.selected.Value then
        local v25 = p23.X
        for _ = 1, math.abs(v25) do
            if p24.X == -1 then
                if script.Parent.selected.Value.NextSelectionLeft then
                    script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft
                end
            elseif script.Parent.selected.Value.NextSelectionRight then
                script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight
            end
        end
        local v26 = p23.Y
        for _ = 1, math.abs(v26) do
            if p24.Y == -1 then
                selectDown()
            else
                selectUp()
            end
        end
    else
        v_u_5()
    end
end)

--========================================
-- LocalScript : StarterGui.shop_mutators.shop.shop.items.ShopItemsScript
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
function isOpen()
    local v4 = script
    while not v4:FindFirstChild("open") do
        v4 = v4.Parent
    end
    return v4.open.Value
end
for _, v5 in pairs(v3:GetChildren()) do
    if not v5.Configuration.hidden.Value then
        if v5.Configuration:FindFirstChild("price") then
            local v6 = script.template:Clone()
            v6.Name = v5.Name
            v6.method.Value = "regular"
            v6.item.Value = v5
            v6.Parent = script.Parent
        end
        if v5.Configuration:FindFirstChild("productId") then
            local v7 = script.template:Clone()
            v7.Name = v5.Name
            v7.method.Value = "product"
            v7.item.Value = v5
            v7.Parent = script.Parent
        end
        if v5.Configuration:FindFirstChild("subscriptionPrice") then
            local v8 = script.template:Clone()
            v8.Name = v5.Name
            v8.method.Value = "subscribed"
            v8.item.Value = v5
            v8.Parent = script.Parent
        end
    end
end
game:GetService("UserInputService").InputBegan:Connect(function(p9)
    local v10 = script.Parent.Parent.selected.Value
    if p9.KeyCode == Enum.KeyCode.ButtonX and (v10 and (v10.Parent == script.Parent and isOpen())) then
        v10.buy:Invoke()
    end
end)
script.Parent.Parent.selected.Changed:Connect(function()
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v11 = script.Parent.Parent.selected.Value
    for _, v12 in pairs(script.Parent:GetChildren()) do
        if v12 ~= v11 and v12:IsA("GuiBase") then
            v_u_1:Create(v12.info, TweenInfo.new(0.5), {
                ["Position"] = UDim2.new(0, 0, 0, 0)
            }):Play()
            v12.info.xbox.Visible = false
        end
    end
    if v11 and v11.Parent == script.Parent then
        v_u_1:Create(v11.info, TweenInfo.new(0.5), {
            ["Position"] = UDim2.new(0, 0, -0.55, 0)
        }):Play()
        v11.info.xbox.Visible = v_u_2.controller.Value
    end
end)
local v_u_13 = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
local function v14()
    -- upvalues: (copy) v_u_13
    v_u_13(script.Parent)
end
script.Parent.DescendantAdded:Connect(v14)
script.Parent.DescendantRemoving:Connect(v14)
v_u_13(script.Parent)

--========================================
-- LocalScript : StarterGui.shop_mutators.shop.shop.items.ShopItemsScript.template.ShopItemScript
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
local function v_u_13()
    local v6 = script.Parent.item.Value
    local v7 = script.Parent.method.Value
    local v8 = script.Parent.sale.Value
    local v9 = v8 and "sale" or v7
    local v10 = nil
    if v6.Parent == game.ReplicatedStorage.Assets.Gear then
        v10 = "gear"
    elseif v6.Parent == game.ReplicatedStorage.Mutators then
        v10 = "mutator"
    else
        error("Unknown item kind")
    end
    local v11 = game.ReplicatedStorage.Remotes.Economy.buyShopItem
    local v12 = {
        ["kind"] = v10,
        ["item"] = v6.Name,
        ["method"] = v9
    }
    if v8 then
        v8 = v8.Name
    end
    v12.sale = v8
    v12.source = "physical-shop"
    v11:InvokeServer(v12)
end
script.Parent.buy.OnInvoke = v_u_13
local function v_u_27()
    -- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
    if script.Parent.item.Value then
        local v14 = script.Parent.item.Value
        local v15 = script.Parent.method.Value
        local v16 = script.Parent.sale.Value
        local v17 = nil
        if v14.Parent == game.ReplicatedStorage.Assets.Gear then
            v17 = "gear"
        elseif v14.Parent == game.ReplicatedStorage.Mutators then
            v17 = "mutator"
        else
            error("Unknown item kind")
        end
        local v18 = workspace:WaitForChild("tower"):WaitForChild("sectionCount").Value - 2
        local v19 = game.ReplicatedStorage.Configuration.maxTowerLength.Value
        local v20 = math.min(v18, v19)
        local v21 = v14.Configuration:FindFirstChild("price") or v_u_3.subscription.Value > os.time()
        if v15 == "product" then
            v_u_2.Visible = not v21
        elseif v15 == "subscribed" then
            local v22 = v14.Configuration.subscriptionPrice:IsA("ModuleScript") and require(v14.Configuration.subscriptionPrice)(v20) or v14.Configuration.subscriptionPrice.Value
            v_u_2.info.yxles.Text = v22
            if v21 then
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
            local v23 = v_u_3:WaitForChild("prices"):WaitForChild(v17):WaitForChild(v14.Name).Value
            local v24
            if v16 then
                local v25 = v16.factor.Value * v23
                v24 = math.round(v25)
            else
                v24 = v23
                v23 = nil
            end
            v_u_2.info.yxles.Text = v24
            if v23 then
                v_u_2.info.regularyxles.Text = v23
            end
        end
        if v_u_2.info.yxles:FindFirstChild("yxle") then
            local v26 = v_u_2.info.yxles.Text
            if v21 and tonumber(v26) <= v_u_4.Value then
                v_u_2.info.yxles.TextColor3 = v_u_1.TextColor.Value
                v_u_2.info.yxles.COLORtext.Value = "TextColor"
                return
            end
            v_u_2.info.yxles.TextColor3 = v_u_1.DisabledTextColor.Value
            v_u_2.info.yxles.COLORtext.Value = "DisabledTextColor"
        end
    end
end
local function v31()
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_27
    if script.Parent.item.Value then
        local v_u_28 = script.Parent.item.Value
        local v29 = script.Parent.method.Value
        local v30 = nil
        if v_u_28.Parent == game.ReplicatedStorage.Assets.Gear then
            v30 = "gear"
        elseif v_u_28.Parent == game.ReplicatedStorage.Mutators then
            v30 = "mutator"
        else
            error("Unknown item kind")
        end
        v_u_2.info.nametext.Text = v_u_28.Configuration.itemName.Value
        v_u_2.info.ImageLabel.Image = v_u_28.Configuration.pic.Value
        v_u_2.info.desc.Text = v_u_28.Configuration.desc.Value
        v_u_2.LayoutOrder = v_u_28.Configuration.layoutOrder.Value
        if v29 == "subscribed" then
            v_u_2.LayoutOrder = v_u_2.LayoutOrder + 10000
        elseif v29 == "product" then
            v_u_2.LayoutOrder = v_u_2.LayoutOrder + 20000
            v_u_2.info.unsubscribedText.Visible = false
            v_u_2.info.yxles.yxle:Destroy()
            v_u_2.info.yxles.Size = UDim2.new(UDim.new(1, 0), v_u_2.info.yxles.Size.Y)
            v_u_2.info.yxles.TextColor3 = Color3.new(0, 1, 0)
            spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_28
                v_u_2.info.yxles.Text = game:GetService("MarketplaceService"):GetProductInfo(v_u_28.Configuration.productId.Value, Enum.InfoType.Product).PriceInRobux .. " R$"
            end)
        else
            v_u_2.info.unsubscribedText.Visible = false
            v_u_3:WaitForChild("prices"):WaitForChild(v30):WaitForChild(v_u_28.Name).Changed:Connect(v_u_27)
        end
        v_u_27()
    end
end
v_u_2.InputBegan:Connect(function(p32)
    -- upvalues: (ref) v_u_5, (copy) v_u_2, (copy) v_u_13
    if p32.UserInputType == Enum.UserInputType.MouseMovement then
        v_u_5.Value = v_u_2
    elseif p32.UserInputType == Enum.UserInputType.MouseButton1 then
        v_u_13()
    end
end)
v_u_2.InputEnded:Connect(function(p33)
    -- upvalues: (ref) v_u_5, (copy) v_u_2
    if p33.UserInputType == Enum.UserInputType.MouseMovement and v_u_5.Value == v_u_2 then
        v_u_5.Value = nil
    end
end)
v_u_2.TouchTap:Connect(function()
    -- upvalues: (copy) v_u_2, (ref) v_u_5, (copy) v_u_13
    local v34 = v_u_2.info.Position.Y.Scale * 100 + 0.5
    if math.floor(v34) == -55 then
        v_u_13()
    else
        v_u_5.Value = v_u_2
    end
end)
script.Parent.item.Changed:Connect(v31)
script.Parent.sale.Changed:Connect(v31)
v_u_4.Changed:Connect(function()
    -- upvalues: (copy) v_u_27
    v_u_27()
end)
workspace.ChildAdded:Connect(function(p35)
    -- upvalues: (copy) v_u_27
    if p35.Name == "tower" then
        p35:WaitForChild("sectionCount")
        v_u_27()
    end
end)
local v_u_36 = v_u_3.subscription.Value > os.time()
game:GetService("RunService").RenderStepped:Connect(function()
    -- upvalues: (ref) v_u_36, (copy) v_u_3, (copy) v_u_27
    if v_u_36 ~= (v_u_3.subscription.Value > os.time()) then
        v_u_27()
        v_u_36 = v_u_3.subscription.Value > os.time()
    end
end)
v31()

--========================================
-- LocalScript : StarterGui.shop_mutators.shop.shop.sale.sale.ShopItemScript
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
local function v_u_13()
    local v6 = script.Parent.item.Value
    local v7 = script.Parent.method.Value
    local v8 = script.Parent.sale.Value
    local v9 = v8 and "sale" or v7
    local v10 = nil
    if v6.Parent == game.ReplicatedStorage.Assets.Gear then
        v10 = "gear"
    elseif v6.Parent == game.ReplicatedStorage.Mutators then
        v10 = "mutator"
    else
        error("Unknown item kind")
    end
    local v11 = game.ReplicatedStorage.Remotes.Economy.buyShopItem
    local v12 = {
        ["kind"] = v10,
        ["item"] = v6.Name,
        ["method"] = v9
    }
    if v8 then
        v8 = v8.Name
    end
    v12.sale = v8
    v12.source = "physical-shop"
    v11:InvokeServer(v12)
end
script.Parent.buy.OnInvoke = v_u_13
local function v_u_27()
    -- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
    if script.Parent.item.Value then
        local v14 = script.Parent.item.Value
        local v15 = script.Parent.method.Value
        local v16 = script.Parent.sale.Value
        local v17 = nil
        if v14.Parent == game.ReplicatedStorage.Assets.Gear then
            v17 = "gear"
        elseif v14.Parent == game.ReplicatedStorage.Mutators then
            v17 = "mutator"
        else
            error("Unknown item kind")
        end
        local v18 = workspace:WaitForChild("tower"):WaitForChild("sectionCount").Value - 2
        local v19 = game.ReplicatedStorage.Configuration.maxTowerLength.Value
        local v20 = math.min(v18, v19)
        local v21 = v14:FindFirstChild("price") or v_u_3.subscription.Value > os.time()
        if v15 == "product" then
            v_u_2.Visible = not v21
        elseif v15 == "subscribed" then
            local v22 = v14.subscriptionPrice:IsA("ModuleScript") and require(v14.subscriptionPrice)(v20) or v14.subscriptionPrice.Value
            v_u_2.info.yxles.Text = v22
            if v21 then
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
            local v23 = v_u_3:WaitForChild("prices"):WaitForChild(v17):WaitForChild(v14.Name).Value
            local v24
            if v16 then
                local v25 = v16.factor.Value * v23
                v24 = math.round(v25)
            else
                v24 = v23
                v23 = nil
            end
            v_u_2.info.yxles.Text = v24
            if v23 then
                v_u_2.info.regularyxles.Text = v23
            end
        end
        if v_u_2.info.yxles:FindFirstChild("yxle") then
            local v26 = v_u_2.info.yxles.Text
            if v21 and tonumber(v26) <= v_u_4.Value then
                v_u_2.info.yxles.TextColor3 = v_u_1.TextColor.Value
                v_u_2.info.yxles.COLORtext.Value = "TextColor"
                return
            end
            v_u_2.info.yxles.TextColor3 = v_u_1.DisabledTextColor.Value
            v_u_2.info.yxles.COLORtext.Value = "DisabledTextColor"
        end
    end
end
local function v31()
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_27
    if script.Parent.item.Value then
        local v_u_28 = script.Parent.item.Value
        local v29 = script.Parent.method.Value
        local v30 = nil
        if v_u_28.Parent == game.ReplicatedStorage.Assets.Gear then
            v30 = "gear"
        elseif v_u_28.Parent == game.ReplicatedStorage.Mutators then
            v30 = "mutator"
        else
            error("Unknown item kind")
        end
        v_u_2.info.nametext.Text = v_u_28.Configuration.itemName.Value
        v_u_2.info.ImageLabel.Image = v_u_28.Configuration.pic.Value
        v_u_2.info.desc.Text = v_u_28.Configuration.desc.Value
        v_u_2.LayoutOrder = v_u_28.Configuration.layoutOrder.Value
        if v29 == "subscribed" then
            v_u_2.LayoutOrder = v_u_2.LayoutOrder + 10000
        elseif v29 == "product" then
            v_u_2.LayoutOrder = v_u_2.LayoutOrder + 20000
            v_u_2.info.unsubscribedText.Visible = false
            v_u_2.info.yxles.yxle:Destroy()
            v_u_2.info.yxles.Size = UDim2.new(UDim.new(1, 0), v_u_2.info.yxles.Size.Y)
            v_u_2.info.yxles.TextColor3 = Color3.new(0, 1, 0)
            spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_28
                v_u_2.info.yxles.Text = game:GetService("MarketplaceService"):GetProductInfo(v_u_28.Configuration.productId.Value, Enum.InfoType.Product).PriceInRobux .. " R$"
            end)
        else
            v_u_2.info.unsubscribedText.Visible = false
            v_u_3:WaitForChild("prices"):WaitForChild(v30):WaitForChild(v_u_28.Name).Changed:Connect(v_u_27)
        end
        v_u_27()
    end
end
v_u_2.InputBegan:Connect(function(p32)
    -- upvalues: (ref) v_u_5, (copy) v_u_2, (copy) v_u_13
    if p32.UserInputType == Enum.UserInputType.MouseMovement then
        v_u_5.Value = v_u_2
    elseif p32.UserInputType == Enum.UserInputType.MouseButton1 then
        v_u_13()
    end
end)
v_u_2.InputEnded:Connect(function(p33)
    -- upvalues: (ref) v_u_5, (copy) v_u_2
    if p33.UserInputType == Enum.UserInputType.MouseMovement and v_u_5.Value == v_u_2 then
        v_u_5.Value = nil
    end
end)
v_u_2.TouchTap:Connect(function()
    -- upvalues: (copy) v_u_13
    v_u_13()
end)
script.Parent.item.Changed:Connect(v31)
script.Parent.sale.Changed:Connect(v31)
v_u_4.Changed:Connect(function()
    -- upvalues: (copy) v_u_27
    v_u_27()
end)
workspace.ChildAdded:Connect(function(p34)
    -- upvalues: (copy) v_u_27
    if p34.Name == "tower" then
        p34:WaitForChild("sectionCount")
        v_u_27()
    end
end)
local v_u_35 = v_u_3.subscription.Value > os.time()
game:GetService("RunService").RenderStepped:Connect(function()
    -- upvalues: (ref) v_u_35, (copy) v_u_3, (copy) v_u_27
    if v_u_35 ~= (v_u_3.subscription.Value > os.time()) then
        v_u_27()
        v_u_35 = v_u_3.subscription.Value > os.time()
    end
end)
v31()

--========================================
-- LocalScript : StarterGui.shop_mutators.shop.shop.sale.sale.ShopItemSaleScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.ReplicatedStorage.Sales:WaitForChild(script:GetAttribute("saleid"))
local function v2()
    -- upvalues: (copy) v_u_1
    if v_u_1.item.Value then
        script.Parent.Parent.Visible = true
        script.Parent.sale.Value = v_u_1
        script.Parent.item.Value = game.ReplicatedStorage.Mutators:FindFirstChild(v_u_1.item.Value)
    else
        script.Parent.Parent.Visible = false
    end
end
v_u_1.Changed:Connect(v2)
v2()

--========================================
-- LocalScript : StarterGui.shop_mutators.shop.yxle.update
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
-- LocalScript : StarterGui.shop_mutators.UIScale.scale
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
function update()
    local v1 = Vector2.new(0.3, 0.65)
    local v2 = script.Parent.Parent.AbsoluteSize
    local v3 = Vector2.new(script.Parent.Parent.shop.Size.X.Offset, script.Parent.Parent.shop.Size.Y.Offset)
    local v4 = v2 * v1 / v3
    local v5 = v4.X
    local v6 = v4.Y
    local v7 = math.min(v5, v6) / 0.25
    local v8 = math.floor(v7)
    print("Set scale to ", v8)
    if v8 < 3 then
        v8 = v8 + 1
    end
    local v9 = v8 * 0.25
    script.Parent.Scale = math.max(v9, 0.25)
end
script.Parent.Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
update()

--========================================
-- LocalScript : StarterGui.timer.timerScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = 0
local v_u_2 = false
for v3, v4 in pairs(game.ReplicatedStorage.Remotes.Game.fetchRoundWinners:InvokeServer()) do
    v_u_1 = v_u_1 + 1
    print(v3, v4)
end
if v_u_1 > 0 and game.ReplicatedStorage.GameValues.roundTime then
    script.Parent.timeLeft.multiplier.Text = "x" .. 2 ^ v_u_1
end
function updateMutator(p5, p6)
    if p6 then
        if not script.Parent.mutators:FindFirstChild(p5) then
            local v7 = script.mutator:Clone()
            local v8 = game.ReplicatedStorage.Mutators:FindFirstChild(p5)
            if v8 then
                local v9 = v8.Configuration.pic.Value or ""
                if v9 == "customNegative" then
                    v7.customNegative.Visible = true
                    v7.Image = ""
                elseif v9 == "customPositive" then
                    v7.customPositive.Visible = true
                    v7.Image = ""
                else
                    v7.Image = v9
                end
                v7.Name = p5
                v7.Parent = script.Parent.mutators
                return
            end
        end
    else
        while script.Parent.mutators:FindFirstChild(p5) do
            script.Parent.mutators:FindFirstChild(p5):Destroy()
        end
    end
end
game.ReplicatedStorage.Remotes.Game.mutatorChanged.OnClientEvent:Connect(updateMutator)
for _, v10 in pairs(game.ReplicatedStorage.Remotes.Game.fetchMutators:InvokeServer()) do
    updateMutator(v10, true)
end
game.ReplicatedStorage.Remotes.Game.playerWonEvent.OnClientEvent:Connect(function(p11)
    -- upvalues: (ref) v_u_2, (ref) v_u_1
    if p11 == game.Players.LocalPlayer then
        v_u_2 = true
    end
    v_u_1 = v_u_1 + 1
    script.Parent.timeLeft.multiplier.Text = "x" .. 2 ^ v_u_1
end)
workspace.ChildAdded:connect(function(p_u_12)
    -- upvalues: (ref) v_u_2, (ref) v_u_1
    if p_u_12.Name == "tower" then
        p_u_12:WaitForChild("sectionCount")
        p_u_12:WaitForChild("sections")
        v_u_2 = false
        v_u_1 = 0
        script.Parent.timeLeft.multiplier.Text = ""
        p_u_12.sections.ChildAdded:Connect(function()
            -- upvalues: (copy) p_u_12, (ref) v_u_2, (ref) v_u_1
            local v13 = p_u_12
            v13:WaitForChild("sectionCount")
            v13:WaitForChild("sections")
            v_u_2 = false
            v_u_1 = 0
            script.Parent.timeLeft.multiplier.Text = ""
        end)
    end
end)
while true do
    local v14 = game.ReplicatedStorage.GameValues.roundTimeout.Value - game.ReplicatedStorage.GameValues.roundTime.Value
    if v14 == (1 / 0) then
        script.Parent.timeLeft.Text = ""
        script.Parent.timeLeft.multiplier.Visible = false
    else
        script.Parent.timeLeft.multiplier.Visible = true
        local v15 = script.Parent.timeLeft
        local v16 = v14 / 60
        local v17 = math.floor(v16)
        local v18 = v14 % 60 < 10 and "0" or ""
        local v19 = v14 % 60
        v15.Text = v17 .. ":" .. v18 .. math.floor(v19)
        if v_u_2 then
            script.Parent.timeLeft.TextColor3 = Color3.new(0, 1, 0)
        elseif v14 < 60 and (v14 > 10 or math.floor(v14) % 2 == 0) then
            script.Parent.timeLeft.TextColor3 = Color3.new(1, 0, 0)
        else
            script.Parent.timeLeft.TextColor3 = Color3.new(1, 1, 1)
        end
    end
    wait()
end

--========================================
-- LocalScript : StarterGui.uiStyle.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.ReplicatedStorage:WaitForChild("data"):WaitForChild(game.Players.LocalPlayer.UserId):WaitForChild("settings"):WaitForChild("Theme")
local function v_u_3()
    -- upvalues: (copy) v_u_1
    for _, v2 in pairs(script.Parent:GetChildren()) do
        if v2:IsA("ValueBase") then
            v2.Value = v_u_1:WaitForChild(v2.Name).Value
        end
    end
    script.Parent.update:Fire()
end
local function v5(p4)
    -- upvalues: (copy) v_u_3
    if p4:IsA("ValueBase") then
        p4.Changed:Connect(v_u_3)
    end
end
for _, v6 in pairs(v_u_1:GetChildren()) do
    if v6:IsA("ValueBase") then
        v6.Changed:Connect(v_u_3)
    end
end
v_u_1.ChildAdded:Connect(v5)
v_u_3()

--========================================
-- LocalScript : ReplicatedStorage.Assets.Effects.Rainbow Radiance.customPic.ImageLabel.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
while true do
    script.Parent.ImageColor3 = Color3.fromHSV(tick() / 10 % 1, 1, script.Parent.Parent.Parent.owned.Value and 1 or 0.333)
    wait()
end

--========================================
-- LocalScript : ReplicatedStorage.Assets.Effects.Loading Halo.customPic.ImageLabel.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
while true do
    script.Parent.ImageColor3 = Color3.fromHSV(tick() / 10 % 1, 1, script.Parent.Parent.Parent.owned.Value and 1 or 0.333)
    wait()
end

--========================================
-- LocalScript : ReplicatedStorage.Assets.Effects.Rainbow Halo.customPic.ImageLabel.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
while true do
    script.Parent.ImageColor3 = Color3.fromHSV(tick() / 10 % 1, 1, script.Parent.Parent.Parent.owned.Value and 1 or 0.333)
    wait()
end

--========================================
-- LocalScript : ReplicatedStorage.Assets.Effects.Spiral Ring.customPic.ImageLabel.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
while true do
    script.Parent.ImageColor3 = Color3.fromHSV(tick() / 10 % 1, 1, script.Parent.Parent.Parent.owned.Value and 1 or 0.333)
    wait()
end

--========================================
-- LocalScript : ReplicatedStorage.Assets.Effects.Christmas Radiance.customPic.ImageLabel.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("TweenService")
while true do
    v1:Create(script.Parent, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {
        ["ImageColor3"] = Color3.fromRGB(255, 85, 73)
    }):Play()
    wait(1.5)
    v1:Create(script.Parent, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {
        ["ImageColor3"] = Color3.fromRGB(118, 255, 60)
    }):Play()
    wait(1.5)
end

--========================================
-- LocalScript : ReplicatedStorage.Assets.Effects.Rainbow Smoke.customPic.ImageLabel.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
while true do
    script.Parent.ImageColor3 = Color3.fromHSV(os.time() / 10 % 1, 1, script.Parent.Parent.Parent.owned.Value and 1 or 0.333)
    wait()
end

--========================================
-- LocalScript : ReplicatedStorage.Assets.Effects.Spiral Halo.customPic.ImageLabel.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
while true do
    script.Parent.ImageColor3 = Color3.fromHSV(os.time() / 10 % 1, 1, script.Parent.Parent.Parent.owned.Value and 1 or 0.333)
    wait()
end

--========================================
-- LocalScript : ReplicatedStorage.Assets.Effects.Rainbow Flame.customPic.ImageLabel.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
while true do
    script.Parent.ImageColor3 = Color3.fromHSV(os.time() / 10 % 1, 1, script.Parent.Parent.Parent.owned.Value and 1 or 0.333)
    wait()
end

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.bomb.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game.Players.LocalPlayer:GetMouse()
script.Parent.Activated:Connect(function()
    script.Parent.RemoteEvent:FireServer()
end)
local v_u_1 = {
    [Enum.KeyCode.R] = 10,
    [Enum.KeyCode.T] = 60,
    [Enum.KeyCode.F] = -10,
    [Enum.KeyCode.G] = -60
}
game:GetService("UserInputService").InputBegan:Connect(function(p2)
    -- upvalues: (copy) v_u_1
    if p2.UserInputType == Enum.UserInputType.Keyboard and v_u_1[p2.KeyCode] then
        script.Parent.RemoteEvent:FireServer(v_u_1[p2.KeyCode])
    end
end)
game.Players.LocalPlayer.Chatted:Connect(function(p3)
    if tonumber(p3) then
        script.Parent.RemoteEvent:FireServer((tonumber(p3)))
    end
end)
script.Parent.Unequipped:Connect(function()
    if script.Parent.lit.Value and script.Parent.Parent == game.Players.LocalPlayer.Backpack then
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        local v4 = Instance.new("Explosion")
        v4.Position = script.Parent.Handle.Position
        v4.DestroyJointRadiusPercent = 0
        v4.BlastPressure = 0
        v4.Parent = workspace
        wait()
        script.Parent:Destroy()
    end
end)

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.bomb.Speed
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
-- LocalScript : ReplicatedStorage.Assets.Gear.cola.Speed
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.Players.LocalPlayer
local v_u_2 = {}
local v_u_3 = 1
script.Parent.Activated:Connect(function()
    -- upvalues: (ref) v_u_3, (copy) v_u_2, (copy) v_u_1
    local v4 = script.Parent.Parent.Humanoid
    v4.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
    v_u_3 = script.speedMult.Value
    print("update", v4.WalkSpeed)
    local v5 = v_u_2
    local v6 = script.Parent.Parent.Humanoid.StateChanged
    local function v9(_, p7)
        -- upvalues: (ref) v_u_3
        if p7 == Enum.HumanoidStateType.Landed then
            local v8 = script.Parent.Parent.Humanoid
            v8.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
            v_u_3 = script.speedMult.Value
            print("update", v8.WalkSpeed)
        end
    end
    table.insert(v5, v6:connect(v9))
    local v10 = v_u_2
    local v11 = script.Parent.Parent.Humanoid.Changed
    local function v14(p12)
        -- upvalues: (ref) v_u_3
        if p12 == "WalkSpeed" then
            local v13 = script.Parent.Parent.Humanoid
            v13.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
            v_u_3 = script.speedMult.Value
            print("update", v13.WalkSpeed)
        end
    end
    table.insert(v10, v11:Connect(v14))
    local v15 = v_u_2
    local v16 = script.speedMult.Changed
    local function v19()
        -- upvalues: (ref) v_u_1, (ref) v_u_3
        if script.Parent.Parent == v_u_1.Character then
            local v17 = script.Parent.Parent.Humanoid:GetState()
            if v17 == Enum.HumanoidStateType.Running or (v17 == Enum.HumanoidStateType.RunningNoPhysics or (v17 == Enum.HumanoidStateType.Climbing or v17 == Enum.HumanoidStateType.Landed)) then
                local v18 = script.Parent.Parent.Humanoid
                v18.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
                v_u_3 = script.speedMult.Value
                print("update", v18.WalkSpeed)
            end
        end
    end
    table.insert(v15, v16:Connect(v19))
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
-- LocalScript : ReplicatedStorage.Assets.Gear.hourglass.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
game.Players.LocalPlayer:GetMouse()
local v_u_1 = false
script.Parent.Activated:connect(function()
    -- upvalues: (ref) v_u_1
    if v_u_1 ~= true then
        game.Players.LocalPlayer.PlayerScripts.timefreeze.Value = not game.Players.LocalPlayer.PlayerScripts.timefreeze.Value
        wait()
        v_u_1 = false
    end
end)
function deactivate()
    game.Players.LocalPlayer.PlayerScripts.timefreeze.Value = false
end
script.Parent.Unequipped:Connect(deactivate)
script.Parent.AncestryChanged:Connect(deactivate)
game.Players.LocalPlayer.PlayerScripts.timefreeze.Changed:Connect(function()
    local v2 = game.Players.LocalPlayer.PlayerScripts.timefreeze.Value
    local v3 = v2 and script.Parent.base.ActiveWeld.C0 or script.Parent.base.InactiveWeld.C0
    game:GetService("TweenService"):Create(script.Parent.base.weld, TweenInfo.new(0.5), {
        ["C0"] = v3
    }):Play()
    game:GetService("TweenService"):Create(game.Lighting.hourglassColor, TweenInfo.new(0.5), {
        ["Saturation"] = v2 and -0.1 or 0,
        ["TintColor"] = v2 and Color3.fromRGB(234, 249, 255) or Color3.new(1, 1, 1)
    }):Play()
end)

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.yxterminator.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.Players.LocalPlayer:GetMouse()
local function v_u_6()
    -- upvalues: (copy) v_u_1
    local v2 = { script.Parent.Parent }
    for _, v3 in pairs(workspace.tower.sections:GetDescendants()) do
        if v3:IsA("BasePart") and (not v3.CanCollide and v3.Transparency == 1) then
            table.insert(v2, v3)
        end
    end
    local v4, v5 = workspace:FindPartOnRayWithIgnoreList(Ray.new(v_u_1.Origin.p, v_u_1.Origin.lookVector * 1000), v2)
    return v4, v5
end
script.Parent.Activated:Connect(function()
    -- upvalues: (copy) v_u_6
    local v7, v8 = v_u_6()
    if v7.Parent:FindFirstChildWhichIsA("Humanoid") then
        v8 = v7.Parent or v8
    end
    script.Parent.fire:InvokeServer(v8, game:GetService("UserInputService"):IsKeyDown("F"))
end)
script.Parent.Equipped:Connect(function()
    -- upvalues: (copy) v_u_1
    v_u_1.Icon = "rbxassetid://4770792736"
end)
function unequip()
    -- upvalues: (copy) v_u_1
    v_u_1.Icon = ""
end
script.Parent.Unequipped:Connect(unequip)
script.Parent.AncestryChanged:Connect(unequip)

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.hook.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v1 = game:GetService("UserInputService")
local v_u_2 = game.Players.LocalPlayer:GetMouse()
local v_u_3 = workspace.Terrain:FindFirstChild("HookTerrain")
if not v_u_3 then
    v_u_3 = Instance.new("Attachment")
    v_u_3.WorldCFrame = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 1.5707964))
    v_u_3.CFrame = v_u_3.WorldCFrame
    v_u_3.Axis = Vector3.new(0, 1, 0)
    v_u_3.SecondaryAxis = Vector3.new(-1, 0, 0)
    v_u_3.WorldAxis = v_u_3.Axis
    v_u_3.WorldSecondaryAxis = v_u_3.SecondaryAxis
    v_u_3.Name = "HookTerrain"
    v_u_3.Parent = workspace.Terrain
end
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = false
local v_u_8 = 0
local v_u_9 = nil
local v_u_10 = nil
_G.tohhookcooldown = _G.tohhookcooldown or 0
local function v_u_18()
    -- upvalues: (copy) v_u_2
    local v11 = script.Parent.Parent:WaitForChild("hook"):WaitForChild("UnshotHook")
    local v12 = v_u_2.Origin.Position
    local v13 = v_u_2.Origin.LookVector * 1000
    local v14 = RaycastParams.new()
    v14.FilterType = Enum.RaycastFilterType.Exclude
    v14.FilterDescendantsInstances = { script.Parent.Parent }
    v14.RespectCanCollide = true
    v14.IgnoreWater = true
    for _, v15 in pairs(workspace.tower.sections:GetDescendants()) do
        if v15:IsA("BasePart") and (not v15.CanCollide and v15.Transparency == 1) then
            local v16 = v14.FilterDescendantsInstances
            table.insert(v16, v15)
        end
    end
    local v17 = workspace:Blockcast(CFrame.new(v12, v12 + v13), Vector3.new(0.5, 0.5, 0.5), v13, v14)
    if v17 then
        return CFrame.new(v17.Position, v11.Position), v17.Instance
    end
end
local function v_u_19()
    -- upvalues: (ref) v_u_5, (ref) v_u_6
    if script.Parent:FindFirstChild("Hook") then
        if v_u_5 then
            script.Parent.RopeConstraint:Destroy()
            script.Parent.Hook:Destroy()
            script.Parent.HookAnchored:Destroy()
            if script.Parent.UnshotHook:FindFirstChild("Skin") then
                script.Parent.UnshotHook.Skin.Transparency = 0
            else
                script.Parent.UnshotHook.Transparency = 0
            end
            script.Parent.ropeStart.Transparency = 1
            if v_u_6 then
                v_u_6.PlatformStand = false
            end
            if v_u_5:FindFirstChild("HookAlign") then
                v_u_5.HookAlign:Destroy()
                v_u_5.HookAttachment:Destroy()
                v_u_5.HookMovement:Destroy()
            end
            if v_u_6 then
                v_u_6:ChangeState(Enum.HumanoidStateType.Freefall)
            end
        end
    else
        return
    end
end
script.Parent.Activated:Connect(function()
    -- upvalues: (copy) v_u_19, (ref) v_u_6, (ref) v_u_5, (copy) v_u_18, (ref) v_u_3, (ref) v_u_9
    if script.Parent:FindFirstChild("Hook") then
        v_u_19()
        return
    elseif _G.tohhookcooldown > tick() then
        return
    elseif v_u_6 and v_u_5 then
        local v20, v_u_21 = v_u_18()
        if v_u_21 then
            local v22 = script.Parent.Handle.HookAttachment
            local v23 = v20.Y - v22.WorldPosition.Y
            local v24 = math.abs(v23)
            local v25 = (v20.p - v22.WorldPosition).magnitude
            local v26 = (v24 * 2 + v25) * 0.333
            local v27 = (v25 - v26) * 0.1
            if script.Parent.Range.Value >= v24 then
                local v28 = script.Parent.UnshotHook:FindFirstChild("Skin")
                v_u_6.PlatformStand = true
                local v29 = Instance.new("Attachment")
                v29.Name = "HookAttachment"
                v29.Axis = Vector3.new(0, 1, 0)
                v29.SecondaryAxis = v_u_5.CFrame.lookVector
                v29.Parent = v_u_5
                local v30 = Instance.new("AlignOrientation")
                v30.Name = "HookAlign"
                v30.RigidityEnabled = true
                v30.PrimaryAxisOnly = false
                v30.Attachment0 = v29
                v30.Attachment1 = v_u_3
                v30.Parent = v_u_5
                local v31 = Instance.new("VectorForce")
                v31.Name = "HookMovement"
                v31.Attachment0 = v29
                v31.RelativeTo = Enum.ActuatorRelativeTo.World
                v31.Parent = v_u_5
                local v32 = Instance.new("Part")
                v32.Name = "HookAnchored"
                if v28 and v28:FindFirstChild("offset") then
                    v32.CFrame = v20 * v28.offset.Value
                else
                    v32.CFrame = v20
                end
                v32.Size = Vector3.new(2, 2, 2)
                v32.CanCollide = false
                v32.Anchored = false
                v32.Transparency = 1
                v32.Parent = script.Parent
                local v33 = Instance.new("ManualWeld")
                v33.Part0 = v32
                v33.Part1 = v_u_21
                v33.C0 = v32.CFrame:Inverse() * v_u_21.CFrame
                v33.Parent = v32
                local v34 = Instance.new("Attachment")
                v34.Position = Vector3.new(0, 0, -1.1)
                v34.Parent = v32
                local v35
                if v28 then
                    v35 = v28:Clone()
                    v28.Transparency = 1
                else
                    v35 = script.Parent.UnshotHook:Clone()
                    script.Parent.UnshotHook.Transparency = 1
                end
                v35:ClearAllChildren()
                script.Parent.ropeStart.Transparency = 0
                v35.Name = "Hook"
                v35.Parent = script.Parent
                local v36 = Instance.new("Attachment")
                v36.Orientation = Vector3.new(0, 0, 0)
                v36.Position = Vector3.new(0, 0.1, -0.6)
                v36.Parent = v35
                v35.CFrame = v34.WorldCFrame * v36.CFrame:inverse()
                local v37 = Instance.new("AlignPosition")
                v37.RigidityEnabled = true
                v37.Attachment1 = v34
                v37.Attachment0 = v36
                v37.Parent = v35
                local v38 = Instance.new("AlignOrientation")
                v38.RigidityEnabled = true
                v38.Attachment1 = v34
                v38.Attachment0 = v36
                v38.Parent = v35
                local v39 = Instance.new("RopeConstraint")
                if v28 and v28:GetAttribute("ropeOffset") then
                    local v40 = v36:Clone()
                    v40.Name = "RopeOffsetAttachment"
                    v40.Position = v40.Position + v28:GetAttribute("ropeOffset")
                    v40.Parent = v35
                    v39.Attachment0 = v40
                else
                    v39.Attachment0 = v36
                end
                v39.Attachment1 = v22
                v39.Length = v25
                v39.Visible = true
                if script.Parent.UnshotHook:FindFirstChild("Skin") and script.Parent.UnshotHook.Skin:FindFirstChild("ropeColor") then
                    v39.Color = BrickColor.new(script.Parent.UnshotHook.Skin.ropeColor.Value)
                else
                    v39.Color = BrickColor.new("Smoky grey")
                end
                v39.Thickness = 0.3
                v39.Parent = script.Parent
                game:GetService("TweenService"):Create(v39, TweenInfo.new(v27), {
                    ["Length"] = v26
                }):Play()
                v_u_9 = v_u_21.Changed:Connect(function(p41)
                    -- upvalues: (copy) v_u_21, (ref) v_u_19
                    if p41 == "Parent" and not v_u_21:IsDescendantOf(workspace) then
                        v_u_19()
                    elseif p41 == "CanCollide" and not v_u_21.CanCollide then
                        v_u_19()
                    end
                end)
            end
        else
            return
        end
    else
        return
    end
end)
script.Parent.Equipped:Connect(function()
    -- upvalues: (copy) v_u_2, (ref) v_u_8, (ref) v_u_4, (ref) v_u_6, (ref) v_u_5, (ref) v_u_10, (ref) v_u_7
    v_u_2.Icon = "rbxassetid://4770792736"
    v_u_8 = v_u_8 + 1
    if not v_u_4 then
        v_u_4 = script.Parent.Parent
        v_u_6 = v_u_4.Humanoid
        v_u_5 = v_u_4.HumanoidRootPart
        v_u_10 = v_u_6.StateChanged:Connect(function(_, p42)
            -- upvalues: (ref) v_u_7
            if p42 == Enum.HumanoidStateType.Landed or (p42 == Enum.HumanoidStateType.Running or p42 == Enum.HumanoidStateType.RunningNoPhysics) then
                v_u_7 = false
            end
        end)
    end
end)
function unequip()
    -- upvalues: (ref) v_u_10, (copy) v_u_2, (copy) v_u_19
    if v_u_10 then
        v_u_10:Disconnect()
        v_u_10 = nil
    end
    v_u_2.Icon = ""
    v_u_19()
end
script.Parent.Unequipped:Connect(unequip)
script.Parent.AncestryChanged:Connect(unequip)
v1.JumpRequest:connect(function()
    -- upvalues: (ref) v_u_6, (copy) v_u_19, (ref) v_u_7, (ref) v_u_8
    if script:IsDescendantOf(workspace) then
        if v_u_6 then
            if script.Parent:FindFirstChild("Hook") then
                v_u_19()
                if v_u_7 then
                    local v43 = v_u_8
                    v_u_6:ChangeState(Enum.HumanoidStateType.Freefall)
                    task.wait(0.4)
                    if v43 ~= v_u_8 or not script.Parent:FindFirstChild("Hook") then
                        return
                    end
                end
                v_u_7 = true
                _G.tohhookcooldown = tick() + 0.85
                v_u_6:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    else
        return
    end
end)
local v44 = v_u_5
local v45 = v_u_6
while task.wait(0.016666666666666666) do
    if script.Parent:FindFirstChild("Hook") and (script:IsDescendantOf(workspace) and v45) then
        v44.HookMovement.Force = v45.MoveDirection * script.Parent.SwingForce.Value - v44.Velocity * 8
        if (script.Parent.Hook.AlignPosition.Attachment0.WorldPosition - script.Parent.Hook.AlignPosition.Attachment1.WorldPosition).Magnitude > 1 then
            v_u_19()
            script.Parent.ropeStart.snap:Play()
        end
    end
    if script:IsDescendantOf(workspace) then
        local v46 = script.Parent.Handle.HookAttachment
        local v47 = v_u_2.Hit.Position.Y - v46.WorldPosition.Y
        if math.abs(v47) > script.Parent.Range.Value then
            v_u_2.Icon = "rbxassetid://4770792736"
        else
            v_u_2.Icon = "rbxassetid://4770790320"
        end
    end
end

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.hook.activeSkills
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.Library.Utility.stringListContains)
local v_u_2 = game.ReplicatedStorage.data:FindFirstChild(game.Players.LocalPlayer.UserId).activeskills
function update()
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    local v3 = v_u_2.Value
    local v4 = 50
    for v5, v6 in pairs({ 90, 120 }) do
        if v_u_1(v3, script.Parent.Name .. "/range" .. v5) then
            v4 = math.max(v4, v6)
        end
    end
    script.Parent:WaitForChild("Range").Value = v4
    local v7 = 350
    for v8, v9 in pairs({ 650, 950 }) do
        if v_u_1(v3, script.Parent.Name .. "/swing" .. v8) then
            v7 = math.max(v7, v9)
        end
    end
    script.Parent:WaitForChild("SwingForce").Value = v7
end
v_u_2.Changed:Connect(update)
script.Parent.Equipped:Connect(update)

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.trowel.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.Players.LocalPlayer:GetMouse()
local v_u_2 = false
script.Parent.Activated:connect(function()
    -- upvalues: (ref) v_u_2, (copy) v_u_1
    while v_u_2 == true do
        wait()
    end
    v_u_2 = true
    script.Parent.placeClient:Fire(v_u_1.Origin, v_u_1.Hit)
    wait(0.05)
    v_u_2 = false
end)

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.trowel.script
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.Library.Utility.stringListContains)
local v_u_2 = require(game.ReplicatedStorage.Library.Utility.colorFromId)
local v_u_3 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
for _, v4 in pairs(script.Parent:GetChildren()) do
    if v4:IsA("Part") and v4.Name ~= "Handle" then
        v4.Color = v_u_2(game.Players.LocalPlayer.UserId)
    end
end
spawn(function()
    while true do
        for v5 = 1, _G.trowelGearMaxCharges do
            local v6 = script.Parent:FindFirstChild("part" .. v5)
            if v6 then
                v6.Transparency = v5 <= _G.trowelGearCurrentCharges and 0 or 1
            end
        end
        wait()
    end
end)
script.Parent:WaitForChild("placeClient").Event:connect(function(p7, p8)
    -- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
    if _G.trowelGearCurrentCharges >= 1 then
        _G.trowelGearCurrentCharges = _G.trowelGearCurrentCharges - 1
        local v9 = script.Parent.Handle.Position
        local v10 = (p7.p - v9).magnitude
        local v11 = (p7.p - p8.p).magnitude
        local v12 = v10 + script.Parent.range.Value
        local v13 = p7.p + p7.LookVector * math.min(v12, v11)
        local v14 = v13.X + 0.5
        local v15 = math.floor(v14)
        local v16 = v13.Y + 0.5
        local v17 = math.floor(v16)
        local v18 = v13.Z + 0.5
        local v19 = math.floor(v18)
        local v20 = Vector3.new(v15, v17, v19)
        local v21 = v_u_3.activeskills.Value
        local v22
        if v_u_1(v21, "trowel/truss") then
            v22 = Instance.new("TrussPart")
            v22.Size = Vector3.new(2, 8, 2)
        else
            v22 = Instance.new("Part")
            v22.TopSurface = Enum.SurfaceType.Smooth
            v22.BottomSurface = Enum.SurfaceType.Smooth
            local v23 = 4
            for v24, v25 in pairs({ 8, 16 }) do
                if v_u_1(v21, "trowel/size" .. v24) then
                    v23 = math.max(v23, v25)
                end
            end
            v22.Size = Vector3.new(v23, 1, v23)
        end
        v22.Anchored = true
        v22.Material = Enum.Material.Glass
        v22.Color = v_u_2(game.Players.LocalPlayer.UserId)
        v22.Position = v20
        v22.Name = "temporaryPart-" .. game.Players.LocalPlayer.Name
        v22.Parent = workspace.platforms
        local v26 = script.Parent:FindFirstChild("part" .. _G.trowelGearCurrentCharges + 1)
        if v26 then
            v26.Transparency = 1
        end
        local v27 = game:GetService("TweenService"):Create(v22, TweenInfo.new(script.Parent.lifetime.Value), {
            ["Transparency"] = 1
        })
        game:GetService("Debris"):addItem(v22, script.Parent.lifetime.Value)
        v27:Play()
    end
end)

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.fishingrod.LocalScript
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game:GetService("TweenService")
local v_u_2 = nil
local v_u_3 = false
local v_u_4 = false
local v_u_5 = false
local function v_u_6()
    -- upvalues: (ref) v_u_4, (copy) v_u_1, (ref) v_u_3, (ref) v_u_5
    v_u_4 = true
    v_u_1:Create(script.Parent.RopeConstraint, TweenInfo.new(1, Enum.EasingStyle.Quad), {
        ["WinchTarget"] = 0.275
    }):Play()
    wait(0.75)
    v_u_1:Create(script.Parent.AlignPosition, TweenInfo.new(0.25), {
        ["MaxForce"] = 10000
    }):Play()
    v_u_1:Create(script.Parent.AlignOrientation, TweenInfo.new(0.25), {
        ["MaxTorque"] = 5000
    }):Play()
    wait(0.25)
    v_u_3 = false
    v_u_4 = false
    v_u_5 = false
end
script.Parent.Equipped:Connect(function(p7)
    -- upvalues: (ref) v_u_2
    v_u_2 = p7
end)
script.Parent.Unequipped:Connect(function()
    -- upvalues: (copy) v_u_6
    v_u_6()
end)
script.Parent.Activated:Connect(function()
    -- upvalues: (ref) v_u_4, (ref) v_u_2, (ref) v_u_3, (copy) v_u_6, (copy) v_u_1, (ref) v_u_5
    if v_u_4 then
        return
    else
        local v8 = v_u_2.Origin
        local v9 = v_u_2.Hit
        v_u_3 = not v_u_3
        script.Parent.ActivateRod:InvokeServer(v_u_3, v8, v9)
        if v_u_3 then
            v_u_4 = true
            script.Parent.RopeConstraint.Enabled = true
            local v10 = (v9.p - script.Parent.Handle.AlignmentAttachment.Position).unit * 100
            script.Parent.AlignPosition.MaxForce = 0
            script.Parent.AlignOrientation.MaxTorque = 0
            script.Parent.Bobber.Velocity = v10
            script.Parent.RopeConstraint.Length = 25
            local v11 = v_u_1:Create(script.Parent.RopeConstraint, TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                ["WinchTarget"] = 50
            })
            v11.Completed:Connect(function(p12)
                -- upvalues: (ref) v_u_5
                if p12 == Enum.PlaybackState.Completed then
                    v_u_5 = true
                end
            end)
            v11:Play()
            v_u_4 = false
        else
            v_u_6()
        end
    end
end)
local v13 = v_u_5
while true do
    repeat
        local v14 = wait()
    until v_u_3
    local v15 = script.Parent.BobberTarget.BobberTargetCenter.WorldPosition
    local v16 = script.Parent.Bobber.BobberCenter.WorldPosition
    local v17 = script.Parent.Bobber.BobberHoverHigh.WorldPosition
    local v18 = script.Parent.Bobber.BobberHoverLow.WorldPosition
    local v19 = RaycastParams.new()
    v19.FilterType = Enum.RaycastFilterType.Exclude
    v19.FilterDescendantsInstances = { script.Parent.Parent }
    ray = workspace:Raycast(v15, v16 - v15, v19)
    if ray then
        print("much too long")
        script.Parent.RopeConstraint.WinchTarget = ray.Distance + 1
        v_u_5 = true
        v13 = v_u_5
    elseif v13 then
        ray_high = workspace:Raycast(v15, v17 - v15, v19)
        if ray_high then
            script.Parent.RopeConstraint.WinchTarget = script.Parent.RopeConstraint.CurrentDistance - v14 * 20
        end
        ray_low = workspace:Raycast(v15, v18 - v15, v19)
        if not ray_low then
            local v20 = script.Parent.RopeConstraint
            local v21 = script.Parent.RopeConstraint.CurrentDistance + v14 * 20
            v20.WinchTarget = math.min(v21, 100)
        end
    end
end

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.speed.activeSkills
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.Library.Utility.stringListContains)
local v_u_2 = game.ReplicatedStorage.data:FindFirstChild(game.Players.LocalPlayer.UserId).activeskills
function update()
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    local v3 = v_u_2.Value
    local v4 = 1.3
    for v5, v6 in pairs({ 1.75, 2.4, 3 }) do
        if v_u_1(v3, script.Parent.Name .. "/speed" .. v5) then
            v4 = math.max(v4, v6)
        end
    end
    script.Parent:WaitForChild("Speed"):WaitForChild("speedMult").Value = v4
end
v_u_2.Changed:Connect(update)
script.Parent.Equipped:Connect(update)

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.speed.SoundPlayer
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
-- LocalScript : ReplicatedStorage.Assets.Gear.speed.Speed
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
-- LocalScript : ReplicatedStorage.Assets.Gear.jump.SoundPlayer
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
-- LocalScript : ReplicatedStorage.Assets.Gear.jump.MultiJump
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.Players.LocalPlayer
local v_u_2 = 0
script.Parent.Equipped:Connect(function()
    -- upvalues: (copy) v_u_1, (ref) v_u_2
    local v3 = v_u_1.Character
    v3.ExtraJumper.multiJumpCount.Value = v3.ExtraJumper.multiJumpCount.Value + script.multiJumpCount.Value - v_u_2
    v_u_2 = script.multiJumpCount.Value
end)
function dequip()
    -- upvalues: (copy) v_u_1, (ref) v_u_2
    local v4 = v_u_1.Character
    v4.ExtraJumper.multiJumpCount.Value = v4.ExtraJumper.multiJumpCount.Value - v_u_2
    v_u_2 = 0
end
script.Parent.Unequipped:Connect(dequip)
script.Parent.AncestryChanged:Connect(function()
    -- upvalues: (copy) v_u_1
    if script.Parent ~= v_u_1.Character then
        dequip()
    end
end)
script:WaitForChild("multiJumpCount").Changed:Connect(function()
    -- upvalues: (copy) v_u_1, (ref) v_u_2
    local v5 = v_u_1.Character
    if v5 and script.Parent.Parent == v5 then
        v5.ExtraJumper.multiJumpCount.Value = v5.ExtraJumper.multiJumpCount.Value + script.multiJumpCount.Value - v_u_2
        v_u_2 = script.multiJumpCount.Value
    end
end)

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.gravity.MultiJump
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = game.Players.LocalPlayer
local v_u_2 = 0
script.Parent.Equipped:Connect(function()
    -- upvalues: (copy) v_u_1, (ref) v_u_2
    local v3 = v_u_1.Character
    v3.ExtraJumper.multiJumpCount.Value = v3.ExtraJumper.multiJumpCount.Value + script.multiJumpCount.Value - v_u_2
    v_u_2 = script.multiJumpCount.Value
end)
function dequip()
    -- upvalues: (copy) v_u_1, (ref) v_u_2
    local v4 = v_u_1.Character
    v4.ExtraJumper.multiJumpCount.Value = v4.ExtraJumper.multiJumpCount.Value - v_u_2
    v_u_2 = 0
end
script.Parent.Unequipped:Connect(dequip)
spawn(function()
    -- upvalues: (copy) v_u_1
    script.Parent.AncestryChanged:Connect(function()
        -- upvalues: (ref) v_u_1
        if script.Parent ~= v_u_1.Character then
            dequip()
        end
    end)
end)
script:WaitForChild("multiJumpCount").Changed:Connect(function()
    -- upvalues: (copy) v_u_1, (ref) v_u_2
    local v5 = v_u_1.Character
    if v5 and script.Parent.Parent == v5 then
        v5.ExtraJumper.multiJumpCount.Value = v5.ExtraJumper.multiJumpCount.Value + script.multiJumpCount.Value - v_u_2
        v_u_2 = script.multiJumpCount.Value
    end
end)

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.gravity.activeSkills
--========================================
-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
local v_u_1 = require(game.ReplicatedStorage.Library.Utility.stringListContains)
local v_u_2 = game.ReplicatedStorage.data:FindFirstChild(game.Players.LocalPlayer.UserId).activeskills
function update()
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    local v3 = v_u_2.Value
    local v4 = 0.3
    for v5, v6 in pairs({ 0.45, 0.55, 0.6 }) do
        if v_u_1(v3, script.Parent.Name .. "/grav" .. v5) then
            v4 = math.max(v4, v6)
        end
    end
    script.Parent:WaitForChild("Gravity"):WaitForChild("gravityDecrease").Value = v4
    local v7 = 0
    for v8, v9 in pairs({ 8, 12 }) do
        if v_u_1(v3, script.Parent.Name .. "/jump" .. v8) then
            v7 = math.max(v7, v9)
        end
    end
    script.Parent:WaitForChild("Gravity"):WaitForChild("jumpPowerIncrease").Value = v7
    local v10 = 1
    for v11, v12 in pairs({}) do
        if v_u_1(v3, script.Parent.Name .. "/speed" .. v11) then
            v10 = math.max(v10, v12)
        end
    end
    script.Parent:WaitForChild("MultiJump"):WaitForChild("multiJumpCount").Value = v_u_1(v3, script.Parent.Name .. "/double") and 1 or 0
end
v_u_2.Changed:Connect(update)
script.Parent.Equipped:Connect(update)

--========================================
-- LocalScript : ReplicatedStorage.Assets.Gear.gravity.SoundPlayer
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
-- LocalScript : ReplicatedStorage.Assets.Gear.gravity.Gravity
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
-- LocalScript : ReplicatedStorage.Assets.Gear.fusion.SoundPlayer
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
-- LocalScript : ReplicatedStorage.Assets.Gear.fusion.activeSkills
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
-- LocalScript : ReplicatedStorage.Assets.Gear.fusion.Speed
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
-- LocalScript : ReplicatedStorage.Assets.Gear.fusion.Gravity
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
