#! /bin/bash

BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="faq"
ARCH=$(uname -m | sed 's/x86_64/amd64/')

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then
    mkdir -p "${BIN_PATH}"
    FAQ_BINARY="faq-$(uname -s)-${ARCH}"
    # to lower case
    FAQ_BINARY=${FAQ_BINARY,,}
    curl -sL -O "https://github.com/jzelinskie/faq/releases/download/${TOOL_VERSION}/${FAQ_BINARY}"
    chmod u+x,g+x "${FAQ_BINARY}"
    mv "${FAQ_BINARY}" "${BIN_PATH}/${TOOL_NAME}"
    "${BIN_PATH}/${TOOL_NAME}" --version
  else
    echo "${TOOL_NAME} already installed"
  fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Install
fi
