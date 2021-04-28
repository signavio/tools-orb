BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="gh"

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then
    mkdir -p "${BIN_PATH}"
    GITHUB_BINARY="gh_${TOOL_VERSION}_linux_amd64"
    # to lower case
    GITHUB_BINARY=${GITHUB_BINARY,,}
    curl -sL "https://github.com/cli/cli/releases/download/v${TOOL_VERSION}/${GITHUB_BINARY}.tar.gz" -o "/tmp/${GITHUB_BINARY}.tar.gz"
    tar xzf "/tmp/${GITHUB_BINARY}.tar.gz" --strip-components=2 -C /tmp
    mv "/tmp/${TOOL_NAME}" "${BIN_PATH}/${TOOL_NAME}"
    "${BIN_PATH}/${TOOL_NAME}" --version
  else
    echo "${TOOL_NAME} already installed"
  fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Install
fi
