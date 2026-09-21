# autoOBD

Author: Kengah Ireneaus

Repository: https://github.com/4kit1-glitch/autoOBD

A lightweight Linux setup script for installing and configuring OBS Studio with the DroidCam plugin and the v4l2loopback virtual camera module.

This project is intended to simplify the installation process on supported Linux distributions so you can use your phone or another camera source as a virtual webcam in OBS.

## Overview

The setup script automatically:

- checks for and installs Flatpak if needed
- installs OBS Studio
- installs the DroidCam OBS plugin
- installs the v4l2loopback package
- loads and configures the virtual camera module

This is useful for streamers, content creators, remote presenters, or anyone who wants to use a mobile device camera as a webcam inside OBS.

## Features

- Automatic detection of the Linux package manager
- Flatpak-based installation for OBS and DroidCam
- Support for common RPM and Debian-based distributions
- Virtual camera setup using v4l2loopback
- Simple one-command setup experience

## Requirements

Before running the script, make sure your system meets the following:

- Linux-based system with sudo access or root privileges
- Internet connection
- Flatpak support available or installable
- A supported package manager:
  - Ubuntu / Debian-based systems
  - Fedora / RHEL / Rocky / AlmaLinux / CentOS-based systems
- A kernel that supports v4l2loopback

## Supported Distributions

The script detects the OS and attempts to use the correct package manager:

- Debian / Ubuntu
- Fedora / RHEL / CentOS / Rocky / AlmaLinux

If your distribution is not recognized, the installer will stop with an unsupported package manager message.

## How to Run

1. Open a terminal in the project directory.
2. Make the script executable if needed:

```bash
chmod +x setup.sh
```

3. Run the installation script:

```bash
./setup.sh
```

You can also run it with bash explicitly:

```bash
bash ./setup.sh
```

If the script needs elevated permissions, it will prompt for sudo access or use root privileges when available.

## Example Output

Typical output may look like this:

```text
Setting up obs-studio and driodcam plugin
Flatpak present continue to install...
OBS is installed
Driod plugin installed
```

If the system already has the required components installed, you may see messages like:

```text
OBS is installed
Driod plugin installed
```

If something is unsupported or fails during setup, the script may print messages such as:

```text
Package manager: xyz not supported
failed to install obs
failed to install driodplugin
failed to install v4l2loopback
failed to setup loop back
```

## What the Script Does

The script performs the following actions in order:

1. Loads the shared library scripts from the lib directory.
2. Ensures Flatpak is installed.
3. Installs OBS Studio via Flatpak.
4. Installs the DroidCam OBS plugin via Flatpak.
5. Installs v4l2loopback using the detected system package manager.
6. Configures the loopback virtual camera module.

## Limitations

This project is a convenience installer, not a universal hardware abstraction layer. Please be aware of the following limitations:

- It is designed for Linux distributions with package manager support for either apt or dnf.
- It depends on Flatpak and may not work correctly in restricted or minimal environments.
- Root or sudo access is required for package and kernel module installation.
- v4l2loopback support depends on the host kernel and system configuration.
- Some kernels or desktop environments may block or limit virtual camera behavior.
- The script does not include a full uninstall or rollback mechanism.
- OBS and DroidCam behavior can vary by hardware, drivers, and OS configuration.
- It is intended as a setup helper, not a guarantee that every camera source will work in all workflows.

## Troubleshooting

If the installation fails, check the following:

- confirm your user has sudo privileges
- ensure Flatpak is available and your system has network access
- verify the detected Linux distribution is supported
- check whether the kernel module loads successfully
- review the terminal output for package manager or permission errors

If the virtual camera is not detected by OBS after installation, try restarting the system or reloading the module.

## Demo Video

Place your demo video here.

Example:

- Demo walkthrough: [Add video link here]
- Feature preview: [Add video link here]

## Screenshots

Place screenshots of the setup process and OBS virtual camera output here.

Example sections:

### Installation screen

![Installation screenshot placeholder](https://placehold.co/1200x700?text=Installation+Screenshot)

### OBS virtual camera setup

![OBS screenshot placeholder](https://placehold.co/1200x700?text=OBS+Virtual+Camera)

## License

This project is licensed under the Apache License, Version 2.0.

See the full license text at: https://www.apache.org/licenses/LICENSE-2.0

Copyright 2026 Kengah Ireneaus

## Contributing

Contributions are welcome. If you want to improve compatibility, add support for more distributions, or enhance the installation workflow, feel free to open a pull request.

If you are planning to contribute, please keep the project documentation clear and preserve the Apache 2.0 licensing terms.

## Project Status

This script is intended for straightforward local setup and automation on supported Linux environments. It is best suited for users who want a fast path to getting OBS and a DroidCam-style virtual camera working without manual package setup.
