BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}

Install() {
  if ! [ -x "$(command -v hadolint)" ]; then
    mkdir -p "${BIN_PATH}"
    curl -Ls "https://github.com/hadolint/hadolint/releases/download/v${TOOL_VERSION}/hadolint-$(uname -s)-x86_64" -o "${BIN_PATH}/hadolint"
    chmod +x "${BIN_PATH}/hadolint"
    "${BIN_PATH}/hadolint" --version
  else
    echo "hadolint already installed"
  fi
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Install
fi
