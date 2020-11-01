const run = require("./formula/formula")

const PROFILES = process.env.PROFILES
const TOOLS = process.env.BACKEND || process.env.FRONTEND || process.env.FULLSTACK || process.env.DEVOPS

run(PROFILES, TOOLS)
