BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}

Install() {
  if ! [ -x "$(command -v golangci-lint)" ]; then
    mkdir -p "${BIN_PATH}"
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh -o /tmp/install-golangci.sh
    chmod +x /tmp/install-golangci.sh
    /tmp/install-golangci.sh -b "${BIN_PATH}" "v${TOOL_VERSION}" >&2
    "${BIN_PATH}/golangci-lint" --version
  else
    echo "golangci-lint already installed"
  fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Install
fi
