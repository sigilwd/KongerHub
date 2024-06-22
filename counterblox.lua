local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback
--
game.StarterGui:SetCore("SendNotification",  {
 Title = "KongerHub | CS";
 Text = "KongerHub Loading";
 Icon = "";
 Duration = 3;
Callback = NotificationBindable;
})
wait(4)
local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback
--
game.StarterGui:SetCore("SendNotification",  {
 Title = "KongerHub | CS";
 Text = "Features: Team Esp, Right Click Aimlock";
 Icon = "";
 Duration = 3;
Callback = NotificationBindable;
})

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- Function to create the ESP tag and highlight
local function createESPTags(player)
    -- Check if the player is not the local player
    if player ~= localPlayer then
        -- Wait for the character to be available
        player.CharacterAdded:Connect(function(character)
            local head = character:WaitForChild("Head")
            
            -- Create a BillboardGui
            local billboardGui = Instance.new("BillboardGui")
            billboardGui.Name = "ESPTag"
            billboardGui.Adornee = head
            billboardGui.Size = UDim2.new(0, 100, 0, 50)
            billboardGui.StudsOffset = Vector3.new(0, 2, 0)
            billboardGui.AlwaysOnTop = true
            
            -- Create a TextLabel
            local textLabel = Instance.new("TextLabel")
            textLabel.Parent = billboardGui
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = player.Name
            textLabel.TextSize = 14 -- Set a fixed text size
            textLabel.Font = Enum.Font.SourceSansBold
            
            -- Set the text color based on the team
            if player.Team then
                textLabel.TextColor3 = player.Team.TeamColor.Color
            end
            
            -- Parent the BillboardGui to the player's head
            billboardGui.Parent = head
            
            -- Create a Highlight
            local highlight = Instance.new("Highlight")
            highlight.Name = "ESPTorsoHighlight"
            highlight.Adornee = character
            highlight.FillTransparency = 1
            highlight.OutlineTransparency = 0.5 -- Semi-transparent outline
            
            -- Set the outline color based on the team
            if player.Team then
                highlight.OutlineColor = player.Team.TeamColor.Color
            end
            
            -- Parent the Highlight to the character
            highlight.Parent = character
        end)
        
        -- If the character is already loaded, create the tag and highlight immediately
        if player.Character then
            local head = player.Character:FindFirstChild("Head")
            if head then
                local billboardGui = Instance.new("BillboardGui")
                billboardGui.Name = "ESPTag"
                billboardGui.Adornee = head
                billboardGui.Size = UDim2.new(0, 100, 0, 50)
                billboardGui.StudsOffset = Vector3.new(0, 2, 0)
                billboardGui.AlwaysOnTop = true
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Parent = billboardGui
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Text = player.Name
                textLabel.TextSize = 14 -- Set a fixed text size
                textLabel.Font = Enum.Font.SourceSansBold
                
                if player.Team then
                    textLabel.TextColor3 = player.Team.TeamColor.Color
                end
                
                billboardGui.Parent = head
                
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESPTorsoHighlight"
                highlight.Adornee = player.Character
                highlight.FillTransparency = 1
                highlight.OutlineTransparency = 0.5 -- Semi-transparent outline
                
                if player.Team then
                    highlight.OutlineColor = player.Team.TeamColor.Color
                end
                
                highlight.Parent = player.Character
            end
        end
    end
end

-- Function to handle player removal
local function onPlayerRemoving(player)
    if player.Character then
        local head = player.Character:FindFirstChild("Head")
        if head then
            local espTag = head:FindFirstChild("ESPTag")
            if espTag then
                espTag:Destroy()
            end
        end
        if player.Character then
            local highlight = player.Character:FindFirstChild("ESPTorsoHighlight")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end

-- Connect the PlayerAdded and PlayerRemoving events
Players.PlayerAdded:Connect(createESPTags)
Players.PlayerRemoving:Connect(onPlayerRemoving)

-- For players who are already in the game when the script runs
for _, player in ipairs(Players:GetPlayers()) do
    createESPTags(player)
end

local teamCheck = true
local fov = 150
local smoothing = 1

local RunService = game:GetService("RunService")

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 1.5
FOVring.Radius = fov
FOVring.Transparency = 0
FOVring.Color = Color3.fromRGB(0,0,0)
FOVring.Position = workspace.CurrentCamera.ViewportSize/2

local function getClosest(cframe)
   local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
   
   local target = nil
   local mag = math.huge
   
   for i,v in pairs(game.Players:GetPlayers()) do
       if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer and (v.Team ~= game.Players.LocalPlayer.Team or (not teamCheck)) then
           local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
           
           if magBuf < mag then
               mag = magBuf
               target = v
           end
       end
   end
   
   return target
end

loop = RunService.RenderStepped:Connect(function()
   local UserInputService = game:GetService("UserInputService")
   local pressed = --[[UserInputService:IsKeyDown(Enum.KeyCode.E)]] UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) --Enum.UserInputType.MouseButton2
   local localPlay = game.Players.localPlayer.Character
   local cam = workspace.CurrentCamera
   local zz = workspace.CurrentCamera.ViewportSize/2
   
   if pressed then
       local Line = Drawing.new("Line")
       local curTar = getClosest(cam.CFrame)
       local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
       ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
       if (ssHeadPoint - zz).Magnitude < fov then
           workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), smoothing)
       end
   end
   
   if UserInputService:IsKeyDown(Enum.KeyCode.Delete) then
       loop:Disconnect()
       FOVring:Remove()
   end
end)
