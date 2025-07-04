local Players = game:GetService("Players")

local player = game.Players.LocalPlayer
local male = game.PlayerGui.ScreenGui.male
local female game.PlayerGui.ScreenGui.female

local p = Instance.new("BoolValue")
local p.Parent = player
local p.Value = nil

local function v13()
    p.Value = false
end
local function v42()
    p.Value = true
end

male.MouseButton1Click:Connect(v13)
female.MouseButton1Click:Connect(v42)
