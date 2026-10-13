englishInputSource = "com.apple.keylayout.ABC"

activeToEnglishIDs = {
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
}

escToEnglishIDs = {
  -- MacVim
  ["org.vim.MacVim"] = true,

  -- iTerm2
  ["com.googlecode.iterm2"] = true,
}

function initEscStatus()
  local output, success = hs.execute("/Applications/gksdud.app/Contents/Helpers/gksdud get escape")
  if not success then
    return false
  end
  return output:gsub("^%s*(.-)%s*$", "%1") == "on"
end

beforeEscFlag = initEscStatus()

function switchToEnglish()
  print("Switching to English.")
  hs.execute("/Applications/gksdud.app/Contents/Helpers/gksdud source " .. englishInputSource)
end

function setEscToEnglish(flag)
  local switch = flag and "on" or "off"
  print("Set ESC to English " .. switch)
  hs.execute("/Applications/gksdud.app/Contents/Helpers/gksdud set escape=" .. switch)
end


gksdudToEnglishWatcher = hs.application.watcher.new(function(appName, eventType, app)
  if eventType ~= hs.application.watcher.activated then
    return
  end

  if not app then
    return
  end

  local bundleID = app:bundleID()
  local currentSource = hs.keycodes.currentSourceID()

  if currentSource ~= englishInputSource
      and activeToEnglishIDs[bundleID] == true then
    switchToEnglish()
  end

  local currentEscFlag = escToEnglishIDs[bundleID] == true
  if beforeEscFlag ~= currentEscFlag then
    setEscToEnglish(currentEscFlag)
    beforeEscFlag = currentEscFlag
  end
end)

gksdudToEnglishWatcher:start()

print("gksdud-toenglish watcher started")