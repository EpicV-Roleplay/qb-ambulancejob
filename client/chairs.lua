local QBCore = exports['qb-core']:GetCoreObject()

local henseat = 0
local sitting = false

CreateThread(function()
	for k, v in pairs(Config.Chairs) do
		exports['qb-target']:AddBoxZone("AmbuChair"..k, v.location, v.width, v.height, { name="AmbuChair"..k, heading = v.heading, debugPoly=Config.Debug, minZ = v.minZ, maxZ = v.maxZ, }, 
			{ options = { { event = "qb-ambulancejob:Chair", icon = "fas fa-chair", label = "Setzen", loc = v.location, head = v.heading, seat = v.seat }, },
			  distance = v.distance
		})
	end
end)

RegisterNetEvent('qb-ambulancejob:Chair', function(data)
	local canSit = true
	local sitting = false
	for k, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc)
		if dist <= 0.4 then TriggerEvent("QBCore:Notify", "Hier sitzt schon jemand!") canSit = false end
	end
	if canSit then
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.head, 0, 1, true)
		henseat = data.seat
		sitting = true
	end
	while sitting do
		local ped = PlayerPedId()
		if sitting then 
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				--Information
				if henseat == 1 then SetEntityCoords(ped, vector3(309.27-0.5, -594.63, 43.28-0.5)) end
				if henseat == 2 then SetEntityCoords(ped, vector3(310.4, -594.2-0.5, 43.28-0.5)) end
				if henseat == 3 then SetEntityCoords(ped, vector3(312.15-0.5, -594.63, 43.28-0.5)) end
				--Stuff Room
				if henseat == 4 then SetEntityCoords(ped, vector3(311.47, -599.17, 43.28-0.5)) end
				if henseat == 5 then SetEntityCoords(ped, vector3(310.48, -598.72, 43.28-0.5)) end
				if henseat == 6 then SetEntityCoords(ped, vector3(310.76, -601.59, 43.28-0.5)) end				
				if henseat == 7 then SetEntityCoords(ped, vector3(309.57, -601.32, 43.28-0.5)) end
				
				if henseat == 8 then SetEntityCoords(ped, vector3(344.12, -577.15, 43.28)) end
				
				if henseat == 9 then SetEntityCoords(ped, vector3(-297.12, 6265.85, 31.48-0.5)) end
				if henseat == 10 then SetEntityCoords(ped, vector3(-297.79, 6265.18, 31.48-0.5)) end
				if henseat == 11 then SetEntityCoords(ped, vector3(-298.48, 6264.62, 31.48-0.5)) end
				if henseat == 12 then SetEntityCoords(ped, vector3(-299.15, 6263.93, 31.48-0.5)) end
				if henseat == 13 then SetEntityCoords(ped, vector3(-299.02, 6260.65, 31.48-0.5)) end
				if henseat == 14 then SetEntityCoords(ped, vector3(-298.47, 6260.02, 31.48-0.5)) end
				
				henseat = 0
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

Config.Chairs = {	
	--Main
	{ location = vector3(298.93, -588.68, 43.26), heading = 247.45, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(298.23, -590.77, 43.28), heading = 247.45, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(299.58, -593.49, 43.28), heading = 338.8, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(300.56, -593.77, 43.28), heading = 338.8, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(302.58, -594.5, 43.28), heading = 338.8, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(303.49, -594.89, 43.28), heading = 338.8, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	
	{ location = vector3(300.87, -591.47, 43.28), heading = 67.11, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(301.34, -590.27, 43.28), heading = 67.11, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	
	--Personal WC
	{ location = vector3(295.76, -596.67, 43.29), heading = 250.83, width = 0.6, height = 0.6, minZ = 42.49, maxZ = 43.49, distance = 1.7 },

	--Main Floor Left
	{ location = vector3(312.46, -585.87, 43.28), heading = 164.47, width = 0.6, height = 0.6, minZ = 42.49, maxZ = 43.49, distance = 1.7 },
	{ location = vector3(314.44, -586.59, 43.28), heading = 164.47, width = 0.6, height = 0.6, minZ = 42.49, maxZ = 43.49, distance = 1.7 },
	

	--Information
	{ location = vector3(309.27, -594.63, 43.28), heading = 37.97, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.38, distance = 1.7, seat = 1 },
	{ location = vector3(310.4, -594.2, 43.28), heading = 358.7, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.38, distance = 2.0, seat = 2 },
	{ location = vector3(312.15, -594.63, 43.28), heading = 336.3, width = 0.6, height = 0.6, minZ = 42.58, maxZ = 43.38, distance = 2.0, seat = 3 },
	
	--Stuff Room Table
	{ location = vector3(-304.21, 6269.29, 31.5), heading = 139.7, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.48, distance = 2.0, seat = 4 },
	{ location = vector3(-303.51, 6269.86, 31.5), heading = 139.7, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.48, distance = 2.0, seat = 5 },
	{ location = vector3(-304.81, 6271.14, 31.5), heading = 374.47, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.48, distance = 2.0, seat = 6 },
	{ location = vector3(-305.48, 6270.49, 31.5), heading = 374.47, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.48, distance = 2.0, seat = 7 },
	
	--mainbackside		
	{ location = vector3(317.56, -595.31, 43.28), heading = 159.33, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(318.47, -595.63, 43.28), heading = 159.33, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(319.45, -596.02, 43.28), heading = 159.33, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(319.98, -597.22, 43.28), heading = 68.48, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },	
	{ location = vector3(319.68, -598.08, 43.28), heading = 68.48, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(315.02, -598.98, 43.28), heading = 314.86, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(317.09, -599.82, 43.28), heading = 341.92, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(318.02, -600.17, 43.28), heading = 341.92, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(320.2, -600.94, 43.28), heading = 341.92, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(321.17, -601.39, 43.28), heading = 341.92, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(322.38, -601.74, 43.28), heading = 341.92, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	
	-- Pillbox Outsite Bank Right
	{ location = vector3(294.99, -594.66, 43.09+0.1), heading = 64.72, width = 0.6, height = 0.6, minZ = 42.66, maxZ = 43.46, distance = 1.7, },	
	{ location = vector3(295.19, -594.06, 43.09+0.1), heading = 64.72, width = 0.6, height = 0.6, minZ = 42.66, maxZ = 43.46, distance = 1.7 },
	{ location = vector3(295.43, -593.39, 43.09+0.1), heading = 64.72, width = 0.6, height = 0.6, minZ = 42.66, maxZ = 43.46, distance = 1.7, },
	
	-- Pillbox Outsite Bank Middel
	{ location = vector3(296.92, -589.37, 43.15+0.1), heading = 66.98, width = 0.6, height = 0.6, minZ = 42.66, maxZ = 43.46, distance = 1.7, },
	{ location = vector3(297.14, -588.74, 43.14+0.1), heading = 66.98, width = 0.6, height = 0.6, minZ = 42.66, maxZ = 43.46, distance = 1.7, },
	{ location = vector3(297.37, -588.05, 43.14+0.1), heading = 66.98, width = 0.6, height = 0.6, minZ = 42.66, maxZ = 43.46, distance = 1.7, },

	-- Pillbox Outsite Bank Left
	{ location = vector3(300.55, -577.42, 43.13+0), heading = 67.57, width = 0.5, height = 0.5, minZ = 42.66, maxZ = 43.46, distance = 1.7, },
	{ location = vector3(300.79, -576.79, 43.26+0), heading = 67.57, width = 0.5, height = 0.5, minZ = 42.66, maxZ = 43.46, distance = 1.7, },
	{ location = vector3(301.08, -576.12, 43.26+0), heading = 67.57, width = 0.5, height = 0.5, minZ = 42.66, maxZ = 43.46, distance = 1.7, },
	--Main End


	--First Floor left
	{ location = vector3(309.03, -571.06, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(311.03, -571.82, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(314.81, -573.17, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(316.92, -573.91, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },	
	{ location = vector3(320.77, -575.32, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(322.12, -575.79, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(337.87, -581.57, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(339.9, -582.29, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(342.69, -583.24, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(343.63, -583.62, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(345.6, -584.31, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(356.54, -588.35, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(357.49, -588.69, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(359.56, -589.45, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(362.2, -590.41, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },
	{ location = vector3(364.3, -591.17, 43.28), heading = 157.59, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7, },

	--First Floor right
	{ location = vector3(311.07, -575.75, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(311.91, -576.08, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(312.78, -576.38, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(314.88, -577.15, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(319.4, -578.78, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(320.29, -579.1, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(321.12, -579.41, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(334.6, -584.25, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(335.5, -584.68, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(337.63, -585.43, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(338.49, -585.75, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(354.35, -591.56, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(355.31, -591.83, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(358.15, -592.9, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(360.88, -593.89, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(361.93, -594.23, 43.28), heading = 340.57, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },

	--Ward C Diagonal
	{ location = vector3(357.71, -576.93, 43.28), heading = 68.07, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(356.99, -578.81, 43.28), heading = 68.07, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(349.26, -600.07, 43.28), heading = 68.07, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(348.92, -601.08, 43.28), heading = 68.07, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(346.78, -595.68, 43.28), heading = 247.51, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(348.29, -591.77, 43.28), heading = 247.51, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(348.59, -590.85, 43.28), heading = 247.51, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },

	--Labor 1
	{ location = vector3(308.59, -564.19, 43.28+0.2), heading = 253.19, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(310.82, -562.05, 43.28+0.2), heading = 151.93, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(310.54, -567.21, 43.28+0.2), heading = 66.87, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	
	--OP
	{ location = vector3(314.27, -566.8, 43.28+0.2), heading = 315.47, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(317.69, -566.33, 43.28+0.2), heading = 72.58, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },

	--
	{ location = vector3(318.62, -570.86, 43.28+0.2), heading = 315.47, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(320.93, -570.0, 43.28+0.2), heading = 72.58, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },

	--
	{ location = vector3(325.48, -568.77, 43.28+0.2), heading = 315.47, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(328.43, -571.96, 43.28+0.2), heading = 72.58, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },

	-- mrt
	{ location = vector3(342.17, -576.19, 43.28), heading = 144.99, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 },
	{ location = vector3(343.71, -577.63, 43.28), heading = 263.86, width = 0.6, height = 0.6, minZ = 42.68, maxZ = 43.28, distance = 1.7 ,seat = 8 },
}

AddEventHandler('onResourceStop', function(r) 
	if r == GetCurrentResourceName() then for k, v in pairs(Config.Chairs) do exports['qb-target']:RemoveZone("AmbuChair"..k) end end 
end)