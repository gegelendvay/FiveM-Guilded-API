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

function GetServerMember(member)
    local endpoint = ('servers/%s/members/%s'):format(GuildId, member)
    local request = GuildedRequest('GET', endpoint, {})
    if request.code == 200 then
        local data = json.decode(request.data)
        return data
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