#!/usr/bin/env bash
[ -n "$(grep -E '^\s*include' /etc/nftables.conf)" ] && awk '/hook input/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print $2 }' /etc/nftables.conf)