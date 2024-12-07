game.StarterGui:SetCore("SendNotification", {
Title = "Welcome",
Text = "Script has been executed",
Duration = 3
})
workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("ParticleEmitter") then
        descendant.Rate = descendant.Rate * 6
    end
end)

local Players = game:GetService ("Players")
local plr = Players.LocalPlayer

-- Создаем GuiButton
local toggleButton = Instance.new("GuiButton")
toggleButton.Parent = game.StarterGui.ScreenGui
toggleButton.Text = "fb"
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(0, 100, 0, 100)
toggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
toggleButton.AutoButtonColor = false

-- Связываем событие "Activated" с функцией, которая включает или выключает функционал
local function toggleFunction()
    -- Здесь вы можете включить или выключить функционал, например показать или скрыть форму
    hg = Instance.new("Highlight")
    hg.Parent = plr:FindFirstChild("PlayerGui")
    hg.Visible = not hg.Visible
end
toggleButton.Activated:Connect(toggleFunction)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "base" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant.CFrame = player.Character.HumanoidRootPart.CFrame

            game.StarterGui:SetCore("SendNotification", {
                Title = "levers moved",
                Text = "door has been opened",
                Duration = 1
            })
        end
    end
end)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "eye" then
        game.StarterGui:SetCore("SendNotification", {
        Title = "eye",
        Text = "eye has been spawned",
        Duration = 3
        })
    end
end)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "elkman" then
        game.StarterGui:SetCore("SendNotification", {
        Title = "elkman",
        Text = "elkman has been spawned",
        Duration = 3
        })
    end
end)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "Rush" then
        game.StarterGui:SetCore("SendNotification", {
        Title = "Rush",
        Text = "Rush has been spawned",
        Duration = 3
        })
    end
end)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "Worm" then
        game.StarterGui:SetCore("SendNotification", {
        Title = "Worm",
        Text = "Worm has been spawned",
        Duration = 3
        })
    end
end)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "eyePrime" then
        game.StarterGui:SetCore("SendNotification", {
        Title = "Red eye",
        Text = "Red eye has been spawned",
        Duration = 3
        })
    end
end)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "Sorrow" then
        game.StarterGui:SetCore("SendNotification", {
        Title = "Sorrow eye",
        Text = "Sorrow has been spawned",
        Duration = 3
        })
    end
end)

