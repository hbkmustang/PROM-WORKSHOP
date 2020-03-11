#!/bin/bash
# printMetric name description type value
function printMetric {
    echo "# HELP $1 $2"
    echo "# TYPE $1 $3"
    echo "$1 $4"
}

while read -r load1min load5min load15min jobs lastpid; do
    printMetric "loadscript_load1" "1 minute load avg" "GAUGE" "$load1min"
    printMetric "loadscript_load5" "5 minute load avg" "GAUGE" "$load5min"
    printMetric "loadscript_load15" "15 minute load avg" "GAUGE" "$load15min"
    while IFS='/' read -r running background; do
        printMetric "loadscript_jobs_running" "Running jobs" "GAUGE" "$running"
        printMetric "loadscript_jobs_background" "Background jobs" "GAUGE" "$background"
    done <<< "$jobs"
    printMetric "loadscript_pid_last" "Last PID in System" "COUNTER" "$lastpid"
done < /proc/loadavg
