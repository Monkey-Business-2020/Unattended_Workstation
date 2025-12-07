# Unattended Workstation Security Awareness Demo

A security awareness tool that demonstrates the risk of leaving workstations unlocked and unattended. When deployed with a USB HID attack device (Bash Bunny or Flipper Zero), it opens a full-screen browser page showing what an attacker could have done.

## Purpose

This is designed for **authorised security awareness training** and **penetration testing engagements**. It visually demonstrates to users that their unattended workstation was compromised, without causing any actual harm.

## Components

- **Web Page** - A professional security alert page that displays:
  - Captured hostname and username
  - Timestamp of the "compromise"
  - Educational content about the risks
  - Security best practices

- **Payloads** - HID attack scripts for:
  - Bash Bunny
  - Flipper Zero BadUSB

## Deployment

### Docker

```bash
docker-compose up -d --build
```

The web server runs on port 8085 by default (configurable in `docker-compose.yml`).

### Portainer

1. Push to a container registry or use Portainer's Git integration
2. Deploy as a stack using the `docker-compose.yml`

## Payloads

### Bash Bunny

Copy `payloads/bash-bunny/payload.txt` to a switch folder on your Bash Bunny (e.g., `/switch1/`).

### Flipper Zero

Copy `payloads/flipper-zero/UnattendedWorkstation.txt` to your Flipper's `SD Card/badusb/` folder.

### What the Payloads Do

1. Open the Windows Run dialog (Win+R)
2. Execute a hidden PowerShell command that:
   - Captures the hostname and username
   - URL-encodes the values
   - Opens the default browser to the demo URL with parameters
3. Wait for the page to load
4. Send F11 to enter fullscreen mode

### Tuning

If target machines are slow (heavy endpoint protection, etc.), increase the delay before F11 in the payload. The default is 2500ms.

## Configuration

Update the URL in the payload files to match your deployment:

```
https://your-domain.com
```

## URL Parameters

The page accepts these query parameters:

| Parameter | Description |
|-----------|-------------|
| `hostname` | Target computer name |
| `username` | Logged-in user |
| `timestamp` | Time of compromise |

Example:
```
https://your-domain.com?hostname=DESKTOP-ABC123&username=john.smith&timestamp=07/12/2025%2014:30:00
```

## Legal Notice

This tool is intended for **authorised security testing only**. Ensure you have proper authorisation before deploying against any systems. Unauthorised use may violate computer crime laws.

## License

For internal security awareness use.
