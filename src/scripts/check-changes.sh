#! /bin/bash

DIRECTORY=${DIRECTORY:-""}
if [ -n "$CI_PULL_REQUEST" ]; then
  export GH_PAGER=""
  # first check if command can execute
  gh pr view "$CI_PULL_REQUEST" --json files
  FOUND_FILES=$(gh pr view "$CI_PULL_REQUEST" --json files | jq -r ".files[] | select(.path | test(\"$DIRECTORY\")) | .path")
  if [ -n "$FOUND_FILES" ]; then
    echo "detected changes in $DIRECTORY $FOUND_FILES"
    export CHANGES_DETECTED=true
    if [ -n "$CI" ]; then
      # shellcheck disable=SC2086
      echo 'export CHANGES_DETECTED=true' >> $BASH_ENV
    fi
  else
    echo "did not detect changes in $DIRECTORY"
    if [ -n "$CI" ]; then
      # shellcheck disable=SC2086
      echo 'export CHANGES_DETECTED=false' >> $BASH_ENV
    fi
  fi
fi
