#!/usr/bin/python

from i3ipc import Connection, Event

i3 = Connection()

workspaces = i3.get_workspaces()
wsinuse = []

for i in workspaces:
    wsinuse.append(i.num)

scratch = i3.get_tree().scratchpad().leaves()

if len(scratch) > 0 or 42 in wsinuse:
    i3.command("workspace 42")
    i3.command("layout stacking")
    
    for i in scratch:
        if len(i.focus) < 1:
            i.command("scratchpad show")
            i.command("floating toggle")
