game.StarterGui:SetCore("SendNotification", {
Title = "Welcome",
Text = "Script has been executed",
Duration = 3
})

workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("ParticleEmitter") then
        descendant.Rate = descendant.Rate * 10
    end
end)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "base" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant.CFrame = player.Character.HumanoidRootPart.CFrame

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
local ContextActionService = game:GetService("ContextActionService")

RS.eyegui:Destroy()
RS.smilegui:Destroy()
RS.SendRush:Destroy()
RS.SendWorm:Destroy()
RS.SendSorrow:Destroy()
RS.SendGoatman:Destroy()

task.wait(0.1)

RS.Worm:Destroy()
RS.elkman:Destroy()

task.wait(0.1)

RS.QuickNotes.Eye:Destroy()
RS.QuickNotes.Rush:Destroy()
RS.QuickNotes.Sorrow:Destroy()
RS.QuickNotes.elkman:Destroy()
RS.QuickNotes.EyePrime:Destroy()
RS.QuickNotes.SlugFish:Destroy()
RS.QuickNotes.FakeDoor:Destroy()
RS.QuickNotes.SleepyHead:Destroy()

while true do
    local players = game:GetService("Players")
    local plr = players.LocalPlayer
    local SmileGui = plr:WaitForChild("PlayerGui"):WaitForChild("smilegui")
    if SmileGui then
        SmileGui:Destroy() 
    end
    task.wait(0.1)
end

while true do
    ContextActionService:TriggerAction("EKey")
    wait(1)
end
