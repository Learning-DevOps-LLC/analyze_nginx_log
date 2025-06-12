#!/bin/bash

# Ask if user wants to download the sample log
read -p "Do you want to download the sample nginx access log from Kamran Ahmed's Gist? (y/n): " DOWNLOAD

if [[ "$DOWNLOAD" == "y" || "$DOWNLOAD" == "Y" ]]; then
    URL="https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log"
    TEMPFILE="nginx-access.log"
    echo "Downloading log file..."
    curl -s -o "$TEMPFILE" "$URL"
    LOGFILE="$TEMPFILE"
else
    read -p "Enter the path to the nginx access log file: " LOGFILE
fi

# Check if file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File not found at '$LOGFILE'"
    exit 1
fi

echo ""
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'

echo ""
echo "Top 5 most requested paths:"
awk '{print $7}' "$LOGFILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'

echo ""
echo "Top 5 response status codes:"
awk '{print $9}' "$LOGFILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'

echo ""
echo "Top 5 user agents:"
awk -F\" '{print $6}' "$LOGFILE" | sort | uniq -c | sort -nr | head -5 | awk '{sub(/^[ \t]+/, "", $0); print $2 " - " $1 " requests"}'
