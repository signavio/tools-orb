BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="hadolint"

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then
    mkdir -p "${BIN_PATH}"
    curl -Ls "https://github.com/${TOOL_NAME}/${TOOL_NAME}/releases/download/v${TOOL_VERSION}/${TOOL_NAME}-$(uname -s)-$(uname -m)" -o "${BIN_PATH}/${TOOL_NAME}"
    chmod +x "${BIN_PATH}/${TOOL_NAME}"
    "${BIN_PATH}/${TOOL_NAME}" --version
  else
    echo "${TOOL_NAME} already installed"
  fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Install
fi
