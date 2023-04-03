local player = game.Players.LocalPlayer
local id = player.UserID
function eatbananaone(theplayer)
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name == "BananaPeel" then
			v.CFrame = theplayer.Character.HumanoidRootPart.CFrame
			return
		end
	end
end
function bananadeath(theplayer)
	theplayer.Character.HumanoidRootPart.Anchored = true
	repeat
	task.wait(0.01)
	for i,v in pairs(workspace:GetChildren()) do
		if v.Name == "BananaPeel" then
			v.CFrame = theplayer.Character.HumanoidRootPart.CFrame
		end
	end
	until theplayer.Character.Humanoid.Health == 0
end

local chat = game:GetService("CoreGui").ExperienceChat.appLayout.chatWindow.scrollingView.bottomLockedScrollView.RCTScrollView.RCTScrollContentView
chat.ChildAdded:Connect(function (child)
	if string.find(child.Name,id) then
		local check = string.find(child.text, ";")
		if check then
			local command = string.sub(child.text,check)
			for i,splayer in pairs(game:GetService("Players"):GetPlayers()) do
				if string.find(command,splayer.Name) and string.find(command,"kill") then
					splayer.Character.Head:Destroy()
				elseif string.find(command,splayer.Name) and string.find(command,"eatbanana") then
					eatbananaone(splayer)
				elseif string.find(command,splayer.Name) and string.find(command,"bananadeath") then
					bananadeath(splayer)
				elseif string.find(command,splayer.Name) and string.find(command,"freeze") then
					splayer.Character.HumanoidRootPart.Anchored = true
				elseif string.find(command,splayer.Name) and string.find(command,"UnFreeze") then
					splayer.Character.HumanoidRootPart.Anchored = false
                elseif string.find(command,splayer.Name) and string.find(command,"kick") then
					if splayer.Name == player.Name then
                        player:kick("YOU GOT KICKED BY MAIN OHIO ADMIN")
                    end
				elseif string.find(command,"hehe") then
					local sound = Instance.new("Sound", game.Workspace)
					sound.SoundId = "rbxassetid://5602666105"
					sound.Volume = 100000
					sound:Play()
				end
			end
		end
	end
end)
