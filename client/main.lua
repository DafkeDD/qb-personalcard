RegisterNetEvent('qb-personalcard:client:OpenMenu', function ()
        local menu = {}
        menu[#menu + 1] = {
            isMenuHeader = true,
            header = 'Personal Cards',
            icon = 'fa-solid fas fa-shop'
        }
        for k, v in pairs(Config.Cards.licenses) do
            menu[#menu + 1] = {
                header = v.label,
                txt = 'cost $' .. v.cost,
                icon = k,
                params = {
                    isServer = true,
                    event = 'qb-personalcard:server:requestId',
                    args = {
                        item = k,
                        cost = v.cost,
                        metadata = v.metadata
                    }
                }
            }
        end

        menu[#menu + 1] = {
            header = 'close',
            icon = 'fas fa-xmark',
            params = {
                event = 'qb-menu:client:closeMenu',
            }
        }
        exports['qb-menu']:openMenu(menu)
end)

Citizen.CreateThread(function ()
    exports['qb-target']:AddBoxZone(Config.Cards.target.name, Config.Cards.target.position, Config.Cards.target.length, Config.Cards.target.width, {
        name = Config.Cards.target.name,
        heading = Config.Cards.target.heading,
        debugPoly = Config.Cards.target.debugPoly,
        minZ = Config.Cards.target.minZ,
        maxZ = Config.Cards.target.maxZ
    }, {
    options = {
        {
        num = 1,
        type = Config.Cards.target.type,
        event = "qb-personalcard:client:OpenMenu",
        icon = Config.Cards.target.icon,
        label = Config.Cards.target.label,
        }
    },
    distance = Config.Cards.target.distance,
    })
end)