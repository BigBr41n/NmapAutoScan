# NmapAutoScan

NmapAutoScan is a comprehensive and automated vulnerability assessment tool written in Bash. It utilizes Nmap to perform thorough scans on target networks, identifying open ports, service versions, and common vulnerabilities using NSE scripts.

## Features

- **Automated network scanning using Nmap**
- **Service version detection**
- **Common vulnerability scanning with NSE scripts**
- **Detailed logging and output management**
- **User-friendly prompts and error handling**

## Prerequisites

- **Nmap:** Ensure Nmap is installed on your system. You can install it using your package manager:
  - On Debian/Ubuntu: `sudo apt-get install nmap`
  - On CentOS/RHEL: `sudo yum install nmap`
  - On macOS: `brew install nmap`

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/BigBr41n/NmapAutoScan.git
   cd NmapAutoScan
   ```

2. **Make the script executable:**

   ```bash
   chmod +x NmapAutoScan.sh
   ```

## Usage

1. **Run the script with root privileges:**

   ```bash
   sudo ./NmapAutoScan.sh
   ```

2. **Enter the target IP address or range when prompted:**

   ```plaintext
   Enter the target IP address or range: 192.168.1.0/24
   ```

3. **The script will perform the following steps:**

   - Identify open ports using Nmap.
   - Perform service version detection on identified open ports.
   - Scan for common vulnerabilities using Nmap's NSE scripts.

4. **The results will be saved in the log directory: `/var/log/NmapAutoScan/`**

## Output

- The results of the scan will be saved to a timestamped log file in `/var/log/NmapAutoScan/`.
- The log file includes details of the open ports, service versions, and any detected vulnerabilities.

## Example

```bash
$ sudo ./NmapAutoScan.sh
Enter the target IP address or range: 192.168.1.0/24
Starting vulnerability assessment...
Target: 192.168.1.0/24
Output file: /var/log/NmapAutoScan/20230526143015_NmapAutoScan.txt
Performing Nmap scan to identify open ports...
Performing service version scan on open ports...
Performing NSE script scan for common vulnerabilities...
Vulnerability assessment complete. Results saved to /var/log/NmapAutoScan/20230526143015_NmapAutoScan.txt.
```
