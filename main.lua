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
        game.StarterGui:SetCore("SendNotification", {
                Title = "entity detected",
                Text = "entity has been removed",
                Duration = 2.3
            })
        end
    end
end)

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local function deleyeGui()
    local eyeGui = localPlayer:FindFirstChild("PlayerGui"):FindFirstChild("eyegui")
    eyeGui:Destroy()
end
if eyeGui then
  deleyeGui()
  game.StarterGui:SetCore("SendNotification", {
                Title = "eyeGui detected",
                Text = "eyeGui has been removed",
                Duration = 2.3
            })
   end
end

local function delsmileGui()
    local smileGui = localPlayer:FindFirstChild("PlayerGui"):FindFirstChild("smileGui")
    smileGui:Destroy()
end
if smilegui then
  delsmileGui()
  game.StarterGui:SetCore("SendNotification", {
                Title = "smilefaceGui detected",
                Text = "smilefaceGui has been removed",
                Duration = 2.3
            })
   end
end

local function delfunnygoatman()
    local funnygoatman = localPlayer:FindFirstChild("PlayerGui"):FindFirstChild("GOATPORT")
    funnygoatman:Destroy()
end
if funnygoatman then
  delfunnygoatman()
  game.StarterGui:SetCore("SendNotification", {
                Title = "funnygoatmanGui detected",
                Text = "funnygoatmanGui has been removed",
                Duration = 2.3
            })
   end
end
