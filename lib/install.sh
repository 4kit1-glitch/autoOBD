#!/usr/bin/env bash
#
# script does install of obs and driodcap and sets up v4l2loopback
#


obs_exists() {
    if flatpak info com.obsproject.Studio > /dev/null 2>&1; then
        return 0
    fi
    return 2
}

driod_plugin_exist() {
    if flatpak info com.obsproject.Studio.Plugin.DroidCam > /dev/null 2>&1; then
        return 0
    fi
    return 2
}

install_obs() {
    obs_exists && {
        printf "OBS is installed \n"
        return 0
    }
    flatpak install flathub com.obsproject.Studio || {
        printf "failed to install obs\n" >&2
        return 1
    }
}

install_driod_plugin() {
    driod_plugin_exist && {
        printf "Driod plugin installed\n"
        return 0
    }

    flatpak install flathub com.obsproject.Studio.Plugin.DroidCam || {
        printf "failed to install driodplugin\n" >&2
        return 1
    }
}

install_v2l4loopback() {
    local pkg_man
    pkg_man="$(get_package_manager)"

    case "$pkg_man" in
        "dnf")
            run_privileged dnf install v4l2loopback
            ;;
        "apt") 
            run_privileged install -y v4l2loopback-dkms || {
                    printf "failed to install v4l2loopback\n" >&2 
                    printf "driodcam may break" >&2
                    return 1
                }
            ;;
        *) echo "Package manager: $pkg_man not supported" >&2
            return 1
            ;;
    esac
}

setup_loopback() {
    run_privileged echo -n "options v4l2loopback exclusive_caps=1 card_label="Virtual Camera" devices=1" > "/etc/modprobe.d/v4l2loopback.conf" || {
        printf "failed to automatically setup loop back\n" >&2
        printf "run the following commands\n" >&2

        printf "%s\n" "\
            sudo nano /etc/modprobe.d/v4l2loopback.conf
            in the nano editor paste this
            options v4l2loopback exclusive_caps=1 card_label=\"Virtual Camera\"
            
            then refresh loopback with 
            sudo modprobe -r v4l2loopback && sudo modprobe v4l2loopback" 
    }

    run_privileged modprobe -r v4l2loopback && run_privileged modprobe v4l2loopback
}