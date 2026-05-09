-- DragonCihuy Ultra Short GUI - Random TP Edition (Updated Toggle)
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- 1. NOTIFIKASI BADGE
game.StarterGui:SetCore("SendNotification", {
    Title = "Executed!",
    Text = "By: DragonCihuy",
    Duration = 5
})

-- 2. INFINITE JUMP
local InfJumpEnabled = true
UIS.JumpRequest:Connect(function()
    if InfJumpEnabled and Humanoid then
        Humanoid:ChangeState("Jumping")
    end
end)

-- 3. SETUP GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleBtn = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")

ScreenGui.Name = "DragonCihuy_FinalToggle"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- 4. TOMBOL TOGGLE (HITAM, TEXT [-]/[+])
ToggleBtn.Parent = ScreenGui
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleBtn.Position = UDim2.new(0.5, -30, 0.015, 0)
ToggleBtn.Size = UDim2.new(0, 60, 0, 35)
ToggleBtn.Text = "[-]" -- Default awal terbuka
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 30
local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleBtn

-- 5. MAIN FRAME (HITAM, ROUND 10%)
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Position = UDim2.new(0.5, -90, 0.2, 0)
MainFrame.Size = UDim2.new(0, 180, 0, 280) 
MainFrame.Active = true
MainFrame.Draggable = true
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0.1, 0) 
MainCorner.Parent = MainFrame

-- FUNGSI LABEL
local function CreateLabel(text, size, pos, bold)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = MainFrame
    lbl.Size = UDim2.new(1, 0, 0, size)
    lbl.Position = pos
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.BackgroundTransparency = 1
    lbl.Font = bold and Enum.Font.SourceSansBold or Enum.Font.SourceSans
    lbl.TextSize = bold and 15 or 11
    return lbl
end

CreateLabel("ROLLER FOR BRAINROTS!", 30, UDim2.new(0,0,0,5), true)
CreateLabel("By : DragonCihuy", 12, UDim2.new(0,0,0,30), false)
CreateLabel("YT : @dragoncihuyrblx", 12, UDim2.new(0,0,0,42), false)

local RGB_Bottom = CreateLabel("[TEAM DRAGONCIHUY]", 20, UDim2.new(0,0,1,-25), true)
RunService.RenderStepped:Connect(function()
    local hue = tick() % 3 / 3
    RGB_Bottom.TextColor3 = Color3.fromHSV(hue, 1, 1)
end)

-- CONTAINER TOMBOL
local Holder = Instance.new("Frame")
Holder.Parent = MainFrame
Holder.BackgroundTransparency = 1
Holder.Position = UDim2.new(0, 10, 0, 65)
Holder.Size = UDim2.new(1, -20, 0, 180)

UIListLayout.Parent = Holder
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- 6. FUNGSI TELEPORT
local function Teleport(pos, speed, jp)
    if RootPart then RootPart.CFrame = CFrame.new(pos) end
    if speed and Humanoid then Humanoid.WalkSpeed = 120 end
    if jp and Humanoid then 
        Humanoid.JumpPower = 80 
        Humanoid.UseJumpPower = true
    end
end

local SecretLocations = {
    Vector3.new(662.15, 1768.06, 3811.27),
    Vector3.new(671.36, 1754.06, 4610.63),
    Vector3.new(-15.28, 1753.06, 5003.78),
    Vector3.new(-719.19, 1757.06, 4599.9),
    Vector3.new(-714.69, 1754.06, 3784.52)
}

local function MakeBtn(text, actionType)
    local b = Instance.new("TextButton")
    b.Parent = Holder
    b.Size = UDim2.new(1, 0, 0, 35)
    b.Text = string.upper(text)
    b.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    b.TextColor3 = Color3.fromRGB(0, 0, 0)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 14
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)

    b.MouseButton1Click:Connect(function()
        if actionType == "OG" then
            Teleport(Vector3.new(-8.64, 1244.07, 3288.1), true, true)
        elseif actionType == "CELESTIAL" then
            Teleport(Vector3.new(7.56, 840.87, 2458.87), true, true)
        elseif actionType == "SECRET" then
            Teleport(SecretLocations[math.random(1, #SecretLocations)], true, true)
        elseif actionType == "BACK" then
            Teleport(Vector3.new(0.7, 14.3, -52.81), false, false)
        end
    end)
end

MakeBtn("[OG AREA]", "OG")
MakeBtn("[CELESTIAL AREA]", "CELESTIAL")
MakeBtn("[SECRET AREA]", "SECRET")
MakeBtn("[TP BACK]", "BACK")

-- 7. TOGGLE FUNGSI (PERBAIKAN TEKS)
ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    if MainFrame.Visible then
        ToggleBtn.Text = "[-]"
    else
        ToggleBtn.Text = "[+]"
    end
end)

Player.CharacterAdded:Connect(function(newChar)
    Character = newChar
    Humanoid = newChar:WaitForChild("Humanoid")
    RootPart = newChar:WaitForChild("HumanoidRootPart")
end)
