const clc = require("cli-color")

function Run(profiles, tools) {
    console.log(clc.blue("Profile: " + profiles))
    console.log(clc.green("Tools: "+ tools))
}

const formula = Run
module.exports = formula
