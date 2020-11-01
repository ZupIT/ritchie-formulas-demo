const run = require("./formula/formula")

const GIT_USER = process.env.GIT_USER
const GIT_EMAIL = process.env.GIT_EMAIL
const GIT_TOKEN = process.env.GIT_TOKEN

run(GIT_USER, GIT_EMAIL, GIT_TOKEN)
