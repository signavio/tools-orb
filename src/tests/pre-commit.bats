TOOL_NAME="pre-commit"
TOOL_VERSION="2.7.1"
BIN_PATH="/tmp/bin"

setup() {
    source ./src/scripts/install-${TOOL_NAME}.sh
}

@test "3: Test ${TOOL_NAME} Install' {
    run Install
    echo $lines
    [ $status = 0 ]
    run ${TOOL_NAME} --version
    echo $lines
    [ $status = 0 ]
    [[ "$lines" =~ "${TOOL_VERSION}" ]]
}
