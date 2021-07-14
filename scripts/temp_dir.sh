#!/bin/bash
#
TEMP_FILE=~/testfile.$RANDOM

echo "this is a test" >> $TEMP_FILE

echo ""
cat $TEMP_FILE


