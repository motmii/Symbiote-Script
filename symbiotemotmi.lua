local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local T = {
    Background = Color3.fromRGB(8, 6, 14),
    Surface = Color3.fromRGB(14, 11, 24),
    SurfaceLight = Color3.fromRGB(22, 18, 36),
    SurfaceHover = Color3.fromRGB(32, 26, 52),
    Accent = Color3.fromRGB(140, 60, 255),
    AccentBright = Color3.fromRGB(170, 100, 255),
    AccentDark = Color3.fromRGB(90, 35, 180),
    AccentDim = Color3.fromRGB(55, 25, 110),
    Border = Color3.fromRGB(40, 30, 65),
    BorderLight = Color3.fromRGB(55, 42, 90),
    Text = Color3.fromRGB(245, 240, 255),
    TextSub = Color3.fromRGB(180, 170, 200),
    TextDim = Color3.fromRGB(120, 110, 150),
    TextMuted = Color3.fromRGB(75, 65, 105),
    Success = Color3.fromRGB(80, 220, 150),
    Error = Color3.fromRGB(240, 65, 75),
    ErrorDim = Color3.fromRGB(80, 25, 30),
    DropdownBg = Color3.fromRGB(12, 9, 20),
    Green = Color3.fromRGB(34, 140, 75),
}

local function tw(obj, props, dur, style, dir)
    TweenService:Create(
        obj,
        TweenInfo.new(dur or 0.18, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out),
        props
    ):Play()
end

local function addStroke(parent, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color or T.Border
    s.Thickness = thickness or 1
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

local old = CoreGui:FindFirstChild("KeySystemGui")
if old then old:Destroy() end

local SG = Instance.new("ScreenGui")
SG.Name = "KeySystemGui"
SG.ResetOnSpawn = false
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SG.DisplayOrder = 999
SG.IgnoreGuiInset = true
pcall(function() SG.Parent = CoreGui end)
if not SG.Parent then SG.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.5
Overlay.BorderSizePixel = 0
Overlay.ZIndex = 1
Overlay.Parent = SG

local Card = Instance.new("Frame")
Card.Name = "Card"
Card.Size = UDim2.new(0, 460, 0, 260) -- صغرت الارتفاع شوي لعدم وجود مربع النص
Card.Position = UDim2.new(0.5, -230, 0.5, -130)
Card.BackgroundColor3 = T.Background
Card.BorderSizePixel = 0
Card.ClipsDescendants = true
Card.ZIndex = 2
Card.Parent = SG
addStroke(Card, T.Border, 1)

local EdgeGlow = Instance.new("Frame")
EdgeGlow.Size = UDim2.new(1, 6, 1, 6)
EdgeGlow.Position = UDim2.new(0, -3, 0, -3)
EdgeGlow.BackgroundTransparency = 1
EdgeGlow.BorderSizePixel = 0
EdgeGlow.ZIndex = 1
EdgeGlow.Parent = Card

local edgeStroke = Instance.new("UIStroke")
edgeStroke.Color = T.AccentDim
edgeStroke.Thickness = 2
edgeStroke.Transparency = 0.4
edgeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
edgeStroke.Parent = EdgeGlow

local AccentLine = Instance.new("Frame")
AccentLine.Size = UDim2.new(1, 0, 0, 2)
AccentLine.Position = UDim2.new(0, 0, 0, 0)
AccentLine.BackgroundColor3 = T.Accent
AccentLine.BorderSizePixel = 0
AccentLine.ZIndex = 10
AccentLine.Parent = Card

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.Position = UDim2.new(0, 0, 0, 2)
TopBar.BackgroundColor3 = T.Surface
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 3
TopBar.Parent = Card

local topBottomLine = Instance.new("Frame")
topBottomLine.Size = UDim2.new(1, 0, 0, 1)
topBottomLine.Position = UDim2.new(0, 0, 1, 0)
topBottomLine.BackgroundColor3 = T.Border
topBottomLine.BorderSizePixel = 0
topBottomLine.ZIndex = 3
topBottomLine.Parent = TopBar

local TitleIcon = Instance.new("TextLabel")
TitleIcon.Text = utf8.char(9670)
TitleIcon.Size = UDim2.new(0, 30, 0, 42)
TitleIcon.Position = UDim2.new(0, 10, 0, -2)
TitleIcon.BackgroundTransparency = 1
TitleIcon.TextColor3 = T.Accent
TitleIcon.Font = Enum.Font.GothamBlack
TitleIcon.TextSize = 32
TitleIcon.TextYAlignment = Enum.TextYAlignment.Center
TitleIcon.ZIndex = 4
TitleIcon.Parent = TopBar

local TitleLbl = Instance.new("TextLabel")
TitleLbl.Text = "  Symbiote Loader"
TitleLbl.Size = UDim2.new(1, -100, 1, 0)
TitleLbl.Position = UDim2.new(0, 44, 0, 0)
TitleLbl.BackgroundTransparency = 1
TitleLbl.TextColor3 = T.Text
TitleLbl.Font = Enum.Font.GothamBold
TitleLbl.TextSize = 17
TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
TitleLbl.ZIndex = 4
TitleLbl.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "Close"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -15)
CloseBtn.BackgroundColor3 = T.ErrorDim
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "X"
CloseBtn.TextColor3 = T.Error
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.AutoButtonColor = false
CloseBtn.ZIndex = 4
CloseBtn.Parent = TopBar

CloseBtn.MouseEnter:Connect(function() tw(CloseBtn, {BackgroundColor3 = Color3.fromRGB(120, 30, 35)}, 0.1) end)
CloseBtn.MouseLeave:Connect(function() tw(CloseBtn, {BackgroundColor3 = T.ErrorDim}, 0.1) end)
CloseBtn.MouseButton1Click:Connect(function()
    tw(Card, {Size = UDim2.new(0, 460, 0, 0)}, 0.25)
    task.wait(0.28)
    SG:Destroy()
end)

local dragging, dragStart, startPos = false, nil, nil
TopBar.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = inp.Position
        startPos = Card.Position
    end
end)
TopBar.InputEnded:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
UIS.InputChanged:Connect(function(inp)
    if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
        local d = inp.Position - dragStart
        Card.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -40, 1, -64)
Content.Position = UDim2.new(0, 20, 0, 54)
Content.BackgroundTransparency = 1
Content.ZIndex = 3
Content.Parent = Card

local Desc = Instance.new("TextLabel")
Desc.Text = "Welcome! Click the button below to load the Symbiote script."
Desc.Size = UDim2.new(1, 0, 0, 30)
Desc.Position = UDim2.new(0, 0, 0, 10)
Desc.BackgroundTransparency = 1
Desc.TextColor3 = T.TextDim
Desc.Font = Enum.Font.Gotham
Desc.TextSize = 13
Desc.TextXAlignment = Enum.TextXAlignment.Center
Desc.TextWrapped = true
Desc.ZIndex = 3
Desc.Parent = Content

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(1, 0, 0, 45) -- خليت الزر بحجم كامل
SubmitBtn.Position = UDim2.new(0, 0, 0, 60)
SubmitBtn.BackgroundColor3 = T.Accent
SubmitBtn.BorderSizePixel = 0
SubmitBtn.Text = "Load Script"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 15
SubmitBtn.AutoButtonColor = false
SubmitBtn.ZIndex = 3
SubmitBtn.Parent = Content

SubmitBtn.MouseEnter:Connect(function() tw(SubmitBtn, {BackgroundColor3 = T.AccentBright}, 0.1) end)
SubmitBtn.MouseLeave:Connect(function() tw(SubmitBtn, {BackgroundColor3 = T.Accent}, 0.1) end)

local DiscordLink = Instance.new("TextButton")
DiscordLink.Size = UDim2.new(1, 0, 0, 30)
DiscordLink.Position = UDim2.new(0, 0, 0, 120)
DiscordLink.BackgroundTransparency = 1
DiscordLink.Text = "Join Discord: discord.gg/w2yCPhqj5"
DiscordLink.TextColor3 = T.AccentBright
DiscordLink.Font = Enum.Font.GothamBold
DiscordLink.TextSize = 13
DiscordLink.AutoButtonColor = false
DiscordLink.ZIndex = 3
DiscordLink.Parent = Content

local discordGlow = Instance.new("UIStroke")
discordGlow.Color = T.Accent
discordGlow.Thickness = 0.5
discordGlow.Transparency = 0.4
discordGlow.Parent = DiscordLink

DiscordLink.MouseEnter:Connect(function() 
    tw(DiscordLink, {TextColor3 = Color3.new(1, 1, 1)}, 0.2)
    tw(discordGlow, {Thickness = 1, Transparency = 0}, 0.2)
end)
DiscordLink.MouseLeave:Connect(function() 
    tw(DiscordLink, {TextColor3 = T.AccentBright}, 0.2)
    tw(discordGlow, {Thickness = 0.5, Transparency = 0.4}, 0.2)
end)

DiscordLink.MouseButton1Click:Connect(function()
    local link = "https://discord.gg/w2yCPhqj5"
    if setclipboard then
        setclipboard(link)
        local old = DiscordLink.Text
        DiscordLink.Text = "Copied to Clipboard!"
        DiscordLink.TextColor3 = T.Success
        discordGlow.Color = T.Success
        task.delay(2, function()
            DiscordLink.Text = old
            DiscordLink.TextColor3 = T.AccentBright
            discordGlow.Color = T.Accent
        end)
    end
end)

local BottomAccent = Instance.new("Frame")
BottomAccent.Size = UDim2.new(1, 0, 0, 2)
BottomAccent.Position = UDim2.new(0, 0, 1, -2)
BottomAccent.BackgroundColor3 = T.Accent
BottomAccent.BorderSizePixel = 0
BottomAccent.ZIndex = 10
BottomAccent.Parent = Card

SubmitBtn.MouseButton1Click:Connect(function()
    SubmitBtn.Active = false
    SubmitBtn.Text = "Loading Symbiote..."
    tw(SubmitBtn, {BackgroundColor3 = T.Green}, 0.2)
    
    task.wait(0.5)

    -- محاولة تشغيل السكربت الأساسي
    local success, err = pcall(function()
        -- ⚠️ مهم جداً: حط رابط الـ RAW حقك الجديد هنا بين علامتي التنصيص ⚠️
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sssssssss21/Symbiote/refs/heads/main/symbiote.lua"))()
    end)

    if success then
        -- إذا نجح التشغيل، نخفي الواجهة
        tw(Card, {Size = UDim2.new(0, 460, 0, 0)}, 0.25)
        tw(Overlay, {BackgroundTransparency = 1}, 0.25)
        task.wait(0.28)
        SG:Destroy()
    else
        -- إذا فشل التشغيل، نطلع لك رسالة خطأ
        SubmitBtn.Text = "Error! Check F9"
        tw(SubmitBtn, {BackgroundColor3 = T.Error}, 0.2)
        warn("خطأ في تشغيل السكربت الأساسي: " .. tostring(err)) -- هذا بيطبع الخطأ في كونسول اللعبة
        
        task.wait(3)
        SubmitBtn.Active = true
        SubmitBtn.Text = "Load Script"
        tw(SubmitBtn, {BackgroundColor3 = T.Accent}, 0.2)
    end
end)
