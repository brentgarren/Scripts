#!/bin/bash
# A simple script to to lookup all public information from public repositories.
# Author: Brent Garren
# Date: June 23, 2024


if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Syntax = who.sh <domain name> <scantype>"
    echo "Scantype: 
    full = returns complete scan results from all sources"
    exit 1
fi

if [ -z "$1" ]; then
    echo "Error: no url provided"
    echo "syntax = \"who.sh <url> <scantype>\""
    echo "For help use \"who.sh -h\" or \"who.sh --help\""
    exit 1
fi

if [ "$2" = "full" ]; then
    echo "Running full WHOIS lookup for site: $1"
    whois "$1"
    exit 1
fi

fields=(
    "Domain Name"
    "Registry Domain ID"
    "Registrar WHOIS Server"
    "Registrar URL"
    "Updated Date"
    "Creation Date"
    "Registry Expiry Date"
    "Registrar"
    "Registrar IANA ID"
    "Registrar Abuse Contact Email"
    "Registrar Abuse Contact Phone"
    "Domain Status"
    "Name Server"
    "DNSSEC"
    "DNSSEC DS Data"
    "URL of the ICANN Whois Inaccuracy Complaint Form"
    "Last update of whois database"
)
results=$(whois "$1")
for field in "${fields[@]}"
do 
    echo "$results" | grep -i -e " *$field:" | head -n 1
done
