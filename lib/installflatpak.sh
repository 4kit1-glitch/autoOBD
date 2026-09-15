#!/usr/bin/env bash
# 
#

readonly RELEASE_FILE="/etc/os-release"
declare -a managers=("dnf" "apt")


get_from_command_check() {
    for pkg in "${managers[@]}"; do
        command -v "$pkg" > /dev/null 2>&1 && {
            printf "%s" "$pkg"
            return 0
        }
    done
    printf "pakage manager not found exiting..." >&2
    exit 2
}

get_id() {
    [[ -f "$RELEASE_FILE" && -r "$RELEASE_FILE" ]] || {
        echo "failed to read $RELEASE_FILE"
        return 2
    }
    printf "%s" "$(awk -F"=" '/^ID/{print $2}' < $RELEASE_FILE 2> /dev/null)"  # read id from os-release
}

get_from_release() {
    case $(get_id) in
        fedora|rhel|centos|rocky|almalinux)
            printf "%s" "${managers[0]}"
        ;;
        debian|ubuntu)
            printf "%s" "${managers[1]}"
        ;;
        *)
            get_from_command_check || {
                printf "failed to get pakage manager" >&2
                exit 1
            }
        ;;
    esac
}

get_package_manager() {
    get_from_release
}