local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local SG = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local saveButton = Instance.new("TextButton")
local teleportButton = Instance.new("TextButton")
local player = Players.LocalPlayer

SG.Name = "SG"
SG.Parent = game.CoreGui

BG.Name = "BG"
BG.Parent = SG
BG.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
BG.Size = UDim2.new(0, 210, 0, 127)
BG.Active = true
BG.Draggable = true

Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 210, 0, 33)
Title.Font = Enum.Font.Highway
Title.Text = "By Z1dex"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.FontSize = Enum.FontSize.Size32
Title.TextSize = 30
Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Title.TextStrokeTransparency = 0

saveButton.Parent = BG
saveButton.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
saveButton.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
saveButton.BorderSizePixel = 2
saveButton.Position = UDim2.new(0.152380958, 0, 0.314192119, 0)
saveButton.Size = UDim2.new(0, 146, 0, 36)
saveButton.Font = Enum.Font.Highway
saveButton.FontSize = Enum.FontSize.Size28
saveButton.Text = "save"
saveButton.TextColor3 = Color3.new(1, 1, 1)
saveButton.TextSize = 25
saveButton.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
saveButton.TextStrokeTransparency = 0

teleportButton.Parent = BG
teleportButton.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
teleportButton.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
teleportButton.BorderSizePixel = 2
teleportButton.Position = UDim2.new(0.152380958, 0, 0.684192119, 0)
teleportButton.Size = UDim2.new(0, 146, 0, 36)
teleportButton.Font = Enum.Font.Highway
teleportButton.FontSize = Enum.FontSize.Size28
teleportButton.Text = "tp"
teleportButton.TextColor3 = Color3.new(1, 1, 1)
teleportButton.TextSize = 25
teleportButton.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
teleportButton.TextStrokeTransparency = 0

local savedCFrame = nil

local function saveCFrame()
    local currentCFrame = player.Character.HumanoidRootPart.CFrame
    savedCFrame = currentCFrame
end

local function teleportPlayer()
    if savedCFrame then
        player.Character.HumanoidRootPart.CFrame = savedCFrame
    end
end

saveButton.MouseButton1Click:Connect(saveCFrame)
teleportButton.MouseButton1Click:Connect(teleportPlayer)

