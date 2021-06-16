-----------------------
-- Made by Huse#5445 --
-----------------------

-- ROBBING
stoprobbery = false
status1 = false
status2 = false
status3 = false
status4 = false
status5 = false

-- STARTUP SETTINGS --
HuseRobberyClient = false
HuseTimer1 = 0
HuseRobberyRobber = false
timer = 0
TriggerServerEvent('HuseRobbery:TjekStatus')

-- Objects
CreateObject(GetHashKey("p_secret_weapon_02"), 1057.8694853516,-3102.603515625,-40.1, true, true, true); 
CreateObject(GetHashKey("prop_box_wood05a"), 1065.1761474609,-3095.2573242188,-40.1, true, true, true);  
CreateObject(GetHashKey("prop_boxpile_02c"), 1052.9812011719,-3095.2573242188,-40.1, true, true, true);
CreateObject(GetHashKey("prop_box_wood04a"), 1065.1080322266,-3110.1748046875,-40.1, true, true, true);
--


-- TRÅDE --
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cfg.DoorCoord.x, cfg.DoorCoord.y, cfg.DoorCoord.z, true ) < 10 then
            DrawMarker(20, cfg.DoorCoord.x, cfg.DoorCoord.y, cfg.DoorCoord.z-0.2, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 0, 0, 200, 0, 0, 0, 1)
        end
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cfg.DoorCoord.x, cfg.DoorCoord.y, cfg.DoorCoord.z, true ) < 1 then
            if HuseRobberyClient == false then
                DrawText3Ds(cfg.DoorCoord.x, cfg.DoorCoord.y, cfg.DoorCoord.z+0.3, "Tryk ~w~[~g~E~w~] for at hacke kodelåsen")
                if IsControlJustReleased(1, 38) then
                    TriggerServerEvent('HuseRobbery:Startet')
                    TriggerServerEvent('HuseRobbery:PolitiOpkald')
                end
            else 
                DrawText3Ds(cfg.DoorCoord.x, cfg.DoorCoord.y, cfg.DoorCoord.z, "~r~Ikke tilgængligt")
            end
        end
        if HuseRobberyRobber == true then
            if HuseTimer1 > 0 then
                ply_drawTxt("Du har ~r~"..HuseTimer1.."~w~ sekunder tilbage i varehuset",4,1,0.5,0.90,0.5,255,255,255,255)
            else
                stoprobbery = true
                status1 = true
                status2 = true
                status3 = true
                status4 = true
                status5 = true
                TriggerEvent('HuseRobbery:Slut')
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
            if HuseRobberyClient == true then
                if stoprobbery == false then
                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1048.7315673828,-3097.1096191406,-38.999908447266, true ) < 5 then
                        DrawMarker(20, 1048.7315673828,-3097.1096191406,-38.999908447266-0.2, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 0, 0, 200, 0, 0, 0, 1)
                    end
                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1048.7315673828,-3097.1096191406,-38.999908447266, true ) < 2 then
                        DrawText3Ds(1048.7315673828,-3097.1096191406,-38.999908447266+0.3, "Tryk ~w~[~g~E~w~] for at stoppe røveriet")
                        if IsControlJustReleased(1, 38) then
                            HuseTimer1 = 0
                        end 
                    end
                end
                if status1 == false then
                    DrawMarker(27, 1057.9858398438,-3101.2170410156,-40.1+0.1, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
                end
                if status2 == false then
                    DrawMarker(27, 1065.201171875,-3096.6115722656,-40.1+0.1, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
                end
                if status3 == false then
                    DrawMarker(27, 1052.9997558594,-3096.697265625,-40.1+0.1, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
                end
                if status4 == false then
                    DrawMarker(27, 1065.1254882812,-3108.7915039062,-40.1+0.1, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
                end
                if status5 == false then
                    DrawMarker(27, 1049.0548095703,-3100.7004394531,-40.1+0.1, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.21, 255, 0, 0, 200, 0, 0, 0, 1)
                end
                if position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 1057.8446044922,-3101.5234375,-38.999927520752, 1) then
                    if status1 == false then
                        DrawText3Ds(1057.8446044922,-3101.5234375,-38.999927520752, "~w~[~g~E~w~] for at stjæle fra kassen.")
                        if IsControlJustReleased(1, 38) then
							TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER")
							FreezeEntityPosition(PlayerPedId(),true)
                            exports['progressBars']:startUI(50000, "Stjæler fra kassen")	
                            Citizen.Wait(50000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            FreezeEntityPosition(PlayerPedId(),false)
                            TriggerServerEvent('HuseRobbery:ammo')
                            status1 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 1065.201171875,-3096.6115722656,-38.999919891357, 1) then
                    if status2 == false then
                        DrawText3Ds(1065.201171875,-3096.6115722656,-38.999919891357, "~w~[~g~E~w~] for at stjæle fra kassen.")
                        if IsControlJustReleased(1, 38) then
							TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER")
							FreezeEntityPosition(PlayerPedId(),true)
                            exports['progressBars']:startUI(40000, "Stjæler fra kassen")	
                            Citizen.Wait(40000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            FreezeEntityPosition(PlayerPedId(),false)
                            TriggerServerEvent('HuseRobbery:drug')
                            status2 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 1052.9997558594,-3096.697265625,-38.966594696045, 1) then
                    if status3 == false then
                        DrawText3Ds(1052.9997558594,-3096.697265625,-38.966594696045, "~w~[~g~E~w~] for at stjæle fra kassen.")
                        if IsControlJustReleased(1, 38) then
							TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER")
							FreezeEntityPosition(PlayerPedId(),true)
                            exports['progressBars']:startUI(30000, "Stjæler fra kassen")	
                            Citizen.Wait(30000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            FreezeEntityPosition(PlayerPedId(),false)
                            TriggerServerEvent('HuseRobbery:store')
                            status3 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 1065.1254882812,-3108.7915039062,-38.999908447266, 1) then
                    if status4 == false then
                        DrawText3Ds(1065.1254882812,-3108.7915039062,-38.999908447266, "~w~[~g~E~w~] for at stjæle fra kassen.")
                        if IsControlJustReleased(1, 38) then
							TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER")
							FreezeEntityPosition(PlayerPedId(),true)
                            exports['progressBars']:startUI(40000, "Stjæler fra kassen")	
                            Citizen.Wait(40000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            FreezeEntityPosition(PlayerPedId(),false)
                            TriggerServerEvent('HuseRobbery:drug')
                            status4 = true
                        end
                    end
                elseif position_verf(playerLoc.x, playerLoc.y, playerLoc.z, 1049.0548095703,-3100.7004394531,-38.999931335449, 1) then
                    if status5 == false then
                        DrawText3Ds(1049.0548095703,-3100.7004394531,-38.999931335449, "~w~[~g~E~w~] for at hacke computeren.")
                        if IsControlJustReleased(1, 38) then
							TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER")
							FreezeEntityPosition(PlayerPedId(),true)
                            exports['progressBars']:startUI(30000, "Hacker computeren")	
                            Citizen.Wait(30000)
                            ClearPedTasksImmediately(GetPlayerPed(-1))
                            FreezeEntityPosition(PlayerPedId(),false)
                            TriggerServerEvent('HuseRobbery:computer')
                            status5 = true
                        end  
                end         
            end
        end
    end
end)

-- Events --

RegisterNetEvent('HuseRobbery:StatusUpdate')
RegisterNetEvent('HuseRobbery:Start')
RegisterNetEvent('HuseRobbery:Hack2')
RegisterNetEvent('HuseRobbery:Slut')
RegisterNetEvent('HuseRobbery:Reset')

AddEventHandler('HuseRobbery:StatusUpdate', function(ServerStatus)
    HuseRobberyClient = ServerStatus
end)

AddEventHandler('HuseRobbery:Start', function()
    HuseRobberyRobber = true
    HuseTimer1 = cfg.HuseTimer*60
    while HuseRobberyClient == true do
        Citizen.Wait(1000)
        if HuseTimer1 > 0 then
            HuseTimer1 = HuseTimer1-1
        end
    end
end)

AddEventHandler('HuseRobbery:Hack2', function()
    hackingstarted = true
    tarminalibrug = true
    FreezeEntityPosition(GetPlayerPed(-1),true)
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start",6,40,mycb)
end)

AddEventHandler('HuseRobbery:Slut', function()
    if timer == 0 then
        DoScreenFadeOut(1000)
        while IsScreenFadingOut() do Citizen.Wait(0) end
        NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
        SetEntityCoords(GetPlayerPed(-1), cfg.SLO.x, cfg.SLO.y, cfg.SLO.z)
        SetEntityHeading(GetPlayerPed(-1), 151.6213684082)
        NetworkFadeInEntity(GetPlayerPed(-1), 0)
        timer = 1
        SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
        DoScreenFadeIn(2000)
        while IsScreenFadingIn() do Citizen.Wait(0)	end
        ClearPedTasksImmediately(GetPlayerPed(-1))
        FreezeEntityPosition(PlayerPedId(),false)
        exports['progressBars']:startUI(0, "Slut")
        HuseTimer1 = 0
        TriggerEvent('HuseRobbery:Reset')
    end
end) 

-- FUNCTIONS

function mycb(success, timeremaining)
	if success then
		plyPos = GetEntityCoords(GetPlayerPed(-1))
		korrecthack = true
		TriggerEvent('hacking:success')
		TriggerEvent('mhacking:hide')
        TriggerEvent('HuseRobbery:Start', source)

        local targetPed =GetPlayerPed(-1)
        DoScreenFadeOut(1000)
        while IsScreenFadingOut() do Citizen.Wait(0) end
        NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
        Wait(1000)
        SetEntityCoordsNoOffset(targetPed, 1048.7315673828,-3097.1096191406,-38.999908447266, 0, 0, 1)		
        SetEntityHeading(targetPed, 151.6213684082)
        NetworkFadeInEntity(GetPlayerPed(-1), 0)
        Wait(1000)
        SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
        DoScreenFadeIn(1000)
        while IsScreenFadingIn() do Citizen.Wait(0)
		FreezeEntityPosition(GetPlayerPed(-1),false)

		hackingstarted = false
        end
	else
		TriggerEvent('mhacking:hide')
		FreezeEntityPosition(GetPlayerPed(-1),false)	
		terminalibrug = false
		hackingstarted = false
        Citizen.Wait(2500)
        TriggerServerEvent('HuseRobbery:Reset2')	
	end
end

function position_verf(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

function ply_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end	

-----------------------
-- Made by Huse#5445 --
-----------------------