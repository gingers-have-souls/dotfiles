#!/usr/bin/env python3

from i3ipc import Connection

i3 = Connection()

scratch = i3.get_tree().scratchpad().leaves()

# If there is something in the scratchpad
# Lists are true if not empty
if scratch:
    #switch to workspace 42 and making the windows stack
    i3.command("workspace 42")
    i3.command("layout stacking")
    
    #remove each window from scratchpad and defloat it
    for window in scratch:
        window.command("scratchpad show")
        window.command("floating toggle")
else:
    #make list of used workspaces
    workspaces = i3.get_workspaces()
    wsinuse = []

    for i in workspaces:
        wsinuse.append(i.num)
    
    #if workspace 42 is already in use, switch to it
    if 42 in wsinuse:
        i3.command("workspace 42")
