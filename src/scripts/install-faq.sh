#! /bin/bash

BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="faq"
ARCH=$(uname -m)

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then
    mkdir -p "${BIN_PATH}"
    FAQ_BINARY="faq_$(uname -s)_amd64"
    # to lower case
    FAQ_BINARY=${FAQ_BINARY,,}
    curl -sL -O "https://github.com/jzelinskie/faq/releases/download/${TOOL_VERSION}/${FAQ_BINARY}-$(uname -s)-${ARCH//x86_64/amd64}"
    tar xzf "/tmp/${FAQ_BINARY}.tar.gz"
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
