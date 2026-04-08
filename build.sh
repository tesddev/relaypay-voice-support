#!/bin/bash
# Inject environment variables into index.html at build time
set -e

if [ -z "$VAPI_PUBLIC_KEY" ]; then
  echo "Error: VAPI_PUBLIC_KEY environment variable is not set"
  exit 1
fi

sed -i "s|%%VAPI_PUBLIC_KEY%%|$VAPI_PUBLIC_KEY|g" index.html
echo "Build complete: VAPI_PUBLIC_KEY injected."
