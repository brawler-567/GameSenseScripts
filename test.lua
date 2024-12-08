local gui = Instance.new("ImageButton")
gui.Image = "rbxassetid://8126130334"
gui.Parent = 

local function toggleGui()
    gui.Visible = not gui.Visible
end

button.Activated:Connect(toggleGui)


local TweenService = game:GetService("TweenService")

-- Получаем imagebutton и его размеры
local imagebutton = script.Parent
local size = UDim2.new(imagebutton.Size.X.Scale, imagebutton.Size.X.Offset, imagebutton.Size.Y.Scale, imagebutton.Size.Y.Offset)

-- Создаем информацию о tween'е
local tweenInfo = TweenInfo.new(
    0.5, -- Время tween'а в секундах
    Enum.EasingStyle.Quad, -- Стиль tween'а
    Enum.EasingDirection.Out -- Направление tween'а
)

-- Создаем tween' для передвижения imagebutton'а
local tween = TweenService:Create(imagebutton, tweenInfo, {Size = size})

-- При нажатии imagebutton'а выполняем tween' и отменяем его при отпускании
imagebutton.Activated:Connect(function()
    tween:Play()
end)

imagebutton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        tween:Pause()
    end
end)

imagebutton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        tween:Resume()
    end
end)
