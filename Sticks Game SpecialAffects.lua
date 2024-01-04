local Player = game.Players.LocalPlayer
local tweens = game:GetService("TweenService")

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
local ExtendFrame = Hotbar:FindFirstChild("MatchReqFrame")
local OriginalSpecialAffects = LobbyFolder:WaitForChild("SpecialAffects")
local counter = 0

local function createMore()
	counter = counter + 1
	local randTime = tonumber(math.random(20,50)..".".. math.random(10, 90))
	print(randTime)
	local Tweeninfo = TweenInfo.new(randTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
	local fastTweeninfo = TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)

	local SpecialAffect = OriginalSpecialAffects:Clone()
	SpecialAffect.ImageColor3 = Color3.new(math.random(1,255),math.random(1,255),math.random(1,255))
	local sizeRandom = math.random(1,5)
	local size 
	if sizeRandom == 1 then
		size = 0.06
	elseif sizeRandom == 2 then
		size = 0.07
	elseif sizeRandom == 3 then
		size = 0.08
	elseif sizeRandom == 4 then
		size = 0.1
	elseif sizeRandom == 5 then
		size = 0.12
	end
	local xPos 
	local yPos
	local xPosRandom = math.random(1,4)
	local yPosRandom = math.random(1,4)
	if xPosRandom == 1 then
		xPos = -0.5
	elseif xPosRandom == 2 then
		xPos = 0
	elseif xPosRandom == 3 then
		xPos = 1
	elseif xPosRandom == 4 then
		xPos = 1.5
	end

	if yPosRandom == 1 then
		yPos = -0.5
	elseif yPosRandom == 2 then
		yPos = 0
	elseif yPosRandom == 3 then
		yPos = 1
	elseif yPosRandom == 4 then
		yPos = 1.5
	end
	SpecialAffect.Size = UDim2.new(size, 0, size, 0)
	SpecialAffect.Position = UDim2.new(xPos, 0, yPos, 0)
	SpecialAffect.Visible = OriginalSpecialAffects.Visible
	SpecialAffect.Parent = OriginalSpecialAffects.Parent
	local randEndX = math.random(10,99)
	local randEndY = math.random(10,99)
	local endX = tonumber("0.".. randEndX)
	local endY = tonumber("0.".. randEndY)
	local tweensMove = tweens:Create(SpecialAffect, Tweeninfo, {Position = UDim2.new(endX, 0, endY, 0)})
	tweensMove:Play()
	wait(randTime - 5)
	local tweensGone = tweens:Create(SpecialAffect, fastTweeninfo, {ImageTransparency = 1})
	tweensGone:Play()
	wait(5)
	SpecialAffect:Destroy()
	counter = counter - 1
end



while true do
	if counter < 40 then
		
		spawn(createMore)
		
	else
		
	end
	
	wait(math.random(1,2))
end