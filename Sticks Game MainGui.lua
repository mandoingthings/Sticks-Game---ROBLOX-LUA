local Player = game.Players.LocalPlayer
local leaderstats = Player:WaitForChild("leaderstats")
local PlayerStats = Player:WaitForChild("PlayerStats")
local Wins = PlayerStats:WaitForChild("Wins")
local Losses = PlayerStats:WaitForChild("Losses")
local Playing = PlayerStats:WaitForChild("Playing")
local Opponent = PlayerStats:WaitForChild("Opponent")
local tweens = game:GetService("TweenService")
local Tweeninfo = TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)
local ScreenGui = script.Parent
local MainFolder = ScreenGui:WaitForChild("MainFolder")
local LobbyFolder = ScreenGui:WaitForChild("LobbyFolder")
local PlayButton = MainFolder:WaitForChild("PlayButton")
local MainBackground = MainFolder:FindFirstChild("MainBackground")

local Started = ScreenGui:FindFirstChild("Started")


for i, v in ipairs(ScreenGui:GetChildren()) do
	if v:IsA("Folder") and v.Name ~= "MainFolder" then
		for i, b in ipairs(v:GetChildren()) do
			if b:IsA("GuiObject") then
				b.Visible = false
			elseif v:IsA("Folder") then
				for i, d in ipairs(v:GetChildren()) do
					if d:IsA("GuiObject") then
						d.Visible = false
					end
				end

			end
		end
	elseif v:IsA("Folder") and v.Name == "MainFolder" then
		for i, b in ipairs(v:GetChildren()) do
			if b:IsA("GuiObject") then
				b.Visible = true
			end
		end
	
	end
	
end


local function StartedGame()
	for i, v in ipairs(LobbyFolder:GetChildren()) do
		if v:IsA("GuiObject") then			
			v.Visible = true
			v.Position = v.Position + UDim2.new(0,0,0.05,0)
			local tweenUp = tweens:Create(v, Tweeninfo, {Position = v.Position - UDim2.new(0,0,0.05,0)})	
			tweenUp:Play()
			
		elseif v:IsA("Folder") then
			for i, b in ipairs(v:GetChildren()) do
				if b:IsA("GuiObject") then
					b.Visible = false
				end
			end
		
		end
	end
	
	
	
	
	
	
	
	
end










PlayButton.MouseButton1Click:Connect(function()
	
	PlayButton.Active = false
	local Invert = tweens:Create(PlayButton, Tweeninfo, {BackgroundColor3 = Color3.new(0,0,0), TextColor3 = Color3.new(1,1,1)})
	Invert:Play()
	
	Invert.Completed:Connect(function()
		wait(0.3)
		PlayButton.Visible = false
		Started.Value = true
		
	end)
	
end)


Started.Changed:Connect(function()
	if Started.Value == true then
		
		StartedGame()
		
		
		
		
		
		
		
		
		
		
		
	end
end)