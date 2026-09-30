hs.hotkey.bind({"ctrl", "alt"}, "left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"ctrl", "alt"}, "right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"ctrl", "alt"}, "up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.y = 0
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"ctrl", "alt"}, "down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.y = max.y + (max.h / 2)
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"ctrl", "alt"}, "f", function()
  local win = hs.window.focusedWindow()
  win:maximize()
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "right", function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenEast()
  win:maximize()
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "left", function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenWest()
  win:maximize()
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "up", function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenNorth()
  win:maximize()
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "down", function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenSouth()
  win:maximize()
end)
