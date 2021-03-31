BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="pre-commit"
TOOL_VERSION=${TOOL_VERSION:-""}

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then
    if [ -x "$(command -v python3)" ]; then
      if [ -z "${TOOL_VERSION}" ]; then
        python3 -m pip3 install ${TOOL_NAME}
      else
        python3 -m pip3 install "${TOOL_NAME}==${TOOL_VERSION}"
      fi
    else
      echo "python3 not available"
      exit 1
    fi
  else
    echo "${TOOL_NAME} already installed"
  fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Install
fi
