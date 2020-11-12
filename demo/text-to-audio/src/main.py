#!/usr/bin/python3
import os

from formula import formula

text = os.environ.get("RIT_TEXT")
language = os.environ.get("RIT_LANGUAGE")
filename = os.environ.get("RIT_FILENAME")

formula.Run(text, language, filename)
