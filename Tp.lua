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
