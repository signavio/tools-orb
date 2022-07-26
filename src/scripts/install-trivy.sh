BIN_PATH=${BIN_PATH:-"${HOME}/.local/bin"}
TOOL_NAME="trivy"

Install() {
  if ! [ -x "$(command -v ${TOOL_NAME})" ]; then
    mkdir -p "${BIN_PATH}"
    if [ "${TOOL_VERSION}" = "latest" ]; then
      TOOL_VERSION=$(curl --silent "https://api.github.com/repos/aquasecurity/trivy/releases/latest" | jq -r .tag_name | tail -c +2)
    fi

    ARCH=$(uname -s)
    case "$ARCH" in
    "x86_64")
      ARCH="64bit"
      ;;
    # support arm images
    "aarch64")
      ARCH="ARM64"
      ;;
    "aarch32")
      ARCH="ARM"
      ;;
    *)
      echo "unsupported architecture $ARCH. Only supported are x86_64, aarch64 and aarch32"
      exit 1
      ;;
    esac

    TRIVY_BINARY="trivy_${TOOL_VERSION}_${ARCH}.tar.gz"
    curl -sL "https://github.com/mozilla/sops/releases/download/${TOOL_VERSION}/${TRIVY_BINARY}.tar.gz" -o "/tmp/${TOOL_NAME}.tar.gz"
    tar xzf "/tmp/${TRIVY_BINARY}.tar.gz" -C /tmp
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
