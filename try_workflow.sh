#!/bin/bash

# Simple script to reduce the number of workflows running in these demos. To
# test one of the given workflows, run the script with the name of the workflow
# file. The script will clean up the previous workflow and put the new one in
# the .github/workflows directory.

workflow="$1"
workflow_dir=".github/workflows"

if [ -z "${workflow}" ]; then
  echo "Usage: $0 <github-actions-workflow-yaml>"
  exit 1
fi

if [ ! -f "$workflow" ]; then
    echo "Workflow file not found: $workflow"
    exit 1
fi

count=`ls -1 $workflow_dir/*.yml 2>/dev/null | wc -l`
if [ $count != 0 ]; then
  echo "Removing previous workflows..."
  rm $workflow_dir/*.yml
fi 


echo "Copying new workflow to $workflow_dir ..."
cp "$workflow" $workflow_dir/

exit 0