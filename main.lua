game.StarterGui:SetCore("SendNotification", {
                Title = "Welcome",
                Text = "Execute is success",
                Duration = 2
end
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
        game.ReplicatedStorage.SendRush.Carnation.tinnitus.Playing = false
    end
end)

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local function delEyeGui()
    local model = localPlayer:WaitForChild("PlayerGui"):WaitForChild("eyegui")
    if model then
        model:Destroy()
    end
end

local function delSmileGui()
    local model = localPlayer:WaitForChild("PlayerGui"):WaitForChild("smilegui")
    if model then
        model:Destroy()
    end
end

local function delFGO()
    local model = localPlayer:WaitForChild("PlayerGui"):WaitForChild("GOATPORT")
    if model then
        model:Destroy()
    end
end
