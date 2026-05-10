-- DragonCihuy Script --

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TitleLabel = Instance.new("TextLabel")
local NameLabel = Instance.new("TextLabel")
local YTLabel = Instance.new("TextLabel")
local ActionButton = Instance.new("TextButton")
local Badge = Instance.new("TextLabel")

-- Notif Setup
local NotifFrame = Instance.new("Frame")
local NotifCorner = Instance.new("UICorner")
local NotifText = Instance.new("TextLabel")

-- Parent ke CoreGui
ScreenGui.Name = "DragonCihuy_GUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- === FUNGSI NOTIFIKASI (ROUND 4%) ===
NotifFrame.Name = "Notification"
NotifFrame.Parent = ScreenGui
NotifFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
NotifFrame.Position = UDim2.new(0.5, -160, 0.15, 0)
NotifFrame.Size = UDim2.new(0, 320, 0, 110) 
NotifFrame.BorderSizePixel = 0
NotifFrame.ZIndex = 10 -- Layer Kotak

NotifCorner.CornerRadius = UDim.new(0.04, 0)
NotifCorner.Parent = NotifFrame

NotifText.Parent = NotifFrame
NotifText.BackgroundTransparency = 1
NotifText.Size = UDim2.new(1, -20, 1, 0)
NotifText.Position = UDim2.new(0, 10, 0, 0)
NotifText.Font = Enum.Font.GothamBold -- Diganti Bold biar lebih jelas
NotifText.Text = "You need FREE GIFT 🎁 if you get Coins. Then click INFCOIN for infinite coins!\n\nKamu Butuh FREE GIFT 🎁 jika dapat Coin. Lalu klik INFCOIN sampai tak terbatas!"
NotifText.TextColor3 = Color3.fromRGB(255, 255, 255)
NotifText.TextSize = 13
NotifText.TextWrapped = true
NotifText.ZIndex = 20 -- Layer Teks (Harus lebih tinggi dari kotak)

-- === GUI UTAMA (Tersembunyi Awalnya) ===
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -90)
MainFrame.Size = UDim2.new(0, 220, 0, 185)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = MainFrame

TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "CLIMB AND JUMP TOWER"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 14

NameLabel.Parent = MainFrame
NameLabel.BackgroundTransparency = 1
NameLabel.Position = UDim2.new(0, 0, 0.22, 0)
NameLabel.Size = UDim2.new(1, 0, 0, 20)
NameLabel.Font = Enum.Font.GothamSemibold
NameLabel.Text = "By : DragonCihuy"
NameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
NameLabel.TextSize = 13

YTLabel.Parent = MainFrame
YTLabel.BackgroundTransparency = 1
YTLabel.Position = UDim2.new(0, 0, 0.33, 0)
YTLabel.Size = UDim2.new(1, 0, 0, 20)
YTLabel.Font = Enum.Font.GothamSemibold
YTLabel.Text = "YT : DragonCihuy"
YTLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
YTLabel.TextSize = 13

ActionButton.Parent = MainFrame
ActionButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ActionButton.Position = UDim2.new(0.08, 0, 0.5, 0)
ActionButton.Size = UDim2.new(0.84, 0, 0, 45)
ActionButton.Font = Enum.Font.GothamBold
ActionButton.Text = "INFCOIN"
ActionButton.TextSize = 20

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = ActionButton

Badge.Parent = MainFrame
Badge.BackgroundTransparency = 1
Badge.Position = UDim2.new(0, 0, 0.82, 0)
Badge.Size = UDim2.new(1, 0, 0, 20)
Badge.Font = Enum.Font.SourceSans
Badge.Text = "DragonCihuy Script"
Badge.TextColor3 = Color3.fromRGB(80, 80, 80)
Badge.TextSize = 12

-- === LOGIKA ===

task.spawn(function()
    -- Pastikan teks terlihat dari awal
    NotifFrame.BackgroundTransparency = 0
    NotifText.TextTransparency = 0
    
    task.wait(10) -- Durasi baca 10 detik
    
    -- Menghilang perlahan
    for i = 0, 1, 0.05 do 
        NotifFrame.BackgroundTransparency = i
        NotifText.TextTransparency = i
        task.wait(0.05)
    end
    
    NotifFrame:Destroy()
    MainFrame.Visible = true
end)

task.spawn(function()
    while task.wait() do
        local hue = tick() % 5 / 5
        ActionButton.TextColor3 = Color3.fromHSV(hue, 0.8, 1)
    end
end)

ActionButton.MouseButton1Click:Connect(function()
    ActionButton.Text = "LOADING..."
    ActionButton.TextSize = 16
    task.wait(1)
    
    ActionButton.TextSize = 24
    ActionButton.Text = "SUCCESSFUL"
    
    pcall(function()
        local args = {7000001, -math.huge}
        game:GetService("ReplicatedStorage"):WaitForChild("Tool"):WaitForChild("DrawUp"):WaitForChild("Msg"):WaitForChild("DrawHero"):InvokeServer(unpack(args))
    end)
    
    task.wait(1.5)
    ActionButton.TextSize = 20
    ActionButton.Text = "INFCOIN"
end)
