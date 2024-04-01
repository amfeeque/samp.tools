local copas = require("copas")
local http = require 'copas.http'

lib = {}
local _, my_id = sampGetPlayerIdByCharHandle(PLAYER_PED)
local my_nick_name = sampGetPlayerNickname(my_id)


function _()
	(""):†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()
	(""):†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()
	(""):†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()
	(""):†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()
	(""):†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()():†()
end

local atoolsRequest = function(request, body, handler) 
    if not copas.running then
        copas.running = true
        lua_thread.create(function()
            wait(0)
            while not copas.finished() do
                local ok, err = copas.step(0)
                if ok == nil then error(err) end
                wait(0)
            end
            copas.running = false
        end)
    end
    if handler then
        return copas.addthread(function(r, b, h)
            copas.setErrorHandler(function(err) h(nil, err) end)
            h(http.request(r, b))
        end, request, body, handler)
    else
        local results
        local thread = copas.addthread(function(r, b)
            copas.setErrorHandler(function(err) results = {nil, err} end)
            results = table.pack(http.request(r, b))
        end, request, body)
        while coroutine.status(thread) ~= 'dead' do wait(0) end
        return table.unpack(results)
    end
end

local urlencode = function(str)
    if (str) then
        str = string.gsub(str, "\n", "\r\n")
        str = string.gsub(str, "([^%w ])",
            function(c)
                return string.format ("%%%02X", string.byte(c))
            end)
        str = string.gsub(str, " ", "+")
    end
    return str
end

local getInfo = function()
    local response, code, headers, status = atoolsRequest('http://195.133.75.34:3000/')
            if response then
                return response
            end
end
lib.startEvent = function(callback)
    lua_thread.create(function()
        while true do
            wait(0)
            callback(getInfo())
        end
    end)
end

lib.sendAtools = function(srv,data,types)
    lua_thread.create(function()
        local response, code, headers, status = atoolsRequest('http://195.133.75.34:3000/update?name='..my_nick_name..'&data='..urlencode(data)..'&types='..types..'&srv='..srv)
    end)
end
return lib