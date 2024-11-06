#!/bin/sh
set -e
expected_date=$(date --utc --date '1 day ago' '+%Y-%m-%d')
acutal_date=$(rustc +nightly -Vv | awk '/commit-date:/ {print $2}')
echo "yesterday: $expected_date"
echo "nightly: $acutal_date"
[ "$expected_date" = "$acutal_date" ]
