activeToLanguageIDs = {
	["com.apple.keylayout.ABC"] = {
		-- MacVim
		["org.vim.MacVim"] = true,

		-- iTerm2
		["com.googlecode.iterm2"] = true,

		-- JetBrains
		["com.jetbrains.intellij"] = true,
		["com.jetbrains.intellij.ce"] = true,
		["com.jetbrains.PhpStorm"] = true,
		["com.jetbrains.WebStorm"] = true,
		["com.jetbrains.PyCharm"] = true,
		["com.jetbrains.pycharm.ce"] = true,
		["com.jetbrains.CLion"] = true,
		["com.jetbrains.goland"] = true,
		["com.jetbrains.rider"] = true,
		["com.jetbrains.AppCode"] = true,
		["com.jetbrains.datagrip"] = true,
		["com.jetbrains.RubyMine"] = true,

		-- Visual Studio Code
		["com.microsoft.VSCode"] = true,

		-- Cursor
		["com.todesktop.230313mzl4w4u92"] = true,

		-- Xcode
		["com.apple.dt.Xcode"] = true,

		-- Sublime Text
		["com.sublimetext.4"] = true,

		-- Android Studio
		["com.google.android.studio"] = true,
	},
	["com.apple.inputmethod.Korean.2SetKorean"] = {
		["com.kakao.KakaoTalkMac"] = true,
	},
}

escToEnglishIDs = {
	-- MacVim
	["org.vim.MacVim"] = true,

	-- iTerm2
	["com.googlecode.iterm2"] = true,
}

local function gksdudRun(command)
	print("gksdud: " .. command)
	return hs.execute("/Applications/gksdud.app/Contents/Helpers/gksdud " .. command)
end

local function initEscStatus()
	local output, success = gksdudRun("get escape")
	if not success then
		return false
	end
	return output:gsub("^%s*(.-)%s*$", "%1") == "on"
end

beforeEscFlag = initEscStatus()

local function switchToInputSource(inputSource)
	gksdudRun("source " .. inputSource)
end

local function setEscToEnglish(flag)
	local switch = flag and "on" or "off"
	gksdudRun("set escape=" .. switch)
end

gksdudAppDLWatcher = hs.application.watcher.new(function(appName, eventType, app)
	if eventType ~= hs.application.watcher.activated then
		return
	end

	if not app then
		return
	end

	local bundleID = app:bundleID()
	local currentSource = hs.keycodes.currentSourceID()

	for sourceID, bundleIDS in pairs(activeToLanguageIDs) do
		if currentSource ~= sourceID
				and bundleIDS[bundleID] == true then
			switchToInputSource(sourceID)
		end
	end

	local currentEscFlag = escToEnglishIDs[bundleID] == true
	if beforeEscFlag ~= currentEscFlag then
		setEscToEnglish(currentEscFlag)
		beforeEscFlag = currentEscFlag
	end
end)

gksdudAppDLWatcher:start()

print("gksdud/app-defaultlanguage watcher started")