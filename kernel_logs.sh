#!/bin/bash
set -e

CDate=$(date "+%Y-%m-%dT%H-%M")

start=$(date --date="-1 hour" "+%Y-%m-%dT%H:%M:%S")
end=$(date "+%Y-%m-%dT%H:%M:%S")

logFile="kernel-logs-$CDate.txt"

journalctl --since "1 hour ago" --no-pager > "kernel-logs-$CDate.txt"
tar -czvf "kernel-logs-$CDate.tar.gz" "kernel-logs-$CDate.txt"

dbxcli put "kernel-logs-$CDate.tar.gz" "logs/kernel-logs-$CDate.tar.gz"

rm "kernel-logs-$CDate.txt"
