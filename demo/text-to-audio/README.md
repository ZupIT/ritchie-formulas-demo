# Ritchie Formula

## Premisses

`Linux`: mpg321 installed using `apt-get install mpg321`

`MacOS` : None

`Windows` : None

## Command

```bash
rit demo text-to-audio
```

```bash
rit demo text-to-audio --docker
```

```bash
echo '{"text":"hello world", "language":"en", "filename":"hello"}' | rit demo text-to-audio --stdin
```

```bash
echo '{"text":"hello world", "language":"en", "filename":"hello"}' | rit demo text-to-audio --stdin --docker
```

## Description

This formula allows the user to convert a text in audio (mp3 format) using GTTS (Google Text-to-Speech) module.

It contains 3 inputs:
- the text to convert (an upgrade could be to get it from a file).
- the language to convert (currently en, fr and pt).
- the filename that will be created where the formula is executed.

## Sample execution

<video width="320" height="240" controls>
  <source src="/demo/text-to-audio/docs/video/rit-demo-text-to-audio.mp4" type="video/mp4">
</video>