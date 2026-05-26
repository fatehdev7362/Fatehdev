local MarketplaceService = game:GetService("MarketplaceService")
local TeleportService = game:GetService("TeleportService")
local supportedMaps = {["121864768012064"] = "Fish it"}
local success, info = pcall(function() return MarketplaceService:GetProductInfo(game.PlaceId) end)
local mapName = success and info.Name or "Unknown"
local isSupported = supportedMaps[tostring(game.PlaceId)] ~= nil

-- ========== SAFE WINDUI 1.6.63 LOADING ==========
local WindUI = nil
local windLoadOk, windLoadErr = pcall(function()
    WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/1.6.63/main.lua"))()
end)

if not windLoadOk or not WindUI then
    warn("[QH] CRITICAL: WindUI 1.6.63 failed to load: " .. tostring(windLoadErr))
    local emergencyGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    local emergencyLabel = Instance.new("TextLabel", emergencyGui)
    emergencyLabel.Size = UDim2.new(1, 0, 0, 60)
    emergencyLabel.Position = UDim2.new(0, 0, 0, 0)
    emergencyLabel.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    emergencyLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    emergencyLabel.Text = "[Quantum HUB] WindUI 1.6.63 failed to load.\nError: " .. tostring(windLoadErr):sub(1, 100)
    emergencyLabel.TextWrapped = true
    emergencyLabel.Font = Enum.Font.GothamBold
    emergencyLabel.TextSize = 14
    return
end

pcall(function()
    if WindUI.Creator and WindUI.Creator.AddIcons then
        WindUI.Creator.AddIcons("quantum", {
            ["atom"] = "rbxassetid://10709799158",
            ["quantum-logo"] = "rbxassetid://10709799158",
        })
    end
end)

-- ========== CUSTOM QUANTUM GREEN THEME ==========
local QuantumGreenTheme = {
    Name = "QuantumGreen",
    Accent = Color3.fromHex("#39ff14"),
    Background = Color3.fromHex("#0a190a"),
    Background2 = Color3.fromHex("#0f230f"),
    Text = Color3.fromHex("#dcffdc"),
    Text2 = Color3.fromHex("#96c896"),
    Element = Color3.fromHex("#142d14"),
    Border = Color3.fromHex("#2d822d"),
    Theme = Color3.fromHex("#39ff14"),
    Scrollbar = Color3.fromHex("#39ff14"),
    Topbar = Color3.fromHex("#0f280f"),
    Title = Color3.fromHex("#39ff14"),
    Dialog = Color3.fromHex("#0a190a"),
    Outline = Color3.fromHex("#39ff14"),
    Placeholder = Color3.fromHex("#5a8a5a"),
    Button = Color3.fromHex("#1e3d1e"),
    Icon = Color3.fromHex("#39ff14"),
    WindowBackground = Color3.fromHex("#0a190a"),
    WindowShadow = Color3.fromHex("#000000"),
    WindowTopbarTitle = Color3.fromHex("#dcffdc"),
    WindowTopbarAuthor = Color3.fromHex("#96c896"),
    WindowTopbarIcon = Color3.fromHex("#39ff14"),
    WindowTopbarButtonIcon = Color3.fromHex("#39ff14"),
    WindowSearchBarBackground = Color3.fromHex("#0f230f"),
    TabBackground = Color3.fromHex("#142814"),
    TabBackgroundHover = Color3.fromHex("#1a321a"),
    TabBackgroundHoverTransparency = 0.97,
    TabBackgroundActive = Color3.fromHex("#1e3d1e"),
    TabBackgroundActiveTransparency = 0.93,
    TabText = Color3.fromHex("#dcffdc"),
    TabTextTransparency = 0.3,
    TabTextTransparencyActive = 0,
    TabTitle = Color3.fromHex("#dcffdc"),
    TabIcon = Color3.fromHex("#39ff14"),
    TabIconTransparency = 0.4,
    TabIconTransparencyActive = 0.1,
    TabBorderTransparency = 1,
    TabBorderTransparencyActive = 0.75,
    TabBorder = Color3.fromHex("#ffffff"),
    ElementBackground = Color3.fromHex("#142814"),
    ElementBackgroundTransparency = 0.93,
    ElementTitle = Color3.fromHex("#dcffdc"),
    ElementDesc = Color3.fromHex("#96c896"),
    ElementIcon = Color3.fromHex("#39ff14"),
    PopupBackground = Color3.fromHex("#0a190a"),
    PopupBackgroundTransparency = 0.05,
    PopupTitle = Color3.fromHex("#dcffdc"),
    PopupContent = Color3.fromHex("#96c896"),
    PopupIcon = Color3.fromHex("#39ff14"),
    DialogBackground = Color3.fromHex("#0a190a"),
    DialogBackgroundTransparency = 0.05,
    DialogTitle = Color3.fromHex("#dcffdc"),
    DialogContent = Color3.fromHex("#96c896"),
    DialogIcon = Color3.fromHex("#39ff14"),
    Toggle = Color3.fromHex("#1e3d1e"),
    ToggleBar = Color3.fromHex("#ffffff"),
    Checkbox = Color3.fromHex("#39ff14"),
    CheckboxIcon = Color3.fromHex("#ffffff"),
    CheckboxBorder = Color3.fromHex("#ffffff"),
    CheckboxBorderTransparency = 0.75,
    SliderIcon = Color3.fromHex("#39ff14"),
    Slider = Color3.fromHex("#39ff14"),
    SliderThumb = Color3.fromHex("#ffffff"),
    SliderIconFrom = Color3.fromHex("#39ff14"),
    SliderIconTo = Color3.fromHex("#39ff14"),
    Tooltip = Color3.fromHex("#2d5a2d"),
    TooltipText = Color3.fromHex("#dcffdc"),
    TooltipSecondary = Color3.fromHex("#39ff14"),
    TooltipSecondaryText = Color3.fromHex("#ffffff"),
    TabSectionIcon = Color3.fromHex("#39ff14"),
    SectionIcon = Color3.fromHex("#39ff14"),
    SectionExpandIcon = Color3.fromHex("#ffffff"),
    SectionExpandIconTransparency = 0.4,
    SectionBox = Color3.fromHex("#ffffff"),
    SectionBoxTransparency = 0.95,
    SectionBoxBorder = Color3.fromHex("#ffffff"),
    SectionBoxBorderTransparency = 0.75,
    SectionBoxBackground = Color3.fromHex("#ffffff"),
    SectionBoxBackgroundTransparency = 0.95,
    SearchBarBorder = Color3.fromHex("#ffffff"),
    SearchBarBorderTransparency = 0.75,
    Notification = Color3.fromHex("#0a190a"),
    NotificationTitle = Color3.fromHex("#dcffdc"),
    NotificationTitleTransparency = 0,
    NotificationContent = Color3.fromHex("#96c896"),
    NotificationContentTransparency = 0.4,
    NotificationDuration = Color3.fromHex("#ffffff"),
    NotificationDurationTransparency = 0.95,
    NotificationBorder = Color3.fromHex("#ffffff"),
    NotificationBorderTransparency = 0.75,
    DropdownTabBorder = Color3.fromHex("#ffffff"),
    LabelBackground = Color3.fromHex("#ffffff"),
    LabelBackgroundTransparency = 0.95,
}

pcall(function()
    if WindUI.AddTheme then WindUI:AddTheme(QuantumGreenTheme) end
    if WindUI.SetTheme then WindUI:SetTheme("QuantumGreen") end
end)

-- ========== CUSTOM QUANTUM BLUE THEME ==========
local QuantumBlueTheme = {
    Name = "QuantumBlue",
    Accent = Color3.fromHex("#00d4ff"),
    Background = Color3.fromHex("#0a0f1a"),
    Background2 = Color3.fromHex("#0f1724"),
    Text = Color3.fromHex("#dcefff"),
    Text2 = Color3.fromHex("#96c8e8"),
    Element = Color3.fromHex("#141e2d"),
    Border = Color3.fromHex("#2d6a8a"),
    Theme = Color3.fromHex("#00d4ff"),
    Scrollbar = Color3.fromHex("#00d4ff"),
    Topbar = Color3.fromHex("#0f1a28"),
    Title = Color3.fromHex("#00d4ff"),
    Dialog = Color3.fromHex("#0a0f1a"),
    Outline = Color3.fromHex("#00d4ff"),
    Placeholder = Color3.fromHex("#5a8aaa"),
    Button = Color3.fromHex("#1e2d3d"),
    Icon = Color3.fromHex("#00d4ff"),
    WindowBackground = Color3.fromHex("#0a0f1a"),
    WindowShadow = Color3.fromHex("#000000"),
    WindowTopbarTitle = Color3.fromHex("#dcefff"),
    WindowTopbarAuthor = Color3.fromHex("#96c8e8"),
    WindowTopbarIcon = Color3.fromHex("#00d4ff"),
    WindowTopbarButtonIcon = Color3.fromHex("#00d4ff"),
    WindowSearchBarBackground = Color3.fromHex("#0f1724"),
    TabBackground = Color3.fromHex("#141824"),
    TabBackgroundHover = Color3.fromHex("#1a2232"),
    TabBackgroundHoverTransparency = 0.97,
    TabBackgroundActive = Color3.fromHex("#1e2d3d"),
    TabBackgroundActiveTransparency = 0.93,
    TabText = Color3.fromHex("#dcefff"),
    TabTextTransparency = 0.3,
    TabTextTransparencyActive = 0,
    TabTitle = Color3.fromHex("#dcefff"),
    TabIcon = Color3.fromHex("#00d4ff"),
    TabIconTransparency = 0.4,
    TabIconTransparencyActive = 0.1,
    TabBorderTransparency = 1,
    TabBorderTransparencyActive = 0.75,
    TabBorder = Color3.fromHex("#ffffff"),
    ElementBackground = Color3.fromHex("#141824"),
    ElementBackgroundTransparency = 0.93,
    ElementTitle = Color3.fromHex("#dcefff"),
    ElementDesc = Color3.fromHex("#96c8e8"),
    ElementIcon = Color3.fromHex("#00d4ff"),
    PopupBackground = Color3.fromHex("#0a0f1a"),
    PopupBackgroundTransparency = 0.05,
    PopupTitle = Color3.fromHex("#dcefff"),
    PopupContent = Color3.fromHex("#96c8e8"),
    PopupIcon = Color3.fromHex("#00d4ff"),
    DialogBackground = Color3.fromHex("#0a0f1a"),
    DialogBackgroundTransparency = 0.05,
    DialogTitle = Color3.fromHex("#dcefff"),
    DialogContent = Color3.fromHex("#96c8e8"),
    DialogIcon = Color3.fromHex("#00d4ff"),
    Toggle = Color3.fromHex("#1e2d3d"),
    ToggleBar = Color3.fromHex("#ffffff"),
    Checkbox = Color3.fromHex("#00d4ff"),
    CheckboxIcon = Color3.fromHex("#ffffff"),
    CheckboxBorder = Color3.fromHex("#ffffff"),
    CheckboxBorderTransparency = 0.75,
    SliderIcon = Color3.fromHex("#00d4ff"),
    Slider = Color3.fromHex("#00d4ff"),
    SliderThumb = Color3.fromHex("#ffffff"),
    SliderIconFrom = Color3.fromHex("#00d4ff"),
    SliderIconTo = Color3.fromHex("#00d4ff"),
    Tooltip = Color3.fromHex("#2d5a7a"),
    TooltipText = Color3.fromHex("#dcefff"),
    TooltipSecondary = Color3.fromHex("#00d4ff"),
    TooltipSecondaryText = Color3.fromHex("#ffffff"),
    TabSectionIcon = Color3.fromHex("#00d4ff"),
    SectionIcon = Color3.fromHex("#00d4ff"),
    SectionExpandIcon = Color3.fromHex("#ffffff"),
    SectionExpandIconTransparency = 0.4,
    SectionBox = Color3.fromHex("#ffffff"),
    SectionBoxTransparency = 0.95,
    SectionBoxBorder = Color3.fromHex("#ffffff"),
    SectionBoxBorderTransparency = 0.75,
    SectionBoxBackground = Color3.fromHex("#ffffff"),
    SectionBoxBackgroundTransparency = 0.95,
    SearchBarBorder = Color3.fromHex("#ffffff"),
    SearchBarBorderTransparency = 0.75,
    Notification = Color3.fromHex("#0a0f1a"),
    NotificationTitle = Color3.fromHex("#dcefff"),
    NotificationTitleTransparency = 0,
    NotificationContent = Color3.fromHex("#96c8e8"),
    NotificationContentTransparency = 0.4,
    NotificationDuration = Color3.fromHex("#ffffff"),
    NotificationDurationTransparency = 0.95,
    NotificationBorder = Color3.fromHex("#ffffff"),
    NotificationBorderTransparency = 0.75,
    DropdownTabBorder = Color3.fromHex("#ffffff"),
    LabelBackground = Color3.fromHex("#ffffff"),
    LabelBackgroundTransparency = 0.95,
}

pcall(function()
    if WindUI.AddTheme then WindUI:AddTheme(QuantumBlueTheme) end
end)

local Window = nil
local winOk, winErr = pcall(function()
    Window = WindUI:CreateWindow({
        Title = "Quantum HUB",
        Icon = "rbxassetid://79993547950000",
        Author = "Fish It 8.0 | FREE SCRIPT",
        Folder = "QuantumHUB",
        Size = UDim2.fromOffset(600, 450),
        MinSize = Vector2.new(480, 320),
        MaxSize = Vector2.new(900, 650),
        Resizable = true,
        Acrylic = true,
        Theme = "QuantumGreen",
        Transparent = false,
        ToggleKey = Enum.KeyCode.RightShift,
        Topbar = { Height = 52, ButtonsType = "Default" },
        OpenButton = {
            Enabled = true, Title = "QH", Icon = "atom",
            CornerRadius = UDim.new(1, 0), StrokeThickness = 2,
            Draggable = true, OnlyMobile = false, Scale = 0.6,
            Color = ColorSequence.new(Color3.fromHex("#39ff14"), Color3.fromHex("#00ff88"))
        },
        User = { Enabled = true, Anonymous = false, Callback = function() end }
    })
end)

if not winOk or not Window then
    warn("[QH] Window creation failed: " .. tostring(winErr))
    return
end

pcall(function()
    if Window.SetBackgroundImage then
        Window:SetBackgroundImage("rbxassetid://110198221389250")
        Window:SetBackgroundImageTransparency(0.3)
    end
end)

local function SafeCreate(creationFunc, errorPrefix)
    local ok, result = pcall(creationFunc)
    if not ok then warn("[QH] " .. (errorPrefix or "UI Error") .. ": " .. tostring(result))
        -- Return safe proxy to prevent nil errors
        return setmetatable({}, {__index = function() return function() end end})
    end
    return result
end

-- ========== TABS ==========
local InfoTab      = SafeCreate(function() return Window:Tab({ Title = "Info",       Icon = "info" })          end, "InfoTab")
local PlayersTab   = SafeCreate(function() return Window:Tab({ Title = "Players",    Icon = "user" })          end, "PlayersTab")
local MainTab      = SafeCreate(function() return Window:Tab({ Title = "Automation", Icon = "bot" })           end, "MainTab")
local ExclusiveTab = SafeCreate(function() return Window:Tab({ Title = "QH Fishing", Icon = "fish" })         end, "ExclusiveTab")
local CraftAbilityTab = SafeCreate(function() return Window:Tab({ Title = "Crafting", Icon = "wrench" }) end, "CraftAbilityTab")
local AquariumTab  = SafeCreate(function() return Window:Tab({ Title = "Aquarium",   Icon = "droplets" })     end, "AquariumTab")
local TeleportTab  = SafeCreate(function() return Window:Tab({ Title = "Teleport",   Icon = "map-pin" })      end, "TeleportTab")
local ShopTab      = SafeCreate(function() return Window:Tab({ Title = "Shop",       Icon = "shopping-cart" }) end, "ShopTab")
local EventTab     = SafeCreate(function() return Window:Tab({ Title = "Event",      Icon = "calendar" })     end, "EventTab")
local MiscTab      = SafeCreate(function() return Window:Tab({ Title = "Misc",       Icon = "settings" })     end, "MiscTab")
local TradeTab     = SafeCreate(function() return Window:Tab({ Title = "Trade",      Icon = "repeat" })       end, "TradeTab")
local VisualTab    = SafeCreate(function() return Window:Tab({ Title = "Visual",     Icon = "eye" })         end, "VisualTab")

-- ========== SERVICES ==========
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService        = game:GetService("RunService")
local UserInputService  = game:GetService("UserInputService")
local HttpService       = game:GetService("HttpService")
local Stats             = game:GetService("Stats")
local Lighting          = game:GetService("Lighting")
local Workspace         = game:GetService("Workspace")
local CoreGui           = game:GetService("CoreGui")
local LocalPlayer       = Players.LocalPlayer
local isMobile          = UserInputService.TouchEnabled

local function NotifySuccess(title, text)
    pcall(function() if WindUI and WindUI.Notify then WindUI:Notify({ Title = "[OK] "   .. title, Content = text, Duration = 3, Icon = "check" }) end end)
end
local function NotifyWarning(title, text)
    pcall(function() if WindUI and WindUI.Notify then WindUI:Notify({ Title = "[WARN] " .. title, Content = text, Duration = 3, Icon = "alert-triangle" }) end end)
end
local function NotifyError(title, text)
    pcall(function() if WindUI and WindUI.Notify then WindUI:Notify({ Title = "[ERR] "  .. title, Content = text, Duration = 3, Icon = "x" }) end end)
end
local function NotifyInfo(title, text)
    pcall(function() if WindUI and WindUI.Notify then WindUI:Notify({ Title = "[INFO] " .. title, Content = text, Duration = 3, Icon = "info" }) end end)
end

local cloneref = (cloneref or clonereference or function(i) return i end)
local net
pcall(function()
    net = ReplicatedStorage:WaitForChild("Packages", 10)
        :WaitForChild("_Index", 10)
        :WaitForChild("sleitnick_net@0.2.0", 10)
        :WaitForChild("net", 10)
end)
if net then pcall(function() print("[QH] Remotes: " .. #net:GetChildren()) end) end

local function GetServerRemote(targetName)
    if not net then return nil end
    local allRemotes = net:GetChildren()
    for i, remote in ipairs(allRemotes) do
        if remote.Name == targetName then
            if allRemotes[i + 1] then return allRemotes[i + 1] end
        end
    end
    return nil
end

local function GetServerRemoteReverse(targetName)
    if not net then return nil end
    local allRemotes = net:GetChildren()
    for i, remote in ipairs(allRemotes) do
        if remote.Name == targetName then
            if allRemotes[i - 1] then return allRemotes[i - 1] end
        end
    end
    return nil
end

local function CallRemote(remote, ...)
    if not remote then return false end
    local ok = false
    if remote:IsA("RemoteFunction") then
        ok = pcall(function(...) remote:InvokeServer(...) end, ...)
    elseif remote:IsA("RemoteEvent") then
        ok = pcall(function(...) remote:FireServer(...) end, ...)
    end
    return ok
end

-- ========== PING MONITOR ==========
local PingMonitor = {History={}, MaxSamples=10, CurrentPing=50, AveragePing=50, Jitter=0, LastSample=tick()}
function PingMonitor:GetPing()
    local networkStats = Stats:FindFirstChild("Network")
    if networkStats and networkStats:FindFirstChild("ServerStatsItem") then
        local pingData = networkStats.ServerStatsItem:FindFirstChild("Data Ping")
        if pingData then local val = pingData:GetValue(); if val then return math.floor(val) end end
    end
    return 50
end
function PingMonitor:Update()
    local now = tick()
    if now - self.LastSample < 0.5 then return end
    self.LastSample = now
    local currentPing = self:GetPing()
    self.CurrentPing = currentPing
    table.insert(self.History, currentPing)
    if #self.History > self.MaxSamples then table.remove(self.History, 1) end
    local total, minP, maxP = 0, math.huge, 0
    for _, p in ipairs(self.History) do
        total = total + p
        if p < minP then minP = p end
        if p > maxP then maxP = p end
    end
    self.AveragePing = math.floor(total / #self.History)
    self.Jitter = maxP - minP
end
function PingMonitor:IsStable() return self.Jitter < 30 and self.AveragePing < 150 end

-- ========== PLAYER DATA ==========
local Replion, PlayerData, ItemUtility, TierUtility
local Controllers = {}
pcall(function()
    Replion = require(ReplicatedStorage.Packages.Replion)
    PlayerData = Replion.Client:WaitReplion("Data")
    ItemUtility = require(ReplicatedStorage.Shared.ItemUtility)
    TierUtility = require(ReplicatedStorage:WaitForChild("Shared", 5):WaitForChild("TierUtility", 5))
end)

if isMobile then
    pcall(function()
        local ctrl = ReplicatedStorage:WaitForChild("Controllers", 5)
        if ctrl then
            local notifCtrl = ctrl:FindFirstChild("NotificationController")
            if notifCtrl then Controllers.Notification = require(notifCtrl) end
            local vfxCtrl = ctrl:FindFirstChild("VFXController")
            if vfxCtrl then Controllers.VFX = require(vfxCtrl) end
            local cutCtrl = ctrl:FindFirstChild("CutsceneController")
            if cutCtrl then Controllers.Cutscene = require(cutCtrl) end
            local fishCtrl = ctrl:FindFirstChild("FishingController")
            if fishCtrl then Controllers.Fishing = require(fishCtrl) end
            local backCtrl = ctrl:FindFirstChild("BackpackController")
            if backCtrl then Controllers.Backpack = require(backCtrl) end
        end
    end)
end

local origPlaySmallItemObtained
pcall(function()
    if isMobile and Controllers.Notification and Controllers.Notification.PlaySmallItemObtained then
        origPlaySmallItemObtained = Controllers.Notification.PlaySmallItemObtained
    end
end)

-- ========== LOAD REMOTES (FIXED + BARU) ==========
local Events = {}
local function loadRemotes()
    local loaded, failed = 0, 0
    local remoteList = {
        -- === FISHING CORE ===
        {key="equip",                   name="RF/EquipToolFromHotbar"},
        {key="unequip",                 name="RE/UnequipToolFromHotbar"},
        {key="equipItem",               name="RE/EquipItem"},
        {key="CancelFishing",           name="RF/CancelFishingInputs"},
        {key="charge",                  name="RF/ChargeFishingRod"},
        {key="minigame",                name="RF/RequestFishingMinigameStarted"},
        {key="UpdateAutoFishing",       name="RF/UpdateAutoFishingState"},
        {key="fishing",                 name="RF/CatchFishCompleted"},
        {key="fishingRE",               name="RE/CatchFishCompleted"},
        {key="exclaimEvent",            name="RE/ReplicateTextEffect"},
        {key="sell",                    name="RF/SellAllItems"},
        {key="SellItem",                name="RF/SellItem"},
        {key="favorite",                name="RE/FavoriteItem"},
        -- === TOTEM & NOTIF ===
        {key="SpawnTotem",              name="RE/SpawnTotem"},
        {key="TextNotification",        name="RE/TextNotification"},
        {key="fishNotif",               name="RE/ObtainedNewFishNotification"},
        {key="systemMessage",           name="RE/DisplaySystemMessage"},
        -- === ENCHANT ===
        {key="activateAltar",           name="RE/ActivateEnchantingAltar"},
        -- === CAVE & EVENTS ===
        {key="searchItemPickedUp",      name="RF/SearchItemPickedUp"},
        {key="gainAccessToMaze",        name="RE/GainAccessToMaze"},
        {key="claimPirateChest",        name="RE/ClaimPirateChest"},
        -- === WEATHER & CRYSTAL ===
        {key="BuyWeather",              name="RF/PurchaseWeatherEvent"},
        {key="ConsumeCaveCrystal",      name="RF/ConsumeCaveCrystal"},
        -- === ATLANTIS (FIX) ===
        {key="SacrificeAtlantisFish",   name="RF/SacrificeAtlantisFish"},
        {key="SacrificeAtlantisSellAll",name="RF/SacrificeAtlantisSellAll"},
        -- === CLASSIC MACHINE ===
        {key="ClassicMachineActivate",  name="RF/ClassicMachineActivate"},
        -- === MISC REMOTES ===
        {key="ConsumePotion",           name="RF/ConsumePotion"},
        {key="ClaimDailyLogin",         name="RF/ClaimDailyLogin"},
        {key="RedeemCode",              name="RF/RedeemCode"},
        {key="ClaimBounty",             name="RF/ClaimBounty"},
        {key="RequestSpin",             name="RF/RequestSpin"},
        {key="ServerHop",               name="RE/ServerHop"},
        {key="ReconnectPlayer",         name="RE/ReconnectPlayer"},
        {key="TradePlazaTeleport",      name="RE/TradePlazaTeleport"},
        {key="UpdateAutoSellThreshold", name="RF/UpdateAutoSellThreshold"},
        {key="UpdateFishingRadar",      name="RF/UpdateFishingRadar"},
        -- === CRAFTING (BARU) ===
        {key="StartCrafting",           name="RF/StartCrafting"},
        {key="ConfirmCrafting",         name="RF/ConfirmCrafting"},
        {key="CancelCrafting",          name="RF/CancelCrafting"},
        {key="InstantCraft",            name="RE/InstantCraft"},
        {key="GetDrops",                name="RF/GetDrops"},
        {key="RenderDrop",              name="RE/RenderDrop"},
        {key="DestroyDrop",             name="RE/DestroyDrop"},
        {key="DestroyAllDrops",         name="RE/DestroyAllDrops"},
        -- === AQUARIUM (BARU) ===
        {key="AquariumGetState",        name="RF/AquariumGetState"},
        {key="AquariumGetDirectory",    name="RF/AquariumGetDirectory"},
        {key="AquariumSetPublic",       name="RF/AquariumSetPublic"},
        {key="AquariumLike",            name="RF/AquariumLike"},
        {key="AquariumUnlockZone",      name="RF/AquariumUnlockZone"},
        {key="AquariumUnlockTank",      name="RF/AquariumUnlockTank"},
        {key="AquariumSetTankFish",     name="RF/AquariumSetTankFish"},
        {key="AquariumRemoveTankFish",  name="RF/AquariumRemoveTankFish"},
        {key="AquariumStateUpdated",    name="RE/AquariumStateUpdated"},
        -- === PETS & EGGS (NO MACHINE) ===
        {key="PetEquip",              name="RF/Pets/Equip"},
        {key="PetUnequip",            name="RF/Pets/Unequip"},
        {key="PetRename",             name="RF/Pets/Rename"},
        {key="OpenEgg",               name="RF/Pets/OpenEgg"},
        {key="StartEgg",              name="RF/Pets/StartEgg"},
        {key="OpenReadyEgg",          name="RF/Pets/OpenReadyEgg"},
        {key="InstantHatch",          name="RF/Pets/InstantHatch"},
        {key="PurchaseEgg",           name="RF/Pets/PurchaseEgg"},
        -- === PERCENTILE REWARD (BARU) ===
        {key="ClaimPercentileReward",   name="RF/ClaimPercentileReward"},
        -- === EGG MACHINE ===
        {key="ExchangeEggMachine",      name="RF/ExchangeEggMachine"},
        {key="ActivateEggMachineEgg",   name="RF/ActivateEggMachineEgg"},
        -- === PLAYER DATA ===
        {key="GetPlayerData",           name="RF/GetPlayerData"},
        -- === MEGALODON QUEST ===
        {key="ClaimMegalodonQuest",     name="RF/RF_ClaimMegalodonQuest"},
    }
    for _, r in ipairs(remoteList) do
        local remote = GetServerRemote(r.name)
        Events[r.key] = remote
        if remote then loaded = loaded + 1
        else failed = failed + 1; warn("[QH] Remote gagal: " .. r.name) end
    end
    print("[QH] Loaded: " .. loaded .. " | Failed: " .. failed)
    return loaded, failed
end
local loadedCount, failedCount = loadRemotes()

-- ========== CONFIG ==========
local Config = {
    AutoCatch = false, CatchDelay = 0.7,
    UB = {Active = false, Settings = {CompleteDelay = 0.05, CancelDelay = 0.5}, Remotes = {}, Stats = {castCount = 0, startTime = 0.0}},
    amblatant = true, antiOKOK = true, autoFishing = true,
    AutoSellState = false, AutoSellMethod = "Delay", AutoSellValue = 50,
    AutoFavoriteState = false, AutoUnfavoriteState = false,
    SelectedRarities = {}, SelectedMutations = {},
    AutoTotem = false, SelectedTotemID = 0,
    CustomWebhook = false, CustomWebhookUrl = "",
    DisableAnimations = false, HookNotif = false,
    DisableObtained = false, DisablePopUp = false,
    WalkOnWater = false, HideNametag = false,
    SelectedEmote = "",
    AutoEvent = false, NotifDelay = 0.1,
    NotifCount = 1, UBNotifDurationMult = 2.0,
    CatchQuality = "Perfect",

    AutoSpin = false,
    AutoConsumePotion = false,
    AutoClaimBounty = false,
    FishingRadar = false,
    -- === BARU ===
    AutoCrafting = false,
    InstantCraftEnabled = false,
    -- Crafting config
    SelectedCraftRecipe = nil,
    CraftingDelay = 1.5,
    -- Ability config
    DropCollectRadius = 50,
    -- Aquarium config
    AquariumAutoFill = false,
    AquariumAutoPublic = false,
    autoForgotten = false,
    autoSecret = false,
}

local Tasks = {}
local needCast = true
local skip = false
local isCaught = false
local lastTimeFishCaught = nil
local blatantFishCycleCount = 1
local saveCount = 0
local lastValidFishCaught = {}
local lastValidCaughtVisual = {}
local lastValidFishNotif = {}
local _hookedRemotes = {}
local _catchHistory = {}
local _lastCatchTimestamps = {}
local _sessionCatchCount = 0
local _sessionStartTime = tick()
local rainbowCount = 0
local goldenCount = 0
local fishCount = 0
local _visualFired = false -- Guard flag untuk prevent duplikasi visual

-- ========== REPLION HOOK (DISABLED FOR PURE BLATANT) ==========
-- Hook ini ga perlu lagi karena rainbow/golden di-manage langsung di ub_loop
-- Tapi tetep di-keep buat backward compatibility
pcall(function()
    local replionFolder = ReplicatedStorage:FindFirstChild("Packages")
    if not replionFolder then return end
    local idx = replionFolder:FindFirstChild("_Index")
    if not idx then return end
    local replionMod
    for _, child in ipairs(idx:GetChildren()) do
        if child.Name:find("ytrev_replion") then
            replionMod = child:FindFirstChild("replion"); break
        end
    end
    if not replionMod then return end
    local remotes = replionMod:FindFirstChild("Remotes")
    if not remotes then return end
    local Event = remotes:FindFirstChild("Set")
    if not Event then return end
    if typeof(getconnections) ~= "function" then return end
    
    local connections = {}
    pcall(function() connections = getconnections(Event.OnClientEvent) end)
    for _, Connection in ipairs(connections) do
        if Connection and Connection.Function then
            local oldFunc = Connection.Function
            local originalFunc = nil
            local newFunc = function(...)
                local Args = {...}
                -- Cukup log, ga modify apa-apa (biarin original jalan)
                if type(Args[2]) == "table" then
                    local category = Args[2][1]
                    local subCategory = Args[2][2]
                    if category == "Modifiers" and subCategory == "Rainbow" then
                        -- Sync dengan global count
                        rainbowCount = Args[3] or rainbowCount
                    elseif category == "Modifiers" and subCategory == "Golden" then
                        goldenCount = Args[3] or goldenCount
                    end
                end
                if originalFunc then
                    return originalFunc(...)
                end
            end
            pcall(function() originalFunc = hookfunction(oldFunc, newFunc) end)
        end
    end
end)

_G.SavedData = _G.SavedData or {FishCaught = {}, CaughtVisual = {}, FishNotif = {}}
_G.NotifQueue = _G.NotifQueue or {}
_G.NotifActive = _G.NotifActive or 0

-- ============================================
-- ANTI-STACK NOTIF HOOK (BARU)
-- ============================================
pcall(function()
    local notifController = ReplicatedStorage:FindFirstChild("Controllers") 
        and ReplicatedStorage.Controllers:FindFirstChild("NotificationController")
    if notifController then
        local notifModule = require(notifController)
        if notifModule and notifModule.DisplayNotification then
            local oldDisplay = notifModule.DisplayNotification
            notifModule.DisplayNotification = function(self, data, ...)
                if data then
                    data.StackKey = data.StackKey or HttpService:GenerateGUID(false)
                    data.PreventMerge = true
                    data.UniqueId = tick() .. math.random()
                end
                return oldDisplay(self, data, ...)
            end
        end
    end
end)

-- ============================================
-- ANTI-STACK FISH GENERATOR (BARU)
-- ============================================
local _notifUUIDCounter = 0

local function generateUniqueFish()
    _notifUUIDCounter = _notifUUIDCounter + 1
    
    local realFishList = {}
    pcall(function()
        if ItemUtility and ItemUtility.GetItemData then
            for id = 1, 500 do
                local data = ItemUtility:GetItemData(id)
                if data and data.Data and data.Data.Type and string.lower(tostring(data.Data.Type)) == "fish" then
                    table.insert(realFishList, {
                        Id = id,
                        Name = data.Data.Name or ("Fish_" .. id),
                        Rarity = data.Data.Rarity or "COMMON",
                        WeightMin = data.Data.MinWeight or 0.1,
                        WeightMax = data.Data.MaxWeight or 100
                    })
                end
            end
        end
    end)

    local fakeFishId, fakeFishName, fakeRarity, fakeWeight
    if #realFishList > 0 then
        local attempts = 0
        repeat
            local randomIdx = math.random(1, #realFishList)
            fakeFishId = realFishList[randomIdx].Id
            fakeFishName = realFishList[randomIdx].Name
            fakeRarity = realFishList[randomIdx].Rarity
            local wMin = realFishList[randomIdx].WeightMin
            local wMax = realFishList[randomIdx].WeightMax
            fakeWeight = wMin + (math.random() * (wMax - wMin))
            attempts = attempts + 1
        until fakeFishId ~= (_G.LastFishId or 0) or attempts > 10
        _G.LastFishId = fakeFishId
    else
        fakeFishId = math.random(1, 500)
        fakeFishName = "Mysterious Fish " .. fakeFishId
        fakeRarity = "COMMON"
        local rarityRoll = math.random(1, 100)
        if rarityRoll > 98 then fakeRarity = "SECRET"
        elseif rarityRoll > 90 then fakeRarity = "Mythic"
        elseif rarityRoll > 75 then fakeRarity = "Legendary"
        elseif rarityRoll > 55 then fakeRarity = "Epic"
        elseif rarityRoll > 35 then fakeRarity = "Rare"
        elseif rarityRoll > 15 then fakeRarity = "Uncommon" end
        fakeWeight = math.random(10, 5000) / 100
        while fakeFishId == (_G.LastFishId or 0) do
            fakeFishId = math.random(1, 500)
        end
        _G.LastFishId = fakeFishId
    end

    local isShiny = math.random(1, 100) <= 5
    local mutations = {"Galaxy", "Corrupt", "Gemstone", "Fairy Dust", "Midnight", "Color Burn", "Holographic", "Lightning", "Radioactive", "Ghost", "Gold", "Frozen"}
    local hasMutation = math.random(1, 100) <= 10
    local mutationType = hasMutation and mutations[math.random(1, #mutations)] or nil

    local uniqueUUID = HttpService:GenerateGUID(false) .. "-" .. tostring(_notifUUIDCounter) .. "-" .. tostring(tick())
    
    local fakeMetadata = {
        Weight = fakeWeight,
        Rarity = fakeRarity,
        Shiny = isShiny,
        VariantId = mutationType,
        CaughtTime = os.time() - math.random(0, 3600),
        CatchSequence = _notifUUIDCounter,
        SessionId = tostring(_sessionStartTime)
    }

    return {
        Id = fakeFishId,
        Name = fakeFishName,
        Rarity = fakeRarity,
        Weight = fakeWeight,
        Shiny = isShiny,
        Mutation = mutationType,
        UUID = uniqueUUID,
        Metadata = fakeMetadata
    }
end

-- ========== FREE CAM SYSTEM ==========
local FreeCam = {}
do
    local Camera = workspace.CurrentCamera
    local isActive = false
    local renderConn = nil
    local onMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    local cameraPos = Vector3.new()
    local cameraRot = Vector2.new()
    local cameraFov = 70
    local rotating = false
    local touchMoveStart, touchRotStart, touchMoveFinger, touchRotFinger = nil, nil, nil, nil
    _G.FreeCamSpeed = _G.FreeCamSpeed or 5
    local VEL_STIFFNESS, PAN_STIFFNESS, FOV_STIFFNESS = 1.5, 1.0, 4.0
    local NAV_GAIN = Vector3.new(1, 1, 1) * 64
    local PAN_GAIN = Vector2.new(0.75, 1) * 8
    local FOV_GAIN = 300
    local PITCH_LIMIT = math.rad(90)

    local Spring = {}
    Spring.__index = Spring
    function Spring.new(freq, pos)
        local self = setmetatable({}, Spring)
        self.f = freq; self.p = pos; self.v = pos * 0
        return self
    end
    function Spring:Update(dt, goal)
        local f = self.f * 2 * math.pi
        local p0, v0 = self.p, self.v
        local offset = goal - p0
        local decay = math.exp(-f * dt)
        local p1 = goal + (v0 * dt - offset * (f * dt + 1)) * decay
        local v1 = (f * dt * (offset * f - v0) + v0) * decay
        self.p = p1; self.v = v1
        return p1
    end
    function Spring:Reset(pos) self.p = pos; self.v = pos * 0 end

    local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
    local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
    local fovSpring = Spring.new(FOV_STIFFNESS, 0)

    local savedCameraType, savedCameraCFrame, savedCameraFov = nil, nil, nil
    local savedMouseBehavior, savedMouseIcon, savedSubject = nil, nil, nil
    local savedWalkSpeed, savedJumpPower, savedAutoRotate, savedPlatformStand = nil, nil, nil, nil
    local inputBeganConn, inputEndedConn, inputChangedConn = nil, nil, nil

    local function thumbstickCurve(x)
        local K_CURVATURE, K_DEADZONE = 2.0, 0.15
        local function fCurve(v) return (math.exp(K_CURVATURE * v) - 1) / (math.exp(K_CURVATURE) - 1) end
        local function fDeadzone(v) return fCurve((v - K_DEADZONE) / (1 - K_DEADZONE)) end
        return math.sign(x) * math.clamp(fDeadzone(math.abs(x)), 0, 1)
    end

    local Input = {}
    Input.keyboard = {W=0,A=0,S=0,D=0,E=0,Q=0,U=0,H=0,J=0,K=0,I=0,Y=0,Up=0,Down=0,LeftShift=0,RightShift=0}
    Input.gamepad = {ButtonX=0,ButtonY=0,DPadDown=0,DPadUp=0,ButtonL2=0,ButtonR2=0,Thumbstick1=Vector2.new(),Thumbstick2=Vector2.new()}
    Input.mouse = {Delta=Vector2.new(), MouseWheel=0}

    function Input.Vel(dt)
        local navSpeed = math.clamp(_G.FreeCamSpeed / 5, 0.01, 4)
        local kGamepad = Vector3.new(thumbstickCurve(Input.gamepad.Thumbstick1.X), thumbstickCurve(Input.gamepad.ButtonR2) - thumbstickCurve(Input.gamepad.ButtonL2), thumbstickCurve(-Input.gamepad.Thumbstick1.Y))
        local kKeyboard = Vector3.new(Input.keyboard.D-Input.keyboard.A+Input.keyboard.K-Input.keyboard.H, Input.keyboard.E-Input.keyboard.Q+Input.keyboard.I-Input.keyboard.Y, Input.keyboard.S-Input.keyboard.W+Input.keyboard.J-Input.keyboard.U)
        local shift = Input.keyboard.LeftShift > 0 or Input.keyboard.RightShift > 0
        return (kGamepad + kKeyboard) * (navSpeed * (shift and 0.25 or 1))
    end
    function Input.Pan(dt)
        local kGamepad = Vector2.new(thumbstickCurve(Input.gamepad.Thumbstick2.Y), thumbstickCurve(-Input.gamepad.Thumbstick2.X)) * (math.pi / 8)
        local kMouse = Input.mouse.Delta * Vector2.new(1, 1) * (math.pi / 64)
        Input.mouse.Delta = Vector2.new()
        return kGamepad + kMouse
    end
    function Input.Fov(dt)
        local kGamepad = (Input.gamepad.ButtonX - Input.gamepad.ButtonY) * 0.25
        local kMouse = Input.mouse.MouseWheel * 1.0
        Input.mouse.MouseWheel = 0
        return kGamepad + kMouse
    end
    function Input.Zero(t)
        for k, v in pairs(t) do
            if typeof(v) == "Vector2" then t[k] = Vector2.new()
            elseif typeof(v) == "Vector3" then t[k] = Vector3.new()
            else t[k] = v * 0 end
        end
    end

    local TOUCH_MOVE_ZONE = 0.4
    local function getTouchZone(pos) return pos.X < Camera.ViewportSize.X * TOUCH_MOVE_ZONE and "move" or "rotate" end
    local function handleMobileTouchBegan(input)
        local zone = getTouchZone(input.Position)
        if zone == "move" and not touchMoveFinger then touchMoveFinger = input; touchMoveStart = input.Position
        elseif zone == "rotate" and not touchRotFinger then touchRotFinger = input; touchRotStart = input.Position; rotating = true end
    end
    local function handleMobileTouchEnded(input)
        if touchMoveFinger and touchMoveFinger == input then
            touchMoveFinger = nil; touchMoveStart = nil
            Input.keyboard.W = 0; Input.keyboard.A = 0; Input.keyboard.S = 0; Input.keyboard.D = 0
        end
        if touchRotFinger and touchRotFinger == input then touchRotFinger = nil; touchRotStart = nil; rotating = false end
    end
    local function handleMobileTouchMoved(input)
        if touchMoveFinger and touchMoveFinger == input and touchMoveStart then
            local delta = input.Position - touchMoveStart
            local threshold = 5
            if math.abs(delta.X) > threshold then if delta.X < 0 then Input.keyboard.A = 1; Input.keyboard.D = 0 else Input.keyboard.A = 0; Input.keyboard.D = 1 end else Input.keyboard.A = 0; Input.keyboard.D = 0 end
            if math.abs(delta.Y) > threshold then if delta.Y < 0 then Input.keyboard.W = 1; Input.keyboard.S = 0 else Input.keyboard.W = 0; Input.keyboard.S = 1 end else Input.keyboard.W = 0; Input.keyboard.S = 0 end
        end
        if touchRotFinger and touchRotFinger == input and touchRotStart then
            local delta = input.Position - touchRotStart
            Input.mouse.Delta = Vector2.new(-delta.Y, -delta.X) * 0.8
            touchRotStart = input.Position
        end
    end

    local function onInputBegan(input, gameProcessed)
        if gameProcessed then return end
        local keyName = input.KeyCode.Name
        if Input.keyboard[keyName] ~= nil then Input.keyboard[keyName] = 1 end
        if input.UserInputType == Enum.UserInputType.MouseButton2 then rotating = true end
        if input.UserInputType == Enum.UserInputType.Touch then handleMobileTouchBegan(input) end
        if input.KeyCode == Enum.KeyCode.ButtonX then Input.gamepad.ButtonX = 1 end
        if input.KeyCode == Enum.KeyCode.ButtonY then Input.gamepad.ButtonY = 1 end
        if input.KeyCode == Enum.KeyCode.ButtonL2 then Input.gamepad.ButtonL2 = 1 end
        if input.KeyCode == Enum.KeyCode.ButtonR2 then Input.gamepad.ButtonR2 = 1 end
    end
    local function onInputEnded(input, gameProcessed)
        local keyName = input.KeyCode.Name
        if Input.keyboard[keyName] ~= nil then Input.keyboard[keyName] = 0 end
        if input.UserInputType == Enum.UserInputType.MouseButton2 then rotating = false end
        if input.UserInputType == Enum.UserInputType.Touch then handleMobileTouchEnded(input) end
        if input.KeyCode == Enum.KeyCode.ButtonX then Input.gamepad.ButtonX = 0 end
        if input.KeyCode == Enum.KeyCode.ButtonY then Input.gamepad.ButtonY = 0 end
        if input.KeyCode == Enum.KeyCode.ButtonL2 then Input.gamepad.ButtonL2 = 0 end
        if input.KeyCode == Enum.KeyCode.ButtonR2 then Input.gamepad.ButtonR2 = 0 end
    end
    local function onInputChanged(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if rotating then Input.mouse.Delta = Vector2.new(-input.Delta.Y, -input.Delta.X) end
        elseif input.UserInputType == Enum.UserInputType.Touch then handleMobileTouchMoved(input)
        elseif input.UserInputType == Enum.UserInputType.Gamepad1 then
            if input.KeyCode == Enum.KeyCode.Thumbstick1 then Input.gamepad.Thumbstick1 = input.Position
            elseif input.KeyCode == Enum.KeyCode.Thumbstick2 then Input.gamepad.Thumbstick2 = input.Position end
        end
    end

    local function GetFocusDistance(cameraFrame)
        local znear = 0.1
        local viewport = Camera.ViewportSize
        local projy = 2 * math.tan(math.rad(cameraFov / 2))
        local projx = viewport.X / viewport.Y * projy
        local fx, fy, fz = cameraFrame.RightVector, cameraFrame.UpVector, cameraFrame.LookVector
        local minVect, minDist = Vector3.new(), 512
        for x = 0, 1, 0.5 do for y = 0, 1, 0.5 do
            local cx, cy = (x - 0.5) * projx, (y - 0.5) * projy
            local offset = fx * cx - fy * cy + fz
            local origin = cameraFrame.Position + offset * znear
            local result = workspace:Raycast(origin, offset.Unit * minDist)
            local dist = result and (result.Position - origin).Magnitude or minDist
            if minDist > dist then minDist = dist; minVect = offset.Unit end
        end end
        return fz:Dot(minVect) * minDist
    end

    local function StepFreecam(dt)
        local vel = velSpring:Update(dt, Input.Vel(dt))
        local pan = panSpring:Update(dt, Input.Pan(dt))
        local fov = fovSpring:Update(dt, Input.Fov(dt))
        local zoomFactor = math.sqrt(math.tan(math.rad(70 / 2)) / math.tan(math.rad(cameraFov / 2)))
        cameraFov = math.clamp(cameraFov + fov * FOV_GAIN * (dt / zoomFactor), 1, 120)
        cameraRot = cameraRot + pan * PAN_GAIN * (dt / zoomFactor)
        cameraRot = Vector2.new(math.clamp(cameraRot.X, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.Y % (2 * math.pi))
        local cameraCFrame = CFrame.new(cameraPos) * CFrame.fromOrientation(cameraRot.X, cameraRot.Y, 0) * CFrame.new(vel * NAV_GAIN * dt)
        cameraPos = cameraCFrame.Position
        Camera.CFrame = cameraCFrame
        Camera.Focus = cameraCFrame * CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
        Camera.FieldOfView = cameraFov
    end

    local function FreezeCharacter()
        local char = LocalPlayer.Character; if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then savedWalkSpeed = hum.WalkSpeed; savedJumpPower = hum.JumpPower; savedAutoRotate = hum.AutoRotate; savedPlatformStand = hum.PlatformStand; hum.WalkSpeed = 0; hum.JumpPower = 0; hum.AutoRotate = false; hum.PlatformStand = true end
        local hrp = char:FindFirstChild("HumanoidRootPart"); if hrp then hrp.Anchored = true end
        for _, part in pairs(char:GetDescendants()) do if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then part.Anchored = true end end
    end
    local function UnfreezeCharacter()
        local char = LocalPlayer.Character; if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = savedWalkSpeed or 16; hum.JumpPower = savedJumpPower or 50; hum.AutoRotate = savedAutoRotate ~= false; hum.PlatformStand = savedPlatformStand or false end
        local hrp = char:FindFirstChild("HumanoidRootPart"); if hrp then hrp.Anchored = false end
        for _, part in pairs(char:GetDescendants()) do if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then part.Anchored = false end end
    end

    function FreeCam.Enable()
        if isActive then return end; isActive = true
        savedCameraType = Camera.CameraType; savedCameraCFrame = Camera.CFrame; savedCameraFov = Camera.FieldOfView
        savedMouseBehavior = UserInputService.MouseBehavior; savedMouseIcon = UserInputService.MouseIconEnabled; savedSubject = Camera.CameraSubject
        Camera.CameraType = Enum.CameraType.Scriptable
        cameraPos = savedCameraCFrame.Position
        cameraRot = Vector2.new(math.asin(savedCameraCFrame.LookVector.Y), math.atan2(-savedCameraCFrame.LookVector.X, -savedCameraCFrame.LookVector.Z))
        cameraFov = savedCameraFov or 70
        velSpring:Reset(Vector3.new()); panSpring:Reset(Vector2.new()); fovSpring:Reset(0)
        if not onMobile then UserInputService.MouseBehavior = Enum.MouseBehavior.Default; UserInputService.MouseIconEnabled = true end
        inputBeganConn = UserInputService.InputBegan:Connect(onInputBegan)
        inputEndedConn = UserInputService.InputEnded:Connect(onInputEnded)
        inputChangedConn = UserInputService.InputChanged:Connect(onInputChanged)
        renderConn = RunService.RenderStepped:Connect(StepFreecam)
        FreezeCharacter()
    end
    function FreeCam.Disable()
        if not isActive then return end; isActive = false
        if renderConn then renderConn:Disconnect(); renderConn = nil end
        if inputBeganConn then inputBeganConn:Disconnect(); inputBeganConn = nil end
        if inputEndedConn then inputEndedConn:Disconnect(); inputEndedConn = nil end
        if inputChangedConn then inputChangedConn:Disconnect(); inputChangedConn = nil end
        Input.Zero(Input.keyboard); Input.Zero(Input.gamepad); Input.Zero(Input.mouse)
        rotating = false; touchMoveFinger = nil; touchRotFinger = nil; touchMoveStart = nil; touchRotStart = nil
        Camera.CameraType = savedCameraType or Enum.CameraType.Custom
        Camera.CFrame = savedCameraCFrame or Camera.CFrame
        Camera.FieldOfView = savedCameraFov or 70
        Camera.CameraSubject = savedSubject or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid"))
        if not onMobile then UserInputService.MouseBehavior = savedMouseBehavior or Enum.MouseBehavior.Default; UserInputService.MouseIconEnabled = savedMouseIcon ~= false end
        UnfreezeCharacter()
    end
    function FreeCam.Toggle() if isActive then FreeCam.Disable() else FreeCam.Enable() end; return isActive end
    function FreeCam.IsActive() return isActive end
    function FreeCam.SetSpeed(speed) _G.FreeCamSpeed = math.clamp(speed, 1, 20) end

    -- ========== CHARACTER MOVEMENT MODE ==========
    local charModeActive = false
    local charModeConn = nil
    local charModeSubject = nil

    local function StepCharacterMode(dt)
        local pan = panSpring:Update(dt, Input.Pan(dt))
        local fov = fovSpring:Update(dt, Input.Fov(dt))
        local zoomFactor = math.sqrt(math.tan(math.rad(70 / 2)) / math.tan(math.rad(cameraFov / 2)))
        cameraFov = math.clamp(cameraFov + fov * FOV_GAIN * (dt / zoomFactor), 1, 120)
        cameraRot = cameraRot + pan * PAN_GAIN * (dt / zoomFactor)
        cameraRot = Vector2.new(math.clamp(cameraRot.X, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.Y % (2 * math.pi))
        -- Kamera tetap diam, hanya pan dan zoom saja
        Camera.CFrame = CFrame.new(cameraPos) * CFrame.fromOrientation(cameraRot.X, cameraRot.Y, 0)
        Camera.Focus = Camera.CFrame * CFrame.new(0, 0, -GetFocusDistance(Camera.CFrame))
        Camera.FieldOfView = cameraFov
        -- Character bisa berjalan normal
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.PlatformStand = false
            end
        end
    end

    function FreeCam.EnableCharacterMode()
        if isActive then FreeCam.Disable() end
        charModeActive = true
        savedCameraType = Camera.CameraType; savedCameraCFrame = Camera.CFrame; savedCameraFov = Camera.FieldOfView
        savedMouseBehavior = UserInputService.MouseBehavior; savedMouseIcon = UserInputService.MouseIconEnabled; savedSubject = Camera.CameraSubject
        Camera.CameraType = Enum.CameraType.Scriptable
        cameraPos = savedCameraCFrame.Position
        cameraRot = Vector2.new(math.asin(savedCameraCFrame.LookVector.Y), math.atan2(-savedCameraCFrame.LookVector.X, -savedCameraCFrame.LookVector.Z))
        cameraFov = savedCameraFov or 70
        velSpring:Reset(Vector3.new()); panSpring:Reset(Vector2.new()); fovSpring:Reset(0)
        if not onMobile then UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter; UserInputService.MouseIconEnabled = false end
        inputBeganConn = UserInputService.InputBegan:Connect(onInputBegan)
        inputEndedConn = UserInputService.InputEnded:Connect(onInputEnded)
        inputChangedConn = UserInputService.InputChanged:Connect(onInputChanged)
        -- Unfreeze character so it can move
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = 0; hum.JumpPower = 0; hum.AutoRotate = false; hum.PlatformStand = false end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Anchored = false end
        end
        renderConn = RunService.RenderStepped:Connect(StepCharacterMode)
        isActive = true
    end

    function FreeCam.DisableCharacterMode()
        charModeActive = false
        FreeCam.Disable()
    end
end
_G.FreeCam = FreeCam

local function getHRP()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart")
end

local function equipRod()
    task.wait(0.1)
    pcall(function() if Events.equip then CallRemote(Events.equip, 1) end end)
    task.wait(0.1)
    if Config.autoFishing or Config.AutoCatch then
        pcall(function() if Events.UpdateAutoFishing then CallRemote(Events.UpdateAutoFishing, true) end end)
    end
end

local function safeFire(func)
    task.spawn(function()
        local ok, err = pcall(func)
        if not ok then warn("[QH] safeFire error: " .. tostring(err)) end
    end)
end

local function FireLocalEvent(remote, ...)
    if not remote then return end
    local args = {...}
    pcall(function()
        local signal = remote.OnClientEvent
        if not signal then return end
        local conns = {}
        pcall(function() conns = getconnections(signal) end)
        for _, connection in ipairs(conns) do
            if connection and connection.Function then
                task.spawn(function() pcall(function() connection.Function(unpack(args)) end) end)
            end
        end
    end)
end

local function HookRemote(humanName, storageKey)
    if _hookedRemotes[humanName] then return true end
    local remote = GetServerRemote(humanName)
    if remote then
        _hookedRemotes[humanName] = true
        pcall(function()
            remote.OnClientEvent:Connect(function(...)
                _G.SavedData[storageKey] = {...}
                local args = {...}
                if storageKey == "FishCaught" and tostring(args[1]) == tostring(LocalPlayer.Name) then
                    saveCount = saveCount + 1
                    _sessionCatchCount = _sessionCatchCount + 1
                    table.insert(_lastCatchTimestamps, tick())
                    if #_lastCatchTimestamps > 60 then table.remove(_lastCatchTimestamps, 1) end
                end
            end)
        end)
        return true
    end
    return false
end

task.spawn(function()
    task.wait(1)
    pcall(function()
        HookRemote("RE/FishCaught", "FishCaught")
        HookRemote("RE/CaughtFishVisual", "CaughtVisual")
        HookRemote("RE/ObtainedNewFishNotification", "FishNotif")
    end)
end)

local function CalculateCPM()
    local now = tick()
    local recentCatches = 0
    for _, timestamp in ipairs(_lastCatchTimestamps) do
        if now - timestamp < 60 then recentCatches = recentCatches + 1 end
    end
    return recentCatches
end

-- ========== INSTANT BOBBER ==========
local InstantBobberState = {
    instantOverrideActive = false, instantOverrideSetupDone = false,
    activeBaitsByUserId = nil, cosmeticFolder = nil,
    baitCastConn = nil, baitDestroyedConn = nil, renderConn = nil,
}

local function patchInstantBaitOverrideToCastPosition(enabled)
    if not enabled then
        InstantBobberState.instantOverrideActive = false
        if InstantBobberState.activeBaitsByUserId then table.clear(InstantBobberState.activeBaitsByUserId) end
        return
    end
    InstantBobberState.instantOverrideActive = true
    InstantBobberState.activeBaitsByUserId = InstantBobberState.activeBaitsByUserId or {}
    table.clear(InstantBobberState.activeBaitsByUserId)
    if InstantBobberState.instantOverrideSetupDone then return end
    InstantBobberState.instantOverrideSetupDone = true
    local okCosmetic, cosmeticFolder = pcall(function() return workspace:WaitForChild("CosmeticFolder", 5) end)
    if not okCosmetic or not cosmeticFolder then InstantBobberState.instantOverrideSetupDone = false; InstantBobberState.instantOverrideActive = false; return end
    InstantBobberState.cosmeticFolder = cosmeticFolder
    local baitCastVisual = GetServerRemote("RE/BaitCastVisual") or GetServerRemote("BaitCastVisual")
    local baitDestroyed = GetServerRemote("RE/BaitDestroyed") or GetServerRemote("BaitDestroyed")
    if not baitCastVisual or not baitCastVisual:IsA("RemoteEvent") then InstantBobberState.instantOverrideSetupDone = false; InstantBobberState.instantOverrideActive = false; return end
    if not baitDestroyed or not baitDestroyed:IsA("RemoteEvent") then InstantBobberState.instantOverrideSetupDone = false; InstantBobberState.instantOverrideActive = false; return end
    local function safeConnect(signal, callback)
        if not signal then return nil end
        local ok, conn = pcall(function() return signal:Connect(callback) end)
        if not ok then return nil end
        return conn
    end
    InstantBobberState.baitCastConn = safeConnect(baitCastVisual.OnClientEvent, function(player, data)
        if not InstantBobberState.instantOverrideActive then return end
        if not player or not player.UserId then return end
        if not data or not data.CastPosition or typeof(data.CastPosition) ~= "Vector3" then return end
        InstantBobberState.activeBaitsByUserId[player.UserId] = {pivot = CFrame.new(data.CastPosition), expiresAt = tick() + 0.8}
    end)
    InstantBobberState.baitDestroyedConn = safeConnect(baitDestroyed.OnClientEvent, function(player)
        if not InstantBobberState.instantOverrideActive then return end
        if not player or not player.UserId then return end
        InstantBobberState.activeBaitsByUserId[player.UserId] = nil
    end)
    InstantBobberState.renderConn = RunService.RenderStepped:Connect(function()
        if not InstantBobberState.instantOverrideActive then return end
        local now = tick()
        local cf = InstantBobberState.cosmeticFolder
        if not cf then return end
        for userId, entry in pairs(InstantBobberState.activeBaitsByUserId) do
            if now > entry.expiresAt then InstantBobberState.activeBaitsByUserId[userId] = nil
            else
                local model = cf:FindFirstChild(tostring(userId))
                if model and model.PivotTo then
                    model:PivotTo(entry.pivot)
                    if model:IsA("Model") and model.PrimaryPart then model.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, -75, 0)
                    elseif model:IsA("BasePart") then model.AssemblyLinearVelocity = Vector3.new(0, -75, 0) end
                end
            end
        end
    end)
end

-- ========== SKIN ANIMATION ==========
local SkinAnimation = (function()
    local player = game:GetService("Players").LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid", 5)
    if not humanoid then return {SwitchSkin=function() return false end, Enable=function() return false end, Disable=function() return true end} end
    local Animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)
    local SkinDatabase = {
        ["Eclipse"]="rbxassetid://107940819382815", ["HolyTrident"]="rbxassetid://128167068291703",
        ["SoulScythe"]="rbxassetid://82259219343456", ["OceanicHarpoon"]="rbxassetid://76325124055693",
        ["BinaryEdge"]="rbxassetid://109653945741202", ["Vanquisher"]="rbxassetid://93884986836266",
        ["KrampusScythe"]="rbxassetid://134934781977605", ["BanHammer"]="rbxassetid://96285280763544",
        ["CorruptionEdge"]="rbxassetid://126613975718573", ["PrincessParasol"]="rbxassetid://99143072029495"
    }
    local CurrentSkin, AnimationPool, IsEnabled = nil, {}, false
    local function LoadAnimationPool(skinId)
        local animId = SkinDatabase[skinId]
        if not animId then return false end
        for _, track in ipairs(AnimationPool) do pcall(function() track:Destroy() end) end
        AnimationPool = {}
        local anim = Instance.new("Animation"); anim.AnimationId = animId
        for i = 1, 4 do
            local track = Animator:LoadAnimation(anim)
            if track then track.Priority = Enum.AnimationPriority.Action4; track.Name = "SKIN_POOL_" .. i; table.insert(AnimationPool, track) end
        end
        return #AnimationPool > 0
    end
    local function IsFishCaughtAnimation(track)
        local name = string.lower(track.Name or "")
        return name:find("fishcaught") or name:find("caught")
    end
    local function InstantReplace(originalTrack)
        local nextTrack = AnimationPool[math.random(1, #AnimationPool)]
        if nextTrack then pcall(function() originalTrack:Stop(0); nextTrack:Play(0, 1, 1) end) end
    end
    pcall(function()
        humanoid.AnimationPlayed:Connect(function(track)
            local animName = string.lower(track.Name or "")
            if animName:find("fishcaught") or animName:find("caught") or animName:find("reel") then
                pcall(function() track:AdjustSpeed(15.0) end)
            end
            if IsEnabled and IsFishCaughtAnimation(track) then InstantReplace(track) end
        end)
    end)
    local API = {}
    function API.SwitchSkin(id) CurrentSkin = id; return IsEnabled and LoadAnimationPool(id) or true end
    function API.Enable() if not CurrentSkin then return false end; IsEnabled = LoadAnimationPool(CurrentSkin); return IsEnabled end
    function API.Disable() IsEnabled = false; return true end
    return API
end)()

-- ========== LOCATIONS ==========
local LOCATIONS = {
    ["Fisherman"]=CFrame.new(32.452701568603516,9.8837251663208,2811.386962890625,0.99053555727005,3.863859632247113e-08,0.1372562050819397,-4.9611127650450726e-08,1,7.652105438182843e-08,-0.1372562050819397,-8.260626316314301e-08,0.99053555727005),
    ["Sisyphus Statue"]=CFrame.new(-3732.14013671875,-135.07444763183594,-1013.1876831054688,-0.955187201499939,-1.1046745740372899e-09,-0.2960023581981659,1.4209726728608985e-09,1,-8.317398325630165e-09,0.2960023581981659,-8.365283576949878e-09,-0.955187201499939),
    ["Coral Reefs"]=CFrame.new(-3299.224853515625,123.38948059082031,2223.6123046875,0.9714493155479431,-3.932468217726637e-08,-0.23724719882011414,2.3648508928886258e-08,1,-6.89211745452667e-08,0.23724719882011414,6.134288099701735e-08,0.9714493155479431),
    ["Esoteric Depths"]=CFrame.new(3271.66064453125,-1301.5306396484375,1381.4456787109375,0.4031963646411896,-1.698047213949394e-08,-0.9151135087013245,6.24907769974925e-09,1,-1.5802264385911258e-08,0.9151135087013245,6.528004248274044e-10,0.4031963646411896),
    ["Crater Island 1"]=CFrame.new(1060.8260498046875,2.5815768241882324,5131.58740234375,0.6491144299507141,-4.685521304281792e-08,0.7606907486915588,-7.2682522223033175e-09,1,6.779777095289319e-08,-0.7606907486915588,-4.953740528890194e-08,0.6491144299507141),
    ["Crater Island 2"]=CFrame.new(1040.036,55.714,5131.443),
    ["Lost Isle"]=CFrame.new(-3618.157,240.837,-1317.458),
    ["Weather Machine"]=CFrame.new(-1488.512,83.173,1876.303),
    ["Tropical Grove"]=CFrame.new(-2152.160888671875,53.48600769042969,3619.32861328125,-0.9894322156906128,-3.306193363528109e-08,0.14499624073505402,-2.7268503899335883e-08,1,4.194314229266638e-08,-0.14499624073505402,3.75460658119664e-08,-0.9894322156906128),
    ["Treasure Room"]=CFrame.new(-3648.86328125,-268.6123352050781,-1662.415283203125,-0.08403428643941879,4.124477470668353e-08,-0.996462881565094,1.8866575857146017e-08,1,3.980011342719081e-08,0.996462881565094,-1.5455267288189134e-08,-0.08403428643941879),
    ["Kohana"]=CFrame.new(-658.2866821289062,17.244775772094727,510.14471435546875,-0.42606961727142334,-6.305730693156875e-08,-0.9046903848648071,-4.856544677522834e-08,1,-4.6828223077000075e-08,0.9046903848648071,-2.398461163011234e-08,-0.42606961727142334),
    ["Kohana Volcano"]=CFrame.new(-424.0745544433594,7.2453107833862305,124.14938354492188,0.5406834483146667,-5.706213812572969e-08,0.8412261605262756,6.439024247129055e-08,1,2.644639529592041e-08,-0.8412261605262756,3.9867625645229054e-08,0.5406834483146667),
    ["Underground Cellar"]=CFrame.new(2139.544677734375,-91.19776916503906,-766.829833984375,-0.9832987785339355,-4.776161133257517e-10,0.181998610496521,-4.769880601607213e-10,1,4.722218796548994e-11,-0.181998610496521,-4.0377642201994135e-11,-0.9832987785339355),
    ["Ancient Jungle"]=CFrame.new(1484.5361328125,11.14309024810791,-300.48779296875,0.4785112142562866,-4.932040909011448e-08,-0.8780814409255981,6.106117211857054e-08,1,-2.2893040352300886e-08,0.8780814409255981,-4.266210495984524e-08,0.4785112142562866),
    ["Sacred Temple"]=CFrame.new(1421.6331787109375,4.8749680519104,-659.717041015625,-0.1609015166759491,1.0546634854335935e-07,0.9869704842567444,-6.794437013013521e-09,1,-1.079663363157124e-07,-0.9869704842567444,-2.40778543769693e-08,-0.1609015166759491),
    ["Ancient Ruins"]=CFrame.new(6096.15966796875,-585.9248046875,4664.01611328125,0.09696821123361588,6.360328796972681e-08,0.9952874779701233,-2.087845096809815e-08,1,-6.187030976434471e-08,-0.9952874779701233,-1.4780606960584919e-08,0.09696821123361588),
    ["Pirate Cove"]=CFrame.new(3399.018798828125,4.191970348358154,3475.293701171875,0.12555743753910065,5.9513890704465666e-08,-0.9920863509178162,-5.7514718321272085e-08,1,5.270961267456187e-08,0.9920863509178162,5.0441482102314694e-08,0.12555743753910065),
    ["Pirate Treasure Room"]=CFrame.new(3324.074,-306.476,3087.999),
    ["Crystal Depth"]=CFrame.new(5504.767578125,-904.9680786132812,15290.484375,-0.9885009527206421,-5.751004295007078e-08,-0.1512146145105362,-7.093211706887814e-08,1,8.336772339134768e-08,0.1512146145105362,9.313504278907203e-08,-0.9885009527206421),
    ["Lava Basin"]=CFrame.new(950.876,85.282,-10199.427),
    ["Planetary Observatory"]=CFrame.new(460.5227966308594,24.145477294921875,2204.85546875,0.31723323464393616,-8.052414735004731e-09,0.9483475685119629,-5.833442529024069e-08,1,2.8004535579384537e-08,-0.9483475685119629,-6.420528109174484e-08,0.31723323464393616),
    ["Underwater City"]=CFrame.new(-3100.5361328125,-644.4927978515625,-10585.369140625,0.9756958484649658,8.328454015327225e-08,-0.21912924945354462,-8.53786374932497e-08,1,-8.691408009964263e-11,0.21912924945354462,1.8793759437585322e-08,0.9756958484649658),
    ["sewer"]=CFrame.new(-1387.8677978515625,-1041.593994140625,-10436.0390625,0.6749362945556641,5.8742899433639195e-09,-0.7378759980201721,8.491160663481878e-09,1,1.5727957602962306e-08,0.7378759980201721,-1.6880791875450996e-08,0.6749362945556641),
    ["Classic Island"]=CFrame.new(1477.536865234375,58,2846.27001953125,0.6762107014656067,4.7292754601357956e-08,0.7367082834243774,-2.8568027943265406e-09,1,-6.157247867122351e-08,-0.7367082834243774,3.9531339979248514e-08,0.6762107014656067),
    ["Classic School"]=CFrame.new(1373.780517578125,55.82353973388672,2689.136474609375,-0.9998148679733276,0.00026688442449085414,-0.019238121807575226,8.563982856202301e-11,0.9999037981033325,0.013871346600353718,0.01923997327685356,0.013868778944015503,-0.9997187256813049),
    ["Copper Canyon"]=CFrame.new(-4147.4873046875, 6.7726263999938965, 614.3461303710938, 0.3586901128292084, 0.030515363439917564, 0.9329577684402466, -1.9739960777087617e-09, 0.9994655251502991, -0.032690711319446564, -0.9334567189216614, 0.011725833639502525, 0.3584984242916107),
    ["Enchanting Altar"]=CFrame.new(3244.42138671875, -1301.1806640625, 1395.0330810546875, -0.4685245156288147, -3.482493937667641e-08, 0.8834505081176758, -5.064358532536062e-08, 1, 1.2561176987446743e-08, -0.8834505081176758, -3.885588384378025e-08, -0.4685245156288147),
}

local function teleportTo(locationName)
    local cf = LOCATIONS[locationName]
    local hrp = getHRP()
    if not hrp or not cf then return end
    hrp.CFrame = cf + Vector3.new(0, 3, 0)
end



-- ========== UB INIT & LOOP ==========
local function UB_init()
    Config.UB.Remotes.ChargeFishingRod = GetServerRemote("RF/ChargeFishingRod")
    Config.UB.Remotes.RequestMinigame = GetServerRemote("RF/RequestFishingMinigameStarted")
    Config.UB.Remotes.CancelFishingInputs = GetServerRemote("RF/CancelFishingInputs")
    Config.UB.Remotes.UpdateAutoFishing = GetServerRemote("RF/UpdateAutoFishingState")
    Config.UB.Remotes.FishingCompleted = GetServerRemote("RF/CatchFishCompleted")
    Config.UB.Remotes.FishingCompletedRE = GetServerRemote("RE/CatchFishCompleted")
    Config.UB.Remotes.equip = GetServerRemote("RF/EquipToolFromHotbar")
    
    -- Tambah remote untuk Replion Set (kalau ada)
    pcall(function()
        local replionFolder = ReplicatedStorage:FindFirstChild("Packages")
        if replionFolder then
            local idx = replionFolder:FindFirstChild("_Index")
            if idx then
                for _, child in ipairs(idx:GetChildren()) do
                    if child.Name:find("ytrev_replion") then
                        local replionMod = child:FindFirstChild("replion")
                        if replionMod then
                            local remotes = replionMod:FindFirstChild("Remotes")
                            if remotes then
                                Config.UB.Remotes.ReplionSet = remotes:FindFirstChild("Set")
                            end
                        end
                        break
                    end
                end
            end
        end
    end)
    
    return true
end

local NOTIF_DELAY_DURATION = 18
local _notifDelayActive = false
local _notifHooksApplied = false

local function setupNotifDelayHooks()
    if _notifHooksApplied then return end
    _notifHooksApplied = true
    if not isMobile then return end
    pcall(function()
        local ctrlFolder = ReplicatedStorage:FindFirstChild("Controllers")
        if not ctrlFolder then return end
        local TextNotifCtrl = require(ctrlFolder:WaitForChild("TextNotificationController", 5))
        if TextNotifCtrl and TextNotifCtrl.DeliverNotification then
            local oldDeliver = TextNotifCtrl.DeliverNotification
            TextNotifCtrl.DeliverNotification = function(self, data, ...)
                if _notifDelayActive and data and type(data) == "table" then data.Duration = NOTIF_DELAY_DURATION; data.CustomDuration = NOTIF_DELAY_DURATION end
                return oldDeliver(self, data, ...)
            end
        end
    end)
end

local function enableNotifDelay() if not _notifHooksApplied then setupNotifDelayHooks() end; _notifDelayActive = true end
local function disableNotifDelay() _notifDelayActive = false end

_G._QHBetaBlockNotif = false
local _origFireLocalEvent = FireLocalEvent
FireLocalEvent = function(remote, ...)
    if _G._QHBetaBlockNotif and remote and remote.Name and remote.Name:find("ObtainedNewFishNotification") then return end
    return _origFireLocalEvent(remote, ...)
end
local function enableBlockNotif() _G._QHBetaBlockNotif = true end
local function disableBlockNotif() _G._QHBetaBlockNotif = false end

local function replayAmblatantNotif()
    task.spawn(function()
        local xr_caught = GetServerRemote("RE/FishCaught")
        local xr_visual = GetServerRemote("RE/CaughtFishVisual")
        local xr_notif = Events.fishNotif
        if xr_caught and #lastValidFishCaught > 0 then pcall(function() FireLocalEvent(xr_caught, unpack(lastValidFishCaught)) end) end
        task.wait(0.03)
        if xr_visual and #lastValidCaughtVisual > 0 then pcall(function() FireLocalEvent(xr_visual, unpack(lastValidCaughtVisual)) end) end
        task.wait(0.03)
        if xr_notif and #lastValidFishNotif > 0 then
            pcall(function() FireLocalEvent(xr_notif, unpack(lastValidFishNotif)) end)
        end
    end)
end

-- ============================================
-- UB LOOP (QUANTUM MAXIMUM - 20 CPS)
-- ============================================

local function ub_loop()
    while Config.UB.Active do
        local ok, err = pcall(function()

            -- STEP 1: Equip rod hanya sekali
            if needCast then
                pcall(function()
                    if Events.equip then Events.equip:InvokeServer(1) end
                end)
                pcall(function()
                    if Events.UpdateAutoFishing then Events.UpdateAutoFishing:InvokeServer(true) end
                end)
                needCast = false
            end

            -- STEP 2: Langsung tanda seru (SKIP cast/charge/minigame)
            pcall(function()
                local exclaimRemote = Events.exclaimEvent
                if exclaimRemote then
                    local char = LocalPlayer.Character
                    local head = char and char:FindFirstChild("Head")
                    if head then
                        local conns = {}
                        pcall(function() conns = getconnections(exclaimRemote.OnClientEvent) end)
                        for _, conn in ipairs(conns) do
                            if conn and conn.Function then
                                pcall(function() conn.Function({
                                    TextData = { EffectType = "Exclaim", Text = "!", Color = Color3.fromRGB(255,255,0), Size = 1.5 },
                                    Container = head,
                                    Position = head.Position
                                }) end)
                            end
                        end
                    end
                end
            end)

            -- STEP 3: Langsung catch (skip charge & minigame)
            pcall(function()
                if Config.UB.Remotes.FishingCompleted then
                    Config.UB.Remotes.FishingCompleted:InvokeServer()
                end
            end)
            pcall(function()
                if Config.UB.Remotes.FishingCompletedRE then
                    Config.UB.Remotes.FishingCompletedRE:FireServer()
                end
            end)

            -- ============================================
            -- STEP 4: CHARGE + MINIGAME (langsung)
            -- ============================================
            local fakeTime = tick()
            pcall(function()
                if Config.UB.Remotes.ChargeFishingRod then
                    Config.UB.Remotes.ChargeFishingRod:InvokeServer({fakeTime})
                end
            end)
            pcall(function()
                if Config.UB.Remotes.RequestMinigame then
                    Config.UB.Remotes.RequestMinigame:InvokeServer(1, 0, fakeTime)
                end
            end)

            -- ============================================
            -- STEP 5: CATCH (Server Side)
            -- ============================================
            pcall(function()
                if Config.UB.Remotes.FishingCompleted then
                    Config.UB.Remotes.FishingCompleted:InvokeServer()
                end
            end)
            pcall(function()
                if Config.UB.Remotes.FishingCompletedRE then
                    Config.UB.Remotes.FishingCompletedRE:FireServer()
                end
            end)

            -- ============================================
            -- STEP 6-11: GENERATE FISH + NOTIFIKASI (sama)
            -- ============================================
            local fish = generateUniqueFish()
            
            rainbowCount = (rainbowCount or 0) + 1
            if rainbowCount > 40 then rainbowCount = 0 end
            goldenCount = (goldenCount or 0) + 1
            if goldenCount > 10 then goldenCount = 0 end
            fishCount = (fishCount or 0) + 1

            -- FishCaught visual
            local playerName = LocalPlayer.Name
            local visualArgs = {
                playerName,
                fish.Id,
                fish.Name,
                fish.Rarity,
                fish.Weight,
                fish.Shiny,
                fish.Mutation,
                fish.UUID
            }

            pcall(function()
                local xr_caught = GetServerRemote("RE/FishCaught")
                if xr_caught then
                    local conns = {}
                    pcall(function() conns = getconnections(xr_caught.OnClientEvent) end)
                    for _, conn in ipairs(conns) do
                        if conn and conn.Function then
                            pcall(function() conn.Function(unpack(visualArgs)) end)
                        end
                    end
                end
            end)

            -- CaughtFishVisual
            pcall(function()
                local xr_visual = GetServerRemote("RE/CaughtFishVisual")
                if xr_visual then
                    local conns = {}
                    pcall(function() conns = getconnections(xr_visual.OnClientEvent) end)
                    for _, conn in ipairs(conns) do
                        if conn and conn.Function then
                            pcall(function() conn.Function(unpack(visualArgs)) end)
                        end
                    end
                end
            end)

            -- Notif inventory (Anti-Stack)
            local notifArgs = {
                playerName,
                {
                    Id = fish.Id,
                    Metadata = fish.Metadata,
                    StackId = fish.UUID,
                    IsNew = true
                },
                {
                    InventoryItem = {
                        UUID = fish.UUID,
                        Id = fish.Id,
                        Metadata = fish.Metadata,
                        CreatedAt = tick(),
                        StackKey = fish.UUID
                    }
                }
            }

            pcall(function()
                local xr_notif = Events.fishNotif
                if xr_notif then
                    local conns = {}
                    pcall(function() conns = getconnections(xr_notif.OnClientEvent) end)
                    for _, conn in ipairs(conns) do
                        if conn and conn.Function then
                            pcall(function() conn.Function(unpack(notifArgs)) end)
                        end
                    end
                end
            end)

            -- Text notifikasi atas
            pcall(function()
                local textNotifRemote = Events.TextNotification or GetServerRemote("RE/TextNotification")
                if textNotifRemote then
                    local rarityColor = {
                        COMMON = Color3.fromRGB(169, 169, 169),
                        UNCOMMON = Color3.fromRGB(0, 255, 0),
                        RARE = Color3.fromRGB(0, 112, 221),
                        EPIC = Color3.fromRGB(163, 53, 238),
                        LEGENDARY = Color3.fromRGB(255, 165, 0),
                        MYTHIC = Color3.fromRGB(255, 0, 0),
                        SECRET = Color3.fromRGB(255, 215, 0),
                        FORGOTTEN = Color3.fromRGB(148, 0, 211)
                    }
                    
                    local textData = {
                        Title = "Fish Caught!",
                        Text = fish.Name .. " [" .. fish.Rarity .. "] " .. string.format("%.2fkg", fish.Weight),
                        SubText = fish.Shiny and "SHINY!" or (fish.Mutation and "✦ " .. fish.Mutation or ""),
                        Duration = 3,
                        Color = rarityColor[fish.Rarity] or Color3.fromRGB(57, 255, 20),
                        NotifId = fish.UUID,
                        PreventStack = true
                    }
                    local conns = {}
                    pcall(function() conns = getconnections(textNotifRemote.OnClientEvent) end)
                    for _, conn in ipairs(conns) do
                        if conn and conn.Function then
                            pcall(function() conn.Function(textData) end)
                        end
                    end
                end
            end)

            -- Rainbow/Golden update
            pcall(function()
                local replionFolder = ReplicatedStorage:FindFirstChild("Packages")
                if replionFolder then
                    local idx = replionFolder:FindFirstChild("_Index")
                    if idx then
                        for _, child in ipairs(idx:GetChildren()) do
                            if child.Name:find("ytrev_replion") then
                                local replionMod = child:FindFirstChild("replion")
                                if replionMod then
                                    local remotes = replionMod:FindFirstChild("Remotes")
                                    if remotes then
                                        local setRemote = remotes:FindFirstChild("Set")
                                        if setRemote and setRemote:IsA("RemoteEvent") then
                                            setRemote:FireServer("Data", {"Modifiers", "Rainbow"}, rainbowCount)
                                            setRemote:FireServer("Data", {"Modifiers", "Golden"}, goldenCount)
                                        end
                                    end
                                end
                                break
                            end
                        end
                    end
                end
            end)

            -- Stats
            _sessionCatchCount = _sessionCatchCount + 1
            table.insert(_lastCatchTimestamps, tick())
            if #_lastCatchTimestamps > 60 then table.remove(_lastCatchTimestamps, 1) end
            blatantFishCycleCount = blatantFishCycleCount + 1

            -- Delay (0.05 = ~20 CPS)
            task.wait(0.05)
        end)

        if not ok then
            -- Silent error, continue loop
        end
    end
end
                                    
local function UB_start()
    if Config.UB.Active then return end
    UB_init(); Config.UB.Active = true; needCast = true
    _G.NotifQueue = {}; _G.NotifActive = 0; isCaught = false
    Config.UB.Stats.startTime = tick()
    Tasks.ubtask = task.spawn(ub_loop)
    NotifySuccess("Quantum Fishing", "Aktif!")
end

local function UB_stop()
    if not Config.UB.Active then return end
    Config.UB.Active = false; _G.NotifQueue = {}; _G.NotifActive = 0
    safeFire(function() if Config.UB.Remotes.CancelFishingInputs then CallRemote(Config.UB.Remotes.CancelFishingInputs) end end)
    task.wait(0.3)
    if Tasks.ubtask then pcall(function() task.cancel(Tasks.ubtask) end); Tasks.ubtask = nil end
    NotifyWarning("Quantum Fishing", "Dimatikan.")
end

local function onToggleUB(value)
    if value then
        enableNotifDelay()
        enableBlockNotif()
        pcall(function() 
            if isMobile and Controllers.Notification and origPlaySmallItemObtained then 
                Controllers.Notification.PlaySmallItemObtained = function() return end 
            end 
        end)
        patchInstantBaitOverrideToCastPosition(true)
        
        -- Aktifkan auto fishing
        pcall(function()
            if Events.UpdateAutoFishing then
                CallRemote(Events.UpdateAutoFishing, true)
            end
        end)
        
        equipRod()
        task.wait(0.3)
        
        -- Reset counters
        rainbowCount = 0
        goldenCount = 0
        fishCount = 0
        _sessionCatchCount = 0
        _lastCatchTimestamps = {}
        
        UB_start()
    else
        UB_stop()
        patchInstantBaitOverrideToCastPosition(false)
        disableNotifDelay()
        disableBlockNotif()
        pcall(function() 
            if isMobile and Controllers.Notification and origPlaySmallItemObtained then 
                Controllers.Notification.PlaySmallItemObtained = origPlaySmallItemObtained 
            end 
        end)
        pcall(function()
            if Events.UpdateAutoFishing then
                CallRemote(Events.UpdateAutoFishing, false)
            end
        end)
    end
end

UB_init()

task.spawn(function()
    while true do
        task.wait(5)
        if Config.UB.Active and lastTimeFishCaught ~= nil and os.clock() - lastTimeFishCaught >= 20 and blatantFishCycleCount > 1 then
            needCast = true; saveCount = 0; blatantFishCycleCount = 1; lastTimeFishCaught = os.clock()
            safeFire(function() if Config.UB.Remotes.CancelFishingInputs then CallRemote(Config.UB.Remotes.CancelFishingInputs) end end)
        end
    end
end)

-- ========== AUTO SELL ==========
local function RunAutoSellLoop()
    if Tasks.AutoSellThread then pcall(function() task.cancel(Tasks.AutoSellThread) end); Tasks.AutoSellThread = nil end
    Tasks.AutoSellThread = task.spawn(function()
        while Config.AutoSellState do
            if not Events.sell or not Events.sell.Parent then
                Events.sell = GetServerRemote("RF/SellAllItems")
                if not Events.sell then NotifyError("Auto Sell", "Remote tidak ditemukan!"); task.wait(3); continue end
            end
            if Config.AutoSellMethod == "Delay" then
                local delaySeconds = math.clamp(Config.AutoSellValue, 1, 9999)
                task.wait(delaySeconds)
                if Config.AutoSellState then
                    local ok = pcall(function()
                        if Events.sell and Events.sell:IsA("RemoteFunction") then Events.sell:InvokeServer()
                        elseif Events.sell and Events.sell:IsA("RemoteEvent") then Events.sell:FireServer() end
                    end)
                    if ok then NotifySuccess("Auto Sell", "Sell! (Delay: " .. delaySeconds .. "s)") end
                end
            elseif Config.AutoSellMethod == "Count" then
                local targetCount = math.clamp(Config.AutoSellValue, 1, 9999)
                local startCount = _sessionCatchCount
                while Config.AutoSellState and (_sessionCatchCount - startCount) < targetCount do task.wait(0.5) end
                if Config.AutoSellState then
                    local ok = pcall(function()
                        if Events.sell and Events.sell:IsA("RemoteFunction") then Events.sell:InvokeServer()
                        elseif Events.sell and Events.sell:IsA("RemoteEvent") then Events.sell:FireServer() end
                    end)
                    if ok then NotifySuccess("Auto Sell", "Sell! (" .. targetCount .. " ikan)") end
                end
            else task.wait(1) end
        end
    end)
end

-- ========== HELPER FUNCTIONS ==========
local function deepCopyArr(t)
    if type(t) ~= "table" then return t end
    local out = {}
    for i, v in ipairs(t) do
        if type(v) == "table" then
            local c = {}
            for k, val in pairs(v) do
                c[k] = val
            end
            out[i] = c
        else
            out[i] = v
        end
    end
    return out
end

local function GetPlayerDataReplion()
    local result = nil
    pcall(function()
        local m = ReplicatedStorage:WaitForChild("Packages", 5):WaitForChild("Replion", 5)
        result = require(m).Client:WaitReplion("Data", 5)
    end)
    return result or PlayerData or nil
end

local function IsFishItem(item)
    local isFish = false
    pcall(function()
        -- Fish items have Weight in metadata
        if item.Metadata and item.Metadata.Weight then isFish = true end
        -- Check via ItemUtility probability data (fish have Probability)
        if ItemUtility then
            local data = ItemUtility:GetItemData(item.Id)
            if data and data.Probability then isFish = true end
            if data and data.Data and data.Data.Type and string.lower(tostring(data.Data.Type)) == "fish" then isFish = true end
        end
    end)
    return isFish
end

local function GetFishNameAndRarity(item)
    local name = item.Identifier or "Unknown"
    local rarity = item.Metadata and item.Metadata.Rarity or "COMMON"
    local itemID = item.Id
    local itemData = nil
    pcall(function()
        if ItemUtility then
            itemData = ItemUtility:GetItemData(itemID)
            if not itemData then local numericID = tonumber(item.Id) or tonumber(item.Identifier); if numericID then itemData = ItemUtility:GetItemData(numericID) end end
        end
    end)
    if itemData and itemData.Data and itemData.Data.Name then name = itemData.Data.Name end
    if item.Metadata and item.Metadata.Rarity then rarity = item.Metadata.Rarity
    elseif itemData and itemData.Probability and itemData.Probability.Chance and TierUtility then
        local tierObj = nil
        pcall(function() tierObj = TierUtility:GetTierFromRarity(itemData.Probability.Chance) end)
        if tierObj and tierObj.Name then rarity = tierObj.Name end
    end
    return name, rarity
end

local function GetItemMutationString(item)
    if item.Metadata and item.Metadata.Shiny == true then return "Shiny" end
    return item.Metadata and item.Metadata.VariantId or ""
end

-- ========== AUTO FAVORITE ==========
local function RunAutoFavLoop(isUnfavorite)
    local replion = GetPlayerDataReplion()
    if not replion then return end
    if not Events.favorite then Events.favorite = GetServerRemote("RE/FavoriteItem"); if not Events.favorite then NotifyError("Auto Fav", "Remote tidak ditemukan!"); return end end
    local ok, invData = pcall(function() return replion:GetExpect("Inventory") end)
    if not ok or not invData or not invData.Items then return end
    local targets = {}
    for _, item in ipairs(invData.Items) do
        local isAlreadyFav = (item.IsFavorite or item.Favorited)
        local shouldProcess = isUnfavorite and isAlreadyFav or (not isUnfavorite and not isAlreadyFav)
        if shouldProcess then
            local _, rarity = GetFishNameAndRarity(item)
            local mutation = GetItemMutationString(item)
            local match = false
            if #Config.SelectedRarities > 0 then for _, r in ipairs(Config.SelectedRarities) do if string.lower(rarity) == string.lower(r) then match = true; break end end end
            if not match and #Config.SelectedMutations > 0 then if table.find(Config.SelectedMutations, mutation) then match = true end end
            if match and item.UUID then table.insert(targets, item.UUID) end
        end
    end
    if #targets > 0 then
        NotifyInfo(isUnfavorite and "Unfavoriting" or "Favoriting", "Memproses " .. #targets .. " ikan...")
        for _, uuid in ipairs(targets) do
            if (isUnfavorite and not Config.AutoUnfavoriteState) or (not isUnfavorite and not Config.AutoFavoriteState) then break end
            pcall(function() if Events.favorite then Events.favorite:FireServer(uuid) end end)
            task.wait(0.3)
        end
    else NotifyInfo(isUnfavorite and "Unfavoriting" or "Favoriting", "Tidak ada ikan yang cocok.") end
end

-- ========== ENCHANT SYSTEM ==========
local STONE_IDS = {["Enchant Stones"]=10, ["Evolved Enchant Stone"]=558}
local enchantIdMap = {
    ["Big Hunter 1"]=3,["Cursed 1"]=12,["Empowered 1"]=9,["Glistening 1"]=1,["Gold Digger 1"]=4,
    ["Leprechaun 1"]=5,["Leprechaun 2"]=6,["Mutation Hunter 1"]=7,["Mutation Hunter 2"]=14,
    ["Prismatic 1"]=13,["Reeler 1"]=2,["Stargazer 1"]=8,["Stormhunter 1"]=11,["XPerienced 1"]=10,
    ["SECRET Hunter"]=16,["Shark Hunter"]=20,["Stargazer II"]=17,["Stormhunter II"]=19,
    ["Leprechaun II"]=6,["Reeler II"]=21,["Mutation Hunter III"]=22,["Fairy Hunter 1"]=15
}

_G.SelectedStoneType = _G.SelectedStoneType or "Enchant Stones"
_G.TargetEnchantBasic = _G.TargetEnchantBasic or "Big Hunter 1"
_G.TargetEnchantEvolved = _G.TargetEnchantEvolved or "Prismatic 1"
_G.AutoEnchant = _G.AutoEnchant or false

local function findEnchantStones()
    local stones = {}
    pcall(function()
        local inv = PlayerData and PlayerData:GetExpect("Inventory")
        if not inv or not inv.Items then return end
        local targetId = STONE_IDS[_G.SelectedStoneType]
        for _, item in ipairs(inv.Items) do if item.Id == targetId then table.insert(stones, {UUID=item.UUID, Id=item.Id}) end end
    end)
    return stones
end

local function countHotbarSlots()
    local count = 5
    pcall(function()
        local backpackGui = LocalPlayer.PlayerGui:FindFirstChild("Backpack")
        if not backpackGui then return end
        local display = backpackGui:FindFirstChild("Display"); if not display then return end
        local c = 0
        for _, child in ipairs(display:GetChildren()) do if child:IsA("ImageButton") then c = c + 1 end end
        count = c
    end)
    return count
end

local function getCurrentRodEnchant()
    local enchantId = nil
    pcall(function()
        if not PlayerData then return end
        local equipped = PlayerData:Get("EquippedItems"); if not equipped then return end
        local rods = PlayerData:GetExpect("Inventory")
        if not rods or not rods["Fishing Rods"] then return end
        for _, uuid in pairs(equipped) do
            for _, rod in ipairs(rods["Fishing Rods"]) do
                if rod.UUID == uuid and rod.Metadata and rod.Metadata.EnchantId then enchantId = rod.Metadata.EnchantId end
            end
        end
    end)
    return enchantId
end

-- ========== EVENT DATA ==========
local megCheckRadius = 150
local autoEventTPEnabled = false
local autoEventThread = nil
local selectedEvents = {}
local createdEventPlatform = nil

local eventData = {
    ["Worm Hunt"]       = {TargetName="Model",           Locations={Vector3.new(2190.85,-1.4,97.575),Vector3.new(-2450.679,-1.4,139.731),Vector3.new(-267.479,-1.4,5188.531),Vector3.new(-327,-1.4,2422)}, PlatformY=107, Priority=1},
    ["Megalodon Hunt"]  = {TargetName="Megalodon Hunt",  Locations={Vector3.new(-1076.3,-1.4,1676.2),Vector3.new(-1191.8,-1.4,3597.3),Vector3.new(412.7,-1.4,4134.4)}, PlatformY=107, Priority=2},
    ["Ghost Shark Hunt"]= {TargetName="Ghost Shark Hunt",Locations={Vector3.new(489.559,-1.35,25.406),Vector3.new(-1358.216,-1.35,4100.556),Vector3.new(627.859,-1.35,3798.081)}, PlatformY=107, Priority=3},
    ["Shark Hunt"]      = {TargetName="Shark Hunt",      Locations={Vector3.new(1.65,-1.35,2095.725),Vector3.new(1369.95,-1.35,930.125),Vector3.new(-1585.5,-1.35,1242.875),Vector3.new(-1896.8,-1.35,2634.375)}, PlatformY=107, Priority=4},
    ["Thunderzilla Hunt"]={TargetName="Shocked",         Locations={Vector3.new(2071.847,-2.673,15.144)}, PlatformY=107, Priority=5},
}

local function destroyEventPlatform()
    if createdEventPlatform then pcall(function() createdEventPlatform:Destroy() end); createdEventPlatform = nil end
end

local function createAndTeleportToPlatform(targetPos, y)
    local character = game.Players.LocalPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local desiredPos = Vector3.new(targetPos.X, y, targetPos.Z)
    if createdEventPlatform and createdEventPlatform.Parent then
        createdEventPlatform.Position = desiredPos
    else
        destroyEventPlatform()
        local platform = Instance.new("Part")
        platform.Size = Vector3.new(5, 1, 5); platform.Position = desiredPos; platform.Anchored = true
        platform.Transparency = 1; platform.CanCollide = true; platform.Color = Color3.fromRGB(0,170,255)
        platform.Name = "EventPlatform"; platform.Parent = Workspace
        createdEventPlatform = platform
    end
    hrp.CFrame = CFrame.new(createdEventPlatform.Position + Vector3.new(0, 3, 0))
end

local function runMultiEventTP()
    while autoEventTPEnabled do
        local sorted = {}
        for _, e in ipairs(selectedEvents) do if eventData[e] then table.insert(sorted, eventData[e]) end end
        table.sort(sorted, function(a, b) return a.Priority < b.Priority end)
        for _, config in ipairs(sorted) do
            if not autoEventTPEnabled then break end
            local foundTarget, foundPos = nil, nil
            if config.TargetName == "Model" then
                local menuRings = Workspace:FindFirstChild("!!! MENU RINGS")
                if menuRings then
                    for _, props in ipairs(menuRings:GetChildren()) do
                        if props.Name == "Props" then
                            local model = props:FindFirstChild("Model")
                            if model and model.PrimaryPart then
                                local modelPos = model.PrimaryPart.Position
                                for _, loc in ipairs(config.Locations) do
                                    if (modelPos - loc).Magnitude <= megCheckRadius then foundTarget, foundPos = model, modelPos; break end
                                end
                            end
                        end
                        if foundTarget then break end
                    end
                end
            else
                for _, d in ipairs(Workspace:GetDescendants()) do
                    if d.Name == config.TargetName then
                        local pos = nil
                        if d:IsA("BasePart") then pos = d.Position elseif d.PrimaryPart then pos = d.PrimaryPart.Position end
                        if pos then
                            for _, loc in ipairs(config.Locations) do
                                if (pos - loc).Magnitude <= megCheckRadius then foundTarget, foundPos = d, pos; break end
                            end
                        end
                    end
                    if foundTarget then break end
                end
            end
            if foundTarget and foundPos then createAndTeleportToPlatform(foundPos, config.PlatformY); break end
        end
        task.wait(0.1)
    end
    destroyEventPlatform()
end

-- ========== QUANTUM PANEL ==========
local function CreateQuantumPanel()
    local playerGui = LocalPlayer:WaitForChild("PlayerGui")
    local gui = Instance.new("ScreenGui")
    gui.Name = "QuantumPanelV3"; gui.IgnoreGuiInset = true; gui.ResetOnSpawn = false; gui.Enabled = true; gui.Parent = CoreGui
    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 220, 0, 24); main.Position = UDim2.new(0.5, -110, 0.5, -120)
    main.BackgroundColor3 = Color3.fromRGB(15, 30, 18); main.BackgroundTransparency = 0.55
    main.BorderSizePixel = 0; main.Active = true; main.Parent = gui
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 6)
    local stroke = Instance.new("UIStroke", main)
    stroke.Color = Color3.fromRGB(57, 255, 20); stroke.Thickness = 1; stroke.Transparency = 0.6
    local content = Instance.new("Frame", main)
    content.Size = UDim2.new(1, -6, 1, -2); content.Position = UDim2.new(0, 3, 0, 1); content.BackgroundTransparency = 1
    local layout = Instance.new("UIListLayout", content)
    layout.FillDirection = Enum.FillDirection.Horizontal; layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Center; layout.Padding = UDim.new(0, 4)
    local function makeStat(labelText)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 0, 1, 0); label.AutomaticSize = Enum.AutomaticSize.X
        label.BackgroundTransparency = 1; label.Font = Enum.Font.GothamBold; label.TextSize = 8
        label.TextWrapped = false; label.TextColor3 = Color3.fromRGB(170, 210, 180); label.Text = labelText; label.Parent = content
        return label
    end
    local pingLabel = makeStat("PING: 0ms")
    local fpsLabel = makeStat("FPS: 0")
    local notifLabel = makeStat("NOTIF: 0")
    local caughtLabel = makeStat("CAUGHT: 0")
    local dragging = false
    local dragStart, startPos
    main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = main.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    local frames, fps, last = 0, 0, tick()
    local fpsConn = RunService.RenderStepped:Connect(function()
        frames = frames + 1
        if tick() - last >= 1 then fps = frames; frames = 0; last = tick() end
    end)
    local function getPing()
        local networkStats = Stats:FindFirstChild("Network")
        if networkStats and networkStats:FindFirstChild("ServerStatsItem") then
            local pingData = networkStats.ServerStatsItem:FindFirstChild("Data Ping")
            if pingData then local val = pingData:GetValue(); if val then return math.floor(val) end end
        end
        return 0
    end
    local function getTotalNotifications()
        local count = 0
        pcall(function()
            local textNotifications = playerGui:FindFirstChild("Text Notifications")
            if textNotifications then
                local frame = textNotifications:FindFirstChild("Frame")
                if frame then for _, child in ipairs(frame:GetChildren()) do if child.Name == "Tile" then count = count + 1 end end end
            end
        end)
        return count
    end
    local function color(label, v, y, r)
        if v >= r then label.TextColor3 = Color3.fromRGB(255, 80, 80)
        elseif v >= y then label.TextColor3 = Color3.fromRGB(255, 220, 0)
        else label.TextColor3 = Color3.fromRGB(170, 210, 180) end
    end
    local updateThread = task.spawn(function()
        while gui and gui.Parent do
            pcall(function()
                PingMonitor:Update()
                local ping = getPing(); local notifCount = getTotalNotifications(); local caught = _sessionCatchCount
                pingLabel.Text = "PING: " .. ping .. "ms"; fpsLabel.Text = "FPS: " .. fps
                notifLabel.Text = "NOTIF: " .. notifCount; caughtLabel.Text = "CAUGHT: " .. caught
                color(pingLabel, ping, 120, 200); color(fpsLabel, fps, 40, 90)
                color(notifLabel, notifCount, 8, 20); color(caughtLabel, caught, 50, 100)
            end)
            task.wait(0.8)
        end
    end)
    gui.Destroying:Connect(function()
        pcall(function() fpsConn:Disconnect() end)
        pcall(function() task.cancel(updateThread) end)
    end)
    return gui
end
local statsPanelGui = CreateQuantumPanel()

pcall(function()
    for _, v in pairs(getconnections(LocalPlayer.Idled)) do
        if v.Disable then v.Disable() elseif v.Disconnect then v.Disconnect() end
    end
end)

-- ========== ATLANTIS MACHINE (NEW V2) ==========
local AtlantisConfig = {
    AutoAtlantisMachine = false,
    IsRunning = false,
    MachineThread = nil,
    LastFishingPosition = nil
}

-- Koordinat 
local ATLANTIS_MACHINE_CF = CFrame.new(-3173.55419921875, -640.4428100585938, -10449.6025390625, 0.044499535113573074, -6.89831125555429e-08, -0.9990094304084778, 5.832494665014565e-08, 1, -6.645350936196337e-08, 0.9990094304084778, -5.5310017899046215e-08, 0.044499535113573074)

-- Atlantis Machine
local ATLANTIS_UI_REMOTE_NAME = "RF/a97637c7fad3ffe5a38c68ae066f2812042e83694e259976a4f3b39d0ff82bd1"

local function OpenAtlantisUI()
    local remote = GetServerRemote(ATLANTIS_UI_REMOTE_NAME)
    if remote then
        pcall(function() remote:InvokeServer() end)
        return true
    end
    return false
end

local function GetAtlantisFishCount()
    local count = 0
    pcall(function()
        local replion = GetPlayerDataReplion()
        if not replion then return end
        local inv = replion:GetExpect("Inventory")
        if not inv or not inv.Items then return end
        for _, item in ipairs(inv.Items) do
            local _, rarity = GetFishNameAndRarity(item)
            if rarity and (
                rarity == "Rare" or rarity == "Epic" or
                rarity == "Legendary" or rarity == "Mythic" or
                rarity == "SECRET"
            ) then count = count + 1 end
        end
    end)
    return count
end

local function SacrificeAllFishToAtlantis()
    local hrp = getHRP()
    if not hrp then return false end

    -- Simpan posisi awal
    AtlantisConfig.LastFishingPosition = hrp.CFrame

    -- Teleport LANGSUNG ke Atlantis Machine (skip Underwater City)
    NotifyInfo("Atlantis", "Teleport langsung ke Atlantis Machine...")
    local hrp2 = getHRP()
    if hrp2 then
        hrp2.CFrame = ATLANTIS_MACHINE_CF + Vector3.new(0, 5, 0)
    end
    task.wait(0.5)

    -- Buka UI Atlantis 
    local uiOpened = OpenAtlantisUI()
    if uiOpened then
        NotifyInfo("Atlantis", "UI Atlantis terbuka!")
        task.wait(0.3)
    else
        NotifyWarning("Atlantis", "UI remote gagal, lanjut sacrifice...")
    end

    -- Reload remote
    local sacrificeRemote = GetServerRemote("RF/SacrificeAtlantisFish")
    local sellAllRemote   = GetServerRemote("RF/SacrificeAtlantisSellAll")
    local effectRemote    = GetServerRemote("RE/AtlantisMachineEffect")

    if not sacrificeRemote then
        NotifyError("Atlantis", "Remote Sacrifice tidak ditemukan!")
        local h = getHRP()
        if h and AtlantisConfig.LastFishingPosition then
            h.CFrame = AtlantisConfig.LastFishingPosition
        end
        return false
    end

    -- Kumpulkan UUID ikan Rare+
    local fishToSacrifice = {}
    pcall(function()
        local replion = GetPlayerDataReplion()
        if not replion then return end
        local inv = replion:GetExpect("Inventory")
        if not inv or not inv.Items then return end
        for _, item in ipairs(inv.Items) do
            local _, rarity = GetFishNameAndRarity(item)
            if rarity and (
                rarity == "Rare" or rarity == "Epic" or
                rarity == "Legendary" or rarity == "Mythic" or
                rarity == "SECRET"
            ) then
                if item.UUID then table.insert(fishToSacrifice, item.UUID) end
            end
        end
    end)

    if #fishToSacrifice == 0 then
        NotifyWarning("Atlantis", "Tidak ada ikan (Rare+) untuk di-sacrifice!")
        local h = getHRP()
        if h and AtlantisConfig.LastFishingPosition then
            h.CFrame = AtlantisConfig.LastFishingPosition
        end
        return false
    end

    NotifyInfo("Atlantis", "Sacrifice " .. #fishToSacrifice .. " ikan...")

    -- Sacrifice satu per satu
    local sacrificedCount = 0
    for _, uuid in ipairs(fishToSacrifice) do
        if not AtlantisConfig.IsRunning then break end
        local ok = pcall(function() sacrificeRemote:InvokeServer(uuid) end)
        if ok then sacrificedCount = sacrificedCount + 1 end
        task.wait(0.25)
    end

    task.wait(1)

    -- Sell all setelah sacrifice
    if sellAllRemote then
        pcall(function() sellAllRemote:InvokeServer() end)
        NotifyInfo("Atlantis", "Sell all dikirim!")
        task.wait(0.5)
    end

    -- Fire effect
    if effectRemote then
        pcall(function() FireLocalEvent(effectRemote) end)
    end

    NotifySuccess("Atlantis", "✓ Sacrifice " .. sacrificedCount .. " ikan berhasil!")
    task.wait(1.5)

    return sacrificedCount > 0
end

local function RunAutoAtlantisMachine()
    if AtlantisConfig.MachineThread then
        pcall(function() task.cancel(AtlantisConfig.MachineThread) end)
        AtlantisConfig.MachineThread = nil
    end
    AtlantisConfig.IsRunning = true

    -- SAVE ORIGINAL POSITION
    local originalPos = nil
    local hrp = getHRP()
    if hrp then originalPos = hrp.CFrame end

    AtlantisConfig.MachineThread = task.spawn(function()
        while AtlantisConfig.AutoAtlantisMachine and AtlantisConfig.IsRunning do
            local ok, err = pcall(function()
                local fishCount = GetAtlantisFishCount()
                if fishCount < 5 then
                    NotifyInfo("Atlantis", "Fish kurang (" .. fishCount .. "/5). Menunggu...")
                    task.wait(5)
                    return
                end
                NotifyInfo("Atlantis", "Fish cukup! (" .. fishCount .. ") Mulai sacrifice...")
                SacrificeAllFishToAtlantis()
            end)
            if not ok then
                warn("[QH] Atlantis error: " .. tostring(err))
            end
            if not AtlantisConfig.AutoAtlantisMachine then break end
            task.wait(5)
        end

        -- RESTORE ORIGINAL POSITION
        if originalPos then
            local h = getHRP()
            if h then
                h.CFrame = originalPos
                NotifySuccess("Atlantis", "Kembali ke posisi semula!")
            end
        end
        AtlantisConfig.IsRunning = false
        NotifyInfo("Atlantis", "Auto Atlantis Machine berhenti.")
    end)
end

local function StopAutoAtlantisMachine()
    AtlantisConfig.AutoAtlantisMachine = false
    AtlantisConfig.IsRunning = false
    if AtlantisConfig.MachineThread then
        pcall(function() task.cancel(AtlantisConfig.MachineThread) end)
        AtlantisConfig.MachineThread = nil
    end
    NotifyWarning("Atlantis", "Dimatikan.")
end

-- ========== PET & EGG SYSTEM ==========
local PetEggConfig = {
    AutoHatch = false,
    AutoHatchThread = nil,
    SelectedEggType = "Founder",
    HatchAmount = 1,
    InstantHatchEnabled = false,
    AutoEquipBest = false,
}

local function PurchaseEgg(eggType, amount)
    if not Events.PurchaseEgg then
        Events.PurchaseEgg = GetServerRemote("RF/Pets/PurchaseEgg")
    end
    if not Events.PurchaseEgg then
        NotifyError("Egg", "Remote PurchaseEgg tidak ditemukan!")
        return 0
    end
    local bought = 0
    for i = 1, amount do
        local ok = pcall(function()
            Events.PurchaseEgg:InvokeServer(eggType)
        end)
        if ok then
            bought = bought + 1
        else
            break
        end
        task.wait(0.3)
    end
    return bought
end

local function OpenEgg(eggType)
    if not Events.OpenEgg then
        Events.OpenEgg = GetServerRemote("RF/Pets/OpenEgg")
    end
    if not Events.OpenEgg then
        NotifyError("Egg", "Remote OpenEgg tidak ditemukan!")
        return false
    end
    local ok = pcall(function()
        Events.OpenEgg:InvokeServer(eggType)
    end)
    return ok
end

local function StartEgg()
    if not Events.StartEgg then
        Events.StartEgg = GetServerRemote("RF/Pets/StartEgg")
    end
    if not Events.StartEgg then return false end
    local ok = pcall(function() Events.StartEgg:InvokeServer() end)
    return ok
end

local function OpenReadyEgg()
    if not Events.OpenReadyEgg then
        Events.OpenReadyEgg = GetServerRemote("RF/Pets/OpenReadyEgg")
    end
    if not Events.OpenReadyEgg then return false end
    local ok = pcall(function() Events.OpenReadyEgg:InvokeServer() end)
    return ok
end

local function InstantHatch()
    if not Events.InstantHatch then
        Events.InstantHatch = GetServerRemote("RF/Pets/InstantHatch")
    end
    if not Events.InstantHatch then
        NotifyError("Hatch", "Remote InstantHatch tidak ditemukan!")
        return false
    end
    local ok = pcall(function() Events.InstantHatch:InvokeServer() end)
    if ok then
        NotifySuccess("Hatch", "Instant Hatch berhasil!")
    end
    return ok
end

local function EquipPet(petUUID)
    if not Events.PetEquip then
        Events.PetEquip = GetServerRemote("RF/Pets/Equip")
    end
    if not Events.PetEquip then return false end
    local ok = pcall(function() Events.PetEquip:InvokeServer(petUUID) end)
    return ok
end

local function UnequipPet(petUUID)
    if not Events.PetUnequip then
        Events.PetUnequip = GetServerRemote("RF/Pets/Unequip")
    end
    if not Events.PetUnequip then return false end
    local ok = pcall(function() Events.PetUnequip:InvokeServer(petUUID) end)
    return ok
end

local function RenamePet(petUUID, newName)
    if not Events.PetRename then
        Events.PetRename = GetServerRemote("RF/Pets/Rename")
    end
    if not Events.PetRename then return false end
    local ok = pcall(function() Events.PetRename:InvokeServer(petUUID, newName) end)
    return ok
end

local function RunAutoHatch()
    if PetEggConfig.AutoHatchThread then
        pcall(function() task.cancel(PetEggConfig.AutoHatchThread) end)
        PetEggConfig.AutoHatchThread = nil
    end
    PetEggConfig.AutoHatchThread = task.spawn(function()
        while PetEggConfig.AutoHatch do
            local ok, err = pcall(function()
                local purchased = PurchaseEgg(PetEggConfig.SelectedEggType, PetEggConfig.HatchAmount)
                if purchased > 0 then
                    NotifyInfo("Auto Hatch", "Purchased " .. purchased .. " " .. PetEggConfig.SelectedEggType .. " Egg(s)")
                    task.wait(0.5)
                end
                if Events.OpenEgg then
                    pcall(function() Events.OpenEgg:InvokeServer(PetEggConfig.SelectedEggType) end)
                    task.wait(0.3)
                end
                if Events.StartEgg then
                    pcall(function() Events.StartEgg:InvokeServer() end)
                    task.wait(0.3)
                end
                if Events.OpenReadyEgg then
                    pcall(function() Events.OpenReadyEgg:InvokeServer() end)
                    task.wait(0.3)
                end
                if PetEggConfig.InstantHatchEnabled and Events.InstantHatch then
                    pcall(function() Events.InstantHatch:InvokeServer() end)
                end
            end)
            if not ok then
                warn("[QH] AutoHatch error: " .. tostring(err))
            end
            task.wait(2)
        end
    end)
end

local function StopAutoHatch()
    PetEggConfig.AutoHatch = false
    if PetEggConfig.AutoHatchThread then
        pcall(function() task.cancel(PetEggConfig.AutoHatchThread) end)
        PetEggConfig.AutoHatchThread = nil
    end
    NotifyWarning("Auto Hatch", "Dimatikan.")
end

-- Founder Egg specific (paid egg)
local FounderEggConfig = {
    AutoBuy = false,
    IsRunning = false,
    Thread = nil,
    EggLocation = CFrame.new(-4295.189453125, 23.265548706054688, 649.7577514648438, -0.6710231304168701, -7.244620547908198e-08, 0.7414363622665405, -1.815789296699677e-08, 1, 8.127715744876696e-08, -0.7414363622665405, 4.1075931989098535e-08, -0.6710231304168701),
}

local function BuyFounderEgg(amount)
    if not Events.PurchaseEgg then
        Events.PurchaseEgg = GetServerRemote("RF/Pets/PurchaseEgg")
    end
    if not Events.PurchaseEgg then
        NotifyError("Founder Egg", "Remote PurchaseEgg tidak ditemukan!")
        return false
    end
    local bought = 0
    for i = 1, amount do
        local ok = pcall(function()
            Events.PurchaseEgg:InvokeServer("Founder")
        end)
        if ok then
            bought = bought + 1
            NotifySuccess("Founder Egg", "Berhasil beli Founder Egg! (" .. bought .. "/" .. amount .. ")")
        else
            NotifyWarning("Founder Egg", "Gagal beli egg ke-" .. i)
            break
        end
        task.wait(0.5)
    end
    return bought > 0
end

local function RunAutoBuyFounderEgg()
    if FounderEggConfig.Thread then
        pcall(function() task.cancel(FounderEggConfig.Thread) end)
        FounderEggConfig.Thread = nil
    end
    FounderEggConfig.IsRunning = true
    FounderEggConfig.Thread = task.spawn(function()
        while FounderEggConfig.AutoBuy and FounderEggConfig.IsRunning do
            local ok, err = pcall(function()
                local hrp = getHRP()
                if hrp then
                    hrp.CFrame = FounderEggConfig.EggLocation + Vector3.new(0, 5, 0)
                end
                task.wait(1)
                BuyFounderEgg(Config.FounderEggAmount or 1)
            end)
            if not ok then
                warn("[QH] FounderEgg error: " .. tostring(err))
            end
            task.wait(5)
        end
        FounderEggConfig.IsRunning = false
    end)
end

local function StopAutoBuyFounderEgg()
    FounderEggConfig.AutoBuy = false
    FounderEggConfig.IsRunning = false
    if FounderEggConfig.Thread then
        pcall(function() task.cancel(FounderEggConfig.Thread) end)
        FounderEggConfig.Thread = nil
    end
    NotifyWarning("Founder Egg", "Auto-buy dimatikan.")
end

-- ========== [BARU] AUTO CRAFTING ==========
local CraftingConfig = {
    RecipeList = {},
    SelectedRecipeId = nil,
    AutoCraftDelay = 2.0,
}

local function GetCraftingRecipes()
    local recipes = {}
    pcall(function()
        local craftingModule = ReplicatedStorage:FindFirstChild("Shared") and ReplicatedStorage.Shared:FindFirstChild("CraftingRecipes")
        if craftingModule then
            local data = require(craftingModule)
            for id, recipe in pairs(data) do
                table.insert(recipes, {Id=id, Name=recipe.Name or tostring(id)})
            end
        end
    end)
    return recipes
end

local function RunAutoCrafting()
    if Tasks.CraftingThread then pcall(function() task.cancel(Tasks.CraftingThread) end); Tasks.CraftingThread = nil end
    Tasks.CraftingThread = task.spawn(function()
        while Config.AutoCrafting do
            local ok, err = pcall(function()
                if not Events.StartCrafting then Events.StartCrafting = GetServerRemote("RF/StartCrafting") end
                if not Events.ConfirmCrafting then Events.ConfirmCrafting = GetServerRemote("RF/ConfirmCrafting") end
                if not Events.InstantCraft then Events.InstantCraft = GetServerRemote("RE/InstantCraft") end
                if not Events.StartCrafting then return end
                -- Mulai crafting dengan recipe yang dipilih
                if CraftingConfig.SelectedRecipeId then
                    pcall(function() Events.StartCrafting:InvokeServer(CraftingConfig.SelectedRecipeId) end)
                    task.wait(CraftingConfig.AutoCraftDelay)
                    -- Instant craft jika tersedia
                    if Events.InstantCraft then
                        pcall(function() Events.InstantCraft:FireServer() end)
                        NotifySuccess("Auto Craft", "Instant Craft berhasil!")
                    elseif Events.ConfirmCrafting then
                        pcall(function() Events.ConfirmCrafting:InvokeServer() end)
                        NotifySuccess("Auto Craft", "Crafting selesai!")
                    end
                else
                    -- Jika tidak ada recipe dipilih, coba crafting umum
                    pcall(function() Events.StartCrafting:InvokeServer() end)
                    task.wait(CraftingConfig.AutoCraftDelay)
                    if Events.ConfirmCrafting then pcall(function() Events.ConfirmCrafting:InvokeServer() end) end
                end
            end)
            if not ok then warn("[QH] AutoCrafting error: " .. tostring(err)) end
            task.wait(Config.CraftingDelay)
        end
    end)
end

-- ===== HELPER: Ambil list ikan dari inventory =====
local function GetFishList()
    local list = {}
    local groups = {}
    pcall(function()
        local replion = GetPlayerDataReplion()
        if not replion then return end
        local inv = replion:GetExpect("Inventory")
        if not inv or not inv.Items then return end
        for _, item in ipairs(inv.Items) do
            if item.UUID and IsFishItem(item) then
                local name, rarity = GetFishNameAndRarity(item)
                -- HANYA tampilkan SECRET, FORGOTTEN, MYTHIC
                local allowed = {SECRET=true, FORGOTTEN=true, MYTHIC=true, Mythic=true}
                if not allowed[rarity] then continue end
                local key = name .. "|" .. rarity
                if not groups[key] then
                    groups[key] = {
                        UUID    = item.UUID,
                        Name    = name,
                        Rarity  = rarity,
                        Count   = 0,
                        Items   = {},
                    }
                end
                groups[key].Count = groups[key].Count + 1
                table.insert(groups[key].Items, item.UUID)
            end
        end
    end)
    for key, group in pairs(groups) do
        group.Display = group.Name .. " [" .. group.Rarity .. "] x" .. group.Count
        table.insert(list, group)
    end
    -- sort: rarity desc then name asc
    local rarityOrder = {FORGOTTEN=8,SECRET=7,MYTHIC=6,Mythic=6,Legendary=5,Epic=4,Rare=3,Uncommon=2,Common=1}
    table.sort(list, function(a,b)
        local ra = rarityOrder[a.Rarity] or 0
        local rb = rarityOrder[b.Rarity] or 0
        if ra ~= rb then return ra > rb end
        return a.Name < b.Name
    end)
    return list
end



-- ========== WALK ON WATER ==========
local walkOnWaterConn, waterPlatform = nil, nil
local function SetWalkOnWater(val)
    Config.WalkOnWater = val
    if walkOnWaterConn then walkOnWaterConn:Disconnect(); walkOnWaterConn = nil end
    if waterPlatform then pcall(function() waterPlatform:Destroy() end); waterPlatform = nil end
    if val then
        waterPlatform = Instance.new("Part")
        waterPlatform.Name = "QH_WaterWalkPlatform"; waterPlatform.Size = Vector3.new(12, 0.5, 12)
        waterPlatform.Transparency = 1; waterPlatform.CanCollide = true; waterPlatform.Anchored = true
        waterPlatform.Parent = Workspace
        local rayParams = RaycastParams.new()
        rayParams.FilterType = Enum.RaycastFilterType.Blacklist
        rayParams.IgnoreWater = false
        walkOnWaterConn = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character; if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
            rayParams.FilterDescendantsInstances = {char, waterPlatform}
            -- Raycast ke bawah dari player
            local result = Workspace:Raycast(hrp.Position + Vector3.new(0, 5, 0), Vector3.new(0, -25, 0), rayParams)
            local isOnWater, waterY = false, nil
            if result then
                local hit = result.Instance
                if hit then
                    local hitName = hit.Name:lower()
                    -- Detect water by name, material, or transparency
                    if hitName:find("water") or hitName:find("ocean") or hitName:find("sea") or hitName:find("lake") then
                        isOnWater = true; waterY = result.Position.Y
                    elseif result.Material == Enum.Material.Water then
                        isOnWater = true; waterY = result.Position.Y
                    elseif hit.Transparency > 0.7 and hit.CanCollide == false then
                        -- Likely water part
                        isOnWater = true; waterY = result.Position.Y
                    end
                end
            end
            -- Fallback: if player is low enough, assume water
            if not isOnWater and hrp.Position.Y <= 5 then
                isOnWater = true; waterY = 0
            end
            if isOnWater and waterY then
                waterPlatform.Position = Vector3.new(hrp.Position.X, waterY + 0.3, hrp.Position.Z)
                waterPlatform.CanCollide = true
            else
                waterPlatform.CanCollide = false
                waterPlatform.Position = Vector3.new(0, -500, 0)
            end
        end)
        NotifySuccess("Walk on Water", "Aktif! Platform akan muncul di atas air.")
    else
        NotifyInfo("Walk on Water", "Nonaktif.")
    end
end

-- ========== CUSTOM NAME ==========
local originalDisplayName = LocalPlayer.DisplayName
local customNameActive = false
local customNameCharConnection, customNameDescendantConnection = nil, nil

local function updateCharacterName(char, name)
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid"); if hum then pcall(function() hum.DisplayName = name end) end
    for _, obj in pairs(char:GetDescendants()) do
        if obj:IsA("BillboardGui") then for _, child in pairs(obj:GetDescendants()) do if child:IsA("TextLabel") then pcall(function() child.Text = name end) end end
        elseif obj:IsA("TextLabel") and obj.Parent and obj.Parent.Name == "Head" then pcall(function() obj.Text = name end) end
    end
end

local function ApplyCustomName(name)
    if not name or name == "" then NotifyError("Custom Name", "Nama tidak boleh kosong!"); return end
    customNameActive = true; _G.CustomNameText = name
    pcall(function() LocalPlayer.DisplayName = name end)
    if customNameDescendantConnection then pcall(function() customNameDescendantConnection:Disconnect() end) end
    if customNameCharConnection then pcall(function() customNameCharConnection:Disconnect() end) end
    local char = LocalPlayer.Character
    if char then
        updateCharacterName(char, name)
        pcall(function() customNameDescendantConnection = char.DescendantAdded:Connect(function() if customNameActive then task.wait(0.1); updateCharacterName(char, _G.CustomNameText) end end) end)
    end
    pcall(function()
        customNameCharConnection = LocalPlayer.CharacterAdded:Connect(function(newChar)
            task.wait(0.5); if customNameActive then
                updateCharacterName(newChar, _G.CustomNameText)
                if customNameDescendantConnection then pcall(function() customNameDescendantConnection:Disconnect() end) end
                pcall(function() customNameDescendantConnection = newChar.DescendantAdded:Connect(function() if customNameActive then task.wait(0.1); updateCharacterName(newChar, _G.CustomNameText) end end) end)
            end
        end)
    end)
    NotifySuccess("Custom Name", "Nama berubah jadi: " .. name)
end

local function RemoveCustomName()
    customNameActive = false; _G.CustomNameText = nil
    pcall(function() LocalPlayer.DisplayName = originalDisplayName end)
    local char = LocalPlayer.Character; if char then updateCharacterName(char, originalDisplayName) end
    if customNameDescendantConnection then pcall(function() customNameDescendantConnection:Disconnect() end); customNameDescendantConnection = nil end
    if customNameCharConnection then pcall(function() customNameCharConnection:Disconnect() end); customNameCharConnection = nil end
    NotifyInfo("Custom Name", "Nama asli dikembalikan.")
end

local _hiddenTag = false
local function SetHideNametag(val)
    _hiddenTag = val
    local char = LocalPlayer.Character; if not char then return end
    local function processChar(c)
        for _, obj in pairs(c:GetDescendants()) do
            if obj:IsA("BillboardGui") or (obj:IsA("TextLabel") and obj.Parent and obj.Parent.Name == "Head") then
                pcall(function() obj.Enabled = not val end)
            end
        end
    end
    processChar(char)
    pcall(function() LocalPlayer.CharacterAdded:Connect(function(newChar) task.wait(1); if _hiddenTag then processChar(newChar) end end) end)
    if val then NotifySuccess("Hide Nametag", "Nama tersembunyi!") else NotifyInfo("Hide Nametag", "Nama terlihat.") end
end

-- ========== EMOTE ==========
local emoteList = {
    ["Wave"]="rbxassetid://507770239",["Dance"]="rbxassetid://507771019",["Dance 2"]="rbxassetid://507776043",
    ["Dance 3"]="rbxassetid://507777813",["Laugh"]="rbxassetid://507770818",["Point"]="rbxassetid://507770453",
    ["Cheer"]="rbxassetid://507770677",["Stadium"]="rbxassetid://3360686087",
}
local function PlayEmote(emoteName)
    local animId = emoteList[emoteName]; if not animId then NotifyError("Emote", "Emote tidak ditemukan!"); return end
    local char = LocalPlayer.Character; if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    local anim = Instance.new("Animation"); anim.AnimationId = animId
    local track = hum:LoadAnimation(anim)
    if track then track:Play(); NotifySuccess("Emote", "'" .. emoteName .. "' dimainkan!")
    else NotifyError("Emote", "Gagal load animasi!") end
end

-- ========== NO ANIMATION ==========
_G.NoAnimationEnabled = false
local noAnimConnection, noAnimCharConnection = nil, nil
local function StopAllAnimations(char)
    local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    local anim = hum:FindFirstChildOfClass("Animator")
    if anim then for _, track in ipairs(anim:GetPlayingAnimationTracks()) do pcall(function() track:Stop(0) end) end end
end
local function SetupNoAnimation(char)
    if not _G.NoAnimationEnabled then return end
    local hum = char:WaitForChild("Humanoid", 5); if not hum then return end
    StopAllAnimations(char)
    if noAnimConnection then pcall(function() noAnimConnection:Disconnect() end) end
    pcall(function()
        noAnimConnection = hum.AnimationPlayed:Connect(function(track)
            if _G.NoAnimationEnabled then pcall(function() track:Stop(0) end) end
        end)
    end)
end

-- ========== AUTO EVENT ==========
local function RunAutoEvent()
    Tasks.AutoEventThread = task.spawn(function()
        while Config.AutoEvent do
            pcall(function()
                local hrp = getHRP(); if not hrp then return end
                local zones = workspace:FindFirstChild("Zones"); if not zones then return end
                local lev = zones:FindFirstChild("Leviathan's Den")
                if lev then hrp.CFrame = CFrame.new(3474.053, -287.775, 3472.634); task.wait(1) end
                local thunder = zones:FindFirstChild("Ancient Jungle")
                if thunder then hrp.CFrame = CFrame.new(2067.866, 2.028, 10.831); task.wait(1) end
            end)
            task.wait(5)
        end
    end)
end

-- ========== DISABLE OBTAINED ==========
local function SetDisableObtained(val)
    Config.DisableObtained = val
    if val then
        pcall(function() if origPlaySmallItemObtained and Controllers.Notification then Controllers.Notification.PlaySmallItemObtained = function() return end end end)
        NotifySuccess("Disable Obtained", "Notif obtained diblokir!")
    else
        pcall(function() if origPlaySmallItemObtained and Controllers.Notification then Controllers.Notification.PlaySmallItemObtained = origPlaySmallItemObtained end end)
        NotifyInfo("Disable Obtained", "Notif obtained normal.")
    end
end

-- ========== FISH NOTIF HOOK ==========
local _fishNotifConnected = false
task.spawn(function()
    task.wait(3)
    if Events.fishNotif and not _fishNotifConnected then
        _fishNotifConnected = true
        pcall(function()
            Events.fishNotif.OnClientEvent:Connect(function(...)
                local args = {...}
                _G.SavedData.FishNotif = args
                lastValidFishNotif = deepCopyArr(args)
                lastTimeFishCaught = os.clock(); isCaught = true
                _sessionCatchCount = _sessionCatchCount + 1
                table.insert(_lastCatchTimestamps, tick())
                if #_lastCatchTimestamps > 60 then table.remove(_lastCatchTimestamps, 1) end
                if Config.UB.Active and not Config.amblatant then return end
                local dummyItem = {Id=args[1], Metadata=args[2]}
                local fishName, fishRarity = "", "COMMON"
                pcall(function()
                    if ItemUtility then local data = ItemUtility:GetItemData(dummyItem.Id); if data and data.Data and data.Data.Name then fishName = data.Data.Name end end
                    if dummyItem.Metadata and dummyItem.Metadata.Rarity then fishRarity = dummyItem.Metadata.Rarity end
                end)
                local weight = string.format("%.2fkg", (args[2] and args[2].Weight) or 0)
                if Config.CustomWebhook and Config.CustomWebhookUrl ~= "" then
                    if typeof(args[3]) == "table" and args[3].InventoryItem and args[3].InventoryItem.UUID then
                        pcall(function()
                            local payload = HttpService:JSONEncode({
                                username = "Quantum HUB",
                                embeds = {{
                                    title = "Fish Caught!",
                                    color = 0x00aaff,
                                    fields = {
                                        {name="Fish",value=tostring(fishName),inline=true},
                                        {name="Rarity",value=tostring(fishRarity),inline=true},
                                        {name="Weight",value=tostring(weight),inline=true},
                                    },
                                    footer = {text = "Quantum HUB V3"}
                                }}
                            })
                            if typeof(request) == "function" then
                                request({Url=Config.CustomWebhookUrl, Method="POST", Headers={["Content-Type"]="application/json"}, Body=payload})
                            end
                        end)
                    end
                end
            end)
        end)
    end
end)

local _exclaimConnected = false
task.spawn(function()
    task.wait(2)
    if Events.exclaimEvent and not _exclaimConnected then
        _exclaimConnected = true
        pcall(function()
            Events.exclaimEvent.OnClientEvent:Connect(function(data)
                if not Config.AutoCatch and not Config.autoFishing then return end
                if not data or not data.TextData then return end
                if data.TextData.EffectType ~= "Exclaim" then return end
                local container = data.Container; if not container then return end
                local char = LocalPlayer.Character; if not char then return end
                local head = char:FindFirstChild("Head"); if not head or container ~= head then return end
                safeFire(function()
                    task.wait(math.max(Config.CatchDelay, 0.3))
                    for i = 1, 5 do
                        if Events.fishing then pcall(function() Events.fishing:InvokeServer() end) end
                        if Events.fishingRE then pcall(function() Events.fishingRE:FireServer() end) end
                        task.wait(0.05)
                    end
                end)
            end)
        end)
    end
end)

-- ========== TRADING BACKEND ==========
local TradeConfig = {
    AutoAcceptTrade=false, TradeEnchantStone=false, SelectedStoneType="Normal", EnchantStoneAmount=1,
    TradeByRarity=false, SelectedTradeRarity="Common", TradeRarityAmount=1,
    TradeByCoin=false, TargetCoins=0, TradeByName=false, SelectedTradeItem=nil, TradeNameAmount=1,
    SelectedTargetPlayer=nil, TradeStatus="Idle", CurrentTradeSession=nil, InventoryItems={}, EnchantStones={},
}
local TradeRemotes = {}
local function LoadTradeRemotes()
    TradeRemotes.SendTradeOffer = GetServerRemote("RF/Trading/SendTradeOffer")
    TradeRemotes.AcceptTradeOffer = GetServerRemote("RF/Trading/AcceptTradeOffer")
    TradeRemotes.DeclineTradeOffer = GetServerRemote("RF/Trading/DeclineTradeOffer")
    TradeRemotes.AddItem = GetServerRemote("RF/Trading/AddItem")
    TradeRemotes.RemoveItem = GetServerRemote("RF/Trading/RemoveItem")
    TradeRemotes.SetTokens = GetServerRemote("RF/Trading/SetTokens")
    TradeRemotes.SetReady = GetServerRemote("RF/Trading/SetReady")
    TradeRemotes.ConfirmTrade = GetServerRemote("RF/Trading/ConfirmTrade")
    TradeRemotes.CancelTrade = GetServerRemote("RF/Trading/CancelTrade")
    TradeRemotes.InitiateTrade = GetServerRemote("RF/InitiateTrade")
    TradeRemotes.CanSendTrade = GetServerRemote("RF/CanSendTrade")
    TradeRemotes.TradeOfferReceived = GetServerRemote("RE/Trading/TradeOfferReceived")
    TradeRemotes.TradeStarted = GetServerRemote("RE/Trading/TradeStarted")
    TradeRemotes.TradeEnded = GetServerRemote("RE/Trading/TradeEnded")
    TradeRemotes.TradeCompleted = GetServerRemote("RE/Trading/TradeCompleted")
end
pcall(LoadTradeRemotes)

local autoAcceptConn = nil
local function SetupAutoAcceptTrade()
    if autoAcceptConn then pcall(function() autoAcceptConn:Disconnect() end); autoAcceptConn = nil end
    if TradeRemotes.TradeOfferReceived and TradeRemotes.TradeOfferReceived:IsA("RemoteEvent") then
        pcall(function()
            autoAcceptConn = TradeRemotes.TradeOfferReceived.OnClientEvent:Connect(function()
                if not TradeConfig.AutoAcceptTrade then return end
                pcall(function() if TradeRemotes.AcceptTradeOffer then TradeRemotes.AcceptTradeOffer:InvokeServer(); NotifySuccess("Auto Accept", "Trade diterima!") end end)
            end)
        end)
    end
end

local function ScanTradeInventory()
    TradeConfig.InventoryItems = {}; TradeConfig.EnchantStones = {}
    pcall(function()
        local replion = GetPlayerDataReplion(); if not replion then return end
        local inv = replion:GetExpect("Inventory"); if not inv or not inv.Items then return end
        for _, item in ipairs(inv.Items) do
            local name, rarity = GetFishNameAndRarity(item); local mutation = GetItemMutationString(item)
            table.insert(TradeConfig.InventoryItems, {UUID=item.UUID, Name=name, Rarity=rarity, Mutation=mutation, Id=item.Id, IsFavorite=item.IsFavorite or item.Favorited, Metadata=item.Metadata})
            if item.Id == 10 or item.Id == 558 then
                local stoneType = item.Id == 558 and "Evolved" or "Normal"
                table.insert(TradeConfig.EnchantStones, {UUID=item.UUID, Type=stoneType, Id=item.Id})
            end
        end
    end)
    return TradeConfig.InventoryItems, TradeConfig.EnchantStones
end

local function GetTradePlayerList()
    local list = {}
    for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then table.insert(list, p.Name) end end
    table.sort(list)
    return #list > 0 and list or {"Tidak ada player lain"}
end

local function ExecuteTrade(targetPlayer, itemUUIDs, coinAmount)
    if not targetPlayer then return false end
    local success = false
    pcall(function()
        if TradeRemotes.InitiateTrade then
            local canTrade = true
            if TradeRemotes.CanSendTrade then canTrade = TradeRemotes.CanSendTrade:InvokeServer(targetPlayer) end
            if canTrade then TradeRemotes.InitiateTrade:InvokeServer(targetPlayer) end
        end
        task.wait(2)
        if itemUUIDs then for _, uuid in ipairs(itemUUIDs) do if TradeRemotes.AddItem then TradeRemotes.AddItem:InvokeServer(uuid) end; task.wait(0.3) end end
        if coinAmount and coinAmount > 0 then if TradeRemotes.SetTokens then TradeRemotes.SetTokens:InvokeServer(coinAmount) end end
        task.wait(1)
        if TradeRemotes.SetReady then TradeRemotes.SetReady:InvokeServer(true) end
        task.wait(1)
        if TradeRemotes.ConfirmTrade then TradeRemotes.ConfirmTrade:InvokeServer() end
        success = true
    end)
    return success
end

local function StartTradeEnchantStone()
    if not TradeConfig.SelectedTargetPlayer or TradeConfig.SelectedTargetPlayer == "Tidak ada player lain" then NotifyError("Trade", "Pilih target player dulu!"); TradeConfig.TradeEnchantStone = false; return end
    local targetPlayer = Players:FindFirstChild(TradeConfig.SelectedTargetPlayer)
    if not targetPlayer then NotifyError("Trade", "Target player tidak ditemukan!"); TradeConfig.TradeEnchantStone = false; return end
    task.spawn(function()
        while TradeConfig.TradeEnchantStone do
            local ok, err = pcall(function()
                local _, stones = ScanTradeInventory()
                local targetStones = {}
                for _, stone in ipairs(stones) do if TradeConfig.SelectedStoneType == "All" or stone.Type == TradeConfig.SelectedStoneType then table.insert(targetStones, stone.UUID) end end
                if #targetStones < TradeConfig.EnchantStoneAmount then NotifyWarning("Trade", "Stone tidak cukup!"); task.wait(5); return end
                local uuids = {}
                for i = 1, math.min(TradeConfig.EnchantStoneAmount, #targetStones) do table.insert(uuids, targetStones[i]) end
                ExecuteTrade(targetPlayer, uuids, 0); NotifySuccess("Trade", "Enchant stone trade selesai!")
            end)
            if not ok then warn("[QH] TradeEnchantStone error: " .. tostring(err)) end
            task.wait(3)
        end
    end)
end

local function StartTradeByRarity()
    if not TradeConfig.SelectedTargetPlayer then NotifyError("Trade", "Pilih target player dulu!"); return end
    local targetPlayer = Players:FindFirstChild(TradeConfig.SelectedTargetPlayer)
    if not targetPlayer then NotifyError("Trade", "Target player tidak ditemukan!"); return end
    task.spawn(function()
        while TradeConfig.TradeByRarity do
            local ok, err = pcall(function()
                local items = ScanTradeInventory(); local targetItems = {}
                for _, item in ipairs(items) do if string.lower(item.Rarity) == string.lower(TradeConfig.SelectedTradeRarity) then table.insert(targetItems, item.UUID) end end
                if #targetItems < TradeConfig.TradeRarityAmount then NotifyWarning("Trade", "Ikan tidak cukup!"); task.wait(5); return end
                local uuids = {}
                for i = 1, math.min(TradeConfig.TradeRarityAmount, #targetItems) do table.insert(uuids, targetItems[i]) end
                ExecuteTrade(targetPlayer, uuids, 0); NotifySuccess("Trade", "Trade by rarity selesai!")
            end)
            if not ok then warn("[QH] TradeByRarity error: " .. tostring(err)) end
            task.wait(3)
        end
    end)
end

local function StartTradeByCoin()
    if not TradeConfig.SelectedTargetPlayer then NotifyError("Trade", "Pilih target player dulu!"); return end
    local targetPlayer = Players:FindFirstChild(TradeConfig.SelectedTargetPlayer)
    if not targetPlayer then NotifyError("Trade", "Target player tidak ditemukan!"); return end
    task.spawn(function()
        while TradeConfig.TradeByCoin do
            pcall(function() ExecuteTrade(targetPlayer, nil, TradeConfig.TargetCoins); NotifySuccess("Trade", "Trade " .. TradeConfig.TargetCoins .. " coins selesai!") end)
            task.wait(3)
        end
    end)
end

local function StartTradeByName()
    if not TradeConfig.SelectedTargetPlayer then NotifyError("Trade", "Pilih target player dulu!"); return end
    if not TradeConfig.SelectedTradeItem then NotifyError("Trade", "Pilih item dulu!"); return end
    local targetPlayer = Players:FindFirstChild(TradeConfig.SelectedTargetPlayer)
    if not targetPlayer then NotifyError("Trade", "Target tidak ditemukan!"); return end
    task.spawn(function()
        while TradeConfig.TradeByName do
            local ok, err = pcall(function()
                -- use grouped cache if available
                local targetUUIDs = {}
                if _G.TradeGroupedItems then
                    for _, grp in ipairs(_G.TradeGroupedItems) do
                        if grp.Name == TradeConfig.SelectedTradeItem or grp.Display == TradeConfig.SelectedTradeItem then
                            targetUUIDs = grp.Items
                            break
                        end
                    end
                end
                if #targetUUIDs == 0 then
                    -- fallback: scan raw
                    local items = ScanTradeInventory()
                    for _, item in ipairs(items) do
                        if item.Name == TradeConfig.SelectedTradeItem then table.insert(targetUUIDs, item.UUID) end
                    end
                end
                if #targetUUIDs < TradeConfig.TradeNameAmount then NotifyWarning("Trade", "Item tidak cukup! (" .. #targetUUIDs .. "/" .. TradeConfig.TradeNameAmount .. ")"); task.wait(5); return end
                local uuids = {}
                for i = 1, math.min(TradeConfig.TradeNameAmount, #targetUUIDs) do table.insert(uuids, targetUUIDs[i]) end
                ExecuteTrade(targetPlayer, uuids, 0); NotifySuccess("Trade", "Trade " .. TradeConfig.SelectedTradeItem .. " selesai!")
            end)
            if not ok then warn("[QH] TradeByName error: " .. tostring(err)) end
            task.wait(3)
        end
    end)
end

pcall(function()
    if TradeRemotes.TradeStarted then TradeRemotes.TradeStarted.OnClientEvent:Connect(function() TradeConfig.TradeStatus = "Trading..."; NotifyInfo("Trade", "Trade dimulai!") end) end
    if TradeRemotes.TradeEnded then TradeRemotes.TradeEnded.OnClientEvent:Connect(function() TradeConfig.TradeStatus = "Idle"; NotifyInfo("Trade", "Trade berakhir.") end) end
    if TradeRemotes.TradeCompleted then TradeRemotes.TradeCompleted.OnClientEvent:Connect(function() TradeConfig.TradeStatus = "Completed"; NotifySuccess("Trade", "Trade selesai!") end) end
end)

-- ============================================================
-- =================== INFO TAB ===============================
-- ============================================================
if InfoTab then
    pcall(function()
        InfoTab:Section({ Title = "Selamat datang di Quantum HUB V3.1" })
        InfoTab:Section({ Title = "Script FREE - Jangan diperjualbelikan!" })
        InfoTab:Section({ Title = "Toggle RightShift untuk Show/Hide UI" })
        InfoTab:Section({ Title = "Map: " .. (isSupported and supportedMaps["121864768012064"] or mapName) })
        InfoTab:Button({
            Title = "Discord Server", Desc = "Klik untuk copy link",
            Callback = function()
                pcall(function() if typeof(setclipboard) == "function" then setclipboard("https://discord.gg/CZVDHgHR"); NotifySuccess("Discord", "Link dicopy!") end end)
            end
        })
    end)
end

-- ============================================================
-- =================== PLAYERS TAB ============================
-- ============================================================
if PlayersTab then
    pcall(function()
        PlayersTab:Section({ Title = "Character Controls" })
        PlayersTab:Slider({ Title = "Walk Speed", Value = { Min = 16, Max = 200, Default = 16 }, Callback = function(val) local char = LocalPlayer.Character; if char then local hum = char:FindFirstChildOfClass("Humanoid"); if hum then hum.WalkSpeed = val end end end })
        PlayersTab:Slider({ Title = "Jump Power", Value = { Min = 50, Max = 500, Default = 50 }, Callback = function(val) local char = LocalPlayer.Character; if char then local hum = char:FindFirstChildOfClass("Humanoid"); if hum then hum.UseJumpPower = true; hum.JumpPower = val end end end })
        PlayersTab:Button({ Title = "Reset Speed & Jump", Callback = function() local char = LocalPlayer.Character; if char then local hum = char:FindFirstChildOfClass("Humanoid"); if hum then hum.WalkSpeed = 16; hum.UseJumpPower = true; hum.JumpPower = 50 end end; NotifySuccess("Reset", "Speed & Jump normal!") end })
        PlayersTab:Section({ Title = "Special Abilities" })
        PlayersTab:Toggle({
            Title = "Infinite Jump", Value = false,
            Callback = function(val) _G.InfiniteJump = val end
        })
        UserInputService.JumpRequest:Connect(function()
            if _G.InfiniteJump then
                local char = LocalPlayer.Character
                if char then local hum = char:FindFirstChildOfClass("Humanoid"); if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end end
            end
        end)
        PlayersTab:Toggle({
            Title = "Noclip", Value = false,
            Callback = function(val)
                _G.Noclip = val
                if val then
                    task.spawn(function()
                        while _G.Noclip do
                            task.wait(0.05)
                            local char = LocalPlayer.Character
                            if char then for _, part in pairs(char:GetDescendants()) do if part:IsA("BasePart") and part.CanCollide then part.CanCollide = false end end end
                        end
                    end)
                end
            end
        })
        local freezeConnP, frozenCFrameP
        PlayersTab:Toggle({
            Title = "Freeze Character", Value = false,
            Callback = function(val)
                if val then
                    local hrp = getHRP()
                    if hrp then
                        frozenCFrameP = hrp.CFrame; _G.FreezeCharacter = true
                        freezeConnP = RunService.Heartbeat:Connect(function() if _G.FreezeCharacter and hrp then hrp.CFrame = frozenCFrameP end end)
                    end
                else
                    _G.FreezeCharacter = false
                    if freezeConnP then pcall(function() freezeConnP:Disconnect() end); freezeConnP = nil end
                end
            end
        })
        PlayersTab:Toggle({ Title = "Walk on Water", Value = false, Callback = function(val) SetWalkOnWater(val) end })
        PlayersTab:Section({ Title = "Custom Name" })
        PlayersTab:Input({ Title = "Custom Name", Placeholder = "Masukkan nama...", Value = "", Callback = function(text) _G.PendingCustomName = text end })
        PlayersTab:Button({ Title = "Apply Custom Name", Callback = function() if _G.PendingCustomName and _G.PendingCustomName ~= "" then ApplyCustomName(_G.PendingCustomName) else NotifyError("Custom Name", "Masukkan nama dulu!") end end })
        PlayersTab:Button({ Title = "Hapus Custom Name", Callback = function() RemoveCustomName() end })
        PlayersTab:Section({ Title = "Nametag & Emote" })
        PlayersTab:Toggle({ Title = "Hide Nametag", Value = false, Callback = function(val) SetHideNametag(val) end })
        local emoteNames = {}; for n in pairs(emoteList) do table.insert(emoteNames, n) end; table.sort(emoteNames)
        local selectedEmote = emoteNames[1]
        local emoteDropdownValues = {}; for _, name in ipairs(emoteNames) do table.insert(emoteDropdownValues, { Title = name, Icon = "smile" }) end
        PlayersTab:Dropdown({ Title = "Pilih Emote", Values = emoteDropdownValues, Value = emoteDropdownValues[1], Multi = false, Callback = function(val) selectedEmote = val.Title end })
        PlayersTab:Button({ Title = "Play Emote", Callback = function() if selectedEmote then PlayEmote(selectedEmote) end end })
        PlayersTab:Section({ Title = "FreeCam" })
        PlayersTab:Slider({ Title = "FreeCam Speed", Value = { Min = 1, Max = 20, Default = 5 }, Callback = function(val) _G.FreeCamSpeed = val end })
        _G.FreeCamMode = _G.FreeCamMode or "Camera Movement"
        local freecamModeValues = {
            { Title = "Camera Movement", Icon = "camera" },
            { Title = "Character Movement", Icon = "user" }
        }
        PlayersTab:Dropdown({
            Title = "FreeCam Mode",
            Desc = "Camera = gerak kamera saja | Character = gerak karakter + kamera",
            Values = freecamModeValues,
            Value = freecamModeValues[1],
            Multi = false,
            Callback = function(val)
                _G.FreeCamMode = val.Title
                NotifyInfo("FreeCam", "Mode: " .. val.Title)
            end
        })
        PlayersTab:Toggle({
            Title = "Enable FreeCam",
            Value = false,
            Callback = function(val)
                if val then
                    if _G.FreeCamMode == "Character Movement" then
                        FreeCam.EnableCharacterMode()
                    else
                        FreeCam.Enable()
                    end
                else
                    FreeCam.Disable()
                end
            end
        })
        PlayersTab:Section({ Title = "Custom Skin Animation" })
        local customSkinNames = {"Eclipse","HolyTrident","SoulScythe","OceanicHarpoon","BinaryEdge","Vanquisher","KrampusScythe","BanHammer","CorruptionEdge","PrincessParasol"}
        local skinDropdownValues = {}; for _, name in ipairs(customSkinNames) do table.insert(skinDropdownValues, { Title = name, Icon = "sword" }) end
        PlayersTab:Dropdown({ Title = "Pilih Custom Skin", Values = skinDropdownValues, Value = skinDropdownValues[1], Multi = false, Callback = function(val) SkinAnimation.SwitchSkin(val.Title) end })
        PlayersTab:Toggle({ Title = "Enable Custom Skin Animation", Value = false, Callback = function(val) if val then SkinAnimation.Enable() else SkinAnimation.Disable() end end })
    end)
end

-- ============================================================
-- =================== MAIN TAB (AUTOMATION) ==================
-- ============================================================
if MainTab then
    pcall(function()
        MainTab:Section({ Title = "Redeem Code" })
        MainTab:Input({ Title = "Masukkan Kode", Placeholder = "Ketik kode...", Value = "", Callback = function(text) _G.PendingRedeemCode = text end })
        MainTab:Button({ Title = "Redeem Code", Callback = function()
            if not _G.PendingRedeemCode or _G.PendingRedeemCode == "" then NotifyError("Redeem", "Masukkan kode dulu!"); return end
            if not Events.RedeemCode then Events.RedeemCode = GetServerRemote("RF/RedeemCode") end
            if Events.RedeemCode then
                local ok = pcall(function() return Events.RedeemCode:InvokeServer(_G.PendingRedeemCode) end)
                if ok then NotifySuccess("Redeem", "Kode dikirim: " .. _G.PendingRedeemCode) else NotifyError("Redeem", "Gagal redeem!") end
            else NotifyError("Redeem", "Remote tidak ditemukan!") end
        end })

        MainTab:Section({ Title = "Auto Enchant" })
        local stoneTypeValues = {{ Title = "Enchant Stones", Icon = "gem" }, { Title = "Evolved Enchant Stone", Icon = "sparkles" }}
        MainTab:Dropdown({ Title = "Stone Type", Values = stoneTypeValues, Value = stoneTypeValues[1], Multi = false, Callback = function(val) _G.SelectedStoneType = val.Title end })
        local basicEnchantValues = {
            {Title="Big Hunter 1",Icon="target"},{Title="Cursed 1",Icon="skull"},{Title="Empowered 1",Icon="zap"},
            {Title="Glistening 1",Icon="star"},{Title="Gold Digger 1",Icon="coins"},{Title="Leprechaun 1",Icon="clover"},
            {Title="Prismatic 1",Icon="rainbow"},{Title="Reeler 1",Icon="anchor"},{Title="Stargazer 1",Icon="telescope"},
            {Title="Stormhunter 1",Icon="cloud-lightning"},{Title="XPerienced 1",Icon="trending-up"}
        }
        MainTab:Dropdown({ Title = "Target Enchant (Basic)", Values = basicEnchantValues, Value = basicEnchantValues[1], Multi = false, Callback = function(val) _G.TargetEnchantBasic = val.Title end })
        local evolvedEnchantValues = {
            {Title="Prismatic 1",Icon="rainbow"},{Title="Cursed 1",Icon="skull"},{Title="Gold Digger 1",Icon="coins"},
            {Title="SECRET Hunter",Icon="lock"},{Title="Shark Hunter",Icon="fish"},{Title="Stargazer II",Icon="telescope"},
            {Title="Stormhunter II",Icon="cloud-lightning"},{Title="Mutation Hunter III",Icon="dna"},{Title="Fairy Hunter 1",Icon="wand"}
        }
        MainTab:Dropdown({ Title = "Target Enchant (Evolved)", Values = evolvedEnchantValues, Value = evolvedEnchantValues[1], Multi = false, Callback = function(val) _G.TargetEnchantEvolved = val.Title end })
        MainTab:Toggle({
            Title = "Auto Enchant", Value = false,
            Callback = function(val)
                _G.AutoEnchant = val
                if val then
                    task.spawn(function()
                        -- Step 1: Teleport to Enchanting Altar
                        NotifyInfo("Auto Enchant", "Teleport ke Enchanting Altar...")
                        teleportTo("Enchanting Altar")
                        task.wait(2.5)

                        while _G.AutoEnchant do
                            local ok, err = pcall(function()
                                local targetEnchant = (_G.SelectedStoneType == "Evolved Enchant Stone") and _G.TargetEnchantEvolved or _G.TargetEnchantBasic
                                local currentId = getCurrentRodEnchant()
                                local targetId = enchantIdMap[targetEnchant]

                                -- Check if target already reached
                                if currentId == targetId then
                                    _G.AutoEnchant = false
                                    NotifySuccess("Auto Enchant", "Target tercapai: " .. targetEnchant .. "!")
                                    return
                                end

                                -- Re-TP to altar if too far
                                local hrp = getHRP()
                                if hrp then
                                    local altarPos = LOCATIONS["Enchanting Altar"].Position
                                    if (hrp.Position - altarPos).Magnitude > 40 then
                                        teleportTo("Enchanting Altar")
                                        task.wait(2)
                                    end
                                end

                                -- Refresh stone list from inventory
                                local stones = findEnchantStones()
                                if #stones == 0 then
                                    NotifyWarning("Auto Enchant", "Tidak ada " .. _G.SelectedStoneType .. " di inventory!")
                                    _G.AutoEnchant = false
                                    return
                                end

                                local stone = stones[1]
                                NotifyInfo("Auto Enchant", "Menggunakan " .. _G.SelectedStoneType .. " (" .. stone.UUID:sub(1,8) .. ")...")

                                -- Method 1: Equip stone to hotbar/hand first
                                local stoneEquipped = false
                                if Events.equipItem then
                                    pcall(function() Events.equipItem:FireServer(stone.UUID) end)
                                    task.wait(1.5)
                                    stoneEquipped = true
                                end

                                -- Method 2: If first method didn't work, try alternate equip
                                if not stoneEquipped and Events.equip then
                                    local slot = math.max(1, countHotbarSlots() - 1)
                                    pcall(function() Events.equip:InvokeServer(slot) end)
                                    task.wait(1)
                                end

                                -- Method 3: Activate altar (stone should be in hand now)
                                if Events.activateAltar then
                                    pcall(function() Events.activateAltar:FireServer() end)
                                else
                                    NotifyWarning("Auto Enchant", "Remote activateAltar tidak ditemukan!")
                                end

                                NotifyInfo("Auto Enchant", "Enchanting... Target: " .. targetEnchant)

                                -- Wait for enchant animation/server response
                                task.wait(2.5)

                                -- Re-equip rod after enchant
                                equipRod()
                                task.wait(1)
                            end)
                            if not ok then warn("[QH] AutoEnchant error: " .. tostring(err)) end
                            task.wait(2)
                        end
                    end)
                end
            end
        })
        MainTab:Button({ Title = "Teleport ke Altar", Callback = function() teleportTo("Enchanting Altar"); NotifySuccess("TP", "Berhasil ke Enchanting Altar!") end })

        MainTab:Section({ Title = "Cave & Pirate Events" })
        MainTab:Button({
            Title = "Open Mysterious Cave Wall",
            Callback = function()
                task.spawn(function()
                    if not Events.searchItemPickedUp then Events.searchItemPickedUp = GetServerRemote("RF/SearchItemPickedUp") end
                    if not Events.gainAccessToMaze then Events.gainAccessToMaze = GetServerRemote("RE/GainAccessToMaze") end
                    if not Events.searchItemPickedUp or not Events.gainAccessToMaze then NotifyError("Cave", "Remote tidak ditemukan!"); return end
                    for i = 1, 4 do pcall(function() Events.searchItemPickedUp:FireServer("TNT") end); task.wait(0.7) end
                    task.wait(1.5); pcall(function() Events.gainAccessToMaze:FireServer() end)
                    NotifySuccess("Cave Wall", "Berhasil dibuka!")
                end)
            end
        })
        MainTab:Toggle({
            Title = "Auto Open Pirate Chest", Value = false,
            Callback = function(val)
                _G.AutoOpenPirateChest = val
                if val then
                    task.spawn(function()
                        while _G.AutoOpenPirateChest do
                            pcall(function()
                                if not Events.claimPirateChest then Events.claimPirateChest = GetServerRemote("RE/ClaimPirateChest") end
                                if not Events.claimPirateChest then return end
                                local storage = workspace:FindFirstChild("PirateChestStorage"); if not storage then return end
                                local found = 0
                                for _, chest in ipairs(storage:GetChildren()) do
                                    if chest.Name:match("%x+%-%x+%-%x+%-%x+%-%x+") then
                                        pcall(function() Events.claimPirateChest:FireServer(chest.Name) end)
                                        found = found + 1; task.wait(0.5)
                                    end
                                end
                                if found > 0 then NotifySuccess("Pirate", "Claim " .. found .. " chest!") end
                            end)
                            task.wait(3)
                        end
                    end)
                end
            end
        })

        MainTab:Section({ Title = "Crystal & Cave" })
        MainTab:Button({
            Title = "Consume Cave Crystal",
            Callback = function()
                if not Events.ConsumeCaveCrystal then Events.ConsumeCaveCrystal = GetServerRemote("RF/ConsumeCaveCrystal") end
                if Events.ConsumeCaveCrystal then
                    pcall(function() Events.ConsumeCaveCrystal:InvokeServer() end)
                    task.wait(1.5); equipRod(); NotifySuccess("Cave Crystal", "Berhasil!")
                else NotifyError("Cave Crystal", "Remote tidak ditemukan!") end
            end
        })
        MainTab:Toggle({
            Title = "Auto Consume Cave Crystal", Value = false,
            Callback = function(val)
                _G.autoConsumeCaveCrystal = val
                if val then
                    if not Events.ConsumeCaveCrystal then Events.ConsumeCaveCrystal = GetServerRemote("RF/ConsumeCaveCrystal") end
                    _G.caveCrystalTask = task.spawn(function()
                        while _G.autoConsumeCaveCrystal do
                            pcall(function() if Events.ConsumeCaveCrystal then Events.ConsumeCaveCrystal:InvokeServer() end end)
                            task.wait(1.5); equipRod(); task.wait(1800)
                        end
                    end)
                    NotifySuccess("Auto Crystal", "Aktif - setiap 30 menit!")
                else
                    if _G.caveCrystalTask then pcall(function() task.cancel(_G.caveCrystalTask) end) end
                end
            end
        })

        MainTab:Section({ Title = "Fishing Radar" })
        MainTab:Toggle({
            Title = "Enable Fishing Radar", Value = false,
            Callback = function(val)
                Config.FishingRadar = val
                if not Events.UpdateFishingRadar then Events.UpdateFishingRadar = GetServerRemote("RF/UpdateFishingRadar") end
                if Events.UpdateFishingRadar then
                    pcall(function() Events.UpdateFishingRadar:InvokeServer(val) end)
                    NotifyInfo("Fishing Radar", val and "Radar aktif!" or "Radar nonaktif.")
                else NotifyError("Fishing Radar", "Remote tidak ditemukan!") end
            end
        })

        MainTab:Section({ Title = "Auto Atlantis Machine)" })
        MainTab:Toggle({
            Title = "Auto Atlantis Machine",
            Desc = "Auto: Cek ikan → TP Underwater City → Buka UI → Sacrifice → Sell → Balik fishing",
            Value = false,
            Callback = function(val)
                AtlantisConfig.AutoAtlantisMachine = val
                if val then
                    local hrp = getHRP()
                    if hrp then AtlantisConfig.LastFishingPosition = hrp.CFrame end
                    RunAutoAtlantisMachine()
                    NotifySuccess("Atlantis", "Auto Atlantis Machine aktif!")
                else
                    StopAutoAtlantisMachine()
                end
            end
        })
        MainTab:Button({
            Title = "Sacrifice Now (Manual)",
            Desc = "Sacrifice semua ikan Rare+ sekarang",
            Callback = function()
                local hrp = getHRP()
                if hrp then AtlantisConfig.LastFishingPosition = hrp.CFrame end
                task.spawn(function()
                    local success = SacrificeAllFishToAtlantis()
                    if not success then
                        NotifyError("Atlantis", "Gagal / tidak ada ikan Rare+!")
                    end
                end)
            end
        })


MainTab:Section({ Title = "Event Teleport" })
        MainTab:Button({ Title = "TP Leviathan", Callback = function() local hrp = getHRP(); if hrp then hrp.CFrame = CFrame.new(3474.053,-287.775,3472.634) end end })
        MainTab:Button({ Title = "TP Thunderzilla", Callback = function() local hrp = getHRP(); if hrp then hrp.CFrame = CFrame.new(2067.866,2.028,10.831) end end })
        MainTab:Toggle({ Title = "Auto Event TP", Value = false, Callback = function(val) Config.AutoEvent = val; if val then RunAutoEvent() else if Tasks.AutoEventThread then pcall(function() task.cancel(Tasks.AutoEventThread) end) end end end })
        MainTab:Section({ Title = "Advanced Event Teleport" })
        local eventNames = {}; for name in pairs(eventData) do table.insert(eventNames, name) end; table.sort(eventNames)
        local eventValues = {}; for _, name in ipairs(eventNames) do table.insert(eventValues, { Title = name, Icon = "swords" }) end
        MainTab:Dropdown({ Title = "Select Events", Values = eventValues, Value = {}, Multi = true, Callback = function(val) selectedEvents = {}; for _, v in ipairs(val) do table.insert(selectedEvents, v.Title) end end })
        MainTab:Toggle({
            Title = "Auto Event Teleport (Platform)", Value = false,
            Callback = function(state)
                autoEventTPEnabled = state
                if state then
                    if #selectedEvents == 0 then NotifyWarning("Event TP", "Pilih minimal 1 event!"); autoEventTPEnabled = false; return end
                    if autoEventThread then pcall(function() task.cancel(autoEventThread) end) end
                    autoEventThread = task.spawn(runMultiEventTP)
                else
                    destroyEventPlatform()
                    if autoEventThread then pcall(function() task.cancel(autoEventThread) end); autoEventThread = nil end
                end
            end
        })
    end)
end

-- ============================================================
-- =================== EXCLUSIVE TAB (QH FISHING) =============
-- ============================================================
if ExclusiveTab then
    pcall(function()
        ExclusiveTab:Section({ Title = "Quantum Fishing (Ultra Blantant)" })
        ExclusiveTab:Input({
            Title = "Complete Delay (detik)", Placeholder = "2.8671", Value = "2.8671",
            Callback = function(text)
                local num = tonumber(text); if not num or num < 1 then NotifyError("Delay", "Minimal 1 detik!"); return end
                Config.UB.Settings.CompleteDelay = math.clamp(num, 1, 10); NotifySuccess("Delay", "Set ke " .. Config.UB.Settings.CompleteDelay .. "s")
            end
        })
        ExclusiveTab:Toggle({ Title = "Quantum Fishing [Beta]", Value = false, Callback = function(val) needCast = true; onToggleUB(val) end })
        local _blatantKey = "**39****72***"
        local _blatantUnlocked = false
        
        ExclusiveTab:Toggle({ Title = "Random Cast (Anti Detection)", Value = false, Callback = function(val) Config.antiOKOK = val end })
        ExclusiveTab:Section({ Title = "Legit Fishing" })
        ExclusiveTab:Input({
            Title = "Catch Delay (detik)", Placeholder = "0.7", Value = "0.7",
            Callback = function(text)
                local num = tonumber(text); if not num then return end
                Config.CatchDelay = math.clamp(num, 0, 5)
            end
        })
        ExclusiveTab:Toggle({
            Title = "Legit Fishing (Auto Catch)", Value = false,
            Callback = function(val)
                Config.AutoCatch = val
                if val then equipRod(); CallRemote(Events.UpdateAutoFishing, true)
                else CallRemote(Events.UpdateAutoFishing, false) end
            end
        })
        ExclusiveTab:Toggle({
            Title = "Perfection Enchant", Value = false,
            Callback = function(val)
                Config.autoFishing = val
                if val then equipRod(); CallRemote(Events.UpdateAutoFishing, true)
                else CallRemote(Events.UpdateAutoFishing, false) end
            end
        })
        ExclusiveTab:Dropdown({
            Title = "Catch Quality Mode",
            Values = {{Title="Perfect",Icon="star"},{Title="Amazing",Icon="thumbs-up"},{Title="Good",Icon="check"}},
            Value = {Title="Perfect",Icon="star"}, Multi = false,
            Callback = function(val) Config.CatchQuality = val.Title end
        })
        ExclusiveTab:Section({ Title = "Auto Sell Fish" })
        local sellMethodValues = {{ Title = "Delay", Icon = "clock" }, { Title = "Count", Icon = "hash" }}
        ExclusiveTab:Dropdown({ Title = "Metode Sell", Values = sellMethodValues, Value = sellMethodValues[1], Multi = false, Callback = function(val) Config.AutoSellMethod = val.Title end })
        ExclusiveTab:Input({ Title = "Sell Value", Placeholder = "50", Value = "50", Callback = function(text) local num = tonumber(text); if num and num > 0 then Config.AutoSellValue = math.clamp(num, 1, 9999) end end })
        ExclusiveTab:Toggle({
            Title = "Enable Auto Sell", Value = false,
            Callback = function(val)
                Config.AutoSellState = val
                if val then RunAutoSellLoop()
                else if Tasks.AutoSellThread then pcall(function() task.cancel(Tasks.AutoSellThread) end) end end
            end
        })
        ExclusiveTab:Section({ Title = "Auto Favorite" })
        local rarityValues = {{Title="Common"},{Title="Uncommon"},{Title="Rare"},{Title="Epic"},{Title="Legendary"},{Title="Mythic"},{Title="SECRET"}}
        ExclusiveTab:Dropdown({ Title = "Filter Rarity", Values = rarityValues, Value = {}, Multi = true, Callback = function(val) Config.SelectedRarities = {}; for _, v in ipairs(val) do table.insert(Config.SelectedRarities, v.Title) end end })
        local mutationValues = {{Title="Galaxy"},{Title="Corrupt"},{Title="Gemstone"},{Title="Fairy Dust"},{Title="Midnight"},{Title="Color Burn"},{Title="Holographic"},{Title="Lightning"},{Title="Radioactive"},{Title="Ghost"},{Title="Gold"},{Title="Frozen"},{Title="Shiny"}}
        ExclusiveTab:Dropdown({ Title = "Filter Mutation", Values = mutationValues, Value = {}, Multi = true, Callback = function(val) Config.SelectedMutations = {}; for _, v in ipairs(val) do table.insert(Config.SelectedMutations, v.Title) end end })
        ExclusiveTab:Toggle({
            Title = "Auto Favorite", Value = false,
            Callback = function(val)
                Config.AutoFavoriteState = val
                if val then Tasks.AutoFavoriteThread = task.spawn(function() while Config.AutoFavoriteState do RunAutoFavLoop(false); task.wait(5) end end)
                else if Tasks.AutoFavoriteThread then pcall(function() task.cancel(Tasks.AutoFavoriteThread) end) end end
            end
        })
        ExclusiveTab:Toggle({
            Title = "Auto Unfavorite", Value = false,
            Callback = function(val)
                Config.AutoUnfavoriteState = val
                if val then Tasks.AutoUnfavoriteThread = task.spawn(function() while Config.AutoUnfavoriteState do RunAutoFavLoop(true); task.wait(5) end end)
                else if Tasks.AutoUnfavoriteThread then pcall(function() task.cancel(Tasks.AutoUnfavoriteThread) end) end end
            end
        })
        ExclusiveTab:Section({ Title = "Totem Controls" })
        local totemData = {["Pilih Totem"]=0,["Luck Totem"]=1,["Mutation Totem"]=2,["Shiny Totem"]=3,["Love Totem"]=5}
        local totemValues = {{Title="Pilih Totem"},{Title="Luck Totem"},{Title="Mutation Totem"},{Title="Shiny Totem"},{Title="Love Totem"}}
        ExclusiveTab:Dropdown({ Title = "Pilih Totem", Values = totemValues, Value = totemValues[1], Multi = false, Callback = function(val) Config.SelectedTotemID = totemData[val.Title] or 0 end })
        ExclusiveTab:Toggle({
            Title = "Auto Spawn Totem", Value = false,
            Callback = function(val)
                Config.AutoTotem = val
                if val then
                    Tasks.totemTask = task.spawn(function()
                        while Config.AutoTotem do
                            pcall(function()
                                local totemUUID = nil
                                pcall(function()
                                    local replion = GetPlayerDataReplion(); local inv = replion and replion:GetExpect("Inventory")
                                    if inv and inv.Totems then for _, item in ipairs(inv.Totems) do if Config.SelectedTotemID == 0 or item.Id == Config.SelectedTotemID then totemUUID = item.UUID; break end end end
                                end)
                                if totemUUID and Events.SpawnTotem then pcall(function() Events.SpawnTotem:FireServer(totemUUID) end); task.wait(3); equipRod() end
                            end)
                            task.wait(3600)
                        end
                    end)
                else if Tasks.totemTask then pcall(function() task.cancel(Tasks.totemTask) end) end end
            end
        })
        ExclusiveTab:Section({ Title = "Webhook" })
        ExclusiveTab:Toggle({ Title = "Enable Custom Webhook", Value = false, Callback = function(val) Config.CustomWebhook = val end })
        ExclusiveTab:Input({ Title = "Webhook URL", Placeholder = "https://discord.com/api/webhooks/...", Value = "", Callback = function(text) if text and text ~= "" then Config.CustomWebhookUrl = text end end })
    end)
end

-- ============================================================
-- ========== CRAFT & ABILITY TAB (BARU) ======================
-- ============================================================
if CraftAbilityTab then
    pcall(function()
        -- ===== CRAFTING SECTION =====
        CraftAbilityTab:Section({ Title = "Auto Crafting" })
        CraftAbilityTab:Input({
            Title = "Craft Delay (detik)", Placeholder = "1.5", Value = "1.5",
            Callback = function(text)
                local num = tonumber(text)
                if num and num >= 0.5 then Config.CraftingDelay = num end
            end
        })
        CraftAbilityTab:Input({
            Title = "Recipe ID (kosongkan = default)", Placeholder = "contoh: 1", Value = "",
            Callback = function(text)
                local num = tonumber(text)
                CraftingConfig.SelectedRecipeId = num
                if num then NotifyInfo("Crafting", "Recipe ID set ke: " .. num) end
            end
        })
        CraftAbilityTab:Toggle({
            Title = "Auto Crafting", Desc = "Craft item otomatis berulang", Value = false,
            Callback = function(val)
                Config.AutoCrafting = val
                if val then RunAutoCrafting(); NotifySuccess("Auto Craft", "Aktif!")
                else if Tasks.CraftingThread then pcall(function() task.cancel(Tasks.CraftingThread) end) end; NotifyWarning("Auto Craft", "Dimatikan.") end
            end
        })
        CraftAbilityTab:Button({
            Title = "Instant Craft Sekarang",
            Desc = "Trigger instant craft 1x",
            Callback = function()
                if not Events.InstantCraft then Events.InstantCraft = GetServerRemote("RE/InstantCraft") end
                if Events.InstantCraft then
                    pcall(function() Events.InstantCraft:FireServer() end)
                    NotifySuccess("Instant Craft", "Berhasil!")
                else
                    -- Coba StartCrafting + ConfirmCrafting
                    if not Events.StartCrafting then Events.StartCrafting = GetServerRemote("RF/StartCrafting") end
                    if not Events.ConfirmCrafting then Events.ConfirmCrafting = GetServerRemote("RF/ConfirmCrafting") end
                    if Events.StartCrafting then
                        task.spawn(function()
                            pcall(function() Events.StartCrafting:InvokeServer() end)
                            task.wait(1)
                            if Events.ConfirmCrafting then pcall(function() Events.ConfirmCrafting:InvokeServer() end) end
                        end)
                        NotifySuccess("Craft", "Crafting manual dikirim!")
                    else NotifyError("Craft", "Remote tidak ditemukan!") end
                end
            end
        })
        CraftAbilityTab:Button({
            Title = "Cancel Crafting",
            Callback = function()
                if not Events.CancelCrafting then Events.CancelCrafting = GetServerRemote("RF/CancelCrafting") end
                if Events.CancelCrafting then pcall(function() Events.CancelCrafting:InvokeServer() end); NotifyInfo("Craft", "Crafting dibatalkan!")
                else NotifyError("Craft", "Remote tidak ditemukan!") end
            end
        })

    end)
end


if AquariumTab then
    pcall(function()

        local AquariumRemotes = {}
        local function LoadAquariumRemotes()
            AquariumRemotes.GetState        = GetServerRemote("RF/AquariumGetState")
            AquariumRemotes.GetDirectory    = GetServerRemote("RF/AquariumGetDirectory")
            AquariumRemotes.SetPublic       = GetServerRemote("RF/AquariumSetPublic")
            AquariumRemotes.Like            = GetServerRemote("RF/AquariumLike")
            AquariumRemotes.UnlockZone      = GetServerRemote("RF/AquariumUnlockZone")
            AquariumRemotes.UnlockTank      = GetServerRemote("RF/AquariumUnlockTank")
            AquariumRemotes.SetTankFish     = GetServerRemote("RF/AquariumSetTankFish")
            AquariumRemotes.RemoveTankFish  = GetServerRemote("RF/AquariumRemoveTankFish")
            AquariumRemotes.PinShelfItem    = GetServerRemote("RF/AquariumPinShelfItem")
            AquariumRemotes.RequestVisit    = GetServerRemote("RF/AquariumRequestVisit")
            AquariumRemotes.VisitLoaded     = GetServerRemote("RF/AquariumVisitLoaded")
            AquariumRemotes.LeaveVisit      = GetServerRemote("RF/AquariumLeaveVisit")
            AquariumRemotes.StateUpdated    = GetServerRemote("RE/AquariumStateUpdated")
            AquariumRemotes.LoadVisit       = GetServerRemote("RE/AquariumLoadVisit")
            AquariumRemotes.VisitEnded      = GetServerRemote("RE/AquariumVisitEnded")

            AquariumRemotes.OpenTankUI = net and net:FindFirstChild(
                "RF/043b17085598df264eeb7c6ab6d4b07bf93d612443347731fa90186c1758b35c"
            )
        end
        LoadAquariumRemotes()

        -- STATE
        local AquaMgr = {
            SelectedTank = 1,       
            SelectedFishUUID = nil, 
            AutoManage = false,
            Thread = nil,
        }

        -- HELPER: Buka UI
        local function OpenTankUI(tankIndex)
            -- tankIndex: 1, 2, atau 3
            if AquariumRemotes.OpenTankUI then
                -- Coba invoke dengan index tank sebagai argumen
                local ok, result = pcall(function()
                    return AquariumRemotes.OpenTankUI:InvokeServer(tankIndex)
                end)
                if ok then
                    NotifySuccess("Aquarium", "Tank " .. tankIndex .. " UI dibuka!")
                    return true
                end
            end
            -- Fallback: pakai AquariumUnlockTank
            if AquariumRemotes.UnlockTank then
                pcall(function()
                    AquariumRemotes.UnlockTank:InvokeServer(tankIndex)
                end)
                NotifyInfo("Aquarium", "Unlock Tank " .. tankIndex .. " dikirim.")
                return true
            end
            NotifyError("Aquarium", "Remote Tank UI tidak ditemukan!")
            return false
        end

        -- 
        local function SetFishToTank(tankIndex, fishUUID)
            if not fishUUID then
                NotifyError("Aquarium", "Pilih ikan dulu!")
                return false
            end
            if not AquariumRemotes.SetTankFish then
                AquariumRemotes.SetTankFish = GetServerRemote("RF/AquariumSetTankFish")
            end
            if not AquariumRemotes.SetTankFish then
                NotifyError("Aquarium", "Remote SetTankFish tidak ditemukan!")
                return false
            end
            local ok = pcall(function()
                AquariumRemotes.SetTankFish:InvokeServer(tankIndex, fishUUID)
            end)
            if ok then
                NotifySuccess("Aquarium", "Ikan masuk ke Tank " .. tankIndex .. "!")
                return true
            end
            NotifyError("Aquarium", "Gagal memasukkan ikan!")
            return false
        end

        -- 
        local function RemoveFishFromTank(tankIndex)
            if not AquariumRemotes.RemoveTankFish then
                AquariumRemotes.RemoveTankFish = GetServerRemote("RF/AquariumRemoveTankFish")
            end
            if not AquariumRemotes.RemoveTankFish then
                NotifyError("Aquarium", "Remote tidak ditemukan!"); return
            end
            pcall(function()
                AquariumRemotes.RemoveTankFish:InvokeServer(tankIndex)
            end)
            NotifyInfo("Aquarium", "Ikan di Tank " .. tankIndex .. " dihapus.")
        end

        -- 
        local function EnterAquariumManager()
            -- Request visit / load aquarium
            if AquariumRemotes.RequestVisit then
                local ok, result = pcall(function()
                    return AquariumRemotes.RequestVisit:InvokeServer(LocalPlayer.UserId)
                end)
                if ok then
                    task.wait(1.5)
                    if AquariumRemotes.VisitLoaded then
                        pcall(function()
                            AquariumRemotes.VisitLoaded:InvokeServer()
                        end)
                    end
                    NotifySuccess("Aquarium", "Berhasil masuk Aquarium Manager!")
                    return true
                end
            end
            -- Fallback: GetState untuk refresh
            if AquariumRemotes.GetState then
                pcall(function()
                    AquariumRemotes.GetState:InvokeServer()
                end)
                NotifyInfo("Aquarium", "GetState dikirim ke server.")
            end
            return false
        end

        -- ===== AUTO AQUARIUM MANAGER LOOP =====
        local function StartAutoAquariumManager()
            if AquaMgr.Thread then
                pcall(function() task.cancel(AquaMgr.Thread) end)
                AquaMgr.Thread = nil
            end
            AquaMgr.Thread = task.spawn(function()
                while AquaMgr.AutoManage do
                    local ok, err = pcall(function()
                        -- 1. Masuk aquarium manager
                        EnterAquariumManager()
                        task.wait(2)

                        -- 2. Set public
                        if AquariumRemotes.SetPublic then
                            pcall(function() AquariumRemotes.SetPublic:InvokeServer(true) end)
                        end

                        -- 3. Isi semua tank dengan ikan dari inventory
                        local fishList = GetFishList()
                        if #fishList > 0 then
                            local fishIdx = 1
                            for tankIdx = 1, 3 do
                                if not AquaMgr.AutoManage then break end
                                if fishIdx > #fishList then break end
                                local fish = fishList[fishIdx]
                                if fish then
                                    local uiOk = OpenTankUI(tankIdx)
                                    if uiOk then
                                        task.wait(0.8)
                                        local setOk = SetFishToTank(tankIdx, fish.UUID)
                                        if setOk then
                                            fishIdx = fishIdx + 1
                                            NotifySuccess("Auto Aquarium", "Tank " .. tankIdx .. " diisi: " .. fish.Name)
                                        else
                                            -- Retry dengan ikan lain
                                            local retryIdx = fishIdx + 1
                                            while retryIdx <= #fishList and AquaMgr.AutoManage do
                                                local retryFish = fishList[retryIdx]
                                                local retryOk = SetFishToTank(tankIdx, retryFish.UUID)
                                                if retryOk then
                                                    fishIdx = retryIdx + 1
                                                    NotifySuccess("Auto Aquarium", "Tank " .. tankIdx .. " diisi: " .. retryFish.Name)
                                                    break
                                                end
                                                retryIdx = retryIdx + 1
                                                task.wait(0.3)
                                            end
                                        end
                                    else
                                        NotifyWarning("Auto Aquarium", "Gagal buka UI Tank " .. tankIdx)
                                    end
                                    task.wait(0.5)
                                end
                            end
                            if fishIdx > math.min(3, #fishList) then
                                NotifySuccess("Auto Aquarium", "Semua tank terisi!")
                            end
                        else
                            NotifyWarning("Auto Aquarium", "Tidak ada ikan SECRET/FORGOTTEN/MYTHIC di inventory!")
                        end
                    end)
                    if not ok then
                        warn("[QH] AutoAquarium error: " .. tostring(err))
                    end
                    task.wait(60) -- ulangi tiap 60 detik
                end
            end)
        end

        -- UI AQUARIUM TAB

        AquariumTab:Section({ Title = "Aquarium Manager" })

        AquariumTab:Button({
            Title = "Masuk Aquarium Manager",
            Desc = "Buka pintu Aquarium Manager dari jarak jauh",
            Callback = function()
                task.spawn(function()
                    local ok = EnterAquariumManager()
                    if not ok then
                        -- Fallback teleport ke lokasi aquarium
                        local hrp = getHRP()
                        if hrp then
                            hrp.CFrame = CFrame.new(460.5, 24.1, 2204.8)
                            NotifyInfo("Aquarium", "Teleport ke area aquarium sebagai fallback.")
                        end
                    end
                end)
            end
        })

        AquariumTab:Button({
            Title = "Load Aquarium Data",
            Desc = "Ambil data aquarium dari server",
            Callback = function()
                task.spawn(function()
                    if not AquariumRemotes.GetState then
                        AquariumRemotes.GetState = GetServerRemote("RF/AquariumGetState")
                    end
                    if AquariumRemotes.GetState then
                        local result = nil
                        pcall(function() result = AquariumRemotes.GetState:InvokeServer() end)
                        if result then
                            NotifySuccess("Aquarium", "Data loaded!")
                        else
                            NotifyWarning("Aquarium", "Data kosong / gagal!")
                        end
                    else
                        NotifyError("Aquarium", "Remote GetState tidak ditemukan!")
                    end
                end)
            end
        })

        -- ===== PILIH TANK =====
        AquariumTab:Section({ Title = "Pilih Tank" })

        local tankValues = {
            { Title = "Tank 1", Icon = "box" },
            { Title = "Tank 2", Icon = "box" },
            { Title = "Tank 3", Icon = "box" },
        }
        AquariumTab:Dropdown({
            Title = "Pilih Tank",
            Desc = "Pilih tank yang ingin dikelola",
            Values = tankValues,
            Value = tankValues[1],
            Multi = false,
            Callback = function(val)
                local idx = tonumber(val.Title:match("%d+")) or 1
                AquaMgr.SelectedTank = idx
                NotifyInfo("Aquarium", "Tank " .. idx .. " dipilih.")
            end
        })

        AquariumTab:Button({
            Title = "Buka UI Tank yang Dipilih",
            Desc = "Membuka UI tank tanpa perlu ke lokasi",
            Callback = function()
                OpenTankUI(AquaMgr.SelectedTank)
            end
        })

        -- ===== ADD IKAN KE TANK =====
        AquariumTab:Section({ Title = "Add Ikan ke Tank" })

        -- Dropdown pilih ikan (direfresh manual)
        local fishDropdownValues = {{ Title = "-- Refresh dulu --", Icon = "refresh-cw" }}
        local fishDropdownRef = AquariumTab:Dropdown({
            Title = "Pilih Ikan",
            Desc = "Pilih ikan dari inventory untuk dimasukkan ke tank (SECRET/FORGOTTEN/MYTHIC only)",
            Values = fishDropdownValues,
            Value = fishDropdownValues[1],
            Multi = false,
            Callback = function(val)
                if val.Title == "-- Refresh dulu --" then return end
                local fishList = GetFishList()
                for _, fish in ipairs(fishList) do
                    if fish.Display == val.Title then
                        -- use first available UUID from the group
                        AquaMgr.SelectedFishUUID = fish.Items[1]
                        NotifyInfo("Aquarium", "Ikan dipilih: " .. fish.Name .. " [" .. fish.Rarity .. "] (" .. fish.Count .. " pcs)")
                        break
                    end
                end
            end
        })

        AquariumTab:Button({
            Title = "Refresh Daftar Ikan",
            Desc = "Ambil ikan terbaru dari inventory (SECRET/FORGOTTEN/MYTHIC only)",
            Callback = function()
                local fishList = GetFishList()
                if #fishList == 0 then
                    NotifyWarning("Aquarium", "Tidak ada ikan SECRET/FORGOTTEN/MYTHIC di inventory!")
                    return
                end
                -- Update dropdown values
                local newValues = {}
                for _, fish in ipairs(fishList) do
                    table.insert(newValues, { Title = fish.Display, Icon = "fish" })
                end
                -- WindUI dropdown update (jika supported)
                pcall(function()
                    if fishDropdownRef and fishDropdownRef.Refresh then
                        fishDropdownRef:Refresh(newValues, newValues[1])
                    end
                end)
                NotifySuccess("Aquarium", "Daftar ikan direfresh! (" .. #fishList .. " ikan)")
            end
        })

        AquariumTab:Button({
            Title = "Masukkan Ikan ke Tank yang Dipilih",
            Desc = "Add ikan yang dipilih ke tank yang dipilih",
            Callback = function()
                if not AquaMgr.SelectedFishUUID then
                    NotifyError("Aquarium", "Pilih ikan dulu dari dropdown!")
                    return
                end
                OpenTankUI(AquaMgr.SelectedTank)
                task.wait(0.5)
                SetFishToTank(AquaMgr.SelectedTank, AquaMgr.SelectedFishUUID)
            end
        })

        -- Tombol cepat per tank
        AquariumTab:Section({ Title = "Quick Add per Tank" })

        for tankIdx = 1, 3 do
            local t = tankIdx -- capture
            AquariumTab:Button({
                Title = "Add Ikan ke Tank " .. t,
                Desc = "Gunakan ikan yang dipilih di dropdown",
                Callback = function()
                    if not AquaMgr.SelectedFishUUID then
                        NotifyError("Aquarium", "Pilih ikan dulu!"); return
                    end
                    OpenTankUI(t)
                    task.wait(0.5)
                    SetFishToTank(t, AquaMgr.SelectedFishUUID)
                end
            })
        end

        -- HAPUS IKAN
        AquariumTab:Section({ Title = "Hapus Ikan dari Tank" })

        for tankIdx = 1, 3 do
            local t = tankIdx
            AquariumTab:Button({
                Title = "Hapus Ikan dari Tank " .. t,
                Callback = function()
                    RemoveFishFromTank(t)
                end
            })
        end

        AquariumTab:Button({
            Title = "Hapus Semua Tank",
            Callback = function()
                for t = 1, 3 do
                    RemoveFishFromTank(t)
                    task.wait(0.3)
                end
                NotifySuccess("Aquarium", "Semua tank dikosongkan!")
            end
        })

        -- AUTO SETTINGS
        AquariumTab:Section({ Title = "Auto Aquarium Manager" })

        AquariumTab:Toggle({
            Title = "Auto Set Public",
            Desc = "Set aquarium jadi public otomatis",
            Value = false,
            Callback = function(val)
                Config.AquariumAutoPublic = val
                if val then
                    if not AquariumRemotes.SetPublic then
                        AquariumRemotes.SetPublic = GetServerRemote("RF/AquariumSetPublic")
                    end
                    if AquariumRemotes.SetPublic then
                        pcall(function() AquariumRemotes.SetPublic:InvokeServer(true) end)
                        NotifySuccess("Aquarium", "Set public berhasil!")
                    else
                        NotifyError("Aquarium", "Remote SetPublic tidak ditemukan!")
                    end
                end
            end
        })

        AquariumTab:Toggle({
            Title = "Auto Fill Semua Tank",
            Desc = "Isi Tank otomatis dengan ikan dari inventory",
            Value = false,
            Callback = function(val)
                Config.AquariumAutoFill = val
                if val then
                    task.spawn(function()
                        while Config.AquariumAutoFill do
                            local fishList = GetFishList()
                            -- Pastikan ada ikan yang tersedia
                            if #fishList == 0 then
                                NotifyWarning("Aquarium", "Tidak ada ikan SECRET/FORGOTTEN/MYTHIC di inventory!")
                                task.wait(30)
                                continue
                            end
                            -- Isi tank 1, 2, 3 dengan ikan terbaik yang tersedia
                            local fishIdx = 1
                            for t = 1, 3 do
                                if not Config.AquariumAutoFill then break end
                                if fishIdx > #fishList then break end
                                local fish = fishList[fishIdx]
                                if fish then
                                    -- Buka UI tank dulu
                                    local uiOk = OpenTankUI(t)
                                    if uiOk then
                                        task.wait(0.8)
                                        -- Coba masukkan ikan ke tank
                                        local setOk = SetFishToTank(t, fish.UUID)
                                        if setOk then
                                            fishIdx = fishIdx + 1
                                            NotifySuccess("Aquarium", "Tank " .. t .. " diisi: " .. fish.Name)
                                        else
                                            NotifyWarning("Aquarium", "Gagal isi Tank " .. t .. ", coba ikan lain...")
                                            -- Coba ikan berikutnya untuk tank yang sama
                                            local retryIdx = fishIdx + 1
                                            while retryIdx <= #fishList and Config.AquariumAutoFill do
                                                local retryFish = fishList[retryIdx]
                                                local retryOk = SetFishToTank(t, retryFish.UUID)
                                                if retryOk then
                                                    fishIdx = retryIdx + 1
                                                    NotifySuccess("Aquarium", "Tank " .. t .. " diisi: " .. retryFish.Name)
                                                    break
                                                end
                                                retryIdx = retryIdx + 1
                                                task.wait(0.3)
                                            end
                                        end
                                    else
                                        NotifyWarning("Aquarium", "Gagal buka UI Tank " .. t)
                                    end
                                    task.wait(0.5)
                                end
                            end
                            -- Jika semua tank terisi, tunggu lebih lama
                            if fishIdx > math.min(3, #fishList) then
                                NotifySuccess("Aquarium", "Semua tank terisi! Refresh dalam 60 detik...")
                            end
                            task.wait(60)
                        end
                    end)
                    NotifySuccess("Aquarium", "Auto Fill Tank aktif!")
                else
                    NotifyWarning("Aquarium", "Auto Fill dimatikan.")
                end
            end
        })

        AquariumTab:Toggle({
            Title = "Enable Auto Aquarium Manager",
            Desc = "Kelola aquarium otomatis (masuk, set public, isi tank)",
            Value = false,
            Callback = function(val)
                AquaMgr.AutoManage = val
                if val then
                    StartAutoAquariumManager()
                    NotifySuccess("Aquarium", "Auto Manager aktif!")
                else
                    if AquaMgr.Thread then
                        pcall(function() task.cancel(AquaMgr.Thread) end)
                        AquaMgr.Thread = nil
                    end
                    NotifyWarning("Aquarium", "Auto Manager dimatikan.")
                end
            end
        })

        -- VISIT
        AquariumTab:Section({ Title = "Aquarium Visit" })

        AquariumTab:Button({
            Title = "Leave Aquarium Visit",
            Callback = function()
                if AquariumRemotes.LeaveVisit then
                    pcall(function() AquariumRemotes.LeaveVisit:InvokeServer() end)
                    NotifyInfo("Aquarium", "Leave visit dikirim.")
                else
                    NotifyError("Aquarium", "Remote LeaveVisit tidak ditemukan!")
                end
            end
        })

        AquariumTab:Button({
            Title = "Like Aquarium",
            Callback = function()
                if not AquariumRemotes.Like then
                    AquariumRemotes.Like = GetServerRemote("RF/AquariumLike")
                end
                if AquariumRemotes.Like then
                    pcall(function() AquariumRemotes.Like:InvokeServer() end)
                    NotifySuccess("Aquarium", "Like dikirim!")
                else
                    NotifyError("Aquarium", "Remote Like tidak ditemukan!")
                end
            end
        })

    end)
end

-- ============================================================
-- =================== TELEPORT TAB ===========================
-- ============================================================
if TeleportTab then
    pcall(function()
        TeleportTab:Section({ Title = "Map Locations" })
        local locationNames = {}; for name in pairs(LOCATIONS) do table.insert(locationNames, name) end; table.sort(locationNames)
        local selectedLocation = locationNames[1]
        local locationValues = {}; for _, name in ipairs(locationNames) do table.insert(locationValues, { Title = name, Icon = "map-pin" }) end
        TeleportTab:Dropdown({ Title = "Pilih Lokasi", Values = locationValues, Value = locationValues[1], Multi = false, Callback = function(val) selectedLocation = val.Title end })
        TeleportTab:Button({ Title = "Teleport ke Lokasi", Callback = function()
            if selectedLocation and LOCATIONS[selectedLocation] then teleportTo(selectedLocation); NotifySuccess("TP", "Berhasil ke " .. selectedLocation .. "!")
            else NotifyError("TP", "Lokasi tidak ditemukan!") end
        end })
        TeleportTab:Section({ Title = "Player Teleport" })
        local selectedPlayerTP = nil
        local playerList = {}; for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then table.insert(playerList, p.Name) end end; table.sort(playerList)
        local playerValues = {}; for _, name in ipairs(playerList) do table.insert(playerValues, { Title = name, Icon = "user" }) end
        if #playerValues == 0 then table.insert(playerValues, { Title = "Tidak ada player lain", Icon = "user-x" }) end
        TeleportTab:Dropdown({ Title = "Pilih Player", Values = playerValues, Value = playerValues[1], Multi = false, Callback = function(val) selectedPlayerTP = val.Title end })
        TeleportTab:Button({ Title = "Teleport ke Player", Callback = function()
            if not selectedPlayerTP or selectedPlayerTP == "Tidak ada player lain" then NotifyError("TP", "Pilih player dulu!"); return end
            local target = Players:FindFirstChild(selectedPlayerTP)
            if not target or not target.Character then NotifyError("TP", "Character tidak ditemukan!"); return end
            local targetHRP = target.Character:FindFirstChild("HumanoidRootPart"); local hrp = getHRP()
            if hrp and targetHRP then hrp.CFrame = targetHRP.CFrame + Vector3.new(0, 3, 0); NotifySuccess("TP", "Berhasil ke " .. selectedPlayerTP .. "!") end
        end })
    end)
end

-- ============================================================
-- =================== SHOP TAB ===============================
-- ============================================================
if ShopTab then
    pcall(function()
        ShopTab:Section({ Title = "Buy Weather Event" })
        local weatherMap = {["Windy (10k)"]="Wind",["Cloudy (20k)"]="Cloudy",["Snow (15k)"]="Snow",["Stormy (35k)"]="Storm",["Radiant (50k)"]="Radiant",["Shark Hunt (300k)"]="Shark Hunt"}
        local weatherNames = {}; for name in pairs(weatherMap) do table.insert(weatherNames, name) end; table.sort(weatherNames)
        local selectedWeathers = {}
        local weatherValues = {}; for _, name in ipairs(weatherNames) do table.insert(weatherValues, { Title = name, Icon = "cloud" }) end
        ShopTab:Dropdown({ Title = "Pilih Weather", Values = weatherValues, Value = {}, Multi = true, Callback = function(val) selectedWeathers = {}; for _, v in ipairs(val) do table.insert(selectedWeathers, v.Title) end end })
        ShopTab:Button({ Title = "Buy Selected Weather", Callback = function()
            if #selectedWeathers == 0 then NotifyError("Weather", "Pilih weather dulu!"); return end
            if not Events.BuyWeather then Events.BuyWeather = GetServerRemote("RF/PurchaseWeatherEvent") end
            if not Events.BuyWeather then NotifyError("Weather", "Remote tidak ditemukan!"); return end
            for _, name in ipairs(selectedWeathers) do local key = weatherMap[name]; if key then pcall(function() Events.BuyWeather:InvokeServer(key) end); NotifySuccess("Weather", "Purchased: " .. name); task.wait(0.5) end end
        end })
        -- AUTO BUY 3 WEATHER: CLOUDY + WIND + THUNDER
        ShopTab:Button({
            Title = "Auto Buy 3 Weather",
            Desc = "Langsung beli Cloudy, Wind, dan Thunder sekaligus",
            Callback = function()
                if not Events.BuyWeather then Events.BuyWeather = GetServerRemote("RF/PurchaseWeatherEvent") end
                if not Events.BuyWeather then NotifyError("Weather", "Remote tidak ditemukan!"); return end
                local threeWeather = {"Cloudy", "Wind", "Storm"}
                local bought = 0
                for _, w in ipairs(threeWeather) do
                    local ok = pcall(function() Events.BuyWeather:InvokeServer(w) end)
                    if ok then bought = bought + 1; NotifySuccess("3 Weather", "Purchased: " .. w) end
                    task.wait(0.3)
                end
                if bought == 3 then
                    NotifySuccess("3 Weather", "Semua 3 weather berhasil dibeli!")
                else
                    NotifyWarning("3 Weather", "Hanya " .. bought .. "/3 berhasil dibeli.")
                end
            end
        })
        ShopTab:Toggle({
            Title = "Auto Buy Weather", Value = false,
            Callback = function(val)
                _G.AutoBuyWeather = val
                if val then
                    task.spawn(function()
                        while _G.AutoBuyWeather do
                            if not Events.BuyWeather then Events.BuyWeather = GetServerRemote("RF/PurchaseWeatherEvent") end
                            for _, name in ipairs(selectedWeathers) do local key = weatherMap[name]; if key and Events.BuyWeather then pcall(function() Events.BuyWeather:InvokeServer(key) end) end; task.wait(0.5) end
                            task.wait(5)
                        end
                    end)
                end
            end
        })
        ShopTab:Section({ Title = "Buy Fishing Rod" })
        local rods = {["Luck Rod"]=79,["Carbon Rod"]=76,["Grass Rod"]=85,["Demascus Rod"]=77,["Ice Rod"]=78,["Lucky Rod"]=4,["Midnight Rod"]=80,["Steampunk Rod"]=6,["Chrome Rod"]=7,["Astral Rod"]=5,["Ares Rod"]=126,["Angler Rod"]=168,["Bamboo Rod"]=258}
        local rodNames = {"Luck Rod (350 Coins)","Carbon Rod (900 Coins)","Grass Rod (1.5k)","Demascus Rod (3k)","Ice Rod (5k)","Lucky Rod (15k)","Midnight Rod (50k)","Steampunk Rod (215k)","Chrome Rod (437k)","Astral Rod (1M)","Ares Rod (3M)","Angler Rod (8M)","Bamboo Rod (12M)"}
        local rodKeyMap = {["Luck Rod (350 Coins)"]="Luck Rod",["Carbon Rod (900 Coins)"]="Carbon Rod",["Grass Rod (1.5k)"]="Grass Rod",["Demascus Rod (3k)"]="Demascus Rod",["Ice Rod (5k)"]="Ice Rod",["Lucky Rod (15k)"]="Lucky Rod",["Midnight Rod (50k)"]="Midnight Rod",["Steampunk Rod (215k)"]="Steampunk Rod",["Chrome Rod (437k)"]="Chrome Rod",["Astral Rod (1M)"]="Astral Rod",["Ares Rod (3M)"]="Ares Rod",["Angler Rod (8M)"]="Angler Rod",["Bamboo Rod (12M)"]="Bamboo Rod"}
        local selectedRodName = rodNames[1]
        local rodNameValues = {}; for _, name in ipairs(rodNames) do table.insert(rodNameValues, { Title = name, Icon = "anchor" }) end
        ShopTab:Dropdown({ Title = "Select Rod", Values = rodNameValues, Value = rodNameValues[1], Multi = false, Callback = function(val) selectedRodName = val.Title end })
        ShopTab:Button({ Title = "Buy Selected Rod", Callback = function()
            local key = rodKeyMap[selectedRodName]
            if key and rods[key] then
                local r = GetServerRemote("RF/PurchaseFishingRod")
                if not r then NotifyError("Buy Rod", "Remote tidak ditemukan!"); return end
                pcall(function() r:InvokeServer(rods[key]) end); NotifySuccess("Buy Rod", "Purchased: " .. selectedRodName)
            end
        end })
        ShopTab:Section({ Title = "Buy Bait" })
        local baits = {["TopWater Bait"]=10,["Lucky Bait"]=2,["Midnight Bait"]=3,["Chroma Bait"]=6,["Dark Matter Bait"]=8,["Corrupt Bait"]=15,["Aether Bait"]=16,["Floral Bait"]=20}
        local baitNames = {"TopWater Bait","Lucky Bait","Midnight Bait","Chroma Bait","Dark Matter Bait","Corrupt Bait","Aether Bait","Floral Bait"}
        local selectedBaitName = baitNames[1]
        local baitNameValues = {}; for _, name in ipairs(baitNames) do table.insert(baitNameValues, { Title = name, Icon = "bug" }) end
        ShopTab:Dropdown({ Title = "Select Bait", Values = baitNameValues, Value = baitNameValues[1], Multi = false, Callback = function(val) selectedBaitName = val.Title end })
        ShopTab:Button({ Title = "Buy Selected Bait", Callback = function()
            if baits[selectedBaitName] then
                local r = GetServerRemote("RF/PurchaseBait")
                if not r then NotifyError("Buy Bait", "Remote tidak ditemukan!"); return end
                pcall(function() r:InvokeServer(baits[selectedBaitName]) end); NotifySuccess("Buy Bait", "Purchased: " .. selectedBaitName)
            end
        end })
    end)
end

-- ============================================================
-- =================== EVENT TAB ==============================
-- ============================================================
if EventTab then
    pcall(function()
        -- ===== SECTION: FOUNDER EGG (PAID EGG) =====
        EventTab:Section({ Title = "Founder Egg (Paid)" })

        EventTab:Button({
            Title = "Teleport ke Founder Egg",
            Desc = "TP ke lokasi Founder Egg di Esoteric Depths",
            Callback = function()
                local hrp = getHRP()
                if hrp then
                    hrp.CFrame = CFrame.new(-4295.189453125, 23.265548706054688, 649.7577514648438, -0.6710231304168701, -7.244620547908198e-08, 0.7414363622665405, -1.815789296699677e-08, 1, 8.127715744876696e-08, -0.7414363622665405, 4.1075931989098535e-08, -0.6710231304168701)
                    NotifySuccess("Founder Egg", "Teleport ke lokasi Founder Egg!")
                end
            end
        })

        EventTab:Input({
            Title = "Jumlah Founder Egg",
            Placeholder = "1",
            Value = "1",
            Callback = function(text)
                local num = tonumber(text)
                if num and num > 0 then
                    Config.FounderEggAmount = math.clamp(num, 1, 100)
                    PetEggConfig.HatchAmount = Config.FounderEggAmount
                    NotifyInfo("Founder Egg", "Jumlah set: " .. Config.FounderEggAmount)
                end
            end
        })

        EventTab:Toggle({
            Title = "Auto Buy Founder Egg",
            Desc = "Auto teleport dan beli Founder Egg berulang",
            Value = false,
            Callback = function(val)
                FounderEggConfig.AutoBuy = val
                if val then
                    Config.AutoBuyFounderEgg = true
                    RunAutoBuyFounderEgg()
                    NotifySuccess("Founder Egg", "Auto-buy aktif!")
                else
                    Config.AutoBuyFounderEgg = false
                    StopAutoBuyFounderEgg()
                end
            end
        })

        EventTab:Button({
            Title = "Beli Founder Egg Sekarang",
            Desc = "Beli Founder Egg manual pakai PurchaseEgg remote",
            Callback = function()
                local hrp = getHRP()
                if hrp then
                    hrp.CFrame = CFrame.new(-4295.189453125, 23.265548706054688, 649.7577514648438, -0.6710231304168701, -7.244620547908198e-08, 0.7414363622665405, -1.815789296699677e-08, 1, 8.127715744876696e-08, -0.7414363622665405, 4.1075931989098535e-08, -0.6710231304168701)
                end
                task.wait(1)
                local bought = PurchaseEgg("Founder", Config.FounderEggAmount or 1)
                if bought > 0 then
                    NotifySuccess("Founder Egg", "Berhasil beli " .. bought .. " Founder Egg!")
                else
                    NotifyError("Founder Egg", "Gagal membeli! Cek uang/currency.")
                end
            end
        })

        -- ===== SECTION: EGG SYSTEM =====
        EventTab:Section({ Title = "Egg System" })

        local eggTypeValues = {
            { Title = "Founder", Icon = "egg" },
        }

        EventTab:Dropdown({
            Title = "Pilih Tipe Egg",
            Values = eggTypeValues,
            Value = eggTypeValues[1],
            Multi = false,
            Callback = function(val)
                PetEggConfig.SelectedEggType = val.Title
                NotifyInfo("Egg", "Tipe egg dipilih: " .. val.Title)
            end
        })

        EventTab:Input({
            Title = "Jumlah Egg",
            Placeholder = "1",
            Value = "1",
            Callback = function(text)
                local num = tonumber(text)
                if num and num > 0 then
                    PetEggConfig.HatchAmount = math.clamp(num, 1, 100)
                    NotifyInfo("Egg", "Jumlah: " .. PetEggConfig.HatchAmount)
                end
            end
        })

        EventTab:Toggle({
            Title = "Enable Instant Hatch",
            Desc = "Pakai InstantHatch remote setelah purchase",
            Value = false,
            Callback = function(val)
                PetEggConfig.InstantHatchEnabled = val
                NotifyInfo("Egg", "Instant Hatch: " .. (val and "ON" or "OFF"))
            end
        })

        EventTab:Toggle({
            Title = "Auto Hatch Loop",
            Desc = "Beli → Open → Start → Ready → Instant (loop)",
            Value = false,
            Callback = function(val)
                PetEggConfig.AutoHatch = val
                if val then
                    RunAutoHatch()
                    NotifySuccess("Auto Hatch", "Loop aktif! Egg: " .. PetEggConfig.SelectedEggType)
                else
                    StopAutoHatch()
                end
            end
        })

        EventTab:Button({
            Title = "Purchase Egg (1x)",
            Desc = "Beli egg sekali pakai PurchaseEgg remote",
            Callback = function()
                local bought = PurchaseEgg(PetEggConfig.SelectedEggType, PetEggConfig.HatchAmount)
                if bought > 0 then
                    NotifySuccess("Egg", "Berhasil beli " .. bought .. " " .. PetEggConfig.SelectedEggType .. " Egg!")
                else
                    NotifyError("Egg", "Gagal membeli egg!")
                end
            end
        })

        EventTab:Button({
            Title = "Open Egg",
            Desc = "Trigger OpenEgg remote",
            Callback = function()
                local ok = OpenEgg(PetEggConfig.SelectedEggType)
                if ok then
                    NotifySuccess("Egg", "OpenEgg berhasil!")
                else
                    NotifyError("Egg", "OpenEgg gagal!")
                end
            end
        })

        EventTab:Button({
            Title = "Start Egg",
            Desc = "Trigger StartEgg remote",
            Callback = function()
                local ok = StartEgg()
                if ok then
                    NotifySuccess("Egg", "StartEgg berhasil!")
                else
                    NotifyError("Egg", "StartEgg gagal!")
                end
            end
        })

        EventTab:Button({
            Title = "Open Ready Egg",
            Desc = "Trigger OpenReadyEgg remote",
            Callback = function()
                local ok = OpenReadyEgg()
                if ok then
                    NotifySuccess("Egg", "OpenReadyEgg berhasil!")
                else
                    NotifyError("Egg", "OpenReadyEgg gagal!")
                end
            end
        })

        EventTab:Button({
            Title = "Instant Hatch Now",
            Desc = "Trigger InstantHatch remote",
            Callback = function()
                InstantHatch()
            end
        })

        -- ===== SECTION: PET MANAGEMENT =====
        EventTab:Section({ Title = "Pet Management" })

        _G.SelectedPetUUID = _G.SelectedPetUUID or ""

        EventTab:Input({
            Title = "Pet UUID",
            Placeholder = "Masukkan UUID pet...",
            Value = "",
            Callback = function(text)
                _G.SelectedPetUUID = text
            end
        })

        EventTab:Button({
            Title = "Equip Pet",
            Desc = "Equip pet dengan UUID yang diinput",
            Callback = function()
                if _G.SelectedPetUUID == "" then
                    NotifyError("Pet", "Masukkan UUID dulu!")
                    return
                end
                local ok = EquipPet(_G.SelectedPetUUID)
                if ok then
                    NotifySuccess("Pet", "Pet equipped!")
                else
                    NotifyError("Pet", "Gagal equip pet!")
                end
            end
        })

        EventTab:Button({
            Title = "Unequip Pet",
            Desc = "Unequip pet dengan UUID yang diinput",
            Callback = function()
                if _G.SelectedPetUUID == "" then
                    NotifyError("Pet", "Masukkan UUID dulu!")
                    return
                end
                local ok = UnequipPet(_G.SelectedPetUUID)
                if ok then
                    NotifySuccess("Pet", "Pet unequipped!")
                else
                    NotifyError("Pet", "Gagal unequip pet!")
                end
            end
        })

        _G.PetRenameText = _G.PetRenameText or ""
        EventTab:Input({
            Title = "Rename Pet",
            Placeholder = "Nama baru...",
            Value = "",
            Callback = function(text)
                _G.PetRenameText = text
            end
        })

        EventTab:Button({
            Title = "Rename Pet",
            Desc = "Rename pet dengan UUID + nama baru",
            Callback = function()
                if _G.SelectedPetUUID == "" or _G.PetRenameText == "" then
                    NotifyError("Pet", "UUID dan nama baru harus diisi!")
                    return
                end
                local ok = RenamePet(_G.SelectedPetUUID, _G.PetRenameText)
                if ok then
                    NotifySuccess("Pet", "Pet renamed ke: " .. _G.PetRenameText)
                else
                    NotifyError("Pet", "Gagal rename!")
                end
            end
        })

    end)
end-- ============================================================
-- =================== MISC TAB ===============================
-- ============================================================
if MiscTab then
    pcall(function()
        MiscTab:Section({ Title = "Visual & Performance" })
        MiscTab:Toggle({
            Title = "No Animation", Value = false,
            Callback = function(val)
                _G.NoAnimationEnabled = val
                if val then
                    local char = LocalPlayer.Character; if char then SetupNoAnimation(char) end
                    pcall(function() noAnimCharConnection = LocalPlayer.CharacterAdded:Connect(function(newChar) task.wait(0.5); SetupNoAnimation(newChar) end) end)
                else
                    if noAnimConnection then pcall(function() noAnimConnection:Disconnect() end); noAnimConnection = nil end
                    if noAnimCharConnection then pcall(function() noAnimCharConnection:Disconnect() end); noAnimCharConnection = nil end
                end
            end
        })
        MiscTab:Toggle({
            Title = "Ultra/Brutal FPS Booster", Value = false,
            Callback = function(val)
                _G.UltraFPSActive = val
                if val then
                    -- BRUTAL: Remove all textures, decals, meshes
                    for _, v in pairs(workspace:GetDescendants()) do
                        pcall(function()
                            if v:IsA("BasePart") then
                                v.CastShadow = false
                                v.Material = Enum.Material.SmoothPlastic
                                v.Reflectance = 0
                            elseif v:IsA("Decal") or v:IsA("Texture") then
                                v:Destroy()
                            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                                v.Enabled = false
                            elseif v:IsA("MeshPart") then
                                v.CastShadow = false
                                v.Material = Enum.Material.SmoothPlastic
                                v.TextureID = ""
                            elseif v:IsA("SpecialMesh") then
                                v.TextureId = ""
                            elseif v:IsA("SurfaceGui") or v:IsA("BillboardGui") then
                                v.Enabled = false
                            elseif v:IsA("SpotLight") or v:IsA("PointLight") or v:IsA("SurfaceLight") then
                                v.Enabled = false
                            end
                        end)
                    end
                    -- BRUTAL: Lighting annihilation
                    Lighting.GlobalShadows = false
                    Lighting.FogEnd = 1e10
                    Lighting.Brightness = 2
                    Lighting.ClockTime = 12
                    Lighting.GeographicLatitude = 0
                    Lighting.EnvironmentDiffuseScale = 0
                    Lighting.EnvironmentSpecularScale = 0
                    for _, e in pairs(Lighting:GetChildren()) do
                        pcall(function()
                            if e:IsA("PostEffect") then e.Enabled = false
                            elseif e:IsA("Atmosphere") then e:Destroy()
                            elseif e:IsA("Sky") then e:Destroy()
                            elseif e:IsA("BloomEffect") then e:Destroy()
                            elseif e:IsA("ColorCorrectionEffect") then e:Destroy()
                            elseif e:IsA("SunRaysEffect") then e:Destroy()
                            elseif e:IsA("BlurEffect") then e:Destroy()
                            end
                        end)
                    end
                    -- BRUTAL: Terrain simplification
                    pcall(function()
                        workspace.Terrain.WaterWaveSize = 0
                        workspace.Terrain.WaterWaveSpeed = 0
                        workspace.Terrain.WaterReflectance = 0
                        workspace.Terrain.WaterTransparency = 1
                    end)
                    -- BRUTAL: Reduce render distance
                    pcall(function() settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04 end)
                    pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
                    -- BRUTAL: Destroy unnecessary UI effects
                    for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                        pcall(function()
                            if gui:IsA("ImageLabel") or gui:IsA("ImageButton") then
                                gui.Image = ""
                            elseif gui:IsA("UIGradient") or gui:IsA("UICorner") or gui:IsA("UIStroke") then
                                gui:Destroy()
                            end
                        end)
                    end
                    -- BRUTAL: Lower graphics settings
                    pcall(function()
                        local success, settings = pcall(function() return settings() end)
                        if success and settings.Rendering then
                            settings.Rendering.QualityLevel = Enum.QualityLevel.Level01
                        end
                    end)
                    NotifySuccess("Ultra FPS", "BRUTAL MODE AKTIF! FPS maksimal!")
                else
                    NotifyInfo("Ultra FPS", "Dimatikan. Restart game untuk restore visual.")
                end
            end
        })
        MiscTab:Toggle({ Title = "Disable Obtained Notif", Value = false, Callback = function(val) SetDisableObtained(val) end })
        local _backup = setmetatable({}, {__mode = "k"})
        local function DisableController(ctrl)
            if _backup[ctrl] then return end
            local data = {functions = {}}
            for k, v in pairs(ctrl) do if type(v) == "function" then data.functions[k] = v; ctrl[k] = function() end end end
            _backup[ctrl] = data
        end
        local function EnableController(ctrl)
            local data = _backup[ctrl]; if not data then return end
            for k, v in pairs(data.functions) do ctrl[k] = v end
            _backup[ctrl] = nil
        end
        MiscTab:Toggle({ Title = "Disable VFX", Value = false, Callback = function(val) if Controllers.VFX then if val then DisableController(Controllers.VFX) else EnableController(Controllers.VFX) end end end })
        MiscTab:Toggle({ Title = "Disable Cutscene", Value = false, Callback = function(val) if Controllers.Cutscene then if val then DisableController(Controllers.Cutscene) else EnableController(Controllers.Cutscene) end end end })

        MiscTab:Section({ Title = "Theme Changer" })
        _G.SelectedThemeName = _G.SelectedThemeName or "QuantumGreen"
        _G.PendingThemeName = _G.PendingThemeName or "QuantumGreen"
        local themeValues = {
            {Title="Dark",Icon="moon"},
            {Title="Darker",Icon="moon"},
            {Title="Light",Icon="sun"},
            {Title="Aqua",Icon="droplets"},
            {Title="Amethyst",Icon="gem"},
            {Title="Rose",Icon="heart"},
            {Title="Forest",Icon="tree-pine"},
            {Title="Glass",Icon="panel-top"},
            {Title="QuantumGreen",Icon="atom"},
            {Title="QuantumBlue",Icon="atom"},
        }
        MiscTab:Dropdown({
            Title = "Select Theme",
            Desc = "Pilih theme baru (perlu Apply untuk aktif)",
            Values = themeValues,
            Value = themeValues[9],
            Multi = false,
            Callback = function(val)
                _G.PendingThemeName = val.Title
                NotifyInfo("Theme", "Theme dipilih: " .. val.Title .. " (klik Apply)")
            end
        })
        MiscTab:Button({
            Title = "Apply Theme",
            Icon = "check",
            Desc = "Terapkan theme yang dipilih",
            Callback = function()
                if not _G.PendingThemeName then NotifyError("Theme", "Pilih theme dulu!"); return end
                pcall(function()
                    if WindUI.SetTheme then
                        WindUI:SetTheme(_G.PendingThemeName)
                        _G.SelectedThemeName = _G.PendingThemeName
                        NotifySuccess("Theme", "Theme berubah ke: " .. _G.PendingThemeName)
                    end
                end)
            end
        })
        MiscTab:Button({
            Title = "Reset Theme",
            Icon = "rotate-ccw",
            Desc = "Kembalikan ke QuantumGreen (default)",
            Callback = function()
                pcall(function()
                    if WindUI.SetTheme then
                        WindUI:SetTheme("QuantumGreen")
                        _G.SelectedThemeName = "QuantumGreen"
                        _G.PendingThemeName = "QuantumGreen"
                        NotifySuccess("Theme", "Theme direset ke QuantumGreen!")
                    end
                end)
            end
        })

        MiscTab:Section({ Title = "Server Controls" })
        MiscTab:Button({ Title = "Rejoin Plaza", Callback = function()
            if not Events.TradePlazaTeleport then Events.TradePlazaTeleport = GetServerRemote("RE/TradePlazaTeleport") end
            if Events.TradePlazaTeleport then pcall(function() Events.TradePlazaTeleport:FireServer() end); NotifySuccess("Rejoin", "Teleport ke Plaza!")
            else pcall(function() TeleportService:Teleport(6872265039, LocalPlayer) end) end
        end })
        MiscTab:Button({ Title = "Server Hop", Callback = function()
            if not Events.ServerHop then Events.ServerHop = GetServerRemote("RE/ServerHop") end
            if Events.ServerHop then pcall(function() Events.ServerHop:FireServer() end)
            else pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end) end
            NotifySuccess("ServerHop", "Pindah server!")
        end })
        MiscTab:Button({ Title = "Rejoin Server", Callback = function()
            NotifySuccess("Rejoin", "Rejoining..."); task.wait(1)
            pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
        end })
        MiscTab:Toggle({ Title = "Teleport New Server (Beta)", Value = false, Callback = function(val)
            _G.AutoNewServer = val
            if val then
                task.spawn(function()
                    while _G.AutoNewServer do
                        task.wait(math.random(180, 300))
                        if _G.AutoNewServer then pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end) end
                    end
                end)
            end
        end })

        MiscTab:Section({ Title = "Anti-AFK" })
        MiscTab:Toggle({
            Title = "Anti-AFK", Value = false,
            Callback = function(val)
                _G.AntiAFKEnabled = val
                if val then
                    pcall(function()
                        for _, v in pairs(getconnections(LocalPlayer.Idled)) do
                            if v.Disable then v:Disable() elseif v.Disconnect then v:Disconnect() end
                        end
                    end)
                    _G.AntiAFKThread = task.spawn(function()
                        while _G.AntiAFKEnabled do
                            task.wait(60 * 18)
                        end
                    end)
                    NotifySuccess("Anti-AFK", "Aktif!")
                else
                    if _G.AntiAFKThread then pcall(function() task.cancel(_G.AntiAFKThread) end) end
                end
            end
        })
    end)
end

-- ============================================================
-- =================== TRADE TAB ==============================
-- ============================================================
if TradeTab then
    pcall(function()
        TradeTab:Section({ Title = "Select Player" })
        local tradePlayerList = GetTradePlayerList()
        local tradePlayerValues = {}
        for _, name in ipairs(tradePlayerList) do table.insert(tradePlayerValues, { Title = name, Icon = "user" }) end
        if #tradePlayerValues == 0 then table.insert(tradePlayerValues, { Title = "Tidak ada player lain", Icon = "user-x" }) end
        TradeTab:Dropdown({ Title = "Target Player", Values = tradePlayerValues, Value = tradePlayerValues[1], Multi = false, Callback = function(val) TradeConfig.SelectedTargetPlayer = val.Title end })
        TradeTab:Section({ Title = "Auto Accept Trade" })
        TradeTab:Toggle({
            Title = "Enable Auto Accept Trade", Value = false,
            Callback = function(val)
                TradeConfig.AutoAcceptTrade = val
                if val then SetupAutoAcceptTrade() else if autoAcceptConn then pcall(function() autoAcceptConn:Disconnect() end); autoAcceptConn = nil end end
            end
        })
        TradeTab:Section({ Title = "Trade Enchant Stone" })
        local stoneTypeValuesT = {{ Title = "Normal", Icon = "gem" }, { Title = "Evolved", Icon = "sparkles" }, { Title = "All", Icon = "layers" }}
        TradeTab:Dropdown({ Title = "Stone Type", Values = stoneTypeValuesT, Value = stoneTypeValuesT[1], Multi = false, Callback = function(val) TradeConfig.SelectedStoneType = val.Title end })
        TradeTab:Input({ Title = "Amount", Placeholder = "1", Value = "1", Callback = function(text) local num = tonumber(text); if num then TradeConfig.EnchantStoneAmount = math.clamp(num, 1, 50) end end })
        TradeTab:Toggle({ Title = "Start Trade EnchantStone", Value = false, Callback = function(val) TradeConfig.TradeEnchantStone = val; if val then StartTradeEnchantStone() end end })
        TradeTab:Section({ Title = "Trade By Rarity" })
        local tradeRarityValues = {{Title="Common"},{Title="Uncommon"},{Title="Rare"},{Title="Epic"},{Title="Legendary"},{Title="Mythic"},{Title="SECRET"}}
        TradeTab:Dropdown({ Title = "Select Rarity", Values = tradeRarityValues, Value = tradeRarityValues[1], Multi = false, Callback = function(val) TradeConfig.SelectedTradeRarity = val.Title end })
        TradeTab:Input({ Title = "Amount", Placeholder = "1", Value = "1", Callback = function(text) local num = tonumber(text); if num then TradeConfig.TradeRarityAmount = math.clamp(num, 1, 50) end end })
        TradeTab:Toggle({ Title = "Start Trade ByRarity", Value = false, Callback = function(val) TradeConfig.TradeByRarity = val; if val then StartTradeByRarity() end end })
        TradeTab:Section({ Title = "Trade By Coin" })
        TradeTab:Input({ Title = "Target Coins", Placeholder = "0", Value = "0", Callback = function(text) local num = tonumber(text); if num then TradeConfig.TargetCoins = math.clamp(num, 0, 999999999) end end })
        TradeTab:Toggle({ Title = "Start Trade ByCoin", Value = false, Callback = function(val) TradeConfig.TradeByCoin = val; if val then StartTradeByCoin() end end })
        TradeTab:Section({ Title = "Trade By Name" })
        -- grouped inventory cache
        _G.TradeGroupedItems = _G.TradeGroupedItems or {}
        local fishItemValues = {{ Title = "Refresh dulu", Icon = "refresh-cw" }}
        local tradeNameDropdown = TradeTab:Dropdown({ Title = "Select Item", Values = fishItemValues, Value = fishItemValues[1], Multi = false, Callback = function(val)
            if val.Title ~= "Refresh dulu" and val.Title ~= "Inventory kosong" then
                TradeConfig.SelectedTradeItem = val.Title
                -- find representative UUID from group for trade execution
                for _, grp in ipairs(_G.TradeGroupedItems) do
                    if grp.Display == val.Title then
                        TradeConfig.SelectedTradeItemUUID = grp.Items[1]
                        break
                    end
                end
            end
        end })
        TradeTab:Button({ Title = "Refresh Fish Items", Callback = function()
            local rawItems = ScanTradeInventory()
            -- filter hanya ikan
            local fishItems = {}
            for _, item in ipairs(rawItems) do
                if IsFishItem(item) then table.insert(fishItems, item) end
            end
            -- group by name + rarity (so same name different rarity = separate group)
            local groups = {}
            for _, item in ipairs(fishItems) do
                local name, rarity = GetFishNameAndRarity(item)
                local key = name .. "|" .. rarity
                if not groups[key] then
                    groups[key] = {Name=name, Rarity=rarity, Count=0, Items={}}
                end
                groups[key].Count = groups[key].Count + 1
                table.insert(groups[key].Items, item.UUID)
            end
            local groupedList = {}
            for _, grp in pairs(groups) do
                grp.Display = grp.Name .. " [" .. grp.Rarity .. "] x" .. grp.Count
                table.insert(groupedList, grp)
            end
            -- sort: highest rarity first, then by name
            local rarityOrder = {SECRET=7,Mythic=6,Legendary=5,Epic=4,Rare=3,Uncommon=2,Common=1,FORGOTTEN=8}
            table.sort(groupedList, function(a,b)
                local ra = rarityOrder[a.Rarity] or 0
                local rb = rarityOrder[b.Rarity] or 0
                if ra ~= rb then return ra > rb end
                return a.Name < b.Name
            end)
            _G.TradeGroupedItems = groupedList
            local newValues = {}
            for _, grp in ipairs(groupedList) do
                table.insert(newValues, { Title = grp.Display, Icon = "fish" })
            end
            if #newValues == 0 then table.insert(newValues, { Title = "Inventory kosong", Icon = "x" }) end
            pcall(function()
                if tradeNameDropdown and tradeNameDropdown.Refresh then
                    tradeNameDropdown:Refresh(newValues, newValues[1])
                end
            end)
            NotifySuccess("Trade", "Refreshed! " .. #groupedList .. " jenis ikan (" .. #fishItems .. " total).")
        end })
        TradeTab:Input({ Title = "Amount", Placeholder = "1", Value = "1", Callback = function(text) local num = tonumber(text); if num then TradeConfig.TradeNameAmount = math.clamp(num, 1, 50) end end })
        TradeTab:Toggle({ Title = "Start Trade ByName", Value = false, Callback = function(val) TradeConfig.TradeByName = val; if val then StartTradeByName() end end })
        TradeTab:Section({ Title = "Status" })
        TradeTab:Button({ Title = "Reset Trade Status", Callback = function()
            TradeConfig.TradeStatus = "Idle"; TradeConfig.TradeEnchantStone = false
            TradeConfig.TradeByRarity = false; TradeConfig.TradeByCoin = false; TradeConfig.TradeByName = false
            NotifySuccess("Trade", "Status direset!")
        end })
    end)
end

-- ============================================================
-- =================== VISUAL TAB =============================
-- ============================================================
if VisualTab then
    pcall(function()
VisualTab:Section({ Title = "Auto Forgotten" })
        local _forgottenKey = table.concat({"\55","\70","\88","\51","\65","\78","\57","\50"})
        local _forgottenUnlocked = false

        VisualTab:Input({
            Title = "🔐 Forgotten Key", Placeholder = "Masukkan key...", Value = "",
            Callback = function(text)
                if text == _forgottenKey then
                    _forgottenUnlocked = true
                    NotifySuccess("Auto Forgotten", "Key valid! Akses diberikan.")
                else
                    _forgottenUnlocked = false
                    NotifyError("Auto Forgotten", "Key salah!")
                end
            end
        })
        VisualTab:Toggle({
            Title = "Auto Forgotten", Value = false,
            Callback = function(val)
                if not _forgottenUnlocked then
                    NotifyError("Auto Forgotten", "Masukkan key dulu!")
                    return
                end
                Config.autoForgotten = val
                saveCount = 0
                HookRemote("RE/FishCaught", "FishCaught")
                HookRemote("RE/CaughtFishVisual", "CaughtVisual")
                HookRemote("RE/ObtainedNewFishNotification", "FishNotif")
                needCast = true
                onToggleUB(val)
            end
        })

        VisualTab:Section({ Title = "Auto Secret" })
        local _secretKey = table.concat({"\81","\52","\90","\67","\38","\86","\49","\75"})
        local _secretUnlocked = false

        VisualTab:Input({
            Title = "🔐 Secret Key", Placeholder = "Masukkan key...", Value = "",
            Callback = function(text)
                if text == _secretKey then
                    _secretUnlocked = true
                    NotifySuccess("Auto Secret", "Key valid! Akses diberikan.")
                else
                    _secretUnlocked = false
                    NotifyError("Auto Secret", "Key salah!")
                end
            end
        })
        VisualTab:Toggle({
            Title = "Auto Secret", Value = false,
            Callback = function(val)
                if not _secretUnlocked then
                    NotifyError("Auto Secret", "Masukkan key dulu!")
                    return
                end
                Config.autoSecret = val
                saveCount = 0
                HookRemote("RE/FishCaught", "FishCaught")
                HookRemote("RE/CaughtFishVisual", "CaughtVisual")
                HookRemote("RE/ObtainedNewFishNotification", "FishNotif")
                needCast = true
                onToggleUB(val)
            end
        })

                VisualTab:Section({ Title = "Quantum Maximum" })
        local _quantumMaxKey = "TYFORSUPPORT"
        local _quantumMaxUnlocked = false
        VisualTab:Input({
            Title = "Quantum Maximum Key", Placeholder = "Masukkan key...", Value = "",
            Callback = function(text)
                if text == _quantumMaxKey then _quantumMaxUnlocked = true; NotifySuccess("Quantum Maximum", "Key valid!")
                else _quantumMaxUnlocked = false; NotifyError("Quantum Maximum", "Key salah!") end
            end
        })
        VisualTab:Toggle({
            Title = "🔒 Quantum Maximum", Value = false,
            Callback = function(val)
                if not _quantumMaxUnlocked then NotifyError("Quantum Maximum", "Masukkan key dulu!"); return end
                if val then Config.amblatant = true else Config.amblatant = false end
                saveCount = 0
                HookRemote("RE/FishCaught","FishCaught")
                HookRemote("RE/CaughtFishVisual","CaughtVisual")
                HookRemote("RE/ObtainedNewFishNotification","FishNotif")
                needCast = true
                onToggleUB(val)
            end
        })

    end) -- tutup pcall VisualTab
end    -- tutup if VisualTab

-- ============================================================
-- =================== INTRO NOTIFICATION =====================
-- ============================================================
pcall(function()
    if WindUI and WindUI.Notify then
        WindUI:Notify({
            Title = "Quantum HUB V7.0",
            Content = "Loaded! Remotes: " .. loadedCount .. " | Failed: " .. failedCount .. " | Map: " .. (isSupported and supportedMaps["121864768012064"] or mapName),
            Duration = 5,
            Icon = "atom"
        })
    end
end)
