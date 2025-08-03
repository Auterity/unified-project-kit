#!/bin/bash

# Set project paths
SOURCE_A="../projectA"
SOURCE_B="../projectB"
DEST="./apps"

# Create destination dirs
mkdir -p $DEST/projectA
mkdir -p $DEST/projectB

# Copy projects
rsync -a --progress $SOURCE_A/ $DEST/projectA/
rsync -a --progress $SOURCE_B/ $DEST/projectB/

# Rename conflicting files
find $DEST/projectB -name "utils.ts" -exec mv {} {}.b.ts \;

# Notify user
echo "Merge complete. Conflicts may exist in: $(find $DEST -name '*.b.ts')"
