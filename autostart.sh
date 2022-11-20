#!/bin/sh

mkdir -p "$HOME/.config/autostart"

# Write default entries
cat "./now-clocking.desktop" > "$HOME/.config/autostart/now-clocking.desktop"

# Write execution path
exec_path="$(pwd)/start.sh"
echo "Exec=sh $exec_path" >> "$HOME/.config/autostart/now-clocking.desktop"

echo "Desktop file created at $HOME/.config/autostart/now-clocking.desktop"
echo "Done!"
