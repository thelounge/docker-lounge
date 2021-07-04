#!/bin/bash

ARGS=()
if [ "$1" = "thelounge" ]; then
  if [ -n "CONFIG_OPTIONS" ]; then
  	IFS='|' read -a input_args <<< "$CONFIG_OPTIONS"
  fi
  for arg in "${input_args[@]}"; do
  	ARGS+=("-c" "$arg")
  done
  set -- "$1" "${ARGS[@]}" "${@:2}"
fi

if [ "$1" = "thelounge" ] && [ "$(id -u)" = '0' ]; then
    find "${THELOUNGE_HOME}" \! -user node -exec chown node '{}' +
    exec su node -c "$*"
fi

exec "$@"