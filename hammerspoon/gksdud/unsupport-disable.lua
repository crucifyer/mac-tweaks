gksdudDisabled = false
disableBundleIDs = {
	["com.utmapp.UTM"] = true,
	["com.microsoft.rdc.macos"] = true,
	["com.google.Chrome.app.cmkncekebbebpfilplodngbpllndjkfo"] = true,
}

local function gksdudRun(command)
	print("gksdud: " .. command)
	return hs.execute("/Applications/gksdud.app/Contents/Helpers/gksdud " .. command)
end

local function setGksdudDisabled(flag)
	if flag == gksdudDisabled then
		return
	end
	gksdudDisabled = flag

	local command = flag and "pause" or "resume"

	gksdudRun(command)
end

gksdudDisableWatcher = hs.application.watcher.new(function(appName, eventType, app)
	if eventType ~= hs.application.watcher.activated or not app then
		return
	end

	local bundleID = app:bundleID()

	local shouldDisable = disableBundleIDs[bundleID] == true

	setGksdudDisabled(shouldDisable)
end)

gksdudDisableWatcher:start()

print("gksdud/unsupport-disable watcher started")