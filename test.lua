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
   Name = "LeverEsp",
   CurrentValue = false,
   Flag = "LeverEsp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   if Value = true then
      workspace.DescendantAdded:Connect(function(descendant)
          if descendant.Name == "base" and descendant:IsA("BasePart") then
              local player = game.Players.LocalPlayer
              if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                 v = descendant
                 hg = Instance.new("Highlight", v)
                 hg.FillColor = Color3.fromRGB(241, 196, 15)
                 hg.FillTransparency = 0.5
                 
                 bb = Instance.new('BillboardGui', v)
                 bb.Adornee = v
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
                 txtlbl.Text = "Lever " .. v.Name
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
              end
           end
       end)
   end
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
