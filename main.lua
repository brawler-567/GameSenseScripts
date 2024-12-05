workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("ParticleEmitter") then
        descendant.Rate = descendant.Rate * 10
    end
end)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "base" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant.Position = player.Character.HumanoidRootPart.Position

            game.StarterGui:SetCore("SendNotification", {
                Title = "levers moved",
                Text = "door has been opened",
                Duration = 3
            })
        end
    end
end)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "eye" or descendant.Name == "elkman" or descendant.Name == "Rush" or descendant.Name == "Worm" or descendant.Name == "eyePrime" then
        descendant:Destroy()
    end
end)

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

while true do
    local eyeGui = localPlayer:FindFirstChild("PlayerGui"):FindFirstChild("eyegui")
    if eyeGui then
        eyeGui:Destroy()
    end
    task.wait(0.1)
end

while true do
    local smileGui = localPlayer:FindFirstChild("PlayerGui"):FindFirstChild("smilegui")
    if smileGui then
        smileGui:Destroy()
    end
    task.wait(0.1)
end

while true do
    local funnygoatman = localPlayer:FindFirstChild("PlayerGui"):FindFirstChild("GOATPORT")
    if funnygoatman then
        funnygoatman:Destroy()
    end
    task.wait(0.1)
end
