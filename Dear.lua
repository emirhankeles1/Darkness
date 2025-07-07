-- Beta NPC Bacon + AI + Animasi Gerak + Marah + Respawn + Otomatik Konuşma + Kalp Efekti + Rainbow GUI by Lonely & ChatGPT
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local StarterPack = game:GetService("StarterPack")

if CoreGui:FindFirstChild("DUMMY_GUI") then
    CoreGui:FindFirstChild("DUMMY_GUI"):Destroy()
end

-- GUI
local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "DUMMY_GUI"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.ResetOnSpawn = false

-- Ana Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 260, 0, 140)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

-- Rainbow Başlık
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "Dark Hub"
title.TextSize = 24
title.TextColor3 = Color3.fromHSV(0,1,1)
title.TextStrokeTransparency = 0.8

-- Rainbow animasyonu
task.spawn(function()
    local hue = 0
    while true do
        hue = (hue + 0.005) % 1
        title.TextColor3 = Color3.fromHSV(hue, 1, 1)
        task.wait(0.03)
    end
end)

-- Spawn Butonu
local spawnButton = Instance.new("TextButton", frame)
spawnButton.Size = UDim2.new(1, -20, 0, 30)
spawnButton.Position = UDim2.new(0, 10, 0, 40)
spawnButton.Text = "Spawn Dummy"
spawnButton.BackgroundColor3 = Color3.fromRGB(60, 180, 75)
spawnButton.TextColor3 = Color3.new(1,1,1)
spawnButton.Font = Enum.Font.GothamBold
spawnButton.TextSize = 18
spawnButton.Parent = frame
local spawnCorner = Instance.new("UICorner", spawnButton)
spawnCorner.CornerRadius = UDim.new(0, 8)

-- Follow Butonu
local followToggle = Instance.new("TextButton", frame)
followToggle.Size = UDim2.new(1, -20, 0, 30)
followToggle.Position = UDim2.new(0, 10, 0, 80)
followToggle.Text = "Follow: OFF"
followToggle.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
followToggle.TextColor3 = Color3.new(1,1,1)
followToggle.Font = Enum.Font.GothamBold
followToggle.TextSize = 18
followToggle.Parent = frame
local followCorner = Instance.new("UICorner", followToggle)
followCorner.CornerRadius = UDim.new(0, 8)

-- Data
local dummy = nil
local follow = false
local nextMove = 0

local responses = {
    "I love you more than anything.",
    "Please, never leave me.",
    "You mean the world to me.",
    "Being with you makes everything better.",
    "You're the reason I smile every day.",
    "I can't imagine life without you.",
    "You're always in my heart.",
    "Stay with me forever.",
    "Every moment with you feels magical.",
    "You're my everything.",
    "I feel safe when I'm with you.",
    "My heart belongs to you.",
    "You complete me.",
    "No one else matters but you.",
    "Let’s stay together forever.",
    "Holding your hand is all I need.",
    "Your voice is my favorite sound.",
    "With you, I’m home.",
    "You’re my one and only.",
    "I’m so lucky to have you."
}

local function getRandomName()
    local list = {"Budi", "Alex", "Ojan", "Udin", "Soni"}
    return list[math.random(1, #list)] .. math.random(100, 999)
end

-- Animasyon
local function applyR6Animation(model)
    if model:FindFirstChildOfClass("Humanoid") then
        local animate = Instance.new("Script", model)
        animate.Name = "Animate"
        animate.Source = [[
            local hum = script.Parent:FindFirstChildOfClass("Humanoid")
            hum:LoadAnimation(script.Parent:WaitForChild("AnimateIdle")):Play()
        ]]
        local idleAnim = Instance.new("Animation", model)
        idleAnim.Name = "AnimateIdle"
        idleAnim.AnimationId = "rbxassetid://180435571"
    end
end

-- Dummy oluştur
local function createBaconDummy()
    local userId = 1
    local model = Players:CreateHumanoidModelFromUserId(userId)
    model.Name = getRandomName()
    model.Parent = Workspace

    local root = model:FindFirstChild("HumanoidRootPart")
    if root and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        root.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(5,0,0)
    end

    applyR6Animation(model)

    local tool = StarterPack:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
    if tool then
        local cloneTool = tool:Clone()
        cloneTool.Parent = model
    end

    return model
end

-- Ölünce tekrar doğsun + kızgın mesaj
local function connectDeathEvents(npc)
    npc:WaitForChild("Humanoid").Died:Connect(function()
        warn(npc.Name.." MATI! DIA NGAMUK!")

        local chat = Instance.new("BillboardGui", npc)
        chat.Size = UDim2.new(0, 200, 0, 50)
        chat.StudsOffset = Vector3.new(0, 3, 0)
        chat.Adornee = npc:FindFirstChild("Head")
        chat.AlwaysOnTop = true

        local label = Instance.new("TextLabel", chat)
        label.Size = UDim2.new(1, 0, 1, 0)
        label.Text = "ANJING!!! GUA MATI!!!"
        label.TextColor3 = Color3.new(1, 0, 0)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.Arcade
        label.TextScaled = true

        task.delay(3, function()
            if chat then chat:Destroy() end
        end)

        task.delay(3, function()
            if dummy then dummy:Destroy() end
            dummy = createBaconDummy()
            connectDeathEvents(dummy)
        end)
    end)
end

-- Spawn Butonu
spawnButton.MouseButton1Click:Connect(function()
    if dummy then return end
    dummy = createBaconDummy()
    connectDeathEvents(dummy)
end)

-- Follow + Kalp Efekti
followToggle.MouseButton1Click:Connect(function()
    follow = not follow

    if follow then
        followToggle.Text = "Follow: ON"
        followToggle.BackgroundColor3 = Color3.fromRGB(80, 200, 80)

        if dummy and dummy:FindFirstChild("Head") then
            local att = Instance.new("Attachment", dummy.Head)
            att.Name = "HeartAttachment"

            local particle = Instance.new("ParticleEmitter", att)
            particle.Name = "HeartEffect"
            particle.Texture = "rbxassetid://5857851618"
            particle.Rate = 30
            particle.Lifetime = NumberRange.new(1.0)
            particle.Speed = NumberRange.new(1, 4)
            particle.VelocitySpread = 360
            particle.Size = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.8),
                NumberSequenceKeypoint.new(0.5, 1.2),
                NumberSequenceKeypoint.new(1, 0.5)
            })
            particle.Transparency = NumberSequence.new(0.1)
            particle.Color = ColorSequence.new(Color3.fromRGB(255, 50, 100))
        end
    else
        followToggle.Text = "Follow: OFF"
        followToggle.BackgroundColor3 = Color3.fromRGB(200, 80, 80)

        if dummy and dummy:FindFirstChild("Head") then
            local att = dummy.Head:FindFirstChild("HeartAttachment")
            if att then att:Destroy() end
        end
    end
end)

-- AI hareket
RunService.Heartbeat:Connect(function()
    if dummy and dummy:FindFirstChild("HumanoidRootPart") and dummy:FindFirstChild("Humanoid") then
        local root = dummy.HumanoidRootPart
        local humanoid = dummy.Humanoid

        if follow and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local target = LocalPlayer.Character.HumanoidRootPart.Position
            local distance = (target - root.Position).Magnitude

            if distance > 100 then
                root.CFrame = CFrame.new(target + Vector3.new(2, 0, 0))
            elseif distance > 5 then
                humanoid:MoveTo(target)
            else
                humanoid:MoveTo(root.Position)
            end
        else
            if tick() >= nextMove then
                nextMove = tick() + math.random(3, 6)
                local offset = Vector3.new(math.random(-10,10), 0, math.random(-10,10))
                humanoid:MoveTo(root.Position + offset)
            end
        end

        local ray = Ray.new(root.Position, root.CFrame.LookVector * 3 + Vector3.new(0, -1, 0))
        local hit = Workspace:FindPartOnRay(ray, dummy)
        if hit and humanoid.FloorMaterial ~= Enum.Material.Air then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Otomatik Konuşma
task.spawn(function()
    while true do
        task.wait(math.random(5, 10))
        if dummy and dummy:FindFirstChild("Head") then
            local chat = Instance.new("BillboardGui", dummy)
            chat.Size = UDim2.new(0, 200, 0, 50)
            chat.StudsOffset = Vector3.new(0, 3, 0)
            chat.Adornee = dummy:FindFirstChild("Head")
            chat.AlwaysOnTop = true

            local label = Instance.new("TextLabel", chat)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.Text = responses[math.random(1, #responses)]
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.SourceSansBold
            label.TextScaled = true

            task.delay(4, function()
                if chat then chat:Destroy() end
            end)
        end
    end
end)
