--[[ 
    Dive Down Script - Full Rounded Edition
    Credit: @DragonCihuyRBLX 
]]

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Credit = Instance.new("TextLabel")
local ToggleBtn = Instance.new("TextButton")
local Scroll = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UICornerMain = Instance.new("UICorner")
local UICornerToggle = Instance.new("UICorner")

-- Setup UI Parent
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "DiveDown_Rounded"

-- Main Window (Hitam, Pendek, Sangat Bulat & Draggable)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -90, 0.5, -75)
MainFrame.Size = UDim2.new(0, 180, 0, 160) 
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true 

-- Membuat Sudut Kotak Sangat Bulat (Rounded)
UICornerMain.CornerRadius = UDim.new(0, 20)
UICornerMain.Parent = MainFrame

-- Tombol Toggle Bulat (Posisi: Atas Kanan Dikit, Terkunci di MainFrame)
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = MainFrame
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleBtn.Position = UDim2.new(1, -25, 0, -15) -- Atas Kanan Dikit
ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.Text = "[-]"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 20
ToggleBtn.ZIndex = 5

-- Membuat Tombol Toggle Menjadi Bulat Sempurna
UICornerToggle.CornerRadius = UDim.new(1, 0)
UICornerToggle.Parent = ToggleBtn

-- Judul Atas (Rounded)
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "DIVE DOWN"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 20)
TitleCorner.Parent = Title

-- Teks Bawah Kecil
Credit.Parent = MainFrame
Credit.Size = UDim2.new(1, 0, 0, 25)
Credit.Position = UDim2.new(0, 0, 1, -25)
Credit.Text = "YT : @DragonCihuyRBLX"
Credit.TextColor3 = Color3.fromRGB(180, 180, 180)
Credit.BackgroundTransparency = 1
Credit.Font = Enum.Font.SourceSansItalic
Credit.TextSize = 11

-- Container Tombol
Scroll.Parent = MainFrame
Scroll.Position = UDim2.new(0, 5, 0, 45)
Scroll.Size = UDim2.new(1, -10, 1, -75)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 0 
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

UIListLayout.Parent = Scroll
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local allButtons = {}

local function tp(x, y, z)
    local p = game.Players.LocalPlayer
    if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
        p.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
    end
end

local function createButton(txt, x, y, z)
    local btn = Instance.new("TextButton")
    local btnCorner = Instance.new("UICorner")
    
    btn.Parent = Scroll
    btn.Size = UDim2.new(0, 150, 0, 35)
    btn.Text = txt
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 13
    
    btnCorner.CornerRadius = UDim.new(0, 12) -- Tombol juga dibuat bulat
    btnCorner.Parent = btn
    
    table.insert(allButtons, btn)

    btn.MouseButton1Click:Connect(function()
        for _, b in pairs(allButtons) do
            b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            b.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        tp(x, y, z)
    end)
end

-- Isi Tombol
createButton("TP Prehistoric", -1928.31, -3908.14, -1425.81)
createButton("TP Back", -1942.25, 2540.74, -1420.8)

-- Logika Toggle
ToggleBtn.MouseButton1Click:Connect(function()
    local isVisible = not Scroll.Visible
    Scroll.Visible = isVisible
    Title.Visible = isVisible
    Credit.Visible = isVisible
    MainFrame.BackgroundTransparency = isVisible and 0 or 1
    ToggleBtn.Text = isVisible and "[-]" or "[+]"
end)
