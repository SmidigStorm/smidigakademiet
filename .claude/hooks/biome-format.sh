#!/bin/bash

# PostToolUse hook: auto-format files with Biome after Edit/Write
INPUT=$(cat)

FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path')

if [ -n "$FILE_PATH" ] && [ "$FILE_PATH" != "null" ]; then
  npx @biomejs/biome check --write "$FILE_PATH" 2>&1
fi

exit 0
