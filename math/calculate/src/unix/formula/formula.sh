#!/bin/sh

runFormula() {
  echo "Number operations!"

  if [ "$OPERATION" = "multiply" ]
  then
    echo '{ "number_one": "'$NUMBER_ONE'", "number_two": "'$NUMBER_TWO'", "operation": "'$OPERATION'" }' | rit math multiply numbers --stdin
  else
    echo '{ "number_one": "'$NUMBER_ONE'", "number_two": "'$NUMBER_TWO'", "operation": "'$OPERATION'" }' | rit math sum numbers --stdin
  fi
}
