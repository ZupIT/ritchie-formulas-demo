#!/usr/bin/python3

import random 

def Run(dice_size, loop, quantity):
    if dice_size == "0":
        print("Good try ! But 0 is the only number not allowed here.")
    elif loop == "no":
        dice_side = random.randrange(1, int(dice_size) +1)
        print("You got", dice_side)
    else:
        attempts = 0
        while True:
            dice_side = random.randrange(1, int(dice_size) +1)
            attempts = attempts+1
            print("(" + str(attempts) + ") You got " + str(dice_side))
            if attempts == int(quantity):
                break
