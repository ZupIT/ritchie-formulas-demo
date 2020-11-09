#!/usr/bin/python3
import os

from formula import formula

dice_size = os.environ.get("RIT_DICE_SIZE")
loop = os.environ.get("RIT_LOOP")
quantity = os.environ.get("RIT_QUANTITY")

formula.Run(dice_size, loop, quantity)
