--IonHub | Ouw

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