--[[
    KongerHub
]]
setfpscap(10000)

local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")


ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.JosefinSans
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 40.000

-- Scripts:

local function DWOW_fake_script()
	local script = Instance.new('LocalScript', TextLabel)

	local TextLabel = script.Parent
	local Text
	
	function SoundEffect()
		local Sound = Instance.new("Sound", workspace)
		Sound.Name = "TextSound"
		Sound.SoundId = "http://www.roblox.com/asset/?id=421058925"
		Sound.PlaybackSpeed = 1
		Sound.Volume = 1
		Sound:Play()
		coroutine.resume(coroutine.create(function()
			wait(1)
			Sound:Destroy()
		end))
	end
	
	function setText(word)
		Text = word
		for i = 1, #Text do
			TextLabel.Text = string.sub(Text, 1, i) 
			SoundEffect()
			TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
		end
	end
	
	setText("KongerHub Loading...")
	wait(2)
	setText("KongerHub Loaded...")
	wait(2)
	setText("Report any bugs to the discord! discord.gg/VaknRYWH48")
	wait(5)
	TextLabel.Visible = false
end
coroutine.wrap(DWOW_fake_script)()

wait(8.5)
local gameLinks = {
    [1962086868] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/toh.lua",
    [12355337193] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/mvsd.lua",
    [3214114884] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/flagwars.lua",
    [6722284015] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/pistol1v1.lua",
    [4410049285] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/drivingsimulator.lua",
    [13771457545] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/mvsd.lua",
    [13775113583] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/mvsd.lua",
}

if gameLinks[game.PlaceId] ~= nil then
    loadstring(game:HttpGet(gameLinks[game.PlaceId]))()
else
    game.Players.LocalPlayer:Kick("Exploiting is a bannable offense. This action log has been submitted to ROBLOX. (This is a Joke)")
end
