#!/bin/bash

set -ex

cd "$(dirname "$0")"

launch_conky() {
    conky -q -c ./conky/np.lua -d &>/dev/null
    conky -q -c ./conky/npart.lua -d &> /dev/null
}

monitor_playerctl() {
    playerctl -F metadata mpris:artUrl | ./scripts/curl_stdin.sh ./data/artwork.png &
    playerctl -F status  | ./scripts/write_to_file.sh ./data/status
}

(trap 'kill 0' SIGINT; launch_conky & monitor_playerctl)
