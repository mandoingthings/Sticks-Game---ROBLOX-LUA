local Player = game.Players.LocalPlayer
local leaderstats = Player:WaitForChild("leaderstats")
local PlayerStats = Player:WaitForChild("PlayerStats")
local tweens = game:GetService("TweenService")
local Tweeninfo = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)

-- Data
local Wins = PlayerStats:WaitForChild("Wins")
local Losses = PlayerStats:WaitForChild("Losses")
local Draws = PlayerStats:WaitForChild("Draws")
local Level = PlayerStats:WaitForChild("Level")
local Cash = PlayerStats:WaitForChild("Cash")
local Experience = PlayerStats:WaitForChild("Experience")
local MaxExperience = PlayerStats:WaitForChild("MaxExperience")
if Experience.Value/MaxExperience.Value >= 0 and Experience.Value/MaxExperience.Value <= 1 then
	script.Parent.Size = UDim2.new(Experience.Value/MaxExperience.Value, 0, 1, 0)
end
script.Parent.Position = UDim2.new(0.5,0,0.5,0)
Experience.Changed:Connect(function()
	if Experience.Value/MaxExperience.Value >= 0 and Experience.Value/MaxExperience.Value <= 1 then
		local tweenSize = tweens:Create(script.Parent, Tweeninfo, {Size = UDim2.new(Experience.Value/MaxExperience.Value, 0, 1, 0), Position = UDim2.new(0.5,0,0.5,0)})
		tweenSize:Play()
	end
end)