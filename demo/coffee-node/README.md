# coffee-node

## Premisses

- [Node.js installed](https://nodejs.org/)

## Command

- Prompt

```bash
rit demo coffee-node
```

- Docker

```bash
rit demo coffee-node --docker
```

- Stdin

```bash
echo '{"name":"Rafael", "coffee_type":"latte", "delivery":"false"}' | rit demo coffee-node --stdin
```

- Stdin + Docker

```bash
echo '{"name":"Rafael", "coffee_type":"latte", "delivery":"false"}' | rit demo coffee-node --stdin --docker
```

## Description

This is formula receive 3 inputs:

- customer name,

- coffee type,

- delivery

and builds a coffee.

## Demo

![Demo](https://media3.giphy.com/media/0lsjBVeZPH3JI8jysb/giphy.gif)
