local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "Gamesense",
    Size = UDim2.fromOffset(600, 500),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

GUI:Notification{
	Title = "Gamesense",
	Text = "Get Good Get Gamesense",
	Duration = 4,
	Callback = function() end
}

GUI:Credit{
	Name = "By Z1dex",
	Description = "Get Good Get GameSense",
	Discord = "Z1dex"
}

local Tab = GUI:Tab{
    Name = "TpHive",
    Icon = "rbxassetid://8569322835"
}

Tab:Button{
    Name = "TpToHive1",
    Description = nil,
    Callback = function()
    GUI:Notification{
	Title = "Teleportation",
	Text = "You Successful Teleported!",
	Duration = 1.5,
	Callback = function() end
    }
    local player = game.Players.LocalPlayer
    local targetCoordinates = Vector3.new(-3.67, 10, 331)
    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetCoordinates)
    end
}

Tab:Button{
    Name = "TpToHive2",
    Description = nil,
    Callback = function()
    GUI:Notification{
	Title = "Teleportation",
	Text = "You Successful Teleported!",
	Duration = 1.5,
	Callback = function() end
    }
    local player = game.Players.LocalPlayer
    local targetCoordinates = Vector3.new(-40.3, 10, 331)
    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetCoordinates)
    end
}

Tab:Button{
    Name = "TpToHive3",
    Description = nil,
    Callback = function()
    GUI:Notification{
	Title = "Teleportation",
	Text = "You Successful Teleported!",
	Duration = 1.5,
	Callback = function() end
    }
    local player = game.Players.LocalPlayer
    local targetCoordinates = Vector3.new(-77, 10, 331)
    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetCoordinates)
    end
}

Tab:Button{
    Name = "TpToHive4",
    Description = nil,
    Callback = function()
    GUI:Notification{
	Title = "Teleportation",
	Text = "You Successful Teleported!",
	Duration = 1.5,
	Callback = function() end
    }
    local player = game.Players.LocalPlayer
    local targetCoordinates = Vector3.new(-113.2, 10, 331)
    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetCoordinates)
    end
}

Tab:Button{
    Name = "TpToHive5",
    Description = nil,
    Callback = function()
    GUI:Notification{
	Title = "Teleportation",
	Text = "You Successful Teleported!",
	Duration = 1.5,
	Callback = function() end
    }
    local player = game.Players.LocalPlayer
    local targetCoordinates = Vector3.new(-150, 10, 331)
    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetCoordinates)
    end
}

Tab:Button{
    Name = "TpToHive6",
    Description = nil,
    Callback = function()
    GUI:Notification{
	Title = "Teleportation",
	Text = "You Successful Teleported!",
	Duration = 1.5,
	Callback = function() end
    }
    local player = game.Players.LocalPlayer
    local targetCoordinates = Vector3.new(-186.67, 10, 331)
    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetCoordinates)
    end
}

local Tab = GUI:Tab{
    Name = "Farm",
    Icon = "rbxassetid://8569322835"
}

Tab:Button{
    Name = "TpToPapperPollen",
    Description = nil,
    Callback = function()
        GUI:Notification{
	    Title = "Teleportation",
	    Text = "You Successful Teleported!",
	    Duration = 1.5,
	    Callback = function() end
        }
        local player = game.Players.LocalPlayer
        local targetCoordinates = Vector3.new(-500, 130, 530)
        player.Character.HumanoidRootPart.CFrame = CFrame.new(targetCoordinates)
        end
}