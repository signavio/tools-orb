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

Install() {
  if ! [ -x "$(command -v hadolint)" ]; then
    curl -Ls "https://github.com/hadolint/hadolint/releases/download/v${TOOL_VERSION}/hadolint-$(uname -s)-x86_64" -o "${BIN_PATH}/hadolint"
    chmod +x "${BIN_PATH}/hadolint"
    "${BIN_PATH}/hadolint" --version
  else
    echo "hadolint already installed"
  fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Validate
    Install
fi



