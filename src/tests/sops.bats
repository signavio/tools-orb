TOOL_NAME="sops"
TOOL_VERSION="v3.7.3"
BIN_PATH="/tmp/bin"

setup() {
    source ./src/scripts/install-${TOOL_NAME}.sh
}

@test "2: Test ${TOOL_NAME} Install' {
    run Install
    echo $lines
    [[ "$lines" =~ "${TOOL_VERSION}" ]]
    run ${BIN_PATH}/${TOOL_NAME} --version
    echo $lines
    [ $status = 0 ]
}
