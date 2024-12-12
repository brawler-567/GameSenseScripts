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
            task.wait(1)
            descendant.CFrame = player.Character.HumanoidRootPart.CFrame
            task.wait(1)
            descendant.CFrame = player.Character.HumanoidRootPart.CFrame
        end
    end
end)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "eye" or descendant.Name == "elkman" or descendant.Name == "Rush" or descendant.Name == "Worm" or descendant.Name == "eyePrime" then
        descendant:Destroy()
    end
end)

local RS = game:GetService("ReplicatedStorage")

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
    local SmileGui = plr:FindFirstChild("PlayerGui"):FindFirstChild("smilegui")
    if SmileGui then
        SmileGui:Destroy() 
    end
    task.wait(0.1)
end












                hg = Instance.new("Highlight", v.Door.Door)
                hg.FillColor = Color3.fromRGB(241, 196, 15)
                hg.FillTransparency = 0.5
    
                bb = Instance.new('BillboardGui', v.Door.Door)
                bb.Adornee = v.Door.Door
                bb.ExtentsOffset = Vector3.new(0, 1, 0)
                bb.AlwaysOnTop = true
                bb.Size = UDim2.new(0, 6, 0, 6)
                bb.StudsOffset = Vector3.new(0, 1, 0)
                bb.Name = "BillBoard"
    
                txtlbl = Instance.new('TextLabel', bb)
                txtlbl.ZIndex = 10
                txtlbl.BackgroundTransparency = 1
                txtlbl.Position = UDim2.new(0, 0, 0, -45)
                txtlbl.Size = UDim2.new(1, 0, 10, 0)
                txtlbl.Font = 'ArialBold'
                txtlbl.FontSize = 'Size12'
                txtlbl.Text = "Door " .. v.Name
                txtlbl.TextStrokeTransparency = 0.5
                txtlbl.TextColor3 = Color3.fromRGB(241, 196, 15)
    
                txtlbl2 = Instance.new('TextLabel', bb)
                txtlbl2.ZIndex = 10
                txtlbl2.BackgroundTransparency = 1
                txtlbl2.Position = UDim2.new(0, 0, 0, -15)
                txtlbl2.Size = UDim2.new(1, 0, 10, 0)
                txtlbl2.Font = 'ArialBold'
                txtlbl2.FontSize = 'Size12'
                txtlbl2.Text = "? Studs"
                txtlbl2.Name = "Dist"
                txtlbl2.TextStrokeTransparency = 0.5
                txtlbl2.TextColor3 = Color3.fromRGB(241, 196, 15)
