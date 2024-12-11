local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "GameSense",
   Icon = 0,
   LoadingTitle = "Get Good Get GameSense",
   LoadingSubtitle = "by Z1dex",
   Theme = "Default",
      
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "GS"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "GameSense",
      Subtitle = "Key System",
      Note = "https://raw.githubusercontent.com/brawler-567/GameSenseScripts/refs/heads/main/key.txt",
      FileName = "Key",
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Fr3eWeek"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
--Tabs
local MainTab = Window:CreateTab("Main", "rewind")
local LegitTab = Window:CreateTab("legit", "rewind")
local AddonsTab = Window:CreateTab("Addons", "rewind")
--MainTab
local LeversMainSec = MainTab:CreateSection("Levers")
local LeversMain = MainTab:CreateButton({
   Name = "AutoLevers",
   Callback = function()
   workspace.DescendantAdded:Connect(function(descendant)
       if descendant.Name == "base" and descendant:IsA("BasePart") then
           local player = game.Players.LocalPlayer
           if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
               descendant.CFrame = player.Character.HumanoidRootPart.CFrame
               Rayfield:Notify({
                  Title = "Levers Activated",
                  Content = "Door has been opened!",
                 Duration = 1.5,
                 Image = "rewind",
               })
               task.wait(1)
               descendant.CFrame = player.Character.HumanoidRootPart.CFrame
               task.wait(1)
               descendant.CFrame = player.Character.HumanoidRootPart.CFrame
           end
       end
   end)
   end,
})

local RemoveEntitiesSec = MainTab:CreateSection("Remove Entities")
local RemoveEntitiesMain = MainTab:CreateButton({
   Name = "Remove all entities",
   Callback = function()
   local RS = game:GetService("ReplicatedStorage")
   descendant:Destroy()
   RS.eyegui:Destroy()
   RS.smilegui:Destroy()
   RS.SendRush:Destroy()
   RS.SendWorm:Destroy()
   RS.SendSorrow:Destroy()
   RS.SendGoatman:Destroy()
   RS.Worm:Destroy()
   RS.elkman:Destroy()
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
   end,
})



--Legit


local LeaverEspSec = LegitTab:CreateSection("LeverEsp")
local Toggle = Tab:CreateToggle({
   Name = "Toggle Example",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   workspace.DescendantAdded:Connect(function(descendant)
       if descendant.Name == "base" and descendant:IsA("BasePart") then
           local player = game.Players.LocalPlayer
           if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
               Rayfield:Notify({
                  Title = "Levers Activated",
                  Content = "Door has been opened!",
                 Duration = 1.5,
                 Image = "rewind",
               })
           end
       end
   end)
   end,
})


--Addons
local AddonsSec = AddonsTab:CreateSection("Addons")
local BoostFPS = AddonsTab:CreateSlider({
   Name = "BoostFPS",
   Range = {0, 10},
   Increment = 1,
   Suffix = "affects special effects",
   CurrentValue = 6,
   Flag = "BoostFPS",
   Callback = function(R)
   workspace.DescendantAdded:Connect(function(descendant)
      if descendant:IsA("ParticleEmitter") then
         descendant.Rate = descendant.Rate * R
      end
   end)
   end,
})

local ChangeWalkSpeed = AddonsTab:CreateSlider({
   Name = "CustomWalkSpees",
   Range = {0, 100},
   Increment = 1,
   Suffix = "Change your WalkSpees",
   CurrentValue = 50,
   Flag = "WalkSpeedChange",
   Callback = function(s)
   while game:GetService("RunService").RenderStepped:wait() do
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
   end
   end,
})



--[[
ScriptsTab:AddButton({
    Name = "Reset Walk Speed",
    Callback = function()
        if not isInCooldown("Reset Walk Speed") then
            applyCooldown("Reset Walk Speed")
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end
})



MiscellaneousTab:AddButton({
    Name = "Destroy Fullbright",
    Callback = function()
        if not isInCooldown("Destroy Fullbright") then
            applyCooldown("Destroy Fullbright")
            game.Lighting.Brightness = 1
            game.Lighting.ClockTime = 0
            game.Lighting.FogEnd = 500
            game.Lighting.Ambient = Color3.fromRGB(0, 0, 0)
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local light = character.HumanoidRootPart:FindFirstChild("CustomLight")
                if light then
                    light:Destroy()
                end
            end
        end
    end
})

MiscellaneousTab:AddButton({
    Name = "Fullbright",
    Callback = function()
        if not isInCooldown("Fullbright") then
            applyCooldown("Fullbright")
            game.Lighting.Brightness = 2
            game.Lighting.ClockTime = 14
            game.Lighting.FogEnd = 100000
            game.Lighting.Ambient = Color3.fromRGB(178, 178, 178)
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local light = Instance.new("PointLight")
                light.Name = "CustomLight"
                light.Brightness = 5
                light.Range = 20
                light.Color = Color3.fromRGB(255, 255, 200)
                light.Parent = character.HumanoidRootPart
            end
        end
    end
})

MiscellaneousTab:AddButton({
    Name = "Stop Infinite Jump",
    Callback = function()
        if not isInCooldown("Stop Infinite Jump") then
            applyCooldown("Stop Infinite Jump")
            _G.InfiniteJumpEnabled = false
        end
    end
})

MiscellaneousTab:AddButton({
    Name = "Infinite Jump",
    Callback = function()
        if not isInCooldown("Infinite Jump") then
            applyCooldown("Infinite Jump")
            _G.InfiniteJumpEnabled = true
            game:GetService("UserInputService").JumpRequest:Connect(function()
                if _G.InfiniteJumpEnabled then
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end)
        end
    end
})


]]
