Config = Config or {}

Config.Cards = {
        licenses = {
            ["id_card"] = {
                label = "ID Card",
                cost = 200,
            },
            ["driver_license"] = {
                label = "Driver License",
                cost = 250,
                metadata = "driver"
            },
            ["weaponlicense"] = {
                label = "Weapon License",
                cost = 1000,
                metadata = "weapon"
            },
        },
        target = {
            name = 'LicenseMenu', position = vector3(441.07, -980.6, 30.69),
            length = 1.6, width = 0.6, heading = 0, debugPoly = false,
            minZ = 30.59, maxZ = 31.19, type = 'client', icon = 'fa-solid fa-city', label = 'Get Cards', distance = 1.5
        }
}