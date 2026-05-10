-- [[ DragonCihuy Script ]] --

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Notifikasi Awal (Badge & Title)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "DragonCihuy Script",
    Text = "By: DragonCihuy",
    Duration = 5
})

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DragonCihuyGUI"
ScreenGui.Parent = CoreGui

-- Main Frame (Kotak Hitam Round 2%)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 250, 0, 180)
MainFrame.Position = UDim2.new(0.5, -125, 0.4, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.02, 0) -- Round 2%
UICorner.Parent = MainFrame

-- Header: CLIMB AND PLUNGE
local TitleTop = Instance.new("TextLabel")
TitleTop.Size = UDim2.new(1, 0, 0, 20)
TitleTop.Position = UDim2.new(0, 0, -0.15, 0)
TitleTop.BackgroundTransparency = 1
TitleTop.Text = "CLIMB AND PLUNGE"
TitleTop.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleTop.TextSize = 14
TitleTop.Font = Enum.Font.SourceSansBold
TitleTop.Parent = MainFrame

-- SubHeader: DragonCihuy
local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, 0, 0, 30)
SubTitle.Position = UDim2.new(0, 0, 0.05, 0)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "DragonCihuy"
SubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SubTitle.TextSize = 22
SubTitle.Font = Enum.Font.GothamBold
SubTitle.Parent = MainFrame

-- YouTube Label (Warna Merah)
local YTLabel = Instance.new("TextLabel")
YTLabel.Size = UDim2.new(1, 0, 0, 20)
YTLabel.Position = UDim2.new(0, 0, 0.25, 0)
YTLabel.BackgroundTransparency = 1
YTLabel.Text = "YT : @dragoncihuyRblx"
YTLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
YTLabel.TextSize = 14
YTLabel.Font = Enum.Font.SourceSansItalic
YTLabel.Parent = MainFrame

-- Button (INFWINS + INFCOINS)
local ActionBtn = Instance.new("TextButton")
ActionBtn.Name = "ActionBtn"
ActionBtn.Size = UDim2.new(0.8, 0, 0, 40)
ActionBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
ActionBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ActionBtn.Text = "INFWINS + INFCOINS"
ActionBtn.TextColor3 = Color3.fromRGB(255, 255, 255) -- Default Putih
ActionBtn.TextSize = 16
ActionBtn.Font = Enum.Font.GothamBold
ActionBtn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0.2, 0)
BtnCorner.Parent = ActionBtn

-- Efek RGB pada Tulisan Button
spawn(function()
    while task.wait() do
        local hue = tick() % 5 / 5
        ActionBtn.TextColor3 = Color3.fromHSV(hue, 1, 1)
    end
end)

-- Logic Klik
ActionBtn.MouseButton1Click:Connect(function()
    ActionBtn.Text = "LOADING..."
    ActionBtn.Active = false
    
    task.wait(1) -- Delay 1 Detik
    
    -- Execute Remote
    local remote = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Race"):WaitForChild("AddCoinsOrWins")
    remote:FireServer(math.huge, "Wins")
    remote:FireServer(math.huge, "Coins")
    
    ActionBtn.Text = "Successfull"
    
    task.wait(2)
    ActionBtn.Text = "INFWINS + INFCOINS"
    ActionBtn.Active = true
end)

-- Auto Kick & Hide GUI (1 Menit)
spawn(function()
    task.wait(60) -- 1 Menit
    ScreenGui:Destroy()
    Players.LocalPlayer:Kick("OPPSS I SORRY... 😌")
end)
