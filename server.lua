-----------------------
-- Made by Huse#5445 --
-----------------------

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_HuseRobbery")

-- STARTUP SETTINGS --
HuseRobberyServer = false

-- EVENT REGISTER -- 

RegisterServerEvent('HuseRobbery:TjekStatus')
RegisterServerEvent('HuseRobbery:Startet')
RegisterServerEvent('HuseRobbery:Reset2')
RegisterServerEvent('HuseRobbery:Hack')
RegisterServerEvent('HuseRobbery:drug')
RegisterServerEvent('HuseRobbery:ammo')
RegisterServerEvent('HuseRobbery:store')
RegisterServerEvent('HuseRobbery:computer')
RegisterServerEvent('HuseRobbery:PolitiOpkald')

-- EVENT HANDLERS --
AddEventHandler('HuseRobbery:TjekStatus', function()
    local source = source
    TriggerClientEvent('HuseRobbery:StatusUpdate', source, HuseRobberyServer)
end)
AddEventHandler('HuseRobbery:Startet', function()
local source = source
local user_id = vRP.getUserId({source})
local cops = vRP.getUsersByGroup({cfg.PolitiJob})
HuseRobberyServer = true

    if vRP.hasGroup({user_id,cfg.PolitiJob}) then
        TriggerClientEvent("pNotify:SendNotification", source,{text = "Du er politi og kan derfor ikke røve!", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
    else
        if #cops <= cfg.minCops then
            TriggerClientEvent("pNotify:SendNotification", source,{text = "Der er ikke nok politi på arbejde!", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
        else
            if #cops >= cfg.minCops then
                TriggerClientEvent('HuseRobbery:StatusUpdate', -1, HuseRobberyServer)
                    if vRP.tryGetInventoryItem({user_id,cfg.Hackitem,1,true}) then
                TriggerClientEvent('HuseRobbery:Hack2', source)
                local dname = "[ HuseRobbery ]"
                local dmessage = "**HuseRobbery**\nID: ".. tostring(user_id).. " Startede et varehus røveri"
                PerformHttpRequest(cfg.Webhook, function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
			else
			TriggerClientEvent("pNotify:SendNotification", source,{text = "Du har ingen hackingtaske!", type = "error", queue = "global", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
            TriggerEvent('HuseRobbery:Reset2')
            end
        end
    end
end
end)
AddEventHandler('HuseRobbery:Reset2', function()
    HuseRobberyServer = false
    TriggerClientEvent('HuseRobbery:StatusUpdate', -1, HuseRobberyServer)
end)
AddEventHandler('HuseRobbery:drug', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveInventoryItem({user_id,cfg.Drug1type,cfg.Drug1chance,true})
        vRP.giveInventoryItem({user_id,cfg.Drug2type,cfg.Drug2chance,true})
        vRP.giveInventoryItem({user_id,cfg.Drug3type,cfg.Drug3chance,true})
    end
end)
AddEventHandler('HuseRobbery:ammo', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveInventoryItem({user_id,cfg.Ammo1type,cfg.Ammo1chance,true})
        vRP.giveInventoryItem({user_id,cfg.Ammo2type,cfg.Ammo2chance,true})
        vRP.giveInventoryItem({user_id,cfg.Ammo3type,cfg.Ammo3chance,true})
    end
end)
AddEventHandler('HuseRobbery:store', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveInventoryItem({user_id,cfg.Random1type,cfg.Random1chance,true})
        vRP.giveInventoryItem({user_id,cfg.Random2type,cfg.Random2chance,true}) 
        vRP.giveInventoryItem({user_id,cfg.Random3type,cfg.Random3chance,true})
    end
end)
AddEventHandler('HuseRobbery:computer', function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if(user_id)then
        vRP.giveMoney({user_id,cfg.Moneyamount})
    end
end)
AddEventHandler('HuseRobbery:PolitiOpkald', function()
    if math.random(1,4) == 1 then
        TriggerEvent('dispatch2', cfg.DoorCoord.x, cfg.DoorCoord.y, cfg.DoorCoord.z ,cfg.PolitiOpkaldBesked)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    Print('HuseRobbery made by Huse#5445')
end)

-----------------------
-- Made by Huse#5445 --
-----------------------