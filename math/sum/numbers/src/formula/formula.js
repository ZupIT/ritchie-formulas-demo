const clc = require("cli-color")

function Run(numberOne, numberTwo) {
    console.log("Adds two numbers")
    console.log(clc.red("The sum of "+ numberOne +" + " + numberTwo + " is "))
    
    var total = parseInt(numberOne) + parseInt(numberTwo)

    console.log(clc.green("Total: "+ total))
}

const formula = Run
module.exports = formula
