--[[
    ███╗   ██╗███████╗████████╗████████╗██╗   ██╗██╗   ██╗██╗  ██╗
    ████╗  ██║██╔════╝╚══██╔══╝╚══██╔══╝╚██╗ ██╔╝██║   ██║██║  ██║
    ██╔██╗ ██║█████╗     ██║      ██║    ╚████╔╝ ██║   ██║███████║
    ██║╚██╗██║██╔══╝     ██║      ██║     ╚██╔╝  ██║   ██║██╔══██║
    ██║ ╚████║███████╗   ██║      ██║      ██║   ╚██████╔╝██║  ██║
    ╚═╝  ╚═══╝╚══════╝   ╚═╝      ╚═╝      ╚═╝    ╚═════╝ ╚═╝  ╚═╝
    
    ╔═══════════════════════════════════════════════════════════╗
    ║               NETTYUH HUB V1.0.0 - YOUTUBER VERISON       ║
    ║                  Created by: swingerbox19                 ║
    ║          Discord: FOR SCRIPT https://discord.gg/Y6VR5sqQHp║
    ╠═══════════════════════════════════════════════════════════╣
    ║  Universal Script Hub for Roblox                          ║
    ║  All your favorite features in one place!                 ║
    ╚═══════════════════════════════════════════════════════════╝
]]

--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local SoundService = game:GetService("SoundService")

--// Variables
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local Camera = workspace.CurrentCamera

--// Configuration
local Config = {
    Version = "1.0.0",
    Keybind = Enum.KeyCode.RightControl,
    Theme = "Purple",
    UIScale = "Medium",
    Animations = true,
    Notifications = true,
    Particles = true,
    Sounds = false,
    AutoSave = true,
    BlurEffect = true,
    Watermark = true,
    CustomKeybinds = {},
    Favorites = {}
}

--// Themes
local Themes = {
    Purple = {
        Primary = Color3.fromRGB(147, 51, 234),
        Secondary = Color3.fromRGB(126, 34, 206),
        Accent = Color3.fromRGB(196, 113, 237),
        Background = Color3.fromRGB(17, 17, 24),
        Card = Color3.fromRGB(24, 24, 32),
        CardHover = Color3.fromRGB(30, 30, 40),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(156, 163, 175)
    },
    Blue = {
        Primary = Color3.fromRGB(59, 130, 246),
        Secondary = Color3.fromRGB(37, 99, 235),
        Accent = Color3.fromRGB(147, 197, 253),
        Background = Color3.fromRGB(15, 23, 42),
        Card = Color3.fromRGB(30, 41, 59),
        CardHover = Color3.fromRGB(51, 65, 85),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(148, 163, 184)
    },
    Red = {
        Primary = Color3.fromRGB(239, 68, 68),
        Secondary = Color3.fromRGB(220, 38, 38),
        Accent = Color3.fromRGB(252, 165, 165),
        Background = Color3.fromRGB(23, 11, 11),
        Card = Color3.fromRGB(40, 20, 20),
        CardHover = Color3.fromRGB(55, 30, 30),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(185, 150, 150)
    },
    Green = {
        Primary = Color3.fromRGB(34, 197, 94),
        Secondary = Color3.fromRGB(22, 163, 74),
        Accent = Color3.fromRGB(134, 239, 172),
        Background = Color3.fromRGB(12, 20, 12),
        Card = Color3.fromRGB(22, 35, 22),
        CardHover = Color3.fromRGB(30, 45, 30),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(150, 185, 150)
    },
    Cyan = {
        Primary = Color3.fromRGB(6, 182, 212),
        Secondary = Color3.fromRGB(8, 145, 178),
        Accent = Color3.fromRGB(103, 232, 249),
        Background = Color3.fromRGB(11, 20, 22),
        Card = Color3.fromRGB(20, 35, 38),
        CardHover = Color3.fromRGB(28, 45, 48),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(150, 185, 190)
    },
    Pink = {
        Primary = Color3.fromRGB(236, 72, 153),
        Secondary = Color3.fromRGB(219, 39, 119),
        Accent = Color3.fromRGB(249, 168, 212),
        Background = Color3.fromRGB(23, 11, 18),
        Card = Color3.fromRGB(40, 20, 32),
        CardHover = Color3.fromRGB(55, 30, 45),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(185, 150, 170)
    },
    Orange = {
        Primary = Color3.fromRGB(249, 115, 22),
        Secondary = Color3.fromRGB(234, 88, 12),
        Accent = Color3.fromRGB(253, 186, 116),
        Background = Color3.fromRGB(23, 16, 11),
        Card = Color3.fromRGB(40, 30, 20),
        CardHover = Color3.fromRGB(55, 40, 28),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(185, 165, 150)
    }
}

local Theme = Themes[Config.Theme]

--// Icons (Lucide Icons from Roblox Assets)
local Icons = {
    Home = "rbxassetid://7733955740",
    User = "rbxassetid://7733993211",
    Users = "rbxassetid://7743875358",
    Globe = "rbxassetid://7734042071",
    Code = "rbxassetid://7733920644",
    Terminal = "rbxassetid://7734042071",
    Server = "rbxassetid://7733674079",
    Settings = "rbxassetid://7734053426",
    Info = "rbxassetid://7743868134",
    Zap = "rbxassetid://7734068321",
    Eye = "rbxassetid://7743871002",
    EyeOff = "rbxassetid://7743871002",
    Shield = "rbxassetid://7743875358",
    Download = "rbxassetid://7733964126",
    Upload = "rbxassetid://7733964126",
    Refresh = "rbxassetid://7734042071",
    RotateCw = "rbxassetid://7734042071",
    Clock = "rbxassetid://7734068321",
    Activity = "rbxassetid://7743868134",
    Star = "rbxassetid://7734052925",
    Heart = "rbxassetid://7733919605",
    Check = "rbxassetid://7733964126",
    X = "rbxassetid://7743873633",
    Search = "rbxassetid://7734052925",
    Menu = "rbxassetid://7734053426",
    ChevronRight = "rbxassetid://7733717447",
    ChevronDown = "rbxassetid://7733717447",
    Sun = "rbxassetid://7734053426",
    Moon = "rbxassetid://7734053426",
    Wind = "rbxassetid://7734042071",
    Copy = "rbxassetid://7733964126",
    ExternalLink = "rbxassetid://7733964126",
    Crosshair = "rbxassetid://7743871002",
    Target = "rbxassetid://7743871002",
    Gauge = "rbxassetid://7734068321",
    Signal = "rbxassetid://7743868134",
    Cpu = "rbxassetid://7733674079",
    HardDrive = "rbxassetid://7733674079"
}

--// Variables
local GUI
local MainFrame
local IsHidden = false
local StartTime = tick()
local CurrentPage = nil

--// Utility Functions
local function Tween(object, properties, duration, style)
    if Config.Animations then
        TweenService:Create(
            object,
            TweenInfo.new(duration or 0.3, style or Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            properties
        ):Play()
    else
        for prop, value in pairs(properties) do
            object[prop] = value
        end
    end
end

local function CreateRipple(button, x, y)
    if not Config.Animations then return end
    
    local ripple = Instance.new("Frame")
    ripple.Size = UDim2.new(0, 0, 0, 0)
    ripple.Position = UDim2.new(0, x or button.AbsoluteSize.X / 2, 0, y or button.AbsoluteSize.Y / 2)
    ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    ripple.BackgroundColor3 = Color3.new(1, 1, 1)
    ripple.BackgroundTransparency = 0.5
    ripple.BorderSizePixel = 0
    ripple.ZIndex = 100
    ripple.Parent = button
    
    Instance.new("UICorner", ripple).CornerRadius = UDim.new(1, 0)
    
    local maxSize = math.max(button.AbsoluteSize.X, button.AbsoluteSize.Y) * 2.5
    
    Tween(ripple, {
        Size = UDim2.new(0, maxSize, 0, maxSize),
        BackgroundTransparency = 1
    }, 0.6, Enum.EasingStyle.Exponential)
    
    task.delay(0.6, function()
        ripple:Destroy()
    end)
end

local function PlaySound(soundId)
    if not Config.Sounds then return end
    
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Volume = 0.4
    sound.Parent = SoundService
    sound:Play()
    
    game:GetService("Debris"):AddItem(sound, 2)
end

--// Notification System
local NotificationContainer

local function Notify(title, message, duration, iconName)
    if not Config.Notifications then return end
    
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(1, 0, 0, 95)
    notif.BackgroundColor3 = Theme.Card
    notif.BorderSizePixel = 0
    notif.Position = UDim2.new(1, 30, 0, 0)
    notif.ClipsDescendants = true
    notif.Parent = NotificationContainer
    
    Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 14)
    
    local stroke = Instance.new("UIStroke", notif)
    stroke.Color = Theme.Primary
    stroke.Thickness = 1.5
    stroke.Transparency = 0.3
    
    local gradient = Instance.new("UIGradient", notif)
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Theme.Card),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(
            math.clamp(Theme.Card.R * 255 + 5, 0, 255) / 255,
            math.clamp(Theme.Card.G * 255 + 5, 0, 255) / 255,
            math.clamp(Theme.Card.B * 255 + 5, 0, 255) / 255
        ))
    }
    gradient.Rotation = 90
    
    if iconName and Icons[iconName] then
        local icon = Instance.new("ImageLabel")
        icon.Size = UDim2.new(0, 32, 0, 32)
        icon.Position = UDim2.new(0, 18, 0, 18)
        icon.BackgroundTransparency = 1
        icon.Image = Icons[iconName]
        icon.ImageColor3 = Theme.Primary
        icon.Parent = notif
        
        -- Icon pulse animation
        spawn(function()
            while notif.Parent do
                Tween(icon, {ImageTransparency = 0.3}, 0.8)
                wait(0.8)
                Tween(icon, {ImageTransparency = 0}, 0.8)
                wait(0.8)
            end
        end)
    end
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, iconName and -65 or -35, 0, 30)
    titleLabel.Position = UDim2.new(0, iconName and 60 or 18, 0, 15)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Theme.Text
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = notif
    
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -35, 0, 42)
    messageLabel.Position = UDim2.new(0, 18, 0, 48)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = message
    messageLabel.TextColor3 = Theme.TextSecondary
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextSize = 13
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextWrapped = true
    messageLabel.Parent = notif
    
    Tween(notif, {Position = UDim2.new(0, 0, 0, 0)}, 0.5, Enum.EasingStyle.Back)
    PlaySound("6026984224")
    
    task.delay(duration or 4.5, function()
        Tween(notif, {Position = UDim2.new(1, 30, 0, 0)}, 0.4)
        task.wait(0.4)
        notif:Destroy()
    end)
end

--// Particle System
local function CreateParticles(parent)
    if not Config.Particles then return end
    
    for i = 1, 8 do
        local particle = Instance.new("Frame")
        particle.Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6))
        particle.Position = UDim2.new(math.random(0, 100) / 100, 0, math.random(0, 100) / 100, 0)
        particle.BackgroundColor3 = Theme.Primary
        particle.BackgroundTransparency = math.random(60, 85) / 100
        particle.BorderSizePixel = 0
        particle.ZIndex = -1
        particle.Parent = parent
        
        Instance.new("UICorner", particle).CornerRadius = UDim.new(1, 0)
        
        local function animateParticle()
            while particle and particle.Parent do
                local newX = math.random(0, 100) / 100
                local newY = math.random(0, 100) / 100
                local duration = math.random(4, 8)
                
                Tween(particle, {
                    Position = UDim2.new(newX, 0, newY, 0),
                    BackgroundTransparency = math.random(60, 85) / 100
                }, duration, Enum.EasingStyle.Sine)
                
                wait(duration)
            end
        end
        
        spawn(animateParticle)
    end
end

--// GUI Creation
GUI = Instance.new("ScreenGui")
GUI.Name = "NettyuhHubV1"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.IgnoreGuiInset = true

local success = pcall(function()
    GUI.Parent = CoreGui
end)

if not success then
    GUI.Parent = Player:WaitForChild("PlayerGui")
end

--// LOADING SCREEN
local LoadingScreen = Instance.new("Frame")
LoadingScreen.Size = UDim2.new(1, 0, 1, 0)
LoadingScreen.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
LoadingScreen.BorderSizePixel = 0
LoadingScreen.ZIndex = 1000
LoadingScreen.Parent = GUI

local LoadingLogo = Instance.new("TextLabel")
LoadingLogo.Size = UDim2.new(0, 400, 0, 80)
LoadingLogo.Position = UDim2.new(0.5, -200, 0.4, -40)
LoadingLogo.BackgroundTransparency = 1
LoadingLogo.Text = "NETTYUH HUB"
LoadingLogo.TextColor3 = Theme.Primary
LoadingLogo.Font = Enum.Font.GothamBold
LoadingLogo.TextSize = 48
LoadingLogo.Parent = LoadingScreen

local LoadingSubtext = Instance.new("TextLabel")
LoadingSubtext.Size = UDim2.new(0, 400, 0, 30)
LoadingSubtext.Position = UDim2.new(0.5, -200, 0.4, 50)
LoadingSubtext.BackgroundTransparency = 1
LoadingSubtext.Text = "Loading ultimate features..."
LoadingSubtext.TextColor3 = Theme.TextSecondary
LoadingSubtext.Font = Enum.Font.Gotham
LoadingSubtext.TextSize = 14
LoadingSubtext.Parent = LoadingScreen

local LoadingBar = Instance.new("Frame")
LoadingBar.Size = UDim2.new(0, 400, 0, 6)
LoadingBar.Position = UDim2.new(0.5, -200, 0.5, 20)
LoadingBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
LoadingBar.BorderSizePixel = 0
LoadingBar.Parent = LoadingScreen

Instance.new("UICorner", LoadingBar).CornerRadius = UDim.new(0, 3)

local LoadingProgress = Instance.new("Frame")
LoadingProgress.Size = UDim2.new(0, 0, 1, 0)
LoadingProgress.BackgroundColor3 = Theme.Primary
LoadingProgress.BorderSizePixel = 0
LoadingProgress.Parent = LoadingBar

Instance.new("UICorner", LoadingProgress).CornerRadius = UDim.new(0, 3)

local LoadingTip = Instance.new("TextLabel")
LoadingTip.Size = UDim2.new(0, 600, 0, 40)
LoadingTip.Position = UDim2.new(0.5, -300, 0.6, 0)
LoadingTip.BackgroundTransparency = 1
LoadingTip.Text = "💡 Tip: Press RightControl to toggle the UI"
LoadingTip.TextColor3 = Theme.Accent
LoadingTip.Font = Enum.Font.Gotham
LoadingTip.TextSize = 13
LoadingTip.Parent = LoadingScreen

local LoadingCredit = Instance.new("TextLabel")
LoadingCredit.Size = UDim2.new(0, 400, 0, 30)
LoadingCredit.Position = UDim2.new(0.5, -200, 0.85, 0)
LoadingCredit.BackgroundTransparency = 1
LoadingCredit.Text = "Created by swingerbox19 | discord.gg/Y6VR5sqQHp"
LoadingCredit.TextColor3 = Theme.TextSecondary
LoadingCredit.Font = Enum.Font.Gotham
LoadingCredit.TextSize = 12
LoadingCredit.Parent = LoadingScreen

-- Animate loading bar
spawn(function()
    local tips = {
        "💡 Tip: Press RightControl to toggle the UI",
        "💡 Tip: Use the search bar to find features quickly",
        "💡 Tip: Star your favorite features for quick access",
        "💡 Tip: Check the Players tab to interact with others",
        "💡 Tip: Customize your theme in Settings",
        "💡 Tip: Join our Discord for updates and support"
    }
    
    for i = 0, 100, 5 do
        if LoadingProgress and LoadingProgress.Parent then
            LoadingProgress.Size = UDim2.new(i/100, 0, 1, 0)
        end
        
        if i % 20 == 0 and LoadingTip and LoadingTip.Parent then
            LoadingTip.Text = tips[math.random(1, #tips)]
        end
        
        task.wait(0.01)
    end
    
    task.wait(0.3)
    
    if LoadingScreen and LoadingScreen.Parent then
        for _, child in pairs(LoadingScreen:GetChildren()) do
            if child:IsA("GuiObject") then
                spawn(function()
                    TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                        TextTransparency = 1,
                        BackgroundTransparency = 1
                    }):Play()
                end)
            end
        end
        
        TweenService:Create(LoadingScreen, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            BackgroundTransparency = 1
        }):Play()
        
        task.wait(0.3)
        LoadingScreen:Destroy()
    end
end)

--// WATERMARK
local Watermark = Instance.new("TextLabel")
Watermark.Size = UDim2.new(0, 500, 0, 25)
Watermark.Position = UDim2.new(0.5, -250, 0, 10)
Watermark.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Watermark.BackgroundTransparency = 0.3
Watermark.BorderSizePixel = 0
Watermark.Text = "NETTYUH HUB V1.0.0 | discord.gg/Y6VR5sqQHp | Made by swingerbox19"
Watermark.TextColor3 = Theme.Primary
Watermark.Font = Enum.Font.GothamBold
Watermark.TextSize = 12
Watermark.Visible = Config.Watermark
Watermark.ZIndex = 999
Watermark.Parent = GUI

Instance.new("UICorner", Watermark).CornerRadius = UDim.new(0, 6)

local watermarkStroke = Instance.new("UIStroke")
watermarkStroke.Color = Theme.Primary
watermarkStroke.Thickness = 1
watermarkStroke.Transparency = 0.7
watermarkStroke.Parent = Watermark

-- Watermark gradient
local watermarkGradient = Instance.new("UIGradient")
watermarkGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Theme.Primary),
    ColorSequenceKeypoint.new(0.5, Theme.Accent),
    ColorSequenceKeypoint.new(1, Theme.Primary)
}
watermarkGradient.Parent = Watermark.UIStroke

-- Animate gradient
spawn(function()
    while Watermark.Parent do
        for i = 0, 360, 2 do
            if Watermark.Parent and watermarkGradient then
                watermarkGradient.Rotation = i
            end
            task.wait(0.03)
        end
    end
end)

--// GAME DETECTOR
local CurrentGame = {
    Name = "Unknown Game",
    PlaceId = game.PlaceId,
    Icon = ""
}

local GameDatabase = {
    [2753915549] = {Name = "Blox Fruits", Icon = "🏴‍☠️"},
    [286090429] = {Name = "Arsenal", Icon = "🔫"},
    [606849621] = {Name = "Jailbreak", Icon = "🚔"},
    [4924922222] = {Name = "Brookhaven", Icon = "🏘️"},
    [920587237] = {Name = "Adopt Me", Icon = "🐾"},
    [189707] = {Name = "Natural Disaster Survival", Icon = "🌪️"},
    [1837257634] = {Name = "Ragdoll Engine", Icon = "💀"},
}

if GameDatabase[game.PlaceId] then
    CurrentGame = GameDatabase[game.PlaceId]
    CurrentGame.PlaceId = game.PlaceId
else
    pcall(function()
        CurrentGame.Name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    end)
end

--// STATUS BAR
local StatusBar = Instance.new("Frame")
StatusBar.Size = UDim2.new(1, 0, 0, 28)
StatusBar.Position = UDim2.new(0, 0, 1, -28)
StatusBar.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
StatusBar.BorderSizePixel = 0
StatusBar.ZIndex = 998
StatusBar.Parent = GUI

local statusStroke = Instance.new("UIStroke")
statusStroke.Color = Theme.Primary
statusStroke.Thickness = 1
statusStroke.Transparency = 0.8
statusStroke.Parent = StatusBar

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(0, 300, 1, 0)
StatusText.Position = UDim2.new(0, 15, 0, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "✅ Ready"
StatusText.TextColor3 = Color3.fromRGB(100, 255, 100)
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 12
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = StatusBar

local GameInfoText = Instance.new("TextLabel")
GameInfoText.Size = UDim2.new(0, 300, 1, 0)
GameInfoText.Position = UDim2.new(0.5, -150, 0, 0)
GameInfoText.BackgroundTransparency = 1
GameInfoText.Text = CurrentGame.Icon .. " " .. CurrentGame.Name
GameInfoText.TextColor3 = Theme.TextSecondary
GameInfoText.Font = Enum.Font.GothamBold
GameInfoText.TextSize = 12
GameInfoText.Parent = StatusBar

local ActiveFeaturesText = Instance.new("TextLabel")
ActiveFeaturesText.Size = UDim2.new(0, 200, 1, 0)
ActiveFeaturesText.Position = UDim2.new(1, -215, 0, 0)
ActiveFeaturesText.BackgroundTransparency = 1
ActiveFeaturesText.Text = "0 Active Features"
ActiveFeaturesText.TextColor3 = Theme.TextSecondary
ActiveFeaturesText.Font = Enum.Font.Gotham
ActiveFeaturesText.TextSize = 12
ActiveFeaturesText.TextXAlignment = Enum.TextXAlignment.Right
ActiveFeaturesText.Parent = StatusBar

_G.UpdateStatus = function(text, color)
    StatusText.Text = text
    StatusText.TextColor3 = color or Color3.fromRGB(100, 255, 100)
end

_G.ActiveFeatureCount = 0
_G.UpdateActiveFeatures = function()
    ActiveFeaturesText.Text = _G.ActiveFeatureCount .. " Active Features"
end

-- Blur Effect
local BlurEffect
if Config.BlurEffect then
    BlurEffect = Instance.new("BlurEffect")
    BlurEffect.Size = 0
    BlurEffect.Parent = Lighting
    
    Tween(BlurEffect, {Size = 12}, 0.8)
end

-- Notification Container
NotificationContainer = Instance.new("Frame")
NotificationContainer.Size = UDim2.new(0, 340, 1, -20)
NotificationContainer.Position = UDim2.new(1, -350, 0, 10)
NotificationContainer.BackgroundTransparency = 1
NotificationContainer.Parent = GUI

local notifLayout = Instance.new("UIListLayout")
notifLayout.Padding = UDim.new(0, 12)
notifLayout.VerticalAlignment = Enum.VerticalAlignment.Top
notifLayout.Parent = NotificationContainer

--// Main Container
MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 1250, 0, 750)
MainFrame.Position = UDim2.new(0.5, -625, 0.5, -375)
MainFrame.BackgroundTransparency = 1
MainFrame.ClipsDescendants = false
MainFrame.Parent = GUI

-- Shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Size = UDim2.new(1, 60, 1, 60)
Shadow.Position = UDim2.new(0, -30, 0, -30)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.6
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
Shadow.ZIndex = -2
Shadow.Parent = MainFrame

-- Entrance Animation
MainFrame.Position = UDim2.new(0.5, -625, 1.5, 0)
Tween(MainFrame, {Position = UDim2.new(0.5, -625, 0.5, -375)}, 0.8, Enum.EasingStyle.Back)

-- Dragging
local dragging, dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Tween(MainFrame, {
            Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        }, 0.1)
    end
end)

--// UI Helper Functions
local function CreateElement(className, properties)
    local element = Instance.new(className)
    for prop, value in pairs(properties) do
        element[prop] = value
    end
    return element
end

local function AddCorner(parent, radius)
    return CreateElement("UICorner", {
        CornerRadius = UDim.new(0, radius or 12),
        Parent = parent
    })
end

local function AddStroke(parent, color, thickness, transparency)
    return CreateElement("UIStroke", {
        Color = color or Theme.Primary,
        Thickness = thickness or 1,
        Transparency = transparency or 0.7,
        Parent = parent
    })
end

local function AddGradient(parent, color1, color2, rotation)
    return CreateElement("UIGradient", {
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, color1),
            ColorSequenceKeypoint.new(1, color2)
        },
        Rotation = rotation or 90,
        Parent = parent
    })
end

local function CreateIcon(parent, iconName, size, position, color)
    local icon = CreateElement("ImageLabel", {
        Size = UDim2.new(0, size, 0, size),
        Position = position or UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Image = Icons[iconName] or Icons.Home,
        ImageColor3 = color or Theme.Text,
        Parent = parent
    })
    return icon
end

local function CreateLabel(parent, text, size, position, fontSize, bold, color)
    local label = CreateElement("TextLabel", {
        Size = size,
        Position = position or UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = color or Theme.Text,
        Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham,
        TextSize = fontSize or 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = parent
    })
    return label
end

--// LEFT PANEL (Profile & Stats)
local LeftPanel = CreateElement("Frame", {
    Size = UDim2.new(0, 340, 1, 0),
    Position = UDim2.new(0, 0, 0, 0),
    BackgroundColor3 = Theme.Card,
    BorderSizePixel = 0,
    Parent = MainFrame
})

AddCorner(LeftPanel, 18)
AddStroke(LeftPanel, Theme.Primary, 1, 0.85)
CreateParticles(LeftPanel)

-- Profile Header Card
local ProfileCard = CreateElement("Frame", {
    Size = UDim2.new(1, -20, 0, 200),
    Position = UDim2.new(0, 10, 0, 10),
    BackgroundColor3 = Theme.Background,
    BorderSizePixel = 0,
    Parent = LeftPanel
})

AddCorner(ProfileCard, 14)
AddStroke(ProfileCard, Theme.Primary, 1, 0.8)
AddGradient(ProfileCard, Theme.Primary, Theme.Background, 135)

-- Avatar Container with Animated Ring
local AvatarContainer = CreateElement("Frame", {
    Size = UDim2.new(0, 110, 0, 110),
    Position = UDim2.new(0.5, -55, 0, -55),
    BackgroundTransparency = 1,
    Parent = ProfileCard
})

local AvatarRing = CreateElement("Frame", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    Parent = AvatarContainer
})

AddCorner(AvatarRing, 55)

local ringStroke = AddStroke(AvatarRing, Theme.Primary, 3.5, 0)

-- Pulsing ring animation
spawn(function()
    while AvatarRing.Parent do
        Tween(ringStroke, {Transparency = 0.5}, 2, Enum.EasingStyle.Sine)
        wait(2)
        Tween(ringStroke, {Transparency = 0}, 2, Enum.EasingStyle.Sine)
        wait(2)
    end
end)

local Avatar = CreateElement("ImageLabel", {
    Size = UDim2.new(1, -10, 1, -10),
    Position = UDim2.new(0, 5, 0, 5),
    BackgroundColor3 = Theme.Background,
    BorderSizePixel = 0,
    Parent = AvatarRing
})

AddCorner(Avatar, 50)

pcall(function()
    Avatar.Image = Players:GetUserThumbnailAsync(
        Player.UserId,
        Enum.ThumbnailType.HeadShot,
        Enum.ThumbnailSize.Size150x150
    )
end)

-- Username & Display
local Username = CreateLabel(ProfileCard, Player.Name, UDim2.new(1, -20, 0, 32), UDim2.new(0, 10, 0, 68), 19, true)
Username.TextXAlignment = Enum.TextXAlignment.Center

local DisplayName = CreateLabel(ProfileCard, "@" .. Player.DisplayName, UDim2.new(1, -20, 0, 24), UDim2.new(0, 10, 0, 100), 14, false, Theme.TextSecondary)
DisplayName.TextXAlignment = Enum.TextXAlignment.Center

-- Status Badge
local StatusBadge = CreateElement("Frame", {
    Size = UDim2.new(0, 90, 0, 28),
    Position = UDim2.new(0.5, -45, 0, 135),
    BackgroundColor3 = Theme.Primary,
    BorderSizePixel = 0,
    Parent = ProfileCard
})

AddCorner(StatusBadge, 14)

local badgeLabel = CreateLabel(StatusBadge, "PREMIUM", UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), 12, true)
badgeLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Glow animation for badge
spawn(function()
    while StatusBadge.Parent do
        Tween(StatusBadge, {BackgroundColor3 = Theme.Accent}, 1.5)
        wait(1.5)
        Tween(StatusBadge, {BackgroundColor3 = Theme.Primary}, 1.5)
        wait(1.5)
    end
end)

-- Profile Stats Row
local ProfileStatsRow = CreateElement("Frame", {
    Size = UDim2.new(1, -20, 0, 55),
    Position = UDim2.new(0, 10, 1, -65),
    BackgroundTransparency = 1,
    Parent = ProfileCard
})

local function CreateProfileStat(text, iconName, index)
    local stat = CreateElement("Frame", {
        Size = UDim2.new(0.33, -7, 1, 0),
        Position = UDim2.new((index-1) * 0.33, 0, 0, 0),
        BackgroundTransparency = 1,
        Parent = ProfileStatsRow
    })
    
    local icon = CreateIcon(stat, iconName, 22, UDim2.new(0.5, -11, 0, 5), Theme.Accent)
    
    local label = CreateLabel(stat, text, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 30), 10, false, Theme.TextSecondary)
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.TextWrapped = true
    
    return stat
end

CreateProfileStat("Joined\n" .. os.date("%m/%d/%y"), "Clock", 1)
CreateProfileStat(Player.AccountAge .. "\nDays", "Activity", 2)

local friendStat = CreateProfileStat("0\nFriends", "Users", 3)
spawn(function()
    local success, friends = pcall(function()
        return Player:GetFriendsOnline(200)
    end)
    if success then
        friendStat.TextLabel.Text = #friends .. "\nFriends"
    end
end)

-- Quick Stats Grid
local QuickStatsGrid = CreateElement("Frame", {
    Size = UDim2.new(1, -20, 0, 320),
    Position = UDim2.new(0, 10, 0, 220),
    BackgroundTransparency = 1,
    Parent = LeftPanel
})

local statsLayout = CreateElement("UIGridLayout", {
    CellSize = UDim2.new(0.48, 0, 0, 100),
    CellPadding = UDim2.new(0.04, 0, 0, 10),
    Parent = QuickStatsGrid
})

local StatCards = {}

local function CreateStatCard(title, value, color, iconName)
    local card = CreateElement("Frame", {
        BackgroundColor3 = color,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = QuickStatsGrid
    })
    
    AddCorner(card, 12)
    AddGradient(card, color, Color3.fromRGB(
        math.clamp(color.R * 255 - 35, 0, 255) / 255,
        math.clamp(color.G * 255 - 35, 0, 255) / 255,
        math.clamp(color.B * 255 - 35, 0, 255) / 255
    ), 45)
    
    local icon = CreateIcon(card, iconName, 28, UDim2.new(0, 14, 0, 14))
    icon.ImageTransparency = 0.25
    
    local titleLabel = CreateLabel(card, title, UDim2.new(1, -56, 0, 22), UDim2.new(0, 48, 0, 18), 11)
    titleLabel.TextTransparency = 0.25
    
    local valueLabel = CreateLabel(card, value, UDim2.new(1, -24, 0, 45), UDim2.new(0, 14, 1, -62), 26, true)
    
    -- Hover effect
    card.MouseEnter:Connect(function()
        Tween(card, {BackgroundColor3 = Color3.fromRGB(
            math.clamp(color.R * 255 + 15, 0, 255) / 255,
            math.clamp(color.G * 255 + 15, 0, 255) / 255,
            math.clamp(color.B * 255 + 15, 0, 255) / 255
        )}, 0.2)
    end)
    
    card.MouseLeave:Connect(function()
        Tween(card, {BackgroundColor3 = color}, 0.2)
    end)
    
    return valueLabel
end

StatCards.FPS = CreateStatCard("FPS", "60", Color3.fromRGB(16, 185, 129), "Zap")
StatCards.Ping = CreateStatCard("Ping", "0ms", Color3.fromRGB(59, 130, 246), "Signal")
StatCards.Players = CreateStatCard("Players", "0/0", Color3.fromRGB(147, 51, 234), "Users")
StatCards.Memory = CreateStatCard("Memory", "0 MB", Color3.fromRGB(236, 72, 153), "Cpu")
StatCards.Uptime = CreateStatCard("Uptime", "00:00", Color3.fromRGB(249, 115, 22), "Clock")
StatCards.Speed = CreateStatCard("Speed", "16", Color3.fromRGB(168, 85, 247), "Gauge")

-- Quick Actions
local ActionsContainer = CreateElement("Frame", {
    Size = UDim2.new(1, -20, 0, 210),
    Position = UDim2.new(0, 10, 1, -220),
    BackgroundTransparency = 1,
    Parent = LeftPanel
})

local actionsLayout = CreateElement("UIListLayout", {
    Padding = UDim.new(0, 9),
    Parent = ActionsContainer
})

local function CreateActionButton(text, iconName, callback)
    local btn = CreateElement("TextButton", {
        Size = UDim2.new(1, 0, 0, 48),
        BackgroundColor3 = Theme.CardHover,
        Text = "",
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Parent = ActionsContainer
    })
    
    AddCorner(btn, 12)
    AddStroke(btn, Theme.Primary, 1, 0.9)
    
    CreateIcon(btn, iconName, 26, UDim2.new(0, 14, 0.5, -13))
    CreateLabel(btn, text, UDim2.new(1, -55, 1, 0), UDim2.new(0, 50, 0, 0), 14, true)
    
    btn.MouseEnter:Connect(function()
        Tween(btn, {BackgroundColor3 = Theme.Primary}, 0.2)
        PlaySound("12221967")
    end)
    
    btn.MouseLeave:Connect(function()
        Tween(btn, {BackgroundColor3 = Theme.CardHover}, 0.2)
    end)
    
    btn.MouseButton1Click:Connect(function()
        local mousePos = UserInputService:GetMouseLocation()
        local btnPos = btn.AbsolutePosition
        CreateRipple(btn, mousePos.X - btnPos.X, mousePos.Y - btnPos.Y)
        PlaySound("6026984224")
        if callback then callback() end
    end)
    
    return btn
end

CreateActionButton("Rejoin Server", "Refresh", function()
    TeleportService:Teleport(game.PlaceId, Player)
end)

CreateActionButton("Server Hop", "Server", function()
    pcall(function()
        local servers = HttpService:JSONDecode(
            game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
        )
        for _, server in pairs(servers.data) do
            if server.id ~= game.JobId and server.playing < server.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, Player)
                break
            end
        end
    end)
end)

CreateActionButton("Copy Game Link", "Copy", function()
    setclipboard("https://www.roblox.com/games/" .. game.PlaceId)
    Notify("Copied!", "Game link copied to clipboard", 2.5, "Check")
end)

CreateActionButton("Reset Character", "RotateCw", function()
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.Health = 0
    end
end)

--// CENTER PANEL (Server & Friends)
local CenterPanel = CreateElement("Frame", {
    Size = UDim2.new(0, 400, 1, 0),
    Position = UDim2.new(0, 350, 0, 0),
    BackgroundTransparency = 1,
    Parent = MainFrame
})

-- Server Info Card
local ServerCard = CreateElement("Frame", {
    Size = UDim2.new(1, -20, 0, 260),
    Position = UDim2.new(0, 10, 0, 10),
    BackgroundColor3 = Theme.Card,
    BorderSizePixel = 0,
    Parent = CenterPanel
})

AddCorner(ServerCard, 18)
AddStroke(ServerCard, Theme.Primary, 1, 0.85)

local ServerHeader = CreateElement("Frame", {
    Size = UDim2.new(1, 0, 0, 60),
    BackgroundColor3 = Theme.Background,
    BorderSizePixel = 0,
    Parent = ServerCard
})

AddCorner(ServerHeader, 18)

CreateIcon(ServerHeader, "Server", 32, UDim2.new(0, 20, 0.5, -16), Theme.Primary)
CreateLabel(ServerHeader, "Server Information", UDim2.new(1, -75, 1, 0), UDim2.new(0, 62, 0, 0), 19, true)

-- Server Stats
local ServerStats = CreateElement("Frame", {
    Size = UDim2.new(1, -40, 0, 150),
    Position = UDim2.new(0, 20, 0, 72),
    BackgroundTransparency = 1,
    Parent = ServerCard
})

local serverStatsLayout = CreateElement("UIListLayout", {
    Padding = UDim.new(0, 14),
    Parent = ServerStats
})

local ServerValues = {}

local function CreateServerStat(label, value)
    local stat = CreateElement("Frame", {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundTransparency = 1,
        Parent = ServerStats
    })
    
    CreateLabel(stat, label, UDim2.new(0.5, 0, 1, 0), UDim2.new(0, 0, 0, 0), 14, false, Theme.TextSecondary)
    
    local valueLabel = CreateLabel(stat, value, UDim2.new(0.5, 0, 1, 0), UDim2.new(0.5, 0, 0, 0), 16, true)
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    return valueLabel
end

ServerValues.Players = CreateServerStat("players", "0 / 0")
ServerValues.Ping = CreateServerStat("ping", "0 ms")
ServerValues.Elapsed = CreateServerStat("elapsed", "0 seconds")
ServerValues.JobID = CreateServerStat("job id", game.JobId:sub(1, 10) .. "...")

-- Server Action Buttons
local ServerActions = CreateElement("Frame", {
    Size = UDim2.new(1, -40, 0, 50),
    Position = UDim2.new(0, 20, 1, -62),
    BackgroundTransparency = 1,
    Parent = ServerCard
})

local serverActionsLayout = CreateElement("UIListLayout", {
    FillDirection = Enum.FillDirection.Horizontal,
    Padding = UDim.new(0, 12),
    Parent = ServerActions
})

local function CreateServerButton(iconName, callback)
    local btn = CreateElement("TextButton", {
        Size = UDim2.new(0, 50, 0, 50),
        BackgroundColor3 = Theme.CardHover,
        Text = "",
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Parent = ServerActions
    })
    
    AddCorner(btn, 12)
    AddStroke(btn, Theme.Primary, 1, 0.85)
    
    CreateIcon(btn, iconName, 28, UDim2.new(0.5, -14, 0.5, -14))
    
    btn.MouseEnter:Connect(function()
        Tween(btn, {BackgroundColor3 = Theme.Primary}, 0.2)
        Tween(btn.ImageLabel, {ImageColor3 = Theme.Text}, 0.2)
    end)
    
    btn.MouseLeave:Connect(function()
        Tween(btn, {BackgroundColor3 = Theme.CardHover}, 0.2)
        Tween(btn.ImageLabel, {ImageColor3 = Theme.Text}, 0.2)
    end)
    
    btn.MouseButton1Click:Connect(function()
        CreateRipple(btn, 25, 25)
        PlaySound("6026984224")
        if callback then callback() end
    end)
    
    return btn
end

CreateServerButton("Refresh", function()
    pcall(function()
        local servers = HttpService:JSONDecode(
            game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
        )
        for _, server in pairs(servers.data) do
            if server.id ~= game.JobId and server.playing < server.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, Player)
                break
            end
        end
    end)
end)

CreateServerButton("Server", function()
    TeleportService:Teleport(game.PlaceId, Player)
end)

CreateServerButton("Copy", function()
    setclipboard(game.JobId)
    Notify("Copied!", "Job ID copied to clipboard", 2.5, "Check")
end)

-- Friend Activity Card
local FriendCard = CreateElement("Frame", {
    Size = UDim2.new(1, -20, 0, 470),
    Position = UDim2.new(0, 10, 0, 280),
    BackgroundColor3 = Theme.Card,
    BorderSizePixel = 0,
    Parent = CenterPanel
})

AddCorner(FriendCard, 18)
AddStroke(FriendCard, Theme.Primary, 1, 0.85)

local FriendHeader = CreateElement("Frame", {
    Size = UDim2.new(1, 0, 0, 60),
    BackgroundColor3 = Theme.Background,
    BorderSizePixel = 0,
    Parent = FriendCard
})

AddCorner(FriendHeader, 18)

CreateIcon(FriendHeader, "Users", 32, UDim2.new(0, 20, 0.5, -16), Theme.Primary)
CreateLabel(FriendHeader, "Friend Activity", UDim2.new(1, -75, 1, 0), UDim2.new(0, 62, 0, 0), 19, true)

-- Friend List
local FriendList = CreateElement("ScrollingFrame", {
    Size = UDim2.new(1, -24, 1, -76),
    Position = UDim2.new(0, 12, 0, 68),
    BackgroundTransparency = 1,
    ScrollBarThickness = 5,
    BorderSizePixel = 0,
    ScrollBarImageColor3 = Theme.Primary,
    ScrollBarImageTransparency = 0.5,
    Parent = FriendCard
})

local friendListLayout = CreateElement("UIListLayout", {
    Padding = UDim.new(0, 10),
    Parent = FriendList
})

-- Load Friends
spawn(function()
    local success, friends = pcall(function()
        return Player:GetFriendsOnline(200)
    end)
    
    if success and #friends > 0 then
        for _, friend in ipairs(friends) do
            local friendFrame = CreateElement("Frame", {
                Size = UDim2.new(1, 0, 0, 72),
                BackgroundColor3 = Theme.CardHover,
                BorderSizePixel = 0,
                Parent = FriendList
            })
            
            AddCorner(friendFrame, 12)
            
            local friendAvatar = CreateElement("ImageLabel", {
                Size = UDim2.new(0, 54, 0, 54),
                Position = UDim2.new(0, 10, 0.5, -27),
                BackgroundColor3 = Theme.Background,
                BorderSizePixel = 0,
                Parent = friendFrame
            })
            
            AddCorner(friendAvatar, 27)
            
            pcall(function()
                friendAvatar.Image = Players:GetUserThumbnailAsync(
                    friend.VisitorId,
                    Enum.ThumbnailType.HeadShot,
                    Enum.ThumbnailSize.Size60x60
                )
            end)
            
            -- Online Indicator
            local indicator = CreateElement("Frame", {
                Size = UDim2.new(0, 14, 0, 14),
                Position = UDim2.new(1, -6, 1, -6),
                BackgroundColor3 = Color3.fromRGB(34, 197, 94),
                BorderSizePixel = 0,
                Parent = friendAvatar
            })
            
            AddCorner(indicator, 7)
            AddStroke(indicator, Theme.CardHover, 3, 0)
            
            -- Pulse animation
            spawn(function()
                while indicator.Parent do
                    Tween(indicator, {BackgroundColor3 = Color3.fromRGB(134, 239, 172)}, 1)
                    wait(1)
                    Tween(indicator, {BackgroundColor3 = Color3.fromRGB(34, 197, 94)}, 1)
                    wait(1)
                end
            end)
            
            local friendName = CreateLabel(friendFrame, friend.UserName, UDim2.new(1, -82, 0, 26), UDim2.new(0, 72, 0, 14), 15, true)
            friendName.TextTruncate = Enum.TextTruncate.AtEnd
            
            local friendStatus = CreateLabel(friendFrame, friend.LastLocation or "Playing Roblox", UDim2.new(1, -82, 0, 22), UDim2.new(0, 72, 0, 42), 12, false, Theme.TextSecondary)
            friendStatus.TextTruncate = Enum.TextTruncate.AtEnd
            
            -- Hover effect
            friendFrame.MouseEnter:Connect(function()
                Tween(friendFrame, {BackgroundColor3 = Theme.Primary}, 0.2)
                Tween(friendName, {TextColor3 = Theme.Text}, 0.2)
                Tween(friendStatus, {TextColor3 = Theme.Text}, 0.2)
            end)
            
            friendFrame.MouseLeave:Connect(function()
                Tween(friendFrame, {BackgroundColor3 = Theme.CardHover}, 0.2)
                Tween(friendName, {TextColor3 = Theme.Text}, 0.2)
                Tween(friendStatus, {TextColor3 = Theme.TextSecondary}, 0.2)
            end)
        end
    else
        local noFriends = CreateLabel(FriendList, "No friends online", UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), 15, false, Color3.fromRGB(100, 100, 100))
        noFriends.TextXAlignment = Enum.TextXAlignment.Center
    end
end)

--// RIGHT PANEL (Main Content)
local RightPanel = CreateElement("Frame", {
    Size = UDim2.new(0, 490, 1, 0),
    Position = UDim2.new(0, 760, 0, 0),
    BackgroundColor3 = Theme.Card,
    BorderSizePixel = 0,
    Parent = MainFrame
})

AddCorner(RightPanel, 18)
AddStroke(RightPanel, Theme.Primary, 1, 0.85)

-- Top Bar
local TopBar = CreateElement("Frame", {
    Size = UDim2.new(1, 0, 0, 70),
    BackgroundColor3 = Theme.Background,
    BorderSizePixel = 0,
    Parent = RightPanel
})

AddCorner(TopBar, 18)
AddGradient(TopBar, Theme.Background, Theme.Card, 180)

local HubTitle = CreateLabel(TopBar, "NETTYUH HUB", UDim2.new(1, -130, 1, 0), UDim2.new(0, 24, 0, 0), 22, true)

local VersionBadge = CreateElement("Frame", {
    Size = UDim2.new(0, 58, 0, 26),
    Position = UDim2.new(0, 185, 0.5, -13),
    BackgroundColor3 = Theme.Primary,
    BorderSizePixel = 0,
    Parent = TopBar
})

AddCorner(VersionBadge, 13)

local versionLabel = CreateLabel(VersionBadge, "V" .. Config.Version, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), 11, true)
versionLabel.TextXAlignment = Enum.TextXAlignment.Center

local CloseButton = CreateElement("TextButton", {
    Size = UDim2.new(0, 42, 0, 42),
    Position = UDim2.new(1, -54, 0.5, -21),
    BackgroundColor3 = Color3.fromRGB(239, 68, 68),
    Text = "×",
    TextColor3 = Color3.new(1, 1, 1),
    Font = Enum.Font.GothamBold,
    TextSize = 30,
    BorderSizePixel = 0,
    AutoButtonColor = false,
    Parent = TopBar
})

AddCorner(CloseButton, 12)

CloseButton.MouseEnter:Connect(function()
    Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(220, 38, 38)}, 0.2)
end)

CloseButton.MouseLeave:Connect(function()
    Tween(CloseButton, {BackgroundColor3 = Color3.fromRGB(239, 68, 68)}, 0.2)
end)

CloseButton.MouseButton1Click:Connect(function()
    CreateRipple(CloseButton, 21, 21)
    Tween(MainFrame, {Position = UDim2.new(0.5, -625, 1.5, 0)}, 0.5)
    if BlurEffect then
        Tween(BlurEffect, {Size = 0}, 0.5)
    end
    wait(0.5)
    GUI:Destroy()
end)

-- Tab Bar
local TabBar = CreateElement("Frame", {
    Size = UDim2.new(0, 750, 0, 54),
    Position = UDim2.new(0, 12, 0, 82),
    BackgroundTransparency = 1,
    Parent = RightPanel
})

local tabLayout = CreateElement("UIListLayout", {
    FillDirection = Enum.FillDirection.Horizontal,
    Padding = UDim.new(0, 0),
    HorizontalAlignment = Enum.HorizontalAlignment.Left,
    Parent = TabBar
})

-- Search Bar
local SearchBar = CreateElement("Frame", {
    Size = UDim2.new(1, -24, 0, 40),
    Position = UDim2.new(0, 12, 0, 145),
    BackgroundColor3 = Theme.CardHover,
    BorderSizePixel = 0,
    Parent = RightPanel
})

AddCorner(SearchBar, 10)
AddStroke(SearchBar, Theme.Primary, 1, 0.9)

local SearchIcon = CreateIcon(SearchBar, "Search", 20, UDim2.new(0, 12, 0.5, -10))

local SearchInput = CreateElement("TextBox", {
    Size = UDim2.new(1, -45, 1, 0),
    Position = UDim2.new(0, 40, 0, 0),
    BackgroundTransparency = 1,
    PlaceholderText = "Search features...",
    PlaceholderColor3 = Theme.TextSecondary,
    Text = "",
    TextColor3 = Theme.Text,
    Font = Enum.Font.Gotham,
    TextSize = 13,
    TextXAlignment = Enum.TextXAlignment.Left,
    ClearTextOnFocus = false,
    Parent = SearchBar
})

-- Search functionality
local searchResults = {}

SearchInput:GetPropertyChangedSignal("Text"):Connect(function()
    local query = SearchInput.Text:lower()
    
    if query == "" then
        -- Show all features
        for _, page in pairs(Pages) do
            for _, section in pairs(page:GetChildren()) do
                if section:IsA("Frame") then
                    section.Visible = true
                end
            end
        end
        return
    end
    
    -- Filter features
    for _, page in pairs(Pages) do
        for _, section in pairs(page:GetChildren()) do
            if section:IsA("Frame") and section:FindFirstChild("TextLabel") then
                local sectionName = section.TextLabel.Text:lower()
                local hasMatch = false
                
                -- Check section name
                if sectionName:find(query) then
                    hasMatch = true
                end
                
                -- Check child elements
                for _, child in pairs(section:GetChildren()) do
                    if child:IsA("Frame") and child:FindFirstChild("TextLabel") then
                        local childText = child.TextLabel.Text:lower()
                        if childText:find(query) then
                            hasMatch = true
                            break
                        end
                    end
                end
                
                section.Visible = hasMatch
            end
        end
    end
end)

local Pages = {}

local function CreateTab(name, iconName)
    local tab = CreateElement("TextButton", {
        Size = UDim2.new(0, 110, 1, 0),
        BackgroundColor3 = Theme.CardHover,
        Text = "",
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Parent = TabBar
    })
    
    AddCorner(tab, 12)
    
    CreateIcon(tab, iconName, 24, UDim2.new(0, 12, 0.5, -12))
    CreateLabel(tab, name, UDim2.new(1, -44, 1, 0), UDim2.new(0, 42, 0, 0), 14, true)
    
    local page = CreateElement("ScrollingFrame", {
        Size = UDim2.new(1, -24, 1, -205),
        Position = UDim2.new(0, 12, 0, 195),
        BackgroundTransparency = 1,
        ScrollBarThickness = 6,
        BorderSizePixel = 0,
        Visible = false,
        ScrollBarImageColor3 = Theme.Primary,
        ScrollBarImageTransparency = 0.5,
        Parent = RightPanel
    })
    
    local pageLayout = CreateElement("UIListLayout", {
        Padding = UDim.new(0, 14),
        Parent = page
    })
    
    Pages[name] = page
    
    tab.MouseButton1Click:Connect(function()
        CreateRipple(tab, 55, 27)
        PlaySound("6026984224")
        
        for _, p in pairs(Pages) do
            p.Visible = false
        end
        
        page.Visible = true
        CurrentPage = name
        
        for _, t in pairs(TabBar:GetChildren()) do
            if t:IsA("TextButton") then
                Tween(t, {BackgroundColor3 = Theme.CardHover}, 0.2)
                if t.ImageLabel then
                    Tween(t.ImageLabel, {ImageColor3 = Theme.Text}, 0.2)
                end
            end
        end
        
        Tween(tab, {BackgroundColor3 = Theme.Primary}, 0.2)
        if tab.ImageLabel then
            Tween(tab.ImageLabel, {ImageColor3 = Theme.Text}, 0.2)
        end
    end)
    
    return page
end

local HomePage = CreateTab("Home", "Home")
local PlayerPage = CreateTab("Player", "User")
local PlayersPage = CreateTab("Players", "Users")
local WorldPage = CreateTab("World", "Globe")
local ScriptsPage = CreateTab("Scripts", "Code")
local ConfigPage = CreateTab("Config", "Settings")
local SettingsPage = CreateTab("Settings", "Settings")

--// Helper Functions for Page Elements
local function CreateSection(page, title)
    local section = CreateElement("Frame", {
        Size = UDim2.new(1, -10, 0, 0),
        BackgroundColor3 = Theme.Background,
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = page
    })
    
    AddCorner(section, 12)
    AddStroke(section, Theme.Primary, 1, 0.9)
    
    local padding = CreateElement("UIPadding", {
        PaddingTop = UDim.new(0, 14),
        PaddingBottom = UDim.new(0, 14),
        PaddingLeft = UDim.new(0, 14),
        PaddingRight = UDim.new(0, 14),
        Parent = section
    })
    
    local sectionTitle = CreateLabel(section, title, UDim2.new(1, 0, 0, 28), UDim2.new(0, 0, 0, 0), 16, true, Theme.Primary)
    
    local sectionContent = CreateElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0, 0, 0, 36),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = section
    })
    
    local contentLayout = CreateElement("UIListLayout", {
        Padding = UDim.new(0, 8),
        Parent = sectionContent
    })
    
    return sectionContent
end

local function CreateToggle(parent, name, default, callback)
    local toggle = CreateElement("Frame", {
        Size = UDim2.new(1, 0, 0, 46),
        BackgroundColor3 = Theme.CardHover,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(toggle, 10)
    
    CreateLabel(toggle, name, UDim2.new(1, -70, 1, 0), UDim2.new(0, 14, 0, 0), 13)
    
    local toggleButton = CreateElement("TextButton", {
        Size = UDim2.new(0, 50, 0, 28),
        Position = UDim2.new(1, -60, 0.5, -14),
        BackgroundColor3 = Color3.fromRGB(45, 45, 55),
        Text = "",
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Parent = toggle
    })
    
    AddCorner(toggleButton, 14)
    
    local indicator = CreateElement("Frame", {
        Size = UDim2.new(0, 22, 0, 22),
        Position = UDim2.new(0, 3, 0.5, -11),
        BackgroundColor3 = Theme.Text,
        BorderSizePixel = 0,
        Parent = toggleButton
    })
    
    AddCorner(indicator, 11)
    
    local isOn = default or false
    
    if isOn then
        toggleButton.BackgroundColor3 = Theme.Primary
        indicator.Position = UDim2.new(1, -25, 0.5, -11)
    end
    
    toggleButton.MouseButton1Click:Connect(function()
        isOn = not isOn
        
        Tween(toggleButton, {
            BackgroundColor3 = isOn and Theme.Primary or Color3.fromRGB(45, 45, 55)
        }, 0.2)
        
        Tween(indicator, {
            Position = isOn and UDim2.new(1, -25, 0.5, -11) or UDim2.new(0, 3, 0.5, -11)
        }, 0.3, Enum.EasingStyle.Back)
        
        PlaySound("12221967")
        if callback then callback(isOn) end
    end)
    
    -- Hover effect
    toggle.MouseEnter:Connect(function()
        Tween(toggle, {BackgroundColor3 = Theme.Primary}, 0.2)
    end)
    
    toggle.MouseLeave:Connect(function()
        Tween(toggle, {BackgroundColor3 = Theme.CardHover}, 0.2)
    end)
    
    return toggle
end

local function CreateSlider(parent, name, min, max, default, callback)
    local slider = CreateElement("Frame", {
        Size = UDim2.new(1, 0, 0, 62),
        BackgroundColor3 = Theme.CardHover,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(slider, 10)
    
    CreateLabel(slider, name, UDim2.new(1, -70, 0, 22), UDim2.new(0, 14, 0, 8), 13)
    
    local valueLabel = CreateLabel(slider, tostring(default), UDim2.new(0, 60, 0, 22), UDim2.new(1, -70, 0, 8), 13, true, Theme.Primary)
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    local sliderBar = CreateElement("TextButton", {
        Size = UDim2.new(1, -28, 0, 5),
        Position = UDim2.new(0, 14, 1, -24),
        BackgroundColor3 = Color3.fromRGB(40, 40, 50),
        Text = "",
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Parent = slider
    })
    
    AddCorner(sliderBar, 2.5)
    
    local sliderFill = CreateElement("Frame", {
        Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = Theme.Primary,
        BorderSizePixel = 0,
        Parent = sliderBar
    })
    
    AddCorner(sliderFill, 2.5)
    
    local sliderDot = CreateElement("Frame", {
        Size = UDim2.new(0, 16, 0, 16),
        Position = UDim2.new(1, -8, 0.5, -8),
        BackgroundColor3 = Theme.Text,
        BorderSizePixel = 0,
        Parent = sliderFill
    })
    
    AddCorner(sliderDot, 8)
    
    local currentValue = default
    local dragging = false
    local connection
    
    local function updateSlider(input)
        local relativeX = math.clamp(
            (input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X,
            0,
            1
        )
        currentValue = math.floor(min + (max - min) * relativeX)
        
        Tween(sliderFill, {Size = UDim2.new(relativeX, 0, 1, 0)}, 0.1)
        valueLabel.Text = tostring(currentValue)
        
        if callback then callback(currentValue) end
    end
    
    sliderBar.MouseButton1Down:Connect(function()
        dragging = true
        
        connection = UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
                updateSlider(input)
            end
        end)
        
        updateSlider(UserInputService:GetMouseLocation())
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
            dragging = false
            if connection then
                connection:Disconnect()
            end
        end
    end)
    
    -- Hover effect
    slider.MouseEnter:Connect(function()
        Tween(slider, {BackgroundColor3 = Theme.Primary}, 0.2)
        Tween(sliderDot, {Size = UDim2.new(0, 20, 0, 20), Position = UDim2.new(1, -10, 0.5, -10)}, 0.2)
    end)
    
    slider.MouseLeave:Connect(function()
        Tween(slider, {BackgroundColor3 = Theme.CardHover}, 0.2)
        Tween(sliderDot, {Size = UDim2.new(0, 16, 0, 16), Position = UDim2.new(1, -8, 0.5, -8)}, 0.2)
    end)
    
    return slider
end

local function CreateDropdown(parent, name, options, default, callback)
    local dropdown = CreateElement("Frame", {
        Size = UDim2.new(1, 0, 0, 46),
        BackgroundColor3 = Theme.CardHover,
        ClipsDescendants = true,
        BorderSizePixel = 0,
        Parent = parent
    })
    
    AddCorner(dropdown, 10)
    
    local header = CreateElement("TextButton", {
        Size = UDim2.new(1, 0, 0, 46),
        BackgroundTransparency = 1,
        Text = "",
        Parent = dropdown
    })
    
    local label = CreateLabel(header, name .. ": " .. (default or options[1]), UDim2.new(1, -45, 1, 0), UDim2.new(0, 14, 0, 0), 13)
    
    local arrow = CreateLabel(header, "▼", UDim2.new(0, 20, 0, 20), UDim2.new(1, -32, 0.5, -10), 11, true)
    arrow.TextXAlignment = Enum.TextXAlignment.Center
    
    local optionsContainer = CreateElement("Frame", {
        Size = UDim2.new(1, 0, 0, #options * 38),
        Position = UDim2.new(0, 0, 0, 46),
        BackgroundTransparency = 1,
        Parent = dropdown
    })
    
    local optionsLayout = CreateElement("UIListLayout", {
        Padding = UDim.new(0, 3),
        Parent = optionsContainer
    })
    
    local isOpen = false
    
    for _, option in ipairs(options) do
        local optionButton = CreateElement("TextButton", {
            Size = UDim2.new(1, -10, 0, 35),
            Position = UDim2.new(0, 5, 0, 0),
            BackgroundColor3 = Theme.Background,
            Text = option,
            TextColor3 = Theme.Text,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            BorderSizePixel = 0,
            AutoButtonColor = false,
            Parent = optionsContainer
        })
        
        AddCorner(optionButton, 8)
        
        optionButton.MouseEnter:Connect(function()
            Tween(optionButton, {BackgroundColor3 = Theme.Primary}, 0.2)
        end)
        
        optionButton.MouseLeave:Connect(function()
            Tween(optionButton, {BackgroundColor3 = Theme.Background}, 0.2)
        end)
        
        optionButton.MouseButton1Click:Connect(function()
            label.Text = name .. ": " .. option
            isOpen = false
            
            Tween(dropdown, {Size = UDim2.new(1, 0, 0, 46)}, 0.2)
            Tween(arrow, {Rotation = 0}, 0.2)
            
            PlaySound("6026984224")
            if callback then callback(option) end
        end)
    end
    
    header.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        
        if isOpen then
            Tween(dropdown, {Size = UDim2.new(1, 0, 0, 46 + #options * 38 + 10)}, 0.3, Enum.EasingStyle.Back)
            Tween(arrow, {Rotation = 180}, 0.3)
        else
            Tween(dropdown, {Size = UDim2.new(1, 0, 0, 46)}, 0.3)
            Tween(arrow, {Rotation = 0}, 0.3)
        end
        
        PlaySound("12221967")
    end)
    
    return dropdown
end

local function CreateButton(parent, name, callback)
    local btn = CreateElement("TextButton", {
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = Theme.Primary,
        Text = name,
        TextColor3 = Theme.Text,
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Parent = parent
    })
    
    AddCorner(btn, 10)
    
    local buttonGradient = AddGradient(btn, Theme.Primary, Theme.Secondary, 90)
    
    btn.MouseEnter:Connect(function()
        Tween(btn, {BackgroundColor3 = Theme.Accent}, 0.2)
    end)
    
    btn.MouseLeave:Connect(function()
        Tween(btn, {BackgroundColor3 = Theme.Primary}, 0.2)
    end)
    
    btn.MouseButton1Click:Connect(function()
        CreateRipple(btn, btn.AbsoluteSize.X / 2, btn.AbsoluteSize.Y / 2)
        PlaySound("6026984224")
        if callback then callback() end
    end)
    
    return btn
end

--// HOME/DASHBOARD PAGE
local HomeWelcome = CreateSection(HomePage, "Welcome Back!")

local WelcomeCard = CreateElement("Frame", {
    Size = UDim2.new(1, 0, 0, 120),
    BackgroundColor3 = Theme.Primary,
    BorderSizePixel = 0,
    Parent = HomeWelcome
})

AddCorner(WelcomeCard, 12)
AddGradient(WelcomeCard, Theme.Primary, Theme.Secondary, 135)

local WelcomeText = CreateLabel(WelcomeCard, "👋 Hello, " .. Player.Name .. "!", UDim2.new(1, -30, 0, 35), UDim2.new(0, 15, 0, 15), 24, true)

local WelcomeSubtext = CreateLabel(WelcomeCard, "Welcome to Nettyuh Hub V" .. Config.Version, UDim2.new(1, -30, 0, 25), UDim2.new(0, 15, 0, 55), 14, false, Color3.fromRGB(230, 230, 230))

local GameDetect = CreateLabel(WelcomeCard, "📍 Currently playing: " .. CurrentGame.Name, UDim2.new(1, -30, 0, 22), UDim2.new(0, 15, 0, 85), 13, false, Color3.fromRGB(200, 200, 200))

local HomeQuickStats = CreateSection(HomePage, "Quick Stats")

local quickStatsGrid = CreateElement("Frame", {
    Size = UDim2.new(1, 0, 0, 100),
    BackgroundTransparency = 1,
    Parent = HomeQuickStats
})

local quickStatsLayout = CreateElement("UIGridLayout", {
    CellSize = UDim2.new(0.48, 0, 0, 45),
    CellPadding = UDim2.new(0.04, 0, 0, 10),
    Parent = quickStatsGrid
})

local function CreateQuickStat(title, value, icon)
    local stat = CreateElement("Frame", {
        BackgroundColor3 = Theme.CardHover,
        BorderSizePixel = 0,
        Parent = quickStatsGrid
    })
    
    AddCorner(stat, 10)
    
    CreateIcon(stat, icon, 24, UDim2.new(0, 12, 0.5, -12), Theme.Primary)
    
    local titleLabel = CreateLabel(stat, title, UDim2.new(1, -50, 0, 18), UDim2.new(0, 45, 0, 6), 11, false, Theme.TextSecondary)
    
    local valueLabel = CreateLabel(stat, value, UDim2.new(1, -50, 0, 20), UDim2.new(0, 45, 0, 22), 16, true)
    
    return valueLabel
end

local QuickFPS = CreateQuickStat("FPS", "60", "Zap")
local QuickPing = CreateQuickStat("Ping", "0ms", "Signal")
local QuickPlayers = CreateQuickStat("Players", "0/0", "Users")
local QuickUptime = CreateQuickStat("Session", "00:00", "Clock")

RunService.RenderStepped:Connect(function()
    QuickFPS.Text = tostring(math.floor(1 / RunService.RenderStepped:Wait()))
    
    local stats = game:GetService("Stats").Network.ServerStatsItem
    QuickPing.Text = math.floor(stats["Data Ping"]:GetValue()) .. "ms"
    
    QuickPlayers.Text = #Players:GetPlayers() .. "/" .. Players.MaxPlayers
    
    local uptime = math.floor(tick() - StartTime)
    local minutes = math.floor(uptime / 60)
    local seconds = uptime % 60
    QuickUptime.Text = string.format("%02d:%02d", minutes, seconds)
end)

local HomeQuickActions = CreateSection(HomePage, "Quick Actions")

local actionsGrid = CreateElement("Frame", {
    Size = UDim2.new(1, 0, 0, 90),
    BackgroundTransparency = 1,
    Parent = HomeQuickActions
})

local actionsGridLayout = CreateElement("UIGridLayout", {
    CellSize = UDim2.new(0.48, 0, 0, 40),
    CellPadding = UDim2.new(0.04, 0, 0, 10),
    Parent = actionsGrid
})

CreateButton(actionsGrid, "Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    Notify("Executing...", "Infinite Yield loaded", 2, "Code")
    _G.UpdateStatus("⚙️ Executing Infinite Yield...", Color3.fromRGB(255, 200, 0))
end)

CreateButton(actionsGrid, "Rejoin Server", function()
    TeleportService:Teleport(game.PlaceId, Player)
    _G.UpdateStatus("🔄 Rejoining server...", Color3.fromRGB(255, 200, 0))
end)

CreateButton(actionsGrid, "Copy Game Link", function()
    setclipboard("https://www.roblox.com/games/" .. game.PlaceId)
    Notify("Copied!", "Game link copied", 2, "Check")
    _G.UpdateStatus("✅ Link copied", Color3.fromRGB(100, 255, 100))
end)

CreateButton(actionsGrid, "Server Hop", function()
    _G.UpdateStatus("🔍 Finding new server...", Color3.fromRGB(255, 200, 0))
    pcall(function()
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        for _, server in pairs(servers.data) do
            if server.id ~= game.JobId and server.playing < server.maxPlayers then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, Player)
                break
            end
        end
    end)
end)

local HomeChangelog = CreateSection(HomePage, "📰 What's New")

local ChangelogText = CreateLabel(HomeChangelog, [[
✨ Version 1.0.0 Release!

• New Home/Dashboard page
• Added Search bar to find features
• Player List tab with Fling, TP, Spectate
• Working Aimbot with keybind
• Config system (Save/Load/Export)
• Game detector & status bar
• Watermark (toggle in settings)
• Smooth loading screen
• 50+ universal features

Join Discord for updates!
]], UDim2.new(1, 0, 0, 220), UDim2.new(0, 0, 0, 0), 12, false, Theme.TextSecondary)
ChangelogText.TextWrapped = true
ChangelogText.TextXAlignment = Enum.TextXAlignment.Left

--// CONFIG PAGE
local ConfigSave = CreateSection(ConfigPage, "Save & Load")

CreateButton(ConfigSave, "💾 Save Configuration", function()
    local configData = HttpService:JSONEncode(Config)
    
    if writefile then
        writefile("NettyuhHub_Config.json", configData)
        Notify("Config Saved!", "Configuration saved to file", 2.5, "Check")
        _G.UpdateStatus("✅ Config saved", Color3.fromRGB(100, 255, 100))
    else
        Notify("Error", "Executor doesn't support file writing", 3, "X")
    end
end)

CreateButton(ConfigSave, "📂 Load Configuration", function()
    if readfile and isfile and isfile("NettyuhHub_Config.json") then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile("NettyuhHub_Config.json"))
        end)
        
        if success then
            for key, value in pairs(data) do
                Config[key] = value
            end
            Notify("Config Loaded!", "Configuration loaded successfully", 2.5, "Check")
            _G.UpdateStatus("✅ Config loaded", Color3.fromRGB(100, 255, 100))
        end
    else
        Notify("No Config", "No saved configuration found", 2.5, "Info")
    end
end)

local ConfigExport = CreateSection(ConfigPage, "Export & Import")

CreateButton(ConfigExport, "📋 Export Config (Copy)", function()
    local configData = HttpService:JSONEncode(Config)
    setclipboard(configData)
    Notify("Exported!", "Config copied to clipboard", 2.5, "Copy")
end)

local ImportInput = CreateElement("TextBox", {
    Size = UDim2.new(1, 0, 0, 80),
    BackgroundColor3 = Theme.CardHover,
    BorderSizePixel = 0,
    PlaceholderText = "Paste config here...",
    PlaceholderColor3 = Theme.TextSecondary,
    Text = "",
    TextColor3 = Theme.Text,
    Font = Enum.Font.Gotham,
    TextSize = 12,
    TextWrapped = true,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Top,
    ClearTextOnFocus = false,
    MultiLine = true,
    Parent = ConfigExport
})

AddCorner(ImportInput, 10)

local importPadding = CreateElement("UIPadding", {
    PaddingTop = UDim.new(0, 8),
    PaddingBottom = UDim.new(0, 8),
    PaddingLeft = UDim.new(0, 8),
    PaddingRight = UDim.new(0, 8),
    Parent = ImportInput
})

CreateButton(ConfigExport, "📥 Import Config", function()
    local configText = ImportInput.Text
    
    if configText == "" then
        Notify("Error", "Please paste config data first", 2.5, "X")
        return
    end
    
    local success, data = pcall(function()
        return HttpService:JSONDecode(configText)
    end)
    
    if success then
        for key, value in pairs(data) do
            Config[key] = value
        end
        Notify("Imported!", "Config imported successfully", 2.5, "Check")
        ImportInput.Text = ""
    else
        Notify("Error", "Invalid config data", 2.5, "X")
    end
end)

local ConfigProfiles = CreateSection(ConfigPage, "Config Profiles")

CreateButton(ConfigProfiles, "Save as Profile 1", function()
    if writefile then
        writefile("NettyuhHub_Profile1.json", HttpService:JSONEncode(Config))
        Notify("Profile 1 Saved", "Config saved to profile slot 1", 2.5, "Check")
    end
end)

CreateButton(ConfigProfiles, "Load Profile 1", function()
    if readfile and isfile and isfile("NettyuhHub_Profile1.json") then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile("NettyuhHub_Profile1.json"))
        end)
        
        if success then
            for key, value in pairs(data) do
                Config[key] = value
            end
            Notify("Profile 1 Loaded", "Config loaded from profile 1", 2.5, "Check")
        end
    end
end)

CreateButton(ConfigProfiles, "Save as Profile 2", function()
    if writefile then
        writefile("NettyuhHub_Profile2.json", HttpService:JSONEncode(Config))
        Notify("Profile 2 Saved", "Config saved to profile slot 2", 2.5, "Check")
    end
end)

CreateButton(ConfigProfiles, "Load Profile 2", function()
    if readfile and isfile and isfile("NettyuhHub_Profile2.json") then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile("NettyuhHub_Profile2.json"))
        end)
        
        if success then
            for key, value in pairs(data) do
                Config[key] = value
            end
            Notify("Profile 2 Loaded", "Config loaded from profile 2", 2.5, "Check")
        end
    end
end)

local ConfigReset = CreateSection(ConfigPage, "Reset")

CreateButton(ConfigReset, "🔄 Reset to Defaults", function()
    Config = {
        Version = "1.0.0",
        Keybind = Enum.KeyCode.RightControl,
        Theme = "Purple",
        UIScale = "Medium",
        Animations = true,
        Notifications = true,
        Particles = true,
        Sounds = false,
        AutoSave = true,
        BlurEffect = true,
        Watermark = true,
        CustomKeybinds = {},
        Favorites = {}
    }
    Notify("Reset Complete", "All settings reset to default", 2.5, "Refresh")
end)

--// PLAYER PAGE
local PlayerMovement = CreateSection(PlayerPage, "Movement Controls")

CreateSlider(PlayerMovement, "Walk Speed", 16, 400, 16, function(value)
    local char = Player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = value
        StatCards.Speed.Text = tostring(value)
    end
end)

CreateSlider(PlayerMovement, "Jump Power", 50, 700, 50, function(value)
    local char = Player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = value
    end
end)

CreateSlider(PlayerMovement, "Hip Height", 0, 50, 0, function(value)
    local char = Player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.HipHeight = value
    end
end)

CreateSlider(PlayerMovement, "Gravity", -196, 400, -196, function(value)
    workspace.Gravity = value
end)

local PlayerAbilities = CreateSection(PlayerPage, "Abilities & Powers")

CreateToggle(PlayerAbilities, "Flight (WASD + Space/Shift)", false, function(enabled)
    local char = Player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    if enabled then
        local rootPart = char.HumanoidRootPart
        
        _G.flyBodyGyro = Instance.new("BodyGyro", rootPart)
        _G.flyBodyGyro.P = 9e4
        _G.flyBodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        _G.flyBodyGyro.cframe = rootPart.CFrame
        
        _G.flyBodyVelocity = Instance.new("BodyVelocity", rootPart)
        _G.flyBodyVelocity.velocity = Vector3.new(0, 0, 0)
        _G.flyBodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        _G.flyConnection = RunService.RenderStepped:Connect(function()
            local camera = Camera
            local moveDir = Vector3.new(0, 0, 0)
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDir = moveDir + camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDir = moveDir - camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDir = moveDir - camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDir = moveDir + camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveDir = moveDir + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveDir = moveDir - Vector3.new(0, 1, 0)
            end
            
            if _G.flyBodyVelocity and _G.flyBodyGyro then
                _G.flyBodyVelocity.velocity = moveDir * (_G.flySpeed or 50)
                _G.flyBodyGyro.cframe = camera.CFrame
            end
        end)
        
        Notify("Flight Enabled", "Use WASD + Space/Shift to fly", 3, "Zap")
    else
        if _G.flyConnection then _G.flyConnection:Disconnect() end
        if _G.flyBodyGyro then _G.flyBodyGyro:Destroy() end
        if _G.flyBodyVelocity then _G.flyBodyVelocity:Destroy() end
    end
end)

CreateSlider(PlayerAbilities, "Flight Speed", 20, 500, 50, function(value)
    _G.flySpeed = value
end)

CreateToggle(PlayerAbilities, "NoClip", false, function(enabled)
    if enabled then
        _G.noClipConnection = RunService.Stepped:Connect(function()
            local char = Player.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        Notify("NoClip Enabled", "Walk through walls", 2.5, "Shield")
    else
        if _G.noClipConnection then
            _G.noClipConnection:Disconnect()
        end
    end
end)

CreateToggle(PlayerAbilities, "Infinite Jump", false, function(enabled)
    if enabled then
        _G.infJumpConnection = UserInputService.JumpRequest:Connect(function()
            local char = Player.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        if _G.infJumpConnection then
            _G.infJumpConnection:Disconnect()
        end
    end
end)

CreateToggle(PlayerAbilities, "Anti-AFK", false, function(enabled)
    if enabled then
        _G.antiAFK = game:GetService("VirtualUser")
        _G.antiAFKConnection = Player.Idled:Connect(function()
            _G.antiAFK:CaptureController()
            _G.antiAFK:ClickButton2(Vector2.new())
        end)
    else
        if _G.antiAFKConnection then
            _G.antiAFKConnection:Disconnect()
        end
    end
end)

CreateToggle(PlayerAbilities, "Swim in Air", false, function(enabled)
    if enabled then
        _G.swimConnection = RunService.Heartbeat:Connect(function()
            local char = Player.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
                char.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
            end
        end)
    else
        if _G.swimConnection then
            _G.swimConnection:Disconnect()
        end
    end
end)

local PlayerTeleport = CreateSection(PlayerPage, "Teleportation")

CreateToggle(PlayerTeleport, "Click Teleport (CTRL + Click)", false, function(enabled)
    if enabled then
        _G.clickTpConnection = Mouse.Button1Down:Connect(function()
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                local char = Player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = Mouse.Hit + Vector3.new(0, 2.5, 0)
                end
            end
        end)
    else
        if _G.clickTpConnection then
            _G.clickTpConnection:Disconnect()
        end
    end
end)

CreateButton(PlayerTeleport, "Teleport to Spawn", function()
    local char = Player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local spawn = workspace:FindFirstChildOfClass("SpawnLocation")
        if spawn then
            char.HumanoidRootPart.CFrame = spawn.CFrame + Vector3.new(0, 5, 0)
            Notify("Teleported!", "Moved to spawn location", 2.5, "Check")
        end
    end
end)

CreateButton(PlayerTeleport, "Teleport to Random Player", function()
    local char = Player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local players = Players:GetPlayers()
        if #players > 1 then
            local randomPlayer = players[math.random(1, #players)]
            if randomPlayer ~= Player and randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = randomPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                Notify("Teleported!", "Moved to " .. randomPlayer.Name, 2.5, "User")
            end
        end
    end
end)

--// PLAYERS PAGE (Player List with Actions)
local PlayerListSection = CreateSection(PlayersPage, "Player List")

-- Create scrollable player list
local PlayerListFrame = CreateElement("ScrollingFrame", {
    Size = UDim2.new(1, 0, 0, 400),
    BackgroundColor3 = Theme.CardHover,
    BorderSizePixel = 0,
    ScrollBarThickness = 6,
    ScrollBarImageColor3 = Theme.Primary,
    ScrollBarImageTransparency = 0.5,
    Parent = PlayerListSection
})

AddCorner(PlayerListFrame, 10)

local playerListLayout = CreateElement("UIListLayout", {
    Padding = UDim.new(0, 8),
    Parent = PlayerListFrame
})

local function CreatePlayerCard(plr)
    local card = CreateElement("Frame", {
        Size = UDim2.new(1, -10, 0, 80),
        BackgroundColor3 = Theme.Background,
        BorderSizePixel = 0,
        Parent = PlayerListFrame
    })
    
    AddCorner(card, 10)
    AddStroke(card, Theme.Primary, 1, 0.9)
    
    -- Avatar
    local avatar = CreateElement("ImageLabel", {
        Size = UDim2.new(0, 60, 0, 60),
        Position = UDim2.new(0, 10, 0.5, -30),
        BackgroundColor3 = Theme.CardHover,
        BorderSizePixel = 0,
        Parent = card
    })
    
    AddCorner(avatar, 30)
    
    pcall(function()
        avatar.Image = Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    end)
    
    -- Online indicator
    local indicator = CreateElement("Frame", {
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new(1, -4, 1, -4),
        BackgroundColor3 = Color3.fromRGB(34, 197, 94),
        BorderSizePixel = 0,
        Parent = avatar
    })
    
    AddCorner(indicator, 7)
    AddStroke(indicator, Theme.Background, 2, 0)
    
    -- Pulsing effect
    spawn(function()
        while indicator.Parent do
            Tween(indicator, {BackgroundColor3 = Color3.fromRGB(134, 239, 172)}, 1)
            wait(1)
            Tween(indicator, {BackgroundColor3 = Color3.fromRGB(34, 197, 94)}, 1)
            wait(1)
        end
    end)
    
    -- Player info
    local nameLabel = CreateLabel(card, plr.Name, UDim2.new(1, -340, 0, 22), UDim2.new(0, 80, 0, 8), 14, true)
    
    local displayLabel = CreateLabel(card, "@" .. plr.DisplayName, UDim2.new(1, -340, 0, 18), UDim2.new(0, 80, 0, 32), 11, false, Theme.TextSecondary)
    
    -- Distance label
    local distLabel = CreateLabel(card, "0m", UDim2.new(0, 60, 0, 16), UDim2.new(0, 80, 0, 52), 10, false, Theme.Accent)
    
    -- Update distance
    spawn(function()
        while card.Parent do
            if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (Player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                distLabel.Text = math.floor(dist) .. "m away"
            else
                distLabel.Text = "N/A"
            end
            wait(0.5)
        end
    end)
    
    -- Action buttons
    local actionsFrame = CreateElement("Frame", {
        Size = UDim2.new(0, 400, 0, 32),
        Position = UDim2.new(1, -410, 0.5, -16),
        BackgroundTransparency = 1,
        Parent = card
    })
    
    local actionsLayout = CreateElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 8),
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        Parent = actionsFrame
    })
    
    local function CreateActionBtn(text, callback)
        local btn = CreateElement("TextButton", {
            Size = UDim2.new(0, 70, 0, 32),
            BackgroundColor3 = Theme.Primary,
            Text = text,
            TextColor3 = Theme.Text,
            Font = Enum.Font.GothamBold,
            TextSize = 11,
            BorderSizePixel = 0,
            AutoButtonColor = false,
            Parent = actionsFrame
        })
        
        AddCorner(btn, 8)
        
        btn.MouseEnter:Connect(function()
            Tween(btn, {BackgroundColor3 = Theme.Accent}, 0.2)
        end)
        
        btn.MouseLeave:Connect(function()
            Tween(btn, {BackgroundColor3 = Theme.Primary}, 0.2)
        end)
        
        btn.MouseButton1Click:Connect(function()
            CreateRipple(btn, 35, 16)
            PlaySound("6026984224")
            if callback then callback() end
        end)
        
        return btn
    end
    
    -- Teleport button
    CreateActionBtn("TP", function()
        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            Notify("Teleported!", "Moved to " .. plr.Name, 2.5, "User")
            _G.UpdateStatus("✅ Teleported to " .. plr.Name, Color3.fromRGB(100, 255, 100))
        end
    end)
    
    -- View button
    CreateActionBtn("View", function()
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            Camera.CameraSubject = plr.Character.Humanoid
            Notify("Spectating", plr.Name, 2.5, "Eye")
            _G.UpdateStatus("👁️ Viewing " .. plr.Name, Color3.fromRGB(100, 200, 255))
        end
    end)
    
    -- Goto button (TP behind player)
    CreateActionBtn("Goto", function()
        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local targetCF = plr.Character.HumanoidRootPart.CFrame
            Player.Character.HumanoidRootPart.CFrame = targetCF * CFrame.new(0, 0, 3) -- Behind them
            Notify("Goto!", "Moved behind " .. plr.Name, 2.5, "User")
            _G.UpdateStatus("✅ Went to " .. plr.Name, Color3.fromRGB(100, 255, 100))
        end
    end)
    
    -- Annoy button (Loop TP)
    CreateActionBtn("Annoy", function()
        if _G["Annoy_" .. plr.Name] then
            _G["Annoy_" .. plr.Name]:Disconnect()
            _G["Annoy_" .. plr.Name] = nil
            Notify("Stopped", "No longer annoying " .. plr.Name, 2, "X")
            _G.UpdateStatus("✅ Stopped annoying", Color3.fromRGB(100, 255, 100))
        else
            _G["Annoy_" .. plr.Name] = RunService.Heartbeat:Connect(function()
                if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                    Player.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
                end
            end)
            Notify("Annoying", "Loop TPing to " .. plr.Name, 2.5, "Refresh")
            _G.UpdateStatus("🔄 Annoying " .. plr.Name, Color3.fromRGB(255, 200, 0))
        end
    end)
    
    -- Fling button (IMPROVED)
    CreateActionBtn("Fling", function()
        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and plr.Character and plr.Character:FindFirstChild("Humanoid") then
            local Target = plr.Character
            local Char = Player.Character
            local Hum = Char:FindFirstChildOfClass("Humanoid")
            local Root = Char:FindFirstChild("HumanoidRootPart")
            
            -- Fling method
            local function FlingPlayer()
                local TorPart = Root or Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso")
                local TarPart = Target:FindFirstChild("HumanoidRootPart") or Target:FindFirstChild("Torso") or Target:FindFirstChild("UpperTorso")
                
                if not TorPart or not TarPart then return end
                
                -- Disable player collision
                for _, v in pairs(Char:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                        v.Massless = true
                    end
                end
                
                -- Create velocity
                local BV = Instance.new("BodyVelocity", TorPart)
                BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                BV.Velocity = Vector3.new(9999, 9999, 9999)
                
                -- Fling duration
                task.spawn(function()
                    for i = 1, 15 do
                        if TorPart and TarPart then
                            TorPart.CFrame = TarPart.CFrame
                            TorPart.Velocity = Vector3.new(9999, 9999, 9999)
                            task.wait()
                        end
                    end
                    
                    -- Cleanup
                    if BV then BV:Destroy() end
                    
                    for _, v in pairs(Char:GetChildren()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = true
                            v.Massless = false
                        end
                    end
                end)
            end
            
            FlingPlayer()
            Notify("Flinged!", plr.Name .. " has been flung", 2.5, "Zap")
            _G.UpdateStatus("💥 Flinged " .. plr.Name, Color3.fromRGB(255, 150, 0))
        end
    end)
    
    return card
end

-- Populate player list
local function UpdatePlayerList()
    for _, child in pairs(PlayerListFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= Player then
            CreatePlayerCard(plr)
        end
    end
end

UpdatePlayerList()

-- Update when players join/leave
Players.PlayerAdded:Connect(function()
    task.wait(0.5)
    UpdatePlayerList()
end)

Players.PlayerRemoving:Connect(function()
    task.wait(0.1)
    UpdatePlayerList()
end)

-- Refresh button
CreateButton(PlayerListSection, "Refresh Player List", function()
    UpdatePlayerList()
    Notify("Refreshed", "Player list updated", 2, "Refresh")
end)

CreateButton(PlayerListSection, "Stop Spectating", function()
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Camera.CameraSubject = Player.Character.Humanoid
        Notify("Stopped", "Back to your view", 2, "Eye")
    end
end)

local PlayerActions = CreateSection(PlayersPage, "Quick Actions")

-- Dropdown for selecting player
local selectedPlayer = nil
local playerNames = {}

for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= Player then
        table.insert(playerNames, plr.Name)
    end
end

CreateDropdown(PlayerActions, "Select Player", playerNames, playerNames[1] or "None", function(name)
    selectedPlayer = Players:FindFirstChild(name)
end)

CreateButton(PlayerActions, "View Selected Player", function()
    if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("Humanoid") then
        Camera.CameraSubject = selectedPlayer.Character.Humanoid
        Notify("Viewing", selectedPlayer.Name, 2.5, "Eye")
    end
end)

CreateButton(PlayerActions, "Teleport Behind Selected", function()
    if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        local targetCFrame = selectedPlayer.Character.HumanoidRootPart.CFrame
        Player.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 0, 3)
        Notify("Teleported", "Behind " .. selectedPlayer.Name, 2.5, "User")
    end
end)

CreateButton(PlayerActions, "Walk to Selected", function()
    if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") and Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid:MoveTo(selectedPlayer.Character.HumanoidRootPart.Position)
        Notify("Walking", "Moving to " .. selectedPlayer.Name, 2, "User")
    end
end)

CreateButton(PlayerActions, "Spam Fling Selected", function()
    if _G.SpamFling then
        _G.SpamFling:Disconnect()
        _G.SpamFling = nil
        Notify("Stopped", "No longer flinging", 2, "X")
    else
        _G.SpamFling = RunService.Heartbeat:Connect(function()
            if selectedPlayer and selectedPlayer.Character and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                local Target = selectedPlayer.Character
                local Char = Player.Character
                local Root = Char:FindFirstChild("HumanoidRootPart")
                local TarRoot = Target:FindFirstChild("HumanoidRootPart")
                
                if Root and TarRoot then
                    Root.CFrame = TarRoot.CFrame
                    Root.Velocity = Vector3.new(9999, 9999, 9999)
                end
            end
        end)
        Notify("Spam Flinging", selectedPlayer.Name, 2.5, "Zap")
    end
end)

local MassActions = CreateSection(PlayersPage, "Mass Actions")

CreateButton(MassActions, "View Random Player", function()
    local players = {}
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= Player then
            table.insert(players, plr)
        end
    end
    
    if #players > 0 then
        local randomPlayer = players[math.random(1, #players)]
        if randomPlayer.Character and randomPlayer.Character:FindFirstChild("Humanoid") then
            Camera.CameraSubject = randomPlayer.Character.Humanoid
            Notify("Viewing", randomPlayer.Name, 2.5, "Eye")
        end
    end
end)

CreateButton(MassActions, "Teleport to All Players", function()
    spawn(function()
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= Player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                Player.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                wait(0.3)
            end
        end
        Notify("Done", "Visited all players", 2.5, "Check")
    end)
end)

CreateButton(MassActions, "Fling All Players", function()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= Player and plr.Character and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            local Target = plr.Character
            local Char = Player.Character
            local Root = Char:FindFirstChild("HumanoidRootPart")
            local TarRoot = Target:FindFirstChild("HumanoidRootPart")
            
            if Root and TarRoot then
                spawn(function()
                    for i = 1, 10 do
                        Root.CFrame = TarRoot.CFrame
                        Root.Velocity = Vector3.new(9999, 9999, 9999)
                        task.wait()
                    end
                end)
            end
            task.wait(0.1)
        end
    end
    Notify("Flinged All", "Everyone has been flung", 3, "Zap")
end)

CreateButton(MassActions, "Bring All to You", function()
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        local myPos = Player.Character.HumanoidRootPart.CFrame
        
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= Player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                plr.Character.HumanoidRootPart.CFrame = myPos + Vector3.new(math.random(-5, 5), 3, math.random(-5, 5))
            end
        end
        
        Notify("Brought All", "Everyone teleported to you", 2.5, "Users")
    end
end)

local PlayerInfo = CreateSection(PlayersPage, "Player Info")

CreateButton(PlayerInfo, "Copy Selected Username", function()
    if selectedPlayer then
        setclipboard(selectedPlayer.Name)
        Notify("Copied", selectedPlayer.Name, 2, "Copy")
    end
end)

CreateButton(PlayerInfo, "Copy Selected User ID", function()
    if selectedPlayer then
        setclipboard(tostring(selectedPlayer.UserId))
        Notify("Copied", "User ID: " .. selectedPlayer.UserId, 2, "Copy")
    end
end)

CreateButton(PlayerInfo, "Get Profile Link", function()
    if selectedPlayer then
        local link = "https://www.roblox.com/users/" .. selectedPlayer.UserId .. "/profile"
        setclipboard(link)
        Notify("Copied", "Profile link", 2, "Download")
    end
end)

--// WORLD PAGE
local WorldEnv = CreateSection(WorldPage, "Environment")

CreateToggle(WorldEnv, "Fullbright", false, function(enabled)
    if enabled then
        _G.oldBrightness = Lighting.Brightness
        _G.oldAmbient = Lighting.Ambient
        _G.oldOutdoorAmbient = Lighting.OutdoorAmbient
        Lighting.Brightness = 2
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    else
        Lighting.Brightness = _G.oldBrightness or 1
        Lighting.Ambient = _G.oldAmbient or Color3.new(0, 0, 0)
        Lighting.OutdoorAmbient = _G.oldOutdoorAmbient or Color3.new(0.5, 0.5, 0.5)
    end
end)

CreateToggle(WorldEnv, "Remove Fog", false, function(enabled)
    if enabled then
        _G.oldFogEnd = Lighting.FogEnd
        _G.oldFogStart = Lighting.FogStart
        Lighting.FogEnd = 100000
        Lighting.FogStart = 0
    else
        Lighting.FogEnd = _G.oldFogEnd or 1000
        Lighting.FogStart = _G.oldFogStart or 0
    end
end)

CreateToggle(WorldEnv, "Remove Shadows", false, function(enabled)
    Lighting.GlobalShadows = not enabled
end)

CreateToggle(WorldEnv, "Remove Textures/Decals", false, function(enabled)
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Texture") or obj:IsA("Decal") then
            obj.Transparency = enabled and 1 or 0
        end
    end
end)

local WorldTime = CreateSection(WorldPage, "Time Controls")

CreateToggle(WorldTime, "Lock Time", false, function(enabled)
    if enabled then
        _G.timeConnection = RunService.Heartbeat:Connect(function()
            Lighting.ClockTime = _G.lockedTime or 14
        end)
    else
        if _G.timeConnection then
            _G.timeConnection:Disconnect()
        end
    end
end)

CreateSlider(WorldTime, "Time of Day", 0, 24, 14, function(value)
    Lighting.ClockTime = value
    _G.lockedTime = value
end)

CreateButton(WorldTime, "Set to Noon", function()
    Lighting.ClockTime = 12
    _G.lockedTime = 12
end)

CreateButton(WorldTime, "Set to Midnight", function()
    Lighting.ClockTime = 0
    _G.lockedTime = 0
end)

CreateButton(WorldTime, "Set to Sunrise", function()
    Lighting.ClockTime = 6
    _G.lockedTime = 6
end)

CreateButton(WorldTime, "Set to Sunset", function()
    Lighting.ClockTime = 18
    _G.lockedTime = 18
end)

local WorldCamera = CreateSection(WorldPage, "Camera")

CreateSlider(WorldCamera, "Field of View", 70, 120, 70, function(value)
    Camera.FieldOfView = value
end)

CreateToggle(WorldCamera, "Remove Camera Shake", false, function(enabled)
    if enabled then
        _G.noCamShake = RunService.RenderStepped:Connect(function()
            Camera.CameraType = Enum.CameraType.Custom
        end)
    else
        if _G.noCamShake then
            _G.noCamShake:Disconnect()
        end
    end
end)

--// SCRIPTS PAGE
local ScriptsUniversal = CreateSection(ScriptsPage, "Universal Scripts")

local ScriptList = {
    {name = "Infinite Yield", code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()'},
    {name = "Dex Explorer V4", code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()'},
    {name = "Remote Spy", code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()'},
    {name = "Unnamed ESP", code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()'},
    {name = "Dark Dex V3", code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua"))()'},
    {name = "Owl Hub", code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()'}
}

for _, script in ipairs(ScriptList) do
    CreateButton(ScriptsUniversal, script.name, function()
        pcall(function()
            loadstring(script.code)()
            Notify("Script Executed", script.name .. " loaded successfully", 3, "Check")
        end)
    end)
end

--// SETTINGS PAGE
local SettingsUI = CreateSection(SettingsPage, "UI Configuration")

CreateDropdown(SettingsUI, "Theme", {"Purple", "Blue", "Red", "Green", "Cyan", "Pink", "Orange"}, Config.Theme, function(theme)
    Config.Theme = theme
    Theme = Themes[theme]
    Notify("Theme Changed", "Restart hub for full effect", 3.5, "Star")
end)

CreateDropdown(SettingsUI, "UI Scale", {"Small", "Medium", "Large"}, Config.UIScale, function(scale)
    Config.UIScale = scale
    
    if scale == "Small" then
        MainFrame.Size = UDim2.new(0, 1100, 0, 680)
        MainFrame.Position = UDim2.new(0.5, -550, 0.5, -340)
    elseif scale == "Medium" then
        MainFrame.Size = UDim2.new(0, 1250, 0, 750)
        MainFrame.Position = UDim2.new(0.5, -625, 0.5, -375)
    else
        MainFrame.Size = UDim2.new(0, 1400, 0, 820)
        MainFrame.Position = UDim2.new(0.5, -700, 0.5, -410)
    end
end)

CreateDropdown(SettingsUI, "Hide Keybind", {"RightControl", "RightShift", "Insert", "Delete", "Home", "End", "F1", "F2", "F3"}, "RightControl", function(key)
    Config.Keybind = Enum.KeyCode[key]
    Notify("Keybind Changed", "Press " .. key .. " to toggle UI", 2.5, "Settings")
end)

CreateToggle(SettingsUI, "Animations", Config.Animations, function(enabled)
    Config.Animations = enabled
end)

CreateToggle(SettingsUI, "Notifications", Config.Notifications, function(enabled)
    Config.Notifications = enabled
    if enabled then
        Notify("Notifications Enabled", "You'll see notifications like this", 2.5, "Check")
    end
end)

CreateToggle(SettingsUI, "Particle Effects", Config.Particles, function(enabled)
    Config.Particles = enabled
end)

CreateToggle(SettingsUI, "Sound Effects", Config.Sounds, function(enabled)
    Config.Sounds = enabled
    if enabled then
        PlaySound("6026984224")
    end
end)

CreateToggle(SettingsUI, "Blur Effect", Config.BlurEffect, function(enabled)
    Config.BlurEffect = enabled
    if BlurEffect then
        Tween(BlurEffect, {Size = enabled and 12 or 0}, 0.5)
    end
end)

CreateToggle(SettingsUI, "Watermark", Config.Watermark, function(enabled)
    Config.Watermark = enabled
    if Watermark then
        Watermark.Visible = enabled
        Notify(enabled and "Watermark ON" or "Watermark OFF", enabled and "Top watermark shown" or "Watermark hidden", 2, "Eye")
    end
end)

local SettingsConfig = CreateSection(SettingsPage, "Configuration")

CreateButton(SettingsConfig, "Save Configuration", function()
    Notify("Configuration Saved", "Settings saved successfully", 2.5, "Check")
end)

CreateButton(SettingsConfig, "Reset to Default", function()
    Config = {
        Version = "5.0.0",
        Keybind = Enum.KeyCode.RightControl,
        Theme = "Purple",
        UIScale = "Medium",
        Animations = true,
        Notifications = true,
        Particles = true,
        Sounds = false,
        AutoSave = true,
        BlurEffect = true
    }
    Notify("Settings Reset", "All settings reset to default", 2.5, "Refresh")
end)

--// Stats Update Loop
RunService.RenderStepped:Connect(function()
    local networkStats = game:GetService("Stats").Network.ServerStatsItem
    local pingValue = networkStats["Data Ping"]:GetValue()
    
    StatCards.Ping.Text = math.floor(pingValue) .. "ms"
    ServerValues.Ping.Text = math.floor(pingValue) .. " ms"
    
    local fps = math.floor(1 / RunService.RenderStepped:Wait())
    StatCards.FPS.Text = tostring(fps)
    
    local currentPlayers = #Players:GetPlayers()
    local maxPlayers = Players.MaxPlayers
    StatCards.Players.Text = currentPlayers .. "/" .. maxPlayers
    ServerValues.Players.Text = currentPlayers .. " / " .. maxPlayers
    
    StatCards.Memory.Text = math.floor(networkStats:GetTotalMemoryUsageMb()) .. " MB"
    
    local uptime = math.floor(tick() - StartTime)
    local minutes = math.floor(uptime / 60)
    local seconds = uptime % 60
    StatCards.Uptime.Text = string.format("%02d:%02d", minutes, seconds)
    ServerValues.Elapsed.Text = uptime .. " seconds"
end)

--// Keybind Listener
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Config.Keybind then
        IsHidden = not IsHidden
        
        if IsHidden then
            Tween(MainFrame, {Position = UDim2.new(0.5, -625, 1.5, 0)}, 0.4)
            if BlurEffect then
                Tween(BlurEffect, {Size = 0}, 0.4)
            end
        else
            Tween(MainFrame, {Position = UDim2.new(0.5, -625, 0.5, -375)}, 0.5, Enum.EasingStyle.Back)
            if BlurEffect and Config.BlurEffect then
                Tween(BlurEffect, {Size = 12}, 0.5)
            end
        end
    end
end)

--// Auto-Select First Tab
task.wait(0.2)
for _, tab in pairs(TabBar:GetChildren()) do
    if tab:IsA("TextButton") then
        Tween(tab, {BackgroundColor3 = Theme.Primary}, 0.4)
        if tab.ImageLabel then
            Tween(tab.ImageLabel, {ImageColor3 = Theme.Text}, 0.4)
        end
        
        if Pages[tab.TextLabel.Text] then
            Pages[tab.TextLabel.Text].Visible = true
        end
        
        break
    end
end

--// Welcome Notification
Notify(
    "Nettyuh Hub Loaded!",
    "v" .. Config.Version .. " • Press " .. Config.Keybind.Name .. " to toggle",
    5,
    "Star"
)

--// Console Output
print([[
╔═══════════════════════════════════════════════════════════╗
║            NETTYUH HUB V1.0.0 - RELEASE BUILD             ║
║                  Created by: swingerbox19                 ║
║            Discord: https://discord.gg/Y6VR5sqQHp         ║
╠═══════════════════════════════════════════════════════════╣
║  Press ]] .. Config.Keybind.Name .. [[ to toggle UI                               ║
╚═══════════════════════════════════════════════════════════╝
]])