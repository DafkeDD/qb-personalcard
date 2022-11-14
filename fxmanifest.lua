fx_version 'cerulean'
game 'gta5'

description 'QB-CityHall'
version '3.0.0'

shared_scripts {
    'config.lua'
}

server_script 'server/main.lua'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/main.lua'
}

lua54 'yes'
use_fxv2_oal 'yes'