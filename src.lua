local CoreGui = game:GetService "CoreGui"
local TweenService = game:GetService "TweenService"
local GuiService = game:GetService("GuiService")
local ms = game:GetService"Players".LocalPlayer:GetMouse()
local Vlassis = {}
local Names = {}
getgenv().executed = false 
function On(self, oct)
    if self == "enter" then 
        oct.MouseEnter:Connect(function()
            TweenService:Create(oct,TweenInfo.new(.25),{BackgroundColor3 = Color3.fromRGB(65,65,65)}):Play()
        end)
    else if self == "leave" then
        oct.MouseLeave:Connect(function()
            TweenService:Create(oct,TweenInfo.new(.25),{BackgroundColor3 = Color3.fromRGB(45,45,45)}):Play()
        end)
        end
    end
end
if getgenv().executed then return end 

function DraggingEnabled(frame, parent)
        
    parent = parent or frame
    
    -- stolen from wally or kiriot, kek
    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = parent.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end



function Vlassis.Load(title)
    getgenv().executed = true 
    title = title or "New Library"
    if not title then title = "New Library" end
    table.insert(Names, title)
        
                local UIName = Instance.new("ScreenGui")
                local MotherFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Header = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local Cover = Instance.new("Frame")
                local UIName_2 = Instance.new("TextLabel")
                local Minimise = Instance.new("ImageButton")
                local Shadow = Instance.new("ImageLabel")
                local Shadow_2 = Instance.new("ImageLabel")
                local Pages = Instance.new("Folder")
                local TabContainer = Instance.new("ScrollingFrame")
                local UIListLayout_2 = Instance.new("UIListLayout")
                local UIPadding_2 = Instance.new("UIPadding")

                UIName.Name = "Library" 
                UIName.Parent = CoreGui
                UIName.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

                MotherFrame.Name = "MotherFrame"
                MotherFrame.Parent = UIName
                MotherFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                MotherFrame.Position = UDim2.new(0.413315445, 0, 0.307234049, 0)
                MotherFrame.Size = UDim2.new(0, 387, 0, 452)

                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = MotherFrame

                Header.Name = "Header"
                Header.Parent = MotherFrame
                Header.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                Header.Size = UDim2.new(0, 387, 0, 22)
        DraggingEnabled(Header,MotherFrame)

                UICorner_2.CornerRadius = UDim.new(0, 4)
                UICorner_2.Parent = Header

                Cover.Name = "Cover"
                Cover.Parent = Header
                Cover.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                Cover.BorderSizePixel = 0
                Cover.Position = UDim2.new(0, 0, 0.689281106, 0)
                Cover.Size = UDim2.new(0, 387, 0, 14)

                UIName_2.Name = "UIName"
                UIName_2.Parent = Header
                UIName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                UIName_2.BackgroundTransparency = 1.000
                UIName_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
                UIName_2.Position = UDim2.new(0.0232558139, 0, 0, 0)
                UIName_2.Size = UDim2.new(0, 264, 0, 29)
                UIName_2.Font = Enum.Font.GothamBold
                UIName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                UIName_2.TextSize = 12.000
                UIName_2.TextXAlignment = Enum.TextXAlignment.Left
                UIName_2.Text = tostring(title)


                Minimise.Name = "Minimise"
                Minimise.Parent = Header
                Minimise.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Minimise.BackgroundTransparency = 1.000
                Minimise.Position = UDim2.new(0.932816565, 0, 0.227272987, 0)
                Minimise.Size = UDim2.new(0, 19, 0, 19)
                Minimise.AutoButtonColor = false
                Minimise.Image = "http://www.roblox.com/asset/?id=5554237731"
                Minimise.ImageColor3 = Color3.fromRGB(255, 106, 0)
                Minimise.ScaleType = Enum.ScaleType.Slice
                Minimise.SliceCenter = Rect.new(3, 3, 297, 297)


                Shadow.Name = "Shadow"
                Shadow.Parent = Minimise
                Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Shadow.BackgroundTransparency = 1.000
                Shadow.Position = UDim2.new(-0.783267379, 0, -0.825632215, 0)
                Shadow.Size = UDim2.new(0, 48, 0, 50)
                Shadow.Image = "http://www.roblox.com/asset/?id=5554236805"
                Shadow.ImageColor3 = Color3.fromRGB(147, 59, 0)
                Shadow.ScaleType = Enum.ScaleType.Slice
                Shadow.SliceCenter = Rect.new(23, 23, 277, 277)

                local Open = true 

                Minimise.MouseButton1Click:Connect(function()
                        for i,v in pairs(UIName:GetDescendants()) do
                            if not v:IsA('UIListLayout') and not v:IsA("UICorner") and not v:IsA("Folder") then
                                Shadow:Destroy()
                                Pages:Destroy()
                                TabContainer:Destroy()
                                Header:Destroy()
                                Shadow_2:Destroy()
                                TweenService:Create(v,TweenInfo.new(.6),{BackgroundTransparency =1 }):Play()
                                task.wait(1)
                                UIName:Destroy()
                            end
                        end
                end)


                Shadow_2.Name = "Shadow"
                Shadow_2.Parent = MotherFrame
                Shadow_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Shadow_2.BackgroundTransparency = 1.000
                Shadow_2.Position = UDim2.new(-0.038, 0,-0.034, 0)
                Shadow_2.Size = UDim2.new(0, 416, 0, 481)
                Shadow_2.Image = "http://www.roblox.com/asset/?id=5554236805"
                Shadow_2.ScaleType = Enum.ScaleType.Slice
                Shadow_2.SliceCenter = Rect.new(23, 23, 277, 277)

                Pages.Name = "Pages"
                Pages.Parent = MotherFrame

                TabContainer.Name = "TabContainer"
                TabContainer.Parent = MotherFrame
                TabContainer.Active = true
                TabContainer.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
                TabContainer.BorderSizePixel = 0
                TabContainer.Position = UDim2.new(0, 0, 0.0642, 0)
                TabContainer.Size = UDim2.new(0, 387, 0, 32)
                TabContainer.CanvasSize = UDim2.new(0.5, 0, 0.5, 0)
                TabContainer.ScrollBarImageTransparency =1 

                UIListLayout_2.Parent = TabContainer
                UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
                UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_2.Padding = UDim.new(0, 8)

                UIPadding_2.Parent = TabContainer
                UIPadding_2.PaddingLeft = UDim.new(0, 8)
                UIPadding_2.PaddingTop = UDim.new(0, 1)

                local Categorys = {}
                function Categorys:Category(title)
                    title = tostring(string.upper(title)) or "NEW CATEGORY"
                    if not title then title = "NEW CATEGORY" end


                local Page = Instance.new("ScrollingFrame")
                local UIListLayout = Instance.new("UIListLayout")
                local UIPadding = Instance.new("UIPadding")
                 local Tab = Instance.new("TextButton")
                 
                 
                Tab.Name = "Tab"
                Tab.Parent = TabContainer
                Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Tab.BackgroundTransparency = 1.000
                Tab.Size = UDim2.new(0, 21, 0, 27)
                Tab.Font = Enum.Font.GothamBold
                Tab.Text = title
                Tab.TextColor3 = Color3.fromRGB(235, 235, 235)
                Tab.TextSize = 11.000
                Tab.AutomaticSize=Enum.AutomaticSize.X

                Page.Name = "Page"
                Page.Parent = Pages
                Page.Active = true
                Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Page.BackgroundTransparency = 1.000
                Page.BorderColor3 = Color3.fromRGB(27, 42, 53)
                Page.Position = UDim2.new(0, 0, 0.132743359, 0)
                Page.Size = UDim2.new(0, 387, 0, 392)
                Page.CanvasSize = UDim2.new(0, 0, 0.5, 0)
                Page.ScrollBarImageTransparency =1 

                UIListLayout.Parent = Page
                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 5)

                task.spawn(function()
                    while wait() do
                        Page.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 15)
                    end
                end)

                UIPadding.Parent = Page
                UIPadding.PaddingTop = UDim.new(0, 7)

                local a = 0
                local b = 0

                for i,v in pairs(TabContainer:GetChildren()) do if v:IsA("TextButton") then a=a+1 v.Name = a .. "cat" end end 
                for i,v in pairs(Pages:GetChildren()) do b = b + 1 v.Name = b .. "page" end 
                for i,v in pairs(TabContainer:GetChildren()) do if v:IsA("TextButton") and v.Name ~= "1cat" then v.TextColor3 = Color3.fromRGB(150,150,150) end end 
                for i,v in pairs(Pages:GetChildren()) do if v.Name ~= "1page" then v.Visible = false end  end

                Tab.MouseButton1Click:Connect(function()
                    local info = TweenInfo.new(.25)
                        for _,v in next, TabContainer:GetChildren() do
                            if v:IsA("TextButton") then
                                TweenService:Create(v,info,{TextColor3 = Color3.fromRGB(150,150,150)}):Play()
                            end
                        end
                        TweenService:Create(Tab,info,{TextColor3=Color3.fromRGB(255,255,255)}):Play()
                        for _,v in next, Pages:GetChildren() do
                            v.Visible = false 
                        end
                        Page.Visible = true 
                    end) 


                    local Elements = {}
                    function Elements:Label(title)
                        title = title or "New Label"
                        if not title then title = "New Label" end
                        local LabelFunctions = {}

                    local Label = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local Shadow = Instance.new("ImageLabel")
                    local TextLabel = Instance.new("TextLabel")


                    Label.Name = "Label"
                    Label.Parent = Page
                    Label.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    Label.Position = UDim2.new(0.0271317828, 0, 0, 0)
                    Label.Size = UDim2.new(0, 366, 0, 36)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = Label

                    Shadow.Name = "Shadow"
                    Shadow.Parent = Label
                    Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Shadow.BackgroundTransparency = 1.000
                    Shadow.Position = UDim2.new(-0.0396174863, 0, -0.416666687, 0)
                    Shadow.Selectable = true
                    Shadow.Size = UDim2.new(0, 395, 0, 65)
                    Shadow.Image = "http://www.roblox.com/asset/?id=5554236805"
                    Shadow.ImageColor3 = Color3.fromRGB(25, 25, 25)
                    Shadow.ScaleType = Enum.ScaleType.Slice
                    Shadow.SliceCenter = Rect.new(23, 23, 277, 277)

                    TextLabel.Parent = Label
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.Position = UDim2.new(0.0273224041, 0, -0.027777778, 0)
                    TextLabel.Size = UDim2.new(0, 356, 0, 36)
                    TextLabel.Font = Enum.Font.GothamSemibold
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
                    TextLabel.Text = title


                    function LabelFunctions:Update(title)
                        title = title or "Updated Label"
                        if not title then title = "Updated Label" end 
                        TextLabel.Text = tostring(title)
                        end
                        return LabelFunctions
                    end
                    function Elements:Button(title,callback)
                        title = title or "New Button"
                        if not title then title = "New Button" end 
                        callback = callback or function() end 
                        if not callback then callback = function() end end 
                        local ButtonFunctions = {}

                        local Button = Instance.new("TextButton")
                        local UICorner = Instance.new("UICorner")
                        local TextLabel = Instance.new("TextLabel")
                        local touch_app = Instance.new("ImageButton")
                        local Sample = Instance.new("ImageLabel")
                        local Shadow = Instance.new("ImageLabel")


                        Button.Name = "Button"
                        Button.Parent = Page
                        Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                        Button.Size = UDim2.new(0, 366, 0, 36)
                        Button.AutoButtonColor = false
                        Button.Font = Enum.Font.SourceSans
                        Button.Text = ""
                        Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                        Button.TextSize = 14.000
                        Button.ClipsDescendants = true

                        Sample.Name = "Sample"
                        Sample.Parent = Button
                        Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Sample.BackgroundTransparency = 1.000
                        Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                        Sample.ImageColor3 = Color3.fromRGB(150,150,150)
                        Sample.ImageTransparency = 0.600

                        UICorner.CornerRadius = UDim.new(0, 4)
                        UICorner.Parent = Button

                        TextLabel.Parent = Button
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Position = UDim2.new(0.0273224041, 0, 0, 0)
                        TextLabel.Size = UDim2.new(0, 356, 0, 36)
                        TextLabel.Font = Enum.Font.GothamSemibold
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.TextSize = 12.000
                        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                        TextLabel.Text = tostring(title)

                        
                        touch_app.Name = "touch_app"
                        touch_app.Parent = Button
                        touch_app.BackgroundTransparency = 1.000
                        touch_app.LayoutOrder = 1
                        touch_app.Position = UDim2.new(0.915300548, 0, 0.222222224, 0)
                        touch_app.Size = UDim2.new(0, 23, 0, 19)
                        touch_app.ZIndex = 2
                        touch_app.Image = "rbxassetid://3926305904"
                        touch_app.ImageRectOffset = Vector2.new(84, 204)
                        touch_app.ImageRectSize = Vector2.new(36, 36)
                        touch_app.ScaleType = Enum.ScaleType.Fit

                        Shadow.Name = "Shadow"
                        Shadow.Parent = Button
                        Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Shadow.BackgroundTransparency = 1.000
                        Shadow.Position = UDim2.new(-0.0396174863, 0, -0.416666687, 0)
                        Shadow.Selectable = true
                        Shadow.Size = UDim2.new(0, 395, 0, 65)
                        Shadow.Image = "http://www.roblox.com/asset/?id=5554236805"
                        Shadow.ImageColor3 = Color3.fromRGB(25, 25, 25)
                        Shadow.ScaleType = Enum.ScaleType.Slice
                        Shadow.SliceCenter = Rect.new(23, 23, 277, 277)

                        On("enter",Button)
                        On("leave",Button)
                        
                        Button.MouseButton1Click:Connect(function()
                            pcall(callback)
                            local c = Sample:Clone()
                            c.Parent = Button
                            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                            c.Position = UDim2.new(0, x, 0, y)
                            local len, size = 0.35, nil
                            if Button.AbsoluteSize.X >= Button.AbsoluteSize.Y then
                                size = (Button.AbsoluteSize.X * 1.5)
                            else
                                size = (Button.AbsoluteSize.Y * 1.5)
                            end
                            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                            for i = 1, 10 do
                                c.ImageTransparency = c.ImageTransparency + 0.05
                                wait(len / 12)
                            end
                            c:Destroy()
                        end)

                        function ButtonFunctions:Update(title)
                            title = title or "Updated Button"
                            if not title then title = "Updated Button" end 
                            TextLabel.Text = title 
                        end
                    end 
                    function Elements:Toggle(title,callback,Default)
                        title = title or "New Toggle"
                        if not title then title = "New Toggle" end 
                        callback = callback or function() end 
                        if not callback then callback = function() end end
                        if not Default then Default = false  end 

                    local Toggle = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local Shadow = Instance.new("ImageLabel")
                    local TextLabel = Instance.new("TextLabel")
                    local ToggleButton = Instance.new("TextButton")
                    local ToggleBack = Instance.new("ImageLabel")
                    local check = Instance.new("ImageButton")
                    local Sample = Instance.new("ImageLabel")

                    Toggle.Name = "Toggle"
                    Toggle.Parent = Page
                    Toggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    Toggle.Position = UDim2.new(0.0271317828, 0, 0, 0)
                    Toggle.Size = UDim2.new(0, 366, 0, 36)
                    Toggle.ClipsDescendants = true 

                    Sample.Name = "Sample"
                    Sample.Parent = Toggle
                    Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Sample.BackgroundTransparency = 1.000
                    Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
                    Sample.ImageColor3 = Color3.fromRGB(150,150,150)
                    Sample.ImageTransparency = 0.600


                        
                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = Toggle

                    Shadow.Name = "Shadow"
                    Shadow.Parent = Toggle
                    Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Shadow.BackgroundTransparency = 1.000
                    Shadow.Position = UDim2.new(-0.0396174863, 0, -0.416666687, 0)
                    Shadow.Selectable = true
                    Shadow.Size = UDim2.new(0, 395, 0, 65)
                    Shadow.Image = "http://www.roblox.com/asset/?id=5554236805"
                    Shadow.ImageColor3 = Color3.fromRGB(25, 25, 25)
                    Shadow.ScaleType = Enum.ScaleType.Slice
                    Shadow.SliceCenter = Rect.new(23, 23, 277, 277)

                    TextLabel.Parent = Toggle
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.Position = UDim2.new(0.0273224041, 0, 0, 0)
                    TextLabel.Size = UDim2.new(0, 303, 0, 36)
                    TextLabel.Font = Enum.Font.GothamSemibold
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
                    TextLabel.Text = tostring(title)


                    ToggleButton.Name = "ToggleButton"
                    ToggleButton.Parent = Toggle
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleButton.BackgroundTransparency = 1.000
                    ToggleButton.Size = UDim2.new(0, 366, 0, 36)
                    ToggleButton.Font = Enum.Font.SourceSans
                    ToggleButton.Text = ""
                    ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                    ToggleButton.TextSize = 14.000

                    ToggleBack.Name = "ToggleBack"
                    ToggleBack.Parent = Toggle
                    ToggleBack.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    ToggleBack.BackgroundTransparency = 1.000
                    ToggleBack.Position = UDim2.new(0.91698885, 0, 0.194444448, 0)
                    ToggleBack.Size = UDim2.new(0, 22, 0, 21)
                    ToggleBack.Image = "http://www.roblox.com/asset/?id=5554237731"
                    ToggleBack.ImageColor3 = Color3.fromRGB(29, 29, 29)
                    ToggleBack.ScaleType = Enum.ScaleType.Slice
                    ToggleBack.SliceCenter = Rect.new(3, 3, 297, 297)

                    check.Name = "check"
                    check.Parent = ToggleBack
                    check.BackgroundTransparency = 1.000
                    check.Position = UDim2.new(0.0454545319, 0, 0.0714285672, 0)
                    check.Size = UDim2.new(0, 19, 0, 18)
                    check.ZIndex = 2
                    check.Image = "rbxassetid://3926305904"
                    check.ImageColor3 = Color3.fromRGB(29, 29, 29)
                    check.ImageRectOffset = Vector2.new(312, 4)
                    check.ImageRectSize = Vector2.new(24, 24)
                    check.ScaleType = Enum.ScaleType.Fit


                    local State = Default
                    if Default then
                       State = true
                    else
                       State = false
                    end
                    ToggleButton.MouseButton1Click:Connect(function()
                        State = not State
                        local NewColour = State and Color3.fromRGB(255,255,255) or Color3.fromRGB(29, 29, 29)
                        TweenService:Create(ToggleBack, TweenInfo.new(.25), {ImageColor3 = NewColour}):Play()
                        pcall(callback, State)
                        local c = Sample:Clone()
                        c.Parent = Toggle 
                        local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
                        c.Position = UDim2.new(0, x, 0, y)
                        local len, size = 0.35, nil
                        if Toggle.AbsoluteSize.X >= Toggle.AbsoluteSize.Y then
                            size = (Toggle.AbsoluteSize.X * 1.5)
                        else
                            size = (Toggle.AbsoluteSize.Y * 1.5)
                        end
                        c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
                        for i = 1, 10 do
                            c.ImageTransparency = c.ImageTransparency + 0.05
                            wait(len / 12)
                        end
                        c:Destroy()
                    end)
                    if Default then
                        ToggleBack.ImageColor3 = Color3.fromRGB(255,255,255)
                        pcall(callback, State)
                    else
                        ToggleBack.ImageColor3 = Color3.fromRGB(29, 29, 29)
                        pcall(callback, State)
                        end
                    On("enter",Toggle)
                    On("leave",Toggle)
                    end
                    function Elements:Slider(title,min,max,callback)
                        title = title or "New Slider"
                        if not title then title = "New Slider" end 
                        min = min or 16 
                        max = max or 250 
                        if not min then min = 16 end 
                        if not max then max = 250 end 
                        callback = callback or function() end 
                        if not callback then callback = function() end end 

                        local Slider = Instance.new("Frame")
                        local UICorner = Instance.new("UICorner")
                        local Shadow = Instance.new("ImageLabel")
                        local TextLabel = Instance.new("TextLabel")
                        local int = Instance.new("TextLabel")
                        local SliderBack = Instance.new("TextButton")
                        local UICorner_2 = Instance.new("UICorner")
                        local SliderInner = Instance.new("Frame")
                        local d = Instance.new("UICorner")

                        Slider.Name = "Slider"
                        Slider.Parent = Page
                        Slider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                        Slider.Position = UDim2.new(0.0271317828, 0, 0.319480509, 0)
                        Slider.Size = UDim2.new(0, 366, 0, 56)

                        UICorner.CornerRadius = UDim.new(0, 4)
                        UICorner.Parent = Slider

                        Shadow.Name = "Shadow"
                        Shadow.Parent = Slider
                        Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Shadow.BackgroundTransparency = 1.000
                        Shadow.Position = UDim2.new(-0.0396174863, 0, -0.284313738, 0)
                        Shadow.Selectable = true
                        Shadow.Size = UDim2.new(0, 395, 0, 79)
                        Shadow.Image = "http://www.roblox.com/asset/?id=5554236805"
                        Shadow.ImageColor3 = Color3.fromRGB(25, 25, 25)
                        Shadow.ScaleType = Enum.ScaleType.Slice
                        Shadow.SliceCenter = Rect.new(23, 23, 277, 277)

                        TextLabel.Parent = Slider
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1.000
                        TextLabel.Position = UDim2.new(0.0273224059, 0, -0.0892857164, 0)
                        TextLabel.Size = UDim2.new(0, 303, 0, 36)
                        TextLabel.Font = Enum.Font.GothamSemibold
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.TextSize = 12.000
                        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                        TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
                        TextLabel.Text = title 
                    
                        int.Name = "int"
                        int.Parent = Slider
                        int.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        int.BackgroundTransparency = 1.000
                        int.Position = UDim2.new(0.833333313, 0, 0.0889355764, 0)
                        int.Size = UDim2.new(0, 53, 0, 16)
                        int.Font = Enum.Font.GothamSemibold
                        int.Text = tostring(min)
                        int.TextColor3 = Color3.fromRGB(255, 255, 255)
                        int.TextSize = 12.000
                        int.TextXAlignment = Enum.TextXAlignment.Right

                        SliderBack.Name = "SliderBack"
                        SliderBack.Parent = Slider
                        SliderBack.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                        SliderBack.Position = UDim2.new(0.0332678296, 0, 0.475782126, 0)
                        SliderBack.Size = UDim2.new(0, 340, 0, 19)
                        SliderBack.Font = Enum.Font.SourceSans
                        SliderBack.Text = ""
                        SliderBack.TextColor3 = Color3.fromRGB(0, 0, 0)
                        SliderBack.TextSize = 14.000
                        SliderBack.AutoButtonColor = false 

                        UICorner_2.CornerRadius = UDim.new(0, 4)
                        UICorner_2.Parent = SliderBack

                        SliderInner.Name = "SliderInner"
                        SliderInner.Parent = SliderBack
                        SliderInner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderInner.BorderColor3 = Color3.fromRGB(45, 45, 45)
                        SliderInner.Size = UDim2.new(0, 0, 0, 19)
                       
                        d.CornerRadius = UDim.new(0, 4)
                        d.Parent = SliderInner

                        local Value;
                        local input = game:GetService("UserInputService")
                        SliderBack.MouseButton1Down:Connect(function()
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 158479) * SliderInner.AbsoluteSize.X) + tonumber(min)) or 0
                        int.Text = Value
                        pcall(function()
                            callback(Value)
                        end)
                
                
                        SliderInner.Size = UDim2.new(0, math.clamp(ms.X - SliderInner.AbsolutePosition.X, 0, 340), 0, 19)
                        moveconnection = ms.Move:Connect(function()
                            int.Text = Value
                
                                TweenService:Create(int,TweenInfo.new(.7), { TextTransparency = 0 }):Play()
                        
                                int.TextTransparency = 0
                        
                           Value = math.floor((((tonumber(max) - tonumber(min)) / 340) * SliderInner.AbsoluteSize.X) + tonumber(min))
                            pcall(function()
                                callback(Value)
                            end)
                            SliderInner.Size = UDim2.new(0, math.clamp(ms.X - SliderInner.AbsolutePosition.X, 0, 340), 0, 19)
                        end)
                        releaseconnection = input.InputEnded:Connect(function(Mouse)
                            if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                Value = math.floor((((tonumber(max) - tonumber(min)) / 340) * SliderInner.AbsoluteSize.X) + tonumber(min))
                                int.Text = Value
                                    TweenService:Create(int,TweenInfo.new(.7), { TextTransparency = 1 }):Play()
                                pcall(function()
                                    callback(Value)
                                end)
                                SliderInner.Size = UDim2.new(0, math.clamp(ms.X - SliderInner.AbsolutePosition.X, 0, 340), 0, 19)
                                moveconnection:Disconnect()
                                releaseconnection:Disconnect()
                            end
                        end)
                    end)
                    end
                    function Elements:Textbox(title,callback,placeholdertext)
                            title = title or "New Textbox" 
                            if not title then title = "New Textbox" end 
                            callback = callback or function() end 
                            if not callback then callback = function() end end 
                            if not placeholdertext then placeholdertext = "" end 
                            
                            local Textbox = Instance.new("Frame")
                            local UICorner = Instance.new("UICorner")
                            local Shadow = Instance.new("ImageLabel")
                            local TextLabel = Instance.new("TextLabel")
                            local input = Instance.new("TextBox")
                            local UICorner_2 = Instance.new("UICorner")
                            local e = Instance.new("UIPadding")
                         
                            Textbox.Name = "Textbox"
                            Textbox.Parent = Page
                            Textbox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                            Textbox.Position = UDim2.new(0.0271317828, 0, 0, 0)
                            Textbox.Size = UDim2.new(0, 366, 0, 36)

                            UICorner.CornerRadius = UDim.new(0, 4)
                            UICorner.Parent = Textbox

                            Shadow.Name = "Shadow"
                            Shadow.Parent = Textbox
                            Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            Shadow.BackgroundTransparency = 1.000
                            Shadow.Position = UDim2.new(-0.0396174863, 0, -0.416666687, 0)
                            Shadow.Selectable = true
                            Shadow.Size = UDim2.new(0, 395, 0, 65)
                            Shadow.Image = "http://www.roblox.com/asset/?id=5554236805"
                            Shadow.ImageColor3 = Color3.fromRGB(25, 25, 25)
                            Shadow.ScaleType = Enum.ScaleType.Slice
                            Shadow.SliceCenter = Rect.new(23, 23, 277, 277)

                            TextLabel.Parent = Textbox
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Position = UDim2.new(0.0273224041, 0, 0, 0)
                            TextLabel.Size = UDim2.new(0, 213, 0, 36)
                            TextLabel.Font = Enum.Font.GothamSemibold
                            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.TextSize = 12.000
                            TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                            TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
                            TextLabel.Text = title 

                            input.Name = "input"
                            input.Parent = Textbox
                            input.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                            input.Position = UDim2.new(0.546448112, 0, 0.222222239, 0)
                            input.Size = UDim2.new(0, 157, 0, 20)
                            input.Font = Enum.Font.Gotham
                            input.Text = ""
                            input.TextColor3 = Color3.fromRGB(0, 0, 0)
                            input.TextSize = 12.000
                            input.PlaceholderText = placeholdertext
                            input.TextColor3 = Color3.fromRGB(255,255,255)
                            input.ClipsDescendants = true 
                            input.TextXAlignment = Enum.TextXAlignment.Right
                            input.ClearTextOnFocus = false 


                            UICorner_2.CornerRadius = UDim.new(0, 4)
                            UICorner_2.Parent = input

                            e.Parent = input
                            e.PaddingRight = UDim.new(0,6)
                            input.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
                                if enterPressed then
                                    pcall(callback, input.Text)
                                    input.Text = ""
                                end
                            end)
                    end
                    function Elements:Dropdown(title,list,callback)
                        title = title or "New Dropdown"
                        if not title then title = "New Dropdown" end 
                        list = list or {}
                        if not list then list = {} end 
                        callback = callback or function() end 
                        if not callback then callback = function() end end 
                        local dropped = false 

                        local i = TweenInfo.new(
                            0.25,
                            Enum.EasingStyle.Sine,
                            Enum.EasingDirection.InOut,
                            0,
                            false,
                            0
                        )
                        
                    local Dropdown = Instance.new("Frame")
                    local ToggleButton = Instance.new("TextButton")
                    local Shadow = Instance.new("ImageLabel")
                    local UICorner = Instance.new("UICorner")
                    local TextLabel = Instance.new("TextLabel")
                    local f = Instance.new("UIListLayout")
                    local UICorner_2 = Instance.new("UICorner")
                    local ori = Instance.new("ImageLabel")

              
                    Dropdown.Name = "Dropdown"
                    Dropdown.Parent = Page
                    Dropdown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    Dropdown.ClipsDescendants = true
                    Dropdown.Position = UDim2.new(0.0271317828, 0, 0.584415555, 0)
                    Dropdown.Size = UDim2.new(0, 366, 0, 36)

                    ToggleButton.Name = "ToggleButton"
                    ToggleButton.Parent = Dropdown
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    ToggleButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    ToggleButton.Size = UDim2.new(0, 366, 0, 36)
                    ToggleButton.AutoButtonColor = false
                    ToggleButton.Font = Enum.Font.SourceSans
                    ToggleButton.Text = ""
                    ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                    ToggleButton.TextSize = 14.000

                    Shadow.Name = "Shadow"
                    Shadow.Parent = ToggleButton
                    Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Shadow.BackgroundTransparency = 1.000
                    Shadow.Position = UDim2.new(-0.0396174863, 0, -0.416666687, 0)
                    Shadow.Selectable = true
                    Shadow.Size = UDim2.new(0, 395, 0, 65)
                    Shadow.Image = "http://www.roblox.com/asset/?id=5554236805"
                    Shadow.ImageColor3 = Color3.fromRGB(25, 25, 25)
                    Shadow.ScaleType = Enum.ScaleType.Slice
                    Shadow.SliceCenter = Rect.new(23, 23, 277, 277)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = ToggleButton

                    TextLabel.Parent = ToggleButton
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.Position = UDim2.new(0.0273224041, 0, 0, 0)
                    TextLabel.Size = UDim2.new(0, 303, 0, 36)
                    TextLabel.Font = Enum.Font.GothamSemibold
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
                    TextLabel.Text = title 

                    ori.Name = "ori"
                    ori.Parent = ToggleButton
                    ori.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ori.BackgroundTransparency = 1.000
                    ori.Position = UDim2.new(0.92349726, 0, 0.166666672, 0)
                    ori.Size = UDim2.new(0, 21, 0, 23)
                    ori.Image = "rbxassetid://9431624258"


                    f.Parent = Dropdown
                    f.HorizontalAlignment = Enum.HorizontalAlignment.Center
                    f.SortOrder = Enum.SortOrder.LayoutOrder
                    f.Padding = UDim.new(0, 5)

                    UICorner_2.CornerRadius = UDim.new(0, 4)
                    UICorner_2.Parent = Dropdown

                    local function newitem(v)

                        local dropitem = Instance.new("TextButton")
                        local UICorner_3 = Instance.new("UICorner")
                        local TextLabel_2 = Instance.new("TextLabel")

                    dropitem.Name = "dropitem"
                    dropitem.Parent = Dropdown
                    dropitem.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    dropitem.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    dropitem.Position = UDim2.new(-0.00409836043, 0, 0.263513505, 0)
                    dropitem.Size = UDim2.new(0, 353, 0, 26)
                    dropitem.AutoButtonColor = false
                    dropitem.Font = Enum.Font.SourceSans
                    dropitem.Text = ""
                    dropitem.TextColor3 = Color3.fromRGB(0, 0, 0)
                    dropitem.TextSize = 14.000

                    UICorner_3.CornerRadius = UDim.new(0, 4)
                    UICorner_3.Parent = dropitem

                    TextLabel_2.Parent = dropitem
                    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel_2.BackgroundTransparency = 1.000
                    TextLabel_2.Position = UDim2.new(0.087912634, 0, 0.0512820408, 0)
                    TextLabel_2.Size = UDim2.new(0, 300, 0, 22)
                    TextLabel_2.Font = Enum.Font.GothamSemibold
                    TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel_2.TextSize = 12.000
                    TextLabel_2.TextTruncate = Enum.TextTruncate.AtEnd
                    TextLabel_2.Text = v

                    On("enter",dropitem)
                    On("leave",dropitem)

                    dropitem.MouseButton1Click:Connect(function()
                            pcall(callback,TextLabel_2.Text)
                            TweenService:Create(Dropdown,i,{Size = UDim2.new(0, 366, 0, 36)}):Play()
                            TextLabel.Text = title .. " - " .. TextLabel_2.Text
                            dropped = false 
                            TweenService:Create(ori,i,{Rotation = 0}):Play()
                        end)
                    end

                    for i,v in pairs(list) do
                        newitem(v)
                    end

                    ToggleButton.MouseButton1Click:Connect(function()
                        if dropped then
                            dropped = false 
                            TweenService:Create(Dropdown,i,{Size = UDim2.new(0, 366, 0, 36)}):Play()
                            TweenService:Create(ori,i,{Rotation = 0}):Play()

                        else
                            dropped = true
                            TweenService:Create(ori,i,{Rotation = 180}):Play()
                            TweenService:Create(Dropdown,i,{Size = UDim2.new(0, 366, 0,f.AbsoluteContentSize.Y + 9)}):Play()
                        end
                      end)
                    end
                        function Elements:Keybind(title,key,callback)
                            title = title or 'New Keybind'
                            if not title then title = 'New Keybind' end 
                            oldkey = key.Name or Enum.KeyCode.F.Name

                    local Keybind = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local Shadow = Instance.new("ImageLabel")
                    local TextLabel = Instance.new("TextLabel")
                    local key = Instance.new("TextButton")
                    local UICorner_2 = Instance.new("UICorner")

                    Keybind.Name = "Keybind"
                    Keybind.Parent = Page
                    Keybind.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    Keybind.Position = UDim2.new(0.0271317828, 0, 0, 0)
                    Keybind.Size = UDim2.new(0, 366, 0, 36)

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = Keybind

                    Shadow.Name = "Shadow"
                    Shadow.Parent = Keybind
                    Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Shadow.BackgroundTransparency = 1.000
                    Shadow.Position = UDim2.new(-0.0396174863, 0, -0.416666687, 0)
                    Shadow.Selectable = true
                    Shadow.Size = UDim2.new(0, 395, 0, 65)
                    Shadow.Image = "http://www.roblox.com/asset/?id=5554236805"
                    Shadow.ImageColor3 = Color3.fromRGB(25, 25, 25)
                    Shadow.ScaleType = Enum.ScaleType.Slice
                    Shadow.SliceCenter = Rect.new(23, 23, 277, 277)

                    TextLabel.Parent = Keybind
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.Position = UDim2.new(0.0273224041, 0, 0, 0)
                    TextLabel.Size = UDim2.new(0, 213, 0, 36)
                    TextLabel.Font = Enum.Font.GothamSemibold
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 12.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    TextLabel.Text = title 
                    TextLabel.TextTruncate = Enum.TextTruncate.AtEnd

                    key.Name = "key"
                    key.Parent = Keybind
                    key.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                    key.Position = UDim2.new(0.825136602, 0, 0.138888896, 0)
                    key.Size = UDim2.new(0, 58, 0, 25)
                    key.AutoButtonColor = false
                    key.Font = Enum.Font.SourceSansSemibold
                    key.Text = oldkey
                    key.TextColor3 = Color3.fromRGB(255, 255, 255)
                    key.TextSize = 12.000

                    UICorner_2.CornerRadius = UDim.new(0, 4)
                    UICorner_2.Parent = key
                    
                    key.MouseButton1Click:Connect(function()
                        key.Text = "..."
                        local a,b = game:GetService("UserInputService").InputBegan:wait()
                        if a.KeyCode.Name ~= "Unknown" then
                            key.Text = a.KeyCode.Nane 
                            oldkey = a.KeyCode.Name
                        end
                    end)

                    game:GetService("UserInputService").InputBegan:Connect(function(cur, ok)
                        if not ok then
                            if cur.KeyCode.Name == oldkey then
                                pcall(callback)
                            end
                        end
                    end)
                end
                    return Elements
                end
                return Categorys
end
return Vlassis
