--[[

██╗░░░░░███████╗███████╗  ░█████╗░░██╗░░░░░░░██╗███╗░░██╗░██████╗  ████████╗██╗░░██╗██╗░██████╗
██║░░░░░██╔════╝██╔════╝  ██╔══██╗░██║░░██╗░░██║████╗░██║██╔════╝  ╚══██╔══╝██║░░██║██║██╔════╝
██║░░░░░█████╗░░█████╗░░  ██║░░██║░╚██╗████╗██╔╝██╔██╗██║╚█████╗░  ░░░██║░░░███████║██║╚█████╗░
██║░░░░░██╔══╝░░██╔══╝░░  ██║░░██║░░████╔═████║░██║╚████║░╚═══██╗  ░░░██║░░░██╔══██║██║░╚═══██╗
███████╗███████╗███████╗  ╚█████╔╝░░╚██╔╝░╚██╔╝░██║░╚███║██████╔╝  ░░░██║░░░██║░░██║██║██████╔╝
╚══════╝╚══════╝╚══════╝  ░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝░░╚══╝╚═════╝░  ░░░╚═╝░░░╚═╝░░╚═╝╚═╝╚═════╝░

--]]

local function callback(Text)
	if Text == "Kill Plane" then
		game.Players.LocalPlayer:Kick("Killing Plane Requires Leaving.")
	end
end

local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback
--
game.StarterGui:SetCore("SendNotification",  {
	Title = "KONGERHub | Plane Destroyer";
	Text = "By clicking Kill Plane a random plane will breakdown.";
	Icon = "http://www.roblox.com/asset/?id=11948153542";
	Duration = 100000000000000000000000000;
	Button1 = "Kill Plane";
	Callback = NotificationBindable;
})
gui = game.CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt")

gui.Size = UDim2.new(0, 400, 0, 230)

leave = gui.MessageArea.ErrorFrame.ButtonArea.LeaveButton

gui.MessageArea.MessageAreaPadding.PaddingTop = UDim.new(0,-20)
gui.MessageArea.ErrorFrame.ErrorFrameLayout.Padding = UDim.new(0, 5)

gui.MessageArea.ErrorFrame.ButtonArea.ButtonLayout.CellPadding = UDim2.new(0, 0, 0, 5)

rejoin = leave:Clone()
rejoin.Parent = leave.Parent
rejoin.ButtonText.Text = "See Damage Caused"

Players = game:GetService("Players")
TeleportService = game:GetService("TeleportService")

rejoin.MouseButton1Up:Connect(function()
	if #Players:GetPlayers() <= 1 then
		TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
	else
		TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
	end
end)
