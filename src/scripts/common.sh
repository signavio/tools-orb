#!/bin/bash

Validate() {
  if [ -z ${TOOL_VERSION+x} ]; then
    echo "required variable TOOL_VERSION not found."
    exit 1
  fi

  if [ -z ${BIN_PATH+x} ]; then
    echo "required variable BIN_PATH not found."
    exit 1
  fi
  mkdir -p "${BIN_PATH}"
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Validate
    Install
fi
