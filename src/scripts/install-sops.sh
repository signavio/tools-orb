BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="sops"

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then
    mkdir -p "${BIN_PATH}"
    if [ "${TOOL_VERSION}" = "latest" ]; then
      TOOL_VERSION=$(curl -s https://api.github.com/repositories/40684033/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    fi
    SOPS_BINARY="sops-${TOOL_VERSION}.linux.amd64"
    curl -sL "https://github.com/mozilla/sops/releases/download/${TOOL_VERSION}/${SOPS_BINARY}" -o "${BIN_PATH}/${TOOL_NAME}"
    chmod +x "${BIN_PATH}/sops"
    "${BIN_PATH}/${TOOL_NAME}" --version
  else
    echo "${TOOL_NAME} already installed"
  fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Install
fi
