# PoDiGG Distance Evaluator

Evaluate the realism of generated output.

## Coherence

`bin/coherence.sh` measures the coherence of a real dataset (`nmbs-2016-12-1.ttl`)
and compares it with a mimicked dataset.

## Realism

`bin/evaluate.js` measures realism values.
This script accepts the following parameters `bus_BE`, `train_BE` or `train_NL`,
which respectively measures realism for the Belgian bus and railway company and the Dutch railway company.
`data/data.zip` must be inzipped before these measurements can be initiated.

## Data sources
All data sources from `data/data.zip` are created using the [Population density generator](https://github.com/PoDiGG/population-density-generator).

# License
The PoDiGG generator is written by [Ruben Taelman](http://rubensworks.net/).

This code is copyrighted by [Ghent University – imec](http://idlab.ugent.be/)
and released under the [MIT license](http://opensource.org/licenses/MIT).