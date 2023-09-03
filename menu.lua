--IonHub | Menu

repeat wait() until game:IsLoaded()
setfpscap(8236)
local inputservice = game:GetService("UserInputService")
local runservice = game:GetService("RunService")
inputservice.WindowFocusReleased:Connect(function() runservice:Set3dRenderingEnabled(false) end)
inputservice.WindowFocused:Connect(function() runservice:Set3dRenderingEnabled(true) end)
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local UIS = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local VIM = game:GetService("VirtualInputManager")
local ReplStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Input = game:GetService("UserInputService")
local COREGUI = game:GetService("CoreGui")
local LP = game:GetService("Players").LocalPlayer
local HttpService = game:GetService("HttpService")
local RunS = game:GetService("RunService")
local X, Y = 0, 0
local Mouse = LP:GetMouse()
local GetLocalName = LP.Name
local request = (syn and syn.request) or (http and http.request) or http_request
local client = game:GetService("Players").LocalPlayer
local Plr = game:GetService("Players").LocalPlayer
local Data = game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name]
local Tool = game:GetService("ReplicatedStorage").Tools:GetChildren()
local WebhookURL = "" 
game:GetService("Players").LocalPlayer.DisplayName = "IonHub"

------ LIBRARY [MENU Linoria]
local loader = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(loader .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/0WINDYCAKETI/Ion_Hub/main/Theme.lua'))()
local SaveManager = loadstring(game:HttpGet(loader .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Ion Hub | By 0Windycaketi | ProjectSlayer',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.4
})


local Tabs = {
   Main = Window:AddTab('Project Slayers'),
   ['Settings'] = Window:AddTab('Settings'),

}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('          [SPINS]')

LeftGroupBox:AddButton("Auto Daily Spin", function()
    while task.wait() do
        game:GetService("ReplicatedStorage"):WaitForChild("spins_thing_remote"):InvokeServer()
    end
 end)

 LeftGroupBox:AddButton("Spin Supreme/Mythic Clan", function()
    local clan = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Clan
    local wanted = {"Kamado","Agatsuma","Rengoku","Uzui","Soyama","Tokito","Tomioka","Hashibira"}
    
    repeat wait(0.001)
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("check_can_spin", game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Spins, clan)
    until table.find(wanted, clan.Value)
end)


LeftGroupBox:AddButton("Spin Supreme Clan ONLY", function()
    local clan = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Clan
		local wanted = {"Kamado","Agatsuma","Rengoku","Uzui"}
		
		repeat wait(0.001)
		   game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("check_can_spin", game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Spins, clan)
		until table.find(wanted,clan.Value)    
end)

LeftGroupBox:AddButton("Check What You Got (F9)", function()
    local player = game.Players.LocalPlayer
    local path = game:GetService("ReplicatedStorage").Player_Data[player.Name].Clan

    path.Changed:Connect(function(newValue)
        print("Value changed to:", newValue)
    end)
end)

local function sendCode(code, waitTime)
    game:GetService("ReplicatedStorage").Remotes.send_code_to_server:FireServer(code)
    wait(waitTime)
end

LeftGroupBox:AddButton("Auto SPIN CODES [Old Codes] ", function()
    sendCode("ThanksForLikes600K", 12)
    sendCode("ThanksForLikes600K2", 12)
    sendCode("ThanksFor350MVisits2", 12)
    sendCode("Thx4300MNOuwohanaIsBack", 12)
    sendCode("ThanksFor350MVisits", 12)
    sendCode("!ThanksFor250MVisits", 12)
    sendCode("!Upd295MiniCode", 12)
end)

Library:SetWatermarkVisibility(true)

local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 360;

local IonWatermark = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('Ion Hub | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

Library:OnUnload(function()
    IonWatermark:Disconnect()

    Library.Unloaded = true
end)

local MenuGroup = Tabs['Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybindIon', { Default = 'F4', NoUI = true, Text = '[ Menu Key Bind ]' })

Library.ToggleKeybind = Options.MenuKeybindIon

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({'MenuKeybindIon'})

ThemeManager:SetFolder('IonHub')
SaveManager:SetFolder('IonHub/Project_Slayer/Map1')
SaveManager:BuildConfigSection(Tabs['Settings'])
ThemeManager:ApplyToTab(Tabs['Settings'])

SaveManager:LoadAutoloadConfig()