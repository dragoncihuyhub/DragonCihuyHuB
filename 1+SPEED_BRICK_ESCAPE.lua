local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "DragonCihuy Hub",
    Icon = "star",
    Author = "DragonCihuy",
    Folder = "DragonCihuyHub",
    Size = UDim2.fromOffset(240, 425),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 120,
})

--// Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local UIS = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

--////////////////////////////////////////////////////
-- HOME
--////////////////////////////////////////////////////

local Home = Window:Tab({
    Title = "• Home",
})

Home:Paragraph({
    Title = "Developer",
    Desc = "DragonCihuy"
})

Home:Paragraph({
    Title = "DragonCihuy",
    Desc = "⭐Thanks for using my script on 1+ SBE. It's No Key Script⭐\n——————\nScript Executor Support\n-Delta\n-Krnl\n-Fluxus\n-Codex\n—————"
})

Home:Paragraph({
    Title = "Discord",
    Desc = "https://discord.gg/pKNwBgwn6"
})

--////////////////////////////////////////////////////
-- MAIN
--////////////////////////////////////////////////////

local Main = Window:Tab({
    Title = "• Main",
})

-- Auto Wins Toggle
local autoWins = false
Main:Toggle({
    Title = "Auto Wins",
    Callback = function(Value)
        autoWins = Value
        if autoWins then
            task.spawn(function()
                while autoWins do
                    local character = LocalPlayer.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        character.HumanoidRootPart.CFrame = CFrame.new(5129.87, 697.24, -2559.64)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Auto Rebirth Toggle
local autoRebirth = false
Main:Toggle({
    Title = "Auto Rebirth",
    Callback = function(Value)
        autoRebirth = Value
        if autoRebirth then
            task.spawn(function()
                while autoRebirth do
                    local rebirthRemote = ReplicatedStorage:FindFirstChild("BrickRebirthRequest")
                    if rebirthRemote then
                        rebirthRemote:FireServer()
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

-- Farm Brick Toggle (Teleport Loop)
local farmBrick = false
Main:Toggle({
    Title = "Farm Brick",
    Callback = function(Value)
        farmBrick = Value
        if farmBrick then
            task.spawn(function()
                while farmBrick do
                    local character = LocalPlayer.Character
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        character.HumanoidRootPart.CFrame = CFrame.new(88, 14, 64)
                    end
                    task.wait() -- Loop secepat mungkin tanpa membuat crash
                end
            end)
        end
    end
})

--////////////////////////////////////////////////////
-- PET
--////////////////////////////////////////////////////

local Pet = Window:Tab({
    Title = "• Pet",
})

Pet:Button({
    Title = "Basic Egg",
    Callback = function()
        local args = {
            "Basic",
            workspace:WaitForChild("Map"):WaitForChild("Lobby"):WaitForChild("Essential"):WaitForChild("EggsArea"):WaitForChild("Eggs"):WaitForChild("Hatching"),
            false
        }
        ReplicatedStorage:WaitForChild("PetsHatchRequest"):FireServer(unpack(args))
    end
})

Pet:Button({
    Title = "Jungle Egg",
    Callback = function()
        local args = {
            "Jungle",
            workspace:WaitForChild("Map"):WaitForChild("Lobby"):WaitForChild("Essential"):WaitForChild("EggsArea"):WaitForChild("Eggs"):WaitForChild("Hatching1"),
            false
        }
        ReplicatedStorage:WaitForChild("PetsHatchRequest"):FireServer(unpack(args))
    end
})

Pet:Button({
    Title = "Farm Egg",
    Callback = function()
        local args = {
            "Farm",
            workspace:WaitForChild("Map"):WaitForChild("Lobby"):WaitForChild("Essential"):WaitForChild("EggsArea"):WaitForChild("Eggs"):WaitForChild("Hatching2"),
            false
        }
        ReplicatedStorage:WaitForChild("PetsHatchRequest"):FireServer(unpack(args))
    end
})

Pet:Button({
    Title = "Sweet Egg",
    Callback = function()
        local args = {
            "Sweet",
            workspace:WaitForChild("Map"):WaitForChild("Lobby"):WaitForChild("Essential"):WaitForChild("EggsArea"):WaitForChild("Eggs"):WaitForChild("Hatching3"),
            false
        }
        ReplicatedStorage:WaitForChild("PetsHatchRequest"):FireServer(unpack(args))
    end
})

Pet:Button({
    Title = "Meka Egg",
    Callback = function()
        local args = {
            "Zoo",
            workspace:WaitForChild("Map"):WaitForChild("Lobby"):WaitForChild("Essential"):WaitForChild("EggsArea"):WaitForChild("Eggs"):WaitForChild("Hatching4"),
            false
        }
        ReplicatedStorage:WaitForChild("PetsHatchRequest"):FireServer(unpack(args))
    end
})

--////////////////////////////////////////////////////
-- DISCORD
--////////////////////////////////////////////////////

local DiscordTab = Window:Tab({
    Title = "• Discord",
})

DiscordTab:Button({
    Title = "Link Discord",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/pKNwBgwn6")
        elseif toclipboard then
            toclipboard("https://discord.gg/pKNwBgwn6")
        end
    end
})

DiscordTab:Paragraph({
    Title = "Dragoncihuy",
    Desc = "Don't Forget to Join Later will Add My Script.\n\nJangan Lupa Bergabung Discord Saya Akan Tambahin Script."
})
