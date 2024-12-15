local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player.PlayerGui

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui
ScreenGui.Name = tpSG

local button = Instance.new("TextButton")
button.Name = button
button.Parent = tpSG
button.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
button.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
button.BorderSizePixel = 2
button.Position = UDim2.new(0.152380958, 0, 0.374192119, 0)
button.Size = UDim2.new(0, 146, 0, 36)
button.Font = Enum.Font.Highway
button.FontSize = Enum.FontSize.Size28
button.Text = "Toggle"
button.TextColor3 = Color3.new(1, 1, 1)
button.TextSize = 25
button.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)

local camera = game.Workspace.CurrentCamera

button.MouseButton1Click:Connect(function()
    -- Получаем позицию игрока и направление взгляда
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    if humanoidRootPart then
        local direction = camera.CFrame.LookVector  -- Направление взгляда камеры
        local teleportDistance = 10
        local newPosition = humanoidRootPart.Position + (direction * teleportDistance)

        -- Устанавливаем новую позицию игрока
        humanoidRootPart.CFrame = CFrame.new(newPosition, newPosition + direction)
    end
end)
