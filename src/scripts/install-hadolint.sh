#!/bin/bash

# shellcheck source=./src/scripts/common.sh
source ./src/scripts/common.sh

Install() {
  if ! [ -x "$(command -v hadolint)" ]; then
    curl -Ls "https://github.com/hadolint/hadolint/releases/download/v${TOOL_VERSION}/hadolint-$(uname -s)-x86_64" -o "${BIN_PATH}/hadolint"
    chmod +x "${BIN_PATH}/hadolint"
    "${BIN_PATH}/hadolint" --version
  else
    echo "hadolint already installed"
  fi
}
