#!/usr/bin/python

from i3ipc import Connection, Event

i3 = Connection()

scratch = i3.get_tree().scratchpad().leaves()
if len(scratch) > 0:
    i3.command("workspace 42")
    i3.command("layout stacking")
    
    for i in scratch:
        if len(i.focus) < 1:
            i.command("scratchpad show")
            i.command("floating toggle")
