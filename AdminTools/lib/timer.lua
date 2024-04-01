-- Global timer, do things like cron job, but ignore worker number

-- use timer with `init_worker_by_lua_file your/code.lua;`

local store = require 'store'

local timer = {
	interval = 0.5
}

local namespace = '_timer:'

local keyPrev = namespace .. 'prev'
local keyTasks = namespace .. 'tasks'

--[[
timer struct:
timerName {
	count (store)
	reset (store)
	handler (worker)
	arguments (worker)
}
]]

local tasks -- current store tasks
local workerTasks = {}

local function log(...)
	ngx.log(ngx.ERR, ...)
end

local function loop()
	local prev = store.get(keyPrev) or 0
	local now = ngx.now()
	local interval = timer.interval
	ngx.timer.at(interval, loop)
	tasks = nil -- remove current tasks
	if now - prev < interval - 0.002 then
		return
	end

	store.set(keyPrev, now)
	-- try match tasks
	tasks = store.get(keyTasks) or {}
	for timerName, task in pairs(tasks) do
		local count = task.count
		task.count = count - 1
		if count <= 0 then
			task.count = task.reset 
			local workerTask = workerTasks[timerName]
			workerTask.handler(unpack(workerTask.arguments))
		end
	end
	store.set(keyTasks, tasks)
end

function timer.setInterval(name, handler, interval, ...)
	if 'function' ~= type(handler) then
		return false, 'setInterval should accept function'
	end
	local count = interval / timer.interval - 1

	if count >= 0 and math.floor(count) == count then
		tasks = tasks or store.get(keyTasks) or {}
		if not tasks[name] then
			tasks[name] = {
				count = count,
				reset = count
			}
			store.set(keyTasks, tasks)
		end
	
		workerTasks[name] = {
			handler = handler,
			arguments = {...}
		}
		return true
	end

	return false, 'interval is not valid, change interval or timer.interval'
end

function timer.clearInterval(name)
	tasks = tasks or store.get(keyTasks) or {}
	if tasks[name] then
		tasks[name] = nil
		store.set(keyTasks, tasks)
	end
end

loop()

return timer
