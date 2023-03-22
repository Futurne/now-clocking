#!/bin/bash

set -ex

cd "$(dirname "$0")"
mkdir -p data
touch ./data/title ./data/artist ./data/status

launch_conky() {
    conky -c ./conky/np.lua -d # &>/dev/null
    conky -c ./conky/npart.lua -d # &> /dev/null
}

monitor_playerctl() {
    playerctl -F metadata mpris:artUrl | ./scripts/curl_stdin.sh ./data/artwork.png &
    playerctl -F status  | ./scripts/write_to_file.sh ./data/status &
    playerctl -F metadata artist  | ./scripts/write_to_file.sh ./data/artist &
    playerctl -F metadata title  | ./scripts/write_to_file.sh ./data/title
}

(trap 'kill 0' SIGINT; launch_conky & monitor_playerctl)
