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

while true do 
  ReplicatedStorage.SendRush:Destroy()
  ReplicatedStorage.SendWorm:Destroy()
  ReplicatedStorage.eyegui:Destroy()
  ReplicatedStorage.smilegui:Destroy()
  ReplicatedStorage.SendGoatman:Destroy()
  ReplicatedStorage.SendSorrow
end

while true do 
  ReplicatedStorage.elkman:Destroy()
  ReplicatedStorage.Worm:Destroy()
end

while true do 
  ReplicatedStorage.QuickNotes.Eye:Destroy()
  ReplicatedStorage.QuickNotes.EyePrime:Destroy()
  ReplicatedStorage.QuickNotes.SlugFish:Destroy()
  ReplicatedStorage.QuickNotes.Rush:Destroy()
  ReplicatedStorage.QuickNotes.elkman:Destroy()
  ReplicatedStorage.QuickNotes.Sorrow:Destroy()
end
