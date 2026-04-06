-- [[ Developer Settings (some should be on in development, when release, turn them off) ]]
local EnableDebug = true -- [[ prints stuff to console for debugging ]]

-- [[ Services ]]
local Players = game:GetService('Players')
local CoreGui = game:GetService('CoreGui')
local TweenService = game:GetService('TweenService')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
Player = Players.LocalPlayer
Character = Player.Character
Humanoid = Character.Humanoid
RootPart = Humanoid.RootPart

-- [[ Main Functions ]]
local function debug(...)
    if not EnableDebug then return end
    print(...)
end

local RunFunction = function(func)
    func()
end

-- [[ Main GUI ]]
local GuiLibrary = {}

-- [[ themes here and stuff :> (why did i add this) ]]
local ToggleUI = 'V'

local Themes = {
    ['c00lgui'] = {
        ['BackgroundColor'] = {0},
        ['BackgroundTransparency'] = 0,

        ['BorderColor'] = {255},
        ['BorderSize'] = 3,

		['TextColor'] = {255},
		['TitleColor'] = {255, 255, 255},

        ['CornerRadius'] = 0,

        ['Font'] = 'SourceSans',
        ['Title'] = 'c00lgui',

        ['Padding'] = 10,

        ['ToolTipTransparency'] = 0,
        ['ToolTipTextColor'] = {255},

        ['CoolAnimations'] = false -- [[ makes some cool stuff move idk. ]]
    },
    ['neurongui'] = {
        ['BackgroundColor'] = {0},
        ['BackgroundTransparency'] = 0.6,

        ['BorderColor'] = {244, 244, 244},
        ['BorderSize'] = 1.5,

        ['Padding'] = 7,

        ['CornerRadius'] = 10,

        ['TextColor'] = {255, 255, 255},
		['TitleColor'] = {255, 255, 255},

        ['Font'] = 'Ubuntu',
        ['Title'] = 'neuron',

        ['ToolTipTransparency'] = 0.6,
        ['ToolTipTextColor'] = {255, 255, 255},

        ['CoolAnimations'] = true
    },
    -- [[ i like tubers lol ]]
    ['tubers'] = {
        ['BackgroundColor'] = {0},
        ['BackgroundTransparency'] = 0.2,
        ['BackgroundImage'] = 'rbxassetid://97165905484478',

        ['BorderColor'] = {244, 50, 244},
        ['BorderSize'] = 1.5,

        ['Padding'] = 7,

        ['CornerRadius'] = 3,

        ['TextColor'] = {255, 255, 255},
		['TitleColor'] = {255, 255, 255},

        ['Font'] = 'Code',
        ['Title'] = 'Tubers93 Destroyer!',

        ['ToolTipTransparency'] = 0.6,
        ['ToolTipTextColor'] = {255, 255, 255},

        ['CoolAnimations'] = true
    }
}
Theme = 'tubers'

GuiParent = Player.PlayerGui --[[gethui() or CoreGui or Player.PlayerGui]] -- [[ gethui() protects the gui so it is not detectable ]]
HUIProtected = gethui():GetFullName():find('CoreGui') and false or true

if not HUIProtected then
    if gethui():FindFirstChild('C00lGuiByKwipflyx') then
        gethui().C00lGuiByKwipflyx:Destroy()
    end
end
if shared.C00lGui then
    shared.C00lGui:Destroy()
end

Gui = Instance.new('ScreenGui')
shared.C00lGui = Gui -- [[ this saves the gui globally so any script can access it, we'll save it so if the user runs the script again, the gui is destroyed as cleanup. ]]
Gui.Parent = GuiParent
Gui.Name = 'C00lGuiByKwipflyx'
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true

debug('user executor: '..({identifyexecutor()})[1]..' ('..'v'..(({identifyexecutor()})[2]:gsub('v', ''))..')')
debug('C00lgui is located at: '..Gui.Parent:GetFullName())

-- [[ Functions ]]
local function CoolAnimation(func, func2) -- [[ if cool animation is true, it runs function 1, otherwise, function 2 ]]
    if Themes[Theme].CoolAnimations then
        if func then
            func()
        end
    else
        if func2 then
            func2()
        end
    end
end

local function ApplyStroke(Object)
    local Stroke = Instance.new('UIStroke')
    Stroke.Parent = Object
    Stroke.Color = Color3.fromRGB(unpack(Themes[Theme].BorderColor))
    Stroke.Thickness = Themes[Theme].BorderSize
    Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return Stroke
end

local function ApplyCorner(Object, Radius)
    local Corner = Instance.new('UICorner')
    Corner.Parent = Object
    Corner.CornerRadius = UDim.new(0, Radius or 0)
    return Corner
end

-- [[ ToolTip ]]
Tip = Instance.new('TextLabel')
TipSize = Instance.new('UIScale')
TipSize.Parent = Tip
TipSize.Scale = 0.7
ApplyCorner(Tip, Themes[Theme].CornerRadius)
ApplyStroke(Tip)
Tip.Parent = Gui
Tip.Visible = false
Tip.TextScaled = true
Tip.Text = ''
Tip.ZIndex = 50000
Tip.Size = UDim2.new(0, 240, 0, 35)
Tip.BackgroundColor3 = Color3.fromRGB(0,0,0)
Tip.TextColor3 = Color3.fromRGB(unpack(Themes[Theme].ToolTipTextColor))
Tip.BackgroundTransparency = Themes[Theme].ToolTipTransparency
Tip.BorderSizePixel = 0

local mouse = Player:GetMouse()
local offsetX, offsetY = 11, 66

RunService.Heartbeat:Connect(function()
    Tip.Position = UDim2.new(0, mouse.X + offsetX, 0, mouse.Y + offsetY)
end)

local function ToolTip(Table, State)
    Tip.Visible = State
    Tip.Text = Table.Text
end

-- [[ this is the main frame, this is where most visual stuff will be at ]]

-- [[ idk where tf the main frame is but uh, more frame lol ]]
local MoreFrame = Instance.new('ImageLabel')
ApplyStroke(MoreFrame)
ApplyCorner(MoreFrame, Themes[Theme].CornerRadius)
MoreFrame.Parent = Gui
MoreFrame.Image = Theme == 'tubers' and 'rbxassetid://83619406140795' or 'rbxassetid://0'
MoreFrame.ImageTransparency = 0.7
MoreFrame.Size = UDim2.new(0, 300, 0, 370)
MoreFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MoreFrame.Position = UDim2.new(0.697, 0, 0.5, 0)
MoreFrame.Visible = false
MoreFrame.BorderSizePixel = 0
MoreFrame.BackgroundTransparency = Themes[Theme].BackgroundTransparency
MoreFrame.BackgroundColor3 = Color3.fromRGB(unpack(Themes[Theme].BackgroundColor))
MoreFrame.ClipsDescendants = true

local MoreFrameListLayout = Instance.new('UIListLayout')
MoreFrameListLayout.Parent = MoreFrame
MoreFrameListLayout.Padding = UDim.new(0, Themes[Theme].Padding)
MoreFrameListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- [[ more frame functions ]]
local function AddMoreSection(Table)
    local Section = Instance.new('TextLabel')
    Section.Size = UDim2.new(1, 0, 0.09, 0)
    Section.BackgroundTransparency = 1
    Section.Font = Enum.Font[Themes[Theme].Font]
    Section.TextColor3 = Color3.fromRGB(unpack(Themes[Theme].TextColor))
    Section.Text = Table.Text
    Section.TextScaled = true
    Section.Parent = MoreFrame
end
local function AddMoreButton(Table)
    local Button = Instance.new('TextButton')
    Button.BackgroundTransparency = 0.7
    Button.BackgroundColor3 = Color3.fromRGB(unpack(Themes[Theme].BorderColor))
    Button.TextColor3 = Color3.fromRGB(unpack(Themes[Theme].TextColor))
    Button.Font = Enum.Font[Themes[Theme].Font]
    Button.Size = UDim2.new(1, 0, 0.07, 0)
    Button.TextScaled = true
    Button.Text = Table.Text
    Button.Parent = MoreFrame

    Button.MouseButton1Down:Connect(Table.Function)
    ApplyStroke(Button)
end

AddMoreSection({
    Text = 'UI Interface'
})
AddMoreButton({
    Text = 'Unload GUI',
    Function = function()
        shared.C00lGui:Destroy()
    end
})

local MoreButton = Instance.new('TextButton')
ApplyStroke(MoreButton)
ApplyCorner(MoreButton, Themes[Theme].CornerRadius)
MoreButton.Parent = Gui
MoreButton.BorderSizePixel = 0
MoreButton.BackgroundTransparency = Themes[Theme].BackgroundTransparency
MoreButton.BackgroundColor3 = Color3.fromRGB(unpack(Themes[Theme].BackgroundColor))
MoreButton.ClipsDescendants = true
MoreButton.Text = '>' 
MoreButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MoreButton.TextSize = 23
MoreButton.Size = UDim2.new(0, 30, 0, 370)

-- MoreFrame.Size = UDim2.new(0, 300, 0, 370)
MoreButton.MouseButton1Down:Connect(function()
    if MoreButton.Text == '>' then
        MoreButton.Text = '<'
        MoreFrame.Visible = true
        CoolAnimation(function()
            MoreFrame.Size = UDim2.new(0, 0, 0, 370)
            TweenService:Create(MoreFrame, TweenInfo.new(
                0.5,
                Enum.EasingStyle.Circular,
                Enum.EasingDirection.Out
            ), {
                Size = UDim2.new(0, 300, 0, 370)
            }):Play()
        end)
    else
        CoolAnimation(function()
            local Tween = TweenService:Create(MoreFrame, TweenInfo.new(
                0.2,
                Enum.EasingStyle.Circular,
                Enum.EasingDirection.Out
            ), {
                Size = UDim2.new(0, 0, 0, 370)
            })
            Tween:Play()
            Tween.Completed:Wait()
        end)
        MoreButton.Text = '>'
		MoreFrame.Visible = false
    end
end)

--      [[ THE ]]
--      [[ REAL ]]
-- [[ **MAINFRAME...** ]]

local MainFrame = Instance.new('ImageLabel')
ApplyStroke(MainFrame)
ApplyCorner(MainFrame, Themes[Theme].CornerRadius)
MainFrame.Parent = Gui
MainFrame.Image = Themes[Theme].BackgroundImage or 'rbxassetid://0'
MainFrame.ImageTransparency = 0.7
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

CoolAnimation(nil, function()
    MainFrame.Size = UDim2.new(0, 300, 0, 370)
end)
MainFrame.Draggable = true
MainFrame.Active = true
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = Themes[Theme].BackgroundTransparency
MainFrame.BackgroundColor3 = Color3.fromRGB(unpack(Themes[Theme].BackgroundColor))
MainFrame.ClipsDescendants = true

-- [[ tubers93 icon!!!1 ]]
local HotDudes = {
    140539405777351,
    120450762955124,
    8595285721,
    132505314197112,
    136846277534931,
    82434403791895,
    131425788883978,
    17315237983,
    123880866993986,
    9115683975
}

local Icon
if Theme == 'tubers' then
    Icon = Instance.new('ImageLabel')
    Icon.Image = 'rbxassetid://'..tostring(HotDudes[math.random(1, #HotDudes)])
    Icon.BackgroundTransparency = 0
    Icon.BackgroundColor3 = Color3.fromRGB(0)
    Icon.Position = UDim2.new(0.05, 0, 0.05, 0)
    local Size = 55
    Icon.ZIndex = 9999
    Icon.AnchorPoint = Vector2.new(0.5, 0.5)
    Icon.Size = UDim2.new(0, 0, 0, 0)
    Icon.Parent = MainFrame
    ApplyStroke(Icon)
    task.delay(0.8, function()
        TweenService:Create(Icon, TweenInfo.new(
            1,
            Enum.EasingStyle.Bounce,
            Enum.EasingDirection.Out
        ), {
            Size = UDim2.new(0, Size, 0, Size)
        }):Play()
    end)
end

RunService.Heartbeat:Connect(function()
    if Icon then
        Icon.Rotation -= 0.7
    end
    MoreFrame.Position = MainFrame.Position + UDim2.new(0, 302.5, 0, 0)
    if MoreFrame.Visible then
		MoreButton.Position = MainFrame.Position + UDim2.new(0, 455, 0, -185)
	else
		MoreButton.Position = MainFrame.Position + UDim2.new(0, 153, 0, -185)
	end
end)

Icon.MouseEnter:Connect(function()
    TweenService:Create(Icon, TweenInfo.new(
        0.1,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out
    ), {
        Size = UDim2.new(0, 70, 0, 70)
    }):Play()
end)

Icon.MouseLeave:Connect(function()
    TweenService:Create(Icon, TweenInfo.new(
        0.5,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out
    ), {
        Size = UDim2.new(0, 55, 0, 55)
    }):Play()
end)


-- [[ rotating thing or pop out ]]
CoolAnimation(function()
    MoreButton.Size = UDim2.new(0, 0, 0, 370)
    MoreButton.Visible = false
    task.delay(0.7, function()
        MoreButton.Visible = true
        TweenService:Create(MoreButton, TweenInfo.new(
            0.6,
            Enum.EasingStyle.Circular,
            Enum.EasingDirection.InOut
        ), {
            Size = UDim2.new(0, 30, 0, 370)
        }):Play()
    end)
    MainFrame.Rotation = math.random(1, 2) == 1 and 190 or -190
    TweenService:Create(MainFrame, TweenInfo.new(
        0.6,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.Out
    ), {
        Size = UDim2.new(0, 300 + 100, 0, 370 - math.random(-100,100))
    }):Play()
    task.delay(0.6, function()
        TweenService:Create(MainFrame, TweenInfo.new(
            0.4,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out
        ), {
            Size = UDim2.new(0, 300, 0, 370)
        }):Play()
    end)
    TweenService:Create(MainFrame, TweenInfo.new(
        0.9,
        Enum.EasingStyle.Quart,
        Enum.EasingDirection.InOut
    ), {
        Rotation = 0
    }):Play()
end)

local MainTitle = Instance.new('TextLabel')
MainTitle.Parent = MainFrame
MainTitle.BorderSizePixel = 0
MainTitle.AnchorPoint = Vector2.new(0.5, 0.5)
MainTitle.Position = UDim2.new(0.5, 0, 0.06, 0)
MainTitle.Size = UDim2.new(1, 0, 0.1, 0)
MainTitle.Text = Themes[Theme].Title or 'c00lgui'
MainTitle.BackgroundTransparency = 1
MainTitle.TextColor3 = Color3.fromRGB(unpack(Themes[Theme].TitleColor))
MainTitle.Font = Enum.Font[Themes[Theme].Font]
MainTitle.TextSize = 25

local MainFrameContents = Instance.new('Frame')
ApplyStroke(MainFrameContents)
MainFrameContents.BackgroundTransparency = 1
MainFrameContents.Parent = MainFrame
MainFrameContents.Position = UDim2.new(0, 0, 0.12, 0)
MainFrameContents.Size = UDim2.new(1, 0, 0.88, 0)

local MainContentsScrollingFrame = Instance.new('ScrollingFrame')
local MainContentsScrollingFrameUIListLayout = Instance.new('UIListLayout')
MainContentsScrollingFrameUIListLayout.Parent = MainContentsScrollingFrame
MainContentsScrollingFrameUIListLayout.Padding = UDim.new(0, Themes[Theme].Padding)
MainContentsScrollingFrameUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
MainContentsScrollingFrame.Parent = MainFrameContents
MainContentsScrollingFrame.Size = UDim2.new(0.5, 0, 1, 0)
MainContentsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 600)
MainContentsScrollingFrame.ScrollBarThickness = 0
MainContentsScrollingFrame.BackgroundTransparency = 1

local SecondMainContentsScrollingFrame = Instance.new('ScrollingFrame')
local SecondMainContentsScrollingFrameUIListLayout = Instance.new('UIListLayout')
SecondMainContentsScrollingFrameUIListLayout.Parent = SecondMainContentsScrollingFrame
SecondMainContentsScrollingFrameUIListLayout.Padding = UDim.new(0, 3)
SecondMainContentsScrollingFrameUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
SecondMainContentsScrollingFrame.Parent = MainFrameContents
SecondMainContentsScrollingFrame.Position = UDim2.new(0.5, 0, 0, 0)
SecondMainContentsScrollingFrame.Size = UDim2.new(0.5, 0, 1, 0)
SecondMainContentsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 600)
SecondMainContentsScrollingFrame.ScrollBarThickness = 0
SecondMainContentsScrollingFrame.BackgroundTransparency = 1

-- [[ cool text animation! ]]
CoolAnimation(function()
    local TitleText = MainTitle.Text
    MainTitle.Text = ''
    task.wait(0.6)
    for ind = 1, #TitleText do
        task.wait(0.1)
        MainTitle.Text = MainTitle.Text..TitleText:sub(ind,ind)
    end
end)

-- [[ text spiiiiiiiiiiiiiiin ]]
CoolAnimation(function()
    local Hovering = false

    MainTitle.MouseEnter:Connect(function()
        Hovering = true
    end)
    MainTitle.MouseLeave:Connect(function()
        Hovering = false
        TweenService:Create(MainTitle, TweenInfo.new(
            0.5,
            Enum.EasingStyle.Circular,
            Enum.EasingDirection.Out
        ), {
            Rotation = 0
        }):Play()
    end)
    RunService.Heartbeat:Connect(function()
        if Hovering then
            MainTitle.Rotation += 0.5
        end
    end)
end)

CoolAnimation(nil, function()
    UserInputService.InputBegan:Connect(function(Input, GP)
        if GP then return end
        if Input.KeyCode == Enum.KeyCode[ToggleUI] then
            Gui.Enabled = not Gui.Enabled
        end
    end)
end)

-- [[ Library Functionality, ETC ]]
GuiLibrary.NewButton = function(Table)
    -- [[ Module ]]
    local Button = Instance.new('TextButton')
    ApplyStroke(Button)
    Button.Parent = Table.Side == 'Left' and MainContentsScrollingFrame or SecondMainContentsScrollingFrame
    Button.Size = UDim2.new(0.98, 0, 0.05, 0)
	Button.TextScaled = true
	Button.BackgroundColor3 = Color3.fromRGB(unpack(Themes[Theme].BackgroundColor))
	Button.Font = Enum.Font[Themes[Theme].Font]
	Button.Text = Table.Name
	Button.BackgroundTransparency = 1
	Button.TextColor3 = Color3.fromRGB(unpack(Themes[Theme].TextColor))
    Button.AutoButtonColor = false
    ApplyCorner(Button, math.clamp(Themes[Theme].CornerRadius, 0, 7))

    -- [[ Tooltip ]]
    if Table.ToolTip then
        Button.MouseEnter:Connect(function()
            local tip = ToolTip({
                Text = Table.ToolTip
            }, true)
        end)
        Button.MouseLeave:Connect(function()
            local tip = ToolTip({
                Text = Table.ToolTip
            }, false)
        end)
    else
        local tip = ToolTip({
            Text = Table.ToolTip
        }, false)
    end

    -- [[ Stuff I Guess ]]
    CoolAnimation(function()
        -- [[ wow cool button animations! ]]
        Button.MouseEnter:Connect(function()
            TweenService:Create(Button, TweenInfo.new(
                0.2,
                Enum.EasingStyle.Circular,
                Enum.EasingDirection.Out
            ), {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                TextColor3 = Color3.fromRGB(23,23,23)
            }):Play()
        end)
        Button.MouseLeave:Connect(function()
            TweenService:Create(Button, TweenInfo.new(
                0.5,
                Enum.EasingStyle.Circular,
                Enum.EasingDirection.Out
            ), {
                BackgroundColor3 = Color3.fromRGB(unpack(Themes[Theme].BackgroundColor)),
                TextColor3 = Color3.fromRGB(unpack(Themes[Theme].TextColor))
            }):Play()
        end)
    end)

    Button.MouseButton1Down:Connect(Table.Function)
end
GuiLibrary.NewInput = function(Table)
    -- [[ Module ]]
	local InputName = Instance.new('TextLabel')
	InputName.Text = Table.Text
	InputName.TextColor3 = Color3.fromRGB(255, 255, 255)
	InputName.Size = UDim2.new(0.98, 0, 0.04, 0)
	InputName.TextScaled = true
    InputName.Font = Enum.Font[Themes[Theme].Font]
	InputName.BackgroundTransparency = 1
    ApplyCorner(InputName, math.clamp(Themes[Theme].CornerRadius, 0, 7))
	ApplyStroke(InputName)
    InputName.Parent = Table.Side == 'Left' and MainContentsScrollingFrame or SecondMainContentsScrollingFrame

    local Input = Instance.new('TextBox')
    ApplyStroke(Input)
    ApplyCorner(Input, math.clamp(Themes[Theme].CornerRadius, 0, 7))
    Input.ClearTextOnFocus = Table['ClearOnFocus'] or false
    Input.Parent = Table.Side == 'Left' and MainContentsScrollingFrame or SecondMainContentsScrollingFrame
    Input.Size = UDim2.new(0.98, 0, 0.03, 0)
	Input.TextScaled = true
	Input.BackgroundColor3 = Color3.fromRGB(unpack(Themes[Theme].BackgroundColor))
	Input.Font = Enum.Font[Themes[Theme].Font]
	Input.Text = Table.Input or ''
	Input.BackgroundTransparency = 1
	Input.TextColor3 = Color3.fromRGB(unpack(Themes[Theme].TextColor))

    local InputTable = {}
    InputTable.GetValue = function()
        return Input.Text
    end

    -- [[ Tooltip ]]
    if Table.ToolTip then
	    InputName.MouseEnter:Connect(function()
            local tip = ToolTip({
                Text = Table.ToolTip
            }, true)
        end)
        InputName.MouseLeave:Connect(function()
            local tip = ToolTip({
                Text = Table.ToolTip
            }, false)
        end)
        Input.MouseEnter:Connect(function()
            local tip = ToolTip({
                Text = Table.ToolTip
            }, true)
        end)
        Input.MouseLeave:Connect(function()
            local tip = ToolTip({
                Text = Table.ToolTip
            }, false)
        end)
    else
        local tip = ToolTip({
            Text = Table.ToolTip
        }, false)
    end

    return InputTable
end
GuiLibrary.NewDropdown = function(Table)
    local DropdownButton = Instance.new('TextButton')
    ApplyStroke(DropdownButton)
    DropdownButton.Parent = Table.Side == 'Left' and MainContentsScrollingFrame or SecondMainContentsScrollingFrame
    DropdownButton.Size = UDim2.new(0.98, 0, 0.05, 0)
	DropdownButton.TextScaled = true
	DropdownButton.BackgroundColor3 = Color3.fromRGB(unpack(Themes[Theme].BackgroundColor))
	DropdownButton.Font = Enum.Font[Themes[Theme].Font]
	DropdownButton.Text = Table.Name
	DropdownButton.BackgroundTransparency = 1
	DropdownButton.TextColor3 = Color3.fromRGB(unpack(Themes[Theme].TextColor))
    DropdownButton.AutoButtonColor = false

    local DropdownGUI = Instance.new('Frame')
    DropdownGUI.Parent = DropdownButton
    DropdownGUI.BorderSizePixel = 0
    DropdownGUI.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    ApplyCorner(DropdownButton, math.clamp(Themes[Theme].CornerRadius, 0, 7))
end

--[[
Dropdown Test
GuiLibrary.NewDropdown({
    Name = 'sus'
})]]

GuiLibrary.NewSection = function(Table)
    local Section = Instance.new('TextLabel')
    Section.Parent = Table.Side == 'Left' and MainContentsScrollingFrame or SecondMainContentsScrollingFrame
    Section.TextScaled = not Table.FontSize
    Section.TextSize = Table.FontSize or 0
    Section.BackgroundTransparency = 1
    Section.TextColor3 = Color3.fromRGB(unpack(Themes[Theme].TextColor))
    Section.Font = Enum.Font[Themes[Theme].Font]
    Section.Size = UDim2.new(1, 0, 0.05, 0)
    Section.Text = Table.Text
end

-- [[ Gui Elements ]]

-- [[ Kill Target Module ]]
GuiLibrary.NewSection({
    Text = 'Blatant',
    Side = 'Left',
    FontSize = 24
})

local function clone()
    setfpscap(400)
    for _, v in next, workspace:GetDescendants() do
        if v.Name:find('clone') and v.Name:find(game.Players.LocalPlayer.Name) then
            v:Destroy()
        end
    end
    local lp = game.Players.LocalPlayer
    local char = lp.Character
    if not char then return end
    for _, obj in char:GetChildren() do
        if obj:IsA('BasePart') and obj.Name ~= 'HumanoidRootPart' then
            obj.CanCollide = false
        end
    end
    local function setCharVis(vis)
        for _, obj in ipairs(char:GetChildren()) do
            if obj:IsA('Accessory') then
                obj.Handle.Transparency = vis
            elseif obj:IsA('BasePart') and obj.Name ~= 'HumanoidRootPart' then
                obj.Transparency = vis
                local decal = obj:FindFirstChildWhichIsA('Decal')
                if decal then decal.Transparency = vis end
            end
        end
    end
    setCharVis(0)
    task.wait()
    char.Archivable = true
    local cloneChar = char:Clone()
    char.Archivable = false
    cloneChar.Parent = workspace
    cloneChar.Name = lp.Name..'_clone_'..tostring(math.random(1, 10000))
    cloneChar.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    local animRoot = char:FindFirstChild('Animate')
    if not animRoot then return end
    local function makeAnim(id)
        local a = Instance.new('Animation')
        a.AnimationId = id
        return a
    end
    local idle1Track  = cloneChar.Humanoid.Animator:LoadAnimation(makeAnim(animRoot.idle.Animation1.AnimationId))
    local idle2Track = cloneChar.Humanoid.Animator:LoadAnimation(makeAnim(animRoot.idle.Animation2.AnimationId))
    local walkTrack  = cloneChar.Humanoid.Animator:LoadAnimation(makeAnim(animRoot.walk.WalkAnim.AnimationId))
    local jumpTrack  = cloneChar.Humanoid.Animator:LoadAnimation(makeAnim(animRoot.jump.JumpAnim.AnimationId))
    local fallTrack = cloneChar.Humanoid.Animator:LoadAnimation(makeAnim(animRoot.fall.FallAnim.AnimationId))
    idle2Track.Looped = false
    jumpTrack.Looped  = false
    local function stopAll()
        idle1Track:Stop()
        idle2Track:Stop()
        walkTrack:Stop()
        jumpTrack:Stop()
        fallTrack:Stop()
    end
    local state = 'idle'
    local airborne = false
    local function setState(s)
        if state == s then return end
        state = s
        stopAll()
        if s == 'walk' and not airborne then walkTrack:Play()
        elseif s == 'idle' and not airborne then idle1Track:Play() end
    end
    setState('idle')
    workspace.CurrentCamera.CameraSubject = cloneChar.Humanoid
    local keys = {w=false, a=false, s=false, d=false, space=false}
    local function anyMove() return keys.w or keys.a or keys.s or keys.d end
    pcall(function() shared.x1:Disconnect() end)
    pcall(function() shared.x2:Disconnect() end)
    pcall(function() shared.x3:Disconnect() end)
    pcall(function() shared.x4:Disconnect() end)
    local function makeSound(id, vol, speed, looped)
        local s = Instance.new('Sound', cloneChar.HumanoidRootPart)
        s.SoundId = id
        s.Volume = vol
        s.PlaybackSpeed = speed
        s.Looped = looped
        return s
    end
    local walkSound = makeSound('rbxasset://sounds/action_footsteps_plastic.mp3', 0.65, 1.85, true)
    local jumpSound = makeSound('rbxasset://sounds/action_jump.mp3', 0.65, 1, false)
    local oofSound  = makeSound('rbxasset://sounds/uuhhh.mp3', 0.65, 1, false)
    cloneChar.Humanoid.StateChanged:Connect(function(_, new)
        if new == Enum.HumanoidStateType.Jumping or new == Enum.HumanoidStateType.Freefall then
            if not airborne then
                airborne = true
                stopAll()
                jumpTrack:Play()
                jumpTrack.Stopped:Wait()
                if airborne then fallTrack:Play() end
            end
        elseif new == Enum.HumanoidStateType.Landed
            or new == Enum.HumanoidStateType.Running
            or new == Enum.HumanoidStateType.RunningNoPhysics then
            if airborne then
                airborne = false
                stopAll()
                if anyMove() then walkTrack:Play() else idle1Track:Play() end
            end
        end
    end)
    shared.x1 = game:GetService('UserInputService').InputBegan:Connect(function(input, gp)
        if gp then return end
        if   input.KeyCode == Enum.KeyCode.W  then keys.w   = true
        elseif input.KeyCode == Enum.KeyCode.A   then keys.a   = true
        elseif input.KeyCode == Enum.KeyCode.S   then keys.s    = true
        elseif input.KeyCode == Enum.KeyCode.D  then keys.d   = true
        elseif input.KeyCode == Enum.KeyCode.Space then keys.space = true
        else return end
        if input.KeyCode ~= Enum.KeyCode.Space then
            setState('walk')
            if not airborne then walkSound:Play() end
        end
    end)
    shared.x2 = game:GetService('UserInputService').InputEnded:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.W then keys.w   = false
        elseif input.KeyCode == Enum.KeyCode.A  then keys.a   = false
        elseif input.KeyCode == Enum.KeyCode.S  then keys.s   = false
        elseif input.KeyCode == Enum.KeyCode.D   then keys.d   = false
        elseif input.KeyCode == Enum.KeyCode.Space then keys.space = false
        else return end
        if not anyMove() and input.KeyCode ~= Enum.KeyCode.Space then
            setState('idle')
            walkSound:Stop()
        end
    end)
    local smoothRot = cloneChar.HumanoidRootPart.CFrame.LookVector
    shared.x3 = game:GetService('RunService').Heartbeat:Connect(function(dt)
        if not cloneChar or not cloneChar.Parent then return end
        local hrp = cloneChar.HumanoidRootPart
        local walkspeed = cloneChar.Humanoid.WalkSpeed
        local cam = workspace.CurrentCamera
        local forward = Vector3.new(cam.CFrame.LookVector.X, 0, cam.CFrame.LookVector.Z).Unit
        local right   = Vector3.new(cam.CFrame.RightVector.X, 0, cam.CFrame.RightVector.Z).Unit
        local wishDir = Vector3.zero
        if keys.w then wishDir += forward end
        if keys.s then wishDir -= forward end
        if keys.a then wishDir -= right end
        if keys.d then wishDir += right end
        if wishDir.Magnitude > 0.01 then wishDir = wishDir.Unit end
        local yVel = hrp.Velocity.Y
        local xzVel = wishDir * walkspeed * 1.22
        hrp.AssemblyLinearVelocity = Vector3.new(xzVel.X, yVel, xzVel.Z)
        if keys.space then
            jumpSound:Play()
            cloneChar.Humanoid.Jump = true
        end
        if wishDir.Magnitude > 0.1 then
            smoothRot = smoothRot:Lerp(wishDir, 0.05)
            if smoothRot.Magnitude > 0.001 then
                local pos = hrp.Position
                hrp.CFrame = CFrame.new(pos, pos + smoothRot)
            end
        end
    end)
    task.spawn(function()
        while cloneChar and cloneChar.Parent do
            task.wait(math.random(3, 11))
            if state == 'idle' and not airborne then
                stopAll()
                idle2Track:Play()
                idle2Track.Stopped:Wait()
                if state == 'idle' and not airborne then
                    idle1Track:Play()
                end
            end
        end
    end)
    shared.x4 = char.Humanoid.Died:Connect(function()
        shared.x4:Disconnect()
        cloneChar.Humanoid.Health = 0
        oofSound:Play()
    end)
    task.wait(0.01)
    setCharVis(1)
    return cloneChar
end

local function unclone()
    setfpscap(400)
    for _, v in next, workspace:GetDescendants() do
        if v.Name:find('clone') and v.Name:find(game.Players.LocalPlayer.Name) then
            v:Destroy()
        end
    end
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    for _, obj in ipairs(char:GetChildren()) do
        if obj:IsA('Accessory') then
            obj.Handle.Transparency = 0
        elseif obj:IsA('BasePart') and obj.Name ~= 'HumanoidRootPart' then
            obj.Transparency = 0
            local decal = obj:FindFirstChildWhichIsA('Decal')
            if decal then decal.Transparency = 0 end
        end
    end
    for _, obj in char:GetChildren() do
        if obj:IsA('BasePart') and obj.Name ~= 'HumanoidRootPart' then
            obj.CanCollide = true
        end
    end
    workspace.CurrentCamera.CameraSubject = char.Humanoid
end
local function HugPlayer(target)
    local lp = game.Players.LocalPlayer
    local char = lp.Character
    if not char or not char:FindFirstChild('HumanoidRootPart') then return end
    local targetName = typeof(target) == 'string' and target or target.Name
    local targetPlayer = game.Players:FindFirstChild(targetName)
    if not targetPlayer then return end
    local oldCFrame = char.HumanoidRootPart.CFrame
    local done = false
    local newClone = clone()
    if not newClone then return end
    local conn = game:GetService('RunService').Heartbeat:Connect(function()
        local targetChar = targetPlayer.Character
        if not char:FindFirstChild('HumanoidRootPart') then return end
        if not targetChar or not targetChar:FindFirstChild('HumanoidRootPart') then return end
        local hrp = char.HumanoidRootPart
        local targetHRP = targetChar.HumanoidRootPart
        pcall(function()
            sethiddenproperty(hrp, 'PhysicsRepRootPart', targetHRP)
            hrp.CFrame = targetHRP.CFrame * CFrame.new(0, 1.3, 0) * CFrame.Angles(math.rad(0), 0, 0)
            hrp.AssemblyLinearVelocity = Vector3.new(0, -9999, 0)
        end)
    end)
    task.wait(0.3)
    conn:Disconnect()
    local hrp = char:FindFirstChild('HumanoidRootPart')
    if hrp then
        hrp.AssemblyLinearVelocity  = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end
    task.spawn(function()
        for i = 1, 10 do
            local cloneHRP = newClone and newClone:FindFirstChild('HumanoidRootPart')
            local charHRP  = char:FindFirstChild('HumanoidRootPart')
            if cloneHRP and charHRP then
                charHRP.CFrame = cloneHRP.CFrame
                charHRP.AssemblyLinearVelocity  = Vector3.zero
                charHRP.AssemblyAngularVelocity = Vector3.zero
                cloneHRP.AssemblyLinearVelocity  = Vector3.zero
                cloneHRP.AssemblyAngularVelocity = Vector3.zero
            end
            task.wait()
        end
        task.wait(0.05)
        char.Humanoid.PlatformStand = false
        task.wait(2.8)
        local charHRP  = char:FindFirstChild('HumanoidRootPart')
        local cloneHRP = newClone and newClone:FindFirstChild('HumanoidRootPart')
        charHRP.CFrame = cloneHRP.CFrame
        workspace.CurrentCamera.CameraSubject = char.Humanoid
        unclone()
    end)
end

RunFunction(function()
    local Input = GuiLibrary.NewInput({
        Text = "Kill Target",
        Input = "",
        Side = "Left",
        ToolTip = 'Select target...'
    })
    GuiLibrary.NewButton({
        Name = "Kill",
        ToolTip = "Kills target",
        Function = function()
            pcall(function()
                HugPlayer(Input.GetValue())
            end)
        end,
        Side = "Left"
    })
end)
