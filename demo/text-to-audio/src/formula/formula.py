#!/usr/bin/python3
from gtts import gTTS 
import os 
import platform

def Run(text, language, filename):
    gtts = gTTS(text=text, lang=language, slow=False) 

    # Create the audio file in mp3 format
    filename = filename + ".mp3"
    gtts.save(filename) 
    print("Audio Saved with name", filename)

    # Play your audio file according to OS

    system = platform.system()

    if "Darwin" in system:
        cmd = "afplay " + filename

    elif "Linux" in system:
        cmd = "mpg321 " + filename

    elif "Windows" in system:
        cmd = filename

    print("Playing audio saved with name", filename)
    os.system(cmd) 