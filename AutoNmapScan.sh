#!/bin/bash

# Constants
SCRIPT_NAME="NmapAutoScan.sh"
LOG_DIR="/var/log/NmapAutoScan"
LOG_FILE="${LOG_DIR}/$(date +%Y%m%d%H%M%S)_${SCRIPT_NAME}.log"

# Function to display error messages and exit
exit_with_error() {
    local message="$1"
    echo "Error: $message"
    exit 1
}

# Function to check if Nmap is installed
check_nmap() {
    command -v nmap &> /dev/null || exit_with_error "Nmap is not installed. Please install Nmap and try again."
}

# Function to check if the script is being run as root
check_root() {
    [ "$EUID" -eq 0 ] || exit_with_error "This script must be run as root."
}


prompt_target() {
    read -p "Enter the target IP address or range: " TARGET
}

# Function to validate the user input for the target
validate_target() {
    # Add validation logic here if needed
    true
}


perform_assessment() {
    local output_file="${LOG_DIR}/$(date +%Y%m%d%H%M%S)_vulnerability_scan.txt"
    mkdir -p "$LOG_DIR"

    echo "Starting vulnerability assessment..."
    echo "Target: $TARGET"
    echo "Output file: $output_file"

    # Perform Nmap scans and save results to the output file
    {
        echo "Performing Nmap scan to identify open ports..."
        nmap -sS -T4 -Pn "$TARGET" -oN "$output_file"

        echo "Performing service version scan on open ports..."
        nmap -sV -T4 -Pn -p "$(grep open "$output_file" | cut -d'/' -f1 | tr '\n' ',' | sed 's/,$//')" "$TARGET" -oN "$output_file"

        echo "Performing NSE script scan for common vulnerabilities..."
        nmap -sC -sV -T4 -Pn "$TARGET" -oN "$output_file"

        echo "Vulnerability assessment complete. Results saved to $output_file."
    } || {
        echo "An error occurred during vulnerability assessment."
        exit 1
    }
}

# Main function
main() {
    check_root
    check_nmap
    prompt_target
    validate_target || exit_with_error "Invalid target."
    perform_assessment
}

# Run the main function
main "$@" | tee "$LOG_FILE"
