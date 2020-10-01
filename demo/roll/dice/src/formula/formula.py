#!/usr/bin/python3

import random 

def Run():
    while True:
        dice_side = random.randrange(1, 7)
        print("You got",dice_side)
        yes_or_no=input("Do you want to continue ? (y/n) ")
        if yes_or_no == 'n':
            print("Over !")
            break
