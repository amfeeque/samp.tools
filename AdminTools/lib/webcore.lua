local ffi = require 'ffi'

local webcore = { frames = {} }

ffi.cdef([[
	typedef uintptr_t WebFrame;

	typedef void(__stdcall* frame_callback_t)(WebFrame frame);
	typedef void(__stdcall* loading_callback_t)(WebFrame frame, int httpStatusCode);
	typedef void(__stdcall* json_callback_t)(WebFrame frame, const char* name, const char** argv, int argc);

	const char*			__stdcall CEF_GetVersion();
	bool				__stdcall CEF_IsInitialized();
	bool				__stdcall CEF_IsAnyInputActive();

	WebFrame			__stdcall CEF_Create(const char* url, int x, int y, int w, int h, frame_callback_t callback);
	WebFrame			__stdcall CEF_CreateFullscreen(const char* url, frame_callback_t callback);
	void				__stdcall CEF_Close(WebFrame frame);

	uintptr_t			__stdcall CEF_GetTexture(WebFrame frame);

	bool				__stdcall CEF_IsInputActive(WebFrame frame);
	void				__stdcall CEF_SetInput(WebFrame frame, bool enable);

	const char*			__stdcall CEF_GetURL(WebFrame frame);
	void				__stdcall CEF_LoadURL(WebFrame frame, const char* url);

	bool				__stdcall CEF_CanGoBack(WebFrame frame);
	void				__stdcall CEF_GoBack(WebFrame frame);

	bool				__stdcall CEF_CanGoForward(WebFrame frame);
	void				__stdcall CEF_GoForward(WebFrame frame);

	void				__stdcall CEF_SetActive(WebFrame frame, bool enable);
	void				__stdcall CEF_SetOffScreen(WebFrame frame, bool enable);
	void				__stdcall CEF_SetRect(WebFrame frame, int x, int y, int w, int h);

	void				__stdcall CEF_ExecuteJS(WebFrame frame, const char* code);
	void				__stdcall CEF_ReloadPage(WebFrame frame, bool ignore_cache);
	const char*			__stdcall CEF_GetTitle(WebFrame frame);
	bool				__stdcall CEF_IsLoading(WebFrame frame);

	void				__stdcall CEF_SetCreateCallback(WebFrame frame, frame_callback_t callback);
	void				__stdcall CEF_SetCloseCallback(WebFrame frame, frame_callback_t callback);
	void				__stdcall CEF_SetLoadingCallback(WebFrame frame, loading_callback_t callback);
	void				__stdcall CEF_RegisterFunction(WebFrame frame, const char* name, json_callback_t callback);
]])

if getModuleHandle("webcore.asi") == 0 then
	error("plugin not found")
end

local lib = ffi.load("webcore.asi")

if ffi.string(lib.CEF_GetVersion()) < "1.2" then
	error("bad version")
end

-- ------------------------------------------------------------------------- --
-- ------------------------------------------------------------------------- --

function create_callback(frame)
	local obj = webcore.frames[frame]
	obj.create_callback(obj)
end

function close_callback(frame)
	local obj = webcore.frames[frame]
	if obj ~= nil then
		obj.close_callback(obj)
		webcore.frames[frame] = nil
	end
end

function loading_callback(frame, httpStatusCode)
	local obj = webcore.frames[frame]
	obj.loading_callback(obj, httpStatusCode)
end

function convert_args(argv, argc)
	local result = {}
	
	for i = 0, (argc - 1) do
		result[i + 1] = decodeJson(ffi.string(argv[i]))
	end
	
	return result
end

function js_callback(_frame, _name, _argv, _argc)
	local obj = webcore.frames[_frame]
	local args = convert_args(_argv, _argc)
	local name = ffi.string(_name)
	obj.js_cb[name](obj, name, args)
end

-- ------------------------------------------------------------------------- --
-- ------------------------------------------------------------------------- --

WebFrame = {}

function WebFrame:new(frame, create_callback)
	local obj = {}
	obj.frame = frame
	obj.create_callback = create_callback
	obj.js_cb = {}
	
	setmetatable(obj, self)
	self.__index = self
	
	return obj
end

function WebFrame:close()
	lib.CEF_Close(self.frame)
end

function WebFrame:get_texture()
	return lib.CEF_GetTexture(self.frame)
end

function WebFrame:set_input(enable)
	lib.CEF_SetInput(self.frame, enable)
end

function WebFrame:set_active(enable)
	lib.CEF_SetActive(self.frame, enable)
end

function WebFrame:set_offscreen(enable)
	lib.CEF_SetOffScreen(self.frame, enable)
end

function WebFrame:set_rect(x, y, w, h)
	lib.CEF_SetRect(self.frame, x, y, w, h)
end

function WebFrame:execute_js(code)
	lib.CEF_ExecuteJS(self.frame, code)
end

function WebFrame:load_url(url)
	lib.CEF_LoadURL(self.frame, url)
end

function WebFrame:reload_page(ignore_cache)
	lib.CEF_ReloadPage(self.frame, ignore_cache)
end

function WebFrame:can_go_back()
	return lib.CEF_CanGoBack(self.frame)
end

function WebFrame:can_go_forward()
	return lib.CEF_CanGoForward(self.frame)
end

function WebFrame:go_back()
	lib.CEF_GoBack(self.frame)
end

function WebFrame:go_forward()
	lib.CEF_GoForward(self.frame)
end

function WebFrame:input_active()
	return lib.CEF_IsInputActive(self.frame)
end

function WebFrame:get_title()
	return ffi.string(lib.CEF_GetTitle(self.frame))
end

function WebFrame:get_url()
	return ffi.string(lib.CEF_GetURL(self.frame))
end

function WebFrame:loading()
	return lib.CEF_IsLoading(self.frame)
end

function WebFrame:add_function(name, cb)
	lib.CEF_RegisterFunction(self.frame, name, ffi.cast("json_callback_t", js_callback))
	self.js_cb[name] = cb
end

function WebFrame:set_create_cb(cb)
	local proxy_cb = cb and create_callback or nil
	lib.CEF_SetCreateCallback(self.frame, ffi.cast("frame_callback_t", proxy_cb))
	self.create_callback = cb
end

function WebFrame:set_close_cb(cb)
	local proxy_cb = cb and close_callback or nil
	lib.CEF_SetCloseCallback(self.frame, ffi.cast("frame_callback_t", proxy_cb))
	self.close_callback = cb
end

function WebFrame:set_loading_cb(cb)
	local proxy_cb = cb and loading_callback or nil
	lib.CEF_SetLoadingCallback(self.frame, ffi.cast("loading_callback_t", proxy_cb))
	self.loading_callback = cb
end

-- ------------------------------------------------------------------------- --
-- ------------------------------------------------------------------------- --

function webcore.version()
	return ffi.string(lib.CEF_GetVersion())
end

function webcore.inited()
	return lib.CEF_IsInitialized()
end

function webcore.input_active()
	return lib.CEF_IsAnyInputActive()
end

function webcore:create(url, x, y, w, h, cb)
	local frame = lib.CEF_Create(url, x, y, w, h, ffi.cast("frame_callback_t", create_callback))
	if not (frame == 0) then
		local obj = WebFrame:new(frame, cb)
		self.frames[frame] = obj
		return obj
	end
	
	return nil
end

function webcore:create_fullscreen(url, cb)
	local frame = lib.CEF_CreateFullscreen(url, ffi.cast("frame_callback_t", create_callback))
	if not (frame == 0) then
		local obj = WebFrame:new(frame, cb)
		self.frames[frame] = obj
		return obj
	end
	
	return nil
end

function webcore:close(obj)
	if obj ~= nil then
		obj:set_close_cb(nil)
		obj:close()
		self.frames[obj.frame] = nil
	end
end

jit.off(_, false)

return webcore
