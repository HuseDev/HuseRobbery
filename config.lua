-----------------------
-- Made by Huse#5445 --
-----------------------

cfg = {}

cfg.HuseTimer = 2 -- Timer i minutter indenfor
cfg.ResetTime = 30 -- Timer i minutter til reset
cfg.Hackitem = "virus" -- Det item som du skal bruge til at hacke
cfg.DoorCoord = {x = 1196.4512939453, y = -3253.55859375, z = 7.0951814651489} -- Marker hvor man kommer ind
cfg.SLO = {x = 1206.5141601562, y = -3250.8278808594, z = 7.0951833724976} -- Hvor man kommer ud henne
cfg.minCops = -1 -- Minimum antal betjente før at den kan røves OBS!!! (-1) for ingen grænse
cfg.PolitiJob = "Politi-Job" -- Politi jobbet
cfg.PolitiOpkaldBesked = "Et indbrudsforsøg er igang ved varehuset på havnen" -- Beskeden politiet skal have
cfg.Webhook = 'https://discord.com/api/webhooks/852207530541056020/CqXqelvESBmDoT2GgZNpM7VCcFsbXNgtAPUOPmvCgCdib03KPT1GVlOstn0Tbc4uNjux' -- Indsæt dit discord Webhook

-- Ammo types and chances

cfg.Ammo1type = "wammo|WEAPON_PISTOL"
cfg.Ammo1chance =  math.random(1,13)

cfg.Ammo2type = "wammo|WEAPON_MUSKET"
cfg.Ammo2chance =  math.random(1,9)

cfg.Ammo3type = "wammo|WEAPON_PISTOL50"
cfg.Ammo3chance =  math.random(1,12)

-- Drug types and chances

cfg.Drug1type = "kokain"
cfg.Drug1chance =  math.random(1,43)

cfg.Drug2type = "amf"
cfg.Drug2chance =  math.random(1,73)

cfg.Drug3type = "meth"
cfg.Drug3chance =  math.random(1,126)

-- Random shit types and chances

cfg.Random1type = "svejser"
cfg.Random1chance =  math.random(1,7)

cfg.Random2type = "strip"
cfg.Random2chance =  math.random(4,23)

cfg.Random3type = "vielsesring"
cfg.Random3chance =  math.random(1,3)

-- Computerhacking amount and chance

cfg.Moneyamount = math.random(100000,250000)

-----------------------
-- Made by Huse#5445 --
-----------------------