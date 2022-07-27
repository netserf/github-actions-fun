#!/bin/bash

# Simple script to reduce the number of workflows running in these demos. To
# test one of the given workflows, run the script with the name of the workflow
# file. The script will clean up the previous workflow and put the new one in
# the .github/workflows directory.

workflow="$1"

if [ -z "${workflow}" ]; then
  echo "Usage: $0 <github-actions-workflow-yaml>"
  exit 1
fi

if [ ! -f "$workflow" ]; then
    echo "Workflow file not found: $workflow"
    exit 1
fi

rm .github/workflows/*.yml
cp "$workflow" .github/workflows/

exit 0