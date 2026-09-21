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
export ERR_FAILURE=1
export ERR_SUCCESS=0

readonly lib_path="$SCRIPT_DIR/lib"

# source library scripts 
for script in "$lib_path"/*; do 
    source "$script"
done

main() {
    printf "Setting up obs-studio and driodcam plugin\n"

    install_flatpak || {
        printf "flatpak install failed\n" >&2
        return 1
    }

    install_obs || {
        printf "failed to install OBS studio\n" >&2
        printf "intall manually" >&2
        return 1
    }
    install_driod_plugin || {
        printf "failed to install driod plugin" >&2
        return 1
    }
    install_v2l4loopback && setup_loopback

}

main || {
    printf "Operation failed \n" >&2
    exit 1
}