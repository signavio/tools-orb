BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="yamllint"
TOOL_VERSION=${TOOL_VERSION:-""}

InstallYamlLint() {
  INSTALL_SUFFIX="${TOOL_NAME}"
  if [ -n "${TOOL_VERSION}" ]; then
    INSTALL_SUFFIX="${TOOL_NAME}==${TOOL_VERSION}"
  fi
  echo "installing ${INSTALL_SUFFIX}"
  if [ -n "${CIRCLECI}" ]; then
    sudo apt-get update
    sudo apt-get install python3-pip
  fi
  python3 -m pip install "${INSTALL_SUFFIX}"
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
