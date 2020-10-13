# Ritchie Formula Coffee Java

## Premisses

- [Java 8 installed](https://docs.oracle.com/javase/8/docs/technotes/guides/install/install_overview.html) (to run locally)
- [Docker installed](https://docs.docker.com/get-docker/) (to run on Docker)

## Command

- Prompt

```bash
rit demo coffee-java
```

- Docker

```bash
rit demo coffee-java --docker
```

- Stdin

```bash
echo '{"name":"Dennis", "coffee_type":"espresso", "delivery":"true"}' | rit demo coffee-java --stdin
```

- Stdin + Docker

```bash
echo '{"name":"Dennis", "coffee_type":"espresso", "delivery":"true"}' | rit demo coffee-java --stdin --docker
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

![Alt Text](https://media.giphy.com/media/SvQmCvfNnkeaKWRU05/giphy.gif)
