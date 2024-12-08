local guiGS = Instance.new("ImageButton")
local players = game:GetService("Players")
local plr = players.LocalPlayer
guiGS.Image = "rbxassetid://8126130334"
guiGS.Parent = plr:WaitForChild("PlayerGui")

local function toggleGui()
    guiGS.Visible = not guiGS.Visible
end
guiGS.Activated:Connect(toggleGui)


local TweenService = game:GetService("TweenService")
local size = UDim2.new(guiGS.Size.X.Scale, guiGS.Size.X.Offset, guiGS.Size.Y.Scale, guiGS.Size.Y.Offset)
local tweenInfo = TweenInfo.new(
    0.5,
    Enum.EasingStyle.Quad,
    Enum.EasingDirection.Out
)
local tween = TweenService:Create(guiGS, tweenInfo, {Size = size})

guiGS.Activated:Connect(function()
    tween:Play()
end)

guiGS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        tween:Pause()
    end
end)

guiGS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        tween:Resume()
    end
end)
