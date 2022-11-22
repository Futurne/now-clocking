#!/bin/sh

dir_data="./data"
client="$1"

if [ -z "$client" ]; then
    echo "No source specified!"
    exit 1
fi

# Create the file if it doesn't exist.
touch "$dir_data"/url.txt

url=$(playerctl --player="$client" metadata mpris:artUrl)
previous_url=$(cat "$dir_data"/url.txt)
if [ "$url" != "$previous_url" ]; then
    # Only download the image if it has changed.
    curl "$url" -o "$dir_data"/artwork.png
    echo "$url" > "$dir_data"/url.txt
fi
