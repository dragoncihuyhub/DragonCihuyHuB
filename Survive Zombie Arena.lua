local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
	Name = "DragonCihuy Hub | Survive Zombie Arena",
	LoadingTitle = "DragonCihuy Hub",
	LoadingSubtitle = "by DragonCihuy",
	ConfigurationSaving = {Enabled = false},
	Discord = {Enabled = false, Invite = ""},
	KeySystem = false
})

local MainTab = Window:CreateTab("Main")
local MiscTab = Window:CreateTab("Misc")
local LPTab = Window:CreateTab("Local Player")
local DiscTab = Window:CreateTab("Discord")

local P = game:GetService("Players")
local R = game:GetService("ReplicatedStorage")
local L = P.LocalPlayer
local VU = game:GetService("VirtualUser")
local LP = game:GetService("Lighting")

local FarmActive = false
local FastCleanActive = false
local TakutActive = false
local AntiAfkActive = false
local NoclipActive = false
local InfJumpActive = false
local WalkActive = false
local JumpActive = false
local WSValue = 16
local JPValue = 50

local function H()
	local M = L.Character and L.Character:FindFirstChildOfClass("Humanoid")
	if M and FarmActive then M.HipHeight = 25 end
end
L.CharacterAdded:Connect(function()
	task.wait(1)
	if FarmActive then H() end
end)

MainTab:CreateToggle({
	Name = "Farm Instant Aura Kill",
	CurrentValue = false,
	Callback = function(Value)
		FarmActive = Value
		if FarmActive then
			H()
			task.spawn(function()
				local Z = require(L.PlayerScripts.Controllers.ZombieClient).Zombies
				if type(Z) ~= "table" then
					for _, v in pairs(getgc(true)) do
						if type(v) == "table" and rawget(v, "Zombies") and rawget(v, "ZombieModels") then
							Z = v.Zombies
							break
						end
					end
				end
				local D = R.ZombieRemotes.ZombieDamage
				while FarmActive and task.wait(.2) do
					H()
					for id, data in pairs(Z) do
						if data and not data.IsDying and data.Health > 0 then
							D:FireServer(id, math.huge)
						end
					end
				end
			end)
		else
			local M = L.Character and L.Character:FindFirstChildOfClass("Humanoid")
			if M then M.HipHeight = 0 end
		end
	end
})

MainTab:CreateToggle({
	Name = "Fast Cleanerd Waves",
	CurrentValue = false,
	Callback = function(Value)
		FastCleanActive = Value
		if FastCleanActive then
			if L.Character and L.Character:FindFirstChild("HumanoidRootPart") then
				L.Character.HumanoidRootPart.CFrame = CFrame.new(-1.31, -160.5, 8.49)
			end
			local p = Instance.new("Part")
			p.Name = "CleanPart"
			p.Size = Vector3.new(98, 1, 97)
			p.Position = Vector3.new(-1.31, -160.5, 8.49)
			p.Color = Color3.new(1, 1, 1)
			p.Transparency = -10
			p.Anchored = true
			p.Parent = workspace
		else
			local p = workspace:FindFirstChild("CleanPart")
			if p then p:Destroy() end
			if L.Character and L.Character:FindFirstChild("HumanoidRootPart") then
				L.Character.HumanoidRootPart.CFrame = CFrame.new(-241.55, 501.05, -358.95)
			end
		end
	end
})

MainTab:CreateLabel("Takut Ketahuan Is Meaning : Afraid of Being Caught")

MainTab:CreateToggle({
	Name = "Takut Ketahuan?",
	CurrentValue = false,
	Callback = function(Value)
		TakutActive = Value
		if L.Character and L.Character:FindFirstChild("HumanoidRootPart") then
			if TakutActive then
				L.Character.HumanoidRootPart.CFrame = CFrame.new(-241.55, 610.55, -358.95)
			else
				L.Character.HumanoidRootPart.CFrame = CFrame.new(-241.55, 501.05, -358.95)
			end
		end
	end
})

MiscTab:CreateToggle({
	Name = "Anti-Afk",
	CurrentValue = false,
	Callback = function(Value)
		AntiAfkActive = Value
		if AntiAfkActive then
			L.Idled:Connect(function()
				if AntiAfkActive then
					VU:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
					task.wait(1)
					VU:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
				end
			end)
		end
	end
})

local OrigBright = LP.Brightness
local OrigShadow = LP.GlobalShadows
local OrigTime = LP.ClockTime
MiscTab:CreateToggle({
	Name = "Full Bright",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			LP.Brightness = 2
			LP.GlobalShadows = false
			LP.ClockTime = 14
		else
			LP.Brightness = OrigBright
			LP.GlobalShadows = OrigShadow
			LP.ClockTime = OrigTime
		end
	end
})

local OrigFog = LP.FogEnd
MiscTab:CreateToggle({
	Name = "No Fog",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			LP.FogEnd = 999999
		else
			LP.FogEnd = OrigFog
		end
	end
})

MiscTab:CreateToggle({
	Name = "Noclip",
	CurrentValue = false,
	Callback = function(Value)
		NoclipActive = Value
		game:GetService("RunService").Stepped:Connect(function()
			if NoclipActive and L.Character then
				for _, v in pairs(L.Character:GetChildren()) do
					if v:IsA("BasePart") then v.CanCollide = false end
				end
			end
		end)
	end
})

MiscTab:CreateToggle({
	Name = "FPS Booster",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			for _, v in pairs(workspace:GetDescendants()) do
				if v:IsA("PostEffect") or v:IsA("Explosion") or v:IsA("Sparkles") then
					v.Enabled = false
				elseif v:IsA("Decal") or v:IsA("Texture") then
					v:Destroy()
				end
			end
		end
	end
})

local ESPs = {}
LPTab:CreateToggle({
	Name = "Esp Player",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			for _, p in pairs(P:GetPlayers()) do
				if p ~= L and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
					local b = Instance.new("BillboardGui", p.Character.HumanoidRootPart)
					b.Size = UDim2.new(0, 200, 0, 50)
					b.AlwaysOnTop = true
					b.ExtentsOffset = Vector3.new(0, 3, 0)
					local t = Instance.new("TextLabel", b)
					t.Size = UDim2.new(1, 0, 1, 0)
					t.BackgroundTransparency = 1
					t.TextColor3 = Color3.new(1, 1, 1)
					t.TextStrokeTransparency = 0
					table.insert(ESPs, b)
					task.spawn(function()
						while Value and p.Character and p.Character:FindFirstChild("Humanoid") do
							t.Text = p.Name .. " [" .. math.floor(p.Character.Humanoid.Health) .. "]"
							task.wait(0.5)
						end
					end)
				end
			end
		else
			for _, v in pairs(ESPs) do if v then v:Destroy() end end
			ESPs = {}
		end
	end
})

LPTab:CreateToggle({
	Name = "InfJump",
	CurrentValue = false,
	Callback = function(Value)
		InfJumpActive = Value
		game:GetService("UserInputService").JumpRequest:Connect(function()
			if InfJumpActive and L.Character and L.Character:FindFirstChildOfClass("Humanoid") then
				L.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			end
		end)
	end
})

LPTab:CreateToggle({
	Name = "WalkSpeed",
	CurrentValue = false,
	Callback = function(Value)
		WalkActive = Value
		task.spawn(function()
			while WalkActive and task.wait() do
				if L.Character and L.Character:FindFirstChildOfClass("Humanoid") then
					L.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = WSValue
				end
			end
			if not WalkActive and L.Character and L.Character:FindFirstChildOfClass("Humanoid") then
				L.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
			end
		end)
	end
})

LPTab:CreateSlider({
	Name = "Set WalkSpeed",
	Range = {1, 1000},
	Increment = 1,
	CurrentValue = 16,
	Callback = function(Value)
		WSValue = Value
	end
})

LPTab:CreateToggle({
	Name = "Jumppower",
	CurrentValue = false,
	Callback = function(Value)
		JumpActive = Value
		task.spawn(function()
			while JumpActive and task.wait() do
				if L.Character and L.Character:FindFirstChildOfClass("Humanoid") then
					L.Character:FindFirstChildOfClass("Humanoid").UseJumpPower = true
					L.Character:FindFirstChildOfClass("Humanoid").JumpPower = JPValue
				end
			end
			if not JumpActive and L.Character and L.Character:FindFirstChildOfClass("Humanoid") then
				L.Character:FindFirstChildOfClass("Humanoid").JumpPower = 50
			end
		end)
	end
})

LPTab:CreateSlider({
	Name = "Set Jumppower",
	Range = {50, 1000},
	Increment = 1,
	CurrentValue = 50,
	Callback = function(Value)
		JPValue = Value
	end
})

DiscTab:CreateButton({
	Name = "Discord",
	Callback = function()
		setclipboard("https://discord.gg/pKNwBgwn6")
		Rayfield:Notify({
			Title = "Copied",
			Content = "Link Discord berhasil disalin!",
			Duration = 3,
			Image = 4483362458,
		})
	end
})

DiscTab:CreateLabel("Don't Forget to Join Later will Add My Script.")
DiscTab:CreateLabel("Jangan Lupa Bergabung Discord Saya Akan Tambahin Script.")
