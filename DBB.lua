local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("doomspire brickbattle tp's", "Midnight")

local TpTab = Window:NewTab("Teleports")

local TpSection = TpTab:NewSection("Teleports")

--top

TpSection:NewButton("Red Top", "Teleports you to the Top of red tower", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-93,131,-0)
end)

TpSection:NewButton("Blue Top", "Teleports you to the Top of Blue tower", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,131,94)
end)

TpSection:NewButton("Yellow Top", "Teleports you to the Top of Yellow tower", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(94,131,0)
end)

TpSection:NewButton("Green Top", "Teleports you to the Top of Green tower", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1,131,-94)
end)

--bottom

TpSection:NewButton("Red Bottom", "Teleports you to the bottom of Red tower", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-131,25,-1.5)
end)

TpSection:NewButton("Blue Bottom", "Teleports you to the bottom of blue tower", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.4,25,131)
end)

TpSection:NewButton("Yellow Bottom", "Teleports you to the Bottom of yellow tower", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(131,25,-1.5 )
end)

TpSection:NewButton("Green bottom", "Teleports you to the Bottom of Green tower", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.4,25,-131)
end)