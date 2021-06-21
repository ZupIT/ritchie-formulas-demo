package main

import (
	"coffee/pkg/coffee"
	"os"
	"strconv"
)

func main() {
	coffee.GiveMeSomeCoffee(loadInputs())
}

func loadInputs() coffee.Inputs {
	delivery, _ := strconv.ParseBool(os.Getenv("RIT_DELIVERY"))
	name := os.Getenv("RIT_NAME")
	coffeeType := os.Getenv("RIT_COFFEE_TYPE")
	return coffee.Inputs{
		Name:       name,
		CoffeeType: coffeeType,
		Delivery:   delivery,
	}
}
