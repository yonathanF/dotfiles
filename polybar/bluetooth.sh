#!/usr/bin/env bash

status=`bluetoothctl info 74:5C:4B:D3:AE:CA | grep Connected | awk {'print $2'}`

if [ "$status" == 'yes' ]; then
  echo ""
  exit 0;
fi
echo ""
