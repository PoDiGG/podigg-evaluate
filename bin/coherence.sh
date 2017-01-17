#!/usr/bin/env bash

# Everything is generated between 20161201 and 20161331
# graph-coherence nmbs-2016-12-1.ttl    0.984543934937036
# 1: 0.9913395612500119
# 2: 0.9887394188982925
# 3:
# 4:

function generate {
    rm -rf output_data
    podigg-lc output_data ./config_$1.json
    coverage=$(../node_modules/graph-coherence/bin/graph-coherence output_data/lc.ttl)
    rm -rf output_data
    echo "$1: $coverage"
}

echo "Real dataset: $(../node_modules/graph-coherence/bin/graph-coherence ../data/nmbs-2016-12-1.ttl)"

generate 1
#generate 2
#generate 3
#generate 4
