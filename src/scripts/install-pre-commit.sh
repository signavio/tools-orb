BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="pre-commit"
TOOL_VERSION=${TOOL_VERSION:-""}

InstallPreCommit() {
  INSTALL_SUFFIX="${TOOL_NAME}"
  if [ -n "${TOOL_VERSION}" ]; then
    INSTALL_SUFFIX="${TOOL_NAME}==${TOOL_VERSION}"
  fi
  echo "installing ${INSTALL_SUFFIX}"
  if [ -x "$(command -v pip)" ]; then
    pip install "${INSTALL_SUFFIX}"
  else
    python3 -m pip install "${INSTALL_SUFFIX}"
  fi
}

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then
    if [ -x "$(command -v python3)" ]; then
        InstallPreCommit
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
