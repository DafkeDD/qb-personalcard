RegisterNetEvent('qb-cityhall:client:cityhall', function ()
        local cityhall = {}
        cityhall[#cityhall + 1] = {
            isMenuHeader = true,
            header = 'City hall',
            icon = 'fa-solid fas fa-shop'
        }
        for k, v in pairs(Config.Cityhalls.licenses) do
            cityhall[#cityhall + 1] = {
                header = v.label,
                txt = 'cost $' .. v.cost,
                icon = k,
                params = {
                    isServer = true,
                    event = 'qb-cityhall:server:requestId',
                    args = {
                        item = k,
                        cost = v.cost,
                        metadata = v.metadata
                    }
                }
            }
        end

        cityhall[#cityhall + 1] = {
            header = 'close',
            icon = 'fas fa-xmark',
            params = {
                event = 'qb-menu:client:closeMenu',
            }
        }
        exports['qb-menu']:openMenu(cityhall)
end)

Citizen.CreateThread(function ()
    exports['qb-target']:AddBoxZone(Config.Cityhalls.target.name, Config.Cityhalls.target.position, Config.Cityhalls.target.length, Config.Cityhalls.target.width, {
        name = Config.Cityhalls.target.name,
        heading = Config.Cityhalls.target.heading,
        debugPoly = Config.Cityhalls.target.debugPoly,
        minZ = Config.Cityhalls.target.minZ,
        maxZ = Config.Cityhalls.target.maxZ
    }, {
    options = {
        {
        num = 1,
        type = Config.Cityhalls.target.type,
        event = "qb-cityhall:client:cityhall",
        icon = Config.Cityhalls.target.icon,
        label = Config.Cityhalls.target.label,
        }
    },
    distance = Config.Cityhalls.target.distance,
    })
end)