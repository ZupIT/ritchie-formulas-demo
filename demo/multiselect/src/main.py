#!/usr/bin/python3
import os

from formula import formula

days = os.environ.get("RIT_DAYS")

formula.run(days)
