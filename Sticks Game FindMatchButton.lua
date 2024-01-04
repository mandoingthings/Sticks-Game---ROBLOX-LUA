local Player = game.Players.LocalPlayer
local tweens = game:GetService("TweenService")
local Tweeninfo = TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local fastTweeninfo = TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)
local working = false

local PlayerGui = Player:FindFirstChild("PlayerGui")
local ScreenGui = PlayerGui:FindFirstChild("ScreenGui")
local MainFolder = ScreenGui:FindFirstChild("MainFolder")
local LobbyFolder = ScreenGui:FindFirstChild("LobbyFolder")
local PlayButton = MainFolder:FindFirstChild("PlayButton")
local MainBackground = MainFolder:FindFirstChild("MainBackground")
local AccessFolder = LobbyFolder:FindFirstChild("AccessFolder")
local StatsScreen = AccessFolder:FindFirstChild("StatsScreen")
local PlayerChoose = AccessFolder:FindFirstChild("PlayerChoose")
local Requests = AccessFolder:FindFirstChild("Requests")
local Hotbar = LobbyFolder:FindFirstChild("Hotbar")
local ExtendFrame = Hotbar:FindFirstChild("FindMatchFrame")


script.Parent.MouseButton1Click:Connect(function()
	if PlayerChoose.Visible == false then
		for i, v in ipairs(AccessFolder:GetChildren()) do
			if v:IsA("GuiObject") then
				v.Visible = false
			end
		end
		Hotbar.Visible = false
		PlayerChoose.Visible = true
			
			
			
			
	else
		PlayerChoose.Visible = false
	end
		
		
end)


script.Parent.MouseEnter:Connect(function()
	local ExtendTween = tweens:Create(ExtendFrame, fastTweeninfo, {Size = script.Parent.Size})
	ExtendTween:Play()
end)

script.Parent.MouseLeave:Connect(function()
	local ExtendTween = tweens:Create(ExtendFrame, fastTweeninfo, {Size = script.Parent.Size - UDim2.new(script.Parent.Size.X.Scale - 0.005, 0, 0, 0)})
	ExtendTween:Play()
end)





