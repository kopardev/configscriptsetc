#!/bin/bash

# File containing the list of extensions
PLUGIN_FILE="vscode_extensions.txt"

# Check if the plugin file exists
if [[ ! -f $PLUGIN_FILE ]]; then
  echo "Plugin file not found: $PLUGIN_FILE"
  exit 1
fi

# Read each line in the file and install the extension
while IFS= read -r extension || [[ -n "$extension" ]]; do
  if [[ ! -z "$extension" ]]; then
    echo "Installing $extension..."
    code --install-extension "$extension"
  fi
done < "$PLUGIN_FILE"

echo "All extensions installed."

