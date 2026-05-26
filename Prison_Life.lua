local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "DragonCihuy Hub | Prison Life",
   LoadingTitle = "DragonCihuy Hub Loading...",
   LoadingSubtitle = "by DragonCihuy",
   ConfigurationSaving = {Enabled = false, FolderName = nil, FileName = "DragonCihuyHubConfig"},
   Discord = {Enabled = false, Invite = "", RememberJoins = true},
   KeySystem = false
})
local TabWeapon = Window:CreateTab("Weapon & Go Criminals", 4483362458)
TabWeapon:CreateSection("Get Gun")
TabWeapon:CreateButton({
   Name = "MP5",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      local root = character:FindFirstChild("HumanoidRootPart")
      if root then
         root.CFrame = CFrame.new(813.76, 98, 2229.39)
         task.wait(0.9)
         root.CFrame = CFrame.new(818.88, 79, 2227.01)
         task.wait(0.3)
         root.CFrame = CFrame.new(916.48, 112.5, 2459.11)
      end
   end,
})
TabWeapon:CreateButton({
   Name = "M3 Shotgun",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      local root = character:FindFirstChild("HumanoidRootPart")
      if root then
         root.CFrame = CFrame.new(820.43, 98, 2229.39)
         task.wait(0.9)
         root.CFrame = CFrame.new(818.88, 79, 2227.01)
         task.wait(0.3)
         root.CFrame = CFrame.new(916.48, 112.5, 2459.11)
      end
   end,
})
TabWeapon:CreateSection("Criminals Team")
TabWeapon:CreateButton({
   Name = "Criminals",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      local root = character:FindFirstChild("HumanoidRootPart")
      if root then
         root.CFrame = CFrame.new(818.14, 98.44, 2046.46)
      end
   end,
})
local TabCharacter = Window:CreateTab("Character", 4483362458)
TabCharacter:CreateSection("Respawn")
TabCharacter:CreateButton({
   Name = "Respawn",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character
      if character and character:FindFirstChild("Humanoid") then
         character.Humanoid.Health = 0
      end
   end,
})
local TabMisc = Window:CreateTab("Misc & Combat", 4483362458)
TabMisc:CreateSection("ESP PLAYER")
local espEnabled = false
local espObjects = {}
local function createESP(plr)
   if plr == game.Players.LocalPlayer then return end
   local function addBillboard()
      local char = plr.Character or plr.CharacterAdded:Wait()
      local head = char:WaitForChild("Head", 5)
      local hum = char:WaitForChild("Humanoid", 5)
      if head and hum and not head:FindFirstChild("ESP_Billboard") then
         local bb = Instance.new("BillboardGui")
         bb.Name = "ESP_Billboard"
         bb.AlwaysOnTop = true
         bb.Size = UDim2.new(0, 200, 0, 50)
         bb.StudsOffset = Vector3.new(0, 2.5, 0)
         bb.Parent = head
         local label = Instance.new("TextLabel")
         label.Size = UDim2.new(1, 0, 1, 0)
         label.BackgroundTransparency = 1
         label.TextSize = 14
         label.Font = Enum.Font.SourceSansBold
         label.TextStrokeTransparency = 0
         label.Parent = bb
         local connection
         connection = game:GetService("RunService").RenderStepped:Connect(function()
            if not espEnabled or not plr.Character or not char:FindFirstChild("HumanoidRootPart") or not hum.Parent then
               bb:Destroy()
               connection:Disconnect()
               return
            end
            if plr.TeamColor then
               label.TextColor3 = plr.TeamColor.Color
            else
               label.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
            local myRoot = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local targetRoot = char:FindFirstChild("HumanoidRootPart")
            if myRoot and targetRoot then
               local distance = math.floor((myRoot.Position - targetRoot.Position).Magnitude)
               label.Text = string.format("Username: %s\nStuds: %d\nHealth: %.0f/%.0f", plr.Name, distance, hum.Health, hum.MaxHealth)
            else
               label.Text = plr.Name
            end
         end)
         table.insert(espObjects, bb)
      end
   end
   if plr.Character then task.spawn(addBillboard) end
   plr.CharacterAdded:Connect(function()
      if espEnabled then task.spawn(addBillboard) end
   end)
end
TabMisc:CreateToggle({
   Name = "ESP PLAYER",
   CurrentValue = false,
   Flag = "ESP_Toggle",
   Callback = function(Value)
      espEnabled = Value
      if espEnabled then
         for _, plr in pairs(game.Players:GetPlayers()) do
            createESP(plr)
         end
         game.Players.PlayerAdded:Connect(createESP)
      else
         for _, obj in pairs(espObjects) do
            if obj then obj:Destroy() end
         end
         espObjects = {}
      end
   end,
})
TabMisc:CreateSection("Hitbox")
local hitboxEnabled = false
local hitboxSize = 10
task.spawn(function()
   while true do
      task.wait(0.5)
      if hitboxEnabled then
         for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= game.Players.LocalPlayer and plr.Character then
               local root = plr.Character:FindFirstChild("HumanoidRootPart")
               if root then
                  root.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                  root.Transparency = 0.7
                  root.CanCollide = false
                  if plr.TeamColor then
                     root.Color = plr.TeamColor.Color
                  else
                     root.Color = Color3.fromRGB(255, 0, 0)
                  end
               end
            end
         end
      end
   end
end)
TabMisc:CreateToggle({
   Name = "Hitbox",
   CurrentValue = false,
   Flag = "Hitbox_Toggle",
   Callback = function(Value)
      hitboxEnabled = Value
      if not hitboxEnabled then
         for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= game.Players.LocalPlayer and plr.Character then
               local root = plr.Character:FindFirstChild("HumanoidRootPart")
               if root then
                  root.Size = Vector3.new(2, 2, 1)
                  root.Transparency = 0
                  root.CanCollide = true
               end
            end
         end
      end
   end,
})
TabMisc:CreateSlider({
   Name = "Hitbox Slider (5-15)",
   Range = {5, 15},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 10,
   Flag = "Hitbox_Slider",
   Callback = function(Value)
      hitboxSize = Value
   end,
})
TabMisc:CreateSection("Noclip")
local noclipEnabled = false
local noclipConnection
local hook = newcclosure(function() return end)
for _, obj in getgc(false) do 
   if typeof(obj) == "function" then 
      local source = debug.info(obj, "s")
      if source and source:find("CharacterCollision") then 
         hookfunction(obj, hook)
      end
   end
end
TabMisc:CreateToggle({
   Name = "NOCLIP",
   CurrentValue = false,
   Flag = "Noclip_Toggle",
   Callback = function(Value)
      noclipEnabled = Value
      if noclipEnabled then
         noclipConnection = game:GetService("RunService").Stepped:Connect(function()
            if noclipEnabled and game.Players.LocalPlayer.Character then
               for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                  if v:IsA("BasePart") and v.CanCollide then
                     v.CanCollide = false
                  end
               end
            end
         end)
      else
         if noclipConnection then
            noclipConnection:Disconnect()
         end
         if game.Players.LocalPlayer.Character then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
               if v:IsA("BasePart") then
                  v.CanCollide = true
               end
            end
         end
      end
   end,
})
TabMisc:CreateSection("Infjump")
local infJumpConnection
TabMisc:CreateToggle({
   Name = "Infjump",
   CurrentValue = false,
   Flag = "InfJump_Toggle",
   Callback = function(Value)
      if Value then
         infJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChildOfClass("Humanoid") then
               character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
         end)
      else
         if infJumpConnection then infJumpConnection:Disconnect() end
      end
   end,
})
TabMisc:CreateSection("Day Of Time")
TabMisc:CreateButton({
   Name = "Morning",
   Callback = function()
      game:GetService("Lighting").TimeOfDay = "07:30:00"
      game:GetService("Lighting").Brightness = 2.5
      game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(130, 130, 130)
      game:GetService("Lighting").ShadowSoftness = 0.2
   end,
})
TabMisc:CreateButton({
   Name = "Night",
   Callback = function()
      game:GetService("Lighting").TimeOfDay = "23:00:00"
      game:GetService("Lighting").Brightness = 1.8 
      game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(110, 110, 110)
   end,
})
TabMisc:CreateButton({
   Name = "Sunset",
   Callback = function()
      game:GetService("Lighting").TimeOfDay = "17:45:00"
      game:GetService("Lighting").Brightness = 3
      game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(255, 150, 80)
      game:GetService("Lighting").ShadowSoftness = 0.1
   end,
})
TabMisc:CreateSection("FullBright")
local fullBrightEnabled = false
local defaultBrightness = game:GetService("Lighting").Brightness
local defaultAmbient = game:GetService("Lighting").Ambient
TabMisc:CreateToggle({
   Name = "FullBright",
   CurrentValue = false,
   Flag = "FullBright_Toggle",
   Callback = function(Value)
      fullBrightEnabled = Value
      if fullBrightEnabled then
         game:GetService("Lighting").Brightness = 2
         game:GetService("Lighting").Ambient = Color3.fromRGB(255, 255, 255)
         game:GetService("Lighting").GlobalShadows = false
      else
         game:GetService("Lighting").Brightness = defaultBrightness
         game:GetService("Lighting").Ambient = defaultAmbient
         game:GetService("Lighting").GlobalShadows = true
      end
   end,
})
local TabServer = Window:CreateTab("Server", 4483362458)
TabServer:CreateSection("Server Management")
TabServer:CreateButton({
   Name = "Server Hop",
   Callback = function()
      local TeleportService = game:GetService("TeleportService")
      local HttpService = game:GetService("HttpService")
      local Servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
      for _, server in pairs(Servers.data) do
         if server.playing < server.maxPlayers and server.id ~= game.JobId then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, game.Players.LocalPlayer)
            break
         end
      end
   end,
})
TabServer:CreateButton({
   Name = "Rejoin",
   Callback = function()
      local TeleportService = game:GetService("TeleportService")
      TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
   end,
})
local TabDiscord = Window:CreateTab("discord", 4483362458)
TabDiscord:CreateSection("Community Links")
TabDiscord:CreateButton({
   Name = "discord",
   Callback = function()
      setclipboard("https://discord.gg/pKNwBgwn6")
      Rayfield:Notify({
         Title = "Link Copied!",
         Content = "Link invite server Discord berhasil disalin ke clipboard!",
         Duration = 3
      })
   end,
})
