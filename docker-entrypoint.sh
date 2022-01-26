#!/bin/bash
set -euo pipefail

arguments() {
    local IFS=$'\n'
    echo "$*"
}

arguments "$@" | exec reflex -c -