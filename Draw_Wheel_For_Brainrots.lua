-- DragonCihuy GUI + Tp Base Update
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local Title = Instance.new("TextLabel")
local NoKeyLabel = Instance.new("TextLabel")
local TeleportLabel = Instance.new("TextLabel")
local TeleportBtn = Instance.new("TextButton")
local AdminBtn = Instance.new("TextButton")
local OGBtn = Instance.new("TextButton")
local SecretBtn = Instance.new("TextButton")
local BaseBtn = Instance.new("TextButton") -- Tombol Baru
local YTLabel = Instance.new("TextLabel")
local ToggleBtn = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "DragonCihuy_Final"

-- 1. FITUR INFINITE JUMP
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid:ChangeState("Jumping") end
    end
end)

-- 2. NOTIFIKASI (Bahasa Inggris)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Text By : DragonCihuy",
    Text = "Your car has been loaded successfully!",
    Duration = 5
})

-- Tombol Toggle
ToggleBtn.Parent = ScreenGui
ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleBtn.Position = UDim2.new(0.9, 0, 0.4, 0)
ToggleBtn.Size = UDim2.new(0, 35, 0, 35)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "[-]"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 14
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 8)

-- Main Frame (GUI Pendek Kotak Hitam)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Position = UDim2.new(0.9, -165, 0.4, 0)
MainFrame.Size = UDim2.new(0, 160, 0, 310) -- Ukuran ditambah sedikit agar muat
MainFrame.Visible = true
MainFrame.Active = true 
UICorner.CornerRadius = UDim.new(0.1, 0)
UICorner.Parent = MainFrame

UIListLayout.Parent = MainFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Judul & Label
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, -10, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "DRAW WHEEL FOR BRAINROTS!"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 9
Title.TextWrapped = true

NoKeyLabel.Parent = MainFrame
NoKeyLabel.BackgroundTransparency = 1
NoKeyLabel.Size = UDim2.new(1, 0, 0, 15)
NoKeyLabel.Text = "NO KEY"
NoKeyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
NoKeyLabel.TextSize = 10

TeleportLabel.Parent = MainFrame
TeleportLabel.BackgroundTransparency = 1
TeleportLabel.Size = UDim2.new(1, 0, 0, 20)
TeleportLabel.Text = "↓ TELEPORT ↓"
TeleportLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TeleportLabel.TextSize = 11

TeleportBtn.Parent = MainFrame
TeleportBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TeleportBtn.Size = UDim2.new(0.9, 0, 0, 30)
TeleportBtn.Text = "SELECT LOCATION"
TeleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportBtn.TextSize = 10
Instance.new("UICorner", TeleportBtn).CornerRadius = UDim.new(0, 4)

-- Fungsi TP
local function tp(x, y, z)
    local p = game.Players.LocalPlayer
    if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
        p.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
    end
end

-- Tombol Admin
AdminBtn.Parent = MainFrame
AdminBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
AdminBtn.Size = UDim2.new(0.9, 0, 0, 25)
AdminBtn.Text = "TRAVEL ADMIN"
AdminBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AdminBtn.TextSize = 10
AdminBtn.MouseButton1Click:Connect(function()
    TeleportBtn.Text = "ADMIN"
    tp(3.36, 134.74, -2733.4)
end)

-- Tombol OG
OGBtn.Parent = MainFrame
OGBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
OGBtn.Size = UDim2.new(0.9, 0, 0, 25)
OGBtn.Text = "TRAVEL OG"
OGBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OGBtn.TextSize = 10
OGBtn.MouseButton1Click:Connect(function()
    TeleportBtn.Text = "OG"
    tp(-2.35, 145.74, -2222.65)
end)

-- Tombol Secret
SecretBtn.Parent = MainFrame
SecretBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SecretBtn.Size = UDim2.new(0.9, 0, 0, 25)
SecretBtn.Text = "TRAVEL SECRET"
SecretBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SecretBtn.TextSize = 10
SecretBtn.MouseButton1Click:Connect(function()
    TeleportBtn.Text = "SECRET"
    tp(-33.26, 142.74, -1584.67)
end)

-- Tombol Tp Base (BARU)
BaseBtn.Parent = MainFrame
BaseBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BaseBtn.Size = UDim2.new(0.9, 0, 0, 25)
BaseBtn.Text = "TRAVEL TP BASE"
BaseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BaseBtn.TextSize = 10
BaseBtn.MouseButton1Click:Connect(function()
    TeleportBtn.Text = "TP BASE"
    tp(-8.26, 127.5, 2.7)
end)

YTLabel.Parent = MainFrame
YTLabel.BackgroundTransparency = 1
YTLabel.Size = UDim2.new(1, 0, 0, 25)
YTLabel.Text = "@DragonCihuyRblx"
YTLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
YTLabel.TextSize = 9

-- SCRIPT GESER (DRAG FUNCTION)
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

-- Toggle Logic
local open = true
ToggleBtn.MouseButton1Click:Connect(function()
    open = not open
    MainFrame.Visible = open
    ToggleBtn.Text = open and "[-]" or "[+]"
end)
