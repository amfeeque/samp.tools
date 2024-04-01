function asyncHttpRequest(method, url, args, resolve, reject)
	local request_thread = effil.thread(function (method, url, args)
	local requests = require 'requests'
	local result, response = pcall(requests.request, method, url, args)
		if result then
			response.json, response.xml = nil, nil
		return true, response
	else
		return false, response
		end
	end)(method, url, args)
	if not resolve then resolve = function() end end
	if not reject then reject = function() end end
		lua_thread.create(function()
		local runner = request_thread
		while true do
			local status, err = runner:status()
				if not err then
				if status == 'completed' then
					local result, response = runner:get()
					if result then
						resolve(response)
					else
						reject(response)
					end
				return
					elseif status == 'canceled' then
				return reject(status)
			end
		else
			return reject(err)
		end
			wait(0)
		end
	end)
end
