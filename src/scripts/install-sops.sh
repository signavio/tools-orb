BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="sops"

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then
    mkdir -p "${BIN_PATH}"
    if [ "${TOOL_VERSION}" = "latest" ]; then
      TOOL_VERSION="$(curl -s https://api.github.com/repos/mozilla/sops/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')"
    fi
    SOPS_BINARY="sops-v${TOOL_VERSION}.linux.amd64"
    curl -sL "https://github.com/cli/cli/releases/download/v${TOOL_VERSION}/${SOPS_BINARY}" -o "${BIN_PATH}/sops"
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
