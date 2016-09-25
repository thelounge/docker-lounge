#!/bin/bash

if [[ -d /home/lounge/src ]]; then
    # pre 2.0.0 we ran The Lounge from /home/lounge/src/index.js.
    # This enabled users to mount a volume in that location, effectively
    # running a completely different installation of The Lounge, while keeping
    # the same container environment.
    >&2 printf "%s\n\n" "The Lounge is now installed through a global npm installation. Ignoring contents in /home/lounge/src!"
fi

[[ -n $HOST ]] && CONF_OPT_HOST="--host $HOST"
[[ -n $PORT ]] && CONF_OPT_PORT="--port $PORT"
[[ -n $BIND ]] && CONF_OPT_BIND="--bind $BIND"

lounge \
    $CONF_OPT_HOST \
    $CONF_OPT_PORT \
    $CONF_OPT_BIND \
    ;
