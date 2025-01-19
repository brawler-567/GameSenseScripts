local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function tp()
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local targetPosition = humanoidRootPart.Position + (humanoidRootPart.CFrame.lookAt(Vector3.new(0, 10, 0)) * Vector3.new(0, 0, 10))

    humanoidRootPart.CFrame = CFrame.new(targetPosition)
end

if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Z then
            tp()
        end
    end)
end

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local SG = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local saveButton = Instance.new("TextButton")


SG.Name = "SG"
SG.Parent = game.CoreGui

BG.Name = "BG"
BG.Parent = SG
BG.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
BG.Size = UDim2.new(0, 105, 0, 63,5) --210, 127
BG.Active = true
BG.Draggable = true

Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 105, 0, 16,5) --210 33
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
saveButton.Size = UDim2.new(0, 73, 0, 18) --146 36
saveButton.Font = Enum.Font.Highway
saveButton.FontSize = Enum.FontSize.Size28
saveButton.Text = "tp"
saveButton.TextColor3 = Color3.new(1, 1, 1)
saveButton.TextSize = 25
saveButton.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
saveButton.TextStrokeTransparency = 0

saveButton.MouseButton1Click:Connect(tp)
