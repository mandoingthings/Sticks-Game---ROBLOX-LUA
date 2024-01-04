local DataStoreService = game:GetService("DataStoreService")
local PlayerData = DataStoreService:GetDataStore("PlayerData")

game.Players.PlayerAdded:Connect(function(Player)

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = Player

	local PlayerStats = Instance.new("Folder")
	PlayerStats.Name = "PlayerStats"
	PlayerStats.Parent = Player
	
	local Playing = Instance.new("BoolValue")
	Playing.Name = "Playing"
	Playing.Parent = PlayerStats
	Playing.Value = false
	
	local Opponent = Instance.new("StringValue")
	Opponent.Name = "Opponent"
	Opponent.Parent = PlayerStats
	Opponent.Value = ""
	
	local Wins = Instance.new("NumberValue")
	Wins.Name = "Wins"
	Wins.Parent = PlayerStats
	Wins.Value = 0
	
	local Losses = Instance.new("NumberValue")
	Losses.Name = "Losses"
	Losses.Parent = PlayerStats
	Losses.Value = 0
	
	local Draws = Instance.new("NumberValue")
	Draws.Name = "Draws"
	Draws.Parent = PlayerStats
	Draws.Value = 0
	
	local Level = Instance.new("NumberValue")
	Level.Name = "Level"
	Level.Parent = PlayerStats
	Level.Value = 0
	
	local Cash = Instance.new("NumberValue")
	Cash.Name = "Cash"
	Cash.Parent = PlayerStats
	Cash.Value = 0
	
	local Experience = Instance.new("NumberValue")
	Experience.Name = "Experience"
	Experience.Parent = PlayerStats
	Experience.Value = 0
	
	local MaxExperience = Instance.new("NumberValue")
	MaxExperience.Name = "MaxExperience"
	MaxExperience.Parent = PlayerStats
	MaxExperience.Value = Level.Value * 125
	
	local RightHandSticks = Instance.new("NumberValue")
	RightHandSticks.Name = "RightHandSticks"
	RightHandSticks.Parent = PlayerStats
	RightHandSticks.Value = 1
	
	local LeftHandSticks = Instance.new("NumberValue")
	LeftHandSticks.Name = "LeftHandSticks"
	LeftHandSticks.Parent = PlayerStats
	LeftHandSticks.Value = 1
	
	
	

	local Data
	local Success, Failure = pcall(function()
		Data = PlayerData:GetAsync(Player.UserId)
	end)
	
	if Success and Data then
		if Data[1] then
			Wins.Value = Data[1]
		end
		if Data[2] then
			Losses.Value = Data[2]
		end
		if Data[3] then
			Draws.Value = Data[3]
		end
		if Data[4] then
			Level.Value = Data[4]
		end
		if Data[5] then
			Cash.Value = Data[5]
		end
		if Data[6] then
			Experience.Value = Data[6]
		end
		MaxExperience.Value = Level.Value * 125
		
		
		
	end
	
	Level.Changed:Connect(function()
		MaxExperience.Value = Level.Value * 125
	end)
	
end)

game.Players.PlayerRemoving:Connect(function(Player)

	local leaderstats = Player:FindFirstChild("leaderstats")
	local PlayerStats = Player:FindFirstChild("PlayerStats")
	
	-- Data
	local Wins = PlayerStats:FindFirstChild("Wins")
	local Losses = PlayerStats:FindFirstChild("Losses")
	local Draws = PlayerStats:FindFirstChild("Draws")
	local Level = PlayerStats:FindFirstChild("Level")
	local Cash = PlayerStats:FindFirstChild("Cash")
	local Experience = PlayerStats:FindFirstChild("Experience")
	-- Data
	
	local Data = {
		
		-- Data Values
		Wins.Value,
		Losses.Value,
		Draws.Value,
		Level.Value,
		Cash.Value,
		Experience.Value
		-- Data Values
		
	}
	
	
	local Success, Failure = pcall(function()
		PlayerData:SetAsync(Player.UserId, Data)
	end)
	
	if Success then
		
	else
		print(Failure)
	end
	
end)

-- Bind to Close helps slow the leaving process, so the game can save

game:BindToClose(function()
	wait(0.75)
end)