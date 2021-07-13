#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>Server Information"
echo "</title></head><body>"

echo "<h1>General system information for host $(hostname -s)</h1>"
echo ""

echo "<h2>Memory Info</h2>"
echo "<pre> $(free -m) </pre>"

echo "<h2>Disk Info:</h2>"
echo "<pre> $(df -h) </pre>"

echo "<h2>Logged in user</h2>"
echo "<pre> $(w) </pre>"

echo "<center>Information generated on $(date)</center>"
echo "</body></html>"


