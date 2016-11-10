'use strict';

const Evaluator = require('podigg').Evaluator;

var actions = {
  'train_BE': () => {
    new Evaluator(
      'data/train_BE/region_cells.csv',
      'data/train_BE/region_edges.csv',
      {
        'stops:stops': 583,
        'routes:routes': 4356,
        'connections:connections': 30011
      }).evaluateAll();
  },
  'bus_BE': () => {
    new Evaluator(
      'data/bus_BE/region_cells.csv',
      'data/bus_BE/region_edges.csv',
      {
        'stops:stops': 18112
      }).evaluateAll();
  },
};

if (process.argv.length < 3) {
  throw new Error('Please provide a parameter to generate one of ' + JSON.stringify(Object.keys(actions)));
}
var type = process.argv[2];
var action = actions[type];
if (!action) {
  throw new Error('Action ' + type + ' could not be found in ' + JSON.stringify(Object.keys(actions)));
}
action();