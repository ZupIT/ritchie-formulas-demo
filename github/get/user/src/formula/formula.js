const clc = require("cli-color")

function Run(gitUser, gitEmail, gitToken) {
    console.log("Credential Github")
    console.log(clc.blue("User: " + gitUser))
    console.log(clc.blue("Email: " + gitEmail))
    console.log(clc.blue("Token: " + gitToken))
}

const formula = Run
module.exports = formula
