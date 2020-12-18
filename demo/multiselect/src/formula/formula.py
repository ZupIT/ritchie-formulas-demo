#!/usr/bin/python3

def run(days):
    
    days_list = days.split("|")
    
    for day in days_list:
        
        if (day == "Monday"):
            print("\nMonday is like this Youtube Ad you can't skip.\n")
        
        elif (day == "Tuesday"):
            print("\nTuesday (unfortunately) smells like Monday.\n")
        
        elif (day == "Wednesday"):
            print("\nNothing ruins your Friday like finding out it's only Wednesday!\n")
        
        elif (day == "Thursday"):
            print("\nThursday... or as i like to call it... 'Day four of the hostage situation'.\n")
        
        elif (day == "Friday"):
            print("\nFriday is my second favorite word (my first is food).\n")
        
        elif (day == "Saturday"):
            print("\nSaturday is like big shirt, messy hair, music and coffee!\n")
        
        elif (day == "Sunday"):
            print("\nSunday is the moment when you feel the anxiety of Monday kicking in.\n")
        
        else:
            print("The day you informed doesn't even exist in the calendar!")