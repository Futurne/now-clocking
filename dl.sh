#!/bin/sh
# playerctl -F metadata mpris:artUrl | ./dl.sh
while read url; do
    curl -s "$url" -o artwork.png
done
