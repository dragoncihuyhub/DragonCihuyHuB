lp = game.Players.LocalPlayer
local lp = game.Players.LocalPlayer
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "DragonCihuy Script",
    Text = "Script Ready!",
    Duration = 5
})

local function makeDraggable(frame)
    local d, s, sp
    frame.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = true s = i.Position sp = frame.Position end end)
    frame.InputChanged:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseMovement and d then
        local delta = i.Position - s
        frame.Position = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y)
    end end)
    uis.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = false end end)
end

local leftMain = Instance.new("Frame", sg)
leftMain.Size = UDim2.new(0, 210, 0, 280)
leftMain.Position = UDim2.new(0, 20, 0.5, -140)
leftMain.BackgroundColor3 = Color3.new(0,0,0)
Instance.new("UICorner", leftMain).CornerRadius = UDim.new(0.04, 0)

local leftLayout = Instance.new("UIListLayout", leftMain)
leftLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
leftLayout.Padding = UDim.new(0, 6)
leftLayout.SortOrder = Enum.SortOrder.LayoutOrder
Instance.new("UIPadding", leftMain).PaddingTop = UDim.new(0, 12)

local secret = Instance.new("TextLabel", leftMain)
secret.LayoutOrder = 1
secret.Size = UDim2.new(1, 0, 0, 20)
secret.Text = "DRAGONCIHUY"
secret.TextColor3 = Color3.new(1,1,1)
secret.BackgroundTransparency = 1
secret.Font = Enum.Font.GothamBold
secret.TextSize = 14
task.spawn(function()
    while task.wait(0.1) do secret.TextTransparency = 0.2 + math.sin(tick()*3)*0.2 end
end)

local leftTitle = Instance.new("TextLabel", leftMain)
leftTitle.LayoutOrder = 2
leftTitle.Size = UDim2.new(1, 0, 0, 35)
leftTitle.Text = "PETAK UMPET"
leftTitle.TextColor3 = Color3.new(1,1,1)
leftTitle.Font = Enum.Font.GothamBold
leftTitle.TextSize = 24
leftTitle.BackgroundTransparency = 1

local yt = Instance.new("TextLabel", leftMain)
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
    local btn = Instance.new("TextButton", leftMain)
    btn.LayoutOrder = 3 + i
    btn.Size = UDim2.new(0, 180, 0, 35)
    btn.Text = "Tp Win In " .. i
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    Instance.new("UICorner", btn)
    btn.MouseButton1Down:Connect(function() btn.BackgroundColor3 = Color3.new(0,0,0) end)
    btn.MouseButton1Up:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(40,40,40) end)
    btn.MouseButton1Click:Connect(function()
        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
            lp.Character.HumanoidRootPart.CFrame = CFrame.new(v)
        end
    end)
end

local midMain = Instance.new("Frame", sg)
midMain.Size = UDim2.new(0, 180, 0, 260)
midMain.Position = UDim2.new(0.5, -90, 0.5, -130)
midMain.BackgroundColor3 = Color3.new(0,0,0)
Instance.new("UICorner", midMain).CornerRadius = UDim.new(0, 8)

local midLayout = Instance.new("UIListLayout", midMain)
midLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
midLayout.Padding = UDim.new(0, 4)
midLayout.SortOrder = Enum.SortOrder.LayoutOrder
Instance.new("UIPadding", midMain).PaddingTop = UDim.new(0, 8)

local midTitle = Instance.new("TextLabel", midMain)
midTitle.LayoutOrder = 1
midTitle.Size = UDim2.new(1, 0, 0, 35)
midTitle.Text = "PETAK UMPET"
midTitle.TextColor3 = Color3.new(1,1,1)
midTitle.Font = Enum.Font.GothamBold
midTitle.TextSize = 18
midTitle.BackgroundTransparency = 1

local function createMidBtn(txt, order)
    local btn = Instance.new("TextButton", midMain)
    btn.LayoutOrder = order
    btn.Size = UDim2.new(0, 160, 0, 32)
    btn.Text = txt
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Down:Connect(function() btn.BackgroundColor3 = Color3.new(0,0,0) end)
    btn.MouseButton1Up:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(35,35,35) end)
    return btn
end

local spdIdx, spdVals, spdTxts = 1, {16, 25, 30}, {"Normal", "Lari", "Kabur"}
local spdBtn = createMidBtn("Speed: Normal", 2)
spdBtn.MouseButton1Click:Connect(function()
    spdIdx = spdIdx % 3 + 1
    spdBtn.Text = "Speed: " .. spdTxts[spdIdx]
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then lp.Character.Humanoid.WalkSpeed = spdVals[spdIdx] end
end)

local ij = false
local ijBtn = createMidBtn("INFJUMP: OFF", 3)
uis.JumpRequest:Connect(function()
    if ij and lp.Character and lp.Character:FindFirstChild("Humanoid") then lp.Character.Humanoid:ChangeState("Jumping") end
end)
ijBtn.MouseButton1Click:Connect(function()
    ij = not ij
    ijBtn.Text = "INFJUMP: " .. (ij and "ON" or "OFF")
end)

local esp = false
local espBtn = createMidBtn("ESP PLAYER [OFF]", 4)
espBtn.MouseButton1Click:Connect(function()
    esp = not esp
    espBtn.Text = "ESP PLAYER [" .. (esp and "ON" or "OFF") .. "]"
end)

local hb = false
local hbBtn = createMidBtn("HITBOX PLAYER [OFF]", 5)
hbBtn.MouseButton1Click:Connect(function()
    hb = not hb
    hbBtn.Text = "HITBOX PLAYER [" .. (hb and "ON" or "OFF") .. "]"
end)

local tog = Instance.new("TextButton", sg)
tog.Size = UDim2.new(0, 45, 0, 45)
tog.Position = UDim2.new(1, -60, 0, 20)
tog.BackgroundColor3 = Color3.new(0, 0, 0)
tog.Text = "[-]"
tog.TextColor3 = Color3.new(1, 1, 1)
tog.TextSize = 18
Instance.new("UICorner", tog).CornerRadius = UDim.new(1, 0)

tog.MouseButton1Click:Connect(function()
    local v = not leftMain.Visible
    leftMain.Visible = v
    midMain.Visible = v
    tog.Text = v and "[-]" or "[+]"
end)

rs.RenderStepped:Connect(function()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            local hum = p.Character:FindFirstChild("Humanoid")
            local box = hrp:FindFirstChild("CihuyESP") or Instance.new("BoxHandleAdornment", hrp)
            box.Name = "CihuyESP"
            box.AlwaysOnTop, box.Adornee, box.ZIndex = true, hrp, 10
            box.Size = Vector3.new(4, 5, 1)
            box.Transparency = esp and 0.6 or 1
            box.Color3 = Color3.new(1, 1, 1)

            local tag = hrp:FindFirstChild("CihuyTag") or Instance.new("BillboardGui", hrp)
            tag.Name = "CihuyTag"
            tag.Size, tag.AlwaysOnTop, tag.Enabled = UDim2.new(0, 100, 0, 50), true, esp
            tag.StudsOffset = Vector3.new(0, 3, 0)
            local tl = tag:FindFirstChild("TextLabel") or Instance.new("TextLabel", tag)
            tl.Size, tl.BackgroundTransparency, tl.TextColor3 = UDim2.new(1, 0, 1, 0), 1, Color3.new(1, 1, 1)
            tl.TextSize, tl.Font = 10, Enum.Font.GothamBold
            tl.Text = p.Name .. "\nHP: " .. (hum and math.floor(hum.Health) or "0")
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = p.Character.HumanoidRootPart
                if hb then
                    hrp.Size, hrp.Transparency, hrp.CanCollide = Vector3.new(100, 100, 100), 0.8, false
                else
                    hrp.Size, hrp.Transparency = Vector3.new(2, 2, 1), 1
                end
            end
        end
    end
end)

makeDraggable(leftMain)
makeDraggable(midMain)

