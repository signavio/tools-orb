#!/bin/bash

Install() {
  if ! [ -x "$(command -v hadolint)" ]; then
    curl -Ls "https://github.com/hadolint/hadolint/releases/download/v${TOOL_VERSION}/hadolint-$(uname -s)-x86_64" -o "${BIN_PATH}/hadolint"
    chmod +x "${BIN_PATH}/hadolint"
    "${BIN_PATH}/hadolint" --version
  else
    echo "hadolint already installed"
  fi
}

# shellcheck disable=SC1091
source "./src/scripts/common.sh"
