BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="yq"

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then
    mkdir -p "${BIN_PATH}"
    YQ_BINARY="yq_$(uname -s)_amd64"
    # to lower case
    YQ_BINARY=${YQ_BINARY,,}
    curl -sL "https://github.com/mikefarah/yq/releases/download/v${TOOL_VERSION}/${YQ_BINARY}.tar.gz" -o "/tmp/${YQ_BINARY}.tar.gz"
    tar xzf "/tmp/${YQ_BINARY}.tar.gz"
    mv "${YQ_BINARY}" "${BIN_PATH}/${TOOL_NAME}"
    "${BIN_PATH}/${TOOL_NAME}" --version
  else
    echo "${TOOL_NAME} already installed"
  fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Install
fi
