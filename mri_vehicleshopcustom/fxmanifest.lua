fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'mVehicleshop'
description 'Vehicle Shop with NPC + NUI + Admin Panel (Qbox/QBCore)'
version '1.0.0'

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua',
  'shared/bridge.lua',
}

client_scripts {
  'client/main.lua',
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/main.lua',
}

ui_page 'web/index.html'

files {
  'web/index.html',
  'web/style.css',
  'web/app.js',
}
