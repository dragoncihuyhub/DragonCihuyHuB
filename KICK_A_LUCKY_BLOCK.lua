local CoreGui = game:GetService("CoreGui")
local player = game.Players.LocalPlayer
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
if CoreGui:FindFirstChild("DragonUltimateGUI") then CoreGui.DragonUltimateGUI:Destroy() end
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DragonUltimateGUI"
ScreenGui.Parent = CoreGui
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 220, 0, 230)
MainFrame.Position = UDim2.new(0.5, -110, 0.4, -115)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.Parent = ScreenGui
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0.04, 0)
Corner.Parent = MainFrame
local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(50, 50, 50)
Stroke.Parent = MainFrame
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0.02, 0)
Title.BackgroundTransparency = 1
Title.Text = "KICK A LUCKY BLOCK"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = MainFrame
local MiddleText = Instance.new("TextLabel")
MiddleText.Size = UDim2.new(1, 0, 0, 20)
MiddleText.Position = UDim2.new(0, 0, 0.15, 0)
MiddleText.BackgroundTransparency = 1
MiddleText.Text = "DragonCihuy"
MiddleText.TextColor3 = Color3.fromRGB(200, 200, 200)
MiddleText.Font = Enum.Font.Gotham
MiddleText.TextSize = 12
MiddleText.Parent = MainFrame
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(1, 0, 0, 20)
SpeedLabel.Position = UDim2.new(0, 0, 0.3, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Speed"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.Font = Enum.Font.GothamBold
SpeedLabel.TextSize = 13
SpeedLabel.Parent = MainFrame
local SpeedInput = Instance.new("TextBox")
SpeedInput.Size = UDim2.new(0.85, 0, 0, 30)
SpeedInput.Position = UDim2.new(0.075, 0, 0.4, 0)
SpeedInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SpeedInput.Text = "Speed 1-300"
SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInput.Font = Enum.Font.Gotham
SpeedInput.TextSize = 12
SpeedInput.Parent = MainFrame
Instance.new("UICorner", SpeedInput).CornerRadius = UDim.new(0, 4)
local btnSafe = Instance.new("TextButton")
btnSafe.Size = UDim2.new(0.85, 0, 0, 35)
btnSafe.Position = UDim2.new(0.075, 0, 0.55, 0)
btnSafe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
btnSafe.Text = "TP SAFEZONE"
btnSafe.TextColor3 = Color3.fromRGB(255, 255, 255)
btnSafe.Font = Enum.Font.GothamBold
btnSafe.TextSize = 13
btnSafe.Parent = MainFrame
Instance.new("UICorner", btnSafe).CornerRadius = UDim.new(0, 4)
local btnPerfect = Instance.new("TextButton")
btnPerfect.Size = UDim2.new(0.85, 0, 0, 40)
btnPerfect.Position = UDim2.new(0.075, 0, 0.75, 0)
btnPerfect.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
btnPerfect.Text = "PERFECT"
btnPerfect.Font = Enum.Font.GothamBold
btnPerfect.TextSize = 16
btnPerfect.Parent = MainFrame
Instance.new("UICorner", btnPerfect).CornerRadius = UDim.new(0, 4)
task.spawn(function()
while true do
local hue = tick() % 3 / 3
btnPerfect.TextColor3 = Color3.fromHSV(hue, 0.8, 1)
RunService.Heartbeat:Wait()
end
end)
btnSafe.MouseButton1Click:Connect(function()
local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
if not root then return end
local inputVal = tonumber(SpeedInput.Text:match("%d+")) or 300
local speed = math.clamp(inputVal, 1, 300)
btnSafe.Active = false
btnSafe.Text = "MOVING..."
local target1 = Vector3.new(625.43, -4, 228.82)
while (root.Position - target1).Magnitude > 1.5 do
local dt = task.wait()
root.CFrame = root.CFrame + ((target1 - root.Position).Unit * (speed * dt))
root.CFrame = CFrame.new(root.Position, target1)
end
task.wait(0.1)
root.CFrame = CFrame.new(682.71, 29, 231.2)
btnSafe.Text = "TP SAFEZONE"
btnSafe.Active = true
end)
local isRunningPerfect = false
btnPerfect.MouseButton1Click:Connect(function()
if isRunningPerfect then return end
isRunningPerfect = true
btnPerfect.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
if root then root.CFrame = CFrame.new(700.27, 7.07, 234.5) end
local vSize = workspace.CurrentCamera.ViewportSize
local targetX = vSize.X * 0.5
local targetY = vSize.Y * 0.8
task.wait(0.2)
for i = 1, 2 do
VirtualInputManager:SendMouseButtonEvent(targetX, targetY, 0, true, game, 0)
task.wait(0.05)
VirtualInputManager:SendMouseButtonEvent(targetX, targetY, 0, false, game, 0)
task.wait(0.5)
end
btnPerfect.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
isRunningPerfect = false
end)
