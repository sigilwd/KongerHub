--[[
    KongerHub
]]

local gameLinks = {
    [338574920] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/3plane.lua",
    [9924209123] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/3plane.lua",
    [1962086868] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/toh.lua",
    [12355337193] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/mvsd.lua",
}

if gameLinks[game.PlaceId] ~= nil then
    loadstring(game:HttpGet(gameLinks[game.PlaceId]))()
else
    warn("KongerHub isn't supported in this game")
end
