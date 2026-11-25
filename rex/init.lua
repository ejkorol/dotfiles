-- PANE: Ctrl+P
rex.mode("pane", { exclusive = true })
rex.bind("ctrl+p", "client.mode.enter", { name = "pane" })

rex.bind("pane/d", "pane.split", { direction = "down" })
rex.bind("pane/r", "pane.split", { direction = "right" })
rex.bind("pane/x", "pane.close")
rex.bind("pane/f", "pane.zoom")

-- Navigate panes
rex.bind("pane/h", "pane.focus", { direction = "left" })
rex.bind("pane/j", "pane.focus", { direction = "down" })
rex.bind("pane/k", "pane.focus", { direction = "up" })
rex.bind("pane/l", "pane.focus", { direction = "right" })

rex.bind("pane/enter", "client.mode.exit")


-- TAB: Ctrl+T
rex.mode("tab", { exclusive = true })
rex.bind("ctrl+t", "client.mode.enter", { name = "tab" })

rex.bind("tab/n", "client.tab.new")

-- Arrow navigation
rex.bind("tab/right", "client.tab.next")
rex.bind("tab/left", "client.tab.previous")
rex.bind("tab/down", "client.tab.next")
rex.bind("tab/up", "client.tab.previous")

-- Vim-style navigation
rex.bind("tab/h", "client.tab.previous")
rex.bind("tab/j", "client.tab.next")
rex.bind("tab/k", "client.tab.previous")
rex.bind("tab/l", "client.tab.next")

rex.bind("tab/enter", "client.mode.exit")


-- SESSION: Ctrl+O
rex.mode("session", { exclusive = true })
rex.bind("ctrl+o", "client.mode.enter", { name = "session" })

rex.bind("session/w", "session.switch")
rex.bind("session/enter", "client.mode.exit")


-- RESIZE: Ctrl+N
rex.mode("resize", { exclusive = true })
rex.bind("ctrl+n", "client.mode.enter", { name = "resize" })

rex.bind("resize/h", "pane.resize", { direction = "left" })
rex.bind("resize/j", "pane.resize", { direction = "down" })
rex.bind("resize/k", "pane.resize", { direction = "up" })
rex.bind("resize/l", "pane.resize", { direction = "right" })

rex.bind("resize/=", "pane.balance")
rex.bind("resize/enter", "client.mode.exit")
