const clc = require("cli-color")

function Run(numberOne, numberTwo) {
    console.log("Multiply two numbers")
    console.log(clc.red("The multiply of "+ numberOne +" * " + numberTwo + " is "))
    
    var total = parseInt(numberOne) * parseInt(numberTwo)

    console.log(clc.green("Total: "+ total))
}

const formula = Run
module.exports = formula
