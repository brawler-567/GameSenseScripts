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

local Tab = GUI:Tab{
    Name = "PlayerStatsUniversal",
    Icon = "rbxassetid://8569322835"
}

Tab:Slider{
	Name = "WalkSpeed",
	Default = 14,
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
	Default = 14,
	Min = 0,
	Max = 100,
	Callback = function(j)
    while game:GetService("RunService").RenderStepped:wait() do
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = j
    end
end
}

Tab:Slider{
	Name = "WalkSpeed",
	Default = 14,
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
	Default = 14,
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
	Default = 14,
	Min = 0,
	Max = 200,
	Callback = function(g)
    while game:GetService("RunService").RenderStepped:wait() do
    Workspace.Gravity = g
    end
end
}

Tab:Slider{
	Name = "FOV",
	Default = 14,
	Min = 0,
	Max = 100,
	Callback = function(FOV)
    while game:GetService("RunService").RenderStepped:wait() do
    Workspace.Camera.FieldOfView = FOV
    end
end
}

local Tab = GUI:Tab{
Name = "GameHub",
Icon = "rbxassetid://8569322835"
}
        
Tab:Button{
	Name = "DexLastVersionPC&MOBILE",
	Description = nil,
	Callback = function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/just-did-this-to-upload-the-script-dex-explorer-can-*ed-in-and-delete-stuff-29543"))()
	end
}
