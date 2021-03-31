BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="pre-commit"
TOOL_VERSION=${TOOL_VERSION:-""}

InstallPip() {
  python3 -m pip list -q
  exitCode=$?
  if [ $exitCode -ne 0 ]; then
      echo "Need to install pip"
      curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
      sudo python3 /tmp/get-pip.py
  else
    echo "pip already installed"
  fi

}

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then
    if [ -x "$(command -v python3)" ]; then
      InstallPip
      if [ -z "${TOOL_VERSION}" ]; then
        python3 -m pip install ${TOOL_NAME}
      else
        python3 -m pip install "${TOOL_NAME}==${TOOL_VERSION}"
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
