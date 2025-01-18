local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local SG = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local saveButton = Instance.new("TextButton")

local player = Players.LocalPlayer

SG.Name = "SG"
SG.Parent = game.CoreGui

BG.Name = "BG"
BG.Parent = SG
BG.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
BG.Size = UDim2.new(0, 105, 0, 63,5) --210, 127
BG.Active = true
BG.Draggable = true

Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 105, 0, 16,5) --210 33
Title.Font = Enum.Font.Highway
Title.Text = "By Z1dex"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.FontSize = Enum.FontSize.Size32
Title.TextSize = 30
Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Title.TextStrokeTransparency = 0

saveButton.Parent = BG
saveButton.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
saveButton.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
saveButton.BorderSizePixel = 2
saveButton.Position = UDim2.new(0.152380958, 0, 0.314192119, 0)
saveButton.Size = UDim2.new(0, 73, 0, 18) --146 36
saveButton.Font = Enum.Font.Highway
saveButton.FontSize = Enum.FontSize.Size28
saveButton.Text = "save"
saveButton.TextColor3 = Color3.new(1, 1, 1)
saveButton.TextSize = 25
saveButton.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
saveButton.TextStrokeTransparency = 0

local function Spawn()
  while wait(0.04) do
    for i = 2, 10000 do
      local Path = "Rooms." .. tostring(i)
      hg = Instance.new("Highlight", Path)
      hg.FillColor = Color3.fromRGB(241, 196, 15)
      hg.FillTransparency = 0.5
      bb = Instance.new('BillboardGui', Path)
      bb.Adornee = path
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
      txtlbl.Text = "Door " .. i
      txtlbl.TextStrokeTransparency = 0.5
      txtlbl.TextColor3 = Color3.fromRGB(241, 196, 15)
    end
  end
end

saveButton.MouseButton1Click:Connect(Spawn)
