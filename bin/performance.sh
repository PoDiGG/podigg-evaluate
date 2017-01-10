#!/usr/bin/env bash

replications=5

function measure {
    TIMEFORMAT=%R
    t=$(time (for i in $(seq 1 $replications);do measuregen; done) 2>&1 1>/dev/null)
    echo "scale=4;$t/$replications" | bc -l
}

function measuregen {
    rm -rf output_data
    podigg-lc-env output_data > /dev/null 2>&1
    rm -rf output_data
}

# Base params
#export GTFS_GEN_CONNECTIONS__TIME_INITIAL=1480550400000
#export GTFS_GEN_CONNECTIONS__TIME_FINAL=1483142400000

basestops=583
baseroutes=362
baseconnections=30011

echo "type,amount,seconds"

increase="1000 2000 5000 10000 20000 50000 100000"
allstops=$increase
allroutes=$increase
allconnections=$increase

echo "--stops--"
echo "amount,seconds"
for stops in $allstops; do
    export GTFS_GEN_STOPS__STOPS=$stops
    export GTFS_GEN_ROUTES__ROUTES=$baseroutes
    export GTFS_GEN_CONNECTIONS__CONNECTIONS=$baseconnections
    echo "$stops,$(measure)"
done

echo "--routes--"
echo "amount,seconds"
for routes in $allroutes; do
    export GTFS_GEN_STOPS__STOPS=$basestops
    export GTFS_GEN_ROUTES__ROUTES=$routes
    export GTFS_GEN_CONNECTIONS__CONNECTIONS=$baseconnections
    echo "$routes,$(measure)"
done

echo "--connections--"
echo "amount,seconds"
for connections in $allconnections; do
    export GTFS_GEN_STOPS__STOPS=$basestops
    export GTFS_GEN_ROUTES__ROUTES=$baseroutes
    export GTFS_GEN_CONNECTIONS__CONNECTIONS=$connections
    echo "$connections,$(measure)"
done

measure
