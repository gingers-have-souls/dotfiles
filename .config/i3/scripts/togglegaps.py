#!/usr/bin/env python3

from i3ipc import Connection

i3 = Connection()

outputs = i3.get_outputs()
tree = i3.get_tree()

CurrentlyVisibleWS = []

for output in outputs:
    if output.current_workspace:
        CurrentlyVisibleWS.append(output.current_workspace)

for workspace in tree.workspaces():
    if workspace.name in CurrentlyVisibleWS:
        # 0 means it's set to what's in the config file
        if workspace.gaps.inner == 0:
            workspace.command("gaps inner current set 0")
        else:
            workspace.command("gaps inner current set 20")
