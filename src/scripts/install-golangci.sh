#!/bin/bash

# shellcheck source="./src/scripts/common.sh"
source "./src/scripts/common.sh"

Install() {
  if ! [ -x "$(command -v golangci-lint)" ]; then
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh -o /tmp/install-golangci.sh
    chmod +x /tmp/install-golangci.sh
    /tmp/install-golangci.sh -b "${BIN_PATH}/bin" "v${TOOL_VERSION}" >&2
    "${BIN_PATH}/golangci-lint" version
  else
    echo "hadolint already installed"
  fi
}
