local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local FullSettings = {
	Esp = {
		Checks = {
			TeamCheck = true,
			WallCheck = false,
			AliveCheck = true
		},
		Values = {
			Enabled = true,
			FillColor = Color3.fromRGB(255, 0, 0),
			FillTransparency = 0.5,
			OutlineColor = Color3.fromRGB(200, 200, 200),
			OutlineTransparency = 0
		}
	}
}

-- ESP Sistemi
coroutine.wrap(function ()
	while task.wait() do
		for _, v in pairs(Players:GetPlayers()) do
			if v ~= LocalPlayer and v.Character then
				local Esp = v.Character:FindFirstChild("Esp")

				-- Sağlamlık kontrolleri
				if FullSettings.Esp.Checks.AliveCheck and v.Character:FindFirstChildOfClass("Humanoid") and v.Character.Humanoid.Health <= 0 then  
					if Esp then Esp:Destroy() end
					continue 
				end

				if FullSettings.Esp.Checks.TeamCheck and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.HumanoidRootPart:FindFirstChild("TeammateLabel") then 
					if Esp then Esp:Destroy() end
					continue 
				end

				-- Esp yoksa ekle
				if not Esp then
					Esp = Instance.new("Highlight")
					Esp.Name = "Esp"
					Esp.RobloxLocked = true
					Esp.Adornee = v.Character
					Esp.Parent = v.Character
				end

				-- Ayarları uygula
				if Esp then
					Esp.DepthMode = FullSettings.Esp.Checks.WallCheck and Enum.HighlightDepthMode.Occluded or Enum.HighlightDepthMode.AlwaysOnTop
					Esp.Enabled = FullSettings.Esp.Values.Enabled
					Esp.FillColor = FullSettings.Esp.Values.FillColor
					Esp.FillTransparency = FullSettings.Esp.Values.FillTransparency
					Esp.OutlineColor = FullSettings.Esp.Values.OutlineColor
					Esp.OutlineTransparency = FullSettings.Esp.Values.OutlineTransparency
				end
			end
		end
	end
end)()
