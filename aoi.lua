--[[
    KongerHub
]]
setfpscap(10000)
local gameLinks = {
    [1962086868] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/toh.lua",
    [12355337193] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/mvsd.lua",
    [3214114884] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/flagwars.lua",
    [6722284015] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/pistol1v1.lua",
    [4410049285] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/drivingsimulator.lua",
}

if gameLinks[game.PlaceId] ~= nil then
    loadstring(game:HttpGet(gameLinks[game.PlaceId]))()
else
    game.Players.LocalPlayer:Kick("Not a supported game for KongerHub.")
end
