local RepS = game:GetService("ReplicatedStorage")
local ResetStatsEvent = RepS:WaitForChild("ResetStatsEvent")
local PlayingEvent = RepS:WaitForChild("PlayingEvent")
local tweens = game:GetService("TweenService")
local Tweeninfo = TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)


ResetStatsEvent.OnServerEvent:Connect(function(Player)
	local leaderstats = Player:WaitForChild("leaderstats")
	local PlayerStats = Player:WaitForChild("PlayerStats")
	local Wins = PlayerStats:WaitForChild("Wins")
	local Losses = PlayerStats:WaitForChild("Losses")
	local Playing = PlayerStats:WaitForChild("Playing")
	local Opponent = PlayerStats:WaitForChild("Opponent")
	local Draws = PlayerStats:WaitForChild("Draws")
	local Level = PlayerStats:WaitForChild("Level")
	local Cash = PlayerStats:WaitForChild("Cash")
	Wins.Value = 0
	Draws.Value = 0
	Losses.Value = 0
	Level.Value = 0
	
end)


PlayingEvent.OnServerEvent:Connect(function(Player, OpponentNow, Activity)
	local leaderstats = Player:FindFirstChild("leaderstats")
	local PlayerStats = Player:FindFirstChild("PlayerStats")
	local Wins = PlayerStats:FindFirstChild("Wins")
	local Losses = PlayerStats:FindFirstChild("Losses")
	local Playing = PlayerStats:FindFirstChild("Playing")
	local Opponent = PlayerStats:FindFirstChild("Opponent")
	local Draws = PlayerStats:FindFirstChild("Draws")
	local Level = PlayerStats:FindFirstChild("Level")
	local Cash = PlayerStats:FindFirstChild("Cash")
	local PlayerGui = Player:FindFirstChild("PlayerGui")
	local ScreenGui = PlayerGui:FindFirstChild("ScreenGui")
	local MainFolder = ScreenGui:FindFirstChild("MainFolder")
	local LobbyFolder = ScreenGui:FindFirstChild("LobbyFolder")
	local PlayButton = MainFolder:FindFirstChild("PlayButton")
	local MainBackground = MainFolder:FindFirstChild("MainBackground")
	local AccessFolder = LobbyFolder:FindFirstChild("AccessFolder")
	local StatsScreen = AccessFolder:FindFirstChild("StatsScreen")
	local PlayerChoose = AccessFolder:FindFirstChild("PlayerChoose")
	local Request = script.Request
	local RequestList = {}
	
	if Playing.Value == false and game.Players:FindFirstChild(OpponentNow) then
		local Oleaderstats = game.Players:FindFirstChild(OpponentNow):FindFirstChild("leaderstats")
		local OPlayerStats = game.Players:FindFirstChild(OpponentNow):FindFirstChild("PlayerStats")
		local OWins = OPlayerStats:FindFirstChild("Wins")
		local OLosses = OPlayerStats:FindFirstChild("Losses")
		local OPlaying = PlayerStats:FindFirstChild("Playing")
		local OOpponent = OPlayerStats:FindFirstChild("Opponent")
		local ODraws = OPlayerStats:FindFirstChild("Draws")
		local OLevel = OPlayerStats:FindFirstChild("Level")
		local OCash = OPlayerStats:FindFirstChild("Cash")
		
		local OPlayerGui = game.Players:FindFirstChild(OpponentNow):FindFirstChild("PlayerGui")
		local OScreenGui = OPlayerGui:FindFirstChild("ScreenGui")
		local OMainFolder = OScreenGui:FindFirstChild("MainFolder")
		local OLobbyFolder = OScreenGui:FindFirstChild("LobbyFolder")
		local OPlayButton = OMainFolder:FindFirstChild("PlayButton")
		local OMainBackground = OMainFolder:FindFirstChild("MainBackground")
		local OAccessFolder = OLobbyFolder:FindFirstChild("AccessFolder")
		local OStatsScreen = OAccessFolder:FindFirstChild("StatsScreen")
		local OPlayerChoose = OAccessFolder:FindFirstChild("PlayerChoose")
		local ORequests = OAccessFolder:FindFirstChild("Requests")
		
		for i,v in ipairs(ORequests:GetChildren()) do
			if v:IsA("GuiObject") then
				table.insert(RequestList, v.Name)
			end
		end
		
		if table.find(RequestList, Player.Name) then
			
		else
			local requestClone = Request:Clone()
			requestClone.Name = Player.Name
			requestClone.Text = Player.Name
			requestClone.Parent = ORequests
			
			
			
			
			
			requestClone.AcceptButton.MouseButton1Click:Connect(function()
				local RightHandIn = true
				local LeftHandIn = true
				local ORightHandIn = true
				local OLeftHandIn = true
				
				print("Accepted")
				Playing.Value = true
				OPlaying.Value = true
				
				Opponent.Value = OpponentNow
				OOpponent.Value = Player.Name
				--for i, v in ipairs(ScreenGui:GetChildren()) do
				--	if v:IsA("Folder") and v.Name ~= "MainFolder" then
				--		for i, b in ipairs(v:GetChildren()) do
				--			if b:IsA("GuiObject") then
				--				b.Visible = false
				--			elseif v:IsA("Folder") then
				--				for i, d in ipairs(b:GetChildren()) do
				--					if d:IsA("GuiObject") then
				--						d.Visible = false
				--					end
				--				end

				--			end
				--		end
				--	elseif v:IsA("Folder") and v.Name == "MainFolder" then
				--		for i, b in ipairs(v:GetChildren()) do
				--			if b:IsA("GuiObject") then
				--				b.Visible = true
				--			end
				--		end

				--	end

				--end
				--for i, v in ipairs(OScreenGui:GetChildren()) do
				--	if v:IsA("Folder") and v.Name ~= "MainFolder" then
				--		for i, b in ipairs(v:GetChildren()) do
				--			if b:IsA("GuiObject") then
				--				b.Visible = false
				--			elseif v:IsA("Folder") then
				--				for i, d in ipairs(b:GetChildren()) do
				--					if d:IsA("GuiObject") then
				--						d.Visible = false
				--					end
				--				end

				--			end
				--		end
				--	end
				--end
				
				
				
				
				local GameFolder = ScreenGui:FindFirstChild("GameFolder")
				local SticksFolder = GameFolder:FindFirstChild("SticksFolder")
				local LeftFolder = SticksFolder:FindFirstChild("LeftFolder"):FindFirstChild("Frame")
				local RightFolder = SticksFolder:FindFirstChild("RightFolder"):FindFirstChild("Frame")
				local OtherRightFolder = SticksFolder:FindFirstChild("ORightFolder"):FindFirstChild("Frame")
				local OtherLeftFolder = SticksFolder:FindFirstChild("OLeftFolder"):FindFirstChild("Frame")
				local RightHandSticks = PlayerStats:FindFirstChild("RightHandSticks")
				local LeftHandSticks = PlayerStats:FindFirstChild("LeftHandSticks")
				local OGameFolder = OScreenGui:FindFirstChild("GameFolder")
				local OSticksFolder = OGameFolder:FindFirstChild("SticksFolder")
				local OLeftFolder = OSticksFolder:FindFirstChild("LeftFolder"):FindFirstChild("Frame")
				local ORightFolder = OSticksFolder:FindFirstChild("RightFolder"):FindFirstChild("Frame")
				local OOtherRightFolder = OSticksFolder:FindFirstChild("ORightFolder"):FindFirstChild("Frame")
				local OOtherLeftFolder = OSticksFolder:FindFirstChild("OLeftFolder"):FindFirstChild("Frame")
				local ORightHandSticks = OPlayerStats:FindFirstChild("RightHandSticks")
				local OLeftHandSticks = OPlayerStats:FindFirstChild("LeftHandSticks")
				local PlayersTurn = GameFolder:FindFirstChild("PlayersTurn")
				local OPlayersTurn = OGameFolder:FindFirstChild("PlayersTurn")
				local PlayerMoving = GameFolder:FindFirstChild("PlayerMoving")
				local OPlayerMoving = OGameFolder:FindFirstChild("PlayerMoving")

				
				
				
				local function disappearGui()
					for i, v in ipairs(LobbyFolder:GetDescendants()) do
						if v:IsA("GuiObject") then
							v.Visible = true
							v.Visible = false
						end
					end
					for i, v in ipairs(OLobbyFolder:GetDescendants()) do
						if v:IsA("GuiObject") then
							v.Visible = true
							v.Visible = false
						end
					end
					
				end
				
				disappearGui()
				
				
				for i, v in ipairs(GameFolder:GetDescendants()) do
					if v:IsA("GuiObject") and v.Name ~= "Click" and v.Name ~= "Select" and v.Name ~= "Hit" then
						v.Visible = true
					end
				end
				for i, v in ipairs(OGameFolder:GetDescendants()) do
					if v:IsA("GuiObject") and v.Name ~= "Click" and v.Name ~= "Select" and v.Name ~= "Hit" then
						v.Visible = true
					end
				end
				--LeftFolder.Visible = true
				--RightFolder.Visible = true
				--OtherRightFolder.Visible = true
				--OtherLeftFolder.Visible = true
				--OOtherRightFolder.Visible = true
				--OOtherLeftFolder.Visible = true
				--ORightFolder.Visible = true
				--OLeftFolder.Visible = true
				RightHandSticks.Value = 1
				LeftHandSticks.Value = 1
				ORightHandSticks.Value = 1
				OLeftHandSticks.Value = 1
				
				local function disperseSticks()
					for i, v in ipairs(LeftFolder:GetChildren()) do
						if v:IsA("GuiObject") then
							v:Destroy()
						end
					end
					for _ = 1, LeftHandSticks.Value do
						local stickClone = script.Stick:Clone()
						stickClone.Parent = LeftFolder
					end
					
					for i, v in ipairs(OtherLeftFolder:GetChildren()) do
						if v:IsA("GuiObject") then
							v:Destroy()
						end
					end
					for _ = 1, OLeftHandSticks.Value do
						local stickClone = script.Stick:Clone()
						stickClone.Parent = OtherLeftFolder
					end
					
					for i, v in ipairs(RightFolder:GetChildren()) do
						if v:IsA("GuiObject") then
							v:Destroy()
						end
					end
					for _ = 1, RightHandSticks.Value do
						local stickClone = script.Stick:Clone()
						stickClone.Parent = RightFolder
					end
					
					for i, v in ipairs(OtherRightFolder:GetChildren()) do
						if v:IsA("GuiObject") then
							v:Destroy()
						end
					end
					for _ = 1, ORightHandSticks.Value do
						local stickClone = script.Stick:Clone()
						stickClone.Parent = OtherRightFolder
					end
					------------------------------------------------------
					for i, v in ipairs(OLeftFolder:GetChildren()) do
						if v:IsA("GuiObject") then
							v:Destroy()
						end
					end
					for _ = 1, OLeftHandSticks.Value do
						local stickClone = script.Stick:Clone()
						stickClone.Parent = OLeftFolder
					end
					
					for i, v in ipairs(OOtherLeftFolder:GetChildren()) do
						if v:IsA("GuiObject") then
							v:Destroy()
						end
					end
					for _ = 1, LeftHandSticks.Value do
						local stickClone = script.Stick:Clone()
						stickClone.Parent = OOtherLeftFolder
					end
					
					for i, v in ipairs(ORightFolder:GetChildren()) do
						if v:IsA("GuiObject") then
							v:Destroy()
						end
					end
					for _ = 1, ORightHandSticks.Value do
						local stickClone = script.Stick:Clone()
						stickClone.Parent = ORightFolder
					end
					
					for i, v in ipairs(OOtherRightFolder:GetChildren()) do
						if v:IsA("GuiObject") then
							v:Destroy()
						end
					end
					for _ = 1, RightHandSticks.Value do
						local stickClone = script.Stick:Clone()
						stickClone.Parent = OOtherRightFolder
					end
				end
				
				local function finishedPlaying(Winner, Loser, Draw)
					--for i, v in ipairs(LobbyFolder:GetChildren()) do
					--	if v:IsA("GuiObject") then			
					--		v.Visible = true
					--		v.Position = v.Position + UDim2.new(0,0,0.05,0)
					--		local tweenUp = tweens:Create(v, Tweeninfo, {Position = v.Position - UDim2.new(0,0,0.05,0)})	
					--		tweenUp:Play()

					--	elseif v:IsA("Folder") then
					--		for i, b in ipairs(v:GetChildren()) do
					--			if b:IsA("GuiObject") then
					--				b.Visible = true
					--			end
					--		end

					--	end
					--end
					--for i, v in ipairs(OLobbyFolder:GetChildren()) do
					--	if v:IsA("GuiObject") then			
					--		v.Visible = true
					--		v.Position = v.Position + UDim2.new(0,0,0.05,0)
					--		local tweenUp = tweens:Create(v, Tweeninfo, {Position = v.Position - UDim2.new(0,0,0.05,0)})	
					--		tweenUp:Play()

					--	elseif v:IsA("Folder") then
					--		for i, b in ipairs(v:GetChildren()) do
					--			if b:IsA("GuiObject") then
					--				b.Visible = true
					--			end
					--		end

					--	end
					--end
					Playing.Value = false
					OPlaying.Value = false
					PlayerMoving.Value = ""
					OPlayerMoving.Value = ""
					
					for i, v in ipairs(LobbyFolder:GetDescendants()) do
						if v:IsA("GuiObject") then
							v.Visible = true
						end
					end
					for i, v in ipairs(OLobbyFolder:GetDescendants()) do
						if v:IsA("GuiObject") then
							v.Visible = true
						end
					end

					
					
					for i, v in ipairs(GameFolder:GetDescendants()) do
						if v:IsA("GuiObject") then
							v.Visible = false
						end
					end
					for i, v in ipairs(OGameFolder:GetDescendants()) do
						if v:IsA("GuiObject") then
							v.Visible = false
						end
					end
					if Draw == false then
						if Winner == OpponentNow then
							OWins.Value = OWins.Value + 1
							Losses.Value = Losses.Value + 1
							
						elseif Winner == Player.Name then
							Wins.Value = Wins.Value + 1
							OLosses.Value = OLosses.Value + 1
						end
						
					else
						ODraws.Value = ODraws.Value + 1
						Draws.Value = Draws.Value + 1
					end
					
					OpponentNow = nil
						
					requestClone:Destroy()

				end
				
				
				
				local function stickChecker()
					if RightHandSticks.Value >= 5 then
						RightHandSticks.Value = 0
					end
					if LeftHandSticks.Value >= 5 then
						LeftHandSticks.Value = 0
					end
					if ORightHandSticks.Value >= 5 then
						ORightHandSticks.Value = 0
					end
					if OLeftHandSticks.Value >= 5 then
						OLeftHandSticks.Value = 0
					end
					local Winner
					local Loser
					local Draw = false
					if RightHandSticks.Value <= 0 and LeftHandSticks.Value <= 0 then
						if ORightHandSticks.Value >= 1 or OLeftHandSticks.Value >= 1 then
							Winner = Opponent.Value
							Loser = Player.Name
							Draw = false
							finishedPlaying(Winner, Loser, Draw)
						end	
					elseif ORightHandSticks.Value <= 0 and OLeftHandSticks.Value <= 0 then
						if RightHandSticks.Value >= 1 or LeftHandSticks.Value >= 1 then
							Winner = Player.Name
							Loser = Opponent.Value
							Draw = false	
							finishedPlaying(Winner, Loser, Draw)
						end
						
					elseif ORightHandSticks.Value <= 0 and OLeftHandSticks.Value <= 0 and RightHandSticks.Value <= 0 and LeftHandSticks.Value <= 0 then
							Winner = nil
							Loser = nil
							Draw = true
							finishedPlaying(Winner, Loser, Draw)
						
					
					
					end
				end
				
				disperseSticks()
				local startMove
				
				
				

				PlayerMoving.Changed:Connect(function()
					local ClickedHit = false
					local Selected = ""
					local amountAdding = 0

					for i, v in ipairs(SticksFolder:GetDescendants()) do
						if v.Name == "Frame" and v.Parent:IsA("Folder") and v.Position.Y.Scale > 0.5 then
							v.BackgroundColor3 = Color3.new(0.384314, 0.415686, 0.588235)
						elseif v.Name == "Frame" and v.Parent:IsA("Folder") and v.Position.Y.Scale < 0.5 then
							v.BackgroundColor3 = Color3.new(1, 1, 1)
						end
						if v.Name == "Hit" or v.Name == "Select" then
							if v.Parent.Parent.Position.Y.Scale > 0.5 then
								v.Visible = false
							end
						end
					end
					for i, v in ipairs(OSticksFolder:GetDescendants()) do
						if v.Name == "Frame" and v.Parent:IsA("Folder") and v.Position.Y.Scale < 0.5 then
							v.BackgroundColor3 = Color3.new(0.384314, 0.415686, 0.588235)
						elseif v.Name == "Frame" and v.Parent:IsA("Folder") and v.Position.Y.Scale > 0.5 then
							v.BackgroundColor3 = Color3.new(1, 1, 1)
						end
						if v.Name == "Hit" or v.Name == "Select" then
							if v.Parent.Parent.Position.Y.Scale > 0.5 then
								v.Visible = true
							end
						end
					end





					if PlayerMoving.Value == OpponentNow then
						for i, v in ipairs(OSticksFolder:GetDescendants()) do

							if v.Name == "Frame" and v.Parent:IsA("Folder") and v.Position.Y.Scale > 0.5 then
								v.BackgroundColor3 = Color3.new(0.384314, 0.415686, 0.588235)
							elseif v.Name == "Frame" and v.Parent:IsA("Folder") and v.Position.Y.Scale < 0.5 then
								v.BackgroundColor3 = Color3.new(1, 1, 1)
								v.MouseEnter:Connect(function()
									v:FindFirstChild("Options"):FindFirstChild("Hit").Visible = true									
									v:FindFirstChild("Options"):FindFirstChild("Hit").MouseButton1Click:Connect(function()
										if ClickedHit == false and Selected ~= "" then
											ClickedHit = true
												

												if Selected.Position.X.Scale < 0.5 then
													amountAdding = OLeftHandSticks.Value
												elseif Selected.Position.X.Scale > 0.5 then
													amountAdding = ORightHandSticks.Value
												end
												print(amountAdding)
												if v.Position.X.Scale < 0.5 then
													RightHandSticks.Value = RightHandSticks.Value + amountAdding
												elseif v.Position.X.Scale > 0.5 then
													LeftHandSticks.Value = LeftHandSticks.Value + amountAdding
												end
											Selected = ""
											wait(1)
												PlayerMoving.Value = Player.Name
												OPlayerMoving.Value = Player.Name	

										end
										print("This")
									end)
									print("Or This")
								end)
								v.MouseLeave:Connect(function()
									v:FindFirstChild("Options"):FindFirstChild("Hit").Visible = false
								end)
							end


















							if v.Name == "Hit" or v.Name == "Select" then
								if v.Parent.Parent.Position.Y.Scale > 0.5 then
									v.Visible = true
									v.MouseButton1Click:Connect(function()
										if v.Name == "Select" then
											print("select Debug")
											if Selected == "" then
												print("select Debug")
												if v.Parent.Parent.Position.X.Scale > 0.5 then
													if ORightHandSticks.Value > 0 then
														Selected = v.Parent.Parent
													end
												elseif v.Parent.Parent.Position.X.Scale < 0.5 then
													if OLeftHandSticks.Value > 0 then

														Selected = v.Parent.Parent
													end

												end
											end
										end

									end)

								end
							end



						end






						startMove = ""

					elseif PlayerMoving.Value == Player.Name then






						for i, v in ipairs(SticksFolder:GetDescendants()) do
							if v.Name == "Frame" and v.Parent:IsA("Folder") and v.Position.Y.Scale > 0.5 then
								v.BackgroundColor3 = Color3.new(0.384314, 0.415686, 0.588235)
							elseif v.Name == "Frame" and v.Parent:IsA("Folder") and v.Position.Y.Scale < 0.5 then
								v.BackgroundColor3 = Color3.new(1, 1, 1)
								v.MouseEnter:Connect(function()
									v:FindFirstChild("Options"):FindFirstChild("Hit").Visible = true	
									v:FindFirstChild("Options"):FindFirstChild("Hit").MouseButton1Click:Connect(function()
										if ClickedHit == false and Selected ~= "" then
											ClickedHit = true

											if Selected.Position.X.Scale < 0.5 then
												amountAdding = LeftHandSticks.Value
											elseif Selected.Position.X.Scale > 0.5 then
												amountAdding = RightHandSticks.Value
											end
											print(amountAdding)
											if v.Position.X.Scale < 0.5 then
												ORightHandSticks.Value = ORightHandSticks.Value + amountAdding
											elseif v.Position.X.Scale > 0.5 then
												OLeftHandSticks.Value = OLeftHandSticks.Value + amountAdding
											end
											Selected = ""
											wait(1)
											PlayerMoving.Value = OpponentNow
											OPlayerMoving.Value = OpponentNow

										end
									end)
								end)
								v.MouseLeave:Connect(function()
									v:FindFirstChild("Options"):FindFirstChild("Hit").Visible = false
								end)
							end
							if v.Name == "Hit" or v.Name == "Select" then
								if v.Parent.Parent.Position.Y.Scale > 0.5 then
									v.Visible = true
									v.MouseButton1Click:Connect(function()
										if v.Name == "Select" then
											print("select Debug")
											if Selected == "" then
												print("select Debug")
												if v.Parent.Parent.Position.X.Scale > 0.5 then
													if RightHandSticks.Value > 0 then
														Selected = v.Parent.Parent
													end
												elseif v.Parent.Parent.Position.X.Scale < 0.5 then
													if LeftHandSticks.Value > 0 then
														Selected = v.Parent.Parent
													end
												end
											end
										end

									end)

								end
							end












							for i, v in ipairs(SticksFolder:GetDescendants()) do
								if v.Name == "Frame" and v.Parent:IsA("Folder") and v.Position.Y.Scale > 0.5 then
									v.BackgroundColor3 = Color3.new(0.384314, 0.415686, 0.588235)
								elseif v.Name == "Frame" and v.Parent:IsA("Folder") and v.Position.Y.Scale < 0.5 then
									v.BackgroundColor3 = Color3.new(1, 1, 1)
								end
								if v.Name == "Hit" or v.Name == "Select" then
									if v.Parent.Parent.Position.Y.Scale > 0.5 then
										v.Visible = true
									end
								end
							end
							for i, v in ipairs(OSticksFolder:GetDescendants()) do
								if v.Name == "Frame" and v.Parent:IsA("Folder") and v.Position.Y.Scale < 0.5 then
									v.BackgroundColor3 = Color3.new(0.384314, 0.415686, 0.588235)
								elseif v.Name == "Frame" and v.Parent:IsA("Folder") and v.Position.Y.Scale > 0.5 then
									v.BackgroundColor3 = Color3.new(1, 1, 1)
								end
								if v.Name == "Hit" or v.Name == "Select" then
									if v.Parent.Parent.Position.Y.Scale > 0.5 then
										v.Visible = false
									end
								end
							end


							startMove = ""

						end
						
						
					elseif PlayerMoving == "" then
						

					end
					
					
				end)

				
				
					
				
				local coinFlip = math.random(1,2)
				if coinFlip == 1 then
					startMove = Player.Name
					PlayerMoving.Value = OpponentNow
					OPlayerMoving.Value = OpponentNow
				elseif coinFlip == 2 then
					startMove = OpponentNow
					PlayerMoving.Value = OpponentNow
					OPlayerMoving.Value = OpponentNow
				end
				--------------------------------------------------------
				
				
				
				
				RightHandSticks.Changed:Connect(function()
					disperseSticks()
					if Playing.Value == true then
						stickChecker()
					elseif Playing.Value == false then
						
					end
					
				end)
				LeftHandSticks.Changed:Connect(function()
					disperseSticks()
					if Playing.Value == true then
						stickChecker()
					elseif Playing.Value == false then
						
					end
					
				end)
				ORightHandSticks.Changed:Connect(function()
					disperseSticks()
					if OPlaying.Value == true then
						stickChecker()
					elseif Playing.Value == false then
						
					end
				end)
				OLeftHandSticks.Changed:Connect(function()
					disperseSticks()
					if OPlaying.Value == true then
						stickChecker()
					elseif OPlaying.Value == false then
						
					
					end
				end)

				
				
				
				
			end)
			
			
			
			
		
		end
		
		
	elseif Playing.Value == true then
		
		
		
	end

end)
