#!/bin/bash
run() {
  echo "Preparing your coffee $RIT_NAME ....."
  sleep 1
  echo "......"
  sleep 1
  echo "......"
  sleep 1
  echo "......"
  sleep 1
  if [ "$RIT_DELIVERY" = true ]; then
    echo "Your $RIT_COFFEE_TYPE coffee is ready, enjoy your trip"
  else
    echo "Your $RIT_COFFEE_TYPE coffee is ready, have a seat and enjoy your drink"
  fi
}
