#!/usr/bin/env node
const yargs = require('yargs/yargs')
const { hideBin } = require('yargs/helpers')
const argv = yargs(hideBin(process.argv)).argv

if (argv.ships > 3 && argv.distance < 53.5) {
  console.log('Run to the deck!')
  console.log('Bring the dawn to the future!')
} else {
  console.log('Oh no, I dropped my devil fruits!')
}
