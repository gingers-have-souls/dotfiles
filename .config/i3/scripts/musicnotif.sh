#!/bin/sh

if ! mkdir /tmp/musicnotif.lock 2>/dev/null; then
    echo "musicnotif.sh is already running." >&2
    exit 1
fi

player="ncspot"
playerctl --player $player --format "{{ mpris:trackid }}" --follow metadata | \
	xargs -L1 sh -c "artUrl=\$(playerctl --player $player --format '{{ mpris:artUrl }}' metadata) \
	file=\"/tmp/musicnotif/\$(echo \$artUrl | awk -F '/' '{print \$NF}')\"; \
	if [ ! -f \$file ]; then curl -o \$file --create-dirs \$artUrl; fi; \
	notify-send --icon \$file \
	\"\$(playerctl --player $player --format '{{ title }}' metadata)\""
