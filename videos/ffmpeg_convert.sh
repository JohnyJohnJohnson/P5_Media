#!/usr/bin/env bash

convert_to_web_friendly() {
  local input_file="$1"
  local output_file="$2"

  # If the user didn't specify both input and output, provide usage info
  if [[ -z "$input_file" || -z "$output_file" ]]; then
    echo "Usage: convert_to_web_friendly <input_file> <output_file>"
    return 1
  fi

  # Run ffmpeg to convert the file
  ffmpeg -i "$input_file" \
    -c:v libx264 -crf 23 -preset medium \
    -c:a aac -b:a 128k \
    -movflags +faststart \
    "$output_file"
}