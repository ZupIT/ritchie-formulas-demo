#!/usr/bin/python3
import os

from formula import formula

text = os.environ.get("TEXT")
language = os.environ.get("LANGUAGE")
filename = os.environ.get("FILENAME")

formula.Run(text, language, filename)
