#!/bin/sh
day=$(date +%d)
month=$(date +%B)
year=$(date +%Y)
case "$day" in
    1|21|31) pending="st"
    ;;
    2|22) pending="nd"
    ;;
    3|23) pending="rd"
    ;;
    *) pending="th"
    ;;
esac

echo "$month $day$pending $year"

