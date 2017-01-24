#!/usr/bin/env bash

# graph-coherence nmbs-2016-12-1.ttl    0.984543934937036  (between 20161201 and 20161331)
# 1: 0.9879878664074184
# graph-coherence ns-2016-12-1.ttl    TODO  (between 20151201 and 20151331)
# 1: 0.9870082003910289
# graph-coherence delijn-2016-12-1.ttl    TODO  (between 20161201:00:00 and 20161201:05:20)
# 1: 

function generate {
    rm -rf output_data
    podigg-lc output_data ./config_$1.json
    coverage=$(../node_modules/graph-coherence/bin/graph-coherence output_data/lc.ttl)
    rm -rf output_data
    echo "$1: $coverage"
}

#echo "Real train_BE: $(../node_modules/graph-coherence/bin/graph-coherence ../data/nmbs-2016-12-1.ttl)"
echo "Real train_NL: $(../node_modules/graph-coherence/bin/graph-coherence ../data/ns-2015-12-1.ttl)"
echo "Real bus_BE: $(../node_modules/graph-coherence/bin/graph-coherence ../data/delijn-2016-12-1.ttl)"

#generate train_BE
#generate train_NL
generate bus_BE
