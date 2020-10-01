# Ritchie Formula

## Commands

```bash
rit game roll dice
```

```bash
rit game roll dice --docker
```

```bash
echo '{"dice_size":"6", "loop":"yes", "quantity":"3"}' | rit game roll dice --stdin
```

```bash
echo '{"dice_size":"6", "loop":"no"}' | rit game roll dice --stdin --docker
```

## Description

A formula that rolls a dice and return a value according to the size set by the user.
It's also possible to realize more than one attempt and select how many attempts you want to perform.

## Execution sample

<img class="special-img-class" src="/game/roll/dice/docs/img/rit-game-roll-dice.png" />