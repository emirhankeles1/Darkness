local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local placeId = game.PlaceId
local gameName = MarketplaceService:GetProductInfo(placeId).Name

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GameInfoGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 0, 0, 0)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Frame.BackgroundTransparency = 0.1
Frame.BorderSizePixel = 0
Frame.ZIndex = 2
Frame.Parent = ScreenGui
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 18)

local Shadow = Instance.new("ImageLabel", Frame)
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageTransparency = 0.7
Shadow.ZIndex = 0

local HubTitle = Instance.new("TextLabel", Frame)
HubTitle.Size = UDim2.new(1, -20, 0, 30)
HubTitle.Position = UDim2.new(0, 10, 0, 5)
HubTitle.BackgroundTransparency = 1
HubTitle.Text = "Dark Hub"
HubTitle.Font = Enum.Font.FredokaOne
HubTitle.TextScaled = true
HubTitle.ZIndex = 2

task.spawn(function()
	local t = 0
	while HubTitle and HubTitle.Parent do
		t += 1
		local r = math.sin(t * 0.05) * 127 + 128
		local g = math.sin(t * 0.05 + 2) * 127 + 128
		local b = math.sin(t * 0.05 + 4) * 127 + 128
		HubTitle.TextColor3 = Color3.fromRGB(r, g, b)
		RunService.RenderStepped:Wait()
	end
end)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, -40, 0, 30)
Title.Position = UDim2.new(0, 20, 0, 35)
Title.BackgroundTransparency = 1
Title.Text = gameName
Title.TextColor3 = Color3.fromRGB(180, 140, 255)
Title.Font = Enum.Font.FredokaOne
Title.TextScaled = true
Title.ZIndex = 2

local RunButton = Instance.new("TextButton", Frame)
RunButton.Size = UDim2.new(1, -60, 0, 50)
RunButton.Position = UDim2.new(0.5, 0, 0.5, 0)
RunButton.AnchorPoint = Vector2.new(0.5, 0.5)
RunButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RunButton.BackgroundColor3 = Color3.fromRGB(80, 20, 150)
RunButton.Font = Enum.Font.GothamBold
RunButton.TextScaled = true
RunButton.AutoButtonColor = false
RunButton.ZIndex = 2
Instance.new("UICorner", RunButton).CornerRadius = UDim.new(0, 12)

RunButton.MouseEnter:Connect(function()
	RunButton.BackgroundColor3 = Color3.fromRGB(100, 40, 180)
end)
RunButton.MouseLeave:Connect(function()
	RunButton.BackgroundColor3 = Color3.fromRGB(80, 20, 150)
end)

if placeId == 286090429 then
	RunButton.Text = "Start Arsenal Script"
elseif placeId == 205224386 then
	RunButton.Text = "start Hide and Seek script"
elseif placeId == 126884695634066 then
	RunButton.Text = "start grow a garden script"
elseif placeId == 117398147513099 then
	RunButton.Text = "start rivals script"
elseif placeId == 109983668079237 then
	RunButton.Text = "start Steal a Brainrot script"
else
	RunButton.Text = "Script not found"
end

TweenService:Create(Frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	Size = UDim2.new(0, 320, 0, 200)
}):Play()

local function CloseAndRun()
	TweenService:Create(Frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Size = UDim2.new(0, 0, 0, 0)
	}):Play()
	task.delay(0.3, function()
		ScreenGui:Destroy()
	end)

	if placeId == 286090429 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/emirhankeles1/Darkness/refs/heads/main/arsenal-V2.lua"))()
	elseif placeId == 205224386 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/emirhankeles1/Darkness/refs/heads/main/esp.lua"))()
    elseif placeId == 126884695634066 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/emirhankeles1/Darkness/refs/heads/main/Grow-a-garden.lua"))()
	elseif placeId == 117398147513099 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/emirhankeles1/Darkness/refs/heads/main/rivals.lua"))()
		elseif placeId == 109983668079237 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/emirhankeles1/Darkness/refs/heads/main/Steal-a-Brainrot.lua"))()
	else
		warn("No scripts.")
	end
end

RunButton.MouseButton1Click:Connect(CloseAndRun)
