#!/usr/bin/python3
import os

from formula import formula

dice_size = os.environ.get("DICE_SIZE")
loop = os.environ.get("LOOP")
quantity = os.environ.get("QUANTITY")

formula.Run(dice_size, loop, quantity)
