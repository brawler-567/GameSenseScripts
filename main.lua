game.StarterGui:SetCore("SendNotification", {
    Title = "Welcome",
    Text = "Execute is success",
    Duration = 2
})
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
    end
end)

local RS = game:GetService("ReplicatedStorage")

while true do
  RS.SendRush:Destroy()
  RS.SendWorm:Destroy()
  RS.eyegui:Destroy()
  RS.smilegui:Destroy()
  RS.SendGoatman:Destroy()
  RS.SendSorrow:Destroy()
end

while true do
  RS.elkman:Destroy()
  RS.Worm:Destroy()
end

while true do
  RS.QuickNotes.Eye:Destroy()
  RS.QuickNotes.EyePrime:Destroy()
  RS.QuickNotes.SlugFish:Destroy()
  RS.QuickNotes.Rush:Destroy()
  RS.QuickNotes.elkman:Destroy()
  RS.QuickNotes.Sorrow:Destroy()
end
