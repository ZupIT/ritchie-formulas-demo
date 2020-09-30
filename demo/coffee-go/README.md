# coffee-go

## Premisses

- [Golang installed](https://golang.org/doc/install)

## Command

- Prompt
```bash
rit demo coffee-go
```


- Docker

```bash
rit demo coffee-go --docker
```

- Stdin

```bash
echo '{"name":"Luis", "coffee_type":"cappuccino", "delivery":"true"}' | rit demo coffee-go --stdin
```

- Stdin + Docker

```bash
echo '{"name":"Luis", "coffee_type":"cappuccino", "delivery":"true"}' | rit demo coffee-go --stdin --docker
```

## Description

This is formula receive 3 inputs:

- customer name,

- coffee type,

- delivery

and builds a coffee.

## Demo
![Demo](https://res.cloudinary.com/dvlvsv5v0/image/upload/v1601494070/ritGood_pk9rml.gif)