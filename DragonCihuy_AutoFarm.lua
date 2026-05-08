print(game:HttpGet("https://raw.githubusercontent.com/dragoncihuyhub/DragonCihuyHuB/refs/heads/main/DragonCihuy_AutoFarm.lua"))

-- BUILD A BOAT AUTO FARM - DRAGON CIHUY (TOP CENTER OPEN VERSION)
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Anti-Kick Check
if game.PlaceId ~= 537413528 then
    player:Kick("WHAT IS IT GAME BRUHH ITS NOT SUPPORTED")
    return
end

-- Anti-AFK Internal
for i,v in pairs(getconnections(player.Idled)) do
    v:Disable()
end

-- Hapus GUI lama
if player.PlayerGui:FindFirstChild("DragonCihuyGUI") then
    player.PlayerGui.DragonCihuyGUI:Destroy()
end

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DragonCihuyGUI"
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false 

-- Tombol Open (Tengah Atas)
local OpenBtn = Instance.new("TextButton", ScreenGui)
OpenBtn.Size = UDim2.new(0, 80, 0, 30)
OpenBtn.Position = UDim2.new(0.5, -40, 0, 10) -- Posisi Tengah Atas
OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenBtn.BackgroundTransparency = 0.3 -- Sedikit transparan
OpenBtn.Text = "OPEN"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Font = Enum.Font.SourceSansBold
OpenBtn.TextSize = 14
OpenBtn.Visible = false 
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0.3, 0)

-- Kotak Utama (Main Frame)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 220, 0, 190)
MainFrame.Position = UDim2.new(0.5, -110, 0.4, -95)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0.15, 0)

-- Tombol Close (X)
local CloseGuiBtn = Instance.new("TextButton", MainFrame)
CloseGuiBtn.Size = UDim2.new(0, 25, 0, 25)
CloseGuiBtn.Position = UDim2.new(1, -30, 0, 5)
CloseGuiBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseGuiBtn.Text = "X"
CloseGuiBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseGuiBtn.TextSize = 14
Instance.new("UICorner", CloseGuiBtn).CornerRadius = UDim.new(0.5, 0)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.Text = "AUTO FARM GOLD"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20

local SubTitle = Instance.new("TextLabel", MainFrame)
SubTitle.Size = UDim2.new(1, 0, 0, 15)
SubTitle.Position = UDim2.new(0, 0, 0, 35)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "By : DragonCihuy"
SubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SubTitle.Font = Enum.Font.SourceSansBold
SubTitle.TextSize = 14

local YTTitle = Instance.new("TextLabel", MainFrame)
YTTitle.Size = UDim2.new(1, 0, 0, 15)
YTTitle.Position = UDim2.new(0, 0, 0, 50)
YTTitle.BackgroundTransparency = 1
YTTitle.Text = "YouTube : @DragonCihuyRBLX"
YTTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
YTTitle.TextSize = 10

local AntiAfkLabel = Instance.new("TextLabel", MainFrame)
AntiAfkLabel.Size = UDim2.new(1, 0, 0, 15)
AntiAfkLabel.Position = UDim2.new(0, 0, 0, 65)
AntiAfkLabel.BackgroundTransparency = 1
AntiAfkLabel.Text = "ANTI AFK ☑️"
AntiAfkLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
AntiAfkLabel.Font = Enum.Font.SourceSansBold
AntiAfkLabel.TextSize = 11

local NoKeyLabel = Instance.new("TextLabel", MainFrame)
NoKeyLabel.Size = UDim2.new(1, 0, 0, 15)
NoKeyLabel.Position = UDim2.new(0, 0, 0, 80)
NoKeyLabel.BackgroundTransparency = 1
NoKeyLabel.Text = "NO KEY"
NoKeyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
NoKeyLabel.Font = Enum.Font.SourceSansBold
NoKeyLabel.TextSize = 11

local ToggleBtn = Instance.new("TextButton", MainFrame)
ToggleBtn.Size = UDim2.new(0, 180, 0, 40)
ToggleBtn.Position = UDim2.new(0, 20, 0, 110)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleBtn.Text = "Auto Farm: OFF"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 16
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0.2, 0)

-- Open/Close Logic
CloseGuiBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenBtn.Visible = false
end)

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "DragonCihuy Script",
    Text = "By DragonCihuy",
    Duration = 5
})

-- Farm Logic & Koordinat
local positions = {
    Vector3.new(-61.65, 60.63, 1346.09),
    Vector3.new(-72.49, 97.79, 2113.09),
    Vector3.new(-43.95, 107.98, 2889.09),
    Vector3.new(-63.83, 80.14, 3658.09),
    Vector3.new(-89.93, 76.23, 4427),
    Vector3.new(-89.09, 55.64, 5200.09),
    Vector3.new(-144.72, 68.66, 5972.09),
    Vector3.new(-89.09, 55.64, 5200.09),
    Vector3.new(-47.94, 23.96, 6734.59),
    Vector3.new(-55.7, 59.17, 7486.59),
    Vector3.new(-50.61, 81.01, 8271.59),
    Vector3.new(-55.03, -358.19, 9484.86)
}

local platform = Instance.new("Part")
platform.Size = Vector3.new(12, 1, 12)
platform.Anchored = true
platform.CanCollide = true
platform.Transparency = 1
platform.Name = "DragonFloor"

getgenv().AutoFarm = false

ToggleBtn.MouseButton1Click:Connect(function()
    getgenv().AutoFarm = not getgenv().AutoFarm
    ToggleBtn.Text = getgenv().AutoFarm and "Auto Farm: ON" or "Auto Farm: OFF"
    ToggleBtn.BackgroundColor3 = getgenv().AutoFarm and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(40, 40, 40)
    
    if getgenv().AutoFarm then
        task.spawn(function()
            while getgenv().AutoFarm do
                platform.Parent = workspace
                for _, pos in ipairs(positions) do
                    if not getgenv().AutoFarm then break end
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        platform.CFrame = CFrame.new(pos - Vector3.new(0, 3.5, 0))
                        hrp.CFrame = CFrame.new(pos)
                    end
                    task.wait(2.4)
                end
                
                if getgenv().AutoFarm then
                    local char = player.Character
                    if char and char:FindFirstChild("Humanoid") then
                        char.Humanoid.Health = 0
                    end
                    task.wait(7)
                end
            end
            platform.Parent = nil
        end)
    else
        platform.Parent = nil
    end
end)
