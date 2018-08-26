local obj = {}
obj.__index = obj

-- Metadata
obj.name = "AppLogoLauncher"
obj.version = "0.1"
obj.author = "Adam S. Kirschner <accounts@adamskirschner.com>"
obj.homepage = "https://github.com/hikirsch/AppLogoLauncher-Spoon"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.hyper = nil

obj.apps = nil

function obj:start() 
	if self.hyper == nil then
		print('ERROR: No hyper set for AppLogoLauncher!')
		return
	end

	if self.apps == nil then
		print('ERROR: No apps configured for AppLogoLauncher!')
		return
	end

	for key, appName in pairs(self.apps) do		
		hs.hotkey.bind(self.hyper, key, function()
			self:launch(appName)
		end)
	end
end

function obj:launch(appName)
	if appName ~= nil then
		print('launching ' .. appName)

		local launched = hs.application.launchOrFocus(appName)

		if not launched then
			hs.alert("ERROR Starting " .. appName)
			return
		end

		local app = hs.application.get(appName)

		if app ~= nil and spoon.FadeLogo ~= nil then
			local bundleID = app:bundleID()
			local image = hs.image.imageFromAppBundle(bundleID)

			if image ~= nil then
				spoon.FadeLogo.image = image
				spoon.FadeLogo:start()
			else
				hs.alert(appName)
			end
		else
			hs.alert(appName)
		end
	end
end

return obj