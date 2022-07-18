BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="sops"
TOOL_VERSION=${TOOL_VERSION:-"3.7.3"}

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then
    mkdir -p "${BIN_PATH}"
    curl -sL https://github.com/mozilla/sops/releases/download/v${TOOL_VERSION}/${TOOL_NAME}-v${TOOL_VERSION}.linux.amd64 -o "${BIN_PATH}/${TOOL_NAME}"
    chmod 755 "${BIN_PATH}/${TOOL_NAME}"
  else
    echo "${TOOL_NAME} already installed"
  fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Install
fi
