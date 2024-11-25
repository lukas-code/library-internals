#!/bin/sh
set -e
expected_date=$(date --utc --date '1 day ago' '+%Y-%m-%d')
acutal_date=$(rustc +nightly -Vv | awk '/commit-date:/ {print $2}')
echo "yesterday: $expected_date"
echo "nightly version: $acutal_date"
echo "nightly published: $(curl --head --silent --show-error --fail https://static.rust-lang.org/dist/channel-rust-nightly.toml | awk 'tolower($1) ~ /last-modified:/' | cut -d ' ' -f 2-)"
echo "now: $(date --utc --rfc-email)"
[ "$expected_date" = "$acutal_date" ]
