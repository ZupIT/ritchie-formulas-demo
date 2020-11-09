const run = require("./coffee/coffee")

const NAME = process.env.RIT_NAME
const COFFEE_TYPE = process.env.RIT_COFFEE_TYPE
const DELIVERY = process.env.RIT_DELIVERY

run(NAME, COFFEE_TYPE, DELIVERY)
