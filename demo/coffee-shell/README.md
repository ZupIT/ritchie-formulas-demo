# Ritchie Formula Coffee Shell

## Premisses

- UNIX like environment, [on Windows 10 is also possible](https://docs.microsoft.com/en-us/windows/wsl/install-win10l) (to run locally)
- [Docker installed](https://docs.docker.com/get-docker/) (to run on Docker)

## Command

- Prompt

```bash
rit demo coffee-shell
```

- Docker

```bash
rit demo coffee-shell --docker
```

- Stdin

```bash
echo '{"name":"Rodolpho", "coffee_type":"macchiato", "delivery":"true"}' | rit demo coffee-shell --stdin
```

- Stdin + Docker

```bash
echo '{"name":"Rodolpho", "coffee_type":"macchiato", "delivery":"true"}' | rit demo coffee-shell --stdin --docker
```

## description

This is formula receive 3 inputs:

- customer name,

- coffee type,

- delivery

and builds a coffee.

This Coffee Java command has been implemented for new user to discover Ritchie and build a coffee.

It allows the user to inform 3 different kinds of inputs:

- a text (customer name)

- a list (coffee type)

- and a boolean (delivery)

## Demo

![Demo](https://media4.giphy.com/media/xhybn429F1ekKihWJx/giphy.gif)
