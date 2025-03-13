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
    Name = "PlayerStats",
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
    Name = "PlayerStats",
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
	Name = "mobileDexLastV",
	Description = nil,
	Callback = function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/just-did-this-to-upload-the-script-dex-explorer-can-*ed-in-and-delete-stuff-29543"))()
	end
}
        
Tab:Button{
	Name = "AvatarCopier",
    	Description = nil,
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Luarmor123/YHUB-Community/refs/heads/main/Avatar_Copier.lua"))()
	end
}

Tab:Button{
	Name = "fling",
    	Description = nil,
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EpikCatto6900/fling-fixed/refs/heads/main/main'))()
	end
}

Tab:Button{
	Name = "test1",
    	Description = nil,
	Callback = function()
	loadstring(game:HttpGet("https://gist.githubusercontent.com/GeniusofAB/6021a1763b5f37daf9c2f9a5a1afeea8/raw/7fce0bcecc5a33f51755a1a59ee435fca4ca5c64/gistfile1.txt"))()
	end
}

Tab:Button{
	Name = "test2",
    	Description = nil,
	Callback = function()
	loadstring(game:HttpGet('https://pastebin.com/raw/D768ibVu'))()
	end
}

Tab:Button{
	Name = "GazeBypass",
    	Description = nil,
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Gazer-Ha/Reimagined/refs/heads/main/Gaze%20bypass'))()
	end
}
