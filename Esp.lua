while true do
    for n = 1, math.huge do
        local v = workspace.Rooms.(n).Door.Door.Root
        hg = Instance.new("Highlight")
        hg.FillColor = Color3.fromRGB(241, 196, 15)
        hg.FillTransparency = 0.5
        hg.Parent = v

        bb = Instance.new('BillboardGui')
        bb.Adornee = v
        bb.ExtentsOffset = Vector3.new(0, 1, 0)
        bb.AlwaysOnTop = true
        bb.Size = UDim2.new(0, 6, 0, 6)
        bb.StudsOffset = Vector3.new(0, 1, 0)
        bb.Name = "BillBoard"
        bb.Parent = v

        txtlbl = Instance.new('TextLabel')
        txtlbl.ZIndex = 10
        txtlbl.BackgroundTransparency = 1
        txtlbl.Position = UDim2.new(0, 0, 0, -45)
        txtlbl.Size = UDim2.new(1, 0, 10, 0)
        txtlbl.Font = 'ArialBold'
        txtlbl.FontSize = 'Size12'
        txtlbl.Text = "Door " .. v.Name
        txtlbl.TextStrokeTransparency = 0.5
        txtlbl.TextColor3 = Color3.fromRGB(241, 196, 15)
        txtlbl.Parent = bb

        txtlbl2 = Instance.new('TextLabel')
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
        txtlbl2.Parent = bb
    end
end
