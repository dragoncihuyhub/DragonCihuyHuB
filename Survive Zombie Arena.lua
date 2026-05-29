local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "DragonCihuy Hub | SZA",
    Icon = "star",
    Author = "DragonCihuy",
    Folder = "DragonCihuyHub",
    Size = UDim2.fromOffset(240, 425),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 120,
})
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Home = Window:Tab({
    Title = "• Home",
})
Home:Paragraph({
    Title = "Developer",
    Desc = "DragonCihuy"
})
Home:Paragraph({
    Title = "DragonCihuy",
    Desc = "⭐Thanks for using my script on SZA. It's No Key Script⭐\n——————\nScript Executor Support\n-Delta\n-Krnl\n-Fluxus\n-Codex\n—————"
})
Home:Paragraph({
    Title = "Discord",
    Desc = "https://discord.gg/pKNwBgwn6"
})
local Main = Window:Tab({
    Title = "• Main"
})
local Aura = false
local AuraThread
Main:Toggle({
    Title = "Instant Aura Kill",
    Value = false,
    Callback = function(v)
        Aura = v
        if Aura then
            AuraThread = task.spawn(function()
                local P=game:GetService("Players")
                local R=game:GetService("ReplicatedStorage")
                local L=P.LocalPlayer
                local Z=require(L.PlayerScripts.Controllers.ZombieClient).Zombies
                if type(Z)~="table" then
	                for _,v in pairs(getgc(true)) do
		                if type(v)=="table" and rawget(v,"Zombies") and rawget(v,"ZombieModels") then
			                Z=v.Zombies
			                break
		                end
	                end
                end
                local D=R.ZombieRemotes.ZombieDamage
                local function H()
	                local M=L.Character and L.Character:FindFirstChildOfClass("Humanoid")
	                if M then M.HipHeight=0.01 end
                end
                H()
                L.CharacterAdded:Connect(function()
                    task.wait(1)
                    H()
                end)
                while Aura do
                    task.wait(.1)
                    H()
                    for id,data in pairs(Z) do
                        if data and not data.IsDying and data.Health > 0 then
                            D:FireServer(id, math.huge)
                        end
                    end
                end
            end)
        end
    end
})
local FastWave = false
local WavePart
Main:Toggle({
    Title = "Fast Clean Waves",
    Value = false,
    Callback = function(v)
        FastWave = v
        if v then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1.31, -158.5, 8.49)
            end
            WavePart = Instance.new("Part")
            WavePart.Size = Vector3.new(200,1,200)
            WavePart.Position = Vector3.new(-1.31,-160.5,8.49)
            WavePart.Anchored = true
            WavePart.Transparency = 0.10
            WavePart.Color = Color3.fromRGB(255,255,255)
            WavePart.CanCollide = true
            WavePart.CanTouch = true
            WavePart.Name = "DragonWavePart"
            WavePart.Parent = workspace
        else
            if WavePart then
                WavePart:Destroy()
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-241.55,500.05,-358.95)
            end
        end
    end
})
local SafeWave = false
local SafePart
Main:Toggle({
    Title = "Safe Wave",
    Value = false,
    Callback = function(v)
        SafeWave = v
        if v then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-241.55,503.55,-358.95)
            end
            SafePart = Instance.new("Part")
            SafePart.Size = Vector3.new(50,2,50)
            SafePart.Position = Vector3.new(-241.55,501.55,-358.95)
            SafePart.Anchored = true
            SafePart.Transparency = 0.1
            SafePart.Color = Color3.fromRGB(255,255,255)
            SafePart.CanCollide = true
            SafePart.CanTouch = true
            SafePart.Name = "DragonSafePart"
            SafePart.Parent = workspace
        else
            if SafePart then
                SafePart:Destroy()
            end
        end
    end
})
local Misc = Window:Tab({
    Title = "• Misc"
})
Misc:Toggle({
    Title = "Anti-Afk",
    Value = false,
    Callback = function(v)
        if v then
            LocalPlayer.Idled:Connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end
})
local OldBrightness = Lighting.Brightness
local OldClock = Lighting.ClockTime
local OldFog = Lighting.FogEnd
local OldShadow = Lighting.GlobalShadows
Misc:Toggle({
    Title = "Full Bright",
    Value = false,
    Callback = function(v)
        if v then
            Lighting.Brightness = 5
            Lighting.ClockTime = 12
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
        else
            Lighting.Brightness = OldBrightness
            Lighting.ClockTime = OldClock
            Lighting.FogEnd = OldFog
            Lighting.GlobalShadows = OldShadow
        end
    end
})
Misc:Toggle({
    Title = "No Fog",
    Value = false,
    Callback = function(v)
        if v then
            Lighting.FogEnd = 9e9
        else
            Lighting.FogEnd = OldFog
        end
    end
})
Misc:Toggle({
    Title = "Auto Execute",
    Value = false,
    Callback = function(v)
        if v then
            StarterGui:SetCore("SendNotification",{
                Title = "DragonCihuy Hub",
                Text = "Auto Execute Enabled",
                Duration = 5
            })
        end
    end
})
Misc:Button({
    Title = "FPS Booster",
    Callback = function()
        local Lighting = game:GetService("Lighting")
        local Terrain = workspace:FindFirstChildOfClass("Terrain")
        for _,v in pairs(game:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                v.Enabled = false
            end
            if v:IsA("Explosion") then
                v.BlastPressure = 0
                v.BlastRadius = 0
            end
            if v:IsA("BasePart") then
                v.Material = Enum.Material.Plastic
                v.Reflectance = 0
            end
        end
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.Brightness = 1
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        if Terrain then
            Terrain.WaterWaveSize = 0
            Terrain.WaterWaveSpeed = 0
            Terrain.WaterReflectance = 0
            Terrain.WaterTransparency = 0
        end
        for _,v in pairs(game:GetDescendants()) do
            if v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            end
        end
        print("Anti Lag")
    end
})
local PlayerTab = Window:Tab({
    Title = "• Local Player"
})
local ESPEnabled = false
local ESPFolder = Instance.new("Folder", game.CoreGui)
local function CreateESP(plr)
    if plr == LocalPlayer then return end
    local Highlight = Instance.new("Highlight")
    Highlight.Name = plr.Name
    Highlight.FillTransparency = 0.5
    Highlight.OutlineTransparency = 0
    Highlight.Parent = ESPFolder
    local function Update()
        if plr.Character then
            Highlight.Adornee = plr.Character
            local Hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if Hum then
                if Hum.Health <= 0 then
                    Highlight.FillColor = Color3.fromRGB(255,0,0)
                else
                    Highlight.FillColor = Color3.fromRGB(0,255,0)
                end
            end
        end
    end
    Update()
    plr.CharacterAdded:Connect(function()
        task.wait(1)
        Update()
    end)
    RunService.RenderStepped:Connect(Update)
end
PlayerTab:Toggle({
    Title = "Esp Player",
    Value = false,
    Callback = function(v)
        ESPEnabled = v
        if v then
            for _,p in pairs(Players:GetPlayers()) do
                CreateESP(p)
            end
        else
            ESPFolder:ClearAllChildren()
        end
    end
})
local InfJump = false
PlayerTab:Toggle({
    Title = "InfJump",
    Value = false,
    Callback = function(v)
        InfJump = v
    end
})
UIS.JumpRequest:Connect(function()
    if InfJump then
        local Hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if Hum then
            Hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
local Noclip = false
PlayerTab:Toggle({
    Title = "Noclip",
    Value = false,
    Callback = function(v)
        Noclip = v
    end
})
RunService.Stepped:Connect(function()
    if Noclip and LocalPlayer.Character then
        for _,v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)
local WS = 16
local WSLoop = false
PlayerTab:Toggle({
    Title = "WalkSpeed",
    Value = false,
    Callback = function(v)
        WSLoop = v
    end
})
PlayerTab:Slider({
    Title = "Set WalkSpeed",
    Step = 1,
    Value = {
        Min = 1,
        Max = 1000,
        Default = 16,
    },
    Callback = function(v)
        WS = v
    end
})
RunService.RenderStepped:Connect(function()
    if WSLoop then
        local Hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if Hum then
            Hum.WalkSpeed = WS
        end
    end
end)
local JP = 50
local JPLoop = false
PlayerTab:Toggle({
    Title = "Jumppower",
    Value = false,
    Callback = function(v)
        JPLoop = v
    end
})
PlayerTab:Slider({
    Title = "Set Jumppower",
    Step = 1,
    Value = {
        Min = 50,
        Max = 1000,
        Default = 50,
    },
    Callback = function(v)
        JP = v
    end
})
RunService.RenderStepped:Connect(function()
    if JPLoop then
        local Hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if Hum then
            Hum.UseJumpPower = true
            Hum.JumpPower = JP
        end
    end
end)
local Discord = Window:Tab({
    Title = "• Discord"
})
Discord:Button({
    Title = "Link Discord",
    Callback = function()
        setclipboard("https://discord.gg/pKNwBgwn6")
        StarterGui:SetCore("SendNotification",{
            Title = "DragonCihuy Hub",
            Text = "Discord Link Copied!",
            Duration = 5
        })
    end
})
Discord:Paragraph({
    Title = "DragonCihuy",
    Desc = "Don't Forget to Join Later will Add My Script.\n\nJangan Lupa Bergabung Discord Saya Akan Tambahin Script."
})
