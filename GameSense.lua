--start
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/brawler-567/GameSenseScripts/refs/heads/main/src.lua"))()
local GUI = Mercury:Create{
    Name = "Gamesense",
    Size = UDim2.fromOffset(600, 500),
    Theme = Mercury.Themes.Dark,
    Link = "https://GameSense.pub/"
}
GUI:Notification{
	Title = "GameSense",
	Text = "Get Good Get GameSense",
	Duration = 4,
	Callback = function() end
}
GUI:Credit{
	Name = "By Z1dex",
	Description = "Get Good Get GameSense",
	Discord = "Z1dex"
}
--PlrStats



local Tab = GUI:Tab{
    Name = "UniversalPlayerStats",
    Icon = "rbxassetid://8569322835"
}

Tab:Slider{
	Name = "WalkSpeed",
	Default = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
	Min = 0,
	Max = 100,
	Callback = function(s)
    while game:GetService("RunService").RenderStepped:wait() do
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end
end
}
Tab:Slider{
	Name = "JumpPower",
	Default = game.Players.LocalPlayer.Character.Humanoid.JumpPower,
	Min = 0,
	Max = 100,
	Callback = function(j)
    while game:GetService("RunService").RenderStepped:wait() do
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = j
    end
end
}
Tab:Slider{
	Name = "Gravity",
	Default = Workspace.Gravity,
	Min = 0,
	Max = 200,
	Callback = function(g)
    while game:GetService("RunService").RenderStepped:wait() do
    Workspace.Gravity = g
    end
end
}
Tab:Toggle{
	Name = "Infinity Jump",
	StartingState = false,
	Description = nil,
	Callback = function(state)
	if state == true then
        _G.InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.InfiniteJumpEnabled then
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end
    if state == false then
        _G.InfiniteJumpEnabled = false
    end
end
}
Tab:Toggle{
      Name = "FullBright",
      StartingState = false,
      Description = nil,
      Callback = function(state)
      if state == true then
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
      if state == false then
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
}
--ScriptHub



local Tab = GUI:Tab{
Name = "GameHub",
Icon = "rbxassetid://8569322835"
}

Tab:Button{
	Name = "HeadScale",
	Description = nil,
	Callback = function()
	loadstring(game:HttpGet("https://pastefy.app/rmpKKaRe/raw", true))()
	end
}
Tab:Button{
	Name = "Super Esp",
	Description = nil,
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Exunys-ESP/main/src/ESP.lua"))()
	ExunysDeveloperESP()
	end
}
Tab:Button{
	Name = "TpSave",
	Description = nil,
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/brawler-567/GameSenseScripts/refs/heads/main/test.lua"))()
	end
}
Tab:Button{
	Name = "DexLastVersionPC&MOBILE",
	Description = nil,
	Callback = function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/just-did-this-to-upload-the-script-dex-explorer-can-*ed-in-and-delete-stuff-29543"))()
	end
}
