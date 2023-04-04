local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local PersonToggle = nil

local Window = Rayfield:CreateWindow({
	Name = "Morph UI",
	LoadingTitle = "Morph UI",
	LoadingSubtitle = "By: ii_matei",
})

local Basic = Window:CreateTab("Basic", 4483362458)

local BText = Basic:CreateSection("3rd Person")

local ZoomOut = Basic:CreateToggle({
	Name = "3rd Person Toggle",
	CurrentValue = false,
	Callback = function(Value)
		if Value == true then
			task.spawn(function()
				PersonToggle = game:GetService("RunService").RenderStepped:Connect(function()
					game.Workspace.CurrentCamera.CFrame = (game.Players.LocalPlayer.Character.Head.CFrame * CFrame.Angles(math.rad(-10), 0, 0)) * CFrame.new(0, 1.5, 10)
				end)
			end)
		else
			PersonToggle:Disconnect()
			task.wait()
			PersonToggle = nil
		end
	end,
})

---------------------

local Tab = Window:CreateTab("El Goblino", 4483362458)

local EGText = Tab:CreateSection("El Goblino")

local Morph = Tab:CreateButton({
	Name = "Become El Goblino",
	Callback = function()
		if not workspace:FindFirstChild("El Goblino") then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") or v:IsA("Decal") then	
					v.Transparency = 1	
				end	
			end

			local El_Goblino = game:GetObjects("rbxassetid://12802717595")[1]
			El_Goblino.Torso.Anchored = true	
			El_Goblino.Parent = workspace

			task.spawn(function()	
				game:GetService("RunService").RenderStepped:Connect(function()		
					El_Goblino:PivotTo(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0))	
				end)
			end)

			local Animation = workspace["El Goblino"]:FindFirstChildOfClass("AnimationController"):LoadAnimation(workspace["El Goblino"].Animations.Idle)
			Animation:Play()
		end
	end,
})

local Stop = Tab:CreateButton({
	Name = "Stop Morph",
	Callback = function()
		for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") or v:IsA("Decal") then
				v.Transparency = 0
				game.Players.LocalPlayer.Character.HumanoidRootPart.Transparency = 1
			end
		end

		if game.Players.LocalPlayer.Character:FindFirstChild("Collision") then
			game.Players.LocalPlayer.Character.Collision.Transparency = 1
		end

		if workspace:FindFirstChild("El Goblino") then
			workspace["El Goblino"]:Destroy()
		end
	end,
})

local Animations = Tab:CreateSection("Animations")

local Look = Tab:CreateKeybind({
	Name = "Look",
	CurrentKeybind = "Q",
	HoldToInteract = false,
	Callback = function(Keybind)
		if workspace:FindFirstChild("El Goblino") then
			local Animation = workspace["El Goblino"]:FindFirstChildOfClass("AnimationController"):LoadAnimation(workspace["El Goblino"].Animations.IdleLook)
			Animation:Play()
		end
	end,
})

--------------------

local Tab_2 = Window:CreateTab("Skeleton Bob", 4483362458)

local SBText = Tab_2:CreateSection("Skeleton Bob")

local Morph = Tab_2:CreateButton({
	Name = "Become Skeleton Bob",
	Callback = function()
		if not workspace:FindFirstChild("SkellyFriend") then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") or v:IsA("Decal") then	
					v.Transparency = 1	
				end	
			end

			local Skelly_Friend = game:GetObjects("rbxassetid://12821392730")[1]
			Skelly_Friend.Parent = workspace
			
			task.spawn(function()	
				game:GetService("RunService").RenderStepped:Connect(function()		
					Skelly_Friend:PivotTo(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -0.5, 0))	
				end)
			end)

			local Animation = workspace["SkellyFriend"]:FindFirstChildOfClass("AnimationController"):LoadAnimation(workspace["SkellyFriend"].Animations.Rest)
			Animation:Play()
		end
	end,
})

local Stop = Tab_2:CreateButton({
	Name = "Stop Morph",
	Callback = function()
		for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") or v:IsA("Decal") then
				v.Transparency = 0
				game.Players.LocalPlayer.Character.HumanoidRootPart.Transparency = 1
			end
		end

		if game.Players.LocalPlayer.Character:FindFirstChild("Collision") then
			game.Players.LocalPlayer.Character.Collision.Transparency = 1
		end

		if workspace:FindFirstChild("SkellyFriend") then
			workspace.SkellyFriend:Destroy()
		end
	end,
})
