gksdudDisabled = false

disableBundleIDs = {
  ["com.utmapp.UTM"] = true,
  ["com.microsoft.rdc.macos"] = true,
  ["com.google.Chrome.app.cmkncekebbebpfilplodngbpllndjkfo"] = true,
}

function setGksdudDisabled(disabled)
  if disabled == gksdudDisabled then
    return
  end
  gksdudDisabled = disabled

  local command

  if disabled then
    command = "pause"
  else
    command = "resume"
  end

  print("gksdud: " .. command)
  hs.execute("/Applications/gksdud.app/Contents/Helpers/gksdud " .. command)
end

gksdudDisableWatcher = hs.application.watcher.new(function(appName, eventType, app)
  if eventType ~= hs.application.watcher.activated then
    return
  end

  if not app then
    return
  end

  local bundleID = app:bundleID()

  local shouldDisable = disableBundleIDs[bundleID] == true

  setGksdudDisabled(shouldDisable)
end)

gksdudDisableWatcher:start()

print("gksdud-disable watcher started")