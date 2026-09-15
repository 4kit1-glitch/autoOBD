#!/usr/bin/env bash
# shellcheck source=/dev/null
# shellcheck disable=2155
# 
# obs -studio and driodcam installer script
# uses flatpak
#

set -euo pipefail

export DATE="$(date +%Y_%m_%d)"
export SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)

