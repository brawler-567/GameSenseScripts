local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Gamesense",
   Icon = 0,
   LoadingTitle = "Get Good Get GameSense",
   LoadingSubtitle = "by Z1dex",
   Theme = "Default",
      
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "GS"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"FreeWeek"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
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
                 Duration = 2.5,
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
   workspace.DescendantAdded:Connect(function(descendant)
      if descendant.Name == "eye" or descendant.Name == "elkman" or descendant.Name == "Rush" or descendant.Name == "Worm" or descendant.Name == "eyePrime" then
         descendant:Destroy()
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
      end
   end)
   end,
})



--Legit



--Addons
local AddonsSec = AddonsTab:CreateSection("Addons")
local BoostFPS = AddonsTab:CreateSlider({
   Name = "BoostFPS",
   Range = {0, 10},
   Increment = 1,
   Suffix = "affects special effects",
   CurrentValue = 6,
   Flag = "BoostFPS",
   Callback = function(Value)
   workspace.DescendantAdded:Connect(function(descendant)
      if descendant:IsA("ParticleEmitter") then
         descendant.Rate = descendant.Rate * Value
      end
   end)
   end,
})
