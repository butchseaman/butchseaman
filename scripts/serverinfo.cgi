#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>Server Information"
echo "</title></head><body>"

echo "<h2>General system information for host $(hostname -s)</h2>"
echo ""

echo "<h1>Memory Info</h1>"
echo "<pre> $(free -m) </pre>"

echo "<h1>Disk Info:</h1>"
echo "<pre> $(df -h) </pre>"

echo "<h1>Logged in user</h1>"
echo "<pre> $(w) </pre>"

echo "<center>Information generated on $(date)</center>"
echo "</body></html>"


