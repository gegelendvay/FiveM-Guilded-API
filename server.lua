local function GuildedRequest(method, endpoint, data)
    local callback = nil
    PerformHttpRequest('https://www.guilded.gg/api/v1/'..endpoint, function(errorCode, resultData, resultHeaders)
        callback = {code = errorCode, data = resultData, headers = resultHeaders}
    end, method, #data > 0 and data or '', {['Authorization'] = 'Bearer '..Token, ['Accept'] = 'application/json', ['Content-Type'] = 'application/json'})

    repeat Wait(1) until callback ~= nil
    return callback
end

function CreateMessage(channel, message)
    local endpoint = ('channels/%s/messages'):format(channel)
    local request = GuildedRequest('POST', endpoint, json.encode({content = message}))
end

function GetMember(member)
    local endpoint = ('servers/%s/members/%s'):format(GuildId, member)
    local request = GuildedRequest('GET', endpoint, {})
    if request.code == 200 then
        local data = json.decode(request.data)
        return data.member
    else
        return request.code
    end
end

function GetMemberRoles(member)
    local endpoint = ('servers/%s/members/%s/roles'):format(GuildId, member)
    local request = GuildedRequest('GET', endpoint, {})
    if request.code == 200 then
        local data = json.decode(request.data)
        return data.roleIds
    else
        return request.code
    end
end

function IsRolePresent(member, role)
    local endpoint = ('servers/%s/members/%s/roles'):format(GuildId, member)
    local request = GuildedRequest('GET', endpoint, {})
    if request.code == 200 then
        local data = json.decode(request.data)
        for i = 0, #data.roleIds do
            if data.roleIds[i] == tonumber(role) then
                return true
            end
        end
        return false
    else
        return request.code
    end
end

CreateThread(function()
    local request = GuildedRequest('GET', 'servers/'..GuildId, {})
    if request.code == 200 then
        local data = json.decode(request.data)
        print('Successfully connected to: '..data.server.name..'.')
    else
        print(request.code)
    end
end)