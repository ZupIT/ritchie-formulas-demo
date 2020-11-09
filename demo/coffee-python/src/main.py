#!/usr/bin/python3
import os

from coffee import coffee

name = os.environ.get("RIT_NAME")
type = os.environ.get("RIT_COFFEE_TYPE")
delivery = os.environ.get("RIT_DELIVERY")
coffee.Run(name, type, delivery)
