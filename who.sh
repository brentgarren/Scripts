#!/bin/bash
# A simple script to to lookup all public information using the whois command and only returning the fields
# Author: Brent Garren
# Date: June 23, 2024


if [ -z "$1" ]; then
    echo "Error: no site provided"
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
