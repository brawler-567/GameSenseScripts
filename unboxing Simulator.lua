local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

while true do
    wait(0.1)
    for i = 0, 210 do
        local success, model = pcall(function()
            return workspace[""]:GetChildren()[9]:GetChildren()[i]
        end)
        if success and model then
            humanoidRootPart.CFrame = model:GetPivot() * CFrame.new(0, 3, 0)
            break
        end
    end
end
