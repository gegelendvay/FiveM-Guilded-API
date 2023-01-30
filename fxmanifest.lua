fx_version 'cerulean'
game {'gta5'}

description 'A Guilded API wrapper for FiveM servers.'
version '1.0.0'
author 'Gege'

server_scripts {
    'config.lua',
    'server.lua'
}

server_export 'CreateMessage'
server_export 'GetMember'
server_export 'GetMemberRoles'
server_export 'IsRolePresent'