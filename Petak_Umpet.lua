lp = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "DragonCihuy Script",
    Text = "By DragonCihuy",
    Duration = 5
})

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 210, 0, 265)
main.Position = UDim2.new(0.5, -105, 0.5, -132)
main.BackgroundColor3 = Color3.new(0,0,0)
Instance.new("UICorner", main).CornerRadius = UDim.new(0.04, 0)

local layout = Instance.new("UIListLayout", main)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Padding = UDim.new(0, 6)
layout.SortOrder = Enum.SortOrder.LayoutOrder 

local pad = Instance.new("UIPadding", main)
pad.PaddingTop = UDim.new(0, 12)

local secret = Instance.new("TextLabel", main)
secret.LayoutOrder = 1
secret.Size = UDim2.new(1, 0, 0, 20)
secret.Text = "DRAGONCIHUY"
secret.TextColor3 = Color3.new(1,1,1)
secret.BackgroundTransparency = 1
secret.Font = Enum.Font.GothamBold
secret.TextSize = 14
task.spawn(function()
    while task.wait(0.1) do 
        secret.TextTransparency = 0.2 + math.sin(tick()*3)*0.2 
    end
end)

local title = Instance.new("TextLabel", main)
title.LayoutOrder = 2
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "PETAK UMPET"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.BackgroundTransparency = 1

local yt = Instance.new("TextLabel", main)
yt.LayoutOrder = 3
yt.Size = UDim2.new(1, 0, 0, 20)
yt.Text = "YouTube : @DragonCihuyRBLX"
yt.TextColor3 = Color3.fromRGB(255, 0, 0)
yt.Font = Enum.Font.GothamBold
yt.TextSize = 13
yt.BackgroundTransparency = 1

local posList = {
    Vector3.new(67.52, 12, -366.17),
    Vector3.new(49.23, 12, -8.83),
    Vector3.new(-227.75, 8.75, -396.2)
}

for i, v in pairs(posList) do
    local btn = Instance.new("TextButton", main)
    btn.LayoutOrder = 3 + i
    btn.Size = UDim2.new(0, 180, 0, 35)
    btn.Text = "Tp Win In " .. i
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(function()
        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
            lp.Character.HumanoidRootPart.CFrame = CFrame.new(v)
        end
    end)
end

local tog = Instance.new("TextButton", sg)
tog.Size = UDim2.new(0, 45, 0, 45)
tog.Position = UDim2.new(1, -60, 0, 20)
tog.BackgroundColor3 = Color3.new(0, 0, 0)
tog.Text = "[-]"
tog.TextColor3 = Color3.new(1, 1, 1)
tog.TextSize = 18
Instance.new("UICorner", tog).CornerRadius = UDim.new(1, 0)

tog.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
    tog.Text = main.Visible and "[-]" or "[+]"
end)

task.delay(3600, function() 
    if lp then lp:Kick("jangan Panik panik wkwkkw, ya dekk😹") end 
end)

local dragging, dragInput, dragStart, startPos
main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)
main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
