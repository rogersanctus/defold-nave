local M = {
	width = 1,
	height = 1,
	WINDOW_RESIZE_EVENT = 'window_resize'
}

local listeners = {}

print('my_window inited')

function M:init()
	self.width, self.height = window.get_size()
end

function M:update_window(width, height)
	self.width = width
	self.height = height

	local update_listeners = listeners[self.WINDOW_RESIZE_EVENT]

	for _, callback in ipairs(update_listeners) do
		if callback ~= nil and type(callback) == 'function' then
			callback()
		end
	end
end

function M:add_listener(for_event, callback)
	listeners[for_event] = listeners[for_event] ~= nil and listeners[for_event] or {}
	table.insert(listeners[for_event], callback)
end

M:init()

return M