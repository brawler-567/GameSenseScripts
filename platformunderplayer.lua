local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local UIS = game:GetService("UserInputService")

local function createPlatform()
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    local rootPart = character.HumanoidRootPart
    local position = rootPart.Position - Vector3.new(0, 3, 0) -- Платформа появляется немного ниже игрока
    
    local platform = Instance.new("Part")
    platform.Name = "PlayerPlatform"
    platform.Size = Vector3.new(5, 1, 5)
    platform.Position = position
    platform.Anchored = true
    platform.CanCollide = true
    platform.Transparency = 0.5  -- Полупрозрачная для визуального удобства
    platform.Color = Color3.fromRGB(0, 170, 255)  -- Голубой цвет
    platform.Parent = workspace
    
    -- Автоматическое удаление через 5 секунд
    game:GetService("Debris"):AddItem(platform, 5)
end

UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end  -- Игнорируем, если ввод обрабатывается GUI
    
    if input.KeyCode == Enum.KeyCode.Z then
        createPlatform()
    end
end)
