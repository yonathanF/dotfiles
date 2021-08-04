#!/usr/bin/env bash

status=`mullvad status | awk {'print $3'}`

if [ "$status" == 'Disconnected' ]; then
  echo ""
  exit 0;
fi
echo ""
